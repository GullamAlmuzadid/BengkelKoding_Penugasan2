# 🏥 Smartpolici4 - Sistem Manajemen Klinik dengan CodeIgniter 4

## 📊 Gambaran Proyek
Smartpolici4 adalah sistem manajemen klinik berbasis web yang dirancang untuk mendukung operasional klinik, termasuk manajemen pasien, rekam medis, dan administrasi lainnya. Sistem ini dibangun menggunakan CodeIgniter 4.

## 🖥️ Persyaratan Sistem

### Prasyarat
- **PHP** `7.4+`
- **Composer**
- **MySQL/MariaDB**
- **Web Server** (Apache/Nginx)

## 🚀 Panduan Instalasi

### 1. Ekstrak Proyek
Ekstrak file `Smartpolici4.zip` ke direktori server Anda.

### 2. Instal Dependensi
Gunakan Composer untuk menginstal dependensi PHP:
```bash
composer install
```

### 3. Konfigurasi Lingkungan
Salin file environment default dan sesuaikan:
```bash
cp env .env
```
Edit file `.env` dengan pengaturan aplikasi Anda, khususnya bagian database:
```env
# Database Configuration
database.default.hostname = 127.0.0.1
database.default.database = smartpolici4
database.default.username = root
database.default.password = passwordanda
database.default.DBDriver = MySQLi
```

### 4. Siapkan Database
#### Pilihan 1: Migrasi Database
Jika proyek mendukung migrasi database:
```bash
php spark migrate
```

#### Pilihan 2: Impor File SQL
Jika file SQL disediakan dalam arsip:
1. Buat database baru:
```bash
mysql -u root -p
CREATE DATABASE smartpolici4;
exit;
```

2. Impor file SQL:
```bash
mysql -u root -p smartpolici4 < path/ke/database.sql
```

### 5. Jalankan Aplikasi
Gunakan command berikut untuk menjalankan server pengembangan:
```bash
php spark serve --port=8081
```

🌐 Akses aplikasi di: `http://localhost:8081`

## 🛠️ Pengembangan
### Komposer
Gunakan Composer untuk mengelola dependensi:
```bash
composer update
```

### Fitur Utama
- **Manajemen Pasien**: Tambah, ubah, dan kelola data pasien.
- **Rekam Medis**: Kelola riwayat kesehatan pasien.
- **Pelaporan**: Laporan data pasien dan aktivitas klinik.

---
**Developed by [Gullam Almuzadid - A11.2021.13743]** 🚀

