<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);
    $requiredFields = ['filiale', 'customer_name', 'items', 'total_price'];
    $missingFields = [];
    foreach ($requiredFields as $field) {
        if (empty($data[$field])) {
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

if (!isset($_SERVER['HTTP_AUTHORIZATION'])) {
    echo json_encode(["error" => "Token fehlt"]);
    http_response_code(401);
    exit;
}

$token = str_replace('Bearer ', '', $_SERVER['HTTP_AUTHORIZATION']);

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

try {
    $pdo = new PDO(
        "mysql:host=$servername;dbname=$dbname;charset=utf8mb4",
        $usernameDB,
        $passwordDB,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    $stmt = $pdo->prepare("SELECT filiale FROM logins WHERE token = ?");
    $stmt->execute([$token]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        echo json_encode(["error" => "Ungültiges Token"]);
        http_response_code(401);
        exit;
    }

    $filiale = $user['filiale'];

    $method = $_SERVER['REQUEST_METHOD'];

    switch ($method) {
        case 'GET':
            if ($filiale === 'admin') {
                $stmt = $pdo->query("SELECT * FROM orders ORDER BY created_at DESC");
            } else {
                $stmt = $pdo->prepare("SELECT * FROM orders WHERE filiale = ? ORDER BY created_at DESC");
                $stmt->execute([$filiale]);
            }
            echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
            break;

        case 'DELETE':
            parse_str(file_get_contents("php://input"), $data);
            if ($filiale === 'admin') {
                $stmt = $pdo->prepare("DELETE FROM orders WHERE id = ?");
                $stmt->execute([$data['id']]);
            } else {
                $stmt = $pdo->prepare("DELETE FROM orders WHERE id = ? AND filiale = ?");
                $stmt->execute([$data['id'], $filiale]);
            }
            echo json_encode(["success" => true]);
            break;
    }

} catch (Exception $e) {
    echo json_encode(["error" => "Serverfehler: " . $e->getMessage()]);
}