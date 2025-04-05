<?php
// $headers = getallheaders();
// echo json_encode([
//     'headers' => $headers,
//     'server' => $_SERVER,
//     'env' => getenv('HTTP_AUTHORIZATION')
// ]);
// exit;

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

if (!file_exists('/home/sites/site100036969/web/flutter/assets/.env')) {
    die(json_encode(["error" => "Die .env-Datei konnte nicht gefunden werden."]));
}

$env = parse_ini_file('/home/sites/site100036969/web/flutter/assets/.env');

if (!$env) {
    die(json_encode(["error" => "Fehler beim Laden der .env-Datei"]));
}

$servername = $env['ORDER_DB_HOST'];
$usernameDB = $env['ORDER_DB_USER'];
$passwordDB = $env['ORDER_DB_PASSWORD'];
$dbname = $env['ORDER_DB_NAME'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $pdo = new PDO(
            "mysql:host=$servername;dbname=$dbname;charset=utf8mb4;unix_socket=/var/run/mysqld/mysqld.sock",
            $usernameDB,
            $passwordDB,
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
        );
    } catch (Exception $e) {
        error_log("Datenbankverbindungsfehler: " . $e->getMessage());
        echo json_encode(["error" => "Datenbankverbindung fehlgeschlagen: " . $e->getMessage()]);
        http_response_code(500);
        exit;
    }

    $data = json_decode(file_get_contents("php://input"), true);
    if (json_last_error() !== JSON_ERROR_NONE) {
        echo json_encode(["error" => "Ungültiges JSON: " . json_last_error_msg()]);
        http_response_code(400);
        exit;
    }

    $requiredFields = ['filiale', 'customer_name', 'items', 'total_price'];
    $missingFields = [];
    foreach ($requiredFields as $field) {
        if (!isset($data[$field]) || empty($data[$field])) {
            $missingFields[] = $field;
        }
    }

    if (!empty($missingFields)) {
        echo json_encode(["error" => "Fehlende Parameter: " . implode(", ", $missingFields)]);
        http_response_code(400);
        exit;
    }

    $stmt = $pdo->prepare("INSERT INTO orders (filiale, customer_name, items, total_price, notes) VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([
        $data['filiale'],
        $data['customer_name'],
        json_encode($data['items']),
        $data['total_price'],
        $data['notes'] ?? null
    ]);
    echo json_encode(["success" => true, "id" => $pdo->lastInsertId()]);
    exit;
}

$headers = function_exists('apache_request_headers') ? apache_request_headers() : getallheaders();
if (isset($headers['Authorization'])) {
    $token = str_replace('Bearer ', '', $headers['Authorization']);
} elseif (isset($_SERVER['HTTP_AUTHORIZATION'])) {
    $token = str_replace('Bearer ', '', $_SERVER['HTTP_AUTHORIZATION']);
} elseif (getenv('HTTP_AUTHORIZATION')) {
    $token = str_replace('Bearer ', '', getenv('HTTP_AUTHORIZATION'));
} else {
    echo json_encode(["error" => "Token fehlt", "debug" => $headers]);
    http_response_code(401);
    exit;
}

try {
    $pdo = new PDO(
        "mysql:host=$servername;dbname=$dbname;charset=utf8mb4;unix_socket=/var/run/mysqld/mysqld.sock",
        $usernameDB,
        $passwordDB,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    $stmt = $pdo->prepare("SELECT user_id FROM user_tokens WHERE token = ?");
    $stmt->execute([$token]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        echo json_encode(["error" => "Ungültiges Token"]);
        http_response_code(401);
        exit;
    }

    $stmt = $pdo->prepare("SELECT filiale FROM logins WHERE id = ?");
    $stmt->execute([$user['user_id']]);
    $userDetails = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$userDetails) {
        echo json_encode(["error" => "Benutzer nicht gefunden"]);
        http_response_code(401);
        exit;
    }

    $filiale = $userDetails['filiale'];

    $method = $_SERVER['REQUEST_METHOD'];

    if ($_SERVER['REQUEST_METHOD'] === 'GET') {
        // Decode URL-encoded JSON parameters
        if (isset($_GET['items'])) {
            $decodedItems = json_decode(urldecode($_GET['items']), true);
            if (json_last_error() !== JSON_ERROR_NONE) {
                echo json_encode(["error" => "Ungültiges JSON in 'items': " . json_last_error_msg()]);
                http_response_code(400);
                exit;
            }
            $_GET['items'] = $decodedItems;
        }
    }

    switch ($method) {
        case 'GET':
            if ($filiale === 'admin') {
                $stmt = $pdo->query("SELECT * FROM orders ORDER BY created_at DESC");
            } else {
                $stmt = $pdo->prepare("SELECT * FROM orders WHERE filiale = ? ORDER BY created_at DESC");
                $stmt->execute([$filiale]);
            }
            $orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode(["success" => true, "data" => $orders]);
            break;

        case 'DELETE':
            parse_str(file_get_contents("php://input"), $data);
            if (!isset($data['id']) && !isset($data['delete_all'])) {
                echo json_encode(["error" => "Fehlende Parameter: id oder delete_all"]);
                http_response_code(400);
                exit;
            }

            if (isset($data['delete_all']) && $data['delete_all'] === 'true') {
                if ($filiale === 'admin') {
                    $stmt = $pdo->query("SELECT * FROM orders");
                    $orders = $stmt->fetchAll(PDO::FETCH_ASSOC);

                    foreach ($orders as $order) {
                        $stmt = $pdo->prepare("INSERT INTO deleted_orders (original_order_id, filiale, customer_name, items, total_price, notes, deleted_at) VALUES (?, ?, ?, ?, ?, ?, NOW())");
                        $stmt->execute([
                            $order['id'],
                            $order['filiale'],
                            $order['customer_name'],
                            $order['items'],
                            $order['total_price'],
                            $order['notes']
                        ]);
                    }

                    $pdo->query("DELETE FROM orders");
                } else {
                    $stmt = $pdo->prepare("SELECT * FROM orders WHERE filiale = ?");
                    $stmt->execute([$filiale]);
                    $orders = $stmt->fetchAll(PDO::FETCH_ASSOC);

                    foreach ($orders as $order) {
                        $stmt = $pdo->prepare("INSERT INTO deleted_orders (original_order_id, filiale, customer_name, items, total_price, notes, deleted_at) VALUES (?, ?, ?, ?, ?, ?, NOW())");
                        $stmt->execute([
                            $order['id'],
                            $order['filiale'],
                            $order['customer_name'],
                            $order['items'],
                            $order['total_price'],
                            $order['notes']
                        ]);
                    }

                    $stmt = $pdo->prepare("DELETE FROM orders WHERE filiale = ?");
                    $stmt->execute([$filiale]);
                }
            } else {
                if ($filiale === 'admin') {
                    $stmt = $pdo->prepare("SELECT * FROM orders WHERE id = ?");
                    $stmt->execute([$data['id']]);
                } else {
                    $stmt = $pdo->prepare("SELECT * FROM orders WHERE id = ? AND filiale = ?");
                    $stmt->execute([$data['id'], $filiale]);
                }

                $order = $stmt->fetch(PDO::FETCH_ASSOC);

                if ($order) {
                    $stmt = $pdo->prepare("INSERT INTO deleted_orders (original_order_id, filiale, customer_name, items, total_price, notes, deleted_at) VALUES (?, ?, ?, ?, ?, ?, NOW())");
                    $stmt->execute([
                        $order['id'],
                        $order['filiale'],
                        $order['customer_name'],
                        $order['items'],
                        $order['total_price'],
                        $order['notes']
                    ]);

                    if ($filiale === 'admin') {
                        $stmt = $pdo->prepare("DELETE FROM orders WHERE id = ?");
                        $stmt->execute([$data['id']]);
                    } else {
                        $stmt = $pdo->prepare("DELETE FROM orders WHERE id = ? AND filiale = ?");
                        $stmt->execute([$data['id'], $filiale]);
                    }
                }
            }
            echo json_encode(["success" => true]);
            break;
    }

} catch (Exception $e) {
    error_log("Datenbankverbindungsfehler: " . $e->getMessage());
    echo json_encode(["error" => "Serverfehler: " . $e->getMessage()]);
}