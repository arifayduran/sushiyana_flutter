<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Destroy the session and redirect to login
    session_destroy();
    exit;
}