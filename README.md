Website Pengelolaan Inventaris Suku Cadang dan Layanan Servis pada Bengkel Mobil

Project UAS Pemrograman Web, Semester 5, Program Studi Teknik Informatika, Fakultas Teknik, Universitas Tanjungpura.

- **Nama:** Kristian Candra Dinata
- **NIM:** D141241033
- **Repository:** https://github.com/KristianCandraDinata/bengkel-inventaris-servis

Deskripsi
Aplikasi web untuk membantu bengkel mobil mengelola stok suku cadang
dan mencatat layanan servis kendaraan pelanggan.

Fitur yang Direncanakan
- Pengelolaan data suku cadang (tambah, ubah, hapus, lihat stok)
- Pencatatan layanan servis dan pemakaian suku cadang
- Autentikasi pengguna dan laporan sederhana

Tech Stack
- Frontend: HTML, CSS, JavaScript, Bootstrap 5
- Backend: PHP native
- Database: MySQL (akses lewat PDO)
- Server lokal: Laragon

Struktur Folder
- `config/` : konfigurasi koneksi database
- `includes/` : header, footer, dan fungsi bersama
- `pages/` : halaman aplikasi
- `assets/` : css, js, dan gambar
- `database/` : skema database (.sql)

Cara Menjalankan
1. Clone repository ke folder `www` Laragon.
2. Salin `config/database.example.php` menjadi `config/database.php`, lalu isi kredensial MySQL.
3. Impor `database/schema.sql` lewat HeidiSQL atau phpMyAdmin.
4. Buat akun admin: `php database/buat-admin.php "Nama" username password`
5. Buka `pages/login.php` di browser.

Progres Milestone
| Milestone | Status | Keterangan |
|-----------|--------|------------|
| Tahap 1 | Selesai | Setup repository, `.gitignore`, struktur folder, dan konfigurasi database awal |
| Tahap 2 | Selesai | Skema database, koneksi PDO, serta login dan logout |
| Tahap akhir | Belum dimulai | - |