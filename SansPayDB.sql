-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table tripay_webpulsa.antriantrxes
CREATE TABLE IF NOT EXISTS `antriantrxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `apiserver_id` int(11) unsigned DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_default` bigint(20) unsigned NOT NULL DEFAULT 0,
  `harga_markup` bigint(20) unsigned NOT NULL DEFAULT 0,
  `total` bigint(20) unsigned NOT NULL DEFAULT 0,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtrpln` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengirim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL,
  `via` enum('DIRECT','API') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` enum('SALDO','POIN') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SALDO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `antriantrxes_user_id_foreign` (`user_id`),
  KEY `antriantrxes_apiserver_id_foreign` (`apiserver_id`),
  CONSTRAINT `antriantrxes_apiserver_id_foreign` FOREIGN KEY (`apiserver_id`) REFERENCES `apiserver` (`id`),
  CONSTRAINT `antriantrxes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.antriantrxes: ~3 rows (approximately)
/*!40000 ALTER TABLE `antriantrxes` DISABLE KEYS */;
INSERT INTO `antriantrxes` (`id`, `apiserver_id`, `code`, `produk`, `harga_default`, `harga_markup`, `total`, `target`, `mtrpln`, `note`, `pengirim`, `status`, `user_id`, `via`, `payment`, `created_at`, `updated_at`) VALUES
	(20, 2, 'T1', 'THREE 1.000', 0, 0, 0, '08987499383', '-', 'Transaksi berhasil diproses.', '172.68.254.177', 1, 4, 'DIRECT', 'SALDO', '2020-12-25 23:14:28', '2020-12-25 23:14:35'),
	(23, 2, 'S1', 'TELKOMSEL 1.000', 0, 0, 0, '082131445043', '-', 'Transaksi dalam antrian.', '127.0.0.1', 0, 4, 'API', 'SALDO', '2021-02-10 09:09:59', '2021-02-10 09:09:59'),
	(24, 2, 'S1', 'TELKOMSEL 1.000', 0, 0, 0, '082131445043', '-', 'Transaksi berhasil diproses.', '127.0.0.1', 1, 4, 'API', 'SALDO', '2021-02-10 09:15:00', '2021-02-10 09:15:11');
/*!40000 ALTER TABLE `antriantrxes` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.apiserver
CREATE TABLE IF NOT EXISTS `apiserver` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `website` varchar(255) NOT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  `endpoint_development` varchar(255) DEFAULT NULL,
  `api_userid` varchar(255) DEFAULT NULL,
  `api_key` text DEFAULT NULL,
  `api_secret` text DEFAULT NULL,
  `pin` varchar(10) DEFAULT NULL,
  `status_server` int(11) NOT NULL,
  `saldo` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `use_api` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table tripay_webpulsa.apiserver: ~2 rows (approximately)
/*!40000 ALTER TABLE `apiserver` DISABLE KEYS */;
INSERT INTO `apiserver` (`id`, `name`, `website`, `endpoint`, `endpoint_development`, `api_userid`, `api_key`, `api_secret`, `pin`, `status_server`, `saldo`, `status`, `use_api`, `created_at`, `updated_at`) VALUES
	(1, 'DigiFlazz', 'https://digiflazz.com/', 'https://api.digiflazz.com/v1', 'https://api.digiflazz.com/v1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2020-08-01 20:27:09', '0000-00-00 00:00:00'),
	(2, 'Tripay', 'https://tripay.co.id', 'https://tripay.co.id/api/v2/pembayaran/category', NULL, NULL, 'n7BNTNrGYzxhCF2KbPUG8nEDl8A1HshL', NULL, '2688', 0, 0, 0, 0, NULL, NULL);
/*!40000 ALTER TABLE `apiserver` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.banks
CREATE TABLE IF NOT EXISTS `banks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_bank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atas_nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_rek` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_kategori_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_user` tinyint(1) NOT NULL DEFAULT 0,
  `bank_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `is_closed` int(11) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_kategori_id` (`bank_kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.banks: ~18 rows (approximately)
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` (`id`, `nama_bank`, `atas_nama`, `no_rek`, `code`, `bank_kategori_id`, `image`, `type`, `verification_amount`, `verification_user`, `bank_id`, `status`, `provider_id`, `is_closed`, `created_at`, `updated_at`) VALUES
	(15, 'Maybank Virtual Account', '', '', 'MYBVA', 3, 'maybank.png', 'virtual-account', NULL, 0, NULL, 1, 1, 1, NULL, '2021-02-10 10:16:30'),
	(16, 'Permata Virtual Account', NULL, NULL, 'PERMATAVA', 3, 'permatabank.png', 'virtual-account', NULL, 0, NULL, 1, 1, 1, NULL, '2021-02-10 10:16:31'),
	(18, 'BNI Virtual Account', NULL, NULL, 'BNIVA', 3, 'bni.png', 'virtual-account', NULL, 0, NULL, 1, 1, 1, NULL, '2021-02-10 10:16:32'),
	(20, 'BRI Virtual Account', '', '', 'BRIVA', 3, 'bank-bri-virtual-account.png', 'virtual-account', NULL, 0, NULL, 1, 1, 1, NULL, '2021-02-10 10:16:34'),
	(33, 'Bank BRI', '', '', 'bri', 1, 'bank-bank-bri.png', 'transfer-bank', NULL, 0, NULL, 1, 2, 1, NULL, '2020-12-18 08:37:48'),
	(34, 'Bank Mandiri', NULL, NULL, 'mandiri_online', 1, 'mandiri.png', 'transfer-bank', NULL, 0, NULL, 1, 2, 1, NULL, '2020-12-17 10:47:54'),
	(35, 'Bank Bca', NULL, NULL, 'bca', 1, 'bca.png', 'transfer-bank', NULL, 0, NULL, 1, 2, 1, NULL, '2020-12-17 10:47:54'),
	(36, 'Bank Bni', NULL, NULL, 'bni', 1, 'bni.png', 'transfer-bank', NULL, 0, NULL, 1, 2, 1, NULL, '2020-12-17 10:47:52'),
	(40, 'Alfamart', NULL, NULL, 'ALFAMART', 8, 'alfamart.png', 'mitra', NULL, 0, NULL, 1, 1, 1, NULL, '2021-02-10 10:16:28'),
	(41, 'Indomaret', NULL, NULL, 'INDOMARET', 8, 'indomaret.png', 'mitra', NULL, 0, NULL, 1, 1, 1, NULL, '2021-02-10 10:16:27'),
	(42, 'OVO', NULL, NULL, 'ovo', 6, 'ovo.png', 'ovo', NULL, 0, NULL, 1, 2, 1, NULL, '2020-12-17 10:47:47'),
	(43, 'GOPAY', NULL, NULL, 'gopay', 6, 'gopay.png', 'gopay', NULL, 0, NULL, 1, 2, 1, NULL, '2020-12-17 10:48:07'),
	(48, 'QRIS', '', '', 'QRIS', 12, 'bank-qris.png', 'qris', NULL, 0, 'QRIS', 1, 1, 1, '2020-08-04 17:24:56', '2021-02-10 10:16:26'),
	(49, 'Alfamidi', '', '', 'ALFAMIDI', 8, 'bank-alfamidi.png', NULL, NULL, 0, NULL, 1, 1, 1, '2020-08-05 10:55:20', '2021-02-10 10:16:23'),
	(50, 'Mandiri Virtual Account', '', '', 'MANDIRIVA', 3, 'bank-mandiri-virtual-account.png', 'virtual-account', NULL, 0, NULL, 1, 1, 1, NULL, '2021-02-10 10:16:23'),
	(51, 'BRI Virtual Account ( Open Payment )', '', '', 'BRIVAOP', 13, 'bank-bri-virtual-account-open-payment.png', NULL, NULL, 0, NULL, 1, 1, 0, '2020-12-18 08:24:18', '2021-02-10 10:16:22'),
	(52, 'CIMB Niaga Virtual Account (Open Payment)', '', '', 'CIMBVAOP', 13, 'bank-cimb-niaga-virtual-account-open-payment.png', NULL, NULL, 0, NULL, 1, 1, 0, '2020-12-18 08:25:17', '2021-02-10 10:16:19'),
	(53, 'Sinarmas Virtual Account', '', '', 'SMSVA', 3, 'bank-sinarmas-virtual-account.png', NULL, NULL, 0, NULL, 1, 1, 1, '2020-12-18 08:29:05', '2021-02-10 10:16:20');
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.bank_kategoris
CREATE TABLE IF NOT EXISTS `bank_kategoris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(150) DEFAULT NULL,
  `paymethod` varchar(50) DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `type` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table tripay_webpulsa.bank_kategoris: ~8 rows (approximately)
/*!40000 ALTER TABLE `bank_kategoris` DISABLE KEYS */;
INSERT INTO `bank_kategoris` (`id`, `code`, `paymethod`, `icon`, `deskripsi`, `status`, `urutan`, `type`, `created_at`, `updated_at`) VALUES
	(1, '00', 'Transfer Bank', 'swift-details.png', 'Bayar dengan trasfer bank', 1, 1, 'transfer-bank', NULL, '2020-12-17 10:47:53'),
	(2, '01', 'Credit Card (CC)', 'creditcard.png', NULL, 0, 8, NULL, NULL, NULL),
	(3, '02', 'Virtual Account (VA)', 'virtualakun.png', 'Bayar dengan Virtual Akun <b style="color:red">24 Jam</b>', 1, 2, 'paymenttripay', NULL, '2021-02-10 10:16:19'),
	(6, '05', 'E-Wallet', 'e-wallet.png', NULL, 1, 5, NULL, NULL, NULL),
	(8, '07', 'Modern Channel', 'modern-channel.png', 'Bayar dengan Indomaret/Alfamart', 1, 4, 'paymenttripay', NULL, '2021-02-10 10:16:23'),
	(12, '11', 'QRIS', 'qris.png', 'Bayar dengan QRIS <b style="color:red">24 Jam</b>', 1, 6, 'paymenttripay', NULL, '2021-02-10 10:16:26'),
	(13, '03', 'Virtual Account Open Payment', NULL, 'Bayar dengan Virtual Akun <b style="color:red">24 Jam</b>', 1, 3, 'paymenttripay', NULL, NULL);
/*!40000 ALTER TABLE `bank_kategoris` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.bank_swifs
CREATE TABLE IF NOT EXISTS `bank_swifs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.bank_swifs: ~135 rows (approximately)
/*!40000 ALTER TABLE `bank_swifs` DISABLE KEYS */;
INSERT INTO `bank_swifs` (`id`, `name`, `code`) VALUES
	(1, 'BANK BRI', '002'),
	(2, 'BANK EKSPOR INDONESIA', '003'),
	(3, 'BANK MANDIRI', '008'),
	(4, 'BANK BNI', '009'),
	(5, 'BANK DANAMON', '011'),
	(6, 'PERMATA BANK', '013'),
	(7, 'BANK BCA', '014'),
	(8, 'BANK BII', '016'),
	(9, 'BANK PANIN', '019'),
	(10, 'BANK ARTA NIAGA KENCANA', '020'),
	(11, 'BANK NIAGA', '022'),
	(12, 'BANK BUANA IND', '023'),
	(13, 'BANK LIPPO', '026'),
	(14, 'BANK NISP', '028'),
	(15, 'AMERICAN EXPRESS BANK LTD', '030'),
	(16, 'CITIBANK N.A.', '031'),
	(17, 'JP. MORGAN CHASE BANK, N.A.', '032'),
	(18, 'BANK OF AMERICA, N.A', '033'),
	(19, 'ING INDONESIA BANK', '034'),
	(20, 'BANK MULTICOR TBK.', '036'),
	(21, 'BANK ARTHA GRAHA', '037'),
	(22, 'BANK CREDIT AGRICOLE INDOSUEZ', '039'),
	(23, 'THE BANGKOK BANK COMP. LTD', '040'),
	(24, 'THE HONGKONG & SHANGHAI B.C.', '041'),
	(25, 'THE BANK OF TOKYO MITSUBISHI UFJ LTD', '042'),
	(26, 'BANK SUMITOMO MITSUI INDONESIA', '045'),
	(27, 'BANK DBS INDONESIA', '046'),
	(28, 'BANK RESONA PERDANIA', '047'),
	(29, 'BANK MIZUHO INDONESIA', '048'),
	(30, 'STANDARD CHARTERED BANK', '050'),
	(31, 'BANK ABN AMRO', '052'),
	(32, 'BANK KEPPEL TATLEE BUANA', '053'),
	(33, 'BANK CAPITAL INDONESIA, TBK.', '054'),
	(34, 'BANK BNP PARIBAS INDONESIA', '057'),
	(35, 'BANK UOB INDONESIA', '058'),
	(36, 'KOREA EXCHANGE BANK DANAMON', '059'),
	(37, 'RABOBANK INTERNASIONAL INDONESIA', '060'),
	(38, 'ANZ PANIN BANK', '061'),
	(39, 'DEUTSCHE BANK AG.', '067'),
	(40, 'BANK WOORI INDONESIA', '068'),
	(41, 'BANK OF CHINA LIMITED', '069'),
	(42, 'BANK BUMI ARTA', '076'),
	(43, 'BANK EKONOMI', '087'),
	(44, 'BANK ANTARDAERAH', '088'),
	(45, 'BANK HAGA', '089'),
	(46, 'BANK IFI', '093'),
	(47, 'BANK CENTURY, TBK.', '095'),
	(48, 'BANK MAYAPADA', '097'),
	(49, 'BANK JABAR', '110'),
	(50, 'BANK DKI', '111'),
	(51, 'BPD DIY', '112'),
	(52, 'BANK JATENG', '113'),
	(53, 'BANK JATIM', '114'),
	(54, 'BPD JAMBI', '115'),
	(55, 'BPD ACEH', '116'),
	(56, 'BANK SUMUT', '117'),
	(57, 'BANK NAGARI', '118'),
	(58, 'BANK RIAU', '119'),
	(59, 'BANK SUMSEL', '120'),
	(60, 'BANK LAMPUNG', '121'),
	(61, 'BPD KALSEL', '122'),
	(62, 'BPD KALIMANTAN BARAT', '123'),
	(63, 'BPD KALTIM', '124'),
	(64, 'BPD KALTENG', '125'),
	(65, 'BPD SULSEL', '126'),
	(66, 'BANK SULUT', '127'),
	(67, 'BPD NTB', '128'),
	(68, 'BPD BALI', '129'),
	(69, 'BANK NTT', '130'),
	(70, 'BANK MALUKU', '131'),
	(71, 'BPD PAPUA', '132'),
	(72, 'BANK BENGKULU', '133'),
	(73, 'BPD SULAWESI TENGAH', '134'),
	(74, 'BANK SULTRA', '135'),
	(75, 'BANK NUSANTARA PARAHYANGAN', '145'),
	(76, 'BANK SWADESI', '146'),
	(77, 'BANK MUAMALAT', '147'),
	(78, 'BANK MESTIKA', '151'),
	(79, 'BANK METRO EXPRESS', '152'),
	(80, 'BANK SHINTA INDONESIA', '153'),
	(81, 'BANK MASPION', '157'),
	(82, 'BANK HAGAKITA', '159'),
	(83, 'BANK GANESHA', '161'),
	(84, 'BANK WINDU KENTJANA', '162'),
	(85, 'HALIM INDONESIA BANK', '164'),
	(86, 'BANK HARMONI INTERNATIONAL', '166'),
	(87, 'BANK KESAWAN', '167'),
	(88, 'BANK TABUNGAN NEGARA (PERSERO)', '200'),
	(89, 'BANK HIMPUNAN SAUDARA 1906, TBK .', '212'),
	(90, 'BANK TABUNGAN PENSIUNAN NASIONAL', '213'),
	(91, 'BANK SWAGUNA', '405'),
	(92, 'BANK JASA ARTA', '422'),
	(93, 'BANK MEGA', '426'),
	(94, 'BANK JASA JAKARTA', '427'),
	(95, 'BANK BUKOPIN', '441'),
	(96, 'BANK SYARIAH MANDIRI', '451'),
	(97, 'BANK BISNIS INTERNASIONAL', '459'),
	(98, 'BANK SRI PARTHA', '466'),
	(99, 'BANK JASA JAKARTA', '472'),
	(100, 'BANK BINTANG MANUNGGAL', '484'),
	(101, 'BANK BUMIPUTERA', '485'),
	(102, 'BANK YUDHA BHAKTI', '490'),
	(103, 'BANK MITRANIAGA', '491'),
	(104, 'BANK AGRO NIAGA', '494'),
	(105, 'BANK INDOMONEX', '498'),
	(106, 'BANK ROYAL INDONESIA', '501'),
	(107, 'BANK ALFINDO', '503'),
	(108, 'BANK SYARIAH MEGA', '506'),
	(109, 'BANK INA PERDANA', '513'),
	(110, 'BANK HARFA', '517'),
	(111, 'PRIMA MASTER BANK', '520'),
	(112, 'BANK PERSYARIKATAN INDONESIA', '521'),
	(113, 'BANK AKITA', '525'),
	(114, 'LIMAN INTERNATIONAL BANK', '526'),
	(115, 'ANGLOMAS INTERNASIONAL BANK', '531'),
	(116, 'BANK DIPO INTERNATIONAL', '523'),
	(117, 'BANK KESEJAHTERAAN EKONOMI', '535'),
	(118, 'BANK UIB', '536'),
	(119, 'BANK ARTOS IND', '542'),
	(120, 'BANK PURBA DANARTA', '547'),
	(121, 'BANK MULTI ARTA SENTOSA', '548'),
	(122, 'BANK MAYORA', '553'),
	(123, 'BANK INDEX SELINDO', '555'),
	(124, 'BANK VICTORIA INTERNATIONAL', '566'),
	(125, 'BANK EKSEKUTIF', '558'),
	(126, 'CENTRATAMA NASIONAL BANK', '559'),
	(127, 'BANK FAMA INTERNASIONAL', '562'),
	(128, 'BANK SINAR HARAPAN BALI', '564'),
	(129, 'BANK HARDA', '567'),
	(130, 'BANK FINCONESIA', '945'),
	(131, 'BANK MERINCORP', '946'),
	(132, 'BANK MAYBANK INDOCORP', '947'),
	(133, 'BANK OCBC – INDONESIA', '948'),
	(134, 'BANK CHINA TRUST INDONESIA', '949'),
	(135, 'BANK COMMONWEALTH', '950');
/*!40000 ALTER TABLE `bank_swifs` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.banner
CREATE TABLE IF NOT EXISTS `banner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name_img` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_path` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_img` enum('slider member','slider home','background home','banner') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.banner: ~0 rows (approximately)
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.blokir_telephone
CREATE TABLE IF NOT EXISTS `blokir_telephone` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.blokir_telephone: ~0 rows (approximately)
/*!40000 ALTER TABLE `blokir_telephone` DISABLE KEYS */;
/*!40000 ALTER TABLE `blokir_telephone` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.deposits
CREATE TABLE IF NOT EXISTS `deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bank_id` bigint(20) unsigned NOT NULL,
  `bank_kategori_id` int(10) unsigned DEFAULT 0,
  `code_unik` int(11) DEFAULT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal` int(11) NOT NULL DEFAULT 0,
  `nominal_trf` int(11) NOT NULL DEFAULT 0,
  `note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `expire` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) unsigned NOT NULL,
  `bukti` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `payment_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deposits_bank_id_foreign` (`bank_id`),
  KEY `deposits_user_id_foreign` (`user_id`),
  CONSTRAINT `deposits_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.deposits: ~18 rows (approximately)
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
INSERT INTO `deposits` (`id`, `bank_id`, `bank_kategori_id`, `code_unik`, `payment_id`, `nominal`, `nominal_trf`, `note`, `status`, `expire`, `user_id`, `bukti`, `payment_url`, `created_at`, `updated_at`) VALUES
	(1, 36, 1, 794, NULL, 100000, 100794, 'Deposit kadaluarsa silahkan request ulang atau hubungi Administrator jika sudah terlanjur melakukan pembayaran', 2, 0, 4, '', NULL, '2020-11-25 12:47:33', '2020-11-26 13:22:51'),
	(2, 48, 12, 0, NULL, 100000, 100000, 'Deposit sebesar Rp 100.000 berhasil ditambahkan, saldo sekarang Rp 830.070.', 1, 0, 4, '', 'https://payment.tripay.co.id/checkout/DEV-T09460000002323UEQ81', '2020-11-26 13:13:30', '2020-11-26 13:19:34'),
	(3, 40, 8, 0, NULL, 100000, 100000, 'Deposit kadaluarsa silahkan request ulang atau hubungi Administrator jika sudah terlanjur melakukan pembayaran', 2, 0, 4, '', 'https://payment.tripay.co.id/checkout/DEV-T09460000002324WQK6C', '2020-11-26 13:14:17', '2020-12-11 13:17:01'),
	(7, 35, 1, 407, NULL, 100000, 100407, 'Deposit kadaluarsa silahkan request ulang atau hubungi Administrator jika sudah terlanjur melakukan pembayaran', 2, 0, 4, '', NULL, '2020-12-18 09:04:04', '2020-12-26 10:38:58'),
	(10, 16, 3, 0, NULL, 100000, 100000, 'Deposit kadaluarsa silahkan request ulang atau hubungi Administrator jika sudah terlanjur melakukan pembayaran', 2, 0, 4, '', 'https://payment.tripay.co.id/checkout/T1634000023238510HTI', '2020-12-18 09:12:54', '2020-12-26 10:38:58'),
	(11, 20, 3, 0, NULL, 100000, 100000, 'Deposit kadaluarsa silahkan request ulang atau hubungi Administrator jika sudah terlanjur melakukan pembayaran', 2, 0, 4, '', 'https://payment.tripay.co.id/checkout/T16340000232526X41FV', '2020-12-18 10:11:57', '2020-12-26 10:38:58'),
	(12, 20, 3, 0, NULL, 100000, 100000, 'Deposit kadaluarsa silahkan request ulang atau hubungi Administrator jika sudah terlanjur melakukan pembayaran', 2, 0, 4, '', 'https://payment.tripay.co.id/checkout/T16340000232986YAG5N', '2020-12-18 13:50:39', '2020-12-26 10:38:58'),
	(13, 20, 3, 0, NULL, 100000, 100000, 'Deposit kadaluarsa silahkan request ulang atau hubungi Administrator jika sudah terlanjur melakukan pembayaran', 2, 0, 4, '', 'https://payment.tripay.co.id/checkout/T16340000233722SDKGS', '2020-12-18 21:06:26', '2020-12-26 10:38:58'),
	(14, 18, 3, 0, NULL, 100000, 100000, 'Deposit sebesar Rp 100.000 berhasil ditambahkan, GisCoin anda sekarang 9.52', 1, 0, 4, '', 'https://payment.tripay.co.id/checkout/T16340000234182YWMDZ', '2020-12-19 08:38:37', '2020-12-19 09:08:29'),
	(15, 51, 3, 0, NULL, 100000, 100000, 'Deposit sebesar Rp 100.000 berhasil ditambahkan, GISCO anda sekarang 18.52', 1, 0, 4, '', NULL, '2020-12-19 10:51:44', '2020-12-19 10:51:44'),
	(17, 42, 9, 557, NULL, 200000, 201557, 'Pembayaran telah di konfirmasi, proses validasi.', 1, 1, 4, 'bukti_171608900041.png', NULL, '2020-12-25 19:40:08', '2020-12-25 19:40:41'),
	(18, 33, 1, 985, NULL, 300000, 301985, 'Deposit sebesar Rp 301.985 berhasil ditambahkan, saldo sekarang Rp 302.084', 1, 0, 4, 'bukti_181608900448.png', NULL, '2020-12-25 19:47:17', '2020-12-25 19:48:04'),
	(20, 16, 3, 0, NULL, 100000, 101000, 'Deposit sebesar Rp 100.000 berhasil ditambahkan, GISCO anda sekarang 15.57', 1, 0, 4, '', 'https://payment.tripay.co.id/checkout/T16340000244896R4GP8', '2020-12-26 10:27:58', '2020-12-26 10:32:50'),
	(21, 16, 3, 0, NULL, 100000, 101000, 'Deposit sebesar Rp 100.000 berhasil ditambahkan, GISCO anda sekarang 25.09', 1, 0, 4, '', 'https://payment.tripay.co.id/checkout/T16340000244911SQXU6', '2020-12-26 10:35:49', '2020-12-26 10:36:28'),
	(22, 35, 1, 487, NULL, 50000, 50487, 'Deposit sebesar Rp 50.487 berhasil ditambahkan, saldo sekarang 29.85 GISCO', 1, 0, 4, 'bukti_221608954212.png', NULL, '2020-12-26 10:43:22', '2020-12-26 11:07:57'),
	(23, 18, 3, 0, NULL, 100000, 101000, 'Menunggu pembayaran sebesar Rp 100.000', 0, 1, 4, '', 'https://payment.tripay.co.id/checkout/T163400002449299RFXK', '2020-12-26 10:54:12', '2020-12-26 10:54:18'),
	(24, 49, 8, 0, NULL, 200000, 201000, 'Menunggu pembayaran sebesar Rp 200.000', 0, 1, 4, '', 'https://payment.tripay.co.id/checkout/T16340000265573NCJEC', '2021-01-08 16:42:02', '2021-01-08 16:42:06'),
	(26, 18, 3, 0, NULL, 50000, 51000, 'Menunggu pembayaran sebesar Rp 50.000', 0, 1, 4, '', 'https://payment.tripay.co.id/checkout/T00650000325779WIMVL', '2021-02-10 12:59:56', '2021-02-10 13:00:07');
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.faqs
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pertanyaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jawaban` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.faqs: ~0 rows (approximately)
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.gudang_pembelianproduks
CREATE TABLE IF NOT EXISTS `gudang_pembelianproduks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_x` bigint(20) unsigned NOT NULL,
  `description_x` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_x` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_alias_x` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `substitute_x` int(11) NOT NULL,
  `price_x` int(11) NOT NULL,
  `profit_max_x` int(11) NOT NULL,
  `h2h_x` int(11) NOT NULL,
  `h2h_lock_x` int(11) NOT NULL,
  `h2h_max_x` int(11) NOT NULL,
  `price_host_x` int(11) NOT NULL,
  `nominal_x` int(11) NOT NULL,
  `operator_x` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_sub_x` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_x` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_x` int(11) NOT NULL,
  `status_x` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `block_x` int(11) NOT NULL,
  `date_update_x` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `provider_x` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_sub_x` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.gudang_pembelianproduks: ~0 rows (approximately)
/*!40000 ALTER TABLE `gudang_pembelianproduks` DISABLE KEYS */;
/*!40000 ALTER TABLE `gudang_pembelianproduks` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.informasis
CREATE TABLE IF NOT EXISTS `informasis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi_informasi` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `informasis_user_id_foreign` (`user_id`),
  CONSTRAINT `informasis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.informasis: ~0 rows (approximately)
/*!40000 ALTER TABLE `informasis` DISABLE KEYS */;
/*!40000 ALTER TABLE `informasis` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.jobs: ~13 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
	(1, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:18:\\"admin@tripay.co.id\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 1, 1606185366, 1597149047, 1597149047),
	(2, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:2;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:22:\\"fauzankemal4@gmail.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1598680200, 1598680200),
	(3, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:3;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:22:\\"putubaladewa@gmail.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1598687856, 1598687856),
	(4, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:4;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:23:\\"bayusegara623@gmail.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1598835459, 1598835459),
	(5, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:5;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:33:\\"pastisuksesduniaakhirat@gmail.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1598880663, 1598880663),
	(6, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:6;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:26:\\"rifkyprasetya129@gmail.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1599881067, 1599881067),
	(7, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:7;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:19:\\"ahmadi@tripay.co.id\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1600269437, 1600269437),
	(8, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:8;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:17:\\"ginarsa@gmail.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1600507486, 1600507486),
	(9, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:9;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:20:\\"adysaifull@gmail.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1601571860, 1601571860),
	(10, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:10;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:23:\\"dedenurdin879@gmail.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1601965374, 1601965374),
	(11, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:11;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:21:\\"marlita1979@yahoo.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1602041545, 1602041545),
	(12, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:12;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:20:\\"rusdisgd01@gmail.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1604385365, 1604385365),
	(13, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:13;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:20:\\"bagus.ok55@gmail.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1604846005, 1604846005),
	(14, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:16;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:21:\\"bsegara2903@gmail.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1613009197, 1613009197),
	(15, 'default', '{"displayName":"App\\\\Mail\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":3:{s:8:\\"mailable\\";O:18:\\"App\\\\Mail\\\\SendEmail\\":24:{s:5:\\"users\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:8:\\"App\\\\User\\";s:2:\\"id\\";i:17;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:7:\\"setting\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:20:\\"App\\\\AppModel\\\\Setting\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:6:\\"locale\\";N;s:4:\\"from\\";a:0:{}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";N;s:7:\\"address\\";s:21:\\"Yuzuriha217@gmail.com\\";}}s:2:\\"cc\\";a:0:{}s:3:\\"bcc\\";a:0:{}s:7:\\"replyTo\\";a:0:{}s:7:\\"subject\\";N;s:11:\\"\\u0000*\\u0000markdown\\";N;s:7:\\"\\u0000*\\u0000html\\";N;s:4:\\"view\\";N;s:8:\\"textView\\";N;s:8:\\"viewData\\";a:0:{}s:11:\\"attachments\\";a:0:{}s:14:\\"rawAttachments\\";a:0:{}s:15:\\"diskAttachments\\";a:0:{}s:9:\\"callbacks\\";a:0:{}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;}"}}', 0, NULL, 1613012586, 1613012586);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.layanan_bantuan
CREATE TABLE IF NOT EXISTS `layanan_bantuan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.layanan_bantuan: ~2 rows (approximately)
/*!40000 ALTER TABLE `layanan_bantuan` DISABLE KEYS */;
INSERT INTO `layanan_bantuan` (`id`, `icon`, `title`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'mobile-phone', 'Hp.', '081234567890', '2020-08-11 19:15:00', '2020-08-04 03:11:50'),
	(2, 'envelope-o', 'email', 'cs@p-store.net', '2020-08-11 19:15:07', '2020-08-04 03:11:50');
/*!40000 ALTER TABLE `layanan_bantuan` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.logos
CREATE TABLE IF NOT EXISTS `logos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.logos: ~3 rows (approximately)
/*!40000 ALTER TABLE `logos` DISABLE KEYS */;
INSERT INTO `logos` (`id`, `type`, `name`, `img`, `created_at`, `updated_at`) VALUES
	(1, 'icon', 'icon', 'fc33bca0-50f0-11eb-84be-25ebaf240a90.png', '2021-01-07 21:02:32', '2021-01-07 21:02:32'),
	(2, 'logo-guest', 'logo guest', 'fcb72b30-50f0-11eb-83f7-974cb398bf72.png', '2021-01-07 21:02:32', '2021-01-07 21:02:32'),
	(3, 'logo-member-admin', 'logo member admin', '4a418ce0-50f1-11eb-8525-dbed63067155.png', '2021-01-07 21:04:42', '2021-01-07 21:04:42');
/*!40000 ALTER TABLE `logos` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.memberships
CREATE TABLE IF NOT EXISTS `memberships` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `from_role` bigint(20) unsigned NOT NULL,
  `to_role` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `tgl_validasi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `memberships_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.memberships: ~0 rows (approximately)
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships` (`id`, `user_id`, `from_role`, `to_role`, `status`, `tgl_validasi`, `created_at`, `updated_at`) VALUES
	(1, 4, 2, 3, 2, '2020-12-25 20:05:46', '2020-12-25 20:05:20', '2020-12-25 20:05:46'),
	(2, 16, 1, 3, 1, '2021-02-11 09:09:23', '2021-02-11 09:08:48', '2021-02-11 09:09:23');
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.menu_dashboard
CREATE TABLE IF NOT EXISTS `menu_dashboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `jenis` varchar(25) NOT NULL,
  `sort_menu` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table tripay_webpulsa.menu_dashboard: ~22 rows (approximately)
/*!40000 ALTER TABLE `menu_dashboard` DISABLE KEYS */;
INSERT INTO `menu_dashboard` (`id`, `product_name`, `slug`, `icon`, `jenis`, `sort_menu`, `created_at`, `updated_at`) VALUES
	(1, 'PULSA ALL OPERATOR', 'pulsa-all-operator', 'mobile', 'pembelian', 1, NULL, NULL),
	(2, 'PULSA TRANSFER', 'pulsa-transfer', 'forward', 'pembelian', 2, NULL, NULL),
	(3, 'PAKET DATA', 'paket-data', 'internet-explorer', 'pembelian', 6, NULL, NULL),
	(4, 'E-MONEY', 'e-money', 'money', 'pembelian', 15, NULL, NULL),
	(5, 'E-TOLL', 'e-toll', 'road', 'pembelian', 10, NULL, NULL),
	(6, 'TOKEN LISTRIK', 'token-listrik', 'bolt', 'pembelian', 4, NULL, NULL),
	(7, 'VOUCHER GOOGLE PLAY', 'voucher-google-play', 'google-wallet', 'pembelian', 11, NULL, NULL),
	(8, 'VOUCHER GAME', 'voucher-game', 'gamepad', 'pembelian', 12, NULL, NULL),
	(9, 'VOUCHER WIFI.ID', 'voucher-wifiid', 'wifi', 'pembelian', 13, NULL, NULL),
	(10, 'FREE FIRE DIAMOND', 'free-fire-diamond', 'gamepad', 'pembelian', 19, NULL, NULL),
	(11, 'PUBG MOBILE UC', 'pubg-mobile-uc', 'gamepad', 'pembelian', 20, NULL, NULL),
	(12, 'SPEED DRIFTERS DIAMOND', 'speed-drifters-diamond', 'gamepad', 'pembelian', 21, NULL, NULL),
	(13, 'VOUCHER', 'voucher', 'ticket', 'pembelian', 16, NULL, NULL),
	(14, 'PEMBAYARAN PDAM', 'pembayaran-pdam', 'tint', 'pembayaran', 8, NULL, NULL),
	(15, 'PEMBAYARAN PLN', 'pembayaran-pln', 'lightbulb-o', 'pembayaran', 3, NULL, NULL),
	(16, 'PEMBAYARAN INTERNET', 'pembayaran-internet', 'internet-explorer', 'pembayaran', 7, NULL, NULL),
	(17, 'PEMBAYARAN BPJS', 'pembayaran-bpjs', 'heartbeat', 'pembayaran', 17, NULL, NULL),
	(18, 'PEMBAYARAN GAS NEGARA', 'pembayaran-gas-negara', 'industry', 'pembayaran', 9, NULL, NULL),
	(19, 'PEMBAYARAN MULTIFINANCE', 'pembayaran-multifinance', 'handshake-o', 'pembayaran', 18, NULL, NULL),
	(20, 'LAYANAN BANTUAN', 'layanan-bantuan', 'envelope', 'other', 22, NULL, NULL),
	(21, 'F.A.Q', 'faq', 'question-circle', 'other', 24, NULL, NULL),
	(22, 'TRANSFER KE BANK', 'transfer-bank', 'random', 'manual', 14, NULL, NULL);
/*!40000 ALTER TABLE `menu_dashboard` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.menu_members
CREATE TABLE IF NOT EXISTS `menu_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_induk` bigint(20) unsigned NOT NULL,
  `urutan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `treeview` int(11) NOT NULL,
  `data_table` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `status` int(11) NOT NULL,
  `permission_menu` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_menu` (`permission_menu`),
  CONSTRAINT `menu_members_ibfk_1` FOREIGN KEY (`permission_menu`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.menu_members: ~22 rows (approximately)
/*!40000 ALTER TABLE `menu_members` DISABLE KEYS */;
INSERT INTO `menu_members` (`id`, `id_induk`, `urutan`, `nama`, `icon`, `url`, `treeview`, `data_table`, `status`, `permission_menu`) VALUES
	(1, 0, NULL, 'Transaksi', NULL, NULL, 0, '-', 1, 1),
	(2, 0, NULL, 'Saldo', NULL, NULL, 0, '-', 1, 1),
	(3, 0, NULL, 'Profile', NULL, NULL, 0, '-', 1, 1),
	(4, 0, NULL, 'Administrator', NULL, NULL, 0, '-', 1, 2),
	(9, 1, '1', 'Riwayat Transaksi', 'history', '/member/riwayat-transaksi', 0, '-', 1, 1),
	(10, 1, '3', 'Tagihan Pembayaran', 'credit-card', '/member/tagihan-pembayaran', 0, '-', 1, 1),
	(11, 1, '5', 'Harga Produk', 'dropbox', '#', 1, 'pembeliankategoris, pembayarankategoris', 1, 1),
	(12, 1, '4', 'Bonus Trx & Referal', 'users', '/member/komisi-trx-ref', 0, '-', 1, 1),
	(14, 2, '1', 'Deposit Saldo', 'money', '/member/deposit', 0, '-', 1, 1),
	(15, 2, '2', 'Kirim Saldo', 'exchange', '/member/transfer-saldo', 0, '-', 1, 1),
	(16, 2, '3', 'Redeem Voucher', 'gift', '/member/redeem-voucher', 0, '-', 1, 1),
	(17, 2, '4', 'Mutasi Saldo', 'table', '/member/mutasi-saldo', 0, '-', 1, 1),
	(19, 3, '1', 'Profile Saya', 'user', '/member/biodata', 0, '-', 1, 1),
	(20, 3, '2', 'Layanan Bantuan', 'inbox', '/member/messages', 0, '-', 1, 1),
	(22, 3, '3', 'Validasi User', 'address-card', '/member/validasi-users', 0, '-', 1, 1),
	(23, 3, '5', 'Referral', 'users', '/member/referral', 0, '-', 1, 1),
	(24, 3, '6', 'Logout', 'unlock', '/logout', 0, '-', 1, 1),
	(25, 4, '7', 'Admin Panel', 'cogs', '/admin', 0, '-', 1, 2),
	(26, 3, '4', 'Membership', 'address-card-o', '/member/membership', 0, '-', 1, 1),
	(30, 2, '5', 'Transfer ke Bank', 'random', '/member/transfer-bank', 0, '-', 1, 1),
	(31, 1, '2', 'Riwayat Transfer Bank', 'search', '/member/transfer-bank/history', 0, '-', 1, 1),
	(36, 1, '6', 'Riwayat Deposit', 'history', '/member/riwayat_deposit', 0, '-', 1, 1);
/*!40000 ALTER TABLE `menu_members` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from` bigint(20) unsigned NOT NULL,
  `to` bigint(20) unsigned NOT NULL,
  `type` enum('direct','reply') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_reply` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `induk_message` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `to` (`to`),
  KEY `from` (`from`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.migrations: ~0 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.mutasis
CREATE TABLE IF NOT EXISTS `mutasis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `trxid` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` bigint(20) unsigned NOT NULL DEFAULT 0,
  `saldo` bigint(20) unsigned NOT NULL DEFAULT 0,
  `note` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mutasis_user_id_foreign` (`user_id`),
  CONSTRAINT `mutasis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.mutasis: ~69 rows (approximately)
/*!40000 ALTER TABLE `mutasis` DISABLE KEYS */;
INSERT INTO `mutasis` (`id`, `user_id`, `trxid`, `type`, `nominal`, `saldo`, `note`, `created_at`, `updated_at`) VALUES
	(1, 4, NULL, 'kredit', 100000, 100000, '+ SALDO MANUAL Rp.100000', '2020-11-23 13:18:54', '2020-11-23 13:18:54'),
	(2, 4, 1, 'debit', 2390, 97610, 'TRANSAKSI INDOSAT 2.000 085733337229', '2020-11-23 13:23:37', '2020-11-23 13:23:38'),
	(3, 4, 1, 'credit', 2390, 100000, 'TRANSAKSI INDOSAT 2.000 085733337229 GAGAL', '2020-11-23 13:23:38', '2020-11-23 13:23:38'),
	(4, 4, NULL, 'debit', 1720, 98280, 'TRANSAKSI THREE 1.000 08987499383', '2020-11-23 21:00:57', '2020-11-23 21:00:57'),
	(5, 4, NULL, 'debit', 2696, 95584, 'TRANSAKSI THREE 2.000 08987499383', '2020-11-23 21:05:10', '2020-11-23 21:05:10'),
	(6, 4, 2, 'debit', 2290, 93294, 'TRANSAKSI INDOSAT 2.000 085733337229', '2020-11-24 09:29:25', '2020-11-24 09:29:25'),
	(7, 4, 2, 'credit', 2290, 95584, 'TRANSAKSI INDOSAT 2.000 085733337229 GAGAL', '2020-11-24 09:29:25', '2020-11-24 09:29:25'),
	(8, 4, NULL, 'debit', 2290, 93294, 'TRANSAKSI INDOSAT 2.000 085733337229', '2020-11-24 09:35:12', '2020-11-24 09:35:12'),
	(9, 4, NULL, 'debit', 2290, 91004, 'TRANSAKSI INDOSAT 2.000 085733337229', '2020-11-24 09:47:03', '2020-11-24 09:47:03'),
	(10, 4, 5, 'debit', 2290, 88714, 'TRANSAKSI INDOSAT 2.000 085733337229', '2020-11-24 09:47:47', '2020-11-24 09:47:50'),
	(11, 4, 5, 'credit', 2290, 91004, 'TRANSAKSI INDOSAT 2.000 085733337229 GAGAL', '2020-11-24 09:47:50', '2020-11-24 09:47:50'),
	(12, 4, 6, 'debit', 5980, 85024, 'TRANSAKSI INDOSAT 5.000 085733337229', '2020-11-24 10:02:46', '2020-11-24 10:02:47'),
	(13, 4, 7, 'debit', 11225, 73799, 'TRANSAKSI INDOSAT 10.000 085733337229', '2020-11-24 12:23:37', '2020-11-24 12:23:38'),
	(14, 4, 8, 'debit', 1620, 72179, 'TRANSAKSI THREE 1.000 08987499383', '2020-11-24 12:29:01', '2020-11-24 12:29:02'),
	(15, 3, 142459, 'credit', 50, 50, 'BONUS TRANSAKSI REFERRAL (Bayu Segara, #8)', '2020-11-24 12:33:19', '2020-11-24 12:33:19'),
	(21, 4, 9, 'debit', 1979, 70200, 'TRANSAKSI TELKOMSEL 1.000 082234444413', '2020-11-24 21:40:17', '2020-11-24 21:40:18'),
	(22, 2, 142516, 'credit', 100, 200, 'BONUS TRANSAKSI REFERRAL (Bayu Segara, #9)', '2020-11-25 08:02:29', '2020-11-25 08:02:29'),
	(23, 1, 142516, 'credit', 100, 200, 'BONUS TRANSAKSI REFERRAL (Bayu Segara, #9)', '2020-11-25 08:02:29', '2020-11-25 08:02:29'),
	(24, 4, 10, 'debit', 3154, 67046, 'TRANSAKSI TELKOMSEL 2.000 082234444413', '2020-11-25 08:09:42', '2020-11-25 08:09:43'),
	(25, 2, 142546, 'credit', 100, 300, 'BONUS TRANSAKSI REFERRAL (Bayu Segara, #10)', '2020-11-25 08:12:04', '2020-11-25 08:12:04'),
	(26, 1, 142546, 'credit', 100, 300, 'BONUS TRANSAKSI REFERRAL (Bayu Segara, #10)', '2020-11-25 08:12:04', '2020-11-25 08:12:04'),
	(27, 4, 11, 'debit', 4189, 62857, 'TRANSAKSI TELKOMSEL 3.000 082234444413', '2020-11-25 08:14:57', '2020-11-25 08:14:58'),
	(28, 3, 142547, 'credit', 200, 400, 'BONUS TRANSAKSI REFERRAL (Bayu Segara, #11)', '2020-11-25 08:15:37', '2020-11-25 08:15:37'),
	(29, 2, 142547, 'credit', 100, 400, 'BONUS TRANSAKSI REFERRAL (Bayu Segara, #11)', '2020-11-25 08:15:37', '2020-11-25 08:15:37'),
	(30, 4, NULL, 'debit', 100000, 528570, 'TRANSAKSI Pemindahan Saldo Rp. 100.000 Ke BANK BRI (002) no.rekening 005701000529566', '2020-11-26 08:45:49', '2020-11-26 08:45:49'),
	(31, 4, NULL, 'debit', 3500, 525070, 'Biaya Admin Transfer Saldo Ke Bank ID: #30', '2020-11-26 08:45:51', '2020-11-26 08:45:51'),
	(32, 4, NULL, 'credit', 100000, 625070, 'TRANSAKSI Pemindahan Saldo Rp. 100.000 Ke BANK BRI (002) no.rekening 005701000529566. Gagal, Saldo dikembalikan', '2020-11-26 08:46:14', '2020-11-26 08:46:14'),
	(33, 4, NULL, 'credit', 2500, 627570, 'Pengembalian Biaya Admin Transfer Saldo ID:#1 Rp.2.500 dikembalikan', '2020-11-26 08:46:19', '2020-11-26 08:46:19'),
	(34, 4, NULL, 'credit', 100000, 727570, 'TRANSAKSI Pemindahan Saldo Rp. 100.000 Ke BANK BRI (002) no.rekening 005701000529566. Refund, Saldo dikembalikan', '2020-11-26 08:46:38', '2020-11-26 08:46:38'),
	(35, 4, NULL, 'credit', 2500, 730070, 'Pengembalian Biaya Admin Transfer Saldo ID:#1 Rp.2.500 dikembalikan', '2020-11-26 08:46:43', '2020-11-26 08:46:43'),
	(36, 4, 2, 'credit', 100000, 830070, 'DEPOSIT/TOP-UP SALDO via QRIS', '2020-11-26 13:19:34', '2020-11-26 13:19:34'),
	(37, 4, 14, 'credit', 100000, 930070, 'DEPOSIT/TOP-UP SALDO via BNI Virtual Account', '2020-12-19 08:53:58', '2020-12-19 08:53:58'),
	(38, 4, 14, 'credit', 100000, 1030070, 'DEPOSIT/TOP-UP SALDO via BNI Virtual Account', '2020-12-19 08:56:31', '2020-12-19 08:56:31'),
	(39, 4, 14, 'credit', 100000, 9, 'DEPOSIT/TOP-UP SALDO via BNI Virtual Account', '2020-12-19 09:08:29', '2020-12-19 09:08:29'),
	(40, 4, 15, 'credit', 100000, 18, 'DEPOSIT/TOP-UP SALDO via BRI Virtual Account ( Open Payment )', '2020-12-19 10:51:44', '2020-12-19 10:51:44'),
	(41, 4, NULL, 'debit', 2, 16, 'TRANSFER SALDO KE 081234567890 BERHASIL', '2020-12-23 22:20:41', '2020-12-23 22:20:41'),
	(42, 1, NULL, 'credit', 2, 202, 'SALDO TRANSFER DARI 08987499383', '2020-12-23 22:20:41', '2020-12-23 22:20:41'),
	(43, 4, NULL, 'debit', 100000, 6, 'TRANSAKSI Pemindahan Saldo Rp. 100.000 Ke BANK BRI (002) no.rekening 005701000529566', '2020-12-24 07:54:05', '2020-12-24 07:54:05'),
	(44, 4, NULL, 'debit', 3500, 85, 'Biaya Admin Transfer Saldo Ke Bank ID: #43', '2020-12-24 07:54:08', '2020-12-24 07:54:08'),
	(49, 4, NULL, 'debit', 100000, 75, 'TRANSAKSI Pemindahan Saldo Rp. 100.000 Ke BANK BRI (002) no.rekening 005701000529566', '2020-12-24 08:17:43', '2020-12-24 08:17:43'),
	(50, 4, NULL, 'debit', 3500, 75, 'Biaya Admin Transfer Saldo Ke Bank ID: #49', '2020-12-24 08:17:45', '2020-12-24 08:17:45'),
	(51, 4, NULL, 'debit', 52500, 70, 'TRANSFER SALDO KE 081234567890 BERHASIL', '2020-12-24 08:20:05', '2020-12-24 08:20:05'),
	(52, 1, NULL, 'credit', 52500, 207, 'SALDO TRANSFER DARI 08987499383', '2020-12-24 08:20:05', '2020-12-24 08:20:05'),
	(53, 4, 11, 'credit', 3954, 70, 'REFUND TRX TELKOMSEL 3.000 082234444413', '2020-12-24 13:27:15', '2020-12-24 13:27:15'),
	(54, 4, 11, 'credit', 3954, 70, 'REFUND TRX TELKOMSEL 3.000 082234444413', '2020-12-24 13:37:52', '2020-12-24 13:37:52'),
	(55, 4, 11, 'credit', 3954, 70, 'REFUND TRX TELKOMSEL 3.000 082234444413', '2020-12-24 13:41:23', '2020-12-24 13:41:23'),
	(56, 4, 11, 'credit', 3954, 70, 'REFUND TRX TELKOMSEL 3.000 082234444413', '2020-12-24 19:56:11', '2020-12-24 19:56:11'),
	(57, 4, 10, 'credit', 2954, 70, 'REFUND TRX TELKOMSEL 2.000 082234444413', '2020-12-24 19:56:37', '2020-12-24 19:56:37'),
	(58, 4, NULL, 'kredit', 6, 76, '+ SALDO MANUAL Rp.06', '2020-12-25 09:14:23', '2020-12-25 09:14:23'),
	(59, 4, NULL, 'kredit', 9, 85, '+ SALDO MANUAL Rp.9', '2020-12-25 09:14:53', '2020-12-25 09:14:53'),
	(60, 4, NULL, 'kredit', 9, 94, '+ SALDO MANUAL Rp.09', '2020-12-25 09:15:00', '2020-12-25 09:15:00'),
	(61, 4, NULL, 'kredit', 84000, 111, '+ SALDO MANUAL 8 GISCO', '2020-12-25 09:47:19', '2020-12-25 09:47:19'),
	(62, 4, NULL, 'debet', 105000, 101, '- SALDO MANUAL 10 GISCO', '2020-12-25 09:47:29', '2020-12-25 09:47:29'),
	(63, 4, NULL, 'debit', 73500, 94, 'TRANSFER SALDO KE 081234567890 BERHASIL', '2020-12-25 10:04:37', '2020-12-25 10:04:37'),
	(64, 1, NULL, 'credit', 73500, 214, 'SALDO TRANSFER DARI 08987499383', '2020-12-25 10:04:37', '2020-12-25 10:04:37'),
	(65, 4, NULL, 'credit', 52500, 99, 'REDEEM VOUCHER 0000000005.00 GISCO BERHASIL', '2020-12-25 11:04:24', '2020-12-25 11:04:24'),
	(66, 4, 18, 'credit', 300000, 127, 'DEPOSIT/TOP-UP SALDO', '2020-12-24 19:48:04', '2020-12-25 19:48:04'),
	(67, 4, NULL, 'debit', 200000, 107, 'TRANSAKSI Pemindahan Saldo Rp. 200.000 Ke BANK BRI (002) no.rekening 388801035360537', '2020-12-25 20:09:54', '2020-12-25 20:09:54'),
	(68, 4, NULL, 'debit', 3500, 12, 'Biaya Admin Transfer Saldo Ke Bank ID: #67', '2020-12-25 20:09:56', '2020-12-25 20:09:56'),
	(69, 4, NULL, 'debit', 57750, 6, 'TRANSFER SALDO KE 081234567890 BERHASIL', '2020-12-25 20:33:53', '2020-12-25 20:33:53'),
	(70, 1, NULL, 'credit', 57750, 219, 'SALDO TRANSFER DARI 08987499383', '2020-12-25 20:33:53', '2020-12-25 20:33:53'),
	(71, 4, NULL, 'debit', 1468, 6, 'TRANSAKSI THREE 1.000 08987499383', '2020-12-25 22:58:25', '2020-12-25 22:58:25'),
	(72, 4, 13, 'debit', 1468, 6, 'TRANSAKSI THREE 1.000 08987499383', '2020-12-25 23:14:28', '2020-12-25 23:14:29'),
	(73, 3, 145822, 'credit', 0, 200, 'BONUS TRANSAKSI REFERRAL (Bayu Segara, #145822)', '2020-12-25 23:23:12', '2020-12-25 23:23:12'),
	(74, 4, 14, 'debit', 1779, 6, 'TRANSAKSI TELKOMSEL 1.000 082131445043', '2020-12-26 07:29:32', '2020-12-26 07:29:32'),
	(75, 3, 145866, 'credit', 0, 200, 'BONUS TRANSAKSI REFERRAL (Bayu Segara, #14)', '2020-12-26 10:15:08', '2020-12-26 10:15:08'),
	(76, 4, 20, 'credit', 100000, 16, 'DEPOSIT/TOP-UP SALDO via Permata Virtual Account', '2020-12-26 10:32:50', '2020-12-26 10:32:50'),
	(77, 4, 21, 'credit', 100000, 25, 'DEPOSIT/TOP-UP SALDO via Permata Virtual Account', '2020-12-26 10:36:28', '2020-12-26 10:36:28'),
	(78, 4, 22, 'credit', 50487, 30, 'DEPOSIT/TOP-UP SALDO via Bank Bca', '2020-12-26 11:07:57', '2020-12-26 11:07:57'),
	(83, 4, NULL, 'debit', 50000, 9950000, 'TRANSAKSI Pemindahan Saldo Rp. 50.000 Ke BANK BRI (002) no.rekening 388801035360537', '2021-02-08 14:21:06', '2021-02-08 14:21:06'),
	(84, 4, NULL, 'debit', 5000, 9945000, 'Biaya Admin Transfer Saldo Ke Bank ID: #83', '2021-02-08 14:21:08', '2021-02-08 14:21:08'),
	(85, 4, 14, 'credit', 0, 9945000, 'TRANSAKSI TELKOMSEL 1.000  GAGAL', '2021-02-09 12:56:52', '2021-02-09 12:56:52'),
	(86, 4, 14, 'credit', 0, 9945000, 'REFUND TRX TELKOMSEL 1.000 082131445043', '2021-02-09 12:57:04', '2021-02-09 12:57:04'),
	(87, 4, NULL, 'debit', 0, 9945000, 'TRANSAKSI TELKOMSEL 1.000 082131445043', '2021-02-10 09:07:42', '2021-02-10 09:07:42'),
	(88, 4, NULL, 'debit', 0, 9945000, 'TRANSAKSI TELKOMSEL 1.000 082131445043', '2021-02-10 09:09:59', '2021-02-10 09:09:59'),
	(89, 4, 15, 'debit', 0, 9945000, 'TRANSAKSI TELKOMSEL 1.000 082131445043', '2021-02-10 09:15:00', '2021-02-10 09:15:00');
/*!40000 ALTER TABLE `mutasis` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.mutasisaldo_bank
CREATE TABLE IF NOT EXISTS `mutasisaldo_bank` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `trxid` bigint(20) unsigned NOT NULL,
  `penerima` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal` int(11) NOT NULL,
  `code_bank` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_bank` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rekening` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `note` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.mutasisaldo_bank: ~4 rows (approximately)
/*!40000 ALTER TABLE `mutasisaldo_bank` DISABLE KEYS */;
INSERT INTO `mutasisaldo_bank` (`id`, `user_id`, `trxid`, `penerima`, `nominal`, `code_bank`, `jenis_bank`, `no_rekening`, `status`, `note`, `created_at`, `updated_at`) VALUES
	(1, 4, 1, 'Bayu segara', 100000, '002', 'BANK BRI', '005701000529566', 1, 'Transaksi Success.', '2020-11-26 08:46:35', '2020-11-26 08:46:35'),
	(2, 4, 2, 'Bayu segara', 100000, '002', 'BANK BRI', '005701000529566', 0, 'Transaksi Transfer ke Bank. No.rekening 005701000529566 ke bank BANK BRI sebesar 100.000  Sedang di proses', '2020-12-24 07:54:05', '2020-12-24 07:54:05'),
	(5, 4, 3, 'Bayu segara', 100000, '002', 'BANK BRI', '005701000529566', 0, 'Transaksi Transfer ke Bank. No.rekening 005701000529566 ke bank BANK BRI sebesar 100.000  Sedang di proses', '2020-12-24 08:17:43', '2020-12-24 08:17:43'),
	(6, 4, 4, 'Bayu segara', 200000, '002', 'BANK BRI', '388801035360537', 0, 'Transaksi Transfer ke Bank. No.rekening 388801035360537 ke bank BANK BRI sebesar 200.000  Sedang di proses', '2020-12-25 20:09:54', '2020-12-25 20:09:54'),
	(10, 4, 5, 'Bayu Segara', 50000, '002', 'BANK BRI', '388801035360537', 0, 'Transaksi Transfer ke Bank. No.rekening 388801035360537 ke bank BANK BRI sebesar 50.000  Sedang di proses', '2021-02-08 14:21:06', '2021-02-08 14:21:06');
/*!40000 ALTER TABLE `mutasisaldo_bank` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.mutasis_komisi
CREATE TABLE IF NOT EXISTS `mutasis_komisi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `from_reff_id` bigint(20) unsigned NOT NULL,
  `komisi` bigint(20) unsigned NOT NULL DEFAULT 0,
  `jenis_komisi` bigint(20) unsigned NOT NULL,
  `note` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `jenis_komisi` (`jenis_komisi`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `mutasis_komisi_ibfk_1` FOREIGN KEY (`jenis_komisi`) REFERENCES `settings_komisi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mutasis_komisi_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.mutasis_komisi: ~9 rows (approximately)
/*!40000 ALTER TABLE `mutasis_komisi` DISABLE KEYS */;
INSERT INTO `mutasis_komisi` (`id`, `user_id`, `from_reff_id`, `komisi`, `jenis_komisi`, `note`, `created_at`, `updated_at`) VALUES
	(2, 3, 4, 50, 2, 'Trx T1', '2020-11-24 12:33:19', '2020-11-24 12:33:19'),
	(3, 2, 4, 100, 2, 'Trx S1', '2020-11-25 08:02:29', '2020-11-25 08:02:29'),
	(4, 1, 4, 100, 2, 'Trx S1', '2020-11-25 08:02:29', '2020-11-25 08:02:29'),
	(5, 2, 4, 100, 2, 'Trx S2', '2020-11-25 08:12:04', '2020-11-25 08:12:04'),
	(6, 1, 4, 100, 2, 'Trx S2', '2020-11-25 08:12:04', '2020-11-25 08:12:04'),
	(7, 3, 4, 200, 2, 'Trx S3', '2020-11-25 08:15:37', '2020-11-25 08:15:37'),
	(8, 2, 4, 100, 2, 'Trx S3', '2020-11-25 08:15:37', '2020-11-25 08:15:37'),
	(11, 3, 4, 0, 2, 'Trx T1', '2020-12-25 23:23:12', '2020-12-25 23:23:12'),
	(12, 3, 4, 0, 2, 'Trx S1', '2020-12-26 10:15:08', '2020-12-26 10:15:08');
/*!40000 ALTER TABLE `mutasis_komisi` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.oauth_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.oauth_auth_codes: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.oauth_clients: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.oauth_personal_access_clients: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.oauth_refresh_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.paypal_payments
CREATE TABLE IF NOT EXISTS `paypal_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` enum('deposit') NOT NULL DEFAULT 'deposit',
  `deposit_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `amount_idr` int(10) unsigned DEFAULT NULL,
  `amount_usd` decimal(10,0) unsigned DEFAULT NULL,
  `kurs` int(10) unsigned DEFAULT NULL,
  `paypal_email` varchar(50) DEFAULT NULL,
  `paypal_name` varchar(50) DEFAULT NULL,
  `paypal_username` varchar(50) DEFAULT NULL,
  `payer_email` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `payment_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT NULL,
  `note` text DEFAULT NULL,
  `additional_info` text DEFAULT NULL,
  `checking_time` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tripay_webpulsa.paypal_payments: ~0 rows (approximately)
/*!40000 ALTER TABLE `paypal_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_payments` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.paypal_settings
CREATE TABLE IF NOT EXISTS `paypal_settings` (
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.paypal_settings: ~3 rows (approximately)
/*!40000 ALTER TABLE `paypal_settings` DISABLE KEYS */;
INSERT INTO `paypal_settings` (`name`, `value`) VALUES
	('end_hour', '23:59:59'),
	('min_amount', '5'),
	('start_hour', '01:00:00');
/*!40000 ALTER TABLE `paypal_settings` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.pembayarankategoris
CREATE TABLE IF NOT EXISTS `pembayarankategoris` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kategori_server_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `apiserver_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `jenis` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sort_product` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.pembayarankategoris: ~10 rows (approximately)
/*!40000 ALTER TABLE `pembayarankategoris` DISABLE KEYS */;
INSERT INTO `pembayarankategoris` (`id`, `kategori_server_id`, `apiserver_id`, `product_name`, `icon`, `slug`, `type`, `status`, `jenis`, `last_update`, `created_at`, `updated_at`, `sort_product`) VALUES
	(57, 37, 2, 'PEMBAYARAN PLN', 'lightbulb-o', 'pembayaran-pln', 'PEMBAYARAN PLN', 1, 'pembayaran', '2021-02-10 13:16:23', '2021-02-10 13:15:14', '2021-02-10 13:16:23', 0),
	(58, 38, 2, 'PEMBAYARAN BPJS', 'heartbeat', 'pembayaran-bpjs', 'PEMBAYARAN BPJS', 1, 'pembayaran', '2021-02-10 13:15:30', '2021-02-10 13:15:14', '2021-02-10 13:15:30', 0),
	(59, 39, 2, 'PEMBAYARAN KERETA API', 'train', 'pembayaran-kereta-api', 'PEMBAYARAN KERETA API', 1, 'pembayaran', '2021-02-10 13:15:33', '2021-02-10 13:15:14', '2021-02-10 13:15:33', 0),
	(60, 40, 2, 'PEMBAYARAN ASURANSI', 'slideshare', 'pembayaran-asuransi', 'PEMBAYARAN ASURANSI', 1, 'pembayaran', '2021-02-10 13:15:37', '2021-02-10 13:15:14', '2021-02-10 13:15:37', 0),
	(61, 41, 2, 'PEMBAYARAN TV', 'television', 'pembayaran-tv', 'PEMBAYARAN TV', 1, 'pembayaran', '2021-02-10 13:15:44', '2021-02-10 13:15:14', '2021-02-10 13:15:44', 0),
	(62, 42, 2, 'PEMBAYARAN PDAM', 'tint', 'pembayaran-pdam', 'PEMBAYARAN PDAM', 1, 'pembayaran', '2021-02-10 13:15:49', '2021-02-10 13:15:14', '2021-02-10 13:15:49', 0),
	(63, 43, 2, 'PEMBAYARAN TELEPHONE KABEL', 'tty', 'pembayaran-telephone-kabel', 'PEMBAYARAN TELEPHONE KABEL', 1, 'pembayaran', '2021-02-10 13:16:04', '2021-02-10 13:15:14', '2021-02-10 13:16:04', 0),
	(64, 44, 2, 'TELEPHONE PASCABAYAR', 'tty', 'telephone-pascabayar', 'TELEPHONE PASCABAYAR', 1, 'pembayaran', '2021-02-10 13:16:11', '2021-02-10 13:15:14', '2021-02-10 13:16:11', 0),
	(65, 45, 2, 'ZAKAT', 'asl-interpreting', 'zakat', 'ZAKAT', 1, 'pembayaran', '2021-02-10 13:16:16', '2021-02-10 13:15:14', '2021-02-10 13:16:16', 0),
	(66, 46, 2, 'PEMBAYARAN MULTIFINANCE', 'handshake-o', 'pembayaran-multifinance', 'PEMBAYARAN MULTIFINANCE', 1, 'pembayaran', '2021-02-10 13:16:19', '2021-02-10 13:15:14', '2021-02-10 13:16:19', 0);
/*!40000 ALTER TABLE `pembayarankategoris` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.pembayaranoperators
CREATE TABLE IF NOT EXISTS `pembayaranoperators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `operator_server_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `apiserver_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `pembayarankategori_id` bigint(20) unsigned NOT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pembayaranoperators_pembayarankategori_id_foreign` (`pembayarankategori_id`),
  CONSTRAINT `pembayaranoperators_pembayarankategori_id_foreign` FOREIGN KEY (`pembayarankategori_id`) REFERENCES `pembayarankategoris` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.pembayaranoperators: ~9 rows (approximately)
/*!40000 ALTER TABLE `pembayaranoperators` DISABLE KEYS */;
INSERT INTO `pembayaranoperators` (`id`, `operator_server_id`, `apiserver_id`, `product_name`, `status`, `pembayarankategori_id`, `last_update`, `created_at`, `updated_at`) VALUES
	(58, 38, 2, 'Pembayaran PLN', 1, 57, '2021-02-10 13:17:37', '2021-02-10 13:15:26', '2021-02-10 13:17:37'),
	(59, 39, 2, 'Pembayaran BPJS', 1, 58, '2021-02-10 13:17:43', '2021-02-10 13:15:29', '2021-02-10 13:17:43'),
	(60, 40, 2, 'Pembayaran Kereta Api', 1, 59, '2021-02-10 13:17:54', '2021-02-10 13:15:33', '2021-02-10 13:17:54'),
	(61, 41, 2, 'Pembayaran Asuransi', 1, 60, '2021-02-10 13:18:06', '2021-02-10 13:15:37', '2021-02-10 13:18:06'),
	(62, 42, 2, 'Pembayaran TV', 1, 61, '2021-02-10 13:18:12', '2021-02-10 13:15:44', '2021-02-10 13:18:12'),
	(63, 43, 2, 'Pembayaran PDAM', 1, 62, '2021-02-10 13:18:22', '2021-02-10 13:15:49', '2021-02-10 13:18:22'),
	(64, 44, 2, 'Pembayaran Telephone Kabel', 1, 63, '2021-02-10 13:18:35', '2021-02-10 13:16:04', '2021-02-10 13:18:35'),
	(65, 45, 2, 'Telephone Pascabayar', 1, 64, '2021-02-10 13:19:35', '2021-02-10 13:16:11', '2021-02-10 13:19:35'),
	(66, 46, 2, 'Zakat', 1, 65, '2021-02-10 13:19:47', '2021-02-10 13:16:16', '2021-02-10 13:19:47'),
	(67, 47, 2, 'Pembayaran Multifinance', 1, 66, '2021-02-10 13:20:07', '2021-02-10 13:16:19', '2021-02-10 13:20:07');
/*!40000 ALTER TABLE `pembayaranoperators` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.pembayaranproduks
CREATE TABLE IF NOT EXISTS `pembayaranproduks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_server_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `apiserver_id` int(11) NOT NULL,
  `pembayaranoperator_id` bigint(20) unsigned NOT NULL,
  `pembayarankategori_id` bigint(20) unsigned NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_default` bigint(20) unsigned NOT NULL DEFAULT 0,
  `markup` bigint(20) unsigned NOT NULL DEFAULT 0,
  `price_markup` bigint(20) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pembayaranproduks_pembayaranoperator_id_foreign` (`pembayaranoperator_id`),
  KEY `pembayaranproduks_pembayarankategori_id_foreign` (`pembayarankategori_id`),
  CONSTRAINT `pembayaranproduks_pembayarankategori_id_foreign` FOREIGN KEY (`pembayarankategori_id`) REFERENCES `pembayarankategoris` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pembayaranproduks_pembayaranoperator_id_foreign` FOREIGN KEY (`pembayaranoperator_id`) REFERENCES `pembayaranoperators` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.pembayaranproduks: ~63 rows (approximately)
/*!40000 ALTER TABLE `pembayaranproduks` DISABLE KEYS */;
INSERT INTO `pembayaranproduks` (`id`, `product_server_id`, `apiserver_id`, `pembayaranoperator_id`, `pembayarankategori_id`, `product_name`, `code`, `price_default`, `markup`, `price_markup`, `status`, `created_at`, `updated_at`) VALUES
	(456, 359, 2, 58, 57, 'PLN Pasca Bayar', 'PLNPASCH', 700, 0, 700, 1, '2021-02-10 13:16:31', '2021-02-10 13:17:37'),
	(457, 360, 2, 58, 57, 'PLN Non Taglist', 'PLNNONH', 1700, 0, 1700, 1, '2021-02-10 13:16:31', '2021-02-10 13:17:37'),
	(458, 361, 2, 59, 58, 'Pembayaran BPJS', 'ASRBPJSKS', 1450, 0, 1450, 1, '2021-02-10 13:16:43', '2021-02-10 13:17:43'),
	(459, 362, 2, 60, 59, 'Tiket Kereta Api', 'MKAI', 1000, 0, 1000, 1, '2021-02-10 13:16:47', '2021-02-10 13:17:54'),
	(460, 363, 2, 61, 60, 'Asuransi Jiwasraya', 'ASRJWS', 500, 0, 500, 1, '2021-02-10 13:16:56', '2021-02-10 13:18:06'),
	(461, 364, 2, 62, 61, 'Indovision, Top TV, Okevision', 'TVINDVS', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:11'),
	(462, 365, 2, 62, 61, 'Transvision, Telkomvision, Yes TV', 'TVTLKMV', 1500, 0, 1500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:11'),
	(463, 366, 2, 62, 61, 'Voucher Telkomvision Pra Combo', 'TVKMVPRE', 3500, 0, 3500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:11'),
	(464, 382, 2, 62, 61, 'SKYNINDO TV FAMILY 6 BLN (240.000)', 'TVSKYFAM6', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:11'),
	(465, 383, 2, 62, 61, 'SKYNINDO TV FAMILY 12 BLN (480.000)', 'TVSKYFAM12', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:12'),
	(466, 384, 2, 62, 61, 'SKYNINDO TV FAMILY 1 BLN (40.000)', 'TVSKYFAM1', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:12'),
	(467, 385, 2, 62, 61, 'SKYNINDO TV MANDARIN 1 BLN (140.000)', 'TVSKYMAN1', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:12'),
	(468, 388, 2, 62, 61, 'SKYNINDO TV MANDARIN 3 BLN (420.000)', 'TVSKYMAN3', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:12'),
	(469, 391, 2, 62, 61, 'SKYNINDO TV FAMILY 3 BLN (120.000)', 'TVSKYFAM3', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:12'),
	(470, 392, 2, 62, 61, 'SKYNINDO TV MANDARIN 12 BLN (1.680.000)', 'TVSKYMAN12', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:12'),
	(471, 393, 2, 62, 61, 'SKYNINDO TV MANDARIN 6 BLN (840.000)', 'TVSKYMAN6', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:12'),
	(472, 394, 2, 62, 61, 'K VISION (100.000)', 'TVKV100', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:12'),
	(473, 395, 2, 62, 61, 'K VISION (1.000.000)', 'TVKV1000', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:12'),
	(474, 396, 2, 62, 61, 'K VISION (125.000)', 'TVKV125', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:12'),
	(475, 397, 2, 62, 61, 'K VISION (150.000)', 'TVKV150', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:12'),
	(476, 398, 2, 62, 61, 'K VISION (175.000)', 'TVKV175', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:12'),
	(477, 399, 2, 62, 61, 'K VISION (200.000)', 'TVKV200', 500, 0, 500, 1, '2021-02-10 13:17:00', '2021-02-10 13:18:12'),
	(478, 400, 2, 62, 61, 'K VISION (250.000)', 'TVKV250', 500, 0, 500, 1, '2021-02-10 13:17:01', '2021-02-10 13:18:12'),
	(479, 401, 2, 62, 61, 'K VISION (300.000)', 'TVKV300', 500, 0, 500, 1, '2021-02-10 13:17:01', '2021-02-10 13:18:12'),
	(480, 402, 2, 62, 61, 'K VISION (50.000)', 'TVKV50', 500, 0, 500, 1, '2021-02-10 13:17:01', '2021-02-10 13:18:12'),
	(481, 403, 2, 62, 61, 'K VISION (500.000)', 'TVKV500', 500, 0, 500, 1, '2021-02-10 13:17:01', '2021-02-10 13:18:12'),
	(482, 404, 2, 62, 61, 'K VISION (75.000)', 'TVKV75', 500, 0, 500, 1, '2021-02-10 13:17:01', '2021-02-10 13:18:12'),
	(483, 405, 2, 62, 61, 'K VISION (750.000)', 'TVKV750', 500, 0, 500, 1, '2021-02-10 13:17:01', '2021-02-10 13:18:12'),
	(484, 406, 2, 63, 62, 'AETRA JAKARTA', 'WAAETRA', 1250, 0, 1250, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:21'),
	(485, 407, 2, 63, 62, 'PALYJA JAKARTA', 'WAPLYJ', 1800, 0, 1800, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:21'),
	(486, 408, 2, 63, 62, 'PDAM KAB. BOGOR', 'WABOGOR', 2100, 0, 2100, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:21'),
	(487, 409, 2, 63, 62, 'PDAM KOTA BANDUNG', 'WABDG', 2100, 0, 2100, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:21'),
	(488, 410, 2, 63, 62, 'PDAM KOTA SURAKARTA', 'WAKOSOLO', 2400, 0, 2400, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:21'),
	(489, 411, 2, 63, 62, 'PDAM KAB. BANGKALAN', 'WABGK', 1500, 0, 1500, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:21'),
	(490, 412, 2, 63, 62, 'PDAM KAB. BONDOWOSO', 'WABONDO', 1500, 0, 1500, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:21'),
	(491, 413, 2, 63, 62, 'PDAM KAB. BALANGAN', 'WABAL', 1700, 0, 1700, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:21'),
	(492, 415, 2, 63, 62, 'PDAM KOTA BANDAR LAMPUNG', 'WALMPNG', 2200, 0, 2200, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:21'),
	(493, 417, 2, 63, 62, 'PDAM KAB. GROBOGAN', 'WAGROBGAN', 2000, 0, 2000, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:22'),
	(494, 418, 2, 63, 62, 'PDAM KAB. PURWOREJO', 'WAPURWORE', 1600, 0, 1600, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:22'),
	(495, 419, 2, 63, 62, 'PDAM KAB. BATANG', 'WABATANG', 1900, 0, 1900, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:22'),
	(496, 420, 2, 63, 62, 'PDAM KAB. BOJONEGORO', 'WABJN', 1300, 0, 1300, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:22'),
	(497, 421, 2, 63, 62, 'PDAM KAB. JEMBER', 'WAJMBR', 2200, 0, 2200, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:22'),
	(498, 422, 2, 63, 62, 'PDAM KAB. MALANG', 'WAKABMLG', 1700, 0, 1700, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:22'),
	(499, 423, 2, 63, 62, 'PDAM KAB. MOJOKERTO', 'WAMJK', 1900, 0, 1900, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:22'),
	(500, 424, 2, 63, 62, 'PDAM KAB. PASURUAN', 'WAPASU', 1600, 0, 1600, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:22'),
	(501, 425, 2, 63, 62, 'PDAM KAB. SIDOARJO', 'WASDA', 1450, 0, 1450, 1, '2021-02-10 13:17:04', '2021-02-10 13:18:22'),
	(502, 426, 2, 63, 62, 'PDAM KAB. SITUBONDO', 'WASITU', 1400, 0, 1400, 1, '2021-02-10 13:17:05', '2021-02-10 13:18:22'),
	(503, 427, 2, 63, 62, 'PDAM KOTA PASURUAN', 'WAKOPASU', 1800, 0, 1800, 1, '2021-02-10 13:17:05', '2021-02-10 13:18:22'),
	(504, 428, 2, 63, 62, 'PDAM KAB. SAMPANG', 'WASAMPANG', 1500, 0, 1500, 1, '2021-02-10 13:17:05', '2021-02-10 13:18:22'),
	(505, 430, 2, 63, 62, 'PDAM KOTA PONTIANAK', 'WAPONTI', 1700, 0, 1700, 1, '2021-02-10 13:17:05', '2021-02-10 13:18:22'),
	(506, 431, 2, 63, 62, 'PDAM KAB. TAPIN', 'WATAPIN', 1400, 0, 1400, 1, '2021-02-10 13:17:05', '2021-02-10 13:18:22'),
	(507, 432, 2, 63, 62, 'PDAM KOTA BANJARBARU', 'WAIBANJAR', 1600, 0, 1600, 1, '2021-02-10 13:17:05', '2021-02-10 13:18:22'),
	(508, 433, 2, 63, 62, 'PDAM KOTA MATARAM', 'WAGIRIMM', 2100, 0, 2100, 1, '2021-02-10 13:17:05', '2021-02-10 13:18:22'),
	(509, 434, 2, 63, 62, 'PDAM KOTA MANADO', 'WAMANADO', 2650, 0, 2650, 1, '2021-02-10 13:17:05', '2021-02-10 13:18:22'),
	(510, 435, 2, 63, 62, 'PDAM KOTA PALEMBANG', 'WAPLMBNG', 1800, 0, 1800, 1, '2021-02-10 13:17:05', '2021-02-10 13:18:22'),
	(511, 436, 2, 64, 63, 'Speedy / Indihome', 'SPEEDY', 1500, 0, 1500, 1, '2021-02-10 13:17:12', '2021-02-10 13:18:35'),
	(512, 437, 2, 64, 63, 'Telkom', 'TELEPON', 1500, 0, 1500, 1, '2021-02-10 13:17:12', '2021-02-10 13:18:35'),
	(513, 438, 2, 65, 64, 'Kartu Halo', 'HPTSEL', 500, 0, 500, 1, '2021-02-10 13:17:22', '2021-02-10 13:19:34'),
	(514, 439, 2, 65, 64, 'XL Xplore', 'HPXL', 500, 0, 500, 1, '2021-02-10 13:17:22', '2021-02-10 13:19:34'),
	(515, 440, 2, 65, 64, 'Indosat Matrix', 'HPMTRIX', 500, 0, 500, 1, '2021-02-10 13:17:22', '2021-02-10 13:19:34'),
	(516, 442, 2, 65, 64, 'FREN, MOBI, HEPI', 'HPFREN', 500, 0, 500, 1, '2021-02-10 13:17:22', '2021-02-10 13:19:34'),
	(517, 443, 2, 65, 64, 'SMARTFREN', 'HPSMART', 500, 0, 500, 1, '2021-02-10 13:17:22', '2021-02-10 13:19:35'),
	(518, 444, 2, 65, 64, 'THREE', 'HPTHREE', 500, 0, 500, 1, '2021-02-10 13:17:22', '2021-02-10 13:19:35'),
	(519, 445, 2, 66, 65, 'Zakat', 'RZZ', 500, 0, 500, 1, '2021-02-10 13:17:26', '2021-02-10 13:19:46'),
	(520, 446, 2, 66, 65, 'DONASI UANG KEMBALIAN', 'RZDUK', 500, 0, 500, 1, '2021-02-10 13:17:26', '2021-02-10 13:19:46'),
	(521, 447, 2, 66, 65, 'INFAQ-SHADAQOH', 'RZIS', 500, 0, 500, 1, '2021-02-10 13:17:26', '2021-02-10 13:19:47'),
	(522, 448, 2, 66, 65, 'QURBAN KAMBING', 'RZQK', 500, 0, 500, 1, '2021-02-10 13:17:26', '2021-02-10 13:19:47'),
	(523, 449, 2, 66, 65, 'QURBAN SAPI 1/7 (RETAIL)', 'RZQS17', 500, 0, 500, 1, '2021-02-10 13:17:26', '2021-02-10 13:19:47'),
	(524, 450, 2, 66, 65, 'QURBAN SAPI', 'RZQS', 500, 0, 500, 1, '2021-02-10 13:17:26', '2021-02-10 13:19:47'),
	(525, 451, 2, 67, 66, 'Bima Finance', 'FNBIMA', 4500, 0, 4500, 1, '2021-02-10 13:17:33', '2021-02-10 13:20:07');
/*!40000 ALTER TABLE `pembayaranproduks` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.pembeliankategoris
CREATE TABLE IF NOT EXISTS `pembeliankategoris` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `apiserver_id` int(11) DEFAULT NULL,
  `sort_product` int(11) NOT NULL DEFAULT 0,
  `product_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `jenis` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.pembeliankategoris: ~15 rows (approximately)
/*!40000 ALTER TABLE `pembeliankategoris` DISABLE KEYS */;
INSERT INTO `pembeliankategoris` (`id`, `apiserver_id`, `sort_product`, `product_id`, `product_name`, `type`, `icon`, `slug`, `status`, `jenis`, `last_update`, `created_at`, `updated_at`) VALUES
	(97, 2, 0, 1, 'PULSA ALL OPERATOR', 'REGULER', 'mobile', 'pulsa-all-operator', 1, 'pembelian', '2021-02-10 13:23:57', '2021-02-10 13:21:40', '2021-02-10 13:23:57'),
	(98, 2, 0, 2, 'PAKET DATA', 'INTERNET', 'internet-explorer', 'paket-data', 1, 'pembelian', '2021-02-10 13:24:00', '2021-02-10 13:21:40', '2021-02-10 13:24:00'),
	(99, 2, 0, 4, 'VOUCHER GOOGLE PLAY', 'LAIN', 'google-wallet', 'voucher-google-play', 1, 'pembelian', '2021-02-10 13:25:41', '2021-02-10 13:21:40', '2021-02-10 13:25:41'),
	(100, 2, 0, 5, 'PULSA SMS TELEPHONE', 'SMS', 'envelope', 'pulsa-sms-telephone', 1, 'pembelian', '2021-02-10 13:22:55', '2021-02-10 13:21:40', '2021-02-10 13:22:55'),
	(101, 2, 0, 6, 'PULSA TRANSFER', 'TRANSFER', 'forward', 'pulsa-transfer', 1, 'pembelian', '2021-02-10 13:23:01', '2021-02-10 13:21:40', '2021-02-10 13:23:01'),
	(102, 2, 0, 7, 'ITUNES GIFT CARD', 'LAIN', 'music', 'itunes-gift-card', 0, 'pembelian', '2021-02-10 13:23:09', '2021-02-10 13:21:40', '2021-02-10 13:23:09'),
	(103, 2, 0, 11, 'VOUCHER GAME', 'GAME', 'gamepad', 'voucher-game', 1, 'pembelian', '2021-02-10 13:23:16', '2021-02-10 13:21:40', '2021-02-10 13:23:16'),
	(104, 2, 0, 12, 'PUBG MOBILE UC', 'GAME', 'gamepad', 'pubg-mobile-uc', 1, 'pembelian', '2021-02-10 13:23:20', '2021-02-10 13:21:40', '2021-02-10 13:23:20'),
	(105, 2, 0, 14, 'VOUCHER WIFI.ID', 'LAIN', 'wifi', 'voucher-wifiid', 1, 'pembelian', '2021-02-10 13:23:23', '2021-02-10 13:21:40', '2021-02-10 13:23:23'),
	(106, 2, 0, 15, 'E-MONEY', 'LAIN', 'money', 'e-money', 1, 'pembelian', '2021-02-10 13:23:27', '2021-02-10 13:21:40', '2021-02-10 13:23:27'),
	(107, 2, 0, 19, 'TOKEN LISTRIK', 'PLN', 'bolt', 'token-listrik', 1, 'pembelian', '2021-02-10 13:23:31', '2021-02-10 13:21:40', '2021-02-10 13:23:31'),
	(108, 2, 0, 20, 'E-TOLL', 'LAIN', 'road', 'e-toll', 1, 'pembelian', '2021-02-10 13:23:37', '2021-02-10 13:21:40', '2021-02-10 13:23:37'),
	(109, 2, 0, 22, 'FREE FIRE DIAMOND', 'GAME', 'gamepad', 'free-fire-diamond', 1, 'pembelian', '2021-02-10 13:23:45', '2021-02-10 13:21:40', '2021-02-10 13:23:45'),
	(110, 2, 0, 23, 'MALAYSIA TOPUP', 'REGULER', 'mobile', 'malaysia-topup', 1, 'pembelian', '2021-02-10 13:23:50', '2021-02-10 13:21:40', '2021-02-10 13:23:50'),
	(111, 2, 0, 24, 'SINGAPORE TOPUP', 'REGULER', 'mobile', 'singapore-topup', 1, 'pembelian', '2021-02-10 13:23:53', '2021-02-10 13:21:40', '2021-02-10 13:23:53');
/*!40000 ALTER TABLE `pembeliankategoris` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.pembelianoperators
CREATE TABLE IF NOT EXISTS `pembelianoperators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `apiserver_id` int(11) DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_id_server` int(11) NOT NULL DEFAULT 0,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `pembeliankategori_id` bigint(20) unsigned NOT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pembelianoperators_pembeliankategori_id_foreign` (`pembeliankategori_id`),
  CONSTRAINT `pembelianoperators_pembeliankategori_id_foreign` FOREIGN KEY (`pembeliankategori_id`) REFERENCES `pembeliankategoris` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=419 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.pembelianoperators: ~122 rows (approximately)
/*!40000 ALTER TABLE `pembelianoperators` DISABLE KEYS */;
INSERT INTO `pembelianoperators` (`id`, `apiserver_id`, `product_id`, `operator_id_server`, `product_name`, `prefix`, `img_url`, `status`, `pembeliankategori_id`, `last_update`, `created_at`, `updated_at`) VALUES
	(296, 2, 'AX', 1, 'AXIS', '0831,0832,0838', NULL, 1, 97, '2021-02-10 13:24:18', '2021-02-10 13:22:35', '2021-02-10 13:24:18'),
	(297, 2, 'BO', 5, 'BOLT', '998,999', NULL, 1, 97, '2021-02-10 13:24:28', '2021-02-10 13:22:35', '2021-02-10 13:24:28'),
	(298, 2, 'C', 7, 'CERIA', '0828', NULL, 1, 97, '2021-02-10 13:24:32', '2021-02-10 13:22:35', '2021-02-10 13:24:32'),
	(299, 2, 'I', 13, 'INDOSAT', '0856,0857,0858,0815,0816,0855,0814', NULL, 1, 97, '2021-02-10 13:24:41', '2021-02-10 13:22:35', '2021-02-10 13:24:41'),
	(300, 2, 'SM', 26, 'SMARTFREN', '0881,0882,0883,0884,0885,0886,0887,0888,0889', NULL, 1, 97, '2021-02-10 13:24:45', '2021-02-10 13:22:35', '2021-02-10 13:24:45'),
	(301, 2, 'S', 29, 'TELKOMSEL', '0811,0812,0813,0821,0822,0823,0852,0853,0851', NULL, 1, 97, '2021-02-10 13:24:52', '2021-02-10 13:22:35', '2021-02-10 13:24:52'),
	(302, 2, 'T', 36, 'TRI', '0896,0897,0898,0899,0895', NULL, 1, 97, '2021-02-10 13:24:57', '2021-02-10 13:22:35', '2021-02-10 13:24:57'),
	(303, 2, 'X', 44, 'XL', '0817,0818,0819,0859,0877,0878', NULL, 1, 97, '2021-02-10 13:25:01', '2021-02-10 13:22:35', '2021-02-10 13:25:01'),
	(304, 2, 'BYU', 159, 'BY.U', '085154,085155,085156,085157', NULL, 1, 97, '2021-02-10 13:25:07', '2021-02-10 13:22:35', '2021-02-10 13:25:07'),
	(305, 2, 'AIGO', 2, 'AXIS AIGO (AKTIVASI *838*SN#)', '0831,0832,0838', NULL, 1, 98, '2021-02-10 13:25:13', '2021-02-10 13:22:45', '2021-02-10 13:25:13'),
	(306, 2, 'AIM', 3, 'AXIS AIGO MINI (AKTIVASI *838*SN#)', '0831,0832,0838', NULL, 1, 98, '2021-02-10 13:25:18', '2021-02-10 13:22:45', '2021-02-10 13:25:18'),
	(307, 2, 'AXD', 4, 'AXIS DATA BRONET', '0831,0832,0838', NULL, 1, 98, '2021-02-10 13:25:21', '2021-02-10 13:22:45', '2021-02-10 13:25:21'),
	(308, 2, 'IDB', 14, 'INDOSAT BOMBER', '0856,0857,0858,0815,0816,0855,0814', NULL, 1, 98, '2021-02-10 13:25:26', '2021-02-10 13:22:45', '2021-02-10 13:25:26'),
	(309, 2, 'IDX', 15, 'INDOSAT DATA EXTRA', '0856,0857,0858,0815,0816,0855,0814', NULL, 1, 98, '2021-02-10 13:25:30', '2021-02-10 13:22:45', '2021-02-10 13:25:30'),
	(310, 2, 'IFC', 16, 'INDOSAT DATA FREEDOM', '0856,0857,0858,0815,0816,0855,0814', NULL, 1, 98, '2021-02-10 13:25:36', '2021-02-10 13:22:45', '2021-02-10 13:25:36'),
	(311, 2, 'IDM', 17, 'INDOSAT DATA MINI', '0856,0857,0858,0815,0816,0855,0814', NULL, 1, 98, '2021-02-10 13:25:46', '2021-02-10 13:22:45', '2021-02-10 13:25:46'),
	(312, 2, 'IDN', 18, 'INDOSAT DATA REGULER', '0856,0857,0858,0815,0816,0855,0814', NULL, 1, 98, '2021-02-10 13:25:50', '2021-02-10 13:22:45', '2021-02-10 13:25:50'),
	(313, 2, 'IDH', 22, 'INDOSAT YELLOW', '0856,0857,0858,0815,0816,0855,0814', NULL, 1, 98, '2021-02-10 13:25:54', '2021-02-10 13:22:45', '2021-02-10 13:25:54'),
	(314, 2, 'SMV', 27, 'SMARTFREN DATA VOLUME', '0881,0882,0883,0884,0885,0886,0887,0888,0889', NULL, 1, 98, '2021-02-10 13:26:27', '2021-02-10 13:22:45', '2021-02-10 13:26:27'),
	(315, 2, 'SMD', 28, 'SMARTFREN INTERNET', '0881,0882,0883,0884,0885,0886,0887,0888,0889', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(316, 2, 'STG', 30, 'TELKOMSEL DATA', '0811,0812,0813,0821,0822,0823,0852,0853,0851', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(317, 2, 'SDA', 31, 'TELKOMSEL DATA AS', '0811,0812,0813,0821,0822,0823,0852,0853,0851', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(318, 2, 'SDB', 32, 'TELKOMSEL DATA BULK', '0811,0812,0813,0821,0822,0823,0852,0853,0851', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(319, 2, 'TD', 37, 'TRI DATA', '0896,0897,0898,0899,0895', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(320, 2, 'TBM', 38, 'TRI DATA BM', '0896,0897,0898,0899,0895', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(321, 2, 'TDC', 39, 'TRI DATA CINTA', '0896,0897,0898,0899,0895', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(322, 2, 'TGM', 40, 'TRI DATA GETMORE', '0896,0897,0898,0899,0895', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(323, 2, 'TDR', 41, 'TRI DATA REGULER', '0896,0897,0898,0899,0895', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(324, 2, 'XCX', 45, 'XL INTERNET COMBO XTRA', '0817,0818,0819,0859,0877,0878', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(325, 2, 'XH', 46, 'XL INTERNET HOTROD', '0817,0818,0819,0859,0877,0878', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(326, 2, 'XHE', 47, 'XL INTERNET HOTROD EXTRA', '0817,0818,0819,0859,0877,0878', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(327, 2, 'IFP', 112, 'INDOSAT FREEDOM PLUS', '0856,0857,0858,0815,0816,0855,0814', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(328, 2, 'SDM', 113, 'TELKOMSEL DATA MINI', '0811,0812,0813,0821,0822,0823,0852,0853,0851', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(329, 2, 'AXO', 114, 'AXIS OWSEM (AKTIVASI *838*SN#)', '0831,0832,0838', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(330, 2, 'SMDV', 115, 'SMARTFREN DATA VOUCHER (AKTIVASI *999*SN#)', '0881,0882,0883,0884,0885,0886,0887,0888,0889', NULL, 1, 98, NULL, '2021-02-10 13:22:46', '2021-02-10 13:22:46'),
	(331, 2, 'GLP', 10, 'GOOGLE PLAY', NULL, NULL, 1, 99, NULL, '2021-02-10 13:22:51', '2021-02-10 13:22:51'),
	(332, 2, 'GP', 11, 'GOOGLE PLAY ID', NULL, NULL, 1, 99, NULL, '2021-02-10 13:22:51', '2021-02-10 13:22:51'),
	(333, 2, 'IS', 19, 'INDOSAT SMS', '0856,0857,0858,0815,0816,0855,0814', NULL, 1, 100, NULL, '2021-02-10 13:22:55', '2021-02-10 13:22:55'),
	(334, 2, 'IT', 20, 'INDOSAT TELEPON', '0856,0857,0858,0815,0816,0855,0814', NULL, 1, 100, NULL, '2021-02-10 13:22:55', '2021-02-10 13:22:55'),
	(335, 2, 'SS', 33, 'TELKOMSEL SMS', '0811,0812,0813,0821,0822,0823,0852,0853,0851', NULL, 1, 100, NULL, '2021-02-10 13:22:55', '2021-02-10 13:22:55'),
	(336, 2, 'ST', 34, 'TELKOMSEL TELEPON', '0811,0812,0813,0821,0822,0823,0852,0853,0851', NULL, 1, 100, NULL, '2021-02-10 13:22:55', '2021-02-10 13:22:55'),
	(337, 2, 'TT', 42, 'TRI TELEPON', '0896,0897,0898,0899,0895', NULL, 1, 100, NULL, '2021-02-10 13:22:55', '2021-02-10 13:22:55'),
	(338, 2, 'XT', 48, 'XL TELEPON', '0817,0818,0819,0859,0877,0878', NULL, 1, 100, NULL, '2021-02-10 13:22:55', '2021-02-10 13:22:55'),
	(339, 2, 'XTL', 49, 'XL TELEPON LUAR NEGERI', '0817,0818,0819,0859,0877,0878', NULL, 1, 100, NULL, '2021-02-10 13:22:55', '2021-02-10 13:22:55'),
	(340, 2, 'ITR', 21, 'INDOSAT TRANSFER PULSA', '0856,0857,0858,0815,0816,0855,0814', NULL, 1, 101, NULL, '2021-02-10 13:23:01', '2021-02-10 13:23:01'),
	(341, 2, 'STR', 35, 'TELKOMSEL TRANSFER PULSA', '0811,0812,0813,0821,0822,0823,0852,0853,0851', NULL, 1, 101, NULL, '2021-02-10 13:23:01', '2021-02-10 13:23:01'),
	(342, 2, 'TTR', 43, 'TRI TRANSFER PULSA', '0896,0897,0898,0899,0895', NULL, 1, 101, NULL, '2021-02-10 13:23:01', '2021-02-10 13:23:01'),
	(343, 2, 'ITN', 23, 'iTunes Gift Card', NULL, NULL, 1, 102, NULL, '2021-02-10 13:23:09', '2021-02-10 13:23:09'),
	(344, 2, 'BOX', 51, 'Xbox Live Gift Card', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(345, 2, 'BP', 52, 'Game facebook - Boyaa Poker', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(346, 2, 'BSF', 53, 'BSF', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(347, 2, 'CBL', 54, 'Cabal Online', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(348, 2, 'CRY', 55, 'e-PINS', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(349, 2, 'DGC', 56, 'Digicash', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(350, 2, 'FAV', 57, 'Faveo', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(351, 2, 'FBG', 58, 'FBCARD', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(352, 2, 'FSB', 59, 'Fastblack', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(353, 2, 'GA', 60, 'ASIASOFT', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(354, 2, 'GD', 61, 'DASA GAME', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(355, 2, 'GES', 62, 'GOLONLINE', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(356, 2, 'GGM', 63, 'GOGAME', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(357, 2, 'GIH', 64, 'IAH Games', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(358, 2, 'GIN', 65, 'INGAME', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(359, 2, 'GMM', 66, 'MatchMove', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(360, 2, 'GMS', 67, 'GEMSCOOL', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(361, 2, 'GOG', 68, 'OrangeGame', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(362, 2, 'GPY', 69, 'Playon', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:14', '2021-02-10 13:23:14'),
	(363, 2, 'GQ', 70, 'Qash', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(364, 2, 'GST', 71, 'ROSE ONLINE', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(365, 2, 'GTA', 72, 'TERACORD', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(366, 2, 'GW', 73, 'Gamewave', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(367, 2, 'GWV', 74, 'Gameweb', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(368, 2, 'ID', 75, 'Playstation Store Prepaid Card', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(369, 2, 'JM', 76, 'Game facebook - Joombi', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(370, 2, 'KRM', 77, 'Koram', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(371, 2, 'KW', 78, 'kiwi card', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(372, 2, 'LYT', 79, 'LYTO', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(373, 2, 'MAIN', 80, 'Mainkan.com', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(374, 2, 'MB', 81, 'Mobius', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(375, 2, 'MGC', 82, 'MOGCAZ', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(376, 2, 'MGX', 83, 'Megaxus', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(377, 2, 'MOG', 84, 'MOGPLAY', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(378, 2, 'MOL', 85, 'MOLPoints', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(379, 2, 'MTN', 86, 'Metin 2', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(380, 2, 'MYC', 87, 'MyCard', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(381, 2, 'PLC', 88, 'Playcircle', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(382, 2, 'PLF', 89, 'Playfish', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(383, 2, 'PLP', 90, 'Playpoint', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(384, 2, 'PLT', 91, 'Game facebook - Pool Live Tour', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(385, 2, 'PW', 96, 'Game facebook - Pico World', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(386, 2, 'PYN', 97, 'Playnexia', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(387, 2, 'SOF', 98, 'Softnyx', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(388, 2, 'SPN', 99, 'Spin', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(389, 2, 'SRT', 100, 'Serenity', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(390, 2, 'STE', 101, 'STEAM WALLET', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(391, 2, 'TRV', 102, 'Travian', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(392, 2, 'UGC', 103, 'PLAYSPAN', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(393, 2, 'UNI', 104, 'UNIPIN', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(394, 2, 'VTC', 105, 'VTC Online', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(395, 2, 'VW', 106, 'Viwawa', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(396, 2, 'WIN', 107, 'Winner Card', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(397, 2, 'WVP', 108, 'Wavegame', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(398, 2, 'ZNG', 109, 'ZYNGA', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:15', '2021-02-10 13:23:15'),
	(399, 2, 'GRS', 147, 'GARENA SHELL', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:16', '2021-02-10 13:23:16'),
	(400, 2, 'MLD', 148, 'MOBILE LEGEND DIAMOND', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:16', '2021-02-10 13:23:16'),
	(401, 2, 'AOV', 151, 'ARENA OF VALOR', NULL, NULL, 1, 103, NULL, '2021-02-10 13:23:16', '2021-02-10 13:23:16'),
	(402, 2, 'PUB', 142, 'PUBG', NULL, NULL, 1, 104, NULL, '2021-02-10 13:23:19', '2021-02-10 13:23:19'),
	(403, 2, 'WIFI', 120, 'WIFI ID', NULL, NULL, 1, 105, NULL, '2021-02-10 13:23:23', '2021-02-10 13:23:23'),
	(404, 2, 'GJ', 8, 'GOJEK', NULL, NULL, 1, 106, NULL, '2021-02-10 13:23:27', '2021-02-10 13:23:27'),
	(405, 2, 'GJD', 9, 'GOJEK DRIVER', NULL, NULL, 1, 106, NULL, '2021-02-10 13:23:27', '2021-02-10 13:23:27'),
	(406, 2, 'GB', 12, 'GRAB', NULL, NULL, 1, 106, NULL, '2021-02-10 13:23:27', '2021-02-10 13:23:27'),
	(407, 2, 'DNA', 116, 'DANA', NULL, NULL, 1, 106, NULL, '2021-02-10 13:23:27', '2021-02-10 13:23:27'),
	(408, 2, 'LINK', 117, 'LINKAJA', NULL, NULL, 1, 106, NULL, '2021-02-10 13:23:27', '2021-02-10 13:23:27'),
	(409, 2, 'GBD', 118, 'GRAB DRIVER', NULL, NULL, 1, 106, NULL, '2021-02-10 13:23:27', '2021-02-10 13:23:27'),
	(410, 2, 'VO', 128, 'OVO', NULL, NULL, 1, 106, NULL, '2021-02-10 13:23:27', '2021-02-10 13:23:27'),
	(411, 2, 'TIX', 130, 'TIX ID', NULL, NULL, 1, 106, NULL, '2021-02-10 13:23:27', '2021-02-10 13:23:27'),
	(412, 2, 'PLN', 133, 'PLN', NULL, NULL, 1, 107, NULL, '2021-02-10 13:23:31', '2021-02-10 13:23:31'),
	(413, 2, 'MET', 134, 'MANDIRI E-TOLL', NULL, NULL, 1, 108, NULL, '2021-02-10 13:23:37', '2021-02-10 13:23:37'),
	(414, 2, 'FF', 143, 'FREE FIRE', NULL, NULL, 1, 109, NULL, '2021-02-10 13:23:45', '2021-02-10 13:23:45'),
	(415, 2, 'MMX', 152, 'MAXIS', NULL, NULL, 1, 110, NULL, '2021-02-10 13:23:49', '2021-02-10 13:23:49'),
	(416, 2, 'MDG', 153, 'DIGI', NULL, NULL, 1, 110, NULL, '2021-02-10 13:23:49', '2021-02-10 13:23:49'),
	(417, 2, 'MCC', 154, 'CELCOM', NULL, NULL, 1, 110, NULL, '2021-02-10 13:23:49', '2021-02-10 13:23:49'),
	(418, 2, 'SGT', 155, 'SINGTEL', NULL, NULL, 1, 111, NULL, '2021-02-10 13:23:53', '2021-02-10 13:23:53');
/*!40000 ALTER TABLE `pembelianoperators` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.pembelianproduks
CREATE TABLE IF NOT EXISTS `pembelianproduks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id_server` int(11) NOT NULL DEFAULT 0,
  `apiserver_id` int(11) DEFAULT NULL,
  `pembelianoperator_id` bigint(20) unsigned NOT NULL,
  `pembeliankategori_id` bigint(20) unsigned NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_default` bigint(20) unsigned NOT NULL DEFAULT 0,
  `price_markup` bigint(20) unsigned NOT NULL DEFAULT 0,
  `price` bigint(20) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pembelianproduks_pembelianoperator_id_foreign` (`pembelianoperator_id`),
  KEY `pembelianproduks_pembeliankategori_id_foreign` (`pembeliankategori_id`),
  CONSTRAINT `pembelianproduks_pembeliankategori_id_foreign` FOREIGN KEY (`pembeliankategori_id`) REFERENCES `pembeliankategoris` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pembelianproduks_pembelianoperator_id_foreign` FOREIGN KEY (`pembelianoperator_id`) REFERENCES `pembelianoperators` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2793 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.pembelianproduks: ~154 rows (approximately)
/*!40000 ALTER TABLE `pembelianproduks` DISABLE KEYS */;
INSERT INTO `pembelianproduks` (`id`, `product_id`, `product_id_server`, `apiserver_id`, `pembelianoperator_id`, `pembeliankategori_id`, `product_name`, `desc`, `price_default`, `price_markup`, `price`, `status`, `created_at`, `updated_at`) VALUES
	(2635, 'AX5', 1, 2, 296, 97, 'AXIS 5.000', 'AXIS 5.000', 6073, 0, 6073, 1, '2021-02-10 13:24:17', '2021-02-10 13:24:17'),
	(2636, 'AX10', 2, 2, 296, 97, 'AXIS 10.000', 'AXIS 10.000', 10984, 0, 10984, 0, '2021-02-10 13:24:17', '2021-02-10 13:24:17'),
	(2637, 'AX25', 3, 2, 296, 97, 'AXIS 25.000', 'AXIS 25.000', 24874, 0, 24874, 1, '2021-02-10 13:24:18', '2021-02-10 13:24:18'),
	(2638, 'AX30', 4, 2, 296, 97, 'AXIS 30K', 'AXIS 30K', 30074, 0, 30074, 0, '2021-02-10 13:24:18', '2021-02-10 13:24:18'),
	(2639, 'AX50', 5, 2, 296, 97, 'AXIS 50.000', 'AXIS 50.000', 49499, 0, 49499, 1, '2021-02-10 13:24:18', '2021-02-10 13:24:18'),
	(2640, 'AX100', 6, 2, 296, 97, 'AXIS 100.000', 'AXIS 100.000', 98499, 0, 98499, 1, '2021-02-10 13:24:18', '2021-02-10 13:24:18'),
	(2641, 'AX15', 7, 2, 296, 97, 'AXIS 15K', 'AXIS 15K', 15224, 0, 15224, 0, '2021-02-10 13:24:18', '2021-02-10 13:24:18'),
	(2642, 'BO25', 23, 2, 297, 97, 'PULSA BOLT 25000', 'PULSA BOLT 25000', 24974, 0, 24974, 0, '2021-02-10 13:24:28', '2021-02-10 13:24:28'),
	(2643, 'BO50', 24, 2, 297, 97, 'PULSA BOLT 50000', 'PULSA BOLT 50000', 49474, 0, 49474, 0, '2021-02-10 13:24:28', '2021-02-10 13:24:28'),
	(2644, 'BO100', 25, 2, 297, 97, 'PULSA BOLT 100000', 'PULSA BOLT 100000', 97799, 0, 97799, 0, '2021-02-10 13:24:28', '2021-02-10 13:24:28'),
	(2645, 'BO150', 26, 2, 297, 97, 'PULSA BOLT 150000', 'PULSA BOLT 150000', 146399, 0, 146399, 0, '2021-02-10 13:24:28', '2021-02-10 13:24:28'),
	(2646, 'BO200', 27, 2, 297, 97, 'PULSA BOLT 200000', 'PULSA BOLT 200000', 195024, 0, 195024, 0, '2021-02-10 13:24:28', '2021-02-10 13:24:28'),
	(2647, 'C5', 33, 2, 298, 97, 'CERIA 5000', 'CERIA 5000', 5024, 0, 5024, 0, '2021-02-10 13:24:32', '2021-02-10 13:24:32'),
	(2648, 'C10', 34, 2, 298, 97, 'CERIA 10000', 'CERIA 10000', 9624, 0, 9624, 0, '2021-02-10 13:24:32', '2021-02-10 13:24:32'),
	(2649, 'C20', 35, 2, 298, 97, 'CERIA 20000', 'CERIA 20000', 18824, 0, 18824, 0, '2021-02-10 13:24:32', '2021-02-10 13:24:32'),
	(2650, 'C50', 36, 2, 298, 97, 'CERIA 50000', 'CERIA 50000', 48924, 0, 48924, 0, '2021-02-10 13:24:32', '2021-02-10 13:24:32'),
	(2651, 'C100', 37, 2, 298, 97, 'CERIA 100000', 'CERIA 100000', 97424, 0, 97424, 0, '2021-02-10 13:24:32', '2021-02-10 13:24:32'),
	(2652, 'I5', 74, 2, 299, 97, 'INDOSAT 5.000', 'INDOSAT 5.000', 5299, 0, 5299, 1, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2653, 'I10', 75, 2, 299, 97, 'INDOSAT 10.000', 'INDOSAT 10.000', 11089, 0, 11089, 1, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2654, 'I25', 76, 2, 299, 97, 'INDOSAT 25.000', 'INDOSAT 25.000', 25044, 0, 25044, 1, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2655, 'I50', 77, 2, 299, 97, 'INDOSAT 50.000', 'INDOSAT 50.000', 49074, 0, 49074, 1, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2656, 'I100', 78, 2, 299, 97, 'INDOSAT 100.000', 'INDOSAT 100.000', 96899, 0, 96899, 1, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2657, 'I20', 79, 2, 299, 97, 'INDOSAT 20.000', 'INDOSAT 20.000', 20159, 0, 20159, 1, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2658, 'I30', 80, 2, 299, 97, 'INDOSAT 30.000', 'INDOSAT 30.000', 30099, 0, 30099, 1, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2659, 'I200', 671, 2, 299, 97, 'INDOSAT 200.000', 'INDOSAT 200.000', 180274, 0, 180274, 1, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2660, 'I150', 672, 2, 299, 97, 'INDOSAT 150.000', 'INDOSAT 150.000', 142824, 0, 142824, 1, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2661, 'I250', 673, 2, 299, 97, 'INDOSAT 250.000', 'INDOSAT 250.000', 231574, 0, 231574, 1, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2662, 'I15', 677, 2, 299, 97, 'INDOSAT 15K', 'INDOSAT 15K', 15424, 0, 15424, 0, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2663, 'I12', 1030, 2, 299, 97, 'INDOSAT 12.000', 'INDOSAT 12.000', 12309, 0, 12309, 1, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2664, 'I500', 1031, 2, 299, 97, 'INDOSAT 500.000', 'INDOSAT 500.000', 462824, 0, 462824, 1, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2665, 'I1000', 1032, 2, 299, 97, 'INDOSAT 1.000.000', 'INDOSAT 1.000.000', 925324, 0, 925324, 1, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(2666, 'SM5', 145, 2, 300, 97, 'SMART 5.000', 'SMART 5.000', 5214, 0, 5214, 1, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2667, 'SM10', 146, 2, 300, 97, 'SMART 10.000', 'SMART 10.000', 10099, 0, 10099, 1, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2668, 'SM20', 147, 2, 300, 97, 'SMART 20.000', 'SMART 20.000', 19934, 0, 19934, 1, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2669, 'SM25', 148, 2, 300, 97, 'SMART 25.000', 'SMART 25.000', 25034, 0, 25034, 1, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2670, 'SM30', 149, 2, 300, 97, 'SMARTFREN 30K', 'SMARTFREN 30K', 29874, 0, 29874, 0, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2671, 'SM50', 150, 2, 300, 97, 'SMART 50.000', 'SMART 50.000', 49449, 0, 49449, 1, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2672, 'SM100', 151, 2, 300, 97, 'SMART 100.000', 'SMART 100.000', 96974, 0, 96974, 1, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2673, 'SM60', 152, 2, 300, 97, 'SMART 60.000', 'SMART 60.000', 59774, 0, 59774, 1, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2674, 'SM75', 153, 2, 300, 97, 'SMARTFREN 75K', 'SMARTFREN 75K', 74999, 0, 74999, 0, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2675, 'SM150', 1033, 2, 300, 97, 'SMART 150.000', 'SMART 150.000', 147784, 0, 147784, 1, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2676, 'SM200', 1034, 2, 300, 97, 'SMART 200.000', 'SMART 200.000', 197049, 0, 197049, 1, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2677, 'SM300', 1035, 2, 300, 97, 'SMART 300.000', 'SMART 300.000', 293924, 0, 293924, 1, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2678, 'SM500', 1036, 2, 300, 97, 'SMART 500.000', 'SMART 500.000', 491916, 0, 491916, 1, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2679, 'SM1000', 1037, 2, 300, 97, 'SMART 1.000.000', 'SMART 1.000.000', 982274, 0, 982274, 1, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(2680, 'S5', 168, 2, 301, 97, 'TELKOMSEL 5.000', 'TELKOMSEL 5.000', 5749, 0, 5749, 1, '2021-02-10 13:24:51', '2021-02-10 13:24:51'),
	(2681, 'S10', 169, 2, 301, 97, 'TELKOMSEL 10.000', 'TELKOMSEL 10.000', 9824, 0, 9824, 1, '2021-02-10 13:24:51', '2021-02-10 13:24:51'),
	(2682, 'S20', 170, 2, 301, 97, 'TELKOMSEL 20.000', 'TELKOMSEL 20.000', 20224, 0, 20224, 1, '2021-02-10 13:24:51', '2021-02-10 13:24:51'),
	(2683, 'S25', 171, 2, 301, 97, 'TELKOMSEL 25.000', 'TELKOMSEL 25.000', 25074, 0, 25074, 1, '2021-02-10 13:24:51', '2021-02-10 13:24:51'),
	(2684, 'S50', 172, 2, 301, 97, 'TELKOMSEL 50.000', 'TELKOMSEL 50.000', 50549, 0, 50549, 1, '2021-02-10 13:24:51', '2021-02-10 13:24:51'),
	(2685, 'S100', 173, 2, 301, 97, 'TELKOMSEL 100.000', 'TELKOMSEL 100.000', 97024, 0, 97024, 1, '2021-02-10 13:24:51', '2021-02-10 13:24:51'),
	(2686, 'S200', 174, 2, 301, 97, 'TELKOMSEL 200.000', 'TELKOMSEL 200.000', 195874, 0, 195874, 1, '2021-02-10 13:24:51', '2021-02-10 13:24:51'),
	(2687, 'S150', 175, 2, 301, 97, 'TELKOMSEL 150.000', 'TELKOMSEL 150.000', 148299, 0, 148299, 1, '2021-02-10 13:24:51', '2021-02-10 13:24:51'),
	(2688, 'S300', 176, 2, 301, 97, 'TELKOMSEL 300.000', 'TELKOMSEL 300.000', 291799, 0, 291799, 1, '2021-02-10 13:24:51', '2021-02-10 13:24:51'),
	(2689, 'S1', 177, 2, 301, 97, 'TELKOMSEL 1.000', 'TELKOMSEL 1.000', 1779, 0, 1779, 1, '2021-02-10 13:24:51', '2021-02-10 13:24:51'),
	(2690, 'S40', 587, 2, 301, 97, 'TELKOMSEL 40.000', 'TELKOMSEL 40.000', 39619, 0, 39619, 1, '2021-02-10 13:24:51', '2021-02-10 13:24:51'),
	(2691, 'S90', 588, 2, 301, 97, 'TELKOMSEL 90.000', 'TELKOMSEL 90.000', 90424, 0, 90424, 1, '2021-02-10 13:24:51', '2021-02-10 13:24:51'),
	(2692, 'S80', 589, 2, 301, 97, 'TELKOMSEL 80.000', 'TELKOMSEL 80.000', 80424, 0, 80424, 1, '2021-02-10 13:24:51', '2021-02-10 13:24:51'),
	(2693, 'S75', 590, 2, 301, 97, 'TELKOMSEL 75.000', 'TELKOMSEL 75.000', 73574, 0, 73574, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2694, 'S70', 591, 2, 301, 97, 'TELKOMSEL 70.000', 'TELKOMSEL 70.000', 70424, 0, 70424, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2695, 'S60', 592, 2, 301, 97, 'TELKOMSEL 60.000', 'TELKOMSEL 60.000', 60424, 0, 60424, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2696, 'S30', 593, 2, 301, 97, 'TELKOMSEL 30.000', 'TELKOMSEL 30.000', 29874, 0, 29874, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2697, 'S500', 1020, 2, 301, 97, 'TELKOMSEL 500.000', 'TELKOMSEL 500.000', 485899, 0, 485899, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2698, 'S1000', 1021, 2, 301, 97, 'TELKOMSEL 1.000.000', 'TELKOMSEL 1.000.000', 965299, 0, 965299, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2699, 'S2', 1022, 2, 301, 97, 'TELKOMSEL 2.000', 'TELKOMSEL 2.000', 2999, 0, 2999, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2700, 'S3', 1023, 2, 301, 97, 'TELKOMSEL 3.000', 'TELKOMSEL 3.000', 4109, 0, 4109, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2701, 'S65', 1024, 2, 301, 97, 'TELKOMSEL 65.000', 'TELKOMSEL 65.000', 65424, 0, 65424, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2702, 'S85', 1025, 2, 301, 97, 'TELKOMSEL 85.000', 'TELKOMSEL 85.000', 85479, 0, 85479, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2703, 'S35', 1026, 2, 301, 97, 'TELKOMSEL 35.000', 'TELKOMSEL 35.000', 35424, 0, 35424, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2704, 'S45', 1027, 2, 301, 97, 'TELKOMSEL 45.000', 'TELKOMSEL 45.000', 45424, 0, 45424, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2705, 'S55', 1028, 2, 301, 97, 'TELKOMSEL 55.000', 'TELKOMSEL 55.000', 55424, 0, 55424, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2706, 'S95', 1029, 2, 301, 97, 'TELKOMSEL 95.000', 'TELKOMSEL 95.000', 95424, 0, 95424, 1, '2021-02-10 13:24:52', '2021-02-10 13:24:52'),
	(2707, 'T1', 218, 2, 302, 97, 'THREE 1.000', 'THREE 1.000', 1465, 0, 1465, 1, '2021-02-10 13:24:56', '2021-02-10 13:24:56'),
	(2708, 'T2', 219, 2, 302, 97, 'THREE 2.000', 'THREE 2.000', 2419, 0, 2419, 1, '2021-02-10 13:24:56', '2021-02-10 13:24:56'),
	(2709, 'T3', 220, 2, 302, 97, 'THREE 3.000', 'THREE 3.000', 3391, 0, 3391, 1, '2021-02-10 13:24:56', '2021-02-10 13:24:56'),
	(2710, 'T4', 221, 2, 302, 97, 'TRI 4K', 'TRI 4K', 4651, 0, 4651, 0, '2021-02-10 13:24:56', '2021-02-10 13:24:56'),
	(2711, 'T5', 222, 2, 302, 97, 'THREE 5.000', 'THREE 5.000', 5531, 0, 5531, 1, '2021-02-10 13:24:56', '2021-02-10 13:24:56'),
	(2712, 'T6', 223, 2, 302, 97, 'TRI 6K', 'TRI 6K', 6737, 0, 6737, 0, '2021-02-10 13:24:56', '2021-02-10 13:24:56'),
	(2713, 'T7', 224, 2, 302, 97, 'TRI 7K', 'TRI 7K', 7720, 0, 7720, 0, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2714, 'T8', 225, 2, 302, 97, 'TRI 8K', 'TRI 8K', 8702, 0, 8702, 0, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2715, 'T9', 226, 2, 302, 97, 'TRI 9K', 'TRI 9K', 9685, 0, 9685, 0, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2716, 'T10', 227, 2, 302, 97, 'THREE 10.000', 'THREE 10.000', 10403, 0, 10403, 1, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2717, 'T20', 228, 2, 302, 97, 'THREE 20.000', 'THREE 20.000', 19634, 0, 19634, 1, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2718, 'T30', 229, 2, 302, 97, 'THREE 30.000', 'THREE 30.000', 29344, 0, 29344, 1, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2719, 'T40', 230, 2, 302, 97, 'TRI 40K', 'TRI 40K', 39774, 0, 39774, 0, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2720, 'T50', 231, 2, 302, 97, 'THREE 50.000', 'THREE 50.000', 48674, 0, 48674, 1, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2721, 'T75', 232, 2, 302, 97, 'TRI 75K', 'TRI 75K', 74262, 0, 74262, 0, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2722, 'T100', 233, 2, 302, 97, 'THREE 100.000', 'THREE 100.000', 97299, 0, 97299, 1, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2723, 'T150', 234, 2, 302, 97, 'THREE 150.000', 'THREE 150.000', 147549, 0, 147549, 1, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2724, 'T25', 235, 2, 302, 97, 'THREE 25.000', 'THREE 25.000', 24597, 0, 24597, 1, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2725, 'T15', 1038, 2, 302, 97, 'THREE 15.000', 'THREE 15.000', 14873, 0, 14873, 1, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2726, 'T300', 1039, 2, 302, 97, 'THREE 300.000', 'THREE 300.000', 294549, 0, 294549, 1, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2727, 'T500', 1040, 2, 302, 97, 'THREE 500.000', 'THREE 500.000', 490549, 0, 490549, 1, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(2728, 'X5', 267, 2, 303, 97, 'XL 5.000', 'XL 5.000', 6039, 0, 6039, 0, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(2729, 'X10', 268, 2, 303, 97, 'XL 10.000', 'XL 10.000', 10524, 0, 10524, 1, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(2730, 'X25', 269, 2, 303, 97, 'XL 25.000', 'XL 25.000', 25749, 0, 25749, 1, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(2731, 'X50', 270, 2, 303, 97, 'XL 50.000', 'XL 50.000', 49559, 0, 49559, 1, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(2732, 'X100', 271, 2, 303, 97, 'XL 100.000', 'XL 100.000', 98299, 0, 98299, 1, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(2733, 'X15', 272, 2, 303, 97, 'XL 15.000', 'XL 15.000', 15134, 0, 15134, 1, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(2734, 'X30', 273, 2, 303, 97, 'XL 30.000', 'XL 30.000', 29864, 0, 29864, 1, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(2735, 'X150', 1041, 2, 303, 97, 'XL 150.000', 'XL 150.000', 149499, 0, 149499, 1, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(2736, 'X200', 1042, 2, 303, 97, 'XL 200.000', 'XL 200.000', 197799, 0, 197799, 1, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(2737, 'X300', 1043, 2, 303, 97, 'XL 300.000', 'XL 300.000', 295274, 0, 295274, 0, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(2738, 'X500', 1044, 2, 303, 97, 'XL 500.000', 'XL 500.000', 491274, 0, 491274, 1, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(2739, 'X1000', 1045, 2, 303, 97, 'XL 1.000.000', 'XL 1.000.000', 985499, 0, 985499, 1, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(2740, 'BYU5', 1056, 2, 304, 97, 'BY.U 5.000', 'BY.U 5.000', 5525, 0, 5525, 1, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(2741, 'BYU10', 1057, 2, 304, 97, 'BY.U 10.000', 'BY.U 10.000', 10300, 0, 10300, 1, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(2742, 'BYU15', 1058, 2, 304, 97, 'BY.U 15.000', 'BY.U 15.000', 14980, 0, 14980, 1, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(2743, 'BYU20', 1059, 2, 304, 97, 'BY.U 20.000', 'BY.U 20.000', 20055, 0, 20055, 1, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(2744, 'BYU25', 1060, 2, 304, 97, 'BY.U 25.000', 'BY.U 25.000', 25055, 0, 25055, 1, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(2745, 'BYU50', 1061, 2, 304, 97, 'BY.U 50.000', 'BY.U 50.000', 50525, 0, 50525, 1, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(2746, 'BYU100', 1062, 2, 304, 97, 'BY.U 100.000', 'BY.U 100.000', 97070, 0, 97070, 1, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(2747, 'AIGO1', 8, 2, 305, 98, 'AIGO 1GB 24 JAM 30HR', 'AIGO 1GB 24 JAM 30HR', 13024, 0, 13024, 1, '2021-02-10 13:25:13', '2021-02-10 13:25:13'),
	(2748, 'AIGO5', 9, 2, 305, 98, 'AIGO 5GB 24 JAM 30HR', 'AIGO 5GB 24 JAM 30HR', 41874, 0, 41874, 1, '2021-02-10 13:25:13', '2021-02-10 13:25:13'),
	(2749, 'AIGO3', 10, 2, 305, 98, 'AIGO 3GB 24 JAM 30HR', 'AIGO 3GB 24 JAM 30HR', 28024, 0, 28024, 1, '2021-02-10 13:25:13', '2021-02-10 13:25:13'),
	(2750, 'AIGO2', 11, 2, 305, 98, 'AIGO 2GB 24 JAM 30HR', 'AIGO 2GB 24 JAM 30HR', 22224, 0, 22224, 1, '2021-02-10 13:25:13', '2021-02-10 13:25:13'),
	(2751, 'AIGO8', 12, 2, 305, 98, 'VOUCHER AIGO 8GB 30HR', 'VOUCHER AIGO 8GB 30HR', 59324, 0, 59324, 0, '2021-02-10 13:25:13', '2021-02-10 13:25:13'),
	(2752, 'AIM5', 13, 2, 306, 98, 'VOUCHER AIGO MINI 5GB 15HR', 'VOUCHER AIGO MINI 5GB 15HR', 32174, 0, 32174, 0, '2021-02-10 13:25:17', '2021-02-10 13:25:17'),
	(2753, 'AIM3', 14, 2, 306, 98, 'AIGO MINI 3GB 24 JAM 15HR', 'AIGO MINI 3GB 24 JAM 15HR', 19373, 0, 19373, 1, '2021-02-10 13:25:17', '2021-02-10 13:25:17'),
	(2754, 'AIM2', 15, 2, 306, 98, 'AIGO MINI 2GB 24 JAM 7HR', 'AIGO MINI 2GB 24 JAM 7HR', 14973, 0, 14973, 1, '2021-02-10 13:25:17', '2021-02-10 13:25:17'),
	(2755, 'AIM1', 16, 2, 306, 98, 'AIGO MINI 1GB 24 JAM 5HR', 'AIGO MINI 1GB 24 JAM 5HR', 7874, 0, 7874, 1, '2021-02-10 13:25:17', '2021-02-10 13:25:17'),
	(2756, 'AXD300', 17, 2, 307, 98, 'BRONET 300MB 7HR', 'BRONET 300MB 7HR', 10824, 0, 10824, 0, '2021-02-10 13:25:21', '2021-02-10 13:25:21'),
	(2757, 'AXD1', 18, 2, 307, 98, 'BRONET 1 GB / 30 HARI', 'BRONET 1 GB / 30 HARI', 13249, 0, 13249, 1, '2021-02-10 13:25:21', '2021-02-10 13:25:21'),
	(2758, 'AXD2', 19, 2, 307, 98, 'BRONET 2 GB / 30 HARI', 'BRONET 2 GB / 30 HARI', 25684, 0, 25684, 1, '2021-02-10 13:25:21', '2021-02-10 13:25:21'),
	(2759, 'AXD3', 20, 2, 307, 98, 'BRONET 3 GB / 30 HARI', 'BRONET 3 GB / 30 HARI', 28199, 0, 28199, 1, '2021-02-10 13:25:21', '2021-02-10 13:25:21'),
	(2760, 'AXD5', 21, 2, 307, 98, 'BRONET 5 GB / 30 HARI', 'BRONET 5 GB / 30 HARI', 41799, 0, 41799, 1, '2021-02-10 13:25:21', '2021-02-10 13:25:21'),
	(2761, 'AXD8', 22, 2, 307, 98, 'BRONET 8 GB / 30 HARI', 'BRONET 8 GB / 30 HARI', 66594, 0, 66594, 1, '2021-02-10 13:25:21', '2021-02-10 13:25:21'),
	(2762, 'IDB3', 81, 2, 308, 98, '3GB+18GB(01-06)+4GB 4G, 30HR', '3GB+18GB(01-06)+4GB 4G, 30HR', 43924, 0, 43924, 0, '2021-02-10 13:25:26', '2021-02-10 13:25:26'),
	(2763, 'IDB9', 82, 2, 308, 98, '9GB+16GB(01-06)+5GB 4G, 60HR', '9GB+16GB(01-06)+5GB 4G, 60HR', 60074, 0, 60074, 0, '2021-02-10 13:25:26', '2021-02-10 13:25:26'),
	(2764, 'IDB20', 83, 2, 308, 98, '20GB+10GB(01-06)+5GB 4G, 60HR', '20GB+10GB(01-06)+5GB 4G, 60HR', 86274, 0, 86274, 0, '2021-02-10 13:25:26', '2021-02-10 13:25:26'),
	(2765, 'IDX2', 84, 2, 309, 98, 'EXTRA 2GB', 'EXTRA 2GB', 37274, 0, 37274, 0, '2021-02-10 13:25:30', '2021-02-10 13:25:30'),
	(2766, 'IDX4', 85, 2, 309, 98, 'EXTRA 4GB', 'EXTRA 4GB', 52924, 0, 52924, 0, '2021-02-10 13:25:30', '2021-02-10 13:25:30'),
	(2767, 'IDX6', 86, 2, 309, 98, 'EXTRA 6GB', 'EXTRA 6GB', 70224, 0, 70224, 0, '2021-02-10 13:25:30', '2021-02-10 13:25:30'),
	(2768, 'IFC1', 87, 2, 310, 98, 'INDOSAT FREEDOM M', 'INDOSAT FREEDOM M', 65249, 0, 65249, 0, '2021-02-10 13:25:36', '2021-02-10 13:25:36'),
	(2769, 'IFC3', 88, 2, 310, 98, 'INDOSAT FREEDOM L', 'INDOSAT FREEDOM L', 100774, 0, 100774, 1, '2021-02-10 13:25:36', '2021-02-10 13:25:36'),
	(2770, 'IFC5', 89, 2, 310, 98, 'FREEDOM XL, 8+12GB 4G, 30HR', 'FREEDOM XL, 8+12GB 4G, 30HR', 115849, 0, 115849, 0, '2021-02-10 13:25:36', '2021-02-10 13:25:36'),
	(2771, 'IFC10', 90, 2, 310, 98, 'FREEDOM XXL, 12+25GB 4G, 30HR', 'FREEDOM XXL, 12+25GB 4G, 30HR', 154974, 0, 154974, 0, '2021-02-10 13:25:36', '2021-02-10 13:25:36'),
	(2772, 'IDM2', 91, 2, 311, 98, 'MINI 2GB+500MB LOKAL+3.5GB MALAM+500MB APPS 30HR', 'MINI 2GB+500MB LOKAL+3.5GB MALAM+500MB APPS 30HR', 35049, 0, 35049, 0, '2021-02-10 13:25:46', '2021-02-10 13:25:46'),
	(2773, 'IDM1', 92, 2, 311, 98, 'MINI 1GB+500MB LOKAL+1GB MALAM+500MB APPS 30HR', 'MINI 1GB+500MB LOKAL+1GB MALAM+500MB APPS 30HR', 19549, 0, 19549, 0, '2021-02-10 13:25:46', '2021-02-10 13:25:46'),
	(2774, 'IDN1', 93, 2, 312, 98, 'INDOSAT 1 GB / 30 HARI', 'INDOSAT 1 GB / 30 HARI', 8184, 0, 8184, 1, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(2775, 'IDN2', 94, 2, 312, 98, 'KUOTA 2GB 30HR', 'KUOTA 2GB 30HR', 32624, 0, 32624, 0, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(2776, 'IDN3', 95, 2, 312, 98, 'INDOSAT 3 GB / 30 HARI', 'INDOSAT 3 GB / 30 HARI', 23176, 0, 23176, 1, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(2777, 'IDN10', 96, 2, 312, 98, 'KUOTA 10GB + SMS&TELP SESAMA 30HR', 'KUOTA 10GB + SMS&TELP SESAMA 30HR', 92024, 0, 92024, 0, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(2778, 'IDN7', 97, 2, 312, 98, 'KUOTA 7GB + SMS SESAMA 30HR', 'KUOTA 7GB + SMS SESAMA 30HR', 71624, 0, 71624, 0, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(2779, 'IDN15', 98, 2, 312, 98, 'KUOTA 15GB + SMS&TELP SESAMA 30HR', 'KUOTA 15GB + SMS&TELP SESAMA 30HR', 127424, 0, 127424, 0, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(2780, 'IDN99', 99, 2, 312, 98, 'KUOTA UNLIMITED + SMS&TELP SESAMA 30HR', 'KUOTA UNLIMITED + SMS&TELP SESAMA 30HR', 156024, 0, 156024, 0, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(2781, 'IDN5', 998, 2, 312, 98, 'INDOSAT 5 GB / 30 HARI', 'INDOSAT 5 GB / 30 HARI', 43024, 0, 43024, 1, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(2782, 'IDH1', 117, 2, 313, 98, 'INDOSAT YELLOW 1 GB / 1 HARI', 'INDOSAT YELLOW 1 GB / 1 HARI', 3524, 0, 3524, 0, '2021-02-10 13:25:54', '2021-02-10 13:25:54'),
	(2783, 'IDH15', 118, 2, 313, 98, 'INDOSAT YELLOW 1 GB / 15 HARI', 'INDOSAT YELLOW 1 GB / 15 HARI', 13274, 0, 13274, 1, '2021-02-10 13:25:54', '2021-02-10 13:25:54'),
	(2784, 'IDH7', 119, 2, 313, 98, 'INDOSAT YELLOW 1 GB / 7 HARI', 'INDOSAT YELLOW 1 GB / 7 HARI', 9973, 0, 9973, 1, '2021-02-10 13:25:54', '2021-02-10 13:25:54'),
	(2785, 'IDH3', 120, 2, 313, 98, 'INDOSAT YELLOW 1 GB / 3 HARI', 'INDOSAT YELLOW 1 GB / 3 HARI', 4274, 0, 4274, 1, '2021-02-10 13:25:54', '2021-02-10 13:25:54'),
	(2786, 'SMV20', 154, 2, 314, 98, 'SMART 4 GB / 14 HARI', 'SMART 4 GB / 14 HARI', 20074, 0, 20074, 0, '2021-02-10 13:26:27', '2021-02-10 13:26:27'),
	(2787, 'SMV200', 155, 2, 314, 98, 'VOLUME 30GB + 30GB MALAM 30HR', 'VOLUME 30GB + 30GB MALAM 30HR', 182874, 0, 182874, 0, '2021-02-10 13:26:27', '2021-02-10 13:26:27'),
	(2788, 'SMV150', 156, 2, 314, 98, 'VOLUME 22.5GB + 22.5GB MALAM 30HR', 'VOLUME 22.5GB + 22.5GB MALAM 30HR', 142774, 0, 142774, 0, '2021-02-10 13:26:27', '2021-02-10 13:26:27'),
	(2789, 'SMV100', 157, 2, 314, 98, 'SMART 30 GB / 30 HARI', 'SMART 30 GB / 30 HARI', 55299, 0, 55299, 1, '2021-02-10 13:26:27', '2021-02-10 13:26:27'),
	(2790, 'SMV60', 158, 2, 314, 98, 'SMART 16 GB / 30 HARI', 'SMART 16 GB / 30 HARI', 48524, 0, 48524, 0, '2021-02-10 13:26:27', '2021-02-10 13:26:27'),
	(2791, 'SMV30', 159, 2, 314, 98, 'SMART 8 GB / 14 HARI', 'SMART 8 GB / 14 HARI', 30274, 0, 30274, 0, '2021-02-10 13:26:27', '2021-02-10 13:26:27'),
	(2792, 'SMV65', 615, 2, 314, 98, 'VOLUME UNLIMITED 4G 30HR', 'VOLUME UNLIMITED 4G 30HR', 65974, 0, 65974, 0, '2021-02-10 13:26:27', '2021-02-10 13:26:27');
/*!40000 ALTER TABLE `pembelianproduks` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.pembelian_markups
CREATE TABLE IF NOT EXISTS `pembelian_markups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` bigint(20) unsigned NOT NULL,
  `price_default` bigint(20) unsigned NOT NULL DEFAULT 0,
  `markup_personal` bigint(20) unsigned NOT NULL DEFAULT 0,
  `price_ttl_personal` bigint(20) unsigned NOT NULL DEFAULT 0,
  `markup_agen` bigint(20) unsigned NOT NULL DEFAULT 0,
  `price_ttl_agen` bigint(20) unsigned NOT NULL DEFAULT 0,
  `markup_enterprise` bigint(20) unsigned NOT NULL DEFAULT 0,
  `price_ttl_enterprise` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `pembelian_markups_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `pembelianproduks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.pembelian_markups: ~148 rows (approximately)
/*!40000 ALTER TABLE `pembelian_markups` DISABLE KEYS */;
INSERT INTO `pembelian_markups` (`id`, `id_product`, `price_default`, `markup_personal`, `price_ttl_personal`, `markup_agen`, `price_ttl_agen`, `markup_enterprise`, `price_ttl_enterprise`, `created_at`, `updated_at`) VALUES
	(13217, 2635, 6073, 0, 6073, 0, 6073, 0, 6073, '2021-02-10 13:24:17', '2021-02-11 08:06:24'),
	(13218, 2636, 10984, 0, 10984, 0, 10984, 0, 10984, '2021-02-10 13:24:17', '2021-02-10 13:24:17'),
	(13219, 2637, 24874, 0, 24874, 0, 24874, 0, 24874, '2021-02-10 13:24:18', '2021-02-10 13:24:18'),
	(13220, 2638, 30074, 0, 30074, 0, 30074, 0, 30074, '2021-02-10 13:24:18', '2021-02-10 13:24:18'),
	(13221, 2639, 49499, 0, 49499, 0, 49499, 0, 49499, '2021-02-10 13:24:18', '2021-02-10 13:24:18'),
	(13222, 2640, 98499, 0, 98499, 0, 98499, 0, 98499, '2021-02-10 13:24:18', '2021-02-10 13:24:18'),
	(13223, 2641, 15224, 0, 15224, 0, 15224, 0, 15224, '2021-02-10 13:24:18', '2021-02-10 13:24:18'),
	(13224, 2642, 24974, 0, 24974, 0, 24974, 0, 24974, '2021-02-10 13:24:28', '2021-02-10 13:24:28'),
	(13225, 2643, 49474, 0, 49474, 0, 49474, 0, 49474, '2021-02-10 13:24:28', '2021-02-10 13:24:28'),
	(13226, 2644, 97799, 0, 97799, 0, 97799, 0, 97799, '2021-02-10 13:24:28', '2021-02-10 13:24:28'),
	(13227, 2645, 146399, 0, 146399, 0, 146399, 0, 146399, '2021-02-10 13:24:28', '2021-02-10 13:24:28'),
	(13228, 2646, 195024, 0, 195024, 0, 195024, 0, 195024, '2021-02-10 13:24:28', '2021-02-10 13:24:28'),
	(13229, 2647, 5024, 0, 5024, 0, 5024, 0, 5024, '2021-02-10 13:24:32', '2021-02-10 13:24:32'),
	(13230, 2648, 9624, 0, 9624, 0, 9624, 0, 9624, '2021-02-10 13:24:32', '2021-02-10 13:24:32'),
	(13231, 2649, 18824, 0, 18824, 0, 18824, 0, 18824, '2021-02-10 13:24:32', '2021-02-10 13:24:32'),
	(13232, 2650, 48924, 0, 48924, 0, 48924, 0, 48924, '2021-02-10 13:24:32', '2021-02-10 13:24:32'),
	(13233, 2651, 97424, 0, 97424, 0, 97424, 0, 97424, '2021-02-10 13:24:32', '2021-02-10 13:24:32'),
	(13234, 2652, 5299, 0, 5299, 0, 5299, 0, 5299, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13235, 2653, 11089, 0, 11089, 0, 11089, 0, 11089, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13236, 2654, 25044, 0, 25044, 0, 25044, 0, 25044, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13237, 2655, 49074, 0, 49074, 0, 49074, 0, 49074, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13238, 2656, 96899, 0, 96899, 0, 96899, 0, 96899, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13239, 2657, 20159, 0, 20159, 0, 20159, 0, 20159, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13240, 2658, 30099, 0, 30099, 0, 30099, 0, 30099, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13241, 2659, 180274, 0, 180274, 0, 180274, 0, 180274, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13242, 2660, 142824, 0, 142824, 0, 142824, 0, 142824, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13243, 2661, 231574, 0, 231574, 0, 231574, 0, 231574, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13244, 2662, 15424, 0, 15424, 0, 15424, 0, 15424, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13245, 2663, 12309, 0, 12309, 0, 12309, 0, 12309, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13246, 2664, 462824, 0, 462824, 0, 462824, 0, 462824, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13247, 2665, 925324, 0, 925324, 0, 925324, 0, 925324, '2021-02-10 13:24:41', '2021-02-10 13:24:41'),
	(13248, 2666, 5214, 0, 5214, 0, 5214, 0, 5214, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13249, 2667, 10099, 0, 10099, 0, 10099, 0, 10099, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13250, 2668, 19934, 0, 19934, 0, 19934, 0, 19934, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13251, 2669, 25034, 0, 25034, 0, 25034, 0, 25034, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13252, 2670, 29874, 0, 29874, 0, 29874, 0, 29874, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13253, 2671, 49449, 0, 49449, 0, 49449, 0, 49449, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13254, 2672, 96974, 0, 96974, 0, 96974, 0, 96974, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13255, 2673, 59774, 0, 59774, 0, 59774, 0, 59774, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13256, 2674, 74999, 0, 74999, 0, 74999, 0, 74999, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13257, 2675, 147784, 0, 147784, 0, 147784, 0, 147784, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13258, 2676, 197049, 0, 197049, 0, 197049, 0, 197049, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13259, 2677, 293924, 0, 293924, 0, 293924, 0, 293924, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13260, 2678, 491916, 0, 491916, 0, 491916, 0, 491916, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13261, 2679, 982274, 0, 982274, 0, 982274, 0, 982274, '2021-02-10 13:24:45', '2021-02-10 13:24:45'),
	(13262, 2680, 5749, 800, 6549, 0, 5749, 0, 5749, '2021-02-10 13:24:51', '2021-02-11 08:06:46'),
	(13263, 2681, 9824, 800, 10624, 0, 9824, 0, 9824, '2021-02-10 13:24:51', '2021-02-11 08:06:46'),
	(13264, 2682, 20224, 800, 21024, 0, 20224, 0, 20224, '2021-02-10 13:24:51', '2021-02-11 08:06:46'),
	(13265, 2683, 25074, 800, 25874, 0, 25074, 0, 25074, '2021-02-10 13:24:51', '2021-02-11 08:06:46'),
	(13266, 2684, 50549, 800, 51349, 0, 50549, 0, 50549, '2021-02-10 13:24:51', '2021-02-11 08:06:46'),
	(13267, 2685, 97024, 800, 97824, 0, 97024, 0, 97024, '2021-02-10 13:24:51', '2021-02-11 08:06:46'),
	(13268, 2686, 195874, 800, 196674, 0, 195874, 0, 195874, '2021-02-10 13:24:51', '2021-02-11 08:06:46'),
	(13269, 2687, 148299, 800, 149099, 0, 148299, 0, 148299, '2021-02-10 13:24:51', '2021-02-11 08:06:46'),
	(13270, 2688, 291799, 800, 292599, 0, 291799, 0, 291799, '2021-02-10 13:24:51', '2021-02-11 08:06:46'),
	(13271, 2689, 1779, 800, 2579, 0, 1779, 0, 1779, '2021-02-10 13:24:51', '2021-02-11 08:06:46'),
	(13272, 2690, 39619, 800, 40419, 0, 39619, 0, 39619, '2021-02-10 13:24:51', '2021-02-11 08:06:46'),
	(13273, 2691, 90424, 800, 91224, 0, 90424, 0, 90424, '2021-02-10 13:24:51', '2021-02-11 08:06:46'),
	(13274, 2692, 80424, 800, 81224, 0, 80424, 0, 80424, '2021-02-10 13:24:51', '2021-02-11 08:06:46'),
	(13275, 2693, 73574, 800, 74374, 0, 73574, 0, 73574, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13276, 2694, 70424, 800, 71224, 0, 70424, 0, 70424, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13277, 2695, 60424, 800, 61224, 0, 60424, 0, 60424, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13278, 2696, 29874, 800, 30674, 0, 29874, 0, 29874, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13279, 2697, 485899, 800, 486699, 0, 485899, 0, 485899, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13280, 2698, 965299, 800, 966099, 0, 965299, 0, 965299, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13281, 2699, 2999, 800, 3799, 0, 2999, 0, 2999, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13282, 2700, 4109, 800, 4909, 0, 4109, 0, 4109, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13283, 2701, 65424, 800, 66224, 0, 65424, 0, 65424, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13284, 2702, 85479, 800, 86279, 0, 85479, 0, 85479, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13285, 2703, 35424, 800, 36224, 0, 35424, 0, 35424, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13286, 2704, 45424, 800, 46224, 0, 45424, 0, 45424, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13287, 2705, 55424, 800, 56224, 0, 55424, 0, 55424, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13288, 2706, 95424, 800, 96224, 0, 95424, 0, 95424, '2021-02-10 13:24:52', '2021-02-11 08:06:46'),
	(13289, 2707, 1465, 0, 1465, 0, 1465, 0, 1465, '2021-02-10 13:24:56', '2021-02-10 13:24:56'),
	(13290, 2708, 2419, 0, 2419, 0, 2419, 0, 2419, '2021-02-10 13:24:56', '2021-02-10 13:24:56'),
	(13291, 2709, 3391, 0, 3391, 0, 3391, 0, 3391, '2021-02-10 13:24:56', '2021-02-10 13:24:56'),
	(13292, 2710, 4651, 0, 4651, 0, 4651, 0, 4651, '2021-02-10 13:24:56', '2021-02-10 13:24:56'),
	(13293, 2711, 5531, 0, 5531, 0, 5531, 0, 5531, '2021-02-10 13:24:56', '2021-02-10 13:24:56'),
	(13294, 2712, 6737, 0, 6737, 0, 6737, 0, 6737, '2021-02-10 13:24:56', '2021-02-10 13:24:56'),
	(13295, 2713, 7720, 0, 7720, 0, 7720, 0, 7720, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13296, 2714, 8702, 0, 8702, 0, 8702, 0, 8702, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13297, 2715, 9685, 0, 9685, 0, 9685, 0, 9685, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13298, 2716, 10403, 0, 10403, 0, 10403, 0, 10403, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13299, 2717, 19634, 0, 19634, 0, 19634, 0, 19634, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13300, 2718, 29344, 0, 29344, 0, 29344, 0, 29344, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13301, 2719, 39774, 0, 39774, 0, 39774, 0, 39774, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13302, 2720, 48674, 0, 48674, 0, 48674, 0, 48674, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13303, 2721, 74262, 0, 74262, 0, 74262, 0, 74262, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13304, 2722, 97299, 0, 97299, 0, 97299, 0, 97299, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13305, 2723, 147549, 0, 147549, 0, 147549, 0, 147549, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13306, 2724, 24597, 0, 24597, 0, 24597, 0, 24597, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13307, 2725, 14873, 0, 14873, 0, 14873, 0, 14873, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13308, 2726, 294549, 0, 294549, 0, 294549, 0, 294549, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13309, 2727, 490549, 0, 490549, 0, 490549, 0, 490549, '2021-02-10 13:24:57', '2021-02-10 13:24:57'),
	(13310, 2728, 6039, 0, 6039, 0, 6039, 0, 6039, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(13311, 2729, 10524, 0, 10524, 0, 10524, 0, 10524, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(13312, 2730, 25749, 0, 25749, 0, 25749, 0, 25749, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(13313, 2731, 49559, 0, 49559, 0, 49559, 0, 49559, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(13314, 2732, 98299, 0, 98299, 0, 98299, 0, 98299, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(13315, 2733, 15134, 0, 15134, 0, 15134, 0, 15134, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(13316, 2734, 29864, 0, 29864, 0, 29864, 0, 29864, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(13317, 2735, 149499, 0, 149499, 0, 149499, 0, 149499, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(13318, 2736, 197799, 0, 197799, 0, 197799, 0, 197799, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(13319, 2737, 295274, 0, 295274, 0, 295274, 0, 295274, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(13320, 2738, 491274, 0, 491274, 0, 491274, 0, 491274, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(13321, 2739, 985499, 0, 985499, 0, 985499, 0, 985499, '2021-02-10 13:25:01', '2021-02-10 13:25:01'),
	(13322, 2740, 5525, 0, 5525, 0, 5525, 0, 5525, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(13323, 2741, 10300, 0, 10300, 0, 10300, 0, 10300, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(13324, 2742, 14980, 0, 14980, 0, 14980, 0, 14980, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(13325, 2743, 20055, 0, 20055, 0, 20055, 0, 20055, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(13326, 2744, 25055, 0, 25055, 0, 25055, 0, 25055, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(13327, 2745, 50525, 0, 50525, 0, 50525, 0, 50525, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(13328, 2746, 97070, 0, 97070, 0, 97070, 0, 97070, '2021-02-10 13:25:07', '2021-02-10 13:25:07'),
	(13329, 2747, 13024, 0, 13024, 0, 13024, 0, 13024, '2021-02-10 13:25:13', '2021-02-10 13:25:13'),
	(13330, 2748, 41874, 0, 41874, 0, 41874, 0, 41874, '2021-02-10 13:25:13', '2021-02-10 13:25:13'),
	(13331, 2749, 28024, 0, 28024, 0, 28024, 0, 28024, '2021-02-10 13:25:13', '2021-02-10 13:25:13'),
	(13332, 2750, 22224, 0, 22224, 0, 22224, 0, 22224, '2021-02-10 13:25:13', '2021-02-10 13:25:13'),
	(13333, 2751, 59324, 0, 59324, 0, 59324, 0, 59324, '2021-02-10 13:25:13', '2021-02-10 13:25:13'),
	(13334, 2752, 32174, 0, 32174, 0, 32174, 0, 32174, '2021-02-10 13:25:17', '2021-02-10 13:25:17'),
	(13335, 2753, 19373, 0, 19373, 0, 19373, 0, 19373, '2021-02-10 13:25:17', '2021-02-10 13:25:17'),
	(13336, 2754, 14973, 0, 14973, 0, 14973, 0, 14973, '2021-02-10 13:25:17', '2021-02-10 13:25:17'),
	(13337, 2755, 7874, 0, 7874, 0, 7874, 0, 7874, '2021-02-10 13:25:17', '2021-02-10 13:25:17'),
	(13338, 2756, 10824, 0, 10824, 0, 10824, 0, 10824, '2021-02-10 13:25:21', '2021-02-10 13:25:21'),
	(13339, 2757, 13249, 0, 13249, 0, 13249, 0, 13249, '2021-02-10 13:25:21', '2021-02-10 13:25:21'),
	(13340, 2758, 25684, 0, 25684, 0, 25684, 0, 25684, '2021-02-10 13:25:21', '2021-02-10 13:25:21'),
	(13341, 2759, 28199, 0, 28199, 0, 28199, 0, 28199, '2021-02-10 13:25:21', '2021-02-10 13:25:21'),
	(13342, 2760, 41799, 0, 41799, 0, 41799, 0, 41799, '2021-02-10 13:25:21', '2021-02-10 13:25:21'),
	(13343, 2761, 66594, 0, 66594, 0, 66594, 0, 66594, '2021-02-10 13:25:21', '2021-02-10 13:25:21'),
	(13344, 2762, 43924, 0, 43924, 0, 43924, 0, 43924, '2021-02-10 13:25:26', '2021-02-10 13:25:26'),
	(13345, 2763, 60074, 0, 60074, 0, 60074, 0, 60074, '2021-02-10 13:25:26', '2021-02-10 13:25:26'),
	(13346, 2764, 86274, 0, 86274, 0, 86274, 0, 86274, '2021-02-10 13:25:26', '2021-02-10 13:25:26'),
	(13347, 2765, 37274, 0, 37274, 0, 37274, 0, 37274, '2021-02-10 13:25:30', '2021-02-10 13:25:30'),
	(13348, 2766, 52924, 0, 52924, 0, 52924, 0, 52924, '2021-02-10 13:25:30', '2021-02-10 13:25:30'),
	(13349, 2767, 70224, 0, 70224, 0, 70224, 0, 70224, '2021-02-10 13:25:30', '2021-02-10 13:25:30'),
	(13350, 2768, 65249, 0, 65249, 0, 65249, 0, 65249, '2021-02-10 13:25:36', '2021-02-10 13:25:36'),
	(13351, 2769, 100774, 0, 100774, 0, 100774, 0, 100774, '2021-02-10 13:25:36', '2021-02-10 13:25:36'),
	(13352, 2770, 115849, 0, 115849, 0, 115849, 0, 115849, '2021-02-10 13:25:36', '2021-02-10 13:25:36'),
	(13353, 2771, 154974, 0, 154974, 0, 154974, 0, 154974, '2021-02-10 13:25:36', '2021-02-10 13:25:36'),
	(13354, 2772, 35049, 0, 35049, 0, 35049, 0, 35049, '2021-02-10 13:25:46', '2021-02-10 13:25:46'),
	(13355, 2773, 19549, 0, 19549, 0, 19549, 0, 19549, '2021-02-10 13:25:46', '2021-02-10 13:25:46'),
	(13356, 2774, 8184, 0, 8184, 0, 8184, 0, 8184, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(13357, 2775, 32624, 0, 32624, 0, 32624, 0, 32624, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(13358, 2776, 23176, 0, 23176, 0, 23176, 0, 23176, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(13359, 2777, 92024, 0, 92024, 0, 92024, 0, 92024, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(13360, 2778, 71624, 0, 71624, 0, 71624, 0, 71624, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(13361, 2779, 127424, 0, 127424, 0, 127424, 0, 127424, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(13362, 2780, 156024, 0, 156024, 0, 156024, 0, 156024, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(13363, 2781, 43024, 0, 43024, 0, 43024, 0, 43024, '2021-02-10 13:25:50', '2021-02-10 13:25:50'),
	(13364, 2782, 3524, 0, 3524, 0, 3524, 0, 3524, '2021-02-10 13:25:54', '2021-02-10 13:25:54'),
	(13365, 2783, 13274, 0, 13274, 0, 13274, 0, 13274, '2021-02-10 13:25:54', '2021-02-10 13:25:54'),
	(13366, 2784, 9973, 0, 9973, 0, 9973, 0, 9973, '2021-02-10 13:25:54', '2021-02-10 13:25:54'),
	(13367, 2785, 4274, 0, 4274, 0, 4274, 0, 4274, '2021-02-10 13:25:54', '2021-02-10 13:25:54'),
	(13368, 2786, 20074, 0, 20074, 0, 20074, 0, 20074, '2021-02-10 13:26:27', '2021-02-10 13:26:27'),
	(13369, 2787, 182874, 0, 182874, 0, 182874, 0, 182874, '2021-02-10 13:26:27', '2021-02-10 13:26:27'),
	(13370, 2788, 142774, 0, 142774, 0, 142774, 0, 142774, '2021-02-10 13:26:27', '2021-02-10 13:26:27'),
	(13371, 2789, 55299, 0, 55299, 0, 55299, 0, 55299, '2021-02-10 13:26:27', '2021-02-10 13:26:27'),
	(13372, 2790, 48524, 0, 48524, 0, 48524, 0, 48524, '2021-02-10 13:26:27', '2021-02-10 13:26:27'),
	(13373, 2791, 30274, 0, 30274, 0, 30274, 0, 30274, '2021-02-10 13:26:27', '2021-02-10 13:26:27'),
	(13374, 2792, 65974, 0, 65974, 0, 65974, 0, 65974, '2021-02-10 13:26:27', '2021-02-10 13:26:27');
/*!40000 ALTER TABLE `pembelian_markups` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.pengumuman
CREATE TABLE IF NOT EXISTS `pengumuman` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.pengumuman: ~0 rows (approximately)
/*!40000 ALTER TABLE `pengumuman` DISABLE KEYS */;
INSERT INTO `pengumuman` (`id`, `content`, `created_at`, `updated_at`) VALUES
	(1, '', '2020-08-04 18:50:24', '2020-08-11 14:20:04');
/*!40000 ALTER TABLE `pengumuman` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.prefix_phones
CREATE TABLE IF NOT EXISTS `prefix_phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `prefix` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table tripay_webpulsa.prefix_phones: ~9 rows (approximately)
/*!40000 ALTER TABLE `prefix_phones` DISABLE KEYS */;
INSERT INTO `prefix_phones` (`id`, `name`, `prefix`, `created_at`, `updated_at`) VALUES
	(1, 'AXIS', '0831,0832,0838', '2020-05-30 19:46:14', '0000-00-00 00:00:00'),
	(2, 'BOLT', '998,999', '2020-05-30 19:46:14', '0000-00-00 00:00:00'),
	(3, 'CERIA', '0828', '2020-05-30 19:46:14', '0000-00-00 00:00:00'),
	(4, 'INDOSAT', '0856,0857,0858,0815,0816,0855,0814', '2020-05-30 19:46:14', '0000-00-00 00:00:00'),
	(5, 'SMARTFREN', '0881,0882,0883,0884,0885,0886,0887,0888,0889', '2020-05-30 19:46:14', '0000-00-00 00:00:00'),
	(6, 'TELKOMSEL', '0811,0812,0813,0821,0822,0823,0852,0853,0851', '2020-05-30 19:46:14', '0000-00-00 00:00:00'),
	(7, 'TRI', '0896,0897,0898,0899,0895', '2020-05-30 19:46:14', '0000-00-00 00:00:00'),
	(8, 'XL', '0817,0818,0819,0859,0877,0878', '2020-05-30 19:46:14', '0000-00-00 00:00:00'),
	(9, 'BY.U', '0851', '2020-08-03 00:00:00', '2020-08-03 00:00:00');
/*!40000 ALTER TABLE `prefix_phones` ENABLE KEYS */;

-- Dumping structure for view tripay_webpulsa.produkpembelian_agen
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `produkpembelian_agen` (
	`id` BIGINT(20) UNSIGNED NOT NULL,
	`product_id` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`pembelianoperator_id` BIGINT(20) UNSIGNED NOT NULL,
	`pembeliankategori_id` BIGINT(20) UNSIGNED NOT NULL,
	`product_name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`desc` VARCHAR(255) NULL COLLATE 'utf8mb4_unicode_ci',
	`price_default` BIGINT(20) UNSIGNED NOT NULL,
	`price_markup` BIGINT(20) UNSIGNED NOT NULL,
	`price` BIGINT(20) UNSIGNED NOT NULL,
	`status` TINYINT(1) NOT NULL,
	`created_at` TIMESTAMP NULL,
	`updated_at` TIMESTAMP NULL
) ENGINE=MyISAM;

-- Dumping structure for view tripay_webpulsa.produkpembelian_enterprise
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `produkpembelian_enterprise` (
	`id` BIGINT(20) UNSIGNED NOT NULL,
	`product_id` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`pembelianoperator_id` BIGINT(20) UNSIGNED NOT NULL,
	`pembeliankategori_id` BIGINT(20) UNSIGNED NOT NULL,
	`product_name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`desc` VARCHAR(255) NULL COLLATE 'utf8mb4_unicode_ci',
	`price_default` BIGINT(20) UNSIGNED NOT NULL,
	`price_markup` BIGINT(20) UNSIGNED NOT NULL,
	`price` BIGINT(20) UNSIGNED NOT NULL,
	`status` TINYINT(1) NOT NULL,
	`created_at` TIMESTAMP NULL,
	`updated_at` TIMESTAMP NULL
) ENGINE=MyISAM;

-- Dumping structure for view tripay_webpulsa.produkpembelian_personal
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `produkpembelian_personal` (
	`id` BIGINT(20) UNSIGNED NOT NULL,
	`product_id` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`pembelianoperator_id` BIGINT(20) UNSIGNED NOT NULL,
	`pembeliankategori_id` BIGINT(20) UNSIGNED NOT NULL,
	`product_name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`desc` VARCHAR(255) NULL COLLATE 'utf8mb4_unicode_ci',
	`price_default` BIGINT(20) UNSIGNED NOT NULL,
	`price_markup` BIGINT(20) UNSIGNED NOT NULL,
	`price` BIGINT(20) UNSIGNED NOT NULL,
	`status` TINYINT(1) NOT NULL,
	`created_at` TIMESTAMP NULL,
	`updated_at` TIMESTAMP NULL
) ENGINE=MyISAM;

-- Dumping structure for table tripay_webpulsa.providers
CREATE TABLE IF NOT EXISTS `providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `merchant_code` varchar(50) DEFAULT NULL,
  `api_key` varchar(50) DEFAULT NULL,
  `api_signature` varchar(50) DEFAULT NULL,
  `private_key` varchar(50) DEFAULT NULL,
  `ipn_secret` varchar(50) DEFAULT NULL,
  `public_key` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table tripay_webpulsa.providers: ~3 rows (approximately)
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` (`id`, `name`, `logo`, `merchant_code`, `api_key`, `api_signature`, `private_key`, `ipn_secret`, `public_key`, `created_at`, `updated_at`) VALUES
	(1, 'PaymentTripay', 'AvgVIpUsTRjotFyG50om.png', 'T0065', 'WF46U1HvblamRJY64WTsL0yBcwMiPqb2HdMAI1cb', NULL, 'hx8hi-beHiI-T0Sh8-cMz3i-9BWaa', NULL, NULL, NULL, '2021-01-08 17:29:15'),
	(2, 'CekMutasi', 'cekmutasi.png', NULL, 'dc38d9e4d3af6fdbd056e60bbe9ca2a15fa011b448da6', 'kJBNkKovHbZwRKJqIysUjxEmKdKEBnPS', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.redeems
CREATE TABLE IF NOT EXISTS `redeems` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `voucher_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `redeems_user_id_foreign` (`user_id`),
  KEY `redeems_voucher_id_foreign` (`voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.redeems: ~0 rows (approximately)
/*!40000 ALTER TABLE `redeems` DISABLE KEYS */;
INSERT INTO `redeems` (`id`, `user_id`, `voucher_id`, `created_at`, `updated_at`) VALUES
	(1, 4, 1, '2020-12-25 11:04:24', '2020-12-25 11:04:24');
/*!40000 ALTER TABLE `redeems` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.roles: ~4 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'member', 'Member / Personal', '2018-08-05 11:00:00', NULL),
	(2, 'admin', 'Administrator', '2018-08-05 11:00:00', NULL),
	(3, 'agen', 'Agen', '2018-08-05 11:00:00', NULL),
	(4, 'enterprise', 'Enterprise', '2018-08-05 11:00:00', NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.role_user: ~15 rows (approximately)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
	(1, 2),
	(2, 3),
	(3, 3),
	(4, 2),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(16, 3),
	(17, 1);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_sistem` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pemilik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `saldo` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_server` tinyint(1) NOT NULL DEFAULT 1,
  `prevent_multilogin` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `max_daily_deposit` int(10) unsigned NOT NULL DEFAULT 0,
  `deposit_fee` int(10) unsigned NOT NULL DEFAULT 0,
  `min_saldo_user` bigint(20) unsigned NOT NULL DEFAULT 0,
  `min_nominal_transfer` bigint(20) unsigned NOT NULL DEFAULT 0,
  `min_tf_bank` bigint(20) unsigned NOT NULL DEFAULT 0,
  `max_tf_bank` bigint(20) unsigned NOT NULL DEFAULT 0,
  `force_verification` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `nama_sistem`, `motto`, `description`, `pemilik`, `email`, `alamat`, `hotline`, `website`, `facebook_url`, `twitter_url`, `instagram_url`, `youtube_url`, `skin`, `status`, `saldo`, `status_server`, `prevent_multilogin`, `max_daily_deposit`, `deposit_fee`, `min_saldo_user`, `min_nominal_transfer`, `min_tf_bank`, `max_tf_bank`, `force_verification`, `created_at`, `updated_at`) VALUES
	(1, 'Tripay', 'Agen Pulsa Termurah 24 Jam', 'Tripay Adalah Distributor & Agen pulsa, Paket data, Token PLN, Voucher Game, Saldo Grab/Gojek Termurah di Indonesia Semua produk yang kami sediakan dapat digunakan di seluruh wilayah Indonesia karena kami adalah distributor pulsa murah berskala nasional. Dapatkan keuntungan berlimpah dengan menjadi agen pulsa murah di Tripaydengan mendaftar secara GRATIS!', 'PT Trijaya Digital Grup', 'cs@tripay.co.id', 'Dsn. Ngompak 2, RT.003/RW.003, Ds.Cepoko, Kec.Ngrambe, Ngawi, Jawa Timur', '+6282234444413', 'https://produk3.tripay.co.id', '', '', '', '', '8,121,255', 1, '81634', 1, 0, 5, 1000, 140000, 30000, 50000, 3000000, 1, NULL, '2021-02-09 10:59:01');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.settings_komisi
CREATE TABLE IF NOT EXISTS `settings_komisi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `komisi` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.settings_komisi: ~2 rows (approximately)
/*!40000 ALTER TABLE `settings_komisi` DISABLE KEYS */;
INSERT INTO `settings_komisi` (`id`, `jenis`, `komisi`) VALUES
	(1, 'Transaski Pulsa', 30),
	(2, 'Referral', 0);
/*!40000 ALTER TABLE `settings_komisi` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.settings_kurs
CREATE TABLE IF NOT EXISTS `settings_kurs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.settings_kurs: ~3 rows (approximately)
/*!40000 ALTER TABLE `settings_kurs` DISABLE KEYS */;
INSERT INTO `settings_kurs` (`id`, `name`, `value`) VALUES
	(1, 'idr_usd', '13500'),
	(2, 'paypal_idr', '14300'),
	(3, 'giscoin_idr', '10500');
/*!40000 ALTER TABLE `settings_kurs` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.settings_min_deposit
CREATE TABLE IF NOT EXISTS `settings_min_deposit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `minimal_nominal` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `settings_min_deposit_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.settings_min_deposit: ~4 rows (approximately)
/*!40000 ALTER TABLE `settings_min_deposit` DISABLE KEYS */;
INSERT INTO `settings_min_deposit` (`id`, `role_id`, `minimal_nominal`) VALUES
	(1, 1, 10000),
	(2, 2, 10000),
	(3, 3, 250000),
	(4, 4, 500000);
/*!40000 ALTER TABLE `settings_min_deposit` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.settings_ovo_transfer
CREATE TABLE IF NOT EXISTS `settings_ovo_transfer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` int(10) unsigned NOT NULL DEFAULT 0,
  `max_amount` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.settings_ovo_transfer: ~0 rows (approximately)
/*!40000 ALTER TABLE `settings_ovo_transfer` DISABLE KEYS */;
INSERT INTO `settings_ovo_transfer` (`id`, `active`, `phone`, `min_amount`, `max_amount`) VALUES
	(1, 1, '08123456789', 10000, 5000000);
/*!40000 ALTER TABLE `settings_ovo_transfer` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.settings_rate
CREATE TABLE IF NOT EXISTS `settings_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usd_from` int(11) NOT NULL,
  `usd_to` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table tripay_webpulsa.settings_rate: ~3 rows (approximately)
/*!40000 ALTER TABLE `settings_rate` DISABLE KEYS */;
INSERT INTO `settings_rate` (`id`, `usd_from`, `usd_to`, `rate`, `created_at`, `updated_at`) VALUES
	(3, 0, 50, 13800, '2020-01-20 14:32:24', '2020-01-20 14:32:24'),
	(4, 51, 100, 13800, '2020-01-20 14:32:32', '2020-01-20 14:32:32'),
	(7, 101, 150, 13800, '2020-01-14 14:04:12', '2020-01-14 14:04:12');
/*!40000 ALTER TABLE `settings_rate` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.sidebar_menu_member
CREATE TABLE IF NOT EXISTS `sidebar_menu_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `caption` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_menu` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_menu` (`permission_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.sidebar_menu_member: ~4 rows (approximately)
/*!40000 ALTER TABLE `sidebar_menu_member` DISABLE KEYS */;
INSERT INTO `sidebar_menu_member` (`id`, `caption`, `icon`, `status`, `permission_menu`) VALUES
	(1, 'Transaksi', '', '1', 1),
	(2, 'Saldo', '', '1', 1),
	(3, 'Profile', '', '1', 1),
	(4, 'Administrator', '', '1', 2);
/*!40000 ALTER TABLE `sidebar_menu_member` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.sidebar_submenu2_member
CREATE TABLE IF NOT EXISTS `sidebar_submenu2_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL,
  `caption` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_menu` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `permission_menu` (`permission_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.sidebar_submenu2_member: ~5 rows (approximately)
/*!40000 ALTER TABLE `sidebar_submenu2_member` DISABLE KEYS */;
INSERT INTO `sidebar_submenu2_member` (`id`, `parent_id`, `caption`, `icon`, `url`, `status`, `permission_menu`) VALUES
	(1, 5, 'Pulsa All Operator', 'mobile', 'member/harga-produk/pulsa-all-operator', '1', 1),
	(2, 5, 'Paket Data', 'internet-explorer', 'member/harga-produk/paket-data', '1', 1),
	(3, 5, 'Voucher Game', 'gamepad', 'member/harga-produk/voucher-game', '1', 1),
	(4, 5, 'Token Listrik', 'bolt', 'member/harga-produk/token-listrik', '1', 1),
	(5, 5, 'Saldo Ojek Online', 'motorcycle', 'member/harga-produk/saldo-ojek-online', '1', 1);
/*!40000 ALTER TABLE `sidebar_submenu2_member` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.sidebar_submenu_member
CREATE TABLE IF NOT EXISTS `sidebar_submenu_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL,
  `caption` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis` enum('treeview','non treeview') COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_menu` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `permission_menu` (`permission_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.sidebar_submenu_member: ~14 rows (approximately)
/*!40000 ALTER TABLE `sidebar_submenu_member` DISABLE KEYS */;
INSERT INTO `sidebar_submenu_member` (`id`, `parent_id`, `caption`, `icon`, `url`, `status`, `jenis`, `permission_menu`) VALUES
	(1, 1, 'Riwayat Transaksi', 'history', 'member/riwayat-transaksi', '1', 'non treeview', 1),
	(2, 1, 'Tagihan Pembayaran', 'credit-card', 'member/tagihan-pembayaran', '1', 'non treeview', 1),
	(5, 1, 'Harga Produk', 'dropbox', '#', '1', 'treeview', 1),
	(6, 2, 'TOP UP Saldo', 'money', 'member/deposit', '1', 'non treeview', 1),
	(7, 2, 'Kirim Saldo', 'exchange', 'member/transfer-saldo', '1', 'non treeview', 3),
	(8, 2, 'Redeem Voucher', 'gift', 'member/redeem-voucher', '1', 'non treeview', 1),
	(9, 2, 'Mutasi Saldo', 'table', 'member/mutasi-saldo', '1', 'non treeview', 1),
	(10, 3, 'Profile Saya', 'user', 'member/biodata', '1', 'non treeview', 1),
	(11, 3, 'Pesan masuk', 'inbox', 'member/messages', '1', 'non treeview', 1),
	(12, 3, 'Validasi User', 'address-card', 'member/validasi-users', '1', 'non treeview', 3),
	(13, 4, 'Dashboard', 'cogs', 'admin', '1', 'non treeview', 1),
	(14, 1, 'Bonus Trx & Referral', 'users', 'member/komisi-trx-ref', '1', 'non treeview', 1),
	(18, 3, 'Referral', 'users', 'member/referral', '1', 'non treeview', 1),
	(19, 3, 'Logout', 'unlock', 'logout', '1', 'non treeview', 1);
/*!40000 ALTER TABLE `sidebar_submenu_member` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.smsgateway_outbox
CREATE TABLE IF NOT EXISTS `smsgateway_outbox` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sent_to` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','sent','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Dumping data for table tripay_webpulsa.smsgateway_outbox: ~3 rows (approximately)
/*!40000 ALTER TABLE `smsgateway_outbox` DISABLE KEYS */;
INSERT INTO `smsgateway_outbox` (`id`, `sent_to`, `message`, `status`, `note`, `created_at`, `updated_at`) VALUES
	(1, '+628987499383', 'TRANSAKSI Pemindahan Saldo Rp. 100.000 Ke BANK BRI (002) no.rekening 005701000529566. GAGAL', 'pending', NULL, '2020-11-26 08:46:19', '2020-11-26 08:46:19'),
	(2, '+628987499383', 'TRANSAKSI Pemindahan Saldo Rp. 100.000 Ke BANK BRI (002) no.rekening 005701000529566. SUKSES', 'pending', NULL, '2020-11-26 08:46:35', '2020-11-26 08:46:35'),
	(3, '+628987499383', 'TRANSAKSI Pemindahan Saldo Rp. 100.000 Ke BANK BRI (002) no.rekening 005701000529566. REFUND', 'pending', NULL, '2020-11-26 08:46:43', '2020-11-26 08:46:43');
/*!40000 ALTER TABLE `smsgateway_outbox` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.smsgateway_settings
CREATE TABLE IF NOT EXISTS `smsgateway_settings` (
  `name` varchar(171) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.smsgateway_settings: ~7 rows (approximately)
/*!40000 ALTER TABLE `smsgateway_settings` DISABLE KEYS */;
INSERT INTO `smsgateway_settings` (`name`, `value`) VALUES
	('enable', '0'),
	('enable_pln_token', '1'),
	('enable_sms_buyer', '1'),
	('log_db', '1'),
	('sms_buyer_cost', '100'),
	('zenziva_passkey', '-'),
	('zenziva_userkey', '-');
/*!40000 ALTER TABLE `smsgateway_settings` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.social_providers
CREATE TABLE IF NOT EXISTS `social_providers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.social_providers: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_providers` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.static_pages
CREATE TABLE IF NOT EXISTS `static_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.static_pages: ~3 rows (approximately)
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
INSERT INTO `static_pages` (`id`, `slug`, `title`, `content`, `created_at`, `updated_at`) VALUES
	(1, 'tos', 'Syarat & Ketentuan Layanan', '', '2019-09-06 11:00:00', '2020-06-17 15:21:55'),
	(2, 'about', 'Tentang Kami', '&lt;p&gt;Hijaupay adalah penyedia layanan isi ulang Pulsa, Paket Internet, Token PLN, Voucher Game Online, Voucher TV dan layanan PPOB secara online 24 jam Non Stop.&lt;br&gt;&lt;br&gt;&quot;Kami percaya semua orang mempunyai kemampuan dalam berbisnis tetapi kesempatan itu yang belum datang kepada mereka. Kami hadir memberikan peluang kepada anda untuk memulai bisnis anda dan menjadi bagian dari kami dalam mewujudkan INDONESIA MANDIRI.&quot;&lt;/p&gt;&lt;p&gt;&lt;br&gt;Hijaupay merupakan bisnis rintisan dengan layanan Distributor, Server &amp;amp; Agen Pulsa All Operator berbasis web yang berfokus terhadap kualitas layanan pembelian, pembayaran pulsa, pengalaman konsumen &amp;amp; Kualitas harga termurah. Kami terus berupaya memberikan pengalaman layanan terbaik serta membangun sistem automasi yang efektif dan efisien demi kenyamanan konsumen dalam bertransaksi.&lt;br&gt;&lt;/p&gt;', '2019-09-06 11:00:00', '2020-08-04 03:12:28'),
	(3, 'privacy-policy', 'Kebijakan Privasi', '&lt;p&gt;Sebagai penyedia layanan/Distributor &amp;amp; Agen Pulsa Murah All Operator, kami&amp;nbsp; &lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Hijaupay sangat menjunjung tinggi privasi customer/member. Hal ini karena informasi pribadi merupakan hal yang sangat krusial dan tidak boleh diketahui siapapun.&lt;/p&gt;&lt;p&gt;Berikut akan kami jelaskan mengenai informasi apa saja yang kami terima dan kami kumpulkan pada saat Anda mengunjungi situs&amp;nbsp; [site_name] . Serta, tentang bagaimana kami menyimpan dan menjaga informasi tersebut. Kami tegaskan bahwa kami tidak akan pernah memberikan informasi tersebut kepada siapapun.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;br&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Tentang file log&lt;/strong&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Seperti situs lain pada umumnya, kami mengumpulkan dan menggunakan data yang terdapat pada file log. Informasi yang terdapat pada file log termasuk alamat IP (Internet Protocol) Anda, ISP (Internet Service Provider), browser yang Anda gunakan, waktu pada saat Anda berkunjung serta halaman mana saja yang Anda buka selama berkunjung di [site_name].&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;strong&gt;Tentang cookies&lt;/strong&gt;&lt;br&gt;Situs kami menggunakan cookies untuk menyimpan berbagai informasi seperti preferensi pribadi pada saat mengunjungi situs&amp;nbsp; [site_name] serta informasi login.&amp;nbsp; [site_name] juga menggunakan layanan tracking dari pihak ketiga untuk mendukung situs kami. Beberapa layanan tersebut mungkin menggunakan cookies ketika melakukan tracking di situs kami.&amp;nbsp; [site_name] bekerja sama dengan layanan tracker seperti Google AdWords, Google Analytics, AdRoll serta CrazyEgg. Dimana informasi yang dikirim dapat berupa alamat IP, ISP, browser, sistem operasi yang Anda pakai, dan sebagainya. Hal ini tentu saja memiliki tujuan yaitu digunakan untuk penargetan iklan berdasarkan relevansi informasi.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;', '2019-09-06 11:00:00', '2020-08-04 03:31:28');
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.tagihans
CREATE TABLE IF NOT EXISTS `tagihans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `apiserver_id` int(11) unsigned NOT NULL,
  `tagihan_id` bigint(20) unsigned DEFAULT NULL,
  `ref_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_pelanggan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `expired` tinyint(1) NOT NULL DEFAULT 1,
  `jumlah_tagihan_ori` int(11) unsigned DEFAULT NULL,
  `jumlah_tagihan` int(11) unsigned DEFAULT NULL,
  `admin` bigint(20) unsigned zerofill DEFAULT NULL,
  `jumlah_bayar` bigint(20) unsigned zerofill DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `via` enum('DIRECT','API') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` enum('SALDO','POIN') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SALDO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tagihans_user_id_foreign` (`user_id`),
  KEY `tagihan_apiserver_id_foreign` (`apiserver_id`),
  CONSTRAINT `tagihan_apiserver_id_foreign` FOREIGN KEY (`apiserver_id`) REFERENCES `apiserver` (`id`),
  CONSTRAINT `tagihan_user_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.tagihans: ~0 rows (approximately)
/*!40000 ALTER TABLE `tagihans` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagihans` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.temptransaksis
CREATE TABLE IF NOT EXISTS `temptransaksis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `apiserver_id` int(11) unsigned DEFAULT NULL,
  `transaksi_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `temptransaksis_transaksi_id_foreign` (`transaksi_id`),
  KEY `temptransaksis_apiserver_id_foreign` (`apiserver_id`),
  CONSTRAINT `temptransaksis_apiserver_id_foreign` FOREIGN KEY (`apiserver_id`) REFERENCES `apiserver` (`id`),
  CONSTRAINT `temptransaksis_transaksi_id_foreign` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksis` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.temptransaksis: ~0 rows (approximately)
/*!40000 ALTER TABLE `temptransaksis` DISABLE KEYS */;
INSERT INTO `temptransaksis` (`id`, `apiserver_id`, `transaksi_id`, `created_at`, `updated_at`) VALUES
	(18, 2, 15, '2021-02-10 09:15:00', '2021-02-10 09:15:00');
/*!40000 ALTER TABLE `temptransaksis` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.testimonials
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `testimonials_user_id_foreign` (`user_id`),
  CONSTRAINT `testimonials_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.testimonials: ~0 rows (approximately)
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` (`id`, `user_id`, `review`, `rate`, `status`, `created_at`, `updated_at`) VALUES
	(1, 9, 'ada no what sap', 5, 0, '2020-10-02 00:36:59', '2020-10-02 00:36:59');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.tos
CREATE TABLE IF NOT EXISTS `tos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.tos: ~8 rows (approximately)
/*!40000 ALTER TABLE `tos` DISABLE KEYS */;
INSERT INTO `tos` (`id`, `title`, `slug`, `content`, `created_at`, `updated_at`) VALUES
	(1, 'Definisi', 'definisi', '<p></p><ol><li><a target="_blank" rel="nofollow" href="https://p-store.id">P-Store.ID</a> adalah suatu bisnis rintisan yang menjalankan kegiatan usaha jasa web portal&nbsp;P-Store.ID yakni situs Penyedia Layanan/Distributor &amp; Agen Pulsa All Operator. Selanjutnya disebut P-Store.ID.<br></li><li>Situs P-Store.ID adalah&nbsp;<a target="_blank" rel="nofollow" href="https://p-store.id">P-Store.ID.</a><br></li><li>Syarat &amp; ketentuan adalah perjanjian antara Pengguna dan P-Store.ID Pulsa&nbsp;yang berisikan seperangkat peraturan yang mengatur hak, kewajiban, tanggung jawab pengguna dan P-Store.ID, serta tata cara penggunaan sistem layanan \r\n\r\nP-Store.ID.</li><li>Pengguna adalah pihak yang menggunakan&nbsp;atau&nbsp;terdaftar&nbsp;menjadi&nbsp;member&nbsp;dari&nbsp;layanan \r\n\r\nP-Store.ID, termasuk namun tidak terbatas pada pembeli, Penjual&nbsp;ataupun pihak lain yang sekedar berkunjung ke Situs P-Store.ID.<br></li><li>Member adalah Pengguna terdaftar yang melakukan Deposit&nbsp;Saldo, Transaksi&nbsp;Produk Pulsa&nbsp;yang dijual di Situs P-Store.ID.<br></li><li>Produk&nbsp;adalah&nbsp;berupa&nbsp;Pulsa,&nbsp;Voucher&nbsp;Game,&nbsp;Token&nbsp;Listrik,&nbsp;Dll&nbsp;yang&nbsp;di&nbsp;beli&nbsp;oleh&nbsp;member&nbsp;di situs&nbsp;P-Store.ID.<br></li><li>Rekening Resmi P-Store.ID adalah rekening bersama yang disepakati oleh P-Store.ID Pulsa&nbsp;dan para pengguna untuk proses transaksi pulsa&nbsp;di&nbsp;Situs P-Store.ID.<br></li></ol><p></p>', '2017-06-30 08:11:32', '2017-10-13 20:33:45'),
	(2, 'Akun, Saldo P-Store.ID Pulsa, Password dan Keamanan', 'akun-saldo-p-storeid-pulsa-password-dan-keamanan', '<p>\r\n\r\n</p><ol><li>Pengguna dengan ini menyatakan bahwa pengguna adalah orang yang cakap dan mampu untuk mengikatkan dirinya dalam sebuah perjanjian yang sah menurut hukum.</li><li>P-Store.ID tidak memungut biaya pendaftaran kepada Pengguna/Member</li><li>Pengguna yang telah mendaftar berhak bertindak sebagai Member/Penjual Pulsa.<br></li><li>Pengguna harus memahami bahwa semua data yang diperlukan oleh situs P-Store.ID adalah data yang valid, jika tidak demikian maka sistem kami akan menghapus data anda secara permanen.</li><li>Saldo P-Store.ID adalah pembayaran utama dalam transaksi pembelian di situs P-Store.ID.</li><li>Saldo P-Store.ID dapat di tambahkan melalui fitur "Deposit Saldo" yang ada pada halaman member.</li><li>Saldo P-Store.ID tidak dapat dicairkan atau diuangkan, saldo hanya dapat digunakan untuk melakukan transaksi.</li><li>P-Store.ID tanpa pemberitahuan terlebih dahulu kepada Pengguna, memiliki kewenangan untuk melakukan tindakan yang perlu atas setiap dugaan pelanggaran atau pelanggaran Syarat &amp; ketentuan dan/atau hukum yang berlaku, yakni melakukan deposit saldo berkali-kali dalam hitungan hari, melakukan tidakan hacking di situs P-Store.ID,&nbsp;\r\n\r\ndan/atau penghapusan akun pengguna.</li><li>P-Store.ID memiliki kewenangan untuk menutup akun Pengguna baik sementara maupun permanen apabila didapati adanya tindakan kecurangan dalam bertransaksi dan/atau pelanggaran terhadap syarat dan ketentuan P-Store.ID.<br></li><li>Pengguna dilarang untuk menciptakan dan/atau menggunakan perangkat, software, fitur dan/atau alat lainnya yang bertujuan untuk melakukan manipulasi pada sistem P-Store.ID, termasuk namun tidak terbatas pada : (i) manipulasi data Sistem; (ii) kegiatan perambanan (crawling/scraping); (iii) kegiatan otomatisasi dalam transaksi, jual beli, promosi, dsb; dan/atau (v) aktivitas lain yang secara wajar dapat dinilai sebagai tindakan manipulasi sistem.<br></li><li>P-Store.ID memiliki kewenangan untuk melakukan pembekuan saldo P-Store.ID Pengguna apabila ditemukan / diduga adanya tindak kecurangan dalam bertransaksi dan/atau pelanggaran terhadap syarat dan ketentuan P-Store.ID.<br></li><li>Pengguna memiliki hak untuk mengubah Alamat Email Akun, karena email merupakan identitas setiap dan harus merupakan email aktif .<br></li><li>Pengguna bertanggung jawab secara pribadi untuk menjaga kerahasiaan akun dan password untuk semua aktivitas yang terjadi dalam akun Pengguna.<br></li><li>P-Store.ID tidak akan meminta email, username, password maupun kode API Key milik akun Pengguna untuk alasan apapun, oleh karena itu P-Store.ID menghimbau Pengguna agar tidak memberikan data tersebut maupun data penting lainnya kepada pihak yang mengatasnamakan \r\n\r\nP-Store.ID atau pihak lain yang tidak dapat dijamin keamanannya.<br></li><li>Pengguna setuju untuk memastikan bahwa Pengguna keluar dari akun di akhir setiap sesi dan memberitahu P-Store.ID jika ada penggunaan tanpa izin atas sandi atau akun Pengguna.<br></li><li>Pengguna dengan ini menyatakan bahwa P-Store.ID tidak bertanggung jawab atas kerugian atau kerusakan yang timbul dari penyalahgunaan akun Pengguna.</li></ol><p></p>', '2017-06-30 08:26:55', '2017-10-13 20:35:26'),
	(3, 'Transaksi Pembelian', 'transaksi-pembelian', '<p>\r\n\r\n</p><ol><li>Member wajib bertransaksi melalui prosedur transaksi yang telah ditetapkan oleh P-Store.ID. \r\n\r\nMember \r\n\r\nmelakukan pembayaran dengan menggunakan Saldo \r\n\r\nP-Store.ID\r\n\r\n milik member.</li><li>Saat melakukan Transaksi Pembelian, Member menyetujui bahwa:</li><ul><li>Member bertanggung jawab untuk membaca, memahami, dan menyetujui informasi/deskripsi keseluruhan Produk sebelum melakukan transaksi pulsa.</li></ul><ul><li>Pengguna masuk ke dalam kontrak yang mengikat secara hukum untuk Transaksi Pembelian ketika Pengguna melakukan transaksi pembelian produk.</li></ul><li>Member/Pengguna memahami dan menyetujui bahwa ketersediaan Produk merupakan tanggung jawab \r\n\r\nP-Store.ID\r\n\r\n. Terkait ketersediaan Produk dapat berubah sewaktu-waktu, sehingga dalam keadaan stok Produk kosong, maka Sistem akan menolak Transaksi pembelian, dan pembayaran atas produk yang bersangkutan.</li><li>Member memahami sepenuhnya dan menyetujui bahwa segala transaksi yang dilakukan antar Member dan \r\n\r\nP-Store.ID\r\n\r\n melalui Saldo \r\n\r\nP-Store.ID.</li><li>Member memahami bahwa transaksi pembelian akan melakukan pemotongan saldo jika status transaksi PROSES &amp; BERHASIL, Saldo akan di kembalikan jika status transaksi GAGAL atau REFUND.</li><li>Detail dari Transaksi Pembelian dapat dilihat di halaman "Riwayat Transaksi".</li><li>Member tidak mempunyai hak untuk membatalkan/menghapus transaksi dan riwayat transaksi yang dilakukan.</li><li>Member memahami bahwa dalam melakukan transaksi yang mengakibatkan berkurangnya saldo dilakukan secara sadar oleh member.</li></ol><p></p>', '2017-06-30 08:42:52', '2017-10-13 20:31:33'),
	(4, 'Deposit Saldo', 'deposit-saldo', '<p></p><ol><li>Saldo \r\n\r\nP-Store.ID\r\n\r\nadalah pembayaran utama dalam melakukan transaksi pembelian produk di situs \r\n\r\nP-Store.ID.</li><li>Saldo Larakost dapat ditambahkan melalui transfer bank kepada rekening \r\n\r\nP-Store.ID\r\n\r\n sejumlah yang ingin ditambahkan.</li><li>\r\n\r\nP-Store.ID\r\n\r\n berhak melakukan pembekuan saldo jika pengguna terbukti melakukan pelanggaran sesuai yang di atur dalam syarat &amp; Ketentuan serta Kebijakan Privasi \r\n\r\nP-Store.ID\r\n\r\n.</li><li>\r\n\r\nP-Store.ID\r\n\r\n akan membantu melalui CS kami jika mendapatkan masalah dalam melakukan Deposit Saldo.</li><li>Deposit Saldo \r\n\r\nP-Store.ID\r\n\r\n di encrypt oleh sistem kami guna menjaga keamanan dari saldo member.</li></ol><p></p>', '2017-06-30 08:56:02', '2017-10-13 20:36:45'),
	(5, 'Harga Produk', 'harga-produk', '<p></p><ol><li>\r\n\r\nP-Store.ID\r\n\r\n berupayah menyediakan produk dengan harga semurah mungkin.</li><li>Pengguna memahami bahwa Harga Produk \r\n\r\nP-Store.ID\r\n\r\n dapat berubah sewaktu - waktu tanpa pemberitahuan sebelumnya.</li><li>Harga Produk yang tertera di situs \r\n\r\nP-Store.ID\r\n\r\n merupakan harga produk final yang nantinya akan di bayarkan oleh member saat transaksi produk.</li><li>Dengan melakukan transaksi pembelian melalui \r\n\r\nP-Store.ID, Pengguna menyetujui untuk membayar sejumlah harga produk yang di tentukan yang nantinya akan di potong dari saldo \r\n\r\nP-Store.ID.</li></ol><p></p>', '2017-06-30 09:00:56', '2017-10-13 20:37:38'),
	(6, 'Pengembalian Dana', 'pengembalian-dana', '<p></p><ol><li>Program Pengembalian Dana atau disebut REFUND merupakan fitur perlindungan kepada member dalam bertransaksi jika dalam transaksi mengalami pemotongan saldo tetapi produk yang di beli tidak sampai kepada pembeli.</li><li>REFUND Transaksi dapat dilakukan jika transaksi mendapatkan status sukses tetapi Produk yang di beli tidak masuk kepada pembeli.</li><li>REFUND Transaksi dapat dilakukan dengan menghubungi CS \r\n\r\nP-Store.ID\r\n\r\n dengan meyebutkan ID Transaksi yang tertera pada Riwayat Transaksi.</li><li>REFUND Transkasi dapat diberikan jika CS kami sudah melakukan pengecekan terhadap server dan telah di pastikan produk tidak masuk kepada pembeli.</li><li>Jika dalam REFUND Transaksi member telah melakukan komplein kepada CS dan CS telah memastikan bahwa Produk masuk kepada pembeli tetapi pembeli merasa belum menerima produk yang di beli, disarankan untuk menghubungi Call Center dari Operator/Provider produk.</li><li>REFUND Transaksi tidak dapat dilakukan jika kami memastikan Produk telah VALID Terkirim kepada pembeli.</li></ol><p></p>', '2017-09-15 09:51:21', '2017-10-13 20:38:07'),
	(7, 'Transfer Saldo', 'transfer-saldo', '<p></p><ol><li>\r\n\r\nFitur Transfer Saldo adalah fitur yang digunakan untuk mengirim/berbagi saldo dengan member/referral anda yang berfungsi untuk membantu member/referral anda yang tidak dapat melakukan deposit saldo melalui transfer bank, anda dapat menggunakan fitur ini untuk menambahkan saldo Member/Referral anda.\r\n\r\n<br></li><li>Anda tidak dapat melakukan transfer saldo ke akun anda sendiri.\r\n\r\n<br></li><li>Anda&nbsp;harus memiliki saldo minimal Rp 50.000 untuk melakukan transfer saldo.\r\n\r\n</li><li>Minimal&nbsp;Saldo yang anda transfer adalah Rp 20.000.\r\n\r\n</li><li>Lakukan&nbsp;pengecekan nomor tujuan transfer terlebih dahulu untuk memeriksa tujuan transfer anda apakah sudah benar atau belum.\r\n\r\n</li><li>Demi&nbsp;keamanan dalam fitur ini, anda di wajibkan untuk memasukkan kata sandi akun anda agar transfer saldo di pastikan dilakukan oleh anda.\r\n\r\n</li><li>Kami&nbsp;tidak bertanggung jawab jika anda salah dalam transfer saldo ke member/referral anda.</li></ol><p></p>', '2017-09-15 09:53:56', '2017-09-15 09:53:56'),
	(8, 'Referral', 'referral', '<p></p><ol><li>Referral\r\n\r\nmerupakan program untuk mengajak orang bergabung di \r\n\r\nP-Store.ID\r\n\r\n.\r\n\r\n</li><li>Setiap&nbsp;orang yang diajak dan melakukan topup (Deposit Saldo) pertama kali dengan minimal deposit saldo Rp 100.000,- akan mendapatkan bonus saldo gratis sebesar Rp 1.000 langsung di tambahkan kesaldo anda.\r\n\r\n</li><li>Jika\r\n\r\norang yang anda ajak tersebut melakukan deposit saldo kurang atau lebih dari Rp 100.000,- maka akan mendapatkan bonus saldo 1% dari nominal deposit, contoh referral anda deposit 50.000 maka 1% dari 50.000 adalah 1/100*50000 = 500.</li></ol><p></p>', '2017-09-15 09:55:59', '2017-10-13 20:39:06');
/*!40000 ALTER TABLE `tos` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.transaksis
CREATE TABLE IF NOT EXISTS `transaksis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `apiserver_id` int(11) DEFAULT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `antrian_id` bigint(20) unsigned DEFAULT NULL,
  `tagihan_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_default` bigint(20) unsigned NOT NULL DEFAULT 0,
  `harga_markup` bigint(20) unsigned NOT NULL DEFAULT 0,
  `total` bigint(20) unsigned NOT NULL DEFAULT 0,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtrpln` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengirim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL,
  `via` enum('DIRECT','API') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` enum('SALDO','POIN') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SALDO',
  `jenis_transaksi` enum('otomatis','manual') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_sequence` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `sequence_id` int(10) unsigned NOT NULL DEFAULT 0,
  `saldo_before_trx` bigint(20) unsigned DEFAULT NULL,
  `saldo_after_trx` bigint(20) unsigned DEFAULT NULL,
  `callback_sent` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `antrian_unique` (`antrian_id`),
  KEY `transaksis_user_id_foreign` (`user_id`),
  CONSTRAINT `transaksis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.transaksis: ~6 rows (approximately)
/*!40000 ALTER TABLE `transaksis` DISABLE KEYS */;
INSERT INTO `transaksis` (`id`, `apiserver_id`, `order_id`, `antrian_id`, `tagihan_id`, `code`, `produk`, `harga_default`, `harga_markup`, `total`, `target`, `mtrpln`, `note`, `pengirim`, `token`, `status`, `user_id`, `via`, `payment`, `jenis_transaksi`, `valid_sequence`, `sequence_id`, `saldo_before_trx`, `saldo_after_trx`, `callback_sent`, `created_at`, `updated_at`) VALUES
	(9, 2, 142516, 16, NULL, 'S1', 'TELKOMSEL 1.000', 1779, 200, 1979, '082234444413', NULL, 'Trx s1 082234444413 Sukses. SN : 02154300001311392373. ', '127.0.0.1', '02154300001311392373', 1, 4, 'DIRECT', 'SALDO', 'otomatis', 1, 1, 72179, 70200, 0, '2020-11-24 21:40:18', '2020-11-25 08:02:29'),
	(10, 2, 142546, 17, NULL, 'S2', 'TELKOMSEL 2.000', 2954, 200, 3154, '082234444413', NULL, '[manual] Transaksi success', '127.0.0.1', '02155900001315356209', 1, 4, 'DIRECT', 'SALDO', 'otomatis', 1, 1, 70200, 70200, 0, '2020-11-25 08:09:43', '2020-12-24 19:56:55'),
	(11, 2, 142547, 18, NULL, 'S3', 'TELKOMSEL 3.000', 3989, 200, 4189, '082234444413', NULL, '[manual] Transaksi success', '127.0.0.1', '02155900001315466019', 1, 4, 'DIRECT', 'SALDO', 'otomatis', 1, 1, 67046, 67046, 0, '2020-11-25 08:14:58', '2020-12-24 19:57:04'),
	(12, 2, 12, 19, NULL, 'T1', 'THREE 1.000', 0, 0, 0, '08987499383', NULL, 'Duplikat api_trxid. Mohon gunakan nilai yang berbeda', '162.158.179.25', NULL, 2, 4, 'DIRECT', 'SALDO', 'otomatis', 0, 0, 7, 7, 0, '2020-12-25 22:58:27', '2020-12-25 22:58:27'),
	(13, 2, 145822, 20, NULL, 'T1', 'THREE 1.000', 0, 0, 0, '08987499383', NULL, 'Trx t1 08987499383 Sukses. SN : R201225.2314.210057. ', '172.68.254.177', 'R201225.2314.210057', 1, 4, 'DIRECT', 'SALDO', 'otomatis', 1, 1, 6, 6, 0, '2020-12-25 23:14:29', '2020-12-25 23:23:12'),
	(14, 2, 145866, 21, NULL, 'S1', 'TELKOMSEL 1.000', 0, 0, 0, '082131445043', NULL, '[manual] Transaksi success', '162.158.179.59', '02186500001930330295', 1, 4, 'DIRECT', 'SALDO', 'otomatis', 1, 1, 6, 6, 0, '2020-12-26 07:29:32', '2021-02-09 12:57:09'),
	(15, 2, 151309, 24, NULL, 'S1', 'TELKOMSEL 1.000', 0, 0, 0, '082131445043', NULL, 'Pembelian anda telah diantrikan.', '127.0.0.1', NULL, 0, 4, 'API', 'SALDO', 'otomatis', 1, 1, 9945000, 9945000, 0, '2021-02-10 09:15:00', '2021-02-10 09:15:11');
/*!40000 ALTER TABLE `transaksis` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.transaksi_saldo_paypal
CREATE TABLE IF NOT EXISTS `transaksi_saldo_paypal` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trxid` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `address_paypal` varchar(100) DEFAULT NULL,
  `address_paypal_pengirim` varchar(100) DEFAULT NULL,
  `rate` int(11) NOT NULL DEFAULT 0,
  `nominal_usd` int(11) NOT NULL DEFAULT 0,
  `nominal_idr` int(11) NOT NULL DEFAULT 0,
  `fee` int(10) unsigned NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL DEFAULT 0,
  `transaksi_code` varchar(100) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pp_user_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tripay_webpulsa.transaksi_saldo_paypal: ~0 rows (approximately)
/*!40000 ALTER TABLE `transaksi_saldo_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi_saldo_paypal` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `saldo` bigint(20) unsigned DEFAULT NULL,
  `pin` int(4) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `status_saldo` tinyint(1) DEFAULT 1,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_buyer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referred_by` bigint(20) unsigned DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `paypal_email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliate_id` bigint(20) unsigned DEFAULT NULL,
  `referral_markup` bigint(20) unsigned DEFAULT 0,
  `user_markup` bigint(20) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `last_online` timestamp NULL DEFAULT NULL,
  `api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whitelist_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `api_key` (`api_key`),
  UNIQUE KEY `secret_key` (`secret_key`) USING HASH,
  KEY `user_referrer` (`referred_by`),
  CONSTRAINT `user_referrer` FOREIGN KEY (`referred_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.users: ~16 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `phone`, `nik`, `city`, `email`, `password`, `saldo`, `pin`, `status`, `status_saldo`, `last_login`, `image`, `sms_buyer`, `referred_by`, `email_verified_at`, `phone_verified_at`, `paypal_email`, `affiliate_id`, `referral_markup`, `user_markup`, `remember_token`, `online`, `last_online`, `api_key`, `secret_key`, `whitelist_ip`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', '081234567890', NULL, 'Ngawi', 'admin@tripay.co.id', '$2y$10$1wWNk.3vLObZzSExy7USG.r7zT6mLfXMpKQLzzskqG51LAxUjBZ36', 220, 1234, 1, 1, '2021-02-07 18:18:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, 'isULU0lGngPiwPneRiUjIMzHrafo4VAtCQX06vvkpbTLcmTSMYplohXxtote', 1, '2021-02-07 18:18:26', NULL, NULL, NULL, '2020-08-11 19:30:46', '2021-02-07 18:18:26'),
	(2, 'fauzan kemal pratama', '089506655220', NULL, 'Sidoarjo - Kabupaten', 'fauzankemal4@gmail.com', '$2y$10$K1Pe1tQ2joaEkITCeIB1/epA0BBcZRyBRd5kUVqSTBqSiTMSLRUOO', 300, 1234, 1, 1, '2020-11-25 08:15:37', NULL, NULL, 1, NULL, NULL, NULL, NULL, 100, NULL, NULL, 1, '2020-08-29 12:56:05', NULL, NULL, NULL, '2020-08-29 12:49:59', '2020-11-25 08:15:37'),
	(3, 'baladewa', '087860060634', NULL, 'dps', 'putubaladewa@gmail.com', '$2y$10$XKDmYCHwKCAePnRyrcWXLO549McRJNcFoB2QjOBQbi8aJx6tpN2cS', 200, 1234, 1, 1, '2020-12-26 10:15:08', NULL, NULL, 2, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, '2020-08-29 15:36:55', NULL, NULL, NULL, '2020-08-29 14:57:36', '2020-12-26 10:15:08'),
	(4, 'Bayu Segara', '08987499383', NULL, 'Madiun', 'bayusegara623@gmail.com', '$2y$10$h8t1loEemyVmbCDrq3Alleft6QnBy/9V8XRvK7tJKAB4E98vIfPjW', 9945000, 1234, 1, 1, '2021-02-11 13:56:03', NULL, NULL, 3, NULL, NULL, NULL, NULL, 100, NULL, 'FO2LF1fIKOjdLeh44M2qDL6hlRx5pbHEAp8hPhnlmc5QxfG57DYUMCJlTIZ0', 1, '2021-02-11 13:56:03', 'IINCsOiFTaFmvg0Uy8X5CQNcJucV3e2FHysge7Mi', NULL, NULL, '2020-08-31 07:57:38', '2021-02-11 13:56:03'),
	(5, 'Hongki Setiawan', '0811991379', NULL, 'bandung', 'pastisuksesduniaakhirat@gmail.com', '$2y$10$9tzSq/NMIOn47P.hq8SioOxYcsr4IpqqeQT.iTmU6hl.rg49obOkW', 0, 5656, 1, 1, '2020-11-23 13:07:30', NULL, NULL, 4, NULL, NULL, NULL, NULL, 100, NULL, NULL, 1, '2020-08-31 22:25:05', NULL, NULL, NULL, '2020-08-31 20:31:03', '2020-08-31 22:25:05'),
	(6, 'Rifki Abdi Prasetya', '085726841319', NULL, 'Sragen', 'rifkyprasetya129@gmail.com', '$2y$10$5v9moj05Qg.cldOS4OBzHefhFMrBlAXLaj70OnQMJgs1CqzMRPjW.', 0, 1927, 1, 1, '2020-11-23 13:06:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, 1, '2020-09-12 10:44:30', NULL, NULL, NULL, '2020-09-12 10:24:27', '2020-09-12 10:44:30'),
	(7, 'ahmad', '081212313555', NULL, 'Situbondo', 'ahmadi@tripay.co.id', '$2y$10$XQEn24w.Uqyy7YfT3Pz4QeCC2UqgluBor4YkVNf9HaP0IBaCJ0S8e', 0, 1234, 1, 1, '2020-11-23 13:06:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, 1, '2020-09-16 22:18:19', NULL, NULL, NULL, '2020-09-16 22:17:16', '2020-09-16 22:18:19'),
	(8, 'Ketut Ginarsa Putra', '08124665133', NULL, 'Ginayar', 'ginarsa@gmail.com', '$2y$10$WerpnW17lU0MdeNcb7p74uhm7OoUD58LQgww/.0po/M.AcNTW3OEe', 0, 311, 1, 1, '2020-11-23 13:06:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, 1, '2020-09-19 16:29:28', NULL, NULL, NULL, '2020-09-19 16:24:46', '2020-09-19 16:29:28'),
	(9, 'SAIFUL HADI', '085712234009', NULL, 'TEGOWANU GROBOGAN', 'adysaifull@gmail.com', '$2y$10$rkDUS.sdDExWCmliDBLK.e8PjzNfLfjbXAf2rAdKTQ9mUNhAT/Fm.', 0, 1010, 1, 1, '2020-11-23 13:06:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, 'TZkDoATVokqhd44YqdcXNDZFCjx4F5EvyIhcfykxuYjQiA2CfgrBAiSS7m53', 1, '2020-10-05 07:40:11', NULL, NULL, NULL, '2020-10-02 00:04:19', '2020-10-05 07:40:11'),
	(10, 'Dede nurdin', '087712383090', NULL, 'Cuanjur', 'dedenurdin879@gmail.com', '$2y$10$OvzAUtJ0qXf0txg9MmFSf.Ua4f7hmBPEqKf1xdiyU1R5rKlU8oxtW', 0, 4321, 1, 1, '2020-11-23 13:06:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, 1, '2020-10-06 13:40:32', NULL, NULL, NULL, '2020-10-06 13:22:53', '2020-10-06 13:40:32'),
	(11, 'marlita', '087879714039', NULL, 'semarang', 'marlita1979@yahoo.com', '$2y$10$EFC7uoooEl//37RqOPl7VuOfYw3Njs.zMXBOswtTGvEy7YVlq5dy2', 0, 1230, 1, 1, '2020-11-23 13:06:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, 1, '2020-10-07 10:32:53', NULL, NULL, NULL, '2020-10-07 10:32:25', '2020-10-07 10:32:53'),
	(12, 'Rusdiansyah', '085280046789', NULL, 'Serang', 'rusdisgd01@gmail.com', '$2y$10$EBOouOV638Wr30pedWySueymzb8uvE2u8dMLo7ntIxsjOMQVufXIO', 0, 1233, 1, 1, '2020-11-23 13:06:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, 1, '2020-11-03 13:54:59', NULL, NULL, NULL, '2020-11-03 13:36:04', '2020-11-03 13:54:59'),
	(13, 'Bagus Ok', '081216696569', NULL, 'Tulungagung', 'bagus.ok55@gmail.com', '$2y$10$BHaqFAiJB.pcDudRj253AepEQJD9TtF.QSCZXyOXFGrAByD9dQ7ky', 0, 1234, 1, 1, '2021-01-12 18:35:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, '9nBejUqBvcOwValsryaxpoZ8mepVQR6OmWavOwNVf6lC1krY4nbXQk8htKM3', 1, '2021-01-12 18:35:55', NULL, NULL, NULL, '2020-11-08 21:33:25', '2021-01-12 18:35:55'),
	(14, 'ADMINISTRATOR', '08123456789', NULL, 'jaya', 'ADMIN@gmail.com', '$2y$10$WZkoHjqnywULDCuRhNZi.e2YVHBXvcoF4f36q4g9tmKXCwNntLmL2', 11287800, 3466, 1, 1, '2021-02-03 17:02:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'fifVbA27JKGtkXPznS3ZlhXOgCcxLeWtDBY6L10LhQJHQHjsbbUKshFx0Kt5', 0, NULL, NULL, NULL, NULL, '2021-01-08 23:18:45', '2021-02-03 17:02:11'),
	(16, 'test', '082131445043', NULL, 'Madiun', 'bsegara2903@gmail.com', '$2y$10$8jsRUlVXDAciU2YMQ6gJMu5VdmcE2u8BzrB06McNn.GfKlPYx9yYu', NULL, 1234, 1, 1, '2021-02-11 10:00:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, '2021-02-11 10:00:50', NULL, NULL, NULL, '2021-02-11 09:06:36', '2021-02-11 10:00:50'),
	(17, 'tdst1', '08987499382', NULL, 'Madiun', 'Yuzuriha217@gmail.com', '$2y$10$OV.0.sqqa3YWQvPjpCVyze8f90tUHjMouvBH0Xny6MF83.EAwgHyK', NULL, 1234, 1, 1, '2021-02-11 13:56:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, '2021-02-11 13:56:07', NULL, NULL, NULL, '2021-02-11 10:03:05', '2021-02-11 13:56:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.users_bank
CREATE TABLE IF NOT EXISTS `users_bank` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `id_bank` bigint(20) unsigned NOT NULL,
  `nama_pemilik_bank` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rekening` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`user_id`),
  KEY `id_bank` (`id_bank`),
  CONSTRAINT `user_bank_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.users_bank: ~0 rows (approximately)
/*!40000 ALTER TABLE `users_bank` DISABLE KEYS */;
INSERT INTO `users_bank` (`id`, `user_id`, `id_bank`, `nama_pemilik_bank`, `no_rekening`) VALUES
	(1, 9, 1, 'SAIFUL HADI', '600801028051530');
/*!40000 ALTER TABLE `users_bank` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.users_validations
CREATE TABLE IF NOT EXISTS `users_validations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `img_ktp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_selfie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_tabungan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_validation_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.users_validations: ~3 rows (approximately)
/*!40000 ALTER TABLE `users_validations` DISABLE KEYS */;
INSERT INTO `users_validations` (`id`, `user_id`, `img_ktp`, `img_selfie`, `img_tabungan`, `status`, `created_at`, `updated_at`) VALUES
	(1, 9, 'ktp_916016044735f768b79301fc.jpeg', 'selfie_916016044735f768b7930238.jpeg', 'tabungan_916016044735f768b7930252.jpeg', 0, '2020-10-02 09:07:53', '2020-10-02 09:07:53'),
	(3, 4, 'ktp_416089019615fe5e549a612f.png', 'selfie_416089019615fe5e549a614f.png', 'tabungan_416089019615fe5e549a6164.png', 1, '2020-12-25 20:12:41', '2020-12-25 20:12:41'),
	(4, 1, 'ktp_116101259615ff892894373e.png', 'selfie_116101259615ff892894375b.png', 'tabungan_116101259615ff8928943772.png', 1, '2021-01-09 00:12:41', '2021-01-09 00:12:41'),
	(5, 16, 'ktp_1616130092496024916171540.jpg', 'selfie_1616130092496024916171550.jpg', 'tabungan_161613009249602491617155b.jpg', 1, '2021-02-11 09:07:29', '2021-02-11 09:07:29');
/*!40000 ALTER TABLE `users_validations` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.virtual_account_numbers
CREATE TABLE IF NOT EXISTS `virtual_account_numbers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `bank_id` int(10) unsigned DEFAULT NULL,
  `number_va` varchar(50) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table tripay_webpulsa.virtual_account_numbers: ~0 rows (approximately)
/*!40000 ALTER TABLE `virtual_account_numbers` DISABLE KEYS */;
INSERT INTO `virtual_account_numbers` (`id`, `user_id`, `bank_id`, `number_va`, `uuid`, `created_at`, `updated_at`) VALUES
	(3, 4, 51, '7878995765980433', 'T1634-OP27-ZJRIDE', '2020-12-19 08:14:46', '2020-12-19 08:14:46');
/*!40000 ALTER TABLE `virtual_account_numbers` ENABLE KEYS */;

-- Dumping structure for table tripay_webpulsa.vouchers
CREATE TABLE IF NOT EXISTS `vouchers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bonus` decimal(12,2) unsigned NOT NULL,
  `expired_date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `qty` int(11) unsigned NOT NULL,
  `use_kupon` int(11) unsigned NOT NULL,
  `filter_datereg_user` int(11) unsigned NOT NULL,
  `value_datereg_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filter_verified` int(11) unsigned NOT NULL,
  `value_verified` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filter_saldo` int(11) unsigned NOT NULL,
  `value_saldo` decimal(12,2) unsigned DEFAULT NULL,
  `filter_saldo_max` int(11) unsigned NOT NULL,
  `value_saldo_max` decimal(12,2) unsigned DEFAULT NULL,
  `filter_level_user` int(11) unsigned NOT NULL,
  `value_level_user` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tripay_webpulsa.vouchers: ~2 rows (approximately)
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` (`id`, `code`, `bonus`, `expired_date`, `status`, `qty`, `use_kupon`, `filter_datereg_user`, `value_datereg_user`, `filter_verified`, `value_verified`, `filter_saldo`, `value_saldo`, `filter_saldo_max`, `value_saldo_max`, `filter_level_user`, `value_level_user`, `created_at`, `updated_at`) VALUES
	(1, 'ID2Z4GFE3O', 5.00, '2020-12-25', 0, 0, 1, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2020-12-25 10:24:01', '2020-12-25 11:04:24'),
	(2, 'T5Q6YKR2ML', 1.50, '2020-12-25', 1, 1, 0, 1, '2020-12-25', 1, 'no verification', 1, 1.50, 1, 1.50, 1, 1, '2020-12-25 21:00:51', '2020-12-25 21:00:51');
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;

-- Dumping structure for trigger tripay_webpulsa.pembayaranpricedanmarkup_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `pembayaranpricedanmarkup_insert` BEFORE INSERT ON `pembayaranproduks` FOR EACH ROW SET NEW.price_markup=NEW.price_default+NEW.markup//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tripay_webpulsa.pembayaranpricedanmarkup_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `pembayaranpricedanmarkup_update` BEFORE UPDATE ON `pembayaranproduks` FOR EACH ROW SET NEW.price_markup=NEW.price_default+NEW.markup//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tripay_webpulsa.pembelian_markupsInsert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `pembelian_markupsInsert` BEFORE INSERT ON `pembelian_markups` FOR EACH ROW SET 
	NEW.price_ttl_personal=NEW.price_default+NEW.markup_personal,
	NEW.price_ttl_agen=NEW.price_default+NEW.markup_agen,
	NEW.price_ttl_enterprise=NEW.price_default+NEW.markup_enterprise//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tripay_webpulsa.pembelian_markupsUpdate
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `pembelian_markupsUpdate` BEFORE UPDATE ON `pembelian_markups` FOR EACH ROW SET
    NEW.price_ttl_personal=NEW.price_default+NEW.markup_personal,
    NEW.price_ttl_agen=NEW.price_default+NEW.markup_agen,
    NEW.price_ttl_enterprise=NEW.price_default+NEW.markup_enterprise//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tripay_webpulsa.pricedanmarkup_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `pricedanmarkup_insert` BEFORE INSERT ON `pembelianproduks` FOR EACH ROW SET NEW.price=NEW.price_default+NEW.price_markup//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tripay_webpulsa.pricedanmarkup_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `pricedanmarkup_update` BEFORE UPDATE ON `pembelianproduks` FOR EACH ROW SET NEW.price=NEW.price_default+NEW.price_markup//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tripay_webpulsa.toMarkupPembelianDELETE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `toMarkupPembelianDELETE` AFTER DELETE ON `pembelianproduks` FOR EACH ROW DELETE FROM pembelian_markups 
 WHERE id_product=OLD.id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tripay_webpulsa.toMarkupPembelianINSERT
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `toMarkupPembelianINSERT` AFTER INSERT ON `pembelianproduks` FOR EACH ROW INSERT INTO pembelian_markups (id_product,price_default,created_at,updated_at) VALUES (NEW.id,NEW.price_default,NEW.created_at,NEW.updated_at)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tripay_webpulsa.toMarkupPembelianUPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `toMarkupPembelianUPDATE` AFTER UPDATE ON `pembelianproduks` FOR EACH ROW UPDATE pembelian_markups
 SET 
 	id_product = NEW.id,
    price_default = NEW.price_default,
    created_at = NEW.created_at,
    updated_at = NEW.updated_at
 WHERE id_product=NEW.id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tripay_webpulsa.transaksistrigger_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `transaksistrigger_insert` BEFORE INSERT ON `transaksis` FOR EACH ROW SET NEW.total=NEW.harga_default+NEW.harga_markup//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tripay_webpulsa.transaksistrigger_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `transaksistrigger_update` BEFORE UPDATE ON `transaksis` FOR EACH ROW SET NEW.total=NEW.harga_default+NEW.harga_markup//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger tripay_webpulsa.transaksis_to_temptransaksis_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `transaksis_to_temptransaksis_insert` AFTER INSERT ON `transaksis` FOR EACH ROW INSERT INTO temptransaksis (transaksi_id,apiserver_id,created_at,updated_at) VALUES (NEW.id,NEW.apiserver_id,NOW(),NOW())//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for view tripay_webpulsa.produkpembelian_agen
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `produkpembelian_agen`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `produkpembelian_agen` AS select `m1`.`id` AS `id`,`m1`.`product_id` AS `product_id`,`m1`.`pembelianoperator_id` AS `pembelianoperator_id`,`m1`.`pembeliankategori_id` AS `pembeliankategori_id`,`m1`.`product_name` AS `product_name`,`m1`.`desc` AS `desc`,`m1`.`price_default` AS `price_default`,`m2`.`markup_agen` AS `price_markup`,`m2`.`price_ttl_agen` AS `price`,`m1`.`status` AS `status`,`m1`.`created_at` AS `created_at`,`m1`.`updated_at` AS `updated_at` from (`pembelianproduks` `m1` join `pembelian_markups` `m2` on(`m1`.`id` = `m2`.`id_product`)) ;

-- Dumping structure for view tripay_webpulsa.produkpembelian_enterprise
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `produkpembelian_enterprise`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `produkpembelian_enterprise` AS select `m1`.`id` AS `id`,`m1`.`product_id` AS `product_id`,`m1`.`pembelianoperator_id` AS `pembelianoperator_id`,`m1`.`pembeliankategori_id` AS `pembeliankategori_id`,`m1`.`product_name` AS `product_name`,`m1`.`desc` AS `desc`,`m1`.`price_default` AS `price_default`,`m2`.`markup_enterprise` AS `price_markup`,`m2`.`price_ttl_enterprise` AS `price`,`m1`.`status` AS `status`,`m1`.`created_at` AS `created_at`,`m1`.`updated_at` AS `updated_at` from (`pembelianproduks` `m1` join `pembelian_markups` `m2` on(`m1`.`id` = `m2`.`id_product`)) ;

-- Dumping structure for view tripay_webpulsa.produkpembelian_personal
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `produkpembelian_personal`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `produkpembelian_personal` AS select `m1`.`id` AS `id`,`m1`.`product_id` AS `product_id`,`m1`.`pembelianoperator_id` AS `pembelianoperator_id`,`m1`.`pembeliankategori_id` AS `pembeliankategori_id`,`m1`.`product_name` AS `product_name`,`m1`.`desc` AS `desc`,`m1`.`price_default` AS `price_default`,`m2`.`markup_personal` AS `price_markup`,`m2`.`price_ttl_personal` AS `price`,`m1`.`status` AS `status`,`m1`.`created_at` AS `created_at`,`m1`.`updated_at` AS `updated_at` from (`pembelianproduks` `m1` join `pembelian_markups` `m2` on(`m1`.`id` = `m2`.`id_product`)) ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
