-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Mar 2023 pada 03.32
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laundrytes2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `transaksi_id` int(11) DEFAULT NULL,
  `paket_id` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `total_harga` double DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `total_bayar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `transaksi_id`, `paket_id`, `qty`, `total_harga`, `keterangan`, `total_bayar`) VALUES
(9, 33, 4, 10, 150000, NULL, 200000),
(10, 34, 4, 1, 15000, NULL, 15000),
(11, 35, 4, 2, 30000, NULL, 30000),
(12, 36, 4, 1, 15000, NULL, 15000),
(13, 39, 4, 1, 15000, NULL, 16000),
(14, 41, 4, 2, 30000, NULL, 30000),
(15, 42, 4, 2, 0, NULL, 0),
(16, 43, 5, 1, 25850, NULL, 30000),
(17, 44, 4, 2, 33000, NULL, NULL),
(18, 45, 4, 2, 30000, NULL, NULL),
(19, 46, 4, 2, 30000, NULL, NULL),
(20, 47, 4, 1, 15000, NULL, NULL),
(21, 48, 4, 1, 13500, NULL, 13500),
(22, 49, 4, 2, 30800, NULL, NULL),
(23, 50, 4, 2, 33000, NULL, NULL),
(24, 51, 4, 2, 28000, NULL, NULL),
(25, 52, 4, 2, 28000, NULL, NULL),
(26, 53, 4, 2, 37000, NULL, NULL),
(27, 54, 4, 1, 14850, NULL, NULL),
(28, 55, 4, 2, 27000, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nama_member` varchar(100) DEFAULT NULL,
  `alamat_member` text DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `telp_member` varchar(15) DEFAULT NULL,
  `no_ktp` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `alamat_member`, `jenis_kelamin`, `telp_member`, `no_ktp`) VALUES
(5, 'Abang Fikri', 'Ciamis', 'L', '0821340411', '123456789'),
(6, 'Jamal', 'Bandung Barat', 'L', '089233214123', '1232345611');

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(100) DEFAULT NULL,
  `alamat_outlet` text DEFAULT NULL,
  `telp_outlet` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id_outlet`, `nama_outlet`, `alamat_outlet`, `telp_outlet`) VALUES
(26, 'Outlet Mawar', 'Jalan Mawar', '081243555656'),
(27, 'jamal', 'yogyakarta', '230104314342'),
(28, 'zaki', 'yogyakarta', '32424534356'),
(29, 'jamal', 'jakarta', '234234536');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `jenis_paket` enum('kiloan','selimut','bedcover','kaos','lain') DEFAULT NULL,
  `nama_paket` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id_paket`, `jenis_paket`, `nama_paket`, `harga`, `outlet_id`) VALUES
(4, 'kiloan', 'Paket Kering Wangi', 15000, 26),
(5, 'kiloan', 'Paket Selimut', 15000, 26);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `kode_invoice` varchar(100) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `batas_waktu` datetime DEFAULT NULL,
  `tgl_pembayaran` datetime DEFAULT NULL,
  `biaya_tambahan` int(11) DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `pajak` int(11) DEFAULT NULL,
  `status` enum('baru','proses','selesai','diambil') DEFAULT NULL,
  `status_bayar` enum('dibayar','belum') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `outlet_id`, `kode_invoice`, `member_id`, `tgl`, `batas_waktu`, `tgl_pembayaran`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `status_bayar`, `user_id`) VALUES
(33, 26, 'DRY202003213927', 5, '2020-03-21 02:27:48', '2020-03-28 12:00:00', '2020-03-21 02:28:03', 0, 0, 0, 'diambil', 'dibayar', 11),
(34, 26, 'DRY202303014059', 5, '2023-03-01 01:59:52', '2023-03-08 12:00:00', '2023-03-10 02:49:00', 0, 10, 10, 'baru', 'dibayar', 8),
(35, 26, 'DRY202303013500', 5, '2023-03-01 02:01:01', '2023-03-08 12:00:00', '2023-03-10 02:22:26', 10000, 10, 10, 'baru', 'dibayar', 8),
(36, 26, 'DRY202303012702', 6, '2023-03-01 02:02:41', '2023-03-08 12:00:00', '2023-03-10 02:12:26', 10000, 0, 10, 'baru', 'dibayar', 8),
(37, 26, 'DRY202303011705', 6, '2023-03-01 02:05:29', '2023-03-08 12:00:00', NULL, 0, 0, 10, 'baru', 'belum', 8),
(38, 26, 'DRY202303011705', 6, '2023-03-01 02:06:11', '2023-03-08 12:00:00', NULL, 0, 0, 10, 'baru', 'belum', 8),
(39, 26, 'DRY202303011306', 6, '2023-03-01 02:06:15', '2023-03-08 12:00:00', '2023-03-10 02:11:55', 0, 0, 10, 'baru', 'dibayar', 8),
(40, 26, 'DRY202303011306', 6, '2023-03-01 02:06:45', '2023-03-08 12:00:00', NULL, 0, 0, 10, 'baru', 'belum', 8),
(41, 26, 'DRY202303011030', 6, '2023-03-01 02:30:47', '2023-03-08 12:00:00', '2023-03-10 02:08:13', 10000, 10, 10, 'baru', 'dibayar', 8),
(42, 26, 'DRY202303010132', 6, '2023-03-01 02:32:14', '2023-03-08 12:00:00', '2023-03-10 02:23:26', 10000, 10, 10, 'baru', 'dibayar', 8),
(43, 26, 'DRY202303020507', 6, '2023-03-02 02:07:24', '2023-03-09 12:00:00', '2023-03-10 02:21:51', 10000, 10, 10, 'baru', 'dibayar', 8),
(44, 26, 'DRY202303023607', 6, '2023-03-02 02:07:51', '2023-03-09 12:00:00', NULL, 0, 0, 10, 'baru', 'belum', 8),
(45, 26, 'DRY202303025811', 6, '2023-03-02 02:12:04', '2023-03-09 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', 8),
(46, 26, 'DRY202303021012', 6, '2023-03-02 02:12:18', '2023-03-09 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', 8),
(47, 26, 'DRY202303022412', 6, '2023-03-02 02:12:27', '2023-03-09 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', 8),
(48, 26, 'DRY202303023212', 5, '2023-03-02 02:12:37', '2023-03-09 12:00:00', '2023-03-02 03:06:04', 0, 10, 0, 'baru', 'dibayar', 8),
(49, 26, 'DRY202303023534', 5, '2023-03-02 02:35:41', '2023-03-09 12:00:00', NULL, 1000, 10, 10, 'baru', 'belum', 8),
(50, 26, 'DRY202303025235', 5, '2023-03-02 02:36:05', '2023-03-09 12:00:00', NULL, 0, 0, 10, 'baru', 'belum', 8),
(51, 26, 'DRY202303021236', 5, '2023-03-02 02:36:26', '2023-03-09 12:00:00', NULL, 1000, 10, 0, 'baru', 'belum', 8),
(52, 26, 'DRY202303025836', 5, '2023-03-02 02:37:29', '2023-03-09 12:00:00', NULL, 1000, 10, 0, 'baru', 'belum', 8),
(53, 26, 'DRY202303024537', 5, '2023-03-02 02:38:23', '2023-03-09 12:00:00', NULL, 10000, 10, 0, 'baru', 'belum', 8),
(54, 26, 'DRY202303074028', 5, '2023-03-07 04:29:06', '2023-03-14 12:00:00', NULL, 0, 10, 10, 'baru', 'belum', 8),
(55, 26, 'DRY202303072943', 5, '2023-03-07 04:43:39', '2023-03-14 12:00:00', NULL, 0, 10, 0, 'baru', 'belum', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `role` enum('admin','kasir','owner') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `outlet_id`, `role`) VALUES
(1, 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, 'admin'),
(7, 'jaja', 'jaja123', '827ccb0eea8a706c4c34a16891f84e7b', 26, 'kasir'),
(8, 'admintersayang', 'admintersayang', '827ccb0eea8a706c4c34a16891f84e7b', 26, 'admin'),
(10, 'Bapak Mawar', 'mawar', 'bd117502364227fd8c09098d31e11313', 26, 'owner'),
(11, 'kasirmawar', 'kasirmawar', 'b1890f61964dde27871070f0853cc72f', 26, 'kasir'),
(12, 'kasirganteng', 'kasirganteng1', '827ccb0eea8a706c4c34a16891f84e7b', 26, 'kasir'),
(13, 'dodoslebew', 'dodo', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 'owner'),
(14, 'ownerjamal', 'jamal', '827ccb0eea8a706c4c34a16891f84e7b', 26, 'owner');

--
-- Trigger `user`
--
DELIMITER $$
CREATE TRIGGER `INSERT` AFTER INSERT ON `user` FOR EACH ROW INSERT INTO user_log (id_user,perubahan,nama_user,role) VALUES(NEW.id_user, "INSERT", NEW.role)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_log`
--

CREATE TABLE `user_log` (
  `id_log` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `perubahan` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nama_user` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `paket_id` (`paket_id`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `outlet_id` (`outlet_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- Indeks untuk tabel `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id_log`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`paket_id`) REFERENCES `paket` (`id_paket`);

--
-- Ketidakleluasaan untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD CONSTRAINT `paket_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`id_member`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
