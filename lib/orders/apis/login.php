<?php
session_start();
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    // Check for the existence of the .env file
    if (!file_exists('/home/sites/site100036969/web/flutter/assets/.env')) {
        die(json_encode(["error" => "Die .env-Datei konnte nicht gefunden werden."]));
    }

    // Load environment variables from the .env file
    $env = parse_ini_file('/home/sites/site100036969/web/flutter/assets/.env');

    // Check if the .env file was successfully loaded
    if (!$env) {
        die(json_encode(["error" => "Fehler beim Laden der .env-Datei"]));
    }

    // Database connection information from the .env file
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

        $stmt = $pdo->prepare("SELECT filiale, password FROM logins WHERE username = ?");
        $stmt->execute([$_POST['username']]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$user) {
            echo json_encode(["success" => false, "error" => "Benutzer nicht gefunden"]);
            exit;
        }

        if (!password_verify($_POST['password'], $user['password'])) {
            echo json_encode(["success" => false, "error" => "Passwort falsch"]);
            exit;
        }

        $_SESSION['username'] = $_POST['username'];
        $_SESSION['filiale'] = $user['filiale'];
        echo json_encode(["success" => true]);

    } catch (Exception $e) {
        echo json_encode(["success" => false, "error" => "Serverfehler: " . $e->getMessage()]);
    }
} else {
    echo json_encode(["success" => false, "error" => "Ungültige Anfrage"]);
}