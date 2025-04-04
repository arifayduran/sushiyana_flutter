<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE");
header("Access-Control-Allow-Headers: Content-Type");

// Start the session
session_start();

// Skip session check for POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    if (!isset($_SESSION['username']) || !isset($_SESSION['filiale'])) {
        echo json_encode(["error" => "Nicht eingeloggt"]);
        http_response_code(401);
        exit;
    }
}

$filiale = $_SESSION['filiale'];

// Check for the existence of the .env file
if (!file_exists('/home/sites/site100036969/web/flutter/assets/.env')) {
    die(json_encode(array("error" => "Die .env-Datei konnte nicht gefunden werden.")));
}

// Load environment variables from the .env file
$env = parse_ini_file('/home/sites/site100036969/web/flutter/assets/.env');

// Check if the .env file was successfully loaded
if (!$env) {
    die(json_encode(array("error" => "Fehler beim Laden der .env-Datei")));
}

// Database connection information from the .env file
$servername = $env['DB_HOST'];
$usernameDB = $env['DB_USER'];
$passwordDB = $env['DB_PASSWORD'];
$dbname = $env['DB_NAME'];

// Establish connection
$conn = new mysqli($servername, $usernameDB, $passwordDB, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(array("error" => "Verbindung fehlgeschlagen: " . $conn->connect_error)));
}

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        if (!isset($_SESSION['username']) || !isset($_SESSION['filiale'])) {
            echo json_encode(["error" => "Nicht eingeloggt"]);
            http_response_code(401);
            exit;
        }
        if ($filiale === 'admin') {
            $stmt = $pdo->query("SELECT * FROM orders ORDER BY created_at DESC");
        } else {
            $stmt = $pdo->prepare("SELECT * FROM orders WHERE filiale = ? ORDER BY created_at DESC");
            $stmt->execute([$filiale]);
        }
        echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
        break;

    case 'POST':
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
            $data['notes']
        ]);
        echo json_encode(["success" => true, "id" => $pdo->lastInsertId()]);
        break;

    case 'DELETE':
        if (!isset($_SESSION['username']) || !isset($_SESSION['filiale'])) {
            echo json_encode(["error" => "Nicht eingeloggt"]);
            http_response_code(401);
            exit;
        }
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