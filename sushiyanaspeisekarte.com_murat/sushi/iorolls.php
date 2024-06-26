<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sushi</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body class="artikelliste">
    <header>
        <img src="../bilder/logo.webp" alt="Restaurant Logo" class="logo">
    </header>

    <div class="content">
        <h1>Inside Out Rolls</h1>
        <?php
        include '../config/config.php';

        // Verbindung erstellen
        $conn = new mysqli($servername, $username, $password, $dbname, $port);

        // Verbindung überprüfen
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // SQL-Abfrage zum Abrufen der Menüs
        $sql = "SELECT * FROM `insideoutrolls` ORDER BY `insideoutrolls`.`artikelnummer` ASC;";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // Datensätze ausgeben
            while($row = $result->fetch_assoc()) {
                echo '<div class="dish" onclick="toggleDescription(\'desc' . $row["id"] . '\')">';
                echo '<h3>';

                echo '<img src="../bilder/icons/dropdown.png" alt="Dropdown" class="dropdown">';

                if ($row["bestellbar"] == 1) {
                    echo '<span class="dishname">' . htmlspecialchars($row["artikelnummer"]) . " " . htmlspecialchars($row["artikelname"]) . '</span>';
                } else{
                    echo '<span class="unbestellbar">' . htmlspecialchars($row["artikelnummer"]) . " " . htmlspecialchars($row["artikelname"]) . '</span>';
                }
                

                // Mini-Logos basierend auf den Spalten pikant, vegetarisch und vegan
                if ($row["pikant"] == 1) {
                    echo '<img src="../bilder/icons/pikant.png" alt="Pikant" class="mini-logo">';
                }
                if ($row["vegetarisch"] == 1) {
                    echo '<img src="../bilder/icons/vegetarisch.png" alt="Vegetarisch" class="mini-logo">';
                }
                if ($row["vegan"] == 1) {
                    echo '<img src="../bilder/icons/vegan.png" alt="Vegan" class="mini-logo">';
                }

                // Info-Logo für Allergenzusätze
                echo '<img id="img' . $row["id"] . '" src="../bilder/icons/info.png" alt="Info" class="info-logo" onclick="openModal(' . $row["id"] . ')">';
                echo '<span class="price">' . htmlspecialchars($row["preis"]) . '</span>';
                echo '</h3>';

                // Beschreibung mit Allergenzusätzen
                echo '<p id="desc' . $row["id"] . '" class="description" style="display:none;">' . $row["beschreibung"] .'</p>';
                echo '</div>';

                echo '<div id="myModal' . $row["id"] . '" class="modal">
                        <div class="modal-content">
                            <span class="close" onclick="closeModal(' . $row["id"] . ')">&times;</span>
                            <h2>Allergene und Zusatzstoffe</h2>
                            <div>
                                ' . $row["allergene_zusatz"] . '
                            </div>
                        </div>
                      </div>';

            

            }
        } else {
            echo "Keine Artikel gefunden.";
        }

        // Verbindung schließen
        $conn->close();
        ?>
    </div>

    <footer>
        <a href="../index.html">Zurück zur Startseite</a> - <a href="../impressum.html">Impressum</a> - <a href="../datenschutz.html">Datenschutz</a>
    </footer>

    <script>
        function toggleDescription(id) {
            var description = document.getElementById(id);
            if (description.style.display === "none" || description.style.display === "") {
                description.style.display = "block";
            } else {
                description.style.display = "none";
            }
        }

        function openModal(articleId) {
            var modal = document.getElementById('myModal' + articleId);
            modal.style.display = "block";
        }

        function closeModal(articleId) {
            var modal = document.getElementById('myModal' + articleId);
            modal.style.display = "none";
        }

        // Schließen des Modalfensters, wenn der Benutzer außerhalb des Modalfensters klickt
        window.onclick = function(event) {
            var modals = document.getElementsByClassName('modal');
            for (var i = 0; i < modals.length; i++) {
                if (event.target == modals[i]) {
                    modals[i].style.display = "none";
                }
            }
        }
    </script>
</body>
</html>
