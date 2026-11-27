<?php
require_once __DIR__ . '/../config/database.php';

// Hitung jumlah tabel di database aktif
$jumlahTabel = $pdo->query(
    "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = DATABASE()"
)->fetchColumn();

// Ambil data contoh dari tabel kategori dan layanan
$kategori = $pdo->query("SELECT id, nama_kategori FROM kategori ORDER BY id")->fetchAll();
$layanan  = $pdo->query("SELECT id, nama_layanan, biaya FROM layanan ORDER BY id")->fetchAll();
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uji Koneksi Database</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container py-4">
    <h1 class="h3">Uji Koneksi Database</h1>
    <div class="alert alert-success">
        Koneksi ke <strong>bengkel_db</strong> berhasil. Jumlah tabel: <strong><?= (int) $jumlahTabel ?></strong> (seharusnya 9).
    </div>

    <h2 class="h5 mt-4">Kategori</h2>
    <ul class="list-group mb-4">
        <?php foreach ($kategori as $k): ?>
            <li class="list-group-item"><?= htmlspecialchars($k['nama_kategori']) ?></li>
        <?php endforeach; ?>
    </ul>

    <h2 class="h5">Layanan</h2>
    <table class="table table-bordered">
        <thead><tr><th>Nama Layanan</th><th>Biaya</th></tr></thead>
        <tbody>
        <?php foreach ($layanan as $l): ?>
            <tr>
                <td><?= htmlspecialchars($l['nama_layanan']) ?></td>
                <td>Rp <?= number_format($l['biaya'], 0, ',', '.') ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>