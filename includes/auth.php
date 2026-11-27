<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Panggil di halaman yang hanya boleh diakses setelah login
function wajib_login(): void
{
    if (empty($_SESSION['user_id'])) {
        header('Location: login.php');
        exit;
    }
}