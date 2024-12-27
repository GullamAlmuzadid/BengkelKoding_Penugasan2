-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 27, 2024 at 03:26 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartpoly`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int NOT NULL,
  `id_pasien` int NOT NULL,
  `id_jadwal` int NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int NOT NULL,
  `status` enum('menunggu','diperiksa','selesai') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menunggu',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `status`, `created_at`, `updated_at`) VALUES
(19, 13, 13, 'Pusing', 1, 'selesai', '2024-12-27 07:29:08', '2024-12-27 07:30:10'),
(20, 13, 15, 'Tolong gigi saya sakit', 1, 'selesai', '2024-12-27 07:45:42', '2024-12-27 07:46:14'),
(21, 13, 16, 'Stress', 1, 'selesai', '2024-12-27 07:47:38', '2024-12-27 07:48:09'),
(22, 2, 16, 'Migrain', 2, 'selesai', '2024-12-27 07:50:30', '2024-12-27 07:51:15'),
(23, 13, 15, 'Cabut Gigi', 2, 'selesai', '2024-12-27 07:57:18', '2024-12-27 07:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int NOT NULL,
  `id_periksa` int NOT NULL,
  `id_obat` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(19, 13, 3),
(20, 14, 1),
(21, 15, 1),
(22, 16, 1),
(23, 16, 1),
(24, 16, 3),
(25, 12, 1),
(26, 12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `dokter_id` int NOT NULL,
  `nama_dokter` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` int NOT NULL,
  `id_poli` int NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`dokter_id`, `nama_dokter`, `alamat`, `no_hp`, `id_poli`, `user_id`) VALUES
(1, 'Imam', 'Semarang Indah', 2147483647, 2, 2),
(4, 'Hernanda', 'Genuk City', 2147483647, 3, 14),
(5, 'ilham', 'Kedungmundu', 128374123, 3, 15);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int NOT NULL,
  `id_dokter` int NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Tidak Aktif',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`, `status`, `created_at`, `updated_at`) VALUES
(13, 1, 'Senin', '21:13:00', '22:13:00', 'Tidak Aktif', '2024-12-27 14:13:26', '2024-12-27 14:47:08'),
(14, 1, 'Selasa', '21:13:00', '12:13:00', 'Tidak Aktif', '2024-12-27 14:13:43', '2024-12-27 15:24:26'),
(15, 4, 'Selasa', '21:45:00', '23:45:00', 'Aktif', '2024-12-27 14:45:10', '2024-12-27 14:45:10'),
(16, 1, 'Jumat', '21:47:00', '12:47:00', 'Aktif', '2024-12-27 14:47:08', '2024-12-27 15:24:26');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `obat_id` int NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`obat_id`, `nama_obat`, `kemasan`, `harga`) VALUES
(1, 'Paracetamole', '250mg', 4000),
(3, 'Amoxcilin', '500mg', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `pasien_id` int NOT NULL,
  `nama_pasien` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` int NOT NULL,
  `no_hp` int NOT NULL,
  `no_rm` char(10) NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`pasien_id`, `nama_pasien`, `alamat`, `no_ktp`, `no_hp`, `no_rm`, `user_id`) VALUES
(2, 'Rahul', 'Kedungmunduu', 2147483647, 2147483647, '202412-001', 6),
(9, 'Dewa', 'Poncowolo', 2147483647, 2147483647, '202412-002', 13),
(10, 'Reo', 'Tlogosari', 2147483647, 984837182, '202412-003', 16),
(12, 'Roji', 'Jakarta', 2147483647, 2147483647, '202412-004', 18),
(13, 'Adi', 'Semarang', 2147483647, 2147483647, '202412-005', 19);

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int NOT NULL,
  `id_daftar_poli` int NOT NULL,
  `tgl_periksa` date NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(12, 19, '2024-12-27', 'Istirahatt', 164000),
(13, 20, '2024-12-27', 'Rajin Sikat Gigi', 160000),
(14, 21, '2024-12-27', 'Hiling', 154000),
(15, 22, '2024-12-27', 'Perbanyak minum air putih', 154000),
(16, 23, '2024-12-27', 'Cabut', 168000);

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `poli_id` int NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`poli_id`, `nama_poli`, `keterangan`) VALUES
(2, 'Poli Umum', 'Dokter Umum'),
(3, 'Poli Gigi', 'Dokter Gigi');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','dokter','pasien') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$iCL8G/IeSL72PtiwzbOLOu2h0..pep.gf//TDGIkyAdw/xXSIJux.', NULL, 'admin'),
(2, 'Imam', 'Imam@gmail.com', NULL, '$2y$10$K6L71B0Ua9H3rlbunn06O.HafRqpzhE4sixg0E8Uy0ssz7Tecjg2W', NULL, 'dokter'),
(6, 'Rahul', 'Rahul@gmail.com', NULL, '$2y$10$74U.ixm3Gw6zDoCxeVemcuNRx27O9lgbbBqi.EleIDeOIC3T/EMkC', NULL, 'pasien'),
(13, 'Dewa', 'Dewa@gmail.com', NULL, '$2y$10$j/fRXaqaBbsJQe.oug7UIO3HIjDVfN3irByG.z6RX1hluHuVUhRO.', NULL, 'pasien'),
(14, 'hernanda', 'Hernanda@gmail.com', NULL, '$2y$10$8UrSj1TbKsZrT8TVYFc92OwUnA2tTmp0glM91b75pjrDXwQU49Oja', NULL, 'dokter'),
(15, 'ilham', 'ilham@gmail.com', NULL, '$2y$10$uv57aesgw9QZ.pCKaVEJeuoEY3i9592/cDc6CfdTjU11hWs6ThJIO', NULL, 'dokter'),
(16, 'Reo', 'Reo@gmail.com', NULL, '$2y$10$7Hfi8/gT3xNZBmYSY2TGBuqHTIl73hFpm/ZsGLygm/NDeMNG5mXxK', NULL, 'pasien'),
(18, 'Roji', 'Roji@gmail.com', NULL, '$2y$10$7Cq7DL2SaFGiKYWAuROwI.SPMjUup7KNO3qDeLiM4QcDCyJ.tpn2C', NULL, 'pasien'),
(19, 'Adi', 'Adi@gmail.com', NULL, '$2y$10$1idYwqG/V5zo8hHoybR9vO5YrtDoVS6SnWzMSv3gx0SDQ9ZCvFiWK', NULL, 'pasien');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_periksa` (`id_periksa`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`dokter_id`),
  ADD KEY `dokter_ibfk_1` (`id_poli`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`obat_id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`pasien_id`),
  ADD KEY `pas_user_id` (`user_id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_daftar_poli` (`id_daftar_poli`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`poli_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `dokter_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `obat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `pasien_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `poli_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `daftar_poli_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`pasien_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `daftar_poli_ibfk_2` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `detail_periksa_ibfk_1` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_periksa_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`obat_id`) ON DELETE CASCADE;

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`poli_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `jadwal_periksa_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`dokter_id`) ON DELETE CASCADE;

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `pas_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
