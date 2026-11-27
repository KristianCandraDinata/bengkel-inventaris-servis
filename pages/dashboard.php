<?php
require_once __DIR__ . '/../includes/auth.php';
wajib_login();
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Bengkel Inventaris</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container py-4">
    <h1 class="h3">Dashboard</h1>
    <p>Selamat datang, <strong><?= htmlspecialchars($_SESSION['nama']) ?></strong> (<?= htmlspecialchars($_SESSION['role']) ?>).</p>
    <a class="btn btn-outline-danger" href="logout.php">Logout</a>
</body>
</html>