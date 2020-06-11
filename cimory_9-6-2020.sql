-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 09, 2020 at 07:00 PM
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
(1, 'DC10', 'Kediri', '2020-06-09 00:49:31', '2020-06-09 00:49:58', NULL),
(2, 'DC11', 'Surabaya', '2020-06-09 01:04:11', '2020-06-09 01:04:11', NULL),
(3, 'DC12', 'Bogor', '2020-06-09 01:04:21', '2020-06-09 01:04:24', '2020-06-09 01:04:24'),
(5, 'DC13', 'Semarang', '2020-06-09 07:31:01', '2020-06-09 07:31:01', NULL),
(6, 'DC14', 'Tuban', '2020-06-09 09:07:05', '2020-06-09 09:07:34', NULL);

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
  `id_sales` bigint(20) UNSIGNED NOT NULL,
  `id_produk` bigint(20) UNSIGNED NOT NULL,
  `harga_dasar` bigint(20) NOT NULL,
  `harga_jual` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `harga`
--

INSERT INTO `harga` (`id`, `id_sales`, `id_produk`, `harga_dasar`, `harga_jual`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 4, 5000, 7000, '2020-06-09 08:56:06', '2020-06-09 09:05:01', NULL),
(3, 4, 8, 7600, 8600, '2020-06-09 08:57:43', '2020-06-09 08:57:43', NULL),
(4, 2, 17, 5000, 6000, '2020-06-09 09:06:05', '2020-06-09 09:06:05', NULL);

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
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2015_02_17_122215_aktifitas', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(8, '2016_06_01_000004_create_oauth_clients_table', 1),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2020_06_07_230558_produk', 1),
(12, '2020_06_07_230610_sales', 1),
(13, '2020_06_07_230622_harga', 1),
(14, '2020_06_07_230635_dc', 1),
(15, '2020_06_07_230649_transaksi_dc', 1);

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
('07e1dba752aa9489fe4fa33fdc63c7a1c76189d5ebf85692ae70579570fd2495ea218c6932f91b36', 3, 1, 'nApp', '[]', 0, '2020-06-07 16:55:47', '2020-06-07 16:55:47', '2021-06-07 23:55:47'),
('0d4c20c3a64e493f6466f276c1363cd09937ca908982f540b480e594c9c0f7c34ee7e078e3c0a6bd', 4, 1, 'nApp', '[]', 0, '2020-06-08 05:50:13', '2020-06-08 05:50:13', '2021-06-08 12:50:13'),
('16c3679d0a7ec6de417d3719f7b782b5d98b71c34fc544ab4e2697b32dd8d82cc4175d1d3128e9b6', 1, 1, 'nApp', '[]', 0, '2020-06-07 16:55:32', '2020-06-07 16:55:32', '2021-06-07 23:55:32'),
('2067faae60269a034dbb46009efd1c58b962d48948ef1992632ad145669c405e294270a222787411', 10, 1, 'nApp', '[]', 0, '2020-06-09 05:16:13', '2020-06-09 05:16:13', '2021-06-09 12:16:13'),
('21e7d86a024d034de2118c2c7c79e7efb1c6e91555a648b471f493f8886c1be58ae4f462ea0215f7', 4, 1, 'nApp', '[]', 0, '2020-06-09 07:38:03', '2020-06-09 07:38:03', '2021-06-09 14:38:03'),
('3161034384ec510ce62313c1a0c19cf5c5d5061e1586baba3a062e076d12373576c9d759e7585df1', 4, 1, 'nApp', '[]', 0, '2020-06-09 00:26:57', '2020-06-09 00:26:57', '2021-06-09 07:26:57'),
('32bf6c02b903da28033c582b1ad24a8d8bf85ae6a592720af9c849132d63b61f67b238bd12946e25', 3, 1, 'nApp', '[]', 0, '2020-06-08 01:27:48', '2020-06-08 01:27:48', '2021-06-08 08:27:48'),
('36385290d573bada37503a809ef4d53aefaae07bde5252b3ecce3051e0b57c54220b917570a5b750', 3, 1, 'nApp', '[]', 0, '2020-06-08 03:06:12', '2020-06-08 03:06:12', '2021-06-08 10:06:12'),
('3705ec25f591f0fb98eda1b443db532ec31643a08bade90f20c60594caf5f107813b4c954620228a', 2, 1, 'nApp', '[]', 0, '2020-06-08 01:17:29', '2020-06-08 01:17:29', '2021-06-08 08:17:29'),
('3b939df26370152a8b560374329d68c0db1230f10b0799c95387c167edc0ecab071db2ba695591a0', 4, 1, 'nApp', '[]', 0, '2020-06-08 10:21:19', '2020-06-08 10:21:19', '2021-06-08 17:21:19'),
('3dd0fa941c9ed7b50e1f43e9ee9037e08292b73152fe943786af534ca6e985128e05ee8346b5c0e0', 2, 1, 'nApp', '[]', 0, '2020-06-08 03:06:40', '2020-06-08 03:06:40', '2021-06-08 10:06:40'),
('41e1597848edd610105abfd13a53c85863b4efc47c7c0a3a02066f6caf73a820f6f6d09df523e03b', 2, 1, 'nApp', '[]', 0, '2020-06-07 17:07:12', '2020-06-07 17:07:12', '2021-06-08 00:07:12'),
('43d183b87c060bd5f15b35670320f9c37e4fb45c64d1d69fe984542ec6803d05db012bee0c328d6d', 2, 1, 'nApp', '[]', 0, '2020-06-08 00:33:00', '2020-06-08 00:33:00', '2021-06-08 07:33:00'),
('4c629bd6d85d91f03dacfa427bd425fa45969bdf404071da885cd8ca0d857452993a354e31bd89c4', 2, 1, 'nApp', '[]', 0, '2020-06-08 03:06:04', '2020-06-08 03:06:04', '2021-06-08 10:06:04'),
('5574d60d3fc4f6b8f3f3d2bd3e00c6c678812b9818c69466b8dbe91bb3d12db833d441e4314cb5ca', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:45:50', '2020-06-08 02:45:50', '2021-06-08 09:45:50'),
('57a3a89bb03e9d6882ee12df93d29a4a2099083d9d1f2fea5fa0ced96b3b80260a0d2718dfdf8bcb', 5, 1, 'nApp', '[]', 0, '2020-06-09 02:36:03', '2020-06-09 02:36:03', '2021-06-09 09:36:03'),
('5d7cb0bb890b5fbba52c012a876ad114aafafb98e86d13145093d61277a5c3cf4f7bc04108e2a535', 4, 1, 'nApp', '[]', 0, '2020-06-09 00:40:07', '2020-06-09 00:40:07', '2021-06-09 07:40:07'),
('62f12b864d0cc6c4e4ff5962aa69427b87ad4134cc2ac5114da509af50bc64589fac24a30caa7c67', 4, 1, 'nApp', '[]', 0, '2020-06-08 14:12:59', '2020-06-08 14:12:59', '2021-06-08 21:12:59'),
('65524769501202f47593fc8c96ecb45b246b271f89e96fc1b9f09590e2884ec0942ab8a80ddd4fa8', 7, 1, 'nApp', '[]', 0, '2020-06-09 03:44:20', '2020-06-09 03:44:20', '2021-06-09 10:44:20'),
('6608f7ea980054d4317793aee0c918cf2cb7eda307db0f1edb1b7b39df6217138e911917aa2fe61f', 11, 1, 'nApp', '[]', 0, '2020-06-09 05:18:26', '2020-06-09 05:18:26', '2021-06-09 12:18:26'),
('6d792751cbcf38928e641db9f7ef3a3ce783336023eeddd36ea3c5e291271f783ebc5af242eca655', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:38:21', '2020-06-08 02:38:21', '2021-06-08 09:38:21'),
('76a204f7d873241b136787a6821f1c01ce8432f9f3f73dbc81c24e4dbbdf39b61eed29905c2183d9', 4, 1, 'nApp', '[]', 0, '2020-06-09 09:04:21', '2020-06-09 09:04:21', '2021-06-09 16:04:21'),
('790842fd15feb9ceee52a7dbe7fd4395de16df1b19bc02fc0d212b19eb7192a07f1ebcc841a14a03', 5, 1, 'nApp', '[]', 0, '2020-06-09 02:34:36', '2020-06-09 02:34:36', '2021-06-09 09:34:36'),
('7b6331e5eb65e7127bd117c04ded138ab86916f63be4ad6002c1c9f0078eb144453359c7aedab826', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:44:41', '2020-06-08 02:44:41', '2021-06-08 09:44:41'),
('7bbb39a472ddbd89f66864653e14bd3f94dd4c3c9a9856c6ca1ab7faacef6a9bebbc771cc0509c70', 4, 1, 'nApp', '[]', 0, '2020-06-08 03:06:22', '2020-06-08 03:06:22', '2021-06-08 10:06:22'),
('7dc81b45ac36ecff2f4799c1bb048239fce29a66dd0302519275f8cf3e8c29fbc2a808939aacf298', 4, 1, 'nApp', '[]', 0, '2020-06-08 09:49:25', '2020-06-08 09:49:25', '2021-06-08 16:49:25'),
('87517ae27cfa0ea03898d3bcb5e9d00cb97790674b44e69d3a26e0d7934d013e8301d040ced389af', 4, 1, 'nApp', '[]', 0, '2020-06-08 04:04:14', '2020-06-08 04:04:14', '2021-06-08 11:04:14'),
('8ae6260ae24c2f2778379744228399d5d8d18c3c227f95b75fa2ac9313a446e986db3a60708f5f48', 8, 1, 'nApp', '[]', 0, '2020-06-09 05:11:44', '2020-06-09 05:11:44', '2021-06-09 12:11:44'),
('8f60dc5077d9f40610f51b88e92c765179705bc09ff1991d42d3e1dad0d2ec906b1d23e1873a0ff4', 4, 1, 'nApp', '[]', 0, '2020-06-09 05:19:10', '2020-06-09 05:19:10', '2021-06-09 12:19:10'),
('935af824fb4d68745879e090c3477653de72c530f701eaf79799df55fa976c90129a55866d360ed4', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:36:18', '2020-06-08 02:36:18', '2021-06-08 09:36:18'),
('955d1c6f308289bf3a6151f4550a26c1143c6a39e96434cd72ba55492226438649a1dab8b4835f07', 12, 1, 'nApp', '[]', 0, '2020-06-09 09:09:52', '2020-06-09 09:09:52', '2021-06-09 16:09:52'),
('95f937838275d4964791fdde950a542d08e9955422663f9930a573ce3ee41208eee0ecd75375db30', 4, 1, 'nApp', '[]', 0, '2020-06-09 08:52:34', '2020-06-09 08:52:34', '2021-06-09 15:52:34'),
('9a99bf29a89bf258f149be1e30adfbc1f1b6388dd103d28d5fab90656e97f206432a8e7e4602a5a9', 4, 1, 'nApp', '[]', 0, '2020-06-09 09:02:45', '2020-06-09 09:02:45', '2021-06-09 16:02:45'),
('9e862e250208d4be7222a22d1ef4e73f36e4a79ee2c0f7b05bfe7e6ae346d3563f26a023a22db32c', 4, 1, 'nApp', '[]', 0, '2020-06-08 07:33:31', '2020-06-08 07:33:31', '2021-06-08 14:33:31'),
('a1d1d9796c1e140da5e7672455e5c8fa58260790573dfc9890aa695f8b0696cbbe6984fe7d6d9eeb', 3, 1, 'nApp', '[]', 0, '2020-06-08 03:06:46', '2020-06-08 03:06:46', '2021-06-08 10:06:46'),
('a8005137ee347d867778128a477c3ece1f93ffa1c1e0f276dc0049220b6ba14a1689437d01d36d86', 4, 1, 'nApp', '[]', 0, '2020-06-08 03:17:14', '2020-06-08 03:17:14', '2021-06-08 10:17:14'),
('aba5d6332d230201b8388e134a11b1676c9814989612d08d496587fad4edc4a829dac622402ae6e3', 2, 1, 'nApp', '[]', 0, '2020-06-08 00:35:44', '2020-06-08 00:35:44', '2021-06-08 07:35:44'),
('b09ceb3a35c63c6bc43204980cb4737db7db138b6e99e547e48e621fd334e54ca0dfd17a1e2fa764', 2, 1, 'nApp', '[]', 0, '2020-06-08 01:23:50', '2020-06-08 01:23:50', '2021-06-08 08:23:50'),
('b2612d9007ee3db2a4314cf0b5da582e9d2971cb3cea3a8440a44eef5f5eb39ae88a2e3ba3fda9b8', 4, 1, 'nApp', '[]', 0, '2020-06-09 07:28:30', '2020-06-09 07:28:30', '2021-06-09 14:28:30'),
('b64012a3bdacaf83529bd9e8911ed75c3fe961385ae23e56d4b843b7c918f84a0e0cd00fb1f0fe4e', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:37:36', '2020-06-08 02:37:36', '2021-06-08 09:37:36'),
('b766cb0b54e4a5ac950ea4b9a5407c38d6ef2bf5f7e120bf2b6f6aba830026bf83808393d5a4b990', 2, 1, 'nApp', '[]', 0, '2020-06-07 17:29:15', '2020-06-07 17:29:15', '2021-06-08 00:29:15'),
('bf6a422478eb02d12f8f3e0cf4b6da95fcc102ea943aec1fe6658164e5a4088641768600b5ed997f', 4, 1, 'nApp', '[]', 0, '2020-06-08 05:21:33', '2020-06-08 05:21:33', '2021-06-08 12:21:33'),
('c050aa0d8fe07a44c953844162b40578182c3c2234cd5be4f5e36dc099056f6498c97ab2bd1ae686', 4, 1, 'nApp', '[]', 0, '2020-06-08 07:32:28', '2020-06-08 07:32:28', '2021-06-08 14:32:28'),
('c12a507c4b283751b0773fed72afa138440488112874329b1ace2fe2e9116cd724ed4d0849d55680', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:41:37', '2020-06-08 02:41:37', '2021-06-08 09:41:37'),
('c4a1dc5141d1ad89b53500564b4df89baef03c2a934d5aaf44fa37ee396599ac7d08bd83b2b4f544', 2, 1, 'nApp', '[]', 0, '2020-06-08 01:24:19', '2020-06-08 01:24:19', '2021-06-08 08:24:19'),
('c6047997b7f3451efa36d3691d6a7861586e7456f99d295590564e23143812d22b5c19ddedff2f10', 4, 1, 'nApp', '[]', 0, '2020-06-08 12:09:37', '2020-06-08 12:09:37', '2021-06-08 19:09:37'),
('ccb6b89a8cc38eb90f93854805da8d48d68d77b7c8adbf6db74baedd6e92ba45fe53eee0aa970170', 2, 1, 'nApp', '[]', 0, '2020-06-08 03:07:00', '2020-06-08 03:07:00', '2021-06-08 10:07:00'),
('d0101c2dd79f8dcdfb9443193c2c421f18147659e5e8c05b49c36365b654c2703c279d5503407d18', 4, 1, 'nApp', '[]', 0, '2020-06-09 06:53:37', '2020-06-09 06:53:37', '2021-06-09 13:53:37'),
('d9dc35f81ab37b92a63c3338d88e0d33227cd8a2d824b10a4eb4e1f0263822706679703dc3bdf942', 9, 1, 'nApp', '[]', 0, '2020-06-09 05:14:26', '2020-06-09 05:14:26', '2021-06-09 12:14:26'),
('de71ba7bf38a8013b91b0197bc42f747854bb6663f4f7206651ab8ed8dbe4808f6354ee2a0781aa9', 4, 1, 'nApp', '[]', 0, '2020-06-08 03:18:06', '2020-06-08 03:18:06', '2021-06-08 10:18:06'),
('df7dd176525d19efe131cffd897f6f8e08b0d698b1053a380008fb351f563446651d495dd0a9ba4a', 4, 1, 'nApp', '[]', 0, '2020-06-08 07:50:57', '2020-06-08 07:50:57', '2021-06-08 14:50:57'),
('e01777f1cf5c00a313788f3dad96527e6d84ccdfaeb78c5b2d597139e58b2f57625cd7217e600f0c', 2, 1, 'nApp', '[]', 0, '2020-06-07 16:55:56', '2020-06-07 16:55:56', '2021-06-07 23:55:56'),
('e1b7a818b31ad727cf132345dcd124086196d5e6600da9e200a787715002c2545b39227a02248aaf', 1, 1, 'nApp', '[]', 0, '2020-06-08 01:28:55', '2020-06-08 01:28:55', '2021-06-08 08:28:55'),
('e4ca5252164295478d457d1c725bad0eca732d99b3660a8c155fee1939cf7b936b9a1643fde896c2', 4, 1, 'nApp', '[]', 0, '2020-06-09 07:21:16', '2020-06-09 07:21:16', '2021-06-09 14:21:16'),
('e60ef971d5f3ae8e375675794d557f09a963327ab3d3b41731625968eba958a280a0b712eb11d9b7', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:43:19', '2020-06-08 02:43:19', '2021-06-08 09:43:19'),
('e6e18cf6a71e80f562c510e8dc9d2b33e89f14509259ea70c13da99b7c5c23b196526390cb652284', 12, 1, 'nApp', '[]', 0, '2020-06-09 09:09:04', '2020-06-09 09:09:04', '2021-06-09 16:09:04'),
('eb20bf619a8eede83eead03dd750aaa9da9e9d829827049536bc5fc4dac03d259b80772377cb6b17', 2, 1, 'nApp', '[]', 0, '2020-06-08 01:30:56', '2020-06-08 01:30:56', '2021-06-08 08:30:56'),
('ec1575ee37bb553157c6028cebad345457be519335cd30206b3dd4d30dd440604701101f6e61de89', 4, 1, 'nApp', '[]', 0, '2020-06-09 07:21:55', '2020-06-09 07:21:55', '2021-06-09 14:21:55'),
('ede49c0717678bbee8736ca8c1be5d9bb930a08f32ebaa463900677682c1822acf90f0080b8276d5', 4, 1, 'nApp', '[]', 0, '2020-06-08 10:24:07', '2020-06-08 10:24:07', '2021-06-08 17:24:07'),
('ef0a6d6257f6131d383e5bdbf070caa650c00d6e493b92f87fb4be0bf78d0865218bd2387064449c', 2, 1, 'nApp', '[]', 0, '2020-06-08 03:00:26', '2020-06-08 03:00:26', '2021-06-08 10:00:26'),
('f069c8da4fc64e8d4c26ed69508db55feb10d611c79d024969b4048a37f4d3f5ace70d38a8b19a68', 6, 1, 'nApp', '[]', 0, '2020-06-09 03:42:38', '2020-06-09 03:42:38', '2021-06-09 10:42:38'),
('f1456ceeb124d4bcad789b0a510f20d901fada5ad36de51e29d90586ceeebe200893fcc687b34603', 2, 1, 'nApp', '[]', 0, '2020-06-07 16:55:41', '2020-06-07 16:55:41', '2021-06-07 23:55:41');

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
(1, NULL, 'Cimory Personal Access Client', '4IWpjx5eVCDaOy1ZLQJIgtoH69SNfQz4zHV42D54', NULL, 'http://localhost', 1, 0, 0, '2020-06-07 16:55:25', '2020-06-07 16:55:25'),
(2, NULL, 'Cimory Password Grant Client', 'bUVb9eA79uMlfrbIyTp56zEjWkZ7bRwFPRjaCB0V', 'users', 'http://localhost', 0, 1, 0, '2020-06-07 16:55:25', '2020-06-07 16:55:25');

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
(1, 1, '2020-06-07 16:55:25', '2020-06-07 16:55:25');

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
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_produk` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama_produk`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'CYD 250ML', 'produk', '2020-06-07 17:00:00', NULL, NULL),
(2, 'CYD 70 ML Banded 5', 'produk baru', '2020-06-07 17:00:00', NULL, NULL),
(3, 'CYD 70 ML banded 4', 'kemasan baru', '2020-06-07 17:00:00', NULL, NULL),
(4, 'ESL Coklat dll', 'produk baru', '2020-06-07 17:00:00', NULL, NULL),
(5, 'ESL Plain', 'produk baru', '2020-06-07 17:00:00', NULL, NULL),
(6, 'UHT Comry Milk 250 ML', 'susu', '2020-06-07 17:00:00', NULL, NULL),
(7, 'UHT Cimory milk 125 ML', 'susu kemasan kecil', '2020-06-07 17:00:00', NULL, NULL),
(8, 'YOLITE C+ 100', 'produk baru', NULL, NULL, NULL),
(9, 'Kanzler Singles', 'kemasan baru', NULL, NULL, NULL),
(10, 'Cimory Squeeze', 'keterangan produk', NULL, NULL, NULL),
(11, 'CYD 250 ML Low fat', 'produk untuk diet sehat', NULL, '2020-06-08 12:11:59', NULL),
(12, 'Susu Kurma', 'produk lokal bogor', '2020-06-08 04:28:11', '2020-06-08 05:04:08', '2020-06-08 05:04:08'),
(13, 'Kue Bolu', 'Buatan Ibu', '2020-06-08 04:32:44', '2020-06-08 04:54:04', '2020-06-08 04:54:04'),
(14, 'Donat', 'Dengan gula putih', '2020-06-08 04:34:31', '2020-06-08 04:53:39', '2020-06-08 04:53:39'),
(15, 'Susu Madu', 'susu campur madu dan bahan alami lainnya', '2020-06-08 05:16:56', '2020-06-08 05:17:21', '2020-06-08 05:17:21'),
(16, 'Syla', 'S-01', '2020-06-08 05:44:09', '2020-06-09 05:19:24', '2020-06-09 05:19:24'),
(17, 'Kopi Luwak', 'kopi lampung asli luwak', '2020-06-08 14:13:39', '2020-06-09 09:06:19', NULL),
(18, 'Susu coklat', 'susu coklat baru', '2020-06-09 07:31:41', '2020-06-09 07:31:43', '2020-06-09 07:31:43');

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
(1, 'S-01', 'Ike Fiernanti', '2020-06-08 05:48:06', '2020-06-09 09:04:44', NULL),
(2, 'S-02', 'Syla', '2020-06-08 05:48:17', '2020-06-08 05:48:17', NULL),
(3, 'S-045', 'Agi Ahmad', '2020-06-08 05:48:49', '2020-06-08 05:49:01', '2020-06-08 05:49:01'),
(4, 'S-03', 'Zulfikar', '2020-06-09 07:32:08', '2020-06-09 09:05:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_dc`
--

CREATE TABLE `transaksi_dc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_produk` bigint(20) UNSIGNED NOT NULL,
  `id_sales` bigint(20) UNSIGNED NOT NULL,
  `id_dc` bigint(20) UNSIGNED NOT NULL,
  `qty_pembelian` bigint(20) NOT NULL,
  `qty_penjualan` bigint(20) NOT NULL,
  `qty_retur` bigint(20) NOT NULL,
  `qty_stock` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 1, NULL, 'Ahmad Bagwi Rifai', 'ahmadbagwi', 'ahmadbagwi.id@gmail.com', NULL, '$2y$10$1pJq.3hyoZpUMrwTG5tJ4us.whAC1bd8KeciE0y2hfbnz6h8lQP9m', 'Cibanteng', '085719191812', NULL, NULL, NULL, NULL),
(2, 2, NULL, 'Dinda Yourista', 'dinda', 'dinda.ipb42@gmail.com', NULL, '$2y$10$54TDIESY0TJk3XAZMTpnIe1vMRgrXCJv8Vl75zihxiM8QPQdv7mFW', 'Tuban, Jawa Timur', '085719191812', NULL, NULL, NULL, NULL),
(3, 3, NULL, 'Arumi Nismara', 'nismara', 'nismara.id@gmail.com', NULL, '$2y$10$UwyNA5DWIJTWncscdvSL0uXiYqcaMQkf3hBCNPH/ueTR.Bm7mnSfm', 'TDP', '085719191852', NULL, NULL, NULL, NULL),
(4, 4, NULL, 'Rifanti', 'rifanti', 'rifanti.id@gmail.com', NULL, '$2y$10$1lUON9dHc8H3dX3VqNICbuMcwCcN7OuXqSj4gcylO7eZobGlhLS4C', 'Cibanteng', '085719191812', NULL, NULL, NULL, NULL),
(6, 3, 2, 'Ahmad Kdesain 22', 'ahmadkdesain22', 'ahmadkdesain22@gmail.com', NULL, '$2y$10$uZ/OSMIdYJebWiGIY9HEKOd/mt0uqMswvVchNqk/039c56qPEsIbi', NULL, NULL, NULL, '2020-06-09 03:42:38', '2020-06-09 07:29:11', NULL),
(7, 3, NULL, 'Ahmad Koding', 'ahmadkoding', 'ahmadkoding@gmail.com', NULL, '$2y$10$5ZhsAF0QWYHxaVt.iE4K/ehF2TaT0hoGMJOCEkZy.EpsIcEb6d4Lu', NULL, NULL, NULL, '2020-06-09 03:44:20', '2020-06-09 03:44:20', NULL),
(8, 3, NULL, 'Ahmad Rumah Koding', 'ahmadrumahkoding', 'ahmad@rumahkoding.com', NULL, '$2y$10$0wTCqabA6CKzMHH8dxzGrezI1iEtvBVl68QTMOT79Sp2XhdG9J282', NULL, NULL, NULL, '2020-06-09 05:11:44', '2020-06-09 05:11:44', NULL),
(9, 3, NULL, 'Nismara Rifanti', 'nismararifanti', 'nismara@gmail.com', NULL, '$2y$10$KinHnimxSdMZM6xFQEGGwekjjI6c6WhbHLMHK2IAV3sThc0Wvj2P6', NULL, NULL, NULL, '2020-06-09 05:14:26', '2020-06-09 05:14:26', NULL),
(10, 3, NULL, 'nismara2', 'nismara2', 'nismara2@gmail.com', NULL, '$2y$10$00/O5.Y0adNQjqtlEbro4ebtRsn2rPrHhY70LvYE7GH1dZkk9yaKi', NULL, NULL, NULL, '2020-06-09 05:16:13', '2020-06-09 05:16:13', NULL),
(11, 3, 6, 'nismara35', 'nismara35', 'nismara35@gmail.com', NULL, '$2y$10$5MP3dfissjbp0coPCEt9IOdmVIB6kIT8yT7dKUP4aIcmKD.R686xa', NULL, NULL, NULL, '2020-06-09 05:18:26', '2020-06-09 09:07:53', NULL),
(12, 4, NULL, 'Admin Cimory', 'admin01', 'admin01@cimory.local', NULL, '$2y$10$n45.UE4aPL5zaDVufIGFguF7hdi2sc5DNJNYmXDrVFbltJalC4cDi', NULL, NULL, NULL, '2020-06-09 09:09:04', '2020-06-09 09:09:04', NULL);

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
  ADD KEY `harga_id_sales_index` (`id_sales`),
  ADD KEY `harga_id_produk_index` (`id_produk`);

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
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `transaksi_dc`
--
ALTER TABLE `transaksi_dc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_dc_id_produk_index` (`id_produk`),
  ADD KEY `transaksi_dc_id_sales_index` (`id_sales`),
  ADD KEY `transaksi_dc_id_dc_index` (`id_dc`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_index` (`role_id`),
  ADD KEY `dc_id` (`dc_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `harga`
--
ALTER TABLE `harga`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
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
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `transaksi_dc`
--
ALTER TABLE `transaksi_dc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
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
  ADD CONSTRAINT `harga_id_produk_foreign` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `harga_id_sales_foreign` FOREIGN KEY (`id_sales`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_dc`
--
ALTER TABLE `transaksi_dc`
  ADD CONSTRAINT `transaksi_dc_id_dc_foreign` FOREIGN KEY (`id_dc`) REFERENCES `dc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_dc_id_produk_foreign` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_dc_id_sales_foreign` FOREIGN KEY (`id_sales`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`dc_id`) REFERENCES `dc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
