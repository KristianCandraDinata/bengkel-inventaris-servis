-- Skema database: Website Inventaris Suku Cadang dan Layanan Servis Bengkel Mobil
CREATE DATABASE IF NOT EXISTS bengkel_db
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bengkel_db;

-- 1. Akun pengguna (password disimpan dalam bentuk hash)
CREATE TABLE users (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin','kasir') NOT NULL DEFAULT 'kasir',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 2. Kategori suku cadang
CREATE TABLE kategori (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nama_kategori VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 3. Inventaris suku cadang
CREATE TABLE suku_cadang (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  kode VARCHAR(30) NOT NULL UNIQUE,
  nama VARCHAR(150) NOT NULL,
  kategori_id INT UNSIGNED NOT NULL,
  stok INT NOT NULL DEFAULT 0,
  stok_minimum INT NOT NULL DEFAULT 5,
  harga_jual DECIMAL(12,2) NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (kategori_id) REFERENCES kategori(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 4. Pelanggan
CREATE TABLE pelanggan (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  no_hp VARCHAR(20),
  alamat TEXT
) ENGINE=InnoDB;

-- 5. Kendaraan milik pelanggan
CREATE TABLE kendaraan (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  pelanggan_id INT UNSIGNED NOT NULL,
  plat_nomor VARCHAR(15) NOT NULL UNIQUE,
  merek VARCHAR(50) NOT NULL,
  tipe VARCHAR(50),
  tahun YEAR,
  FOREIGN KEY (pelanggan_id) REFERENCES pelanggan(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 6. Jenis layanan servis
CREATE TABLE layanan (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nama_layanan VARCHAR(100) NOT NULL UNIQUE,
  biaya DECIMAL(12,2) NOT NULL DEFAULT 0
) ENGINE=InnoDB;

-- 7. Transaksi servis
CREATE TABLE servis (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  kendaraan_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  tanggal_masuk DATE NOT NULL,
  keluhan TEXT,
  status ENUM('menunggu','dikerjakan','selesai') NOT NULL DEFAULT 'menunggu',
  total_biaya DECIMAL(12,2) NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (kendaraan_id) REFERENCES kendaraan(id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 8. Layanan yang dikerjakan pada satu servis
CREATE TABLE detail_servis_layanan (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  servis_id INT UNSIGNED NOT NULL,
  layanan_id INT UNSIGNED NOT NULL,
  biaya DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (servis_id) REFERENCES servis(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (layanan_id) REFERENCES layanan(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 9. Suku cadang yang dipakai pada satu servis
CREATE TABLE detail_servis_suku_cadang (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  servis_id INT UNSIGNED NOT NULL,
  suku_cadang_id INT UNSIGNED NOT NULL,
  jumlah INT UNSIGNED NOT NULL,
  harga_satuan DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (servis_id) REFERENCES servis(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (suku_cadang_id) REFERENCES suku_cadang(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Data awal (contoh)
INSERT INTO kategori (nama_kategori) VALUES
  ('Oli dan Pelumas'), ('Filter'), ('Rem'), ('Kelistrikan');

INSERT INTO layanan (nama_layanan, biaya) VALUES
  ('Ganti Oli', 50000), ('Tune Up', 250000), ('Servis Rem', 150000);