<?php
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

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

        $stmt = $pdo->prepare("SELECT id, filiale, password FROM logins WHERE username = ?");
        $stmt->execute([$username]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$user) {
            echo json_encode(["success" => false, "error" => "Benutzer nicht gefunden"]);
            exit;
        }

        if (!password_verify($password, $user['password'])) {
            echo json_encode(["success" => false, "error" => "Passwort falsch"]);
            exit;
        }

        $token = bin2hex(random_bytes(32));
        $stmt = $pdo->prepare("INSERT INTO user_tokens (user_id, token) VALUES (?, ?)");
        $stmt->execute([$user['id'], $token]);

        echo json_encode(["success" => true, "token" => $token, "filiale" => $user['filiale']]);

    } catch (Exception $e) {
        echo json_encode(["success" => false, "error" => "Serverfehler: " . $e->getMessage()]);
    }
} else {
    echo json_encode(["success" => false, "error" => "Ungültige Anfrage"]);
}