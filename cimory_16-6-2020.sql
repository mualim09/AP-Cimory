-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 16, 2020 at 12:24 AM
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
(1, 'DC10', 'Kediri', '2020-06-09 00:49:31', '2020-06-15 16:57:54', '2020-06-15 16:57:54'),
(2, 'DC11', 'Surabaya', '2020-06-09 01:04:11', '2020-06-15 16:57:55', '2020-06-15 16:57:55'),
(3, 'DC12', 'Bogor', '2020-06-09 01:04:21', '2020-06-09 01:04:24', '2020-06-09 01:04:24'),
(5, 'DC13', 'Semarang', '2020-06-09 07:31:01', '2020-06-15 16:57:55', '2020-06-15 16:57:55'),
(6, 'DC14', 'Tuban', '2020-06-09 09:07:05', '2020-06-15 16:57:56', '2020-06-15 16:57:56'),
(7, 'DC15', 'Jakarta', '2020-06-11 01:45:20', '2020-06-15 16:57:57', '2020-06-15 16:57:57'),
(8, 'DC1', 'PESANGGRAHAN', '2020-06-15 17:09:51', '2020-06-15 17:09:51', NULL),
(9, 'DC2', 'TANAH ABANG', '2020-06-15 17:10:06', '2020-06-15 17:10:06', NULL),
(10, 'DC3', 'CILEDUG', '2020-06-15 17:10:21', '2020-06-15 17:10:21', NULL);

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
  `id_produk` bigint(20) UNSIGNED NOT NULL,
  `harga_dasar` bigint(20) NOT NULL,
  `harga_jual` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('05ec1eb5d140ec73ac8355b14308f9730afa9db6086f684141093651d80ccb44b74b0be009f47cdd', 11, 1, 'nApp', '[]', 0, '2020-06-11 01:39:18', '2020-06-11 01:39:18', '2021-06-11 08:39:18'),
('07e1dba752aa9489fe4fa33fdc63c7a1c76189d5ebf85692ae70579570fd2495ea218c6932f91b36', 3, 1, 'nApp', '[]', 0, '2020-06-07 16:55:47', '2020-06-07 16:55:47', '2021-06-07 23:55:47'),
('0ba9136d09172c899b97a5be8a081d57e4bd5acbd81fa452d6c744c8a38ab47e1096d2ac6c903ce3', 13, 1, 'nApp', '[]', 0, '2020-06-10 23:10:43', '2020-06-10 23:10:43', '2021-06-11 06:10:43'),
('0d4c20c3a64e493f6466f276c1363cd09937ca908982f540b480e594c9c0f7c34ee7e078e3c0a6bd', 4, 1, 'nApp', '[]', 0, '2020-06-08 05:50:13', '2020-06-08 05:50:13', '2021-06-08 12:50:13'),
('158b5a7f18e4e1b12a757df23fba2b5a3cb3053cb8868937b6a497aadda40a7faa031c647861a14d', 11, 1, 'nApp', '[]', 0, '2020-06-11 01:43:45', '2020-06-11 01:43:45', '2021-06-11 08:43:45'),
('16c3679d0a7ec6de417d3719f7b782b5d98b71c34fc544ab4e2697b32dd8d82cc4175d1d3128e9b6', 1, 1, 'nApp', '[]', 0, '2020-06-07 16:55:32', '2020-06-07 16:55:32', '2021-06-07 23:55:32'),
('176ba2fb058a51562c06334276d131c0999593d488487a4a32786423fcfc1dc62f762943842bb9ce', 12, 1, 'nApp', '[]', 0, '2020-06-11 01:43:25', '2020-06-11 01:43:25', '2021-06-11 08:43:25'),
('1f00366d68a8cad3359049892d273dddd2777cab25f205280c7f5a7117068e95a267e481a5be3b4f', 11, 1, 'nApp', '[]', 0, '2020-06-15 10:45:55', '2020-06-15 10:45:55', '2021-06-15 17:45:55'),
('2067faae60269a034dbb46009efd1c58b962d48948ef1992632ad145669c405e294270a222787411', 10, 1, 'nApp', '[]', 0, '2020-06-09 05:16:13', '2020-06-09 05:16:13', '2021-06-09 12:16:13'),
('21e7d86a024d034de2118c2c7c79e7efb1c6e91555a648b471f493f8886c1be58ae4f462ea0215f7', 4, 1, 'nApp', '[]', 0, '2020-06-09 07:38:03', '2020-06-09 07:38:03', '2021-06-09 14:38:03'),
('23692aa000632f3441d681d15ff39c8e660efa662db41f71157b3b1c4fc6811d92ad80a1e0ab6f9d', 16, 1, 'nApp', '[]', 0, '2020-06-15 17:13:48', '2020-06-15 17:13:48', '2021-06-16 00:13:48'),
('23771360a2729f8035c66d43802823fc3ef59a3a1144193e0a1fde6ebab53b757db04eef3002f05f', 12, 1, 'nApp', '[]', 0, '2020-06-10 18:14:14', '2020-06-10 18:14:14', '2021-06-11 01:14:14'),
('2426bd41257bf4a8c96993723a5e33575fccdd577f77911bc0623f3959509ae31f94aee947fc2b55', 12, 1, 'nApp', '[]', 0, '2020-06-11 01:38:56', '2020-06-11 01:38:56', '2021-06-11 08:38:56'),
('262092967b9a78f4466426323c4a56675af0b81f5d2b460c93c3376228fa26d43d94c313ce28ed86', 12, 1, 'nApp', '[]', 0, '2020-06-10 15:18:29', '2020-06-10 15:18:29', '2021-06-10 22:18:29'),
('28f6eb626eb9afa8653df3ecdfeaa56818539ab3da68877ad3e96aec48c588bbeae84691abf2d33b', 12, 1, 'nApp', '[]', 0, '2020-06-12 07:50:35', '2020-06-12 07:50:35', '2021-06-12 14:50:35'),
('2f44ec35209523e5936e64de683bdf59454ca33ae355bc606c2924945fb57ad4a70b889386619fde', 12, 1, 'nApp', '[]', 0, '2020-06-10 23:09:59', '2020-06-10 23:09:59', '2021-06-11 06:09:59'),
('30d0046ad52016a57ce522d1a729f1520c0c8ccea43b846be7a7d1e0d4329d5ab5d76faab48241aa', 12, 1, 'nApp', '[]', 0, '2020-06-15 09:17:46', '2020-06-15 09:17:46', '2021-06-15 16:17:46'),
('3161034384ec510ce62313c1a0c19cf5c5d5061e1586baba3a062e076d12373576c9d759e7585df1', 4, 1, 'nApp', '[]', 0, '2020-06-09 00:26:57', '2020-06-09 00:26:57', '2021-06-09 07:26:57'),
('32bf6c02b903da28033c582b1ad24a8d8bf85ae6a592720af9c849132d63b61f67b238bd12946e25', 3, 1, 'nApp', '[]', 0, '2020-06-08 01:27:48', '2020-06-08 01:27:48', '2021-06-08 08:27:48'),
('33a0112d7e521081887951ff7590df39c5237e9730945d5cf77f0ecd72561c499670d3463463b7d6', 13, 1, 'nApp', '[]', 0, '2020-06-10 23:33:15', '2020-06-10 23:33:15', '2021-06-11 06:33:15'),
('360464a56e73bb05a9e1a4bc17a3088fcdfe3bc76088ed552ab7431d97fd9c68accc53803d752242', 12, 1, 'nApp', '[]', 0, '2020-06-12 15:27:00', '2020-06-12 15:27:00', '2021-06-12 22:27:00'),
('36385290d573bada37503a809ef4d53aefaae07bde5252b3ecce3051e0b57c54220b917570a5b750', 3, 1, 'nApp', '[]', 0, '2020-06-08 03:06:12', '2020-06-08 03:06:12', '2021-06-08 10:06:12'),
('3705ec25f591f0fb98eda1b443db532ec31643a08bade90f20c60594caf5f107813b4c954620228a', 2, 1, 'nApp', '[]', 0, '2020-06-08 01:17:29', '2020-06-08 01:17:29', '2021-06-08 08:17:29'),
('3927446093a5c2828a2f8456028cd04eb28df31e188716bd66b4a84899a5d565736711952a93428f', 11, 1, 'nApp', '[]', 0, '2020-06-15 04:13:20', '2020-06-15 04:13:20', '2021-06-15 11:13:20'),
('3b939df26370152a8b560374329d68c0db1230f10b0799c95387c167edc0ecab071db2ba695591a0', 4, 1, 'nApp', '[]', 0, '2020-06-08 10:21:19', '2020-06-08 10:21:19', '2021-06-08 17:21:19'),
('3dd0fa941c9ed7b50e1f43e9ee9037e08292b73152fe943786af534ca6e985128e05ee8346b5c0e0', 2, 1, 'nApp', '[]', 0, '2020-06-08 03:06:40', '2020-06-08 03:06:40', '2021-06-08 10:06:40'),
('41e1597848edd610105abfd13a53c85863b4efc47c7c0a3a02066f6caf73a820f6f6d09df523e03b', 2, 1, 'nApp', '[]', 0, '2020-06-07 17:07:12', '2020-06-07 17:07:12', '2021-06-08 00:07:12'),
('41f7f128ba7d9cea9a21a0010e442100c1dba5ac68a82a06ce861363ca24fc07ff18c229a380055c', 12, 1, 'nApp', '[]', 0, '2020-06-12 15:31:11', '2020-06-12 15:31:11', '2021-06-12 22:31:11'),
('43d183b87c060bd5f15b35670320f9c37e4fb45c64d1d69fe984542ec6803d05db012bee0c328d6d', 2, 1, 'nApp', '[]', 0, '2020-06-08 00:33:00', '2020-06-08 00:33:00', '2021-06-08 07:33:00'),
('4605fa683667c0fa2d4c8561dc8eaf279549d382c89b6b984acd8d5f6aadc8fa599e9cfd4efb4f21', 13, 1, 'nApp', '[]', 0, '2020-06-10 23:29:37', '2020-06-10 23:29:37', '2021-06-11 06:29:37'),
('464ddb293592bf862d6eb0cdaf2dc2cd54686af154d0e035be6cc23ce6fca46979b6dfc355e53d0f', 11, 1, 'nApp', '[]', 0, '2020-06-15 10:51:40', '2020-06-15 10:51:40', '2021-06-15 17:51:40'),
('4b27de810856b451f78b43e8f66419654156dcff9851d9d2ab6158e895f29a313cf2c958a64ac8de', 12, 1, 'nApp', '[]', 0, '2020-06-10 10:23:35', '2020-06-10 10:23:35', '2021-06-10 17:23:35'),
('4c629bd6d85d91f03dacfa427bd425fa45969bdf404071da885cd8ca0d857452993a354e31bd89c4', 2, 1, 'nApp', '[]', 0, '2020-06-08 03:06:04', '2020-06-08 03:06:04', '2021-06-08 10:06:04'),
('5574d60d3fc4f6b8f3f3d2bd3e00c6c678812b9818c69466b8dbe91bb3d12db833d441e4314cb5ca', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:45:50', '2020-06-08 02:45:50', '2021-06-08 09:45:50'),
('55e30ee58f6c4c71feb172dcc066507285bed96cab2b331b5e76bde5859031edd210c0fd50b0bccb', 12, 1, 'nApp', '[]', 0, '2020-06-10 10:47:55', '2020-06-10 10:47:55', '2021-06-10 17:47:55'),
('57a3a89bb03e9d6882ee12df93d29a4a2099083d9d1f2fea5fa0ced96b3b80260a0d2718dfdf8bcb', 5, 1, 'nApp', '[]', 0, '2020-06-09 02:36:03', '2020-06-09 02:36:03', '2021-06-09 09:36:03'),
('5d7cb0bb890b5fbba52c012a876ad114aafafb98e86d13145093d61277a5c3cf4f7bc04108e2a535', 4, 1, 'nApp', '[]', 0, '2020-06-09 00:40:07', '2020-06-09 00:40:07', '2021-06-09 07:40:07'),
('6237bd9df82819f04632e28ca2769d4008e61cb560fdd4d30dd4a92a6da49dca97e65648af0c8e7e', 13, 1, 'nApp', '[]', 0, '2020-06-15 10:46:14', '2020-06-15 10:46:14', '2021-06-15 17:46:14'),
('62f12b864d0cc6c4e4ff5962aa69427b87ad4134cc2ac5114da509af50bc64589fac24a30caa7c67', 4, 1, 'nApp', '[]', 0, '2020-06-08 14:12:59', '2020-06-08 14:12:59', '2021-06-08 21:12:59'),
('65524769501202f47593fc8c96ecb45b246b271f89e96fc1b9f09590e2884ec0942ab8a80ddd4fa8', 7, 1, 'nApp', '[]', 0, '2020-06-09 03:44:20', '2020-06-09 03:44:20', '2021-06-09 10:44:20'),
('6608f7ea980054d4317793aee0c918cf2cb7eda307db0f1edb1b7b39df6217138e911917aa2fe61f', 11, 1, 'nApp', '[]', 0, '2020-06-09 05:18:26', '2020-06-09 05:18:26', '2021-06-09 12:18:26'),
('68d14c78bfe7d65c4191a55c273a3358dd168279ff9ce677d885f715cf957993b2e17bb855b6bd71', 15, 1, 'nApp', '[]', 0, '2020-06-15 17:17:17', '2020-06-15 17:17:17', '2021-06-16 00:17:17'),
('6d792751cbcf38928e641db9f7ef3a3ce783336023eeddd36ea3c5e291271f783ebc5af242eca655', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:38:21', '2020-06-08 02:38:21', '2021-06-08 09:38:21'),
('70d0a3ded296683be191eb9dde261fe9bda1744c0416a6898858a1a18d3c4efa0a08c4678a8e9d49', 14, 1, 'nApp', '[]', 0, '2020-06-15 17:12:27', '2020-06-15 17:12:27', '2021-06-16 00:12:27'),
('7462a1fdeff7c9076f0165bb7dfafd8a4286da5846430bb6c897049cee185eefc3d731ef6c807e4a', 13, 1, 'nApp', '[]', 0, '2020-06-11 01:43:35', '2020-06-11 01:43:35', '2021-06-11 08:43:35'),
('756fb463813892f31786da8703a62fd3028efe2f9aa6d7c54b98cd291df598b33dc38fb439957013', 11, 1, 'nApp', '[]', 0, '2020-06-11 00:32:45', '2020-06-11 00:32:45', '2021-06-11 07:32:45'),
('75a5d16197d1e53701455e2fe7af1bfd64a49d567c2e9576858d9700be7a475cfaccde6156f93999', 13, 1, 'nApp', '[]', 0, '2020-06-12 07:38:23', '2020-06-12 07:38:23', '2021-06-12 14:38:23'),
('76a204f7d873241b136787a6821f1c01ce8432f9f3f73dbc81c24e4dbbdf39b61eed29905c2183d9', 4, 1, 'nApp', '[]', 0, '2020-06-09 09:04:21', '2020-06-09 09:04:21', '2021-06-09 16:04:21'),
('77dd6b2e6f0eed5b585805f1f28897d6f43096b3c0e118a775c6319945730c91ff71cb21127d80c6', 12, 1, 'nApp', '[]', 0, '2020-06-15 09:13:02', '2020-06-15 09:13:02', '2021-06-15 16:13:02'),
('790842fd15feb9ceee52a7dbe7fd4395de16df1b19bc02fc0d212b19eb7192a07f1ebcc841a14a03', 5, 1, 'nApp', '[]', 0, '2020-06-09 02:34:36', '2020-06-09 02:34:36', '2021-06-09 09:34:36'),
('79099d3f738bdfe1b2a5c614ceedbb45c8a1b69221a9c557dcc011f03d250b67427325a90fc1ef83', 13, 1, 'nApp', '[]', 0, '2020-06-10 17:06:52', '2020-06-10 17:06:52', '2021-06-11 00:06:52'),
('7af59ba102737f79a166ce0b01c78e58c9cf22f88afee11f2188fe191908f4234f28e4d49d43907a', 11, 1, 'nApp', '[]', 0, '2020-06-12 07:08:23', '2020-06-12 07:08:23', '2021-06-12 14:08:23'),
('7b6331e5eb65e7127bd117c04ded138ab86916f63be4ad6002c1c9f0078eb144453359c7aedab826', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:44:41', '2020-06-08 02:44:41', '2021-06-08 09:44:41'),
('7bbb39a472ddbd89f66864653e14bd3f94dd4c3c9a9856c6ca1ab7faacef6a9bebbc771cc0509c70', 4, 1, 'nApp', '[]', 0, '2020-06-08 03:06:22', '2020-06-08 03:06:22', '2021-06-08 10:06:22'),
('7c4857589d603ee35f7541b96fda838418b6c01e7b59598b774b8865220b39a48139ec7a41544840', 11, 1, 'nApp', '[]', 0, '2020-06-12 07:48:21', '2020-06-12 07:48:21', '2021-06-12 14:48:21'),
('7dc81b45ac36ecff2f4799c1bb048239fce29a66dd0302519275f8cf3e8c29fbc2a808939aacf298', 4, 1, 'nApp', '[]', 0, '2020-06-08 09:49:25', '2020-06-08 09:49:25', '2021-06-08 16:49:25'),
('7e706ef48a565ca7df76844fad54486051240598c938d3da5f54349addd596cef35089387332420a', 12, 1, 'nApp', '[]', 0, '2020-06-11 00:22:27', '2020-06-11 00:22:27', '2021-06-11 07:22:27'),
('80b756ad13523137a1cfe38bee4b737474d7865e5ac5159900ae4e56a5adaf10609a062e4fdfb628', 13, 1, 'nApp', '[]', 0, '2020-06-15 03:18:38', '2020-06-15 03:18:38', '2021-06-15 10:18:38'),
('85da4372ecd7ea14b2a55f4c5e9dfc382cd2030379f0b27dbcf1d8ff19ad19e127a5562b8e50b37d', 12, 1, 'nApp', '[]', 0, '2020-06-15 16:55:07', '2020-06-15 16:55:07', '2021-06-15 23:55:07'),
('87517ae27cfa0ea03898d3bcb5e9d00cb97790674b44e69d3a26e0d7934d013e8301d040ced389af', 4, 1, 'nApp', '[]', 0, '2020-06-08 04:04:14', '2020-06-08 04:04:14', '2021-06-08 11:04:14'),
('8ae6260ae24c2f2778379744228399d5d8d18c3c227f95b75fa2ac9313a446e986db3a60708f5f48', 8, 1, 'nApp', '[]', 0, '2020-06-09 05:11:44', '2020-06-09 05:11:44', '2021-06-09 12:11:44'),
('8f60dc5077d9f40610f51b88e92c765179705bc09ff1991d42d3e1dad0d2ec906b1d23e1873a0ff4', 4, 1, 'nApp', '[]', 0, '2020-06-09 05:19:10', '2020-06-09 05:19:10', '2021-06-09 12:19:10'),
('8fab7f3f6b98300758020c8e9df4b4b5b500739e1ebd989296b80cd7e90bb49049cd7cbeb7452a56', 12, 1, 'nApp', '[]', 0, '2020-06-09 23:26:56', '2020-06-09 23:26:56', '2021-06-10 06:26:56'),
('935af824fb4d68745879e090c3477653de72c530f701eaf79799df55fa976c90129a55866d360ed4', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:36:18', '2020-06-08 02:36:18', '2021-06-08 09:36:18'),
('955d1c6f308289bf3a6151f4550a26c1143c6a39e96434cd72ba55492226438649a1dab8b4835f07', 12, 1, 'nApp', '[]', 0, '2020-06-09 09:09:52', '2020-06-09 09:09:52', '2021-06-09 16:09:52'),
('95f937838275d4964791fdde950a542d08e9955422663f9930a573ce3ee41208eee0ecd75375db30', 4, 1, 'nApp', '[]', 0, '2020-06-09 08:52:34', '2020-06-09 08:52:34', '2021-06-09 15:52:34'),
('999f0389b931648a11896eeccc2faaccb4467d820cc78db6a75fd1e3e50007be1266ae22fd3726fa', 12, 1, 'nApp', '[]', 0, '2020-06-10 23:09:23', '2020-06-10 23:09:23', '2021-06-11 06:09:23'),
('9a99bf29a89bf258f149be1e30adfbc1f1b6388dd103d28d5fab90656e97f206432a8e7e4602a5a9', 4, 1, 'nApp', '[]', 0, '2020-06-09 09:02:45', '2020-06-09 09:02:45', '2021-06-09 16:02:45'),
('9c00865dc4775cdd7291508cdd3c431a05986d8d26933bb39776e56711883f04173dc9f76299c545', 11, 1, 'nApp', '[]', 0, '2020-06-15 09:11:33', '2020-06-15 09:11:33', '2021-06-15 16:11:33'),
('9c028e31ec572583ef4dbd502d7e5625b531a2659de4e0844255158a5e2e2684a5f31ca0a705ff1c', 12, 1, 'nApp', '[]', 0, '2020-06-10 17:06:12', '2020-06-10 17:06:12', '2021-06-11 00:06:12'),
('9d6a2450380fa93190413f5b8e522cd37418c8bb2c02b4736f48c59f29701dadeaff79d4e8f9711f', 11, 1, 'nApp', '[]', 0, '2020-06-15 10:48:54', '2020-06-15 10:48:54', '2021-06-15 17:48:54'),
('9e862e250208d4be7222a22d1ef4e73f36e4a79ee2c0f7b05bfe7e6ae346d3563f26a023a22db32c', 4, 1, 'nApp', '[]', 0, '2020-06-08 07:33:31', '2020-06-08 07:33:31', '2021-06-08 14:33:31'),
('a0bb35b586910fe45c5b11c8c860edcf9d369798fd3017fec072089751eab8a303bcad6d3c8d33bc', 12, 1, 'nApp', '[]', 0, '2020-06-15 17:21:05', '2020-06-15 17:21:05', '2021-06-16 00:21:05'),
('a104c7d61bd8693e26df4d1024ffaac530d07b86634d0262801087c8fd5dc48d68eff437c3dfe4c4', 12, 1, 'nApp', '[]', 0, '2020-06-11 01:45:04', '2020-06-11 01:45:04', '2021-06-11 08:45:04'),
('a1d1d9796c1e140da5e7672455e5c8fa58260790573dfc9890aa695f8b0696cbbe6984fe7d6d9eeb', 3, 1, 'nApp', '[]', 0, '2020-06-08 03:06:46', '2020-06-08 03:06:46', '2021-06-08 10:06:46'),
('a4f39f71cce05ed9c7e48da3aa7f4f701227dafcfcb5ca016369fcd14d4a1428f563ee9f83b0d40d', 13, 1, 'nApp', '[]', 0, '2020-06-12 07:51:16', '2020-06-12 07:51:16', '2021-06-12 14:51:16'),
('a5695df56b495e2fdcf30fd934d9adf17013e6bd339b054686329f437f332134ef25bb2773d637c5', 13, 1, 'nApp', '[]', 0, '2020-06-11 01:39:27', '2020-06-11 01:39:27', '2021-06-11 08:39:27'),
('a8005137ee347d867778128a477c3ece1f93ffa1c1e0f276dc0049220b6ba14a1689437d01d36d86', 4, 1, 'nApp', '[]', 0, '2020-06-08 03:17:14', '2020-06-08 03:17:14', '2021-06-08 10:17:14'),
('a8be1b06e9b0e740a2cc22fcc5fe72c0eeb6f9dd1aff873bfc83edacf222b4d7459b228b77375d32', 13, 1, 'nApp', '[]', 0, '2020-06-11 01:54:16', '2020-06-11 01:54:16', '2021-06-11 08:54:16'),
('a90f8c22c4af27225954e9cd4d6577ca3b0b52554751463a95ef79b6b392a81ab6b2035d687a09ea', 12, 1, 'nApp', '[]', 0, '2020-06-10 10:31:02', '2020-06-10 10:31:02', '2021-06-10 17:31:02'),
('aba5d6332d230201b8388e134a11b1676c9814989612d08d496587fad4edc4a829dac622402ae6e3', 2, 1, 'nApp', '[]', 0, '2020-06-08 00:35:44', '2020-06-08 00:35:44', '2021-06-08 07:35:44'),
('adcc14f06c59f131e58ed9c9bddabf98f167913addff611eec5237fa731819c939e89e8b72becdff', 13, 1, 'nApp', '[]', 0, '2020-06-11 00:46:03', '2020-06-11 00:46:03', '2021-06-11 07:46:03'),
('af3f77b6e174ab6f162f5db4befecf3aea2eb9428b10361e252b3e2bbd8c538185a06226f09d1e7b', 12, 1, 'nApp', '[]', 0, '2020-06-15 02:39:16', '2020-06-15 02:39:16', '2021-06-15 09:39:16'),
('b09ceb3a35c63c6bc43204980cb4737db7db138b6e99e547e48e621fd334e54ca0dfd17a1e2fa764', 2, 1, 'nApp', '[]', 0, '2020-06-08 01:23:50', '2020-06-08 01:23:50', '2021-06-08 08:23:50'),
('b2612d9007ee3db2a4314cf0b5da582e9d2971cb3cea3a8440a44eef5f5eb39ae88a2e3ba3fda9b8', 4, 1, 'nApp', '[]', 0, '2020-06-09 07:28:30', '2020-06-09 07:28:30', '2021-06-09 14:28:30'),
('b2a88b2a9f22d1250afc4ee67ec133b24dca25eae1c521e53c87be721b2f254776c3013239e81289', 13, 1, 'nApp', '[]', 0, '2020-06-10 17:07:09', '2020-06-10 17:07:09', '2021-06-11 00:07:09'),
('b64012a3bdacaf83529bd9e8911ed75c3fe961385ae23e56d4b843b7c918f84a0e0cd00fb1f0fe4e', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:37:36', '2020-06-08 02:37:36', '2021-06-08 09:37:36'),
('b766cb0b54e4a5ac950ea4b9a5407c38d6ef2bf5f7e120bf2b6f6aba830026bf83808393d5a4b990', 2, 1, 'nApp', '[]', 0, '2020-06-07 17:29:15', '2020-06-07 17:29:15', '2021-06-08 00:29:15'),
('bb89710d0dc6e4a588c6ceac1c01b403bca9cb03e6e93f09ca98d57dec407a71d798a14b12b68a65', 13, 1, 'nApp', '[]', 0, '2020-06-11 00:00:22', '2020-06-11 00:00:22', '2021-06-11 07:00:22'),
('bb9dd553cc6122698e269d1b910783fabc9696496a96d11df86c5584615bd806aecd03bb8ef6bf36', 12, 1, 'nApp', '[]', 0, '2020-06-10 18:48:48', '2020-06-10 18:48:48', '2021-06-11 01:48:48'),
('bf6a422478eb02d12f8f3e0cf4b6da95fcc102ea943aec1fe6658164e5a4088641768600b5ed997f', 4, 1, 'nApp', '[]', 0, '2020-06-08 05:21:33', '2020-06-08 05:21:33', '2021-06-08 12:21:33'),
('c050aa0d8fe07a44c953844162b40578182c3c2234cd5be4f5e36dc099056f6498c97ab2bd1ae686', 4, 1, 'nApp', '[]', 0, '2020-06-08 07:32:28', '2020-06-08 07:32:28', '2021-06-08 14:32:28'),
('c12a507c4b283751b0773fed72afa138440488112874329b1ace2fe2e9116cd724ed4d0849d55680', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:41:37', '2020-06-08 02:41:37', '2021-06-08 09:41:37'),
('c1f4f0a7a5260bf59dd263f968b5093d4e258cf6da11ee796172cda5bc8cb4ca38165b4f465c8858', 11, 1, 'nApp', '[]', 0, '2020-06-12 07:12:37', '2020-06-12 07:12:37', '2021-06-12 14:12:37'),
('c2ae8519b6da93c83c078f012c271e873a5d6005b79ae33990ecdeb86d4b45874c547bb3dae6427b', 12, 1, 'nApp', '[]', 0, '2020-06-15 03:50:13', '2020-06-15 03:50:13', '2021-06-15 10:50:13'),
('c4a1dc5141d1ad89b53500564b4df89baef03c2a934d5aaf44fa37ee396599ac7d08bd83b2b4f544', 2, 1, 'nApp', '[]', 0, '2020-06-08 01:24:19', '2020-06-08 01:24:19', '2021-06-08 08:24:19'),
('c6047997b7f3451efa36d3691d6a7861586e7456f99d295590564e23143812d22b5c19ddedff2f10', 4, 1, 'nApp', '[]', 0, '2020-06-08 12:09:37', '2020-06-08 12:09:37', '2021-06-08 19:09:37'),
('c9cf43f260009e1bb919661c735f3e42e3a5b2ce6ef7ef48cf040572eaf5ba88a2f6f1f31ccf9db6', 14, 1, 'nApp', '[]', 0, '2020-06-15 17:16:33', '2020-06-15 17:16:33', '2021-06-16 00:16:33'),
('ccb6b89a8cc38eb90f93854805da8d48d68d77b7c8adbf6db74baedd6e92ba45fe53eee0aa970170', 2, 1, 'nApp', '[]', 0, '2020-06-08 03:07:00', '2020-06-08 03:07:00', '2021-06-08 10:07:00'),
('d0101c2dd79f8dcdfb9443193c2c421f18147659e5e8c05b49c36365b654c2703c279d5503407d18', 4, 1, 'nApp', '[]', 0, '2020-06-09 06:53:37', '2020-06-09 06:53:37', '2021-06-09 13:53:37'),
('d1eb0c5ab66e590590e9ccbb8a3f356e912a482a84d06832d5d27d6359b7001de26561036975433c', 12, 1, 'nApp', '[]', 0, '2020-06-12 07:07:06', '2020-06-12 07:07:06', '2021-06-12 14:07:06'),
('d5ea7f6a0ea8c133c811841fdbe1a7e6d10b6b1ae24f743aa3572b0ad6c8c24ce2d2466d8d373ec9', 15, 1, 'nApp', '[]', 0, '2020-06-15 17:13:15', '2020-06-15 17:13:15', '2021-06-16 00:13:15'),
('d76f31d00d3ca45e1c6ca452e1ac56124a5bfaee28ba4f2ad5960ac207c72116fae95ff1e333f931', 11, 1, 'nApp', '[]', 0, '2020-06-11 00:23:46', '2020-06-11 00:23:46', '2021-06-11 07:23:46'),
('d9dc35f81ab37b92a63c3338d88e0d33227cd8a2d824b10a4eb4e1f0263822706679703dc3bdf942', 9, 1, 'nApp', '[]', 0, '2020-06-09 05:14:26', '2020-06-09 05:14:26', '2021-06-09 12:14:26'),
('db7aa6cc0c90e37365a5ca4ae6326dcd6543be0e7c8cce283c8196428b55dd2e2b8666961b322d55', 12, 1, 'nApp', '[]', 0, '2020-06-09 12:23:32', '2020-06-09 12:23:32', '2021-06-09 19:23:32'),
('de71ba7bf38a8013b91b0197bc42f747854bb6663f4f7206651ab8ed8dbe4808f6354ee2a0781aa9', 4, 1, 'nApp', '[]', 0, '2020-06-08 03:18:06', '2020-06-08 03:18:06', '2021-06-08 10:18:06'),
('df7dd176525d19efe131cffd897f6f8e08b0d698b1053a380008fb351f563446651d495dd0a9ba4a', 4, 1, 'nApp', '[]', 0, '2020-06-08 07:50:57', '2020-06-08 07:50:57', '2021-06-08 14:50:57'),
('e01777f1cf5c00a313788f3dad96527e6d84ccdfaeb78c5b2d597139e58b2f57625cd7217e600f0c', 2, 1, 'nApp', '[]', 0, '2020-06-07 16:55:56', '2020-06-07 16:55:56', '2021-06-07 23:55:56'),
('e1b7a818b31ad727cf132345dcd124086196d5e6600da9e200a787715002c2545b39227a02248aaf', 1, 1, 'nApp', '[]', 0, '2020-06-08 01:28:55', '2020-06-08 01:28:55', '2021-06-08 08:28:55'),
('e29e1c4cb869095e9e40987b0106c3928c7c4d3c72ec4ba821db3617f281ab1eaf14d0b3e3a5d524', 12, 1, 'nApp', '[]', 0, '2020-06-10 23:58:49', '2020-06-10 23:58:49', '2021-06-11 06:58:49'),
('e4ca5252164295478d457d1c725bad0eca732d99b3660a8c155fee1939cf7b936b9a1643fde896c2', 4, 1, 'nApp', '[]', 0, '2020-06-09 07:21:16', '2020-06-09 07:21:16', '2021-06-09 14:21:16'),
('e53acdfbc65a0bf37dde43f526d85f1d65d1e0940c2be7b7507551736ba40c547b6579ab2b270c46', 12, 1, 'nApp', '[]', 0, '2020-06-10 16:10:04', '2020-06-10 16:10:04', '2021-06-10 23:10:04'),
('e60ef971d5f3ae8e375675794d557f09a963327ab3d3b41731625968eba958a280a0b712eb11d9b7', 2, 1, 'nApp', '[]', 0, '2020-06-08 02:43:19', '2020-06-08 02:43:19', '2021-06-08 09:43:19'),
('e640c15befd9e30ddf79efddfe22090671251b43a2c3f4c15a868102068270beeb8f8b05ff7bc511', 12, 1, 'nApp', '[]', 0, '2020-06-09 23:28:28', '2020-06-09 23:28:28', '2021-06-10 06:28:28'),
('e6e18cf6a71e80f562c510e8dc9d2b33e89f14509259ea70c13da99b7c5c23b196526390cb652284', 12, 1, 'nApp', '[]', 0, '2020-06-09 09:09:04', '2020-06-09 09:09:04', '2021-06-09 16:09:04'),
('e6eb2ec98158d94912133f4ee0363613b123291532b3e617c58f121967b38acb1d59d4645fc4ae34', 12, 1, 'nApp', '[]', 0, '2020-06-15 10:46:29', '2020-06-15 10:46:29', '2021-06-15 17:46:29'),
('eb20bf619a8eede83eead03dd750aaa9da9e9d829827049536bc5fc4dac03d259b80772377cb6b17', 2, 1, 'nApp', '[]', 0, '2020-06-08 01:30:56', '2020-06-08 01:30:56', '2021-06-08 08:30:56'),
('ec1575ee37bb553157c6028cebad345457be519335cd30206b3dd4d30dd440604701101f6e61de89', 4, 1, 'nApp', '[]', 0, '2020-06-09 07:21:55', '2020-06-09 07:21:55', '2021-06-09 14:21:55'),
('ede49c0717678bbee8736ca8c1be5d9bb930a08f32ebaa463900677682c1822acf90f0080b8276d5', 4, 1, 'nApp', '[]', 0, '2020-06-08 10:24:07', '2020-06-08 10:24:07', '2021-06-08 17:24:07'),
('ef0a6d6257f6131d383e5bdbf070caa650c00d6e493b92f87fb4be0bf78d0865218bd2387064449c', 2, 1, 'nApp', '[]', 0, '2020-06-08 03:00:26', '2020-06-08 03:00:26', '2021-06-08 10:00:26'),
('f069c8da4fc64e8d4c26ed69508db55feb10d611c79d024969b4048a37f4d3f5ace70d38a8b19a68', 6, 1, 'nApp', '[]', 0, '2020-06-09 03:42:38', '2020-06-09 03:42:38', '2021-06-09 10:42:38'),
('f1456ceeb124d4bcad789b0a510f20d901fada5ad36de51e29d90586ceeebe200893fcc687b34603', 2, 1, 'nApp', '[]', 0, '2020-06-07 16:55:41', '2020-06-07 16:55:41', '2021-06-07 23:55:41'),
('f2fd8bd7403fe093a1654236299dd5706e43340817db9adc7538262f44444a6c511f6c073f04d4e1', 12, 1, 'nApp', '[]', 0, '2020-06-12 07:12:02', '2020-06-12 07:12:02', '2021-06-12 14:12:02'),
('f4d06f3f5ac8d9bcac91a5b0c216c4a4df3c30c770776a7ec98406e9c8f2f2c45ffd0f1a37db1595', 12, 1, 'nApp', '[]', 0, '2020-06-15 10:51:14', '2020-06-15 10:51:14', '2021-06-15 17:51:14'),
('fc39f4ffb84070dbdef216eb9f49c4afada82e6074b9dfe5233c3e84f53d03de568a0311734e015c', 11, 1, 'nApp', '[]', 0, '2020-06-15 09:07:30', '2020-06-15 09:07:30', '2021-06-15 16:07:30'),
('fca65307734ed289f3f5ac9baaab978973876528981e498868f3d1fa4efdc89027df6aac48f88ec8', 12, 1, 'nApp', '[]', 0, '2020-06-15 03:29:38', '2020-06-15 03:29:38', '2021-06-15 10:29:38');

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
(1, 'produk', 'CYD 250ML', '2020-06-07 17:00:00', '2020-06-15 17:01:39', '2020-06-15 17:01:39'),
(2, 'C02', 'CYD 70 ML Banded 5', '2020-06-07 17:00:00', '2020-06-15 17:05:41', '2020-06-15 17:05:41'),
(3, 'C03', 'CYD 70 ML banded 4', '2020-06-07 17:00:00', '2020-06-15 17:05:40', '2020-06-15 17:05:40'),
(4, 'C04', 'ESL Coklat dll', '2020-06-07 17:00:00', '2020-06-15 17:05:40', '2020-06-15 17:05:40'),
(5, 'C05', 'ESL Plain', '2020-06-07 17:00:00', '2020-06-15 17:05:39', '2020-06-15 17:05:39'),
(6, 'C06', 'UHT Comry Milk 250 ML', '2020-06-07 17:00:00', '2020-06-15 17:05:39', '2020-06-15 17:05:39'),
(7, 'C07', 'UHT Cimory milk 125 ML', '2020-06-07 17:00:00', '2020-06-15 17:05:39', '2020-06-15 17:05:39'),
(8, 'C08', 'YOLITE C+ 100', NULL, '2020-06-15 17:05:39', '2020-06-15 17:05:39'),
(9, 'C10', 'CYD 250 ML Low fat', NULL, '2020-06-15 17:05:39', '2020-06-15 17:05:39'),
(10, 'C09', 'Cimory Squeeze', NULL, '2020-06-15 17:05:39', '2020-06-15 17:05:39'),
(11, 'C01', 'CYD 250 ML', NULL, '2020-06-15 17:05:38', '2020-06-15 17:05:38'),
(12, 'produk lokal bogor', 'Susu Kurma', '2020-06-08 04:28:11', '2020-06-08 05:04:08', '2020-06-08 05:04:08'),
(13, 'Buatan Ibu', 'Kue Bolu', '2020-06-08 04:32:44', '2020-06-08 04:54:04', '2020-06-08 04:54:04'),
(14, 'Dengan gula putih', 'Donat', '2020-06-08 04:34:31', '2020-06-08 04:53:39', '2020-06-08 04:53:39'),
(15, 'susu campur madu dan', 'Susu Madu', '2020-06-08 05:16:56', '2020-06-08 05:17:21', '2020-06-08 05:17:21'),
(16, 'S-01', 'Syla', '2020-06-08 05:44:09', '2020-06-09 05:19:24', '2020-06-09 05:19:24'),
(17, 'kopi lampung asli lu', 'Kopi Luwak', '2020-06-08 14:13:39', '2020-06-15 04:12:36', '2020-06-15 04:12:36'),
(18, 'susu coklat baru', 'Susu coklat', '2020-06-09 07:31:41', '2020-06-09 07:31:43', '2020-06-09 07:31:43'),
(19, 'Herbal', 'Susu Jahe', '2020-06-11 01:45:36', '2020-06-15 04:12:34', '2020-06-15 04:12:34'),
(20, 'C01', 'CYD 250ML', '2020-06-15 17:06:32', '2020-06-15 17:06:32', NULL),
(21, 'C02', 'CYD 70 ML Banded 5', '2020-06-15 17:06:48', '2020-06-15 17:06:48', NULL),
(22, 'C03', 'CYD 70 ML banded 4', '2020-06-15 17:07:04', '2020-06-15 17:07:04', NULL),
(23, 'C04', 'ESL Coklat dll', '2020-06-15 17:07:17', '2020-06-15 17:07:17', NULL),
(24, 'C05', 'ESL Plain', '2020-06-15 17:07:33', '2020-06-15 17:07:33', NULL),
(25, 'C06', 'UHT Comry Milk 250 ML', '2020-06-15 17:07:49', '2020-06-15 17:07:49', NULL),
(26, 'C07', 'UHT Cimory milk 125 ML', '2020-06-15 17:08:01', '2020-06-15 17:08:01', NULL),
(27, 'C08', 'YOLITE C+ 100', '2020-06-15 17:08:18', '2020-06-15 17:08:18', NULL),
(28, 'C09', 'Kanzler Singles', '2020-06-15 17:08:47', '2020-06-15 17:08:47', NULL),
(29, 'C10', 'Cimory Squeeze', '2020-06-15 17:09:00', '2020-06-15 17:09:00', NULL),
(30, 'C11', 'CYD 250 ML Low fat', '2020-06-15 17:09:16', '2020-06-15 17:09:16', NULL);

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
(1, 'DC11-01', 'Ike Fiernanti', '2020-06-08 05:48:06', '2020-06-15 17:04:26', '2020-06-15 17:04:26'),
(2, 'DC11-02', 'Syla', '2020-06-08 05:48:17', '2020-06-15 17:04:25', '2020-06-15 17:04:25'),
(3, 'DC13-01', 'Agi Ahmad', '2020-06-08 05:48:49', '2020-06-08 05:49:01', '2020-06-08 05:49:01'),
(4, 'DC13-02', 'Zulfikar', '2020-06-09 07:32:08', '2020-06-15 17:04:25', '2020-06-15 17:04:25'),
(5, 'DC13-03', 'Ahmad', '2020-06-11 01:46:22', '2020-06-15 17:04:24', '2020-06-15 17:04:24'),
(6, 'DC11-03', 'Fakhri', '2020-06-15 03:54:47', '2020-06-15 17:04:24', '2020-06-15 17:04:24'),
(7, 'DC11-04', 'Hanan', '2020-06-15 03:55:05', '2020-06-15 04:01:36', '2020-06-15 04:01:36'),
(8, 'DC1-01', 'Budi', '2020-06-15 17:14:33', '2020-06-15 17:14:33', NULL),
(9, 'DC1-02', 'Dedi', '2020-06-15 17:14:42', '2020-06-15 17:14:42', NULL),
(10, 'DC2-01', 'Asep', '2020-06-15 17:14:54', '2020-06-15 17:14:54', NULL),
(11, 'DC2-02', 'Ujang', '2020-06-15 17:15:07', '2020-06-15 17:15:07', NULL),
(12, 'DC3-01', 'Agus', '2020-06-15 17:15:22', '2020-06-15 17:15:22', NULL),
(13, 'DC3-02', 'Mandra', '2020-06-15 17:16:03', '2020-06-15 17:16:03', NULL);

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

--
-- Dumping data for table `transaksi_dc`
--

INSERT INTO `transaksi_dc` (`id`, `id_produk`, `id_sales`, `id_dc`, `qty_pembelian`, `qty_penjualan`, `qty_retur`, `qty_stock`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 2, 2, 2, 0, 0, '2020-06-10 23:35:57', '2020-06-10 23:35:57', NULL),
(2, 17, 4, 5, 5, 5, 0, 0, '2020-06-11 00:24:07', '2020-06-11 00:24:07', NULL),
(3, 5, 4, 5, 10, 8, 0, 2, '2020-06-11 00:44:30', '2020-06-11 00:44:30', NULL),
(4, 8, 1, 2, 8, 8, 0, 0, '2020-06-11 00:46:28', '2020-06-11 00:46:28', NULL),
(5, 19, 1, 2, 5, 4, 0, 1, '2020-06-11 01:54:40', '2020-06-11 01:54:40', NULL),
(6, 6, 4, 5, 20, 10, 0, 10, '2020-06-15 10:54:09', '2020-06-15 10:54:09', NULL),
(7, 20, 8, 8, 250, 200, 5, 45, '2020-06-15 17:17:03', '2020-06-15 17:17:03', NULL),
(8, 21, 11, 9, 300, 280, 0, 20, '2020-06-15 17:17:51', '2020-06-15 17:17:51', NULL);

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
(7, 3, NULL, 'Ahmad Koding', 'ahmadkoding', 'ahmadkoding@gmail.com', NULL, '$2y$10$5ZhsAF0QWYHxaVt.iE4K/ehF2TaT0hoGMJOCEkZy.EpsIcEb6d4Lu', NULL, NULL, NULL, '2020-06-09 03:44:20', '2020-06-09 03:44:20', NULL),
(8, 3, NULL, 'Ahmad Rumah Koding', 'ahmadrumahkoding', 'ahmad@rumahkoding.com', NULL, '$2y$10$0wTCqabA6CKzMHH8dxzGrezI1iEtvBVl68QTMOT79Sp2XhdG9J282', NULL, NULL, NULL, '2020-06-09 05:11:44', '2020-06-09 05:11:44', NULL),
(9, 3, NULL, 'Nismara Rifanti', 'nismararifanti', 'nismara@gmail.com', NULL, '$2y$10$KinHnimxSdMZM6xFQEGGwekjjI6c6WhbHLMHK2IAV3sThc0Wvj2P6', NULL, NULL, NULL, '2020-06-09 05:14:26', '2020-06-09 05:14:26', NULL),
(10, 3, NULL, 'nismara2', 'nismara2', 'nismara2@gmail.com', NULL, '$2y$10$00/O5.Y0adNQjqtlEbro4ebtRsn2rPrHhY70LvYE7GH1dZkk9yaKi', NULL, NULL, NULL, '2020-06-09 05:16:13', '2020-06-09 05:16:13', NULL),
(12, 4, NULL, 'Admin Cimory', 'admin01', 'admin01@cimory.local', NULL, '$2y$10$n45.UE4aPL5zaDVufIGFguF7hdi2sc5DNJNYmXDrVFbltJalC4cDi', NULL, NULL, NULL, '2020-06-09 09:09:04', '2020-06-09 09:09:04', NULL),
(14, 3, 8, 'DC Pesanggrahan', 'pesanggrahan', 'pesanggrahan@gmail.com', NULL, '$2y$10$2U9HBHMd4aBeyuJCm6sPH.suLEKFnWRJff54.NI4qD19KorsH61ua', NULL, NULL, NULL, '2020-06-15 17:12:27', '2020-06-15 17:12:27', NULL),
(15, 3, 9, 'DC Tanah Abang', 'tanahabang', 'tanahabang@gmail.com', NULL, '$2y$10$wUwKdMJnoLuStQ7kPSyLgeMA/gHNafXmzujr3EWDN8D9BP7335ZpC', NULL, NULL, NULL, '2020-06-15 17:13:15', '2020-06-15 17:13:15', NULL),
(16, 3, 10, 'DC Ciledug', 'ciledug', 'ciledug@gmail.com', NULL, '$2y$10$fniD.fRbLKwPYmflxHckMePYza9PgSpLjprneHT8RCAqxx7fk1ygq', NULL, NULL, NULL, '2020-06-15 17:13:48', '2020-06-15 17:13:48', NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `harga`
--
ALTER TABLE `harga`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `transaksi_dc`
--
ALTER TABLE `transaksi_dc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
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
  ADD CONSTRAINT `harga_id_produk_foreign` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
