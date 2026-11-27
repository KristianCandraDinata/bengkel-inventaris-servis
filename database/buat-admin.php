<?php
// Dijalankan lewat terminal: php database/buat-admin.php "Nama" username password
if (PHP_SAPI !== 'cli') {
    exit('Script ini hanya dapat dijalankan lewat terminal.');
}

require_once __DIR__ . '/../config/database.php';

[$script, $nama, $username, $password] = $argv + [null, null, null, null];

if (!$nama || !$username || !$password) {
    exit("Pemakaian: php database/buat-admin.php \"Nama\" username password\n");
}

$stmt = $pdo->prepare('INSERT INTO users (nama, username, password, role) VALUES (?, ?, ?, ?)');
$stmt->execute([$nama, $username, password_hash($password, PASSWORD_DEFAULT), 'admin']);

echo "Admin '$username' berhasil dibuat.\n";