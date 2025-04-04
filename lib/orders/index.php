<?php
session_start();

if (!isset($_SESSION['username']) || !isset($_SESSION['filiale'])) {
    header('Location: login.html');
    exit;
}

$filiale = $_SESSION['filiale'] ?? null;
$isAdmin = $filiale === 'admin';
?>
<!DOCTYPE html>
<html lang="de">
  <head>
    <meta charset="UTF-8" />
    <title>Sushi Yana Bestellungen</title>
    <style>
      table {
        width: 100%;
        border-collapse: collapse;
        font-family: Arial;
      }
      th,
      td {
        padding: 10px;
        border: 1px solid #ddd;
      }
      button {
        cursor: pointer;
      }
      .login-form {
        max-width: 300px;
        margin: 50px auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-family: Arial;
      }
      .login-form input {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 3px;
      }
      .login-form button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 3px;
        cursor: pointer;
      }
      .login-form button:hover {
        background-color: #0056b3;
      }
      .error {
        color: red;
        font-size: 0.9em;
        margin-bottom: 10px;
      }
    </style>
  </head>
  <body>
    <h2>Sushi Yana – Bestellungen</h2>
    <div
      id="userStatus"
      style="margin-bottom: 20px; font-weight: bold; color: #444"
    ></div>
    <button id="logoutButton">Logout</button>
    <h2>Sushi Yana - Bestellungen Übersicht</h2>
    <table id="ordersTable">
      <thead>
        <tr>
          <th>ID</th>
          <th>Kunde</th>
          <th>Artikel</th>
          <th>Preis (€)</th>
          <th>Notizen</th>
          <th>Datum/Uhrzeit</th>
          <th>Aktion</th>
        </tr>
      </thead>
      <tbody></tbody>
    </table>

    <script>
      const isAdmin = <?php echo json_encode($isAdmin); ?>;
    </script>
    <script>
      let isLoggedOut = false; // Variable to track logout status
      const apiUrl = "host_api.php";

      async function fetchOrders() {
        if (isLoggedOut) return; // Prevent further requests after logout
        try {
          const response = await fetch(apiUrl);
          if (!response.ok) {
            console.error(`Fetch failed with status: ${response.status} ${response.statusText}`);
            throw new Error(`Fehler: ${response.status} ${response.statusText}`);
          }
          const data = await response.json();

          if (!Array.isArray(data)) {
            console.error("Unexpected response format:", data);
            throw new Error("Unerwartetes Antwortformat: Die Antwort ist kein Array.");
          }

          updateOrdersTable(data);
        } catch (err) {
          console.error("Fehler beim Laden der Bestellungen:", err);
          alert("Fehler beim Laden der Bestellungen. Bitte versuchen Sie es später erneut.");
        }
      }

      function updateOrdersTable(orders) {
        const tbody = document.querySelector("#ordersTable tbody");
        tbody.innerHTML = "";
        orders.forEach((order) => {
          let itemsList = "";

          try {
            const parsedItems = JSON.parse(order.items);

            if (Array.isArray(parsedItems)) {
              parsedItems.forEach((item) => {
                const name = item.name ?? "Unbekannt";
                const quantity = item.quantity ?? 1;
                const price = item.price?.toFixed(2) ?? "0.00";
                const note = item.note ? ` -- (Notiz: ${item.note})` : "";
                itemsList += `${quantity}x ${name} – ${price} €${note}<br>`;
              });
            } else {
              itemsList = "Ungültiges Format";
            }
          } catch (e) {
            console.error(
              "Fehler beim Parsen von order.items:",
              order.items,
              e
            );
            itemsList = `<i>Fehler beim Laden der Artikel</i>`;
          }

          tbody.innerHTML += `
              <tr>
                <td>${order.id}</td>
                <td>${order.customer_name}</td>
                <td>${itemsList}</td>
                <td>${Number(order.total_price).toFixed(2)}</td>
                <td>${order.notes}</td>
                <td>${order.created_at}</td>
                <td>${
                  isAdmin || order.filiale === "$filiale"
                    ? `<button onclick="deleteOrder(${order.id})">Löschen</button>`
                    : ""
                }</td>
              </tr>
            `;
        });
      }

      async function deleteOrder(id) {
        try {
          const response = await fetch(apiUrl, {
            method: "DELETE",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: `id=${id}`,
          });
          if (!response.ok) {
            throw new Error(
              `Fehler: ${response.status} ${response.statusText}`
            );
          }
          fetchOrders();
        } catch (err) {
          console.error("Fehler beim Löschen der Bestellung:", err);
          alert(
            "Fehler beim Löschen der Bestellung. Bitte versuchen Sie es später erneut."
          );
        }
      }

      setInterval(fetchOrders, 5000);
      fetchOrders();

      // Wer ist eingeloggt?
      async function fetchUserStatus() {
        try {
          const response = await fetch("whoami.php");
          if (!response.ok) {
            throw new Error(
              `Fehler: ${response.status} ${response.statusText}`
            );
          }
          const data = await response.json();
          const filiale = data.filiale;
          const userStatus = document.getElementById("userStatus");

          if (!filiale) {
            userStatus.textContent = "⚠️ Nicht eingeloggt";
          } else if (filiale === "admin") {
            userStatus.textContent = "🔑 Admin-Modus – Zentrale Übersicht";
          } else {
            userStatus.textContent = `📍 Eingeloggt als: ${filiale}`;
          }
        } catch (err) {
          console.error("Fehler bei whoami:", err);
          document.getElementById("userStatus").textContent =
            "⚠️ Fehler beim Abrufen der Login-Info";
        }
      }

      fetchUserStatus();

      document
        .getElementById("logoutButton")
        .addEventListener("click", async () => {
          isLoggedOut = true; // Set logout status to true
          try {
            const response = await fetch("logout.php", { method: "POST" });
            if (response.ok) {
              window.location.href = "login.html";
            } else {
              alert("Fehler beim Logout. Bitte versuchen Sie es erneut.");
            }
          } catch (err) {
            console.error("Logout-Fehler:", err);
            alert("Fehler beim Logout. Bitte versuchen Sie es erneut.");
          }
        });
    </script>
  </body>
</html>
