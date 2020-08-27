-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 27, 2020 at 04:28 PM
-- Server version: 10.1.44-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cimory`
--

-- --------------------------------------------------------

--
-- Table structure for table `aktifitas`
--

CREATE TABLE `aktifitas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `aktifitas` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dc`
--

CREATE TABLE `dc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_dc` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dc` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dc`
--

INSERT INTO `dc` (`id`, `kode_dc`, `nama_dc`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'DC1', 'PESANGGRAHAN', '2020-06-17 07:58:48', '2020-06-17 07:58:48', NULL),
(2, 'DC2', 'TANAH ABANG', '2020-06-17 07:58:55', '2020-06-17 07:58:55', NULL),
(3, 'DC3', 'CILEDUG', '2020-06-17 07:59:02', '2020-06-17 07:59:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `harga`
--

CREATE TABLE `harga` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `produk_id` bigint(20) UNSIGNED NOT NULL,
  `harga_dasar` bigint(20) NOT NULL,
  `harga_jual` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `harga`
--

INSERT INTO `harga` (`id`, `produk_id`, `harga_dasar`, `harga_jual`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 10000, 12000, '2020-06-17 08:07:09', '2020-06-17 08:07:09', NULL),
(2, 2, 11500, 14500, '2020-06-17 08:07:22', '2020-06-17 08:07:22', NULL),
(3, 3, 15000, 18000, '2020-06-17 08:07:34', '2020-06-17 08:07:34', NULL),
(4, 4, 13000, 15000, '2020-06-17 08:07:49', '2020-06-17 08:07:49', NULL),
(5, 5, 9000, 11500, '2020-06-17 08:08:00', '2020-06-19 08:11:41', NULL),
(6, 6, 8000, 10000, '2020-06-17 08:08:12', '2020-06-17 08:08:12', NULL),
(7, 7, 7500, 9000, '2020-06-17 08:08:23', '2020-06-17 08:08:23', NULL),
(8, 8, 11000, 14000, '2020-06-17 08:08:35', '2020-06-17 08:08:35', NULL),
(9, 9, 15000, 18000, '2020-06-17 08:08:46', '2020-06-17 08:08:46', NULL),
(10, 10, 8000, 10000, '2020-06-17 08:08:55', '2020-06-17 08:08:55', NULL),
(11, 11, 15000, 18000, '2020-06-17 08:09:05', '2020-06-17 08:09:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dc_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `produk_id` bigint(20) UNSIGNED NOT NULL,
  `qty_pembelian` bigint(20) NOT NULL,
  `qty_penjualan` bigint(20) NOT NULL,
  `qty_retur` bigint(20) NOT NULL,
  `qty_stok` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id`, `dc_id`, `tanggal`, `produk_id`, `qty_pembelian`, `qty_penjualan`, `qty_retur`, `qty_stok`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2020-06-22', 1, 300, 260, 0, 40, '2020-06-22 02:53:38', '2020-06-22 02:55:24', NULL),
(2, 1, '2020-06-23', 1, 0, 20, 11, 9, '2020-06-22 02:56:08', '2020-06-22 04:58:06', NULL),
(3, 1, '2020-06-24', 1, 0, 0, 9, 0, '2020-06-22 06:15:22', '2020-06-22 06:15:22', NULL),
(4, 1, '2020-06-25', 2, 320, 220, 0, 100, '2020-06-22 06:17:44', '2020-06-22 06:21:20', NULL),
(5, 1, '2020-06-26', 2, 0, 90, 10, 0, '2020-06-22 06:23:30', '2020-06-22 06:26:53', NULL),
(6, 2, '2020-06-22', 1, 350, 275, 0, 75, '2020-06-25 01:54:58', '2020-06-25 01:56:08', NULL),
(7, 2, '2020-06-23', 1, 0, 70, 0, 5, '2020-06-25 02:06:56', '2020-06-25 02:06:56', NULL),
(8, 2, '2020-06-24', 1, 0, 0, 5, 0, '2020-06-25 02:07:48', '2020-06-25 02:07:48', NULL),
(9, 2, '2020-06-25', 2, 280, 170, 0, 110, '2020-06-25 02:08:51', '2020-06-25 02:09:46', NULL),
(10, 2, '2020-06-26', 2, 0, 100, 10, 0, '2020-06-25 02:10:28', '2020-06-25 02:11:03', NULL),
(11, 3, '2020-06-22', 1, 225, 185, 0, 40, '2020-06-25 02:12:08', '2020-06-25 02:12:53', NULL),
(12, 3, '2020-06-23', 1, 0, 40, 0, 0, '2020-06-25 02:13:29', '2020-06-25 02:13:29', NULL),
(13, 3, '2020-06-25', 2, 345, 100, 0, 245, '2020-06-25 02:14:20', '2020-06-25 02:15:34', NULL),
(14, 3, '2020-06-26', 2, 0, 45, 0, 200, '2020-06-25 02:16:11', '2020-06-25 02:16:11', NULL),
(15, 3, '2020-06-27', 2, 0, 180, 20, 0, '2020-06-25 02:17:19', '2020-06-25 02:17:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_01_17_002141_create_table_role', 1),
(2, '2013_01_18_230635_dc', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2015_02_17_122215_aktifitas', 1),
(6, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(7, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(8, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(9, '2016_06_01_000004_create_oauth_clients_table', 1),
(10, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2020_06_07_230558_produk', 1),
(13, '2020_06_07_230610_sales', 1),
(14, '2020_06_07_230622_harga', 1),
(15, '2020_06_07_230649_transaksi_dc', 1),
(16, '2020_06_16_135547_pembelian', 1),
(17, '2020_06_16_135615_penjualan', 1),
(18, '2020_06_16_135653_stok', 1),
(19, '2020_06_16_135749_retur', 1),
(20, '2020_06_16_135653x_stok', 2),
(21, '2020_06_16_135653y_stok', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('012dbd447b914088e18ade1ef3dba43b5964a4fb39b4c89623e3675a11759beecd1af969994ddade', 8, 1, 'nApp', '[]', 0, '2020-06-18 03:24:21', '2020-06-18 03:24:21', '2021-06-18 10:24:21'),
('03d2948e217da461c8f74f4633229271988a730dc11514076ff8bedb14eb2d441f36f4c80f1f1b73', 7, 1, 'nApp', '[]', 0, '2020-06-18 03:21:04', '2020-06-18 03:21:04', '2021-06-18 10:21:04'),
('04567fa9341b816991d2ea41b0c6142f85863f4b97e741f3c95faa09533f606efda261a734f5ecfb', 6, 1, 'nApp', '[]', 0, '2020-06-18 02:51:25', '2020-06-18 02:51:25', '2021-06-18 09:51:25'),
('07eadd00b7327e5f100746854140d9be009b4a03e4244c147f3a4d07e2e7fde56b87ae8ee7220a90', 6, 1, 'nApp', '[]', 0, '2020-06-18 01:02:36', '2020-06-18 01:02:36', '2021-06-18 08:02:36'),
('09c0f567c9d5c8dbf5e8936c461dc862a482e3f12b76cfca5b70a32b6513cbe4b89a02c70ee4eb07', 1, 1, 'nApp', '[]', 0, '2020-08-10 00:26:30', '2020-08-10 00:26:30', '2021-08-10 07:26:30'),
('16a56e1d3985be2f92b58f42572359e820a34592e09d01612d1b2a76e3ed1069d810bcc6a3527e7d', 6, 1, 'nApp', '[]', 0, '2020-06-18 03:08:24', '2020-06-18 03:08:24', '2021-06-18 10:08:24'),
('212ca196163ed3e8bce6b70f1ac52f1ab2a7c55d309d06cb11675fae9cffc6a57525f80edc2b6b62', 7, 1, 'nApp', '[]', 0, '2020-06-25 02:06:22', '2020-06-25 02:06:22', '2021-06-25 09:06:22'),
('243606094914ad958daa77a4f2ea6d54b1fa69946ebe5f46862bdb14d11c2f08f019be70994590ca', 8, 1, 'nApp', '[]', 0, '2020-06-22 14:59:57', '2020-06-22 14:59:57', '2021-06-22 21:59:57'),
('24f46646e0b4694356e79cc92b5c8eb36edd351232794fe51b9ad47e0ccd87522459fa512f56bfa8', 5, 1, 'nApp', '[]', 0, '2020-06-18 10:04:08', '2020-06-18 10:04:08', '2021-06-18 17:04:08'),
('2865d9699b186af8d10d8b028a2e968ea0c38bfd21459525b5c49cc8d00a326d30d8e4b405594883', 7, 1, 'nApp', '[]', 0, '2020-06-25 01:54:32', '2020-06-25 01:54:32', '2021-06-25 08:54:32'),
('28a8efba2960fcd16403d980e84e7f125b3ef01590747a74f4361cc9625a988558a2ae3df866ad0d', 6, 1, 'nApp', '[]', 0, '2020-08-06 01:10:46', '2020-08-06 01:10:46', '2021-08-06 08:10:46'),
('2bcd91611dc19c75b4c89fd8d7e9728ff225d0ca5ecd08ffb437efb43cdcc71e4edba7655906ed54', 1, 1, 'nApp', '[]', 0, '2020-06-25 09:17:25', '2020-06-25 09:17:25', '2021-06-25 16:17:25'),
('2c81c44281699153c61b39ae530edf4284d9bf04a47d72710303386a764d586178314785b45f32de', 8, 1, 'nApp', '[]', 0, '2020-06-19 12:03:17', '2020-06-19 12:03:17', '2021-06-19 19:03:17'),
('2cea3b699f9b334f9380222e0c4bb2db3fd4a9d1c050613ba02e5da6dc760a0fb73a50a8f40f4ca9', 5, 1, 'nApp', '[]', 0, '2020-06-18 05:58:47', '2020-06-18 05:58:47', '2021-06-18 12:58:47'),
('3007b04cb7c3ea15ff7a4755e164381d4b2b5ef1dd9e2e823d52e1798ed4cc742f1e6ab0e890556d', 6, 1, 'nApp', '[]', 0, '2020-06-22 02:53:12', '2020-06-22 02:53:12', '2021-06-22 09:53:12'),
('325e9994090e554c71109e9915e912cf196252fba4c4c8a9b52e6f578ef374a7756123473ad9ebb4', 5, 1, 'nApp', '[]', 0, '2020-06-18 06:40:29', '2020-06-18 06:40:29', '2021-06-18 13:40:29'),
('37c950c789e8029772fdbbcbaac03613c4c1b23a92c7f2b359d16752d5fec5861bc52d08fdf55518', 6, 1, 'nApp', '[]', 0, '2020-06-24 00:41:10', '2020-06-24 00:41:10', '2021-06-24 07:41:10'),
('3caba9e11fc99d18076fee41f2f6182dcb6d161ba7217b7cda467c9909725c03b3137a976434bb14', 7, 1, 'nApp', '[]', 0, '2020-06-17 08:00:03', '2020-06-17 08:00:03', '2021-06-17 15:00:03'),
('3d17894e314957c353b9ffd5e0a0ca97155f57ed2e08e05ce145047c040c65263578804baa29cb97', 1, 1, 'nApp', '[]', 0, '2020-07-27 01:15:19', '2020-07-27 01:15:19', '2021-07-27 08:15:19'),
('3e3cfacab22fffd70053492b10003455a7d9c1d5a62832b54017b9508e45ac1b53c0c5eabd682908', 6, 1, 'nApp', '[]', 0, '2020-06-18 01:06:00', '2020-06-18 01:06:00', '2021-06-18 08:06:00'),
('3eb41a943f4c63bb1e60cfe29465b2a709cb4e6a4a290d270d4ee168752c54bcaa4cd7df956a35a3', 1, 1, 'nApp', '[]', 0, '2020-08-10 01:09:46', '2020-08-10 01:09:46', '2021-08-10 08:09:46'),
('3f8ddf44fd04049281eb1286e34c45dfd2d124f4031a49ddbb9bc605b7dc16284f566dfe076cc737', 6, 1, 'nApp', '[]', 0, '2020-06-25 11:46:59', '2020-06-25 11:46:59', '2021-06-25 18:46:59'),
('3fbc16e944c0e67c02b43e50ad6da839c3d61a675354c4e496cca3654e4d4456fed0ff37a48e9ef1', 5, 1, 'nApp', '[]', 0, '2020-06-23 07:26:44', '2020-06-23 07:26:44', '2021-06-23 14:26:44'),
('41e74c4c44611485a3da831d2e27ee82071cb3340298c3f8bf419e33b1fd756c82205f94d89db765', 6, 1, 'nApp', '[]', 0, '2020-06-24 20:33:12', '2020-06-24 20:33:12', '2021-06-25 03:33:12'),
('42346eaaff7af9374f67457eadc291dd2e2e41efa74085fef07ef07fbfba3ee738b56635e9b83226', 6, 1, 'nApp', '[]', 0, '2020-06-18 09:29:03', '2020-06-18 09:29:03', '2021-06-18 16:29:03'),
('4a7085f3a6a434cb2dc3fb334b8a503ccbb629c7ba7698597630cfcdad71db333e3c06e4a38b566b', 5, 1, 'nApp', '[]', 0, '2020-06-18 12:56:49', '2020-06-18 12:56:49', '2021-06-18 19:56:49'),
('4a7e1bc9124746b133a61dc5d5fefb810f77aa7401fa93bb7d3ef5ce105778d472cca05dd0f72af4', 7, 1, 'nApp', '[]', 0, '2020-06-18 09:48:37', '2020-06-18 09:48:37', '2021-06-18 16:48:37'),
('4d45740e1a0e618a369bf339da6ef420fa7933427dbf638ba6c322d467bbd00cf58f499602ad21d8', 6, 1, 'nApp', '[]', 0, '2020-08-05 03:25:07', '2020-08-05 03:25:07', '2021-08-05 10:25:07'),
('4dbb73814e4cfd5ca2c11d1d71f628246283e10374fd4091d3847cf6c0c83e0120494cb7925aaf9a', 6, 1, 'nApp', '[]', 0, '2020-06-17 13:22:10', '2020-06-17 13:22:10', '2021-06-17 20:22:10'),
('4e62b4b9d87b0779321c033a72aed0352aff8086ef395734fc62dde22ab2573a40251c8744c26539', 8, 1, 'nApp', '[]', 0, '2020-06-18 09:39:24', '2020-06-18 09:39:24', '2021-06-18 16:39:24'),
('504d4f4d3fc80b7dc000340b922dfa93ee717c169fffcc74db5349d6067dbfb93686858227b739a6', 7, 1, 'nApp', '[]', 0, '2020-08-10 00:37:59', '2020-08-10 00:37:59', '2021-08-10 07:37:59'),
('511578082bf3801ebd727442f4c54fc9b505301de9712051224899622fb944662a99d6a1cb66ab5f', 6, 1, 'nApp', '[]', 0, '2020-06-17 08:09:33', '2020-06-17 08:09:33', '2021-06-17 15:09:33'),
('5344156b2361da85e3c2020cfdf2d10a3f01afa64a730be0a7a00411741915dd9b13ed2623082923', 6, 1, 'nApp', '[]', 0, '2020-06-23 09:02:40', '2020-06-23 09:02:40', '2021-06-23 16:02:40'),
('54853b23b596d9d183795428b48392ae435dc03b0f113aaf54f9006aaca18f8f335e9c84e5c92196', 5, 1, 'nApp', '[]', 0, '2020-06-23 07:06:38', '2020-06-23 07:06:38', '2021-06-23 14:06:38'),
('58e0181826a4fc4cf2fd1ecfd95ba7d5b4bb2f6f7fbb3193b6c95b676152992ec56d7d392d23f826', 6, 1, 'nApp', '[]', 0, '2020-06-19 09:24:24', '2020-06-19 09:24:24', '2021-06-19 16:24:24'),
('5a74785659397b4bb3acc7adce268af2c16c93ec2dfa7d5e634803b228f1443186d79e3ed578f0b4', 7, 1, 'nApp', '[]', 0, '2020-08-08 06:40:56', '2020-08-08 06:40:56', '2021-08-08 13:40:56'),
('5b352c7b5e2eacbbb63e66f049d108ccf08b0fc8df9ca16c3303c05ea770cf364a956102bfd15f08', 5, 1, 'nApp', '[]', 0, '2020-06-18 09:56:10', '2020-06-18 09:56:10', '2021-06-18 16:56:10'),
('5b6d139a35b58c619dfa48736d41e57779a8fc68a2393895e65d6df6103a9e3130532b8b8a00ca01', 7, 1, 'nApp', '[]', 0, '2020-06-18 09:34:34', '2020-06-18 09:34:34', '2021-06-18 16:34:34'),
('5ba31c55abbe33715b00ce6a833ea554d0fda2da17ab40fd34185e352b749ef4412f2e904f6363ae', 6, 1, 'nApp', '[]', 0, '2020-06-25 12:38:00', '2020-06-25 12:38:00', '2021-06-25 19:38:00'),
('5d6375a57cc80e8015ef80a7994ceedaa33a43c56e9f4e1aa9956eac889e166590ab9cc72e1d2862', 5, 1, 'nApp', '[]', 0, '2020-06-19 01:03:28', '2020-06-19 01:03:28', '2021-06-19 08:03:28'),
('5fb3e525e9d34a4d8be7cb074334bc3b7bf3274003c1dab29e3c2d2263744f8d689cc54051af24b8', 5, 1, 'nApp', '[]', 0, '2020-06-23 07:26:24', '2020-06-23 07:26:24', '2021-06-23 14:26:24'),
('6183ea8800987ffc15631f9f19072eba5e7e56312b2759a4b319642e0f64406dd912c86dbbcc02d9', 5, 1, 'nApp', '[]', 0, '2020-06-18 13:12:05', '2020-06-18 13:12:05', '2021-06-18 20:12:05'),
('6882539ae6169a24842b9841451202249ccf820abf2d355bbb2cc8568ae4cb5b7ab19461d51fdc5c', 5, 1, 'nApp', '[]', 0, '2020-06-25 09:18:37', '2020-06-25 09:18:37', '2021-06-25 16:18:37'),
('69c84f0abb614e0faa0eb5056e19c051a889c9ec7a87eccdb6f1b5b0f99430a46ee10b897c77b93e', 6, 1, 'nApp', '[]', 0, '2020-06-25 10:30:37', '2020-06-25 10:30:37', '2021-06-25 17:30:37'),
('6b208de0228436a77bb9019a635b99e91788edfed6083f8e91131449cd95931f1ae02104c761d7c8', 1, 1, 'nApp', '[]', 0, '2020-06-25 07:18:27', '2020-06-25 07:18:27', '2021-06-25 14:18:27'),
('6b56b057dc6c417d84ea29997356794b9f0acc4d5fbeea60d21f01380900fb140d7ff8de639c71cf', 6, 1, 'nApp', '[]', 0, '2020-06-18 02:55:49', '2020-06-18 02:55:49', '2021-06-18 09:55:49'),
('6f3270a96204d02c8a8212cd0f881fb1a397f5ec6ebbdc03e2813e69322554a48f7382c27a9047e8', 1, 1, 'nApp', '[]', 0, '2020-06-25 13:56:30', '2020-06-25 13:56:30', '2021-06-25 20:56:30'),
('71df49cb6986d21ffb7dcdda0ce1c03d77534fcf763152bff333a61966f1b7fe274a7de415cf704b', 5, 1, 'nApp', '[]', 0, '2020-06-17 07:55:52', '2020-06-17 07:55:52', '2021-06-17 14:55:52'),
('74c0dcb1453d07778369b23f6724a65e82dfb313b674628041456ba5c56fce15cde3708348a100d8', 5, 1, 'nApp', '[]', 0, '2020-06-25 09:15:32', '2020-06-25 09:15:32', '2021-06-25 16:15:32'),
('7661c00e7c6fa4dbaba19a8cdae0c2ff5321ae899d367627f73abceea9e36810f3aadeeb074e9a9c', 6, 1, 'nApp', '[]', 0, '2020-06-17 13:24:13', '2020-06-17 13:24:13', '2021-06-17 20:24:13'),
('7a04ac407c3acd62fdf1bf1b9e84bfa61fa376ca592c01e25d735004b7718784e5cc40d730c99c93', 8, 1, 'nApp', '[]', 0, '2020-06-21 01:19:06', '2020-06-21 01:19:06', '2021-06-21 08:19:06'),
('7cd4213c469808eade414e3d0bc57a6e87c41c75020da414e566d96a54c9c746fa3c0e196dcd276b', 1, 1, 'nApp', '[]', 0, '2020-08-10 00:38:28', '2020-08-10 00:38:28', '2021-08-10 07:38:28'),
('80bd745bd645a26b2593aed5defb3fab818c3d45f0dafc8cde7da00c2c5c248c17c3fab20c9f9139', 8, 1, 'nApp', '[]', 0, '2020-06-18 09:52:35', '2020-06-18 09:52:35', '2021-06-18 16:52:35'),
('838caba1f5f6d881cf0b6353d9884fb84f81a4582a2734932cebd95ea9a49fa2c99105516e6d2e10', 6, 1, 'nApp', '[]', 0, '2020-06-23 14:25:03', '2020-06-23 14:25:03', '2021-06-23 21:25:03'),
('83900f1fe37d17a9e52aa9b53eb0b4079f144d7ef46f2482b7e4c15d6ba8da9b4e148ccbb8cc552f', 6, 1, 'nApp', '[]', 0, '2020-07-28 10:42:43', '2020-07-28 10:42:43', '2021-07-28 17:42:43'),
('83d133c94ae9703b495eb66132521121aa0e41d4c91c1d9cc8765e3f80210e8cd835caf30b1e0470', 7, 1, 'nApp', '[]', 0, '2020-06-19 12:03:04', '2020-06-19 12:03:04', '2021-06-19 19:03:04'),
('87c43a4bee33dee39765376758cc6f648a5536fca4e31f465de65a04d8fc8a6e90a0f1b2e74c7b03', 6, 1, 'nApp', '[]', 0, '2020-06-23 21:30:58', '2020-06-23 21:30:58', '2021-06-24 04:30:58'),
('897fe1fa4bf0f52993346f24beca1bd093fea4e302062ac6ff94f31a40882a53b8d6831e2b5bfbf1', 1, 1, 'nApp', '[]', 0, '2020-06-25 07:16:48', '2020-06-25 07:16:48', '2021-06-25 14:16:48'),
('89941ca511d6c4ba34dd76be6a60f1ab629c17cad6c72a0c42c362af8713949d6b0b254cb1f592d5', 6, 1, 'nApp', '[]', 0, '2020-06-19 00:49:14', '2020-06-19 00:49:14', '2021-06-19 07:49:14'),
('8d702a9ff7431bc123480eb0887c77ca0e7c9408d6b6c5f40cf351a55d09dd3aa0a84e49b89194eb', 6, 1, 'nApp', '[]', 0, '2020-06-23 02:31:46', '2020-06-23 02:31:46', '2021-06-23 09:31:46'),
('8e877f7ad085dd2fdfe6bccfeea370f4d3f70d99caa8caf7eb85a2b24ee4e6fc853e55cbdb6dc392', 6, 1, 'nApp', '[]', 0, '2020-06-17 20:58:08', '2020-06-17 20:58:08', '2021-06-18 03:58:08'),
('917cbd3009781ad54c60a9a1448dae7ec81acee9f6121be8996d2209e041aaa5d65e3335bf74e520', 5, 1, 'nApp', '[]', 0, '2020-06-25 07:16:58', '2020-06-25 07:16:58', '2021-06-25 14:16:58'),
('94366cf615506d550e3e7e0b7ac32d51c274c598b20b586579d66f9824f6e1975e9fa2c6f971e90f', 6, 1, 'nApp', '[]', 0, '2020-06-23 02:35:58', '2020-06-23 02:35:58', '2021-06-23 09:35:58'),
('9585ed816b20b964e0619fb80964b124dd507013bc6ba810658e351e4cbccbbc0d24fe7f1a5adc08', 1, 1, 'nApp', '[]', 0, '2020-06-25 09:19:01', '2020-06-25 09:19:01', '2021-06-25 16:19:01'),
('97c71448c60562150623645b3b9d489529b5b1029efee9e2d31d73e188700e351fedc0fa951cd606', 6, 1, 'nApp', '[]', 0, '2020-06-18 02:53:12', '2020-06-18 02:53:12', '2021-06-18 09:53:12'),
('9b0d49b76dbb4e4aa8e101582956144f324f17b5e0ff724f66d43a1324cb1f8acec0ab09619ab808', 6, 1, 'nApp', '[]', 0, '2020-06-22 06:10:13', '2020-06-22 06:10:13', '2021-06-22 13:10:13'),
('9bc2e75aebb86a3b8255f9fcba805d31b5a3b8e4864957e5e3b3bd8a442bc3ac7c3aa343b2bc17f5', 5, 1, 'nApp', '[]', 0, '2020-06-18 10:37:50', '2020-06-18 10:37:50', '2021-06-18 17:37:50'),
('9fcae314e79e5c4b46900bdc5636ce7278aa06b025cd25b33d6f6af1abe09f50a27a9382480ec4aa', 6, 1, 'nApp', '[]', 0, '2020-06-18 03:18:27', '2020-06-18 03:18:27', '2021-06-18 10:18:27'),
('a20ae8c95395f0718190aed09eafc86efa7a73d433f5f65d478b23fae44faca2dafb50e55cd02ecb', 6, 1, 'nApp', '[]', 0, '2020-06-23 09:11:33', '2020-06-23 09:11:33', '2021-06-23 16:11:33'),
('a32956b270b7d0b32f5b90e919a12021d7a4891406eaf33a03a1f887f75982aa2fcf746ecae2de53', 5, 1, 'nApp', '[]', 0, '2020-06-18 10:38:50', '2020-06-18 10:38:50', '2021-06-18 17:38:50'),
('a5b8e038f2c4070465acb52263c89c04c4a04c8eda49f5f854d6110d39681c0347258107bc21ae61', 1, 1, 'nApp', '[]', 0, '2020-08-27 08:16:15', '2020-08-27 08:16:15', '2021-08-27 15:16:15'),
('aa573564fe89f19fce1f0ebd1b6a58f28d3fb35800435260e03dc5e92feed0a1f041fcaddf8e1cc4', 1, 1, 'nApp', '[]', 0, '2020-06-25 07:27:36', '2020-06-25 07:27:36', '2021-06-25 14:27:36'),
('b202c1a30dde1e176e0180ac091347591cb489c4be5efea740a2c9574285195c49cdf34b85b85caa', 8, 1, 'nApp', '[]', 0, '2020-06-25 02:11:38', '2020-06-25 02:11:38', '2021-06-25 09:11:38'),
('b276ad555f48b195b277dd95a3cd08b397499fb1c52720d8e212675072dd2588d104f07493c0a59f', 6, 1, 'nApp', '[]', 0, '2020-06-18 09:15:10', '2020-06-18 09:15:10', '2021-06-18 16:15:10'),
('b5608c4016bb86546a040e04ffc95b3b97eb9cb532663242f16ca0fd68b8c078b335cdc54abd783a', 1, 1, 'nApp', '[]', 0, '2020-06-24 01:16:06', '2020-06-24 01:16:06', '2021-06-24 08:16:06'),
('bb6f653ced19dbeff6c1cb3ec53b85d4ba808c759079c92cda58ae55a35c7c77365cd95030495c49', 8, 1, 'nApp', '[]', 0, '2020-06-17 08:00:32', '2020-06-17 08:00:32', '2021-06-17 15:00:32'),
('be8b99cc5601e0946303fb73eb6fa10d8daeff38ea262721475d607e2202afc84e651d5275565d84', 7, 1, 'nApp', '[]', 0, '2020-08-10 00:38:12', '2020-08-10 00:38:12', '2021-08-10 07:38:12'),
('c49b2426dda80cd1c1677da15eaf73fe1b806565c21542ac547c208c33ea941c5353b1a655fb5d04', 5, 1, 'nApp', '[]', 0, '2020-06-19 00:54:10', '2020-06-19 00:54:10', '2021-06-19 07:54:10'),
('c86a2fe28da1edfb33cecb174eacfcfcdab6284fe9379acc5b3dd00f86d3f4aaf63ded5a79debe66', 5, 1, 'nApp', '[]', 0, '2020-06-18 13:07:41', '2020-06-18 13:07:41', '2021-06-18 20:07:41'),
('ce2bb9edf42a158907962da664e2683614e9637780033a1fec69e11e60c57f50f0e08180cad69562', 7, 1, 'nApp', '[]', 0, '2020-06-25 09:16:27', '2020-06-25 09:16:27', '2021-06-25 16:16:27'),
('cfa65b65eb46cee81ae8574835e43888b7ccde011467f92d17b788278e98c4c625a23a977747c7a7', 1, 1, 'nApp', '[]', 0, '2020-06-25 13:58:43', '2020-06-25 13:58:43', '2021-06-25 20:58:43'),
('d215dcbeb1f342fc91fa8ee8cba2d9d9ae4f3d31349a12b750be25490ff326d2e3944d7abab60fe9', 1, 1, 'nApp', '[]', 0, '2020-08-08 06:41:34', '2020-08-08 06:41:34', '2021-08-08 13:41:34'),
('d217b9f7ce20f45fc541c90832579886631f01b22e63e290248582fc7a4efca031080c6c1710066c', 7, 1, 'nApp', '[]', 0, '2020-06-18 03:17:54', '2020-06-18 03:17:54', '2021-06-18 10:17:54'),
('d2b855352ce1117713d5339d6d68c95660564a9100fc0509f1bd1ca7e127f24163e7029d50e395ce', 5, 1, 'nApp', '[]', 0, '2020-06-19 07:12:23', '2020-06-19 07:12:23', '2021-06-19 14:12:23'),
('d762a39e6ac6f15abbe3b4e6edffd07a9f2f2676094a3508a881be400188056b64be091f0742a49e', 6, 1, 'nApp', '[]', 0, '2020-08-05 03:24:25', '2020-08-05 03:24:25', '2021-08-05 10:24:25'),
('d93b97ec58314d4d62104390327745a309afbc845c7fac1b10bfad889f884378c0e9f937b4b37b23', 8, 1, 'nApp', '[]', 0, '2020-06-25 09:15:48', '2020-06-25 09:15:48', '2021-06-25 16:15:48'),
('d99ef469fa6ee6bff7753fe8a445d02b9603d168afaf82763e8ebf11831a473c762b2976284077f1', 6, 1, 'nApp', '[]', 0, '2020-06-17 11:31:02', '2020-06-17 11:31:02', '2021-06-17 18:31:02'),
('da033f7a517f1657848a93039dcb897d43cab2ba4ca54ce70aa12953aa62d561e4ea62a93940814f', 6, 1, 'nApp', '[]', 0, '2020-06-17 13:18:19', '2020-06-17 13:18:19', '2021-06-17 20:18:19'),
('e15917ed49b9bb9c7ab90e209f218ba1e232474a31000fab9622d74466202ac98378f6ee80b3fb79', 6, 1, 'nApp', '[]', 0, '2020-06-17 07:59:34', '2020-06-17 07:59:34', '2021-06-17 14:59:34'),
('e34bcbef29fce7767b4093ed0048957eca8a8a7a2a6ba3792c573a7e5bd44fa00d9b1b10b8e8844e', 5, 1, 'nApp', '[]', 0, '2020-06-19 00:52:07', '2020-06-19 00:52:07', '2021-06-19 07:52:07'),
('e71471d671bc2ad33ca800d11460cc4300c66041d3e62b353ec739cedbc52193c7bf1e3bd769cc30', 6, 1, 'nApp', '[]', 0, '2020-06-19 07:12:14', '2020-06-19 07:12:14', '2021-06-19 14:12:14'),
('e79c7c85871f599f8dd89a559d193035e40c676d0057a29a26915c2f91af6704873140bb815686dc', 6, 1, 'nApp', '[]', 0, '2020-06-23 21:34:21', '2020-06-23 21:34:21', '2021-06-24 04:34:21'),
('e818820213c1f896f1c3007674292b7304322aa5de72ac8543c496a71b89009eb5edf75a393a14a3', 6, 1, 'nApp', '[]', 0, '2020-06-17 08:48:56', '2020-06-17 08:48:56', '2021-06-17 15:48:56'),
('edc5301e5d63d77cfc928fda5cb1c71e8a7cb0740bc52d3c87726d157407cbd33467ec632b8b932c', 6, 1, 'nApp', '[]', 0, '2020-06-17 22:29:41', '2020-06-17 22:29:41', '2021-06-18 05:29:41'),
('eedc25e82386a1f33150e7dba2150925ecbac67f06ac39098386439e206858a695ff4d15d0f39cb1', 6, 1, 'nApp', '[]', 0, '2020-06-18 09:43:30', '2020-06-18 09:43:30', '2021-06-18 16:43:30'),
('f277ce963a25f39ca258cabb7fbeb24af8e3188d0270fc63ef462bd749362e8150dc2802eb5108a4', 5, 1, 'nApp', '[]', 0, '2020-06-17 07:52:44', '2020-06-17 07:52:44', '2021-06-17 14:52:44'),
('f5324b56aa5a4ad7325fa0a9bbd9d5f03e73652212ac2b7a6e9a0dbc2c293b8005473eb40a7c2c2b', 8, 1, 'nApp', '[]', 0, '2020-06-22 02:24:12', '2020-06-22 02:24:12', '2021-06-22 09:24:12'),
('f7977f479d06b8711ed106dd64430d7e97749a303ee99bb46f8804595e1bb45b19ef1d2d5abfe9b5', 6, 1, 'nApp', '[]', 0, '2020-06-19 00:51:57', '2020-06-19 00:51:57', '2021-06-19 07:51:57'),
('f8e3f6d66ae8d54919ee0b5bf1b9d08ead3c7c64a4eef889007d21201b560872f5e2865bdf2bf1d5', 6, 1, 'nApp', '[]', 0, '2020-06-25 09:16:40', '2020-06-25 09:16:40', '2021-06-25 16:16:40'),
('fdfb4e17e809815a19b6dbdb3ccadd7aee7eed02ad5e8dd6a35fe6d9e7a4a3c71fd7ed1e5154a176', 5, 1, 'nApp', '[]', 0, '2020-06-18 10:38:31', '2020-06-18 10:38:31', '2021-06-18 17:38:31');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Cimory Personal Access Client', 'PD8ELmSSEfwDw3yToWymCpUWDAzqulF0i4IMKlOy', NULL, 'http://localhost', 1, 0, 0, '2020-06-17 07:52:04', '2020-06-17 07:52:04'),
(2, NULL, 'Cimory Password Grant Client', '6GNStGax3Yf5g41PKOSPIgrmVfB0jZQEKDMrUNBq', 'users', 'http://localhost', 0, 1, 0, '2020-06-17 07:52:04', '2020-06-17 07:52:04');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-06-17 07:52:04', '2020-06-17 07:52:04');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dc_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `no_invoice` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produk_id` bigint(20) UNSIGNED NOT NULL,
  `qty_pembelian` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `dc_id`, `tanggal_pembelian`, `no_invoice`, `produk_id`, `qty_pembelian`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2020-06-22', 'PS01', 1, 300, '2020-06-22 02:53:38', '2020-06-22 02:53:38', NULL),
(2, 1, '2020-06-25', 'PS02', 2, 320, '2020-06-22 06:17:44', '2020-06-22 06:17:44', NULL),
(3, 2, '2020-06-22', 'TB01', 1, 350, '2020-06-25 01:54:58', '2020-06-25 01:54:58', NULL),
(4, 2, '2020-06-25', 'TB02', 2, 280, '2020-06-25 02:08:51', '2020-06-25 02:08:51', NULL),
(5, 3, '2020-06-22', 'CL01', 1, 225, '2020-06-25 02:12:08', '2020-06-25 02:12:08', NULL),
(6, 3, '2020-06-25', 'CL02', 2, 345, '2020-06-25 02:14:20', '2020-06-25 02:14:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dc_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_penjualan` date NOT NULL,
  `kode_transaksi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sales_id` bigint(20) UNSIGNED NOT NULL,
  `produk_id` bigint(20) UNSIGNED NOT NULL,
  `qty_penjualan` bigint(20) NOT NULL,
  `nilai_penjualan` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `dc_id`, `tanggal_penjualan`, `kode_transaksi`, `sales_id`, `produk_id`, `qty_penjualan`, `nilai_penjualan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2020-06-22', 'TX/PS/01', 1, 1, 250, 3000000, '2020-06-22 02:54:03', '2020-06-22 02:54:03', NULL),
(2, 1, '2020-06-22', 'TX/PS/02', 2, 1, 10, 120000, '2020-06-22 02:55:24', '2020-06-22 02:55:24', NULL),
(3, 1, '2020-06-23', 'TX/PS/03', 2, 1, 10, 120000, '2020-06-22 02:56:08', '2020-06-22 02:56:08', NULL),
(4, 1, '2020-06-23', 'TX/PS/04', 1, 1, 10, 120000, '2020-06-22 02:56:57', '2020-06-22 02:56:57', NULL),
(5, 1, '2020-06-25', 'TX/PS/05', 1, 2, 100, 1450000, '2020-06-22 06:19:25', '2020-06-22 06:19:25', NULL),
(6, 1, '2020-06-25', 'TX/PS/06', 2, 2, 120, 1740000, '2020-06-22 06:21:20', '2020-06-22 06:21:20', NULL),
(7, 1, '2020-06-26', 'TX/PS/07', 1, 2, 70, 1015000, '2020-06-22 06:23:30', '2020-06-22 06:23:30', NULL),
(8, 1, '2020-06-26', 'TX/PS/08', 2, 2, 20, 290000, '2020-06-22 06:25:40', '2020-06-22 06:25:40', NULL),
(9, 2, '2020-06-22', 'TX/TB/01', 3, 1, 150, 1800000, '2020-06-25 01:55:38', '2020-06-25 01:55:38', NULL),
(10, 2, '2020-06-22', 'TX/TB/02', 4, 1, 125, 1500000, '2020-06-25 01:56:08', '2020-06-25 01:56:08', NULL),
(11, 2, '2020-06-23', 'TX/TB/03', 3, 1, 70, 840000, '2020-06-25 02:06:56', '2020-06-25 02:06:56', NULL),
(12, 2, '2020-06-25', 'TX/TB/04', 3, 2, 170, 2465000, '2020-06-25 02:09:46', '2020-06-25 02:09:46', NULL),
(13, 2, '2020-06-26', 'TX/TB/05', 4, 2, 100, 1450000, '2020-06-25 02:10:28', '2020-06-25 02:10:28', NULL),
(14, 3, '2020-06-22', 'TX/CL/01', 5, 1, 185, 2220000, '2020-06-25 02:12:53', '2020-06-25 02:12:53', NULL),
(15, 3, '2020-06-23', 'TX/CL/02', 6, 1, 40, 480000, '2020-06-25 02:13:29', '2020-06-25 02:13:29', NULL),
(16, 3, '2020-06-25', 'TX/CL/03', 5, 2, 50, 725000, '2020-06-25 02:15:11', '2020-06-25 02:15:11', NULL),
(17, 3, '2020-06-25', 'TX/CL/04', 6, 2, 50, 725000, '2020-06-25 02:15:34', '2020-06-25 02:15:34', NULL),
(18, 3, '2020-06-26', 'TX/CL/06', 5, 2, 45, 652500, '2020-06-25 02:16:11', '2020-06-25 02:16:11', NULL),
(19, 3, '2020-06-27', 'TX/CL/07', 6, 2, 180, 2610000, '2020-06-25 02:17:19', '2020-06-25 02:17:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_produk` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_produk` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `kode_produk`, `nama_produk`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'C01', 'CYD 250 ML', '2020-06-17 08:04:24', '2020-06-17 08:04:24', NULL),
(2, 'C02', 'CYD 70 ML Banded 5', '2020-06-17 08:04:34', '2020-06-17 08:04:34', NULL),
(3, 'C03', 'CYD 70 ML banded 4', '2020-06-17 08:04:46', '2020-06-17 08:04:46', NULL),
(4, 'C04', 'ESL Coklat dll', '2020-06-17 08:05:05', '2020-06-17 08:05:05', NULL),
(5, 'C05', 'ESL Plain', '2020-06-17 08:05:15', '2020-06-17 08:05:15', NULL),
(6, 'C06', 'UHT Comry Milk 250 ML', '2020-06-17 08:05:29', '2020-06-17 08:05:29', NULL),
(7, 'C07', 'UHT Cimory milk 125 ML', '2020-06-17 08:05:44', '2020-06-17 08:05:44', NULL),
(8, 'C08', 'YOLITE C+ 100', '2020-06-17 08:06:03', '2020-06-17 08:06:03', NULL),
(9, 'C09', 'Kanzler Singles', '2020-06-17 08:06:17', '2020-06-17 08:06:17', NULL),
(10, 'C10', 'Cimory Squeeze', '2020-06-17 08:06:29', '2020-06-17 08:06:29', NULL),
(11, 'C11', 'CYD 250 ML Low fat', '2020-06-17 08:06:44', '2020-06-17 08:06:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `retur`
--

CREATE TABLE `retur` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dc_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_sjr` date NOT NULL,
  `kode_sjr` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produk_id` bigint(20) UNSIGNED NOT NULL,
  `qty_retur` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `retur`
--

INSERT INTO `retur` (`id`, `dc_id`, `tanggal_sjr`, `kode_sjr`, `produk_id`, `qty_retur`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 1, '2020-06-23', 'SJR/PS/01', 1, 11, '2020-06-22 04:58:06', '2020-06-22 04:58:06', NULL),
(9, 1, '2020-06-24', 'SJR/PS/02', 1, 9, '2020-06-22 06:15:22', '2020-06-22 06:15:22', NULL),
(10, 1, '2020-06-26', 'SJR/PS/03', 2, 10, '2020-06-22 06:26:53', '2020-06-22 06:26:53', NULL),
(11, 2, '2020-06-24', 'SJR/TB/01', 1, 5, '2020-06-25 02:07:48', '2020-06-25 02:07:48', NULL),
(12, 2, '2020-06-26', 'SJR/TB/02', 2, 10, '2020-06-25 02:11:03', '2020-06-25 02:11:03', NULL),
(13, 3, '2020-06-27', 'SJR/CL/02', 2, 20, '2020-06-25 02:17:46', '2020-06-25 02:17:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dc',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'root', NULL, NULL, NULL),
(2, 'ho', NULL, NULL, NULL),
(3, 'dc', NULL, NULL, NULL),
(4, 'admin', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_sales` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_sales` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `kode_sales`, `nama_sales`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'DC1-01', 'Fakhri', '2020-06-17 08:02:33', '2020-06-17 08:02:33', NULL),
(2, 'DC1-02', 'Hanan', '2020-06-17 08:02:42', '2020-06-17 08:02:42', NULL),
(3, 'DC2-01', 'Budi', '2020-06-17 08:02:53', '2020-06-17 08:02:53', NULL),
(4, 'DC2-02', 'Dedi', '2020-06-17 08:03:02', '2020-06-17 08:03:02', NULL),
(5, 'DC3-01', 'Asep', '2020-06-17 08:03:10', '2020-06-17 08:03:10', NULL),
(6, 'DC3-02', 'Ujang', '2020-06-17 08:03:16', '2020-06-17 08:03:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dc_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_stok` date NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produk_id` bigint(20) UNSIGNED NOT NULL,
  `qty_stok` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`id`, `dc_id`, `tanggal_stok`, `keterangan`, `produk_id`, `qty_stok`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2020-06-22', 'pembelian PS01 : 300', 1, 300, '2020-06-22 02:53:38', '2020-06-22 02:53:38', NULL),
(2, 1, '2020-06-22', 'penjualan TX/PS/01 : 250', 1, 50, '2020-06-22 02:54:03', '2020-06-22 02:54:03', NULL),
(3, 1, '2020-06-22', 'penjualan TX/PS/02 : 10', 1, 40, '2020-06-22 02:55:24', '2020-06-22 02:55:24', NULL),
(4, 1, '2020-06-23', 'penjualan TX/PS/03 : 10', 1, 30, '2020-06-22 02:56:08', '2020-06-22 02:56:08', NULL),
(5, 1, '2020-06-23', 'penjualan TX/PS/04 : 10', 1, 20, '2020-06-22 02:56:57', '2020-06-22 02:56:57', NULL),
(11, 1, '2020-06-23', 'retur SJR/PS/01 : 11', 1, 9, '2020-06-22 04:58:06', '2020-06-22 04:58:06', NULL),
(14, 1, '2020-06-24', 'retur SJR/PS/02 : 9', 1, 0, '2020-06-22 06:15:22', '2020-06-22 06:15:22', NULL),
(15, 1, '2020-06-25', 'pembelian PS02 : 320', 2, 320, '2020-06-22 06:17:44', '2020-06-22 06:17:44', NULL),
(16, 1, '2020-06-25', 'penjualan TX/PS/05 : 100', 2, 220, '2020-06-22 06:19:25', '2020-06-22 06:19:25', NULL),
(17, 1, '2020-06-25', 'penjualan TX/PS/06 : 120', 2, 100, '2020-06-22 06:21:20', '2020-06-22 06:21:20', NULL),
(18, 1, '2020-06-26', 'penjualan TX/PS/07 : 70', 2, 30, '2020-06-22 06:23:30', '2020-06-22 06:23:30', NULL),
(19, 1, '2020-06-26', 'penjualan TX/PS/08 : 20', 2, 10, '2020-06-22 06:25:40', '2020-06-22 06:25:40', NULL),
(20, 1, '2020-06-26', 'retur SJR/PS/03 : 10', 2, 0, '2020-06-22 06:26:53', '2020-06-22 06:26:53', NULL),
(21, 2, '2020-06-22', 'pembelian TB01 : 350', 1, 350, '2020-06-25 01:54:58', '2020-06-25 01:54:58', NULL),
(22, 2, '2020-06-22', 'penjualan TX/TB/01 : 150', 1, 200, '2020-06-25 01:55:38', '2020-06-25 01:55:38', NULL),
(23, 2, '2020-06-22', 'penjualan TX/TB/02 : 125', 1, 75, '2020-06-25 01:56:08', '2020-06-25 01:56:08', NULL),
(24, 2, '2020-06-23', 'penjualan TX/TB/03 : 70', 1, 5, '2020-06-25 02:06:56', '2020-06-25 02:06:56', NULL),
(25, 2, '2020-06-24', 'retur SJR/TB/01 : 5', 1, 0, '2020-06-25 02:07:48', '2020-06-25 02:07:48', NULL),
(26, 2, '2020-06-25', 'pembelian TB02 : 280', 2, 280, '2020-06-25 02:08:51', '2020-06-25 02:08:51', NULL),
(27, 2, '2020-06-25', 'penjualan TX/TB/04 : 170', 2, 110, '2020-06-25 02:09:46', '2020-06-25 02:09:46', NULL),
(28, 2, '2020-06-26', 'penjualan TX/TB/05 : 100', 2, 10, '2020-06-25 02:10:28', '2020-06-25 02:10:28', NULL),
(29, 2, '2020-06-26', 'retur SJR/TB/02 : 10', 2, 0, '2020-06-25 02:11:03', '2020-06-25 02:11:03', NULL),
(30, 3, '2020-06-22', 'pembelian CL01 : 225', 1, 225, '2020-06-25 02:12:08', '2020-06-25 02:12:08', NULL),
(31, 3, '2020-06-22', 'penjualan TX/CL/01 : 185', 1, 40, '2020-06-25 02:12:53', '2020-06-25 02:12:53', NULL),
(32, 3, '2020-06-23', 'penjualan TX/CL/02 : 40', 1, 0, '2020-06-25 02:13:29', '2020-06-25 02:13:29', NULL),
(33, 3, '2020-06-25', 'pembelian CL02 : 345', 2, 345, '2020-06-25 02:14:20', '2020-06-25 02:14:20', NULL),
(34, 3, '2020-06-25', 'penjualan TX/CL/03 : 50', 2, 295, '2020-06-25 02:15:11', '2020-06-25 02:15:11', NULL),
(35, 3, '2020-06-25', 'penjualan TX/CL/04 : 50', 2, 245, '2020-06-25 02:15:34', '2020-06-25 02:15:34', NULL),
(36, 3, '2020-06-26', 'penjualan TX/CL/06 : 45', 2, 200, '2020-06-25 02:16:11', '2020-06-25 02:16:11', NULL),
(37, 3, '2020-06-27', 'penjualan TX/CL/07 : 180', 2, 20, '2020-06-25 02:17:19', '2020-06-25 02:17:19', NULL),
(38, 3, '2020-06-27', 'retur SJR/CL/02 : 20', 2, 0, '2020-06-25 02:17:46', '2020-06-25 02:17:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT '3',
  `dc_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `dc_id`, `name`, `username`, `email`, `email_verified_at`, `password`, `alamat`, `phone`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, NULL, 'Head Office', 'ho', 'ahmadbagwi.id@gmail.com', NULL, '$2y$10$glsVff7rJDLFBY1xm4W1ber2EURcEbwn43Pw7aYttH8NpD9GTVv.G', 'Cibanteng', '085719191812', NULL, NULL, NULL, NULL),
(2, 2, NULL, 'Dinda Yourista', 'dinda', 'dinda.ipb42@gmail.com', NULL, '$2y$10$HEfUZiGP1spzmJ1l3X0id.FvFgIJCQkvakAuSvTkNAp7rfu3MNn/.', 'Tuban, Jawa Timur', '085719191812', NULL, NULL, NULL, NULL),
(3, 3, NULL, 'Arumi Nismara', 'nismara', 'nismara.id@gmail.com', NULL, '$2y$10$jyENiZJH2jW18yvuHkVUle5DG3q4HE08ltZtWbI3DLNQausHeDTa.', 'TDP', '085719191852', NULL, NULL, NULL, NULL),
(4, 4, NULL, 'Rifanti', 'rifanti', 'rifanti.id@gmail.com', NULL, '$2y$10$g46sRVh.WhfyHL8HacTq4uPEAR.vXMZDFDR38KaDZBTHr8JcuRIIe', 'Cibanteng', '085719191812', NULL, NULL, NULL, NULL),
(5, 4, NULL, 'admin01', 'admin01', 'admin@cimory.local', NULL, '$2y$10$effb/UNfhHujhEkDo5KSReLp4CjSHFFFnw2UIndSaJY9DOAGmlSC6', NULL, NULL, NULL, '2020-06-17 07:51:36', '2020-06-17 07:51:36', NULL),
(6, 3, 1, 'pesanggrahan', 'pesanggrahan', 'pesanggrahan@cimory.local', NULL, '$2y$10$KL/7iggA8iyhCtAXzI2OEus0udCbPZJwt30vGhV5gqC1jD.JvPIAS', NULL, NULL, NULL, '2020-06-17 07:59:34', '2020-06-17 07:59:34', NULL),
(7, 3, 2, 'tanahabang', 'tanahabang', 'tanahabang@cimory.local', NULL, '$2y$10$Ds2cFDwtliOd4p56N0nVZuLVC5NhKTtuI6zBdEGNECqr3n0HSuKca', NULL, NULL, NULL, '2020-06-17 08:00:03', '2020-06-17 08:00:03', NULL),
(8, 3, 3, 'ciledug', 'ciledug', 'ciledug@cimory.local', NULL, '$2y$10$glsVff7rJDLFBY1xm4W1ber2EURcEbwn43Pw7aYttH8NpD9GTVv.G', NULL, NULL, NULL, '2020-06-17 08:00:32', '2020-06-17 08:00:32', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aktifitas`
--
ALTER TABLE `aktifitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aktifitas_user_id_index` (`user_id`);

--
-- Indexes for table `dc`
--
ALTER TABLE `dc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dc_kode_dc_unique` (`kode_dc`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `harga`
--
ALTER TABLE `harga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `harga_id_produk_index` (`produk_id`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_dc_id_produk_index` (`produk_id`),
  ADD KEY `transaksi_dc_id_dc_index` (`dc_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembelian_dc_id_index` (`dc_id`),
  ADD KEY `pembelian_produk_id_index` (`produk_id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualan_dc_id_index` (`dc_id`),
  ADD KEY `penjualan_sales_id_index` (`sales_id`),
  ADD KEY `penjualan_produk_id_index` (`produk_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `retur`
--
ALTER TABLE `retur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `retur_dc_id_index` (`dc_id`),
  ADD KEY `retur_produk_id_index` (`produk_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_kode_sales_unique` (`kode_sales`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stok_dc_id_index` (`dc_id`),
  ADD KEY `stok_produk_id_index` (`produk_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_index` (`role_id`),
  ADD KEY `users_dc_id_index` (`dc_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aktifitas`
--
ALTER TABLE `aktifitas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dc`
--
ALTER TABLE `dc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `harga`
--
ALTER TABLE `harga`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `retur`
--
ALTER TABLE `retur`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `aktifitas`
--
ALTER TABLE `aktifitas`
  ADD CONSTRAINT `aktifitas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `harga`
--
ALTER TABLE `harga`
  ADD CONSTRAINT `harga_id_produk_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `transaksi_dc_id_dc_foreign` FOREIGN KEY (`dc_id`) REFERENCES `dc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_dc_id_produk_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_dc_id_foreign` FOREIGN KEY (`dc_id`) REFERENCES `dc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_dc_id_foreign` FOREIGN KEY (`dc_id`) REFERENCES `dc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_sales_id_foreign` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retur`
--
ALTER TABLE `retur`
  ADD CONSTRAINT `retur_dc_id_foreign` FOREIGN KEY (`dc_id`) REFERENCES `dc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retur_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stok`
--
ALTER TABLE `stok`
  ADD CONSTRAINT `stok_dc_id_foreign` FOREIGN KEY (`dc_id`) REFERENCES `dc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stok_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_dc_id_foreign` FOREIGN KEY (`dc_id`) REFERENCES `dc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
