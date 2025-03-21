<?php
// Enable error reporting
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Custom error handler to return errors in JSON format
function customError($errno, $errstr) {
    echo json_encode(array("error" => "Error [$errno]: $errstr"));
    die();
}

set_error_handler("customError");

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if (!file_exists('/home/sites/site100036969/web/flutter/assets/.env')) {
    die(json_encode(array("error" => "Die .env-Datei konnte nicht gefunden werden.")));
}

// Laden der Umgebungsvariablen aus der .env-Datei
$env = parse_ini_file('/home/sites/site100036969/web/flutter/assets/.env');

// Prüfen, ob die .env-Datei erfolgreich geladen wurde
if (!$env) {
    die(json_encode(array("error" => "Fehler beim Laden der .env-Datei")));
}


// Datenbankverbindungsinformationen aus der .env-Datei
$servername = $env['DB_HOST'];
$usernameDB = $env['DB_USER'];
$passwordDB = $env['DB_PASSWORD'];
$dbname = $env['DB_NAME'];

// Verbindung herstellen
$conn = new mysqli($servername, $usernameDB, $passwordDB, $dbname);

// Verbindung prüfen
if ($conn->connect_error) {
    die(json_encode(array("error" => "Verbindung fehlgeschlagen: " . $conn->connect_error)));
}

// Nur GET-Anfragen erlauben
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['table'])) {
        $table = $conn->real_escape_string($_GET['table']);

        // Überprüfen, ob die Tabelle existiert
        $result = $conn->query("SHOW TABLES LIKE '$table'");
        if ($result->num_rows > 0) {
            $sql = "SELECT * FROM `$table`";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                $data = array();
                while($row = $result->fetch_assoc()) {
                    $data[] = $row;
                }
                echo json_encode($data);
            } else {
                echo json_encode(array("message" => "Keine Daten gefunden."));
            }
        } else {
            http_response_code(400); // Bad Request
            echo json_encode(array("error" => "Tabelle '$table' existiert nicht."));
        }
    } else {
        http_response_code(400); // Bad Request
        echo json_encode(array("error" => "Parameter 'table' fehlt."));
    }
} else {
    http_response_code(405); // Method Not Allowed
    echo json_encode(array("error" => "Methode nicht erlaubt."));
}

$conn->close();
?>
