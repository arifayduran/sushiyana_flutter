<?php
session_start();
echo json_encode([
  "filiale" => $_SESSION['filiale'] ?? null
]);