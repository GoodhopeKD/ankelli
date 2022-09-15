-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 15, 2022 at 07:14 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ankelli`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(124, '2014_10_12_000000_create_users_table', 1),
(125, '2014_10_12_100000_create_password_resets_table', 1),
(126, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(127, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(128, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(129, '2016_06_01_000004_create_oauth_clients_table', 1),
(130, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(131, '2019_08_19_000000_create_failed_jobs_table', 1),
(132, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(133, '2022_07_26_072110_create___admin_extensions_table', 1),
(134, '2022_07_26_072112_create___buyer_extensions_table', 1),
(135, '2022_07_26_072114_create___seller_extensions_table', 1),
(136, '2022_07_26_072120_create___user_groups_table', 1),
(137, '2022_07_26_072122_create___user_group_memberships_table', 1),
(138, '2022_07_26_072124_create___permissions_table', 1),
(139, '2022_07_26_072126_create___permission_instances_table', 1),
(140, '2022_07_26_072130_create___sessions_table', 1),
(141, '2022_07_26_072131_create___notifications_table', 1),
(142, '2022_07_26_072132_create___pref_items_table', 1),
(143, '2022_07_26_072135_create___reg_tokens_table', 1),
(144, '2022_07_26_072136_create___verif_tokens_table', 1),
(145, '2022_07_26_072137_create___email_addresses_table', 1),
(146, '2022_07_26_072140_create___phone_nos_table', 1),
(147, '2022_07_26_072324_create___files_table', 1),
(148, '2022_07_26_072326_create___feedback_reports_table', 1),
(149, '2022_07_26_072327_create___posts_table', 1),
(150, '2022_07_26_072332_create___assets_table', 1),
(151, '2022_07_26_072333_create___asset_accounts_table', 1),
(152, '2022_07_26_072334_create___asset_account_addresses_table', 1),
(153, '2022_07_26_072336_create___currencies_table', 1),
(154, '2022_07_26_072337_create___pymt_methods_table', 1),
(155, '2022_07_26_072345_create___countries_table', 1),
(156, '2022_07_26_072347_create___exportables_table', 1),
(157, '2022_07_26_072410_create___deposit_tokens_table', 1),
(158, '2022_07_26_072416_create___offers_table', 1),
(159, '2022_07_26_072417_create___trades_table', 1),
(160, '2022_07_26_072419_create___chats_table', 1),
(161, '2022_07_26_072420_create___messages_table', 1),
(162, '2022_07_26_072421_create___pinnings_table', 1),
(163, '2022_07_26_072443_create___transactions_table', 1),
(164, '2022_07_26_072444_create___logs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('13e0946588ab240a4aea727ca0ec5d9955d3295b1d87250e270103973b3a2b7ff1a77d3f569521c5', 6, 1, 'auth_token', '[]', 0, '2022-09-15 03:09:23', '2022-09-15 03:09:23', '2023-09-15 05:09:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, NULL, 'Ankelli Personal Access Client', '5Rsyqdx0QVxFCugvyCEcDYYoQFWOF6a4eVh6wHjL', NULL, 'http://localhost', 1, 0, 0, '2022-09-15 02:47:56', '2022-09-15 02:47:56'),
(2, NULL, 'Ankelli Password Grant Client', 'cOJdjqDEtP2acZov4ja6TKi2Bzsc7S0sVIh4lXTm', 'users', 'http://localhost', 0, 1, 0, '2022-09-15 02:47:56', '2022-09-15 02:47:56');

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
(1, 1, '2022-09-15 02:47:56', '2022-09-15 02:47:56');

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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `__admin_extensions`
--

CREATE TABLE `__admin_extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('active','suspended','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__admin_extensions`
--

INSERT INTO `__admin_extensions` (`id`, `user_username`, `post_title`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
(1, 'system', 'System', 'active', 'system', '2022-09-15 04:47:48', NULL, NULL),
(2, 'developer', 'Default Developer', 'active', 'system', '2022-09-15 02:47:53', '2022-09-15 02:47:53', NULL),
(3, 'sysadmin', 'Default System Administrator', 'active', 'system', '2022-09-15 02:47:53', '2022-09-15 02:47:53', NULL),
(4, 'reserves', 'Ankelli Asset Reserves', 'active', 'system', '2022-09-15 02:47:54', '2022-09-15 02:47:54', NULL),
(5, 'busadmin', 'Default Business Administrator', 'active', 'system', '2022-09-15 02:47:55', '2022-09-15 02:47:55', NULL),
(6, 'guddaz', 'Head System Developer', 'active', 'system', '2022-09-15 02:48:03', '2022-09-15 02:48:03', NULL),
(7, 'lodza', 'Head Business Administrator', 'active', 'system', '2022-09-15 02:48:04', '2022-09-15 02:48:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__assets`
--

CREATE TABLE `__assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tatum_mnemonic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_xpub` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smallest_display_unit` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('active','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__assets`
--

INSERT INTO `__assets` (`id`, `tatum_mnemonic`, `tatum_xpub`, `name`, `code`, `smallest_display_unit`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`) VALUES
(1, NULL, NULL, 'Tether USD', 'USDT', '0.0001', 'active', 'system', '2022-09-15 02:47:52', '2022-09-15 02:47:52');

-- --------------------------------------------------------

--
-- Table structure for table `__asset_accounts`
--

CREATE TABLE `__asset_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tatum_virtual_account_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usable_balance_asset_value` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_balance_asset_value` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `_status` enum('active','frozen') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__asset_accounts`
--

INSERT INTO `__asset_accounts` (`id`, `tatum_virtual_account_id`, `user_username`, `asset_code`, `usable_balance_asset_value`, `total_balance_asset_value`, `_status`, `created_datetime`, `updated_datetime`) VALUES
(1, NULL, 'reserves', 'USDT', '1619.1915423834', '1619.1915423834', 'active', '2022-09-15 02:47:54', '2022-09-15 02:49:56'),
(2, NULL, 'guddaz', 'USDT', '423.09622760618', '423.09622760618', 'active', '2022-09-15 02:48:11', '2022-09-15 02:49:48'),
(3, NULL, 'lodza', 'USDT', '567.94045965284', '567.94045965284', 'active', '2022-09-15 02:48:12', '2022-09-15 02:49:29'),
(4, NULL, 'flint', 'USDT', '139.9256231748', '139.9256231748', 'active', '2022-09-15 02:48:14', '2022-09-15 02:49:56'),
(5, NULL, 'ross', 'USDT', '1.4893617021219', '1.4893617021219', 'active', '2022-09-15 02:48:18', '2022-09-15 02:49:03'),
(6, NULL, 'keith', 'USDT', '103.29954915547', '103.29954915547', 'active', '2022-09-15 02:48:19', '2022-09-15 02:49:23'),
(7, NULL, 'jimmy', 'USDT', '482.18610415589', '482.18610415589', 'active', '2022-09-15 02:48:21', '2022-09-15 02:49:43'),
(8, NULL, 'clarence', 'USDT', '312.76595744681', '312.76595744681', 'active', '2022-09-15 02:48:23', '2022-09-15 02:49:02'),
(9, NULL, 'nassim', 'USDT', '302.24719101124', '302.24719101124', 'active', '2022-09-15 02:48:25', '2022-09-15 02:49:42'),
(10, NULL, 'raymond', 'USDT', '368.42105263158', '368.42105263158', 'active', '2022-09-15 02:48:42', '2022-09-15 02:49:35'),
(11, NULL, 'peter', 'USDT', '471.83979974969', '471.83979974969', 'active', '2022-09-15 02:49:15', '2022-09-15 02:49:55');

-- --------------------------------------------------------

--
-- Table structure for table `__asset_account_addresses`
--

CREATE TABLE `__asset_account_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_account_id` bigint(20) UNSIGNED NOT NULL,
  `blockchain_address` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_derivation_key` int(10) UNSIGNED DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `__buyer_extensions`
--

CREATE TABLE `__buyer_extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('active','suspended','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__buyer_extensions`
--

INSERT INTO `__buyer_extensions` (`id`, `user_username`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
(1, 'sysadmin', 'deactivated', 'system', '2022-09-15 02:47:53', '2022-09-15 02:47:53', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-15 02:47:55', '2022-09-15 02:47:55', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-15 02:47:55', '2022-09-15 02:47:55', NULL),
(4, 'ross', 'active', 'guddaz', '2022-09-15 02:48:27', '2022-09-15 02:48:27', NULL),
(5, 'raymond', 'active', 'lodza', '2022-09-15 02:48:39', '2022-09-15 02:48:39', NULL),
(6, 'keith', 'active', 'lodza', '2022-09-15 02:48:45', '2022-09-15 02:48:45', NULL),
(7, 'jimmy', 'active', 'lodza', '2022-09-15 02:48:52', '2022-09-15 02:48:52', NULL),
(8, 'clarence', 'active', 'ross', '2022-09-15 02:48:58', '2022-09-15 02:48:58', NULL),
(9, 'lodza', 'active', 'keith', '2022-09-15 02:49:05', '2022-09-15 02:49:05', NULL),
(10, 'peter', 'active', 'keith', '2022-09-15 02:49:12', '2022-09-15 02:49:12', NULL),
(11, 'flint', 'active', 'keith', '2022-09-15 02:49:19', '2022-09-15 02:49:19', NULL),
(12, 'nassim', 'active', 'jimmy', '2022-09-15 02:49:38', '2022-09-15 02:49:38', NULL),
(13, 'guddaz', 'active', 'flint', '2022-09-15 02:49:45', '2022-09-15 02:49:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__chats`
--

CREATE TABLE `__chats` (
  `id` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `participant_one_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `participant_one_visible` tinyint(1) NOT NULL DEFAULT 1,
  `participant_two_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `participant_two_visible` tinyint(1) NOT NULL DEFAULT 1,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `__countries`
--

CREATE TABLE `__countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `choice_pymt_method_slugs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_currency_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allowed_asset_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_status` enum('active','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__countries`
--

INSERT INTO `__countries` (`id`, `name`, `code`, `choice_pymt_method_slugs`, `choice_currency_codes`, `allowed_asset_codes`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`) VALUES
(1, 'Zimbabwe', 'ZIM', NULL, NULL, NULL, 'active', 'system', '2022-09-15 04:47:50', NULL),
(2, 'South Africa', 'RSA', NULL, NULL, NULL, 'active', 'system', '2022-09-15 04:47:50', NULL),
(3, 'United Kingdom', 'UK', NULL, NULL, NULL, 'active', 'system', '2022-09-15 04:47:50', NULL),
(4, 'United States of America', 'USA', NULL, NULL, NULL, 'active', 'system', '2022-09-15 04:47:50', NULL),
(5, 'Russia', 'RUS', NULL, NULL, NULL, 'active', 'system', '2022-09-15 04:47:50', NULL),
(6, 'China', 'CHN', NULL, NULL, NULL, 'active', 'system', '2022-09-15 04:47:50', NULL),
(7, 'Ghana', 'GHA', NULL, NULL, NULL, 'active', 'system', '2022-09-15 04:47:50', NULL),
(8, 'Botswana', 'BOT', NULL, NULL, NULL, 'active', 'system', '2022-09-15 04:47:50', NULL),
(9, 'Zambia', 'ZAM', NULL, NULL, NULL, 'active', 'system', '2022-09-15 04:47:50', NULL),
(10, 'Algeria', 'ALG', NULL, NULL, NULL, 'active', 'system', '2022-09-15 04:47:50', NULL),
(11, 'Italy', 'ITA', NULL, NULL, NULL, 'active', 'system', '2022-09-15 04:47:50', NULL),
(12, 'Nigeria', 'NIG', NULL, NULL, NULL, 'active', 'system', '2022-09-15 04:47:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__currencies`
--

CREATE TABLE `__currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol_before_number` tinyint(1) NOT NULL,
  `usd_rate` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_transactable_cash_amount` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smallest_transactable_cash_denomination_amount` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('active','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__currencies`
--

INSERT INTO `__currencies` (`id`, `name`, `code`, `symbol`, `symbol_before_number`, `usd_rate`, `min_transactable_cash_amount`, `smallest_transactable_cash_denomination_amount`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`) VALUES
(1, 'US Dollar', 'USD', '$', 1, '1', '10', '5', 'active', 'system', '2022-09-15 04:47:50', NULL),
(2, 'Euro', 'EUR', '€', 1, '0.87', '10', '5', 'active', 'system', '2022-09-15 04:47:50', NULL),
(3, 'Pound Sterling', 'GBP', '£', 1, '0.77', '10', '5', 'active', 'system', '2022-09-15 04:47:50', NULL),
(4, 'South African Rand', 'ZAR', 'R', 0, '16', '100', '100', 'active', 'system', '2022-09-15 04:47:50', NULL),
(5, 'Zambian Kwacha', 'ZMW', 'K', 0, '15', '100', '100', 'active', 'system', '2022-09-15 04:47:50', NULL),
(6, 'Algerian Dinar', 'DZD', 'DA', 0, '180', '100', '100', 'active', 'system', '2022-09-15 04:47:50', NULL),
(7, 'Zimbabwean Dollar', 'ZWL', '$', 1, '10000', '500', '5000', 'active', 'system', '2022-09-15 04:47:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__deposit_tokens`
--

CREATE TABLE `__deposit_tokens` (
  `token` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_value` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_amount` bigint(20) UNSIGNED NOT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__deposit_tokens`
--

INSERT INTO `__deposit_tokens` (`token`, `asset_code`, `asset_value`, `currency_code`, `currency_amount`, `creator_username`, `created_datetime`, `user_username`, `used_datetime`) VALUES
('146984445F424', 'USDT', '600', 'USD', 601, 'lodza', '2022-09-15 02:48:19', 'keith', '2022-09-15 02:48:19'),
('1471738093C20', 'USDT', '500', 'USD', 501, 'lodza', '2022-09-15 02:48:21', 'jimmy', '2022-09-15 02:48:21'),
('1546978C84EDE', 'USDT', '100', 'DZD', 18000, 'lodza', '2022-09-15 02:48:25', 'nassim', '2022-09-15 02:48:25'),
('1750401D08499', 'USDT', '110', 'USD', 111, 'lodza', '2022-09-15 02:48:17', 'ross', '2022-09-15 02:48:18'),
('1998972B3E336', 'USDT', '100', 'EUR', 93, 'lodza', '2022-09-15 02:48:23', 'clarence', '2022-09-15 02:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `__email_addresses`
--

CREATE TABLE `__email_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email_address` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `verified_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__email_addresses`
--

INSERT INTO `__email_addresses` (`id`, `email_address`, `user_username`, `created_datetime`, `verified_datetime`) VALUES
(1, 'developer.ankelli@gmail.com', 'developer', '2022-09-15 02:47:52', NULL),
(2, 'sysadmin@ankelli.com', 'sysadmin', '2022-09-15 02:47:53', NULL),
(3, 'reserves@ankelli.com', 'reserves', '2022-09-15 02:47:54', NULL),
(4, 'busadmin@ankelli.com', 'busadmin', '2022-09-15 02:47:55', NULL),
(5, 'goodhopedhliwayo@gmail.com', 'guddaz', '2022-09-15 02:48:03', NULL),
(6, 'lodza@example.com', 'lodza', '2022-09-15 02:48:04', NULL),
(7, 'ross@example.com', 'ross', '2022-09-15 02:48:05', NULL),
(8, 'jimmy@example.com', 'jimmy', '2022-09-15 02:48:06', NULL),
(9, 'keith@example.com', 'keith', '2022-09-15 02:48:07', NULL),
(10, 'peter@example.com', 'peter', '2022-09-15 02:48:07', NULL),
(11, 'flint@example.com', 'flint', '2022-09-15 02:48:08', NULL),
(12, 'clarence@example.com', 'clarence', '2022-09-15 02:48:08', NULL),
(13, 'raymond@example.com', 'raymond', '2022-09-15 02:48:09', NULL),
(14, 'nassim@example.com', 'nassim', '2022-09-15 02:48:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__exportables`
--

CREATE TABLE `__exportables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('active','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `__feedback_reports`
--

CREATE TABLE `__feedback_reports` (
  `ticket_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_token` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('bug_report','crash_report','vulnerability_report','abuse_report','appreciation_message','contact_form_message') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_email_address` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `closing_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_status` enum('open','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `__files`
--

CREATE TABLE `__files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_table` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_uid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filegroup` enum('documents','images') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` smallint(5) UNSIGNED DEFAULT NULL,
  `height` smallint(5) UNSIGNED DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filesize` mediumint(8) UNSIGNED DEFAULT NULL,
  `original_filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_index` tinyint(3) UNSIGNED DEFAULT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__files`
--

INSERT INTO `__files` (`id`, `parent_table`, `parent_uid`, `filegroup`, `tag`, `title`, `width`, `height`, `uri`, `type`, `filesize`, `original_filename`, `order_index`, `creator_username`, `created_datetime`, `updated_datetime`) VALUES
(1, '__pymt_methods', 'cash_in_person', 'images', 'pymt_method_icon', 'Cash in person', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Cash in person.jpg', 'image/jpg', NULL, 'Cash in person.jpg', NULL, 'system', '2022-09-15 02:47:50', NULL),
(2, '__pymt_methods', 'stanbic_bank', 'images', 'pymt_method_icon', 'Stanbic Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Stanbic bank.jpg', 'image/jpg', NULL, 'Stanbic Bank Icon.jpg', NULL, 'system', '2022-09-15 02:47:50', NULL),
(3, '__pymt_methods', 'fnb_bank', 'images', 'pymt_method_icon', 'FNB Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FNB bank.png', 'image/png', NULL, 'FNB Bank Icon.png', NULL, 'system', '2022-09-15 02:47:50', NULL),
(4, '__pymt_methods', 'mukuru', 'images', 'pymt_method_icon', 'Mukuru Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mukuru.jpg', 'image/jpg', NULL, 'Mukuru Icon.jpg', NULL, 'system', '2022-09-15 02:47:50', NULL),
(5, '__pymt_methods', 'algerie_poste', 'images', 'pymt_method_icon', 'Algerie poste Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Algerie poste.jpg', 'image/jpg', NULL, 'Algerie poste Icon.jpg', NULL, 'system', '2022-09-15 02:47:50', NULL),
(6, '__pymt_methods', 'mtn_momo', 'images', 'pymt_method_icon', 'MTN MOMO Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/MTN MOMO.png', 'image/png', NULL, 'MTN MOMO Icon.png', NULL, 'system', '2022-09-15 02:47:50', NULL),
(7, '__pymt_methods', 'ecocash', 'images', 'pymt_method_icon', 'Ecocash Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Ecocash.png', 'image/png', NULL, 'Ecocash Icon.png', NULL, 'system', '2022-09-15 02:47:50', NULL),
(8, '__pymt_methods', 'paypal', 'images', 'pymt_method_icon', 'Paypal Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Paypal.png', 'image/png', NULL, 'Paypal Icon.png', NULL, 'system', '2022-09-15 02:47:50', NULL),
(9, '__pymt_methods', 'skrill', 'images', 'pymt_method_icon', 'Skrill Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Skrill.jpg', 'image/jpg', NULL, 'Skrill Icon.jpg', NULL, 'system', '2022-09-15 02:47:50', NULL),
(10, '__pymt_methods', 'world_remit', 'images', 'pymt_method_icon', 'World Remit Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/World Remit.png', 'image/png', NULL, 'World Remit Icon.png', NULL, 'system', '2022-09-15 02:47:50', NULL),
(11, '__pymt_methods', 'mastercard', 'images', 'pymt_method_icon', 'Mastercard Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mastercard.jpeg', 'image/jpeg', NULL, 'Mastercard Icon.jpeg', NULL, 'system', '2022-09-15 02:47:50', NULL),
(12, '__pymt_methods', 'visa', 'images', 'pymt_method_icon', 'Visa Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Visa.jpg', 'image/jpg', NULL, 'Visa Icon.jpg', NULL, 'system', '2022-09-15 02:47:50', NULL),
(13, '__pymt_methods', 'fbc_bank', 'images', 'pymt_method_icon', 'FBC bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FBC bank.jpg', 'image/jpg', NULL, 'FBC bank Icon.jpg', NULL, 'system', '2022-09-15 02:47:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__logs`
--

CREATE TABLE `__logs` (
  `id` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_token` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_type` enum('entry_create','entry_read','entry_update','entry_delete','function_call','batch_init') COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_datetime` timestamp NULL DEFAULT current_timestamp(),
  `utc_offset` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry_table` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry_uid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry_update_result` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_location` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__logs`
--

INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('021eAOKW6qVoDkKr', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-15 02:49:37', NULL, NULL, '__trades', '1512132F651FE', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:33\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('0tR2Qmx2zo3N7zQp', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 02:47:53', NULL, NULL, '__user_group_memberships', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('0xaidi4hVV26LKYA', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-15 02:49:47', NULL, NULL, '__trades', '1064008BAA69F', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:46\"}]', '{\"ip\":\"127.0.0.1\"}'),
('0xJRZicGRyLiAsVS', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'clarence', '2022-09-15 02:49:04', NULL, NULL, '__trades', '1220018BA42EA', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:00\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('1GCKL2VkHtoT1fV4', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 02:49:23', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":104.92715332214,\"new_value\":103.29954915547},{\"field_name\":\"total_balance_asset_value\",\"old_value\":104.92715332214,\"new_value\":103.29954915547}]', '{\"ip\":\"127.0.0.1\"}'),
('1sXx4PzUyfIEVwnO', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-15 02:49:53', NULL, NULL, '__trades', '16590765F22DC', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:53\"}]', '{\"ip\":\"127.0.0.1\"}'),
('1VRMChxVOFG2pVKB', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-15 02:49:31', NULL, NULL, '__offers', '16454950CF7F1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('20GRvWsBZ4jMmk4V', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:41', NULL, NULL, '__messages', '164736AC248CC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('29DZLbmNzosi84eD', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 02:48:34', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":210.33027015936,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('2k6cTyzdUIvynakX', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:48:06', NULL, '195882938BE80', '__notifications', '14856923A749F', NULL, NULL),
('2oCynpkK9W6PjXUf', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'keith', '2022-09-15 02:48:20', NULL, NULL, '__deposit_tokens', '146984445F424', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:48:19\"}]', '{\"ip\":\"127.0.0.1\"}'),
('2Ull8WlSSZuEA6dd', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 02:47:56', NULL, NULL, '__user_group_memberships', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('32DYYBZWInXCj1Tn', 'FACTORY_SESSION', 'Resetting to default value.', 'entry_update', 'system', '2022-09-15 02:47:56', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Resetting to default value.\"},{\"field_name\":\"value\",\"old_value\":\"0\",\"new_value\":true}]', '{\"ip\":\"127.0.0.1\"}'),
('3nCC12NUX62Gu93o', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 02:48:44', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":969.36263210526,\"new_value\":968.31000052631},{\"field_name\":\"total_balance_asset_value\",\"old_value\":969.36263210526,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('3U3bplmbOqOYfz86', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:48:16', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":967.86579,\"new_value\":1074.62579},{\"field_name\":\"total_balance_asset_value\",\"old_value\":967.86579,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}'),
('423AuVqo248pKNhe', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'ross', '2022-09-15 02:48:18', NULL, NULL, '__asset_accounts', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('48S9rJMrY9nkTH9z', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-15 02:47:55', NULL, NULL, '__admin_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('4eR59GLdHJO9Y4dN', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:48:03', NULL, '11570737CFEEA', '__email_addresses', 'goodhopedhliwayo@gmail.com', NULL, NULL),
('4H54VMc4rWeyyEel', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 02:49:21', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":103.29954915548,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('4jTkmWu0SvHVDYph', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:48:55', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":817.88446861141,\"new_value\":179.58659627098},{\"field_name\":\"total_balance_asset_value\",\"old_value\":817.88446861141,\"new_value\":179.58659627098}]', '{\"ip\":\"127.0.0.1\"}'),
('4LwRIB66JIM6qMk1', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:48:52', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":817.88446861141,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('4N8105Ak2HUvQCu1', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-15 02:48:52', NULL, NULL, '__buyer_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('4OcLqf7MKTvoBCFK', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:49:30', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1608.5089031588,\"new_value\":1610.351008422},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1608.5089031588,\"new_value\":1610.351008422}]', '{\"ip\":\"127.0.0.1\"}'),
('4U8FvfKeK93rSlqI', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:49:10', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":538.4098544233,\"new_value\":536.30459126541},{\"field_name\":\"total_balance_asset_value\",\"old_value\":538.4098544233,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('53VEePrgtR6t2bHt', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 02:49:55', NULL, NULL, '__asset_accounts', '11', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":265.95744680851,\"new_value\":471.83979974969},{\"field_name\":\"total_balance_asset_value\",\"old_value\":265.95744680851,\"new_value\":471.83979974969}]', '{\"ip\":\"127.0.0.1\"}'),
('5Cj2m9d3pulD4CqC', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:48:57', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1593.6058230682,\"new_value\":1599.9888017916},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1593.6058230682,\"new_value\":1599.9888017916}]', '{\"ip\":\"127.0.0.1\"}'),
('5nr5qduugyxh09Ib', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 02:49:48', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":562.76041666667,\"new_value\":349.99445921986},{\"field_name\":\"total_balance_asset_value\",\"old_value\":562.76041666667,\"new_value\":349.99445921986}]', '{\"ip\":\"127.0.0.1\"}'),
('5p33yxFFGoIVyHYZ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:37', NULL, NULL, '__messages', '132009ABE5037', NULL, '{\"ip\":\"127.0.0.1\"}'),
('5xy4uKLiFUO3bV3M', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 02:48:35', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":110,\"new_value\":216.3829787234},{\"field_name\":\"total_balance_asset_value\",\"old_value\":110,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('68MdwYHqLrcdd5cr', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'raymond', '2022-09-15 02:48:42', NULL, NULL, '__asset_accounts', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('6E9s1dfeeVcgKPRC', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 02:49:03', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":3.61702127659,\"new_value\":1.4893617021219},{\"field_name\":\"total_balance_asset_value\",\"old_value\":3.61702127659,\"new_value\":1.4893617021219}]', '{\"ip\":\"127.0.0.1\"}'),
('6mZxKwCRXQc3YukZ', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'guddaz', '2022-09-15 02:49:50', NULL, NULL, '__trades', '1064008BAA69F', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"guddaz\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:47\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('6OjTL0mZ0Hz2fP8K', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:49:08', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":536.3045912654,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('6rMlZ0Ag6QBS3tRg', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 02:48:11', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":218.87587867},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":218.87587867}]', '{\"ip\":\"127.0.0.1\"}'),
('6u5GDISHxS88kCin', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:40', NULL, NULL, '__messages', '1089207A455B4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('74jRIuFLfXAuI7Fw', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 02:48:48', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":817.88446861142,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('7FQf4mflKRXjuUYW', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 02:49:36', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":689.08734602461,\"new_value\":686.45576707724},{\"field_name\":\"total_balance_asset_value\",\"old_value\":689.08734602461,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('7HWSNxCwxi6AvJXw', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 02:49:17', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":270.3471444569,\"new_value\":267.68756998881},{\"field_name\":\"total_balance_asset_value\",\"old_value\":270.3471444569,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('81DWwKiYKNa8cb2J', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'nassim', '2022-09-15 02:49:43', NULL, NULL, '__trades', '101042B2C8E23', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:40\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('8agjUhIYiEK9Ir0D', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-15 02:48:38', NULL, NULL, '__offers', '1041757AC7BCD', NULL, '{\"ip\":\"127.0.0.1\"}'),
('8CtT5FvsCet9Ek3f', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-15 02:48:19', NULL, NULL, '__deposit_tokens', '146984445F424', NULL, '{\"ip\":\"127.0.0.1\"}'),
('8SEGqx65WitHGl0J', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:48:10', NULL, '100778C4620F5', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('8TCwZi9sB9gDsRGT', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-15 02:48:27', NULL, NULL, '__buyer_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('8UJ2CmkG6XQMD8gG', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 02:49:22', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":104.92715332214},{\"field_name\":\"total_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":104.92715332214}]', '{\"ip\":\"127.0.0.1\"}'),
('8vjqDKQdNHuLWKsf', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:10', NULL, NULL, '__messages', '1190937C6C369', NULL, '{\"ip\":\"127.0.0.1\"}'),
('92rq7lYOH05ILbau', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:49:29', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":383.72993333705,\"new_value\":567.94045965284},{\"field_name\":\"total_balance_asset_value\",\"old_value\":383.72993333705,\"new_value\":567.94045965284}]', '{\"ip\":\"127.0.0.1\"}'),
('96UViNZgZQ1ZNGAO', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-15 02:48:27', NULL, NULL, '__seller_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9JCSG6kwBS6HEfhR', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:13', NULL, NULL, '__messages', '182857C0A6313', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9MQkXddCT7XEfMbj', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:47:55', NULL, '143453FE23939', '__users', 'busadmin', NULL, NULL),
('9w3KZJT4Hp18Hu4o', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:20', NULL, NULL, '__messages', '148013F9DEBA0', NULL, '{\"ip\":\"127.0.0.1\"}'),
('A1r4zFF4fosxM5Ku', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:48:22', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":500},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":500}]', '{\"ip\":\"127.0.0.1\"}'),
('A4t8cCIwDgqXWsQB', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:21', NULL, NULL, '__messages', '19053416F8C04', NULL, '{\"ip\":\"127.0.0.1\"}'),
('a9Ok29dFLMUSAnAX', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 02:49:22', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":400,\"new_value\":562.76041666667},{\"field_name\":\"total_balance_asset_value\",\"old_value\":400,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('Abk2sAVV1lLQCFhZ', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 02:47:53', NULL, NULL, '__user_group_memberships', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('acomZoQRtRR7r6JS', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 02:49:47', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":347.86679964539,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('Adgk6btcuVX19JBe', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-15 02:49:38', NULL, NULL, '__buyer_extensions', 'nassim', NULL, '{\"ip\":\"127.0.0.1\"}'),
('aDKv7klhiDHX2bko', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 02:48:35', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":317.77707867,\"new_value\":211.3940999466},{\"field_name\":\"total_balance_asset_value\",\"old_value\":317.77707867,\"new_value\":211.3940999466}]', '{\"ip\":\"127.0.0.1\"}'),
('aHg5xE7Bg4R6iKae', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'nassim', '2022-09-15 02:49:38', NULL, NULL, '__offers', '11974183BF5C5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ak9xWP2sOQBXboVT', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-15 02:48:51', NULL, NULL, '__trades', '18586431C4834', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:48:47\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('aKpeiYCE1kX5tccb', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:48:03', NULL, '11570737CFEEA', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('alemSJkiJHlFwriH', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'lodza', '2022-09-15 02:48:13', NULL, NULL, '__asset_accounts', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('apZ34EUoN6dZNnoM', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:28', NULL, NULL, '__messages', '13583226DB3A3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('AU7Cdb3SPFjlEBge', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:40', NULL, NULL, '__messages', '107985714A624', NULL, '{\"ip\":\"127.0.0.1\"}'),
('b0wU4QwQ7GwwTqWT', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-15 02:48:38', NULL, NULL, '__offers', '1666898BF6D7C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('B8rmwBXWhZA6v8Hw', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:00', NULL, NULL, '__messages', '145892563826C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('bc1TFtY1THEQQFJy', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:48:08', NULL, '105791EB51046', '__notifications', '145980E14251C', NULL, NULL),
('bEKRMIFjFx11EM6Q', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:48:54', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":173.20361754758,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('beVzmCKAubXjsC6x', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:49:38', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('BhWNP9zn5nTmfp7Q', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-15 02:49:21', NULL, NULL, '__trades', '17258581156D8', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:20\"}]', '{\"ip\":\"127.0.0.1\"}'),
('BJKBiNs6VEAJmbyq', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:48:07', NULL, '158259E22E29E', '__notifications', '168438B2E66FC', NULL, NULL),
('BxxokL0wKm6LL5Mc', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'guddaz', '2022-09-15 02:48:30', NULL, NULL, '__trades', '178310629EEDE', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"guddaz\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:48:30\"}]', '{\"ip\":\"127.0.0.1\"}'),
('bye93rA43EfB8tXe', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 02:49:03', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1599.9888017916,\"new_value\":1602.1164613661},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1599.9888017916,\"new_value\":1602.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('bzl8rLMahHEzuJLi', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:00', NULL, NULL, '__messages', '163059184D196', NULL, '{\"ip\":\"127.0.0.1\"}'),
('c4Qum2k43Q2CqOrC', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:48:08', NULL, '105791EB51046', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('C8A8B6RYJWySYldI', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 02:49:35', NULL, NULL, '__asset_accounts', '10', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":105.26315789474,\"new_value\":368.42105263158},{\"field_name\":\"total_balance_asset_value\",\"old_value\":105.26315789474,\"new_value\":368.42105263158}]', '{\"ip\":\"127.0.0.1\"}'),
('caABJd6jCsfueaXt', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:48:07', NULL, '120780B6AC6FA', '__users', 'keith', NULL, NULL),
('Ccu4k3ecQ0ATNRkL', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 02:49:53', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":139.9256231748,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('cCzPXgpc3s7R9hsH', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 02:49:02', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":216.3829787234,\"new_value\":3.61702127659},{\"field_name\":\"total_balance_asset_value\",\"old_value\":216.3829787234,\"new_value\":3.61702127659}]', '{\"ip\":\"127.0.0.1\"}'),
('CDxWhoX32jeNO0my', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:34', NULL, NULL, '__messages', '183761BFF2198', NULL, '{\"ip\":\"127.0.0.1\"}'),
('cF2RR98eogGr5wJJ', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'flint', '2022-09-15 02:49:19', NULL, NULL, '__offers', '11899542F0B80', NULL, '{\"ip\":\"127.0.0.1\"}'),
('cht26WccI1qeRUG8', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-15 02:48:40', NULL, NULL, '__trades', '126238C930390', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:48:40\"}]', '{\"ip\":\"127.0.0.1\"}'),
('CjhGeB7UF6H8m3ry', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:48:09', NULL, '130129DE3F480', '__notifications', '158225D8DBE86', NULL, NULL),
('ClU73yeqqc6pPcW5', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'nassim', '2022-09-15 02:48:25', NULL, NULL, '__deposit_tokens', '1546978C84EDE', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:48:25\"}]', '{\"ip\":\"127.0.0.1\"}'),
('CM0pdwqQtChvNx6r', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 02:49:05', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":748.93617021277,\"new_value\":536.3045912654}]', '{\"ip\":\"127.0.0.1\"}'),
('cQpk3eo6vUZ1DUcn', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'jimmy', '2022-09-15 02:48:22', NULL, NULL, '__asset_accounts', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('CRe7vxLjXUaq36Mq', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 02:48:59', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":216.3829787234,\"new_value\":1.4893617021234}]', '{\"ip\":\"127.0.0.1\"}'),
('cuEHwUgwMTOAEQAT', 'TEST_SESSION', 'Temporarily disabling for test users.', 'entry_update', 'system', '2022-09-15 02:48:03', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for test users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('cYlFoOUoJnUMFwiu', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:48:55', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":500,\"new_value\":1138.2978723404},{\"field_name\":\"total_balance_asset_value\",\"old_value\":500,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('d5fww3CwHiD9hcn7', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'guddaz', '2022-09-15 02:48:29', NULL, NULL, '__trades', '178310629EEDE', NULL, '{\"ip\":\"127.0.0.1\"}'),
('d7VarWTuzyX6VPAR', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 02:49:50', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1615.0050592795,\"new_value\":1617.132718854},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1615.0050592795,\"new_value\":1617.132718854}]', '{\"ip\":\"127.0.0.1\"}'),
('Dc5qYCNrboqcTMuo', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:50', NULL, NULL, '__messages', '100861DAE1638', NULL, '{\"ip\":\"127.0.0.1\"}'),
('degGi7vWxEoSG6cG', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:43', NULL, NULL, '__messages', '193757AEF2A6D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dIr9oLl83iruAiIo', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 02:48:49', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":968.31000052631,\"new_value\":819.37383031354},{\"field_name\":\"total_balance_asset_value\",\"old_value\":968.31000052631,\"new_value\":819.37383031354}]', '{\"ip\":\"127.0.0.1\"}'),
('dqRMQACWSRwm6xTK', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:49:27', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('DtEVl1k9XY7jOn4x', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:46', NULL, NULL, '__messages', '105943A874C6D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dtQTnWk5ioN4YsJV', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:48:06', NULL, '195882938BE80', '__users', 'jimmy', NULL, NULL),
('DUqBN2jB5UDFtGyM', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 02:48:27', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":317.77707867,\"new_value\":210.33027015936}]', '{\"ip\":\"127.0.0.1\"}'),
('dW7w8eJqYu9wL6K3', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'keith', '2022-09-15 02:48:45', NULL, NULL, '__offers', '194475EFD2A43', NULL, '{\"ip\":\"127.0.0.1\"}'),
('DWAyMsdJxm5roWQ7', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:48:57', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":179.58659627098,\"new_value\":173.20361754758},{\"field_name\":\"total_balance_asset_value\",\"old_value\":179.58659627098,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('e3KAKNArggVTRBnb', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:49:29', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1138.2978723404,\"new_value\":954.08734602461},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1138.2978723404,\"new_value\":954.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('e3QIBE9Kb3dZPJdC', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:48:04', NULL, '112866E93E431', '__users', 'lodza', NULL, NULL),
('e4erz1rP9F4hipmN', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:48:10', NULL, '100778C4620F5', '__users', 'nassim', NULL, NULL),
('eFPAWPdyZc1pcWR4', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'lodza', '2022-09-15 02:48:39', NULL, NULL, '__seller_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('EiTMPBDEm7C8NMFg', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:47:55', NULL, '143453FE23939', '__email_addresses', 'busadmin@ankelli.com', NULL, NULL),
('eJxJ7lnTC2klbUod', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:53', NULL, NULL, '__messages', '195410631FEA9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('EnHPuMYJm7cANn5k', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:24', NULL, NULL, '__messages', '1765812CE3E02', NULL, '{\"ip\":\"127.0.0.1\"}'),
('etmYtdKS4uywr4yn', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 02:48:41', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":968.31000052632,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}'),
('EuVayWzKKIHQ8eym', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 02:48:37', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":211.3940999466,\"new_value\":210.33027015937},{\"field_name\":\"total_balance_asset_value\",\"old_value\":211.3940999466,\"new_value\":210.33027015937}]', '{\"ip\":\"127.0.0.1\"}'),
('eYNnv0TpnkHlOYSh', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:47:55', NULL, '143453FE23939', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('EYoux7xv6zu4fhah', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-15 02:49:11', NULL, NULL, '__trades', '132288FB7E525', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:07\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('F7iVFSIzcaEoNKQO', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 02:48:42', NULL, NULL, '__asset_accounts', '10', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":105.26315789474},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":105.26315789474}]', '{\"ip\":\"127.0.0.1\"}'),
('f94F5gZj3EUbGSRl', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 02:49:54', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":347.86679964539,\"new_value\":141.98444670421},{\"field_name\":\"total_balance_asset_value\",\"old_value\":347.86679964539,\"new_value\":141.98444670421}]', '{\"ip\":\"127.0.0.1\"}'),
('FaOoKG8H1GLfhwep', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-15 02:47:55', NULL, NULL, '__buyer_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('FdOOsjOYHSHHduaB', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:30', NULL, NULL, '__messages', '19272863AF3DB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Fjew7TC2hOGZUSii', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-15 02:48:47', NULL, NULL, '__trades', '18586431C4834', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:48:47\"}]', '{\"ip\":\"127.0.0.1\"}'),
('FJwkC8v1FsJSxKqC', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:47', NULL, NULL, '__messages', '1598910FAB66F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('FPbkxiQ8C0ociwIt', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-15 02:49:25', NULL, NULL, '__seller_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fqVHJ1K1Lls9kXZJ', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'flint', '2022-09-15 02:49:45', NULL, NULL, '__seller_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fr2kMWcEaWcBVKZ0', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 02:49:41', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":484.208576066},{\"field_name\":\"total_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":484.208576066}]', '{\"ip\":\"127.0.0.1\"}'),
('FSvF3GGdBSKyT6Yh', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:47:53', NULL, '13559325074D2', '__notifications', '1621890CFBEDC', NULL, NULL),
('G2W0Ig2dO9kLSo7R', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 02:49:51', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":347.86679964539,\"new_value\":139.9256231748}]', '{\"ip\":\"127.0.0.1\"}'),
('GFTekGOhXS0Ld9QA', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 02:49:56', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1617.132718854,\"new_value\":1619.1915423834},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1617.132718854,\"new_value\":1619.1915423834}]', '{\"ip\":\"127.0.0.1\"}'),
('GKgvGY8BD248SB8D', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-15 02:49:25', NULL, NULL, '__offers', '1291743F7603B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('gLivuLPqxzBNPXjK', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-15 02:47:56', NULL, NULL, '__buyer_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('gmlh0r9UC72Tv7UZ', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 02:49:17', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1604.221724524,\"new_value\":1606.8812989921},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1604.221724524,\"new_value\":1606.8812989921}]', '{\"ip\":\"127.0.0.1\"}'),
('gPfbbONzytunb1np', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:48:13', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":967.86579},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":967.86579}]', '{\"ip\":\"127.0.0.1\"}'),
('GQ6sNplXJe1FeRmv', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:49:09', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":748.93617021277,\"new_value\":538.4098544233},{\"field_name\":\"total_balance_asset_value\",\"old_value\":748.93617021277,\"new_value\":538.4098544233}]', '{\"ip\":\"127.0.0.1\"}'),
('Gr3eVFlBWq0ETG3B', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:48:07', NULL, '120780B6AC6FA', '__email_addresses', 'keith@example.com', NULL, NULL),
('GscS0Ub3rja4SV72', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:39', NULL, NULL, '__messages', '11223609ADB4D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GSHgcutTLKJDusMo', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-15 02:48:03', NULL, NULL, '__admin_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GXRpMjTLjypAKjBP', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'guddaz', '2022-09-15 02:48:11', NULL, NULL, '__asset_accounts', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('H7sK34DpQxYvnmM1', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:46', NULL, NULL, '__messages', '128433A32BC6B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hCKl6FUdVbWKI8XM', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:48:09', NULL, '1404072D5F14A', '__users', 'raymond', NULL, NULL),
('hgJjzgn7hYaZOYn0', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'jimmy', '2022-09-15 02:48:52', NULL, NULL, '__offers', '138982ABBEFB3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HHa03iWcvdG0OvqU', 'FACTORY_SESSION', 'Addition of _Asset entry to database.', 'entry_create', 'system', '2022-09-15 02:47:52', NULL, NULL, '__assets', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HKQEYQ76A7L9oNWc', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-15 02:49:05', NULL, NULL, '__offers', '152418362B589', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Hl5C1oIvFvnAiRMY', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:47', NULL, NULL, '__messages', '103577DAF4E28', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hOiYtACW3tfgCoMv', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:48:09', NULL, '1404072D5F14A', '__email_addresses', 'raymond@example.com', NULL, NULL),
('hOtuALhEpgsOtTIG', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'peter', '2022-09-15 02:49:16', NULL, NULL, '__asset_accounts', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HqvkD0QegGmo8h4Q', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:54', NULL, NULL, '__messages', '130936A160ADB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HsW19nbs6HUJdxH9', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:30', NULL, NULL, '__messages', '11231543BA54C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ht8iDI9sHNsMSD1W', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 02:49:56', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":141.98444670421,\"new_value\":139.9256231748},{\"field_name\":\"total_balance_asset_value\",\"old_value\":141.98444670421,\"new_value\":139.9256231748}]', '{\"ip\":\"127.0.0.1\"}'),
('hWfCkSuxdbTCQGoo', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'nassim', '2022-09-15 02:48:25', NULL, NULL, '__asset_accounts', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hYRnUA90LWApFX3n', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-15 02:48:29', NULL, NULL, '__messages', '1172611DF598E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HZO0dId4nuMWeJyu', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:48:07', NULL, '158259E22E29E', '__users', 'peter', NULL, NULL),
('iAkENAtLsBbWhPkB', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:56', NULL, NULL, '__messages', '16775213A39B8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ieMh8iUJdTqUT6ZQ', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:48:04', NULL, '112866E93E431', '__notifications', '110120055876F', NULL, NULL),
('IgxUWC1yntrUv3OZ', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 02:49:01', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1.4893617021234,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('ihajl9k3ZsRfOyKN', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-15 02:49:05', NULL, NULL, '__buyer_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('in1cUPdE4ZgSrPH3', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 02:49:02', NULL, NULL, '__asset_accounts', '8', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":100,\"new_value\":312.76595744681},{\"field_name\":\"total_balance_asset_value\",\"old_value\":100,\"new_value\":312.76595744681}]', '{\"ip\":\"127.0.0.1\"}'),
('iUVyk8wH7tKCgHJG', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-15 02:48:44', NULL, NULL, '__trades', '126238C930390', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:48:41\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('jfZwTt1QraHUHh7u', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'reserves', '2022-09-15 02:48:10', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":3000},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":3000}]', '{\"ip\":\"127.0.0.1\"}'),
('jM2MTQEBZ6FgYGId', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:48:03', NULL, '11570737CFEEA', '__notifications', '1257606349E60', NULL, NULL),
('JOJCoKjHNgUvfKJB', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-15 02:48:54', NULL, NULL, '__trades', '1799079078FB9', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:48:53\"}]', '{\"ip\":\"127.0.0.1\"}'),
('jpfKPNWnYZ8z3mFo', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-15 02:48:25', NULL, NULL, '__deposit_tokens', '1546978C84EDE', NULL, '{\"ip\":\"127.0.0.1\"}'),
('JsG7NJktLN2oZ6hv', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:49:10', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1602.1164613661,\"new_value\":1604.221724524},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1602.1164613661,\"new_value\":1604.221724524}]', '{\"ip\":\"127.0.0.1\"}'),
('Jv9vw7DXPMjCo7mH', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 02:49:14', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('JXd2iScLHKJmOYW4', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:49:32', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('jXSEVXJB0W7W8IO0', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:48:07', NULL, '158259E22E29E', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('JYWu0GSGBSg6ObTT', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 02:49:19', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":103.29954915548}]', '{\"ip\":\"127.0.0.1\"}'),
('jzUDYRC8ETTrLmJ9', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'peter', '2022-09-15 02:49:51', NULL, NULL, '__offers', '174422E94E778', NULL, '{\"ip\":\"127.0.0.1\"}'),
('K1qSl3uTq4J1Vtte', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'flint', '2022-09-15 02:49:53', NULL, NULL, '__trades', '16590765F22DC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('k5KbwO8gOzkAjjGv', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 02:49:43', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1612.9825873694,\"new_value\":1615.0050592795},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1612.9825873694,\"new_value\":1615.0050592795}]', '{\"ip\":\"127.0.0.1\"}'),
('K9r75phJ2PgZ7EcI', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 02:48:44', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1591.0638297872,\"new_value\":1592.1164613661},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1591.0638297872,\"new_value\":1592.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('kIKvNyFr1cojSzeN', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:47:52', NULL, '174723A5EA4BC', '__users', 'developer', NULL, NULL),
('kiul5SsTKgahfSiY', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:48:07', NULL, '158259E22E29E', '__email_addresses', 'peter@example.com', NULL, NULL),
('kKGp7Selutk0F46O', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'flint', '2022-09-15 02:49:46', NULL, NULL, '__trades', '1064008BAA69F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('kMjoZlpAJEPZz7FZ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-15 02:48:33', NULL, NULL, '__messages', '176769D82ACD9', NULL, '{\"ip\":\"127.0.0.1\"}');
INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('KRXBBuYvnRy8cPdC', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 02:48:37', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1590,\"new_value\":1591.0638297872},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1590,\"new_value\":1591.0638297872}]', '{\"ip\":\"127.0.0.1\"}'),
('ksr0tPxBDX5sYkaU', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 02:49:50', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":349.99445921986,\"new_value\":347.86679964539},{\"field_name\":\"total_balance_asset_value\",\"old_value\":349.99445921986,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('KXwHNUZbjPJMle2n', 'TEST_SESSION', 'Resetting to default value.', 'entry_update', 'peter', '2022-09-15 02:49:57', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Resetting to default value.\"},{\"field_name\":\"value\",\"old_value\":\"0\",\"new_value\":true}]', '{\"ip\":\"127.0.0.1\"}'),
('kYPx9qphN6rlr47U', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'flint', '2022-09-15 02:48:14', NULL, NULL, '__asset_accounts', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('L1V1MRvfmb2p1kyp', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-15 02:49:19', NULL, NULL, '__buyer_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('L20Ro6iQxeqspu9t', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 02:49:45', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":562.76041666667,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('L4ak8pFNrUOBPSjJ', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-15 02:47:56', NULL, NULL, '__seller_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('l93vaqifUkkZQdiT', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'peter', '2022-09-15 02:49:56', NULL, NULL, '__trades', '16590765F22DC', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"peter\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:53\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('LFEmE0spKBhvjVV7', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 02:48:18', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":110},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":110}]', '{\"ip\":\"127.0.0.1\"}'),
('lhMbqHCafUmFoBjU', 'FACTORY_SESSION', 'Addition of _RegToken entry to database.', 'entry_create', 'system', '2022-09-15 02:47:56', NULL, NULL, '__reg_tokens', '1234567890', NULL, '{\"ip\":\"127.0.0.1\"}'),
('LIKWOORC32gnFIFp', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:47:53', NULL, '13559325074D2', '__email_addresses', 'sysadmin@ankelli.com', NULL, NULL),
('liUJr8sEXqjb6zwT', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:47:53', NULL, '13559325074D2', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('LJNa23rwak82KWGW', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:27', NULL, NULL, '__messages', '184621E99C31C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('LlkQsnOMIvMvEHE9', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:49:25', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1138.2978723404,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('lMTD0PePJEtYbtR0', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 02:48:15', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":218.87587867,\"new_value\":317.77707867},{\"field_name\":\"total_balance_asset_value\",\"old_value\":218.87587867,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('lPNKsaXa7ZDsO23F', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-15 02:48:04', NULL, NULL, '__admin_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ls52KIuN2krLE1HE', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-15 02:48:45', NULL, NULL, '__buyer_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('luESq4l0pcoQ2seL', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:48:04', NULL, '112866E93E431', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('lvWc3xjPFL64ODER', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-15 02:47:55', NULL, NULL, '__seller_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('m6WODHno6TqdllHM', 'X1cC8jzm2p8U9SB0', 'User signin.', 'entry_update', 'guddaz', '2022-09-15 03:09:23', NULL, NULL, '__sessions', 'X1cC8jzm2p8U9SB0', '[{\"field_name\":\"_status\",\"old_value\":\"empty\",\"new_value\":\"active\"}]', '{\"ip\":\"127.0.0.1\"}'),
('m7xkeCWfWHmpWnji', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-15 02:49:07', NULL, NULL, '__trades', '132288FB7E525', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:07\"}]', '{\"ip\":\"127.0.0.1\"}'),
('MCA5YrcD9FFUJri7', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-15 02:49:07', NULL, NULL, '__trades', '132288FB7E525', NULL, '{\"ip\":\"127.0.0.1\"}'),
('MCK1JOC1ptaVN3lT', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-15 02:49:33', NULL, NULL, '__trades', '1512132F651FE', NULL, '{\"ip\":\"127.0.0.1\"}'),
('mdGdsn1Nm9ik0n7W', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:50', NULL, NULL, '__messages', '198590AB2E417', NULL, '{\"ip\":\"127.0.0.1\"}'),
('MKf11b1Xg9oLoc8b', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'peter', '2022-09-15 02:49:12', NULL, NULL, '__offers', '163862950C325', NULL, '{\"ip\":\"127.0.0.1\"}'),
('mMB2th5hBUaDWirD', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:47:54', NULL, '190411F3B5852', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('MMg3rjvBdGmJFseI', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:47:55', NULL, '143453FE23939', '__notifications', '1649738107535', NULL, NULL),
('MuGm6NJbcAgvJ3ZE', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:47:54', NULL, '190411F3B5852', '__email_addresses', 'reserves@ankelli.com', NULL, NULL),
('MYo9xt3YdQsF3xA6', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:48:06', NULL, '195882938BE80', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('mZP2LnOYBTs6pWY6', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-15 02:47:54', NULL, NULL, '__buyer_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('mZTqfjZjURsU3rfq', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 02:47:54', NULL, NULL, '__user_group_memberships', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('n2pZcCP6ADwDC5zq', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:48:21', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2290,\"new_value\":1790},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2290,\"new_value\":1790}]', '{\"ip\":\"127.0.0.1\"}'),
('naxv7ntO2OH4rGmi', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 02:48:04', NULL, NULL, '__user_group_memberships', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('NcMGN0jlcPIPh7mn', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-15 02:47:53', NULL, NULL, '__admin_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('nDCLq2k1M6hdHi9y', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 02:49:24', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1606.8812989921,\"new_value\":1608.5089031588},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1606.8812989921,\"new_value\":1608.5089031588}]', '{\"ip\":\"127.0.0.1\"}'),
('NJUaGuuqGxpak7QG', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:44', NULL, NULL, '__messages', '187482F7F03E4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('nX5gvt7HtsMmf59p', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'ross', '2022-09-15 02:48:58', NULL, NULL, '__seller_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('NzhIQIoB4qBLqavT', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-15 02:49:12', NULL, NULL, '__buyer_extensions', 'peter', NULL, '{\"ip\":\"127.0.0.1\"}'),
('OBdbHgYcYGniM7lz', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-15 02:49:44', NULL, NULL, '__offers', '17921490FE63C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('oFC2cEjzK7liUzoA', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:48:57', NULL, NULL, '__trades', '1799079078FB9', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:48:54\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('oftqnYOKMYZfLb6R', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'flint', '2022-09-15 02:49:45', NULL, NULL, '__buyer_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('OFuHC91v7FCFRTg9', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:47', NULL, NULL, '__messages', '1099441D129E3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('oiLd7yIpM7Z1DoUY', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 02:47:53', NULL, NULL, '__user_group_memberships', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('oWL93RGBK1KlK1qF', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:00', NULL, NULL, '__messages', '1067591A7D03D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('OZCceR9dB4EVqHHV', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:33', NULL, NULL, '__messages', '1632005659F3B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('PBAQbPtsJgKcVZDE', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:49:33', NULL, NULL, '__trades', '1512132F651FE', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:33\"}]', '{\"ip\":\"127.0.0.1\"}'),
('peopBKmBLNyDtXPv', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 02:48:05', NULL, NULL, '__user_group_memberships', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('pEpYtTmk63nBp9Cn', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:37', NULL, NULL, '__messages', '171974B719435', NULL, '{\"ip\":\"127.0.0.1\"}'),
('pHY5Qcum2T479anC', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:48:05', NULL, '12754612A3BC1', '__email_addresses', 'ross@example.com', NULL, NULL),
('plNGExA3sGeZ3cvh', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 02:47:54', NULL, NULL, '__user_group_memberships', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('pmClohX0XReKSvRA', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-15 02:49:13', NULL, NULL, '__trades', '124355FDFD1C8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('PsfseClgskFfnYme', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:40', NULL, NULL, '__messages', '103673CE2CB81', NULL, '{\"ip\":\"127.0.0.1\"}'),
('pT2u2ogdZ3PajKd9', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:48:09', NULL, '1404072D5F14A', '__notifications', '1068673A7B2E7', NULL, NULL),
('q6qTWF92FSZMNzW1', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:07', NULL, NULL, '__messages', '145111E4841E9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('QBDw0K4XZJLF1p12', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 02:49:42', NULL, NULL, '__asset_accounts', '9', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":100,\"new_value\":302.24719101124},{\"field_name\":\"total_balance_asset_value\",\"old_value\":100,\"new_value\":302.24719101124}]', '{\"ip\":\"127.0.0.1\"}'),
('QHkGmQk9cP49LXL8', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:54', NULL, NULL, '__messages', '120403A600F0D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qjXx2uhUPpGk0X01', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:49:30', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":954.08734602461,\"new_value\":952.24524076145},{\"field_name\":\"total_balance_asset_value\",\"old_value\":954.08734602461,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('qK1KpjxuJjbj2wdJ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:14', NULL, NULL, '__messages', '1094972170A05', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qMA4orcrNX59OeDK', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-15 02:49:39', NULL, NULL, '__trades', '101042B2C8E23', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qnf7JTPW2tNQG5qn', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 02:49:15', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":536.30459126541,\"new_value\":270.3471444569},{\"field_name\":\"total_balance_asset_value\",\"old_value\":536.30459126541,\"new_value\":270.3471444569}]', '{\"ip\":\"127.0.0.1\"}'),
('QNmShs8H62suAA3k', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-15 02:47:55', NULL, NULL, '__admin_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('QoecyNUhOQ71EoYe', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:17', NULL, NULL, '__messages', '177247F01F74A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qvxh7yKYyX1EPygt', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:53', NULL, NULL, '__messages', '153543703720A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('R3rPvzlwAFp0DWQY', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 02:48:42', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1074.62579,\"new_value\":969.36263210526},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1074.62579,\"new_value\":969.36263210526}]', '{\"ip\":\"127.0.0.1\"}'),
('R6qNHt7UboZslxOW', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:47:54', NULL, '190411F3B5852', '__users', 'reserves', NULL, NULL),
('r7h5Fia6YrImvWTv', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-15 02:48:40', NULL, NULL, '__trades', '126238C930390', NULL, '{\"ip\":\"127.0.0.1\"}'),
('raEaP363x3oQQjCx', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:47:52', NULL, '174723A5EA4BC', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('rgoOM0gpu4lKKpmL', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-15 02:48:37', NULL, NULL, '__trades', '178310629EEDE', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:48:34\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('RGRvVYZAci8Q204a', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 02:48:24', NULL, NULL, '__asset_accounts', '8', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":100},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('RiMqrNrFsrZrjGll', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:49:09', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":173.20361754758,\"new_value\":383.72993333705},{\"field_name\":\"total_balance_asset_value\",\"old_value\":173.20361754758,\"new_value\":383.72993333705}]', '{\"ip\":\"127.0.0.1\"}'),
('RJ6oZ3NDiQOyBOPH', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 02:48:49', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":600,\"new_value\":748.93617021277},{\"field_name\":\"total_balance_asset_value\",\"old_value\":600,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('RqKR7s2pXQdCnneM', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:48:03', NULL, '11570737CFEEA', '__users', 'guddaz', NULL, NULL),
('rvbSHbVo28BOsOua', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:48:05', NULL, '12754612A3BC1', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('RVC0LZIe9bI7CtSx', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:57', NULL, NULL, '__messages', '1037696FDEE95', NULL, '{\"ip\":\"127.0.0.1\"}'),
('rZNsKXAdANhbaN2p', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:27', NULL, NULL, '__messages', '149756DD177DF', NULL, '{\"ip\":\"127.0.0.1\"}'),
('s0uoKHTYLWeEdUNb', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 02:48:05', NULL, NULL, '__user_group_memberships', '12', NULL, '{\"ip\":\"127.0.0.1\"}'),
('S5IduFrdRd3V2fAq', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'ross', '2022-09-15 02:49:00', NULL, NULL, '__trades', '1220018BA42EA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('SB0EVycSFCYvA9Mf', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:47:52', NULL, '174723A5EA4BC', '__notifications', '1754209D6830C', NULL, NULL),
('SDqgbSkOqYn6PSDl', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-15 02:49:14', NULL, NULL, '__trades', '124355FDFD1C8', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:13\"}]', '{\"ip\":\"127.0.0.1\"}'),
('slstzdweNhuT2ixF', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 02:48:23', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1790,\"new_value\":1690},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1790,\"new_value\":1690}]', '{\"ip\":\"127.0.0.1\"}'),
('SMF7iJOSsoQbt2Op', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 02:48:19', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2890,\"new_value\":2290},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2890,\"new_value\":2290}]', '{\"ip\":\"127.0.0.1\"}'),
('SN7RXzB5nSJhHJT6', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'ross', '2022-09-15 02:48:59', NULL, NULL, '__buyer_extensions', 'clarence', NULL, '{\"ip\":\"127.0.0.1\"}'),
('snugo2N43O4fD9m2', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-15 02:48:23', NULL, NULL, '__deposit_tokens', '1998972B3E336', NULL, '{\"ip\":\"127.0.0.1\"}'),
('SNzFlj008bMKq97r', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-15 02:49:20', NULL, NULL, '__trades', '17258581156D8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('szpfEwGCqdg2pxPg', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-15 02:49:24', NULL, NULL, '__trades', '17258581156D8', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:21\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('T2OeEhQ5KKfWexwQ', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:49:40', NULL, NULL, '__trades', '101042B2C8E23', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:39\"}]', '{\"ip\":\"127.0.0.1\"}'),
('T6lVvrTjPt3iPpx6', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-15 02:48:18', NULL, NULL, '__deposit_tokens', '1750401D08499', NULL, '{\"ip\":\"127.0.0.1\"}'),
('t7HCZCwtZj4uNLD6', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:07', NULL, NULL, '__messages', '122948B2CD9D6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TAWTx83vrrStxHtO', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-15 02:49:30', NULL, NULL, '__trades', '165028D8EF243', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:27\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('tC9cYsTE1Sn2Ji5l', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:48:04', NULL, '112866E93E431', '__email_addresses', 'lodza@example.com', NULL, NULL),
('tcH0H44k6WhWui0J', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-15 02:48:47', NULL, NULL, '__trades', '18586431C4834', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Tcr8DHM46xrHXMlW', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 02:49:48', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":210.33027015937,\"new_value\":423.09622760618},{\"field_name\":\"total_balance_asset_value\",\"old_value\":210.33027015937,\"new_value\":423.09622760618}]', '{\"ip\":\"127.0.0.1\"}'),
('TCVBR4D997UbCbFc', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:49:27', NULL, NULL, '__trades', '165028D8EF243', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:27\"}]', '{\"ip\":\"127.0.0.1\"}'),
('tDEBd6gap3YcyV0Z', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 02:48:18', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":3000,\"new_value\":2890},{\"field_name\":\"total_balance_asset_value\",\"old_value\":3000,\"new_value\":2890}]', '{\"ip\":\"127.0.0.1\"}'),
('tjVum49to7DbXRwO', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:48:05', NULL, '12754612A3BC1', '__users', 'ross', NULL, NULL),
('TlnTaomQHIqJ06cH', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:07', NULL, NULL, '__messages', '187687052BA6A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TMzTqPiBDMAF6hgs', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-15 02:47:54', NULL, NULL, '__seller_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('tnBswV8ACuhDLSkj', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 02:49:16', NULL, NULL, '__asset_accounts', '11', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":265.95744680851},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":265.95744680851}]', '{\"ip\":\"127.0.0.1\"}'),
('tq6Yp98Ep0BrUukn', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:47:52', NULL, '174723A5EA4BC', '__email_addresses', 'developer.ankelli@gmail.com', NULL, NULL),
('tuch0LeKMGLVJEOA', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'keith', '2022-09-15 02:49:05', NULL, NULL, '__seller_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('tvUZ5pBG8JeRsOa9', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:48:06', NULL, '195882938BE80', '__email_addresses', 'jimmy@example.com', NULL, NULL),
('tYiiYNT4Cqq0pLdA', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-15 02:48:31', NULL, NULL, '__messages', '1612819FEBF43', NULL, '{\"ip\":\"127.0.0.1\"}'),
('u060gGcc1eudwIYe', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:48:10', NULL, '100778C4620F5', '__notifications', '147159098A907', NULL, NULL),
('U1clCqt5jsofvMls', 'X1cC8jzm2p8U9SB0', 'Addition of _Session entry to database.', 'entry_create', NULL, '2022-09-15 03:09:21', '+02:00', NULL, '__sessions', 'X1cC8jzm2p8U9SB0', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UlaoNrZy1OB4fSPX', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 02:48:14', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":400},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":400}]', '{\"ip\":\"127.0.0.1\"}'),
('uNpQZH97yhCQ4vZ8', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-15 02:48:39', NULL, NULL, '__buyer_extensions', 'raymond', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UoDnazrTOvTLwAew', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:53', NULL, NULL, '__messages', '16990798F1666', NULL, '{\"ip\":\"127.0.0.1\"}'),
('uPhOpW1HQtY6iLiM', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:27', NULL, NULL, '__messages', '1161717D33D3C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('uSRJ3gUDlvspVDii', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:48:46', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":968.31000052631,\"new_value\":817.88446861142}]', '{\"ip\":\"127.0.0.1\"}'),
('uxcVrgUkxUh0xTFq', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 02:48:25', NULL, NULL, '__asset_accounts', '9', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":100},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('v1YCPVkdIrHvPezz', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:34', NULL, NULL, '__messages', '121462D02A584', NULL, '{\"ip\":\"127.0.0.1\"}'),
('V6aI94wLtLTH6Pzn', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'keith', '2022-09-15 02:48:20', NULL, NULL, '__asset_accounts', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('VB64HLoL7Dku802A', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 02:49:43', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":484.208576066,\"new_value\":482.18610415589},{\"field_name\":\"total_balance_asset_value\",\"old_value\":484.208576066,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('VoZz4GiHwBlsIJOD', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'ross', '2022-09-15 02:48:27', NULL, NULL, '__offers', '187401C5ED795', NULL, '{\"ip\":\"127.0.0.1\"}'),
('VRweddguK9YyvRHd', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 02:49:36', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1610.351008422,\"new_value\":1612.9825873694},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1610.351008422,\"new_value\":1612.9825873694}]', '{\"ip\":\"127.0.0.1\"}'),
('VVyacFtm3alwrU6c', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'jimmy', '2022-09-15 02:48:22', NULL, NULL, '__deposit_tokens', '1471738093C20', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:48:21\"}]', '{\"ip\":\"127.0.0.1\"}'),
('vWJZRQkxbkityxun', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 02:47:55', NULL, NULL, '__user_group_memberships', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('w7IfmegmWB9M7qJe', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 02:48:20', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":600},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":600}]', '{\"ip\":\"127.0.0.1\"}'),
('WbDmamXmrMgvB9L3', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:48:07', NULL, '120780B6AC6FA', '__notifications', '120590A605B75', NULL, NULL),
('wCb8DyHts3nCz41g', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:48:05', NULL, '12754612A3BC1', '__notifications', '126642A885C81', NULL, NULL),
('Wd4HM27a3SDBwJ1W', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:14', NULL, NULL, '__messages', '171889D010484', NULL, '{\"ip\":\"127.0.0.1\"}'),
('wec6DlfuCjpGKchN', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 02:48:05', NULL, NULL, '__user_group_memberships', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('wIhFKCtqUdbPHvli', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:52', NULL, NULL, '__messages', '17633858B191A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('wJ0ZxPMhByZSYHc0', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:48:08', NULL, '105791EB51046', '__users', 'flint', NULL, NULL),
('wL1m1oTv1WsgY7y2', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-15 02:48:21', NULL, NULL, '__deposit_tokens', '1471738093C20', NULL, '{\"ip\":\"127.0.0.1\"}'),
('wl2AwepmT8vjjBhW', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'clarence', '2022-09-15 02:48:24', NULL, NULL, '__deposit_tokens', '1998972B3E336', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:48:23\"}]', '{\"ip\":\"127.0.0.1\"}'),
('wtnSkld6PL9wZMaf', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 02:49:34', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('WXi2aLV9BSx6G3XV', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'clarence', '2022-09-15 02:48:58', NULL, NULL, '__offers', '189776F902B2E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('X0b1gPSxyN0gRXnz', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'peter', '2022-09-15 02:49:17', NULL, NULL, '__trades', '124355FDFD1C8', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"peter\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:14\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('x0r8mH2W4zVS5g13', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 02:49:35', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":689.08734602461},{\"field_name\":\"total_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":689.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('x5UsPnIgpRcVzaJz', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:40', NULL, NULL, '__messages', '1761932D0124E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XaQIdDYdSj0iabzs', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:47:53', NULL, '13559325074D2', '__users', 'sysadmin', NULL, NULL),
('Xbs48mv02MyLEKbC', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'clarence', '2022-09-15 02:48:23', NULL, NULL, '__asset_accounts', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XDlbRmhbeitu3tmB', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 02:48:08', NULL, '130129DE3F480', '__users', 'clarence', NULL, NULL),
('XmUekhMNpwGUYfVt', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:20', NULL, NULL, '__messages', '1291178EF9580', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XmYQu5GqC5mnkaEW', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 02:48:50', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1592.1164613661,\"new_value\":1593.6058230682},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1592.1164613661,\"new_value\":1593.6058230682}]', '{\"ip\":\"127.0.0.1\"}'),
('xOx3AqRwTfvlZygI', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 02:49:40', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":482.18610415589,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('xpL6aCFJOnUw1n5m', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 02:47:54', NULL, '190411F3B5852', '__notifications', '1461176B13837', NULL, NULL),
('XtgWnXMn3RDTnTJ3', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:33', NULL, NULL, '__messages', '113207F42455D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XVAqX4eix2Gs0KxV', 'FACTORY_SESSION', 'Temporarily disabling for factory users.', 'entry_update', 'system', '2022-09-15 02:47:52', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for factory users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('xXZsDKACtDsAqMk6', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 02:49:12', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":536.30459126541,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('Y4CYouVBhBhJpYDn', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-15 02:48:32', NULL, NULL, '__messages', '165143F45D4DD', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Y4DiWhlQtrDEdoK9', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-15 02:49:27', NULL, NULL, '__trades', '165028D8EF243', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Y62KmgYsbo1yvmsu', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:49:04', NULL, NULL, '__messages', '1053773B45F82', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Y9wr8KbcNPWfbZHj', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:48:06', NULL, '120780B6AC6FA', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('YaFTUawZToX235mC', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-15 02:47:53', NULL, NULL, '__admin_extensions', 'developer', NULL, '{\"ip\":\"127.0.0.1\"}'),
('YaPUc2Sf16MwIAVK', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 02:48:39', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1074.62579,\"new_value\":968.31000052632}]', '{\"ip\":\"127.0.0.1\"}'),
('yjvy0gTfzcyrKkYl', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:48:09', NULL, '130129DE3F480', '__email_addresses', 'clarence@example.com', NULL, NULL),
('ykIyYUcDIIyLdSlA', 'FACTORY_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'system', '2022-09-15 02:47:54', NULL, NULL, '__asset_accounts', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('yoFC7IAjWA20NDBF', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 02:47:55', NULL, NULL, '__user_group_memberships', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('YQNp7AqzZKAWbU9i', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 02:48:47', NULL, NULL, '__messages', '178691709E131', NULL, '{\"ip\":\"127.0.0.1\"}'),
('yRVYODW6GHCFltZ9', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:48:08', NULL, '105791EB51046', '__email_addresses', 'flint@example.com', NULL, NULL),
('YxxicavoP5f0dMaN', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 02:48:10', NULL, '100778C4620F5', '__email_addresses', 'nassim@example.com', NULL, NULL),
('za8hWDN7dOtGJctM', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 02:48:50', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":819.37383031354,\"new_value\":817.88446861141},{\"field_name\":\"total_balance_asset_value\",\"old_value\":819.37383031354,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('ziDHbs1jPeNtegLG', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:48:08', NULL, '130129DE3F480', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('ZLGSYn4xhtJhWt3v', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 02:48:09', NULL, '1404072D5F14A', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('zmJdqlo5afdcpVgu', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'ross', '2022-09-15 02:48:18', NULL, NULL, '__deposit_tokens', '1750401D08499', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:48:18\"}]', '{\"ip\":\"127.0.0.1\"}'),
('zmk9v4C8TMSxaa7Z', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-15 02:48:53', NULL, NULL, '__trades', '1799079078FB9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ZqvdEDKzppEMIZbC', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-15 02:49:00', NULL, NULL, '__trades', '1220018BA42EA', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 04:49:00\"}]', '{\"ip\":\"127.0.0.1\"}'),
('zRtdXLtuTqLBgdWT', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 02:48:25', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1690,\"new_value\":1590},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1690,\"new_value\":1590}]', '{\"ip\":\"127.0.0.1\"}');

-- --------------------------------------------------------

--
-- Table structure for table `__messages`
--

CREATE TABLE `__messages` (
  `id` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_table` enum('__chats','__trades') COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_uid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__messages`
--

INSERT INTO `__messages` (`id`, `parent_table`, `parent_uid`, `body`, `creator_username`, `created_datetime`, `read_datetime`) VALUES
('100861DAE1638', '__trades', '1064008BAA69F', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 02:49:50', NULL),
('103577DAF4E28', '__trades', '1064008BAA69F', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 02:49:47', NULL),
('103673CE2CB81', '__trades', '126238C930390', 'Asset buyer just declared their payment.', 'system', '2022-09-15 02:48:40', NULL),
('1037696FDEE95', '__trades', '1799079078FB9', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 02:48:57', NULL),
('1053773B45F82', '__trades', '1220018BA42EA', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 02:49:03', NULL),
('105943A874C6D', '__trades', '1064008BAA69F', 'Asset buyer just declared their payment.', 'system', '2022-09-15 02:49:46', NULL),
('1067591A7D03D', '__trades', '1220018BA42EA', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 02:49:00', NULL),
('107985714A624', '__trades', '126238C930390', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 02:48:40', NULL),
('1089207A455B4', '__trades', '101042B2C8E23', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 02:49:40', NULL),
('1094972170A05', '__trades', '124355FDFD1C8', 'Asset buyer just declared their payment.', 'system', '2022-09-15 02:49:13', NULL),
('1099441D129E3', '__trades', '18586431C4834', 'Asset buyer just declared their payment.', 'system', '2022-09-15 02:48:47', NULL),
('11223609ADB4D', '__trades', '101042B2C8E23', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 02:49:39', NULL),
('11231543BA54C', '__trades', '165028D8EF243', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 02:49:30', NULL),
('113207F42455D', '__trades', '1512132F651FE', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 02:49:33', NULL),
('1161717D33D3C', '__trades', '165028D8EF243', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 02:49:26', NULL),
('1172611DF598E', '__trades', '178310629EEDE', 'I\'m sending the cash in a couple of minutes.', 'guddaz', '2022-09-15 02:48:29', NULL),
('1190937C6C369', '__trades', '132288FB7E525', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 02:49:10', NULL),
('120403A600F0D', '__trades', '1799079078FB9', 'Asset buyer just declared their payment.', 'system', '2022-09-15 02:48:53', NULL),
('121462D02A584', '__trades', '1512132F651FE', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 02:49:33', NULL),
('122948B2CD9D6', '__trades', '132288FB7E525', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 02:49:06', NULL),
('128433A32BC6B', '__trades', '1064008BAA69F', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 02:49:46', NULL),
('1291178EF9580', '__trades', '17258581156D8', 'Asset buyer just declared their payment.', 'system', '2022-09-15 02:49:20', NULL),
('130936A160ADB', '__trades', '1799079078FB9', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 02:48:54', NULL),
('132009ABE5037', '__trades', '178310629EEDE', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 02:48:37', NULL),
('13583226DB3A3', '__trades', '178310629EEDE', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 02:48:28', NULL),
('145111E4841E9', '__trades', '132288FB7E525', 'Asset buyer just declared their payment.', 'system', '2022-09-15 02:49:07', NULL),
('145892563826C', '__trades', '1220018BA42EA', 'Asset buyer just declared their payment.', 'system', '2022-09-15 02:49:00', NULL),
('148013F9DEBA0', '__trades', '17258581156D8', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 02:49:20', NULL),
('149756DD177DF', '__trades', '165028D8EF243', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 02:49:27', NULL),
('153543703720A', '__trades', '16590765F22DC', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 02:49:53', NULL),
('1598910FAB66F', '__trades', '18586431C4834', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 02:48:47', NULL),
('1612819FEBF43', '__trades', '178310629EEDE', 'I\'ve sent the cash.\nPlease confirm receiving it.', 'guddaz', '2022-09-15 02:48:31', NULL),
('163059184D196', '__trades', '1220018BA42EA', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 02:49:00', NULL),
('1632005659F3B', '__trades', '1512132F651FE', 'Asset buyer just declared their payment.', 'system', '2022-09-15 02:49:33', NULL),
('164736AC248CC', '__trades', '126238C930390', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 02:48:41', NULL),
('165143F45D4DD', '__trades', '178310629EEDE', 'I\'ve collected the money.', 'ross', '2022-09-15 02:48:32', NULL),
('16775213A39B8', '__trades', '16590765F22DC', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 02:49:56', NULL),
('16990798F1666', '__trades', '1799079078FB9', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 02:48:53', NULL),
('171889D010484', '__trades', '124355FDFD1C8', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 02:49:14', NULL),
('171974B719435', '__trades', '1512132F651FE', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 02:49:36', NULL),
('1761932D0124E', '__trades', '101042B2C8E23', 'Asset buyer just declared their payment.', 'system', '2022-09-15 02:49:39', NULL),
('17633858B191A', '__trades', '16590765F22DC', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 02:49:52', NULL),
('1765812CE3E02', '__trades', '17258581156D8', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 02:49:24', NULL),
('176769D82ACD9', '__trades', '178310629EEDE', 'Pleasure doing business with you.', 'ross', '2022-09-15 02:48:33', NULL),
('177247F01F74A', '__trades', '124355FDFD1C8', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 02:49:17', NULL),
('178691709E131', '__trades', '18586431C4834', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 02:48:47', NULL),
('182857C0A6313', '__trades', '124355FDFD1C8', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 02:49:13', NULL),
('183761BFF2198', '__trades', '178310629EEDE', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 02:48:34', NULL),
('184621E99C31C', '__trades', '165028D8EF243', 'Asset buyer just declared their payment.', 'system', '2022-09-15 02:49:27', NULL),
('187482F7F03E4', '__trades', '126238C930390', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 02:48:44', NULL),
('187687052BA6A', '__trades', '132288FB7E525', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 02:49:07', NULL),
('19053416F8C04', '__trades', '17258581156D8', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 02:49:21', NULL),
('19272863AF3DB', '__trades', '178310629EEDE', 'Asset buyer just declared their payment.', 'system', '2022-09-15 02:48:30', NULL),
('193757AEF2A6D', '__trades', '101042B2C8E23', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 02:49:43', NULL),
('195410631FEA9', '__trades', '16590765F22DC', 'Asset buyer just declared their payment.', 'system', '2022-09-15 02:49:53', NULL),
('198590AB2E417', '__trades', '18586431C4834', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 02:48:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__notifications`
--

CREATE TABLE `__notifications` (
  `id` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__notifications`
--

INSERT INTO `__notifications` (`id`, `user_username`, `content`, `created_datetime`, `read_datetime`) VALUES
('1068673A7B2E7', 'raymond', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:48:09', NULL),
('110120055876F', 'lodza', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:48:04', NULL),
('120590A605B75', 'keith', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:48:07', NULL),
('1257606349E60', 'guddaz', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:48:03', NULL),
('126642A885C81', 'ross', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:48:05', NULL),
('145980E14251C', 'flint', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:48:08', NULL),
('1461176B13837', 'reserves', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:47:54', NULL),
('147159098A907', 'nassim', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:48:10', NULL),
('14856923A749F', 'jimmy', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:48:06', NULL),
('158225D8DBE86', 'clarence', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:48:09', NULL),
('1621890CFBEDC', 'sysadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:47:53', NULL),
('1649738107535', 'busadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:47:55', NULL),
('168438B2E66FC', 'peter', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:48:07', NULL),
('1754209D6830C', 'developer', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 02:47:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__offers`
--

CREATE TABLE `__offers` (
  `ref_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_to` enum('buy','sell') COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_price` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_purchase_amount` bigint(20) UNSIGNED DEFAULT NULL,
  `max_purchase_amount` bigint(20) UNSIGNED DEFAULT NULL,
  `min_sell_value` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_sell_value` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pymt_method_slug` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pymt_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_status` enum('online','offline') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'online',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__offers`
--

INSERT INTO `__offers` (`ref_code`, `country_name`, `location`, `offer_to`, `asset_code`, `currency_code`, `offer_price`, `min_purchase_amount`, `max_purchase_amount`, `min_sell_value`, `max_sell_value`, `pymt_method_slug`, `pymt_details`, `note`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
('1041757AC7BCD', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.95', 100, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', NULL, 'online', 'raymond', '2022-09-15 02:48:38', '2022-09-15 02:48:38', NULL),
('11899542F0B80', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.36', 1500, 2500, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'flint', '2022-09-15 02:49:19', '2022-09-15 02:49:19', NULL),
('11974183BF5C5', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '178', 10000, 40000, NULL, NULL, 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', NULL, 'online', 'nassim', '2022-09-15 02:49:38', '2022-09-15 02:49:38', NULL),
('1291743F7603B', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.2', 700, 3000, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'lodza', '2022-09-15 02:49:25', '2022-09-15 02:49:25', NULL),
('138982ABBEFB3', 'Zambia', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', NULL, 'online', 'jimmy', '2022-09-15 02:48:52', '2022-09-15 02:48:52', NULL),
('152418362B589', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '13.3', 2800, 14000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'lodza', '2022-09-15 02:49:05', '2022-09-15 02:49:05', NULL),
('163862950C325', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 200, 300, NULL, NULL, 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', NULL, 'online', 'peter', '2022-09-15 02:49:12', '2022-09-15 02:49:12', NULL),
('16454950CF7F1', 'Italy', NULL, 'buy', 'USDT', 'EUR', '0.76', 200, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', NULL, 'online', 'raymond', '2022-09-15 02:49:31', '2022-09-15 02:49:31', NULL),
('1666898BF6D7C', 'Zimbabwe', 'Norton', 'sell', 'USDT', 'USD', '1.04', NULL, NULL, '50', '200', 'cash_in_person', NULL, NULL, 'online', 'guddaz', '2022-09-15 02:48:38', '2022-09-15 02:48:38', NULL),
('174422E94E778', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '170', 20000, 40000, NULL, NULL, 'algerie_poste', '{\"account_holder_name\":\"Timothy Tambo\",\"account_number\":\"22558678\",\"account_key\":\"87\"}', NULL, 'online', 'peter', '2022-09-15 02:49:51', '2022-09-15 02:49:51', NULL),
('17921490FE63C', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '0.94', 100, 200, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'guddaz', '2022-09-15 02:49:44', '2022-09-15 02:49:44', NULL),
('187401C5ED795', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'ross', '2022-09-15 02:48:27', '2022-09-15 02:48:27', NULL),
('189776F902B2E', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'clarence', '2022-09-15 02:48:58', '2022-09-15 02:48:58', NULL),
('194475EFD2A43', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', NULL, 'online', 'keith', '2022-09-15 02:48:45', '2022-09-15 02:48:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__permissions`
--

CREATE TABLE `__permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('active','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__permissions`
--

INSERT INTO `__permissions` (`id`, `name`, `slug`, `description`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
(1, 'Update system config params', 'update_sysconfig_params', 'Permission holder can update system config params.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(2, 'Handle feedback reports', 'handle_feedback_reports', 'Permission holder can handle feedback reports.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(3, 'Manage datalists', 'manage_datalists', 'Permission holder can manage datalists.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(4, 'Manage system tools', 'manage_systools', 'Permission holder can manage system tools.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(5, 'View all logs', 'view_all_logs', 'Permission holder can view all logs.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(6, 'View all transactions', 'view_all_transactions', 'Permission holder can view all transactions.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(7, 'Manage Deposit Tokens', 'manage_deposit_tokens', 'Permission holder can create and edit deposit tokens.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(8, 'Handle Withdrawals', 'handle_withdrawals', 'Permission holder can handle withdrawals.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(9, 'Manage Registration Tokens', 'manage_reg_tokens', 'Permission holder can create and edit registration tokens.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(10, 'Handle flagged users', 'handle_flagged_users', 'Permission holder can handle flagged Users.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(11, 'Handle customer service chats', 'handle_customer_service_chats', 'Permission holder can handle customer service chats.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(12, 'Manage update posts', 'manage_update_posts', 'Permission holder can handle posting and editing update posts.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(13, 'Handle flagged business elems', 'handle_flagged_business_elems', 'Permission holder can handle flagged business elems (Offers, Trades, etc).', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__permission_instances`
--

CREATE TABLE `__permission_instances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_table` enum('__users','__user_groups') COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_uid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_slug` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('active','revoked') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__permission_instances`
--

INSERT INTO `__permission_instances` (`id`, `parent_table`, `parent_uid`, `permission_slug`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`) VALUES
(1, '__user_groups', 'system_administrators', 'update_sysconfig_params', 'active', 'system', '2022-09-15 04:47:49', NULL),
(2, '__user_groups', 'system_administrators', 'handle_feedback_reports', 'active', 'system', '2022-09-15 04:47:49', NULL),
(3, '__user_groups', 'system_administrators', 'manage_systools', 'active', 'system', '2022-09-15 04:47:49', NULL),
(4, '__user_groups', 'system_administrators', 'manage_datalists', 'active', 'system', '2022-09-15 04:47:49', NULL),
(5, '__user_groups', 'system_administrators', 'view_all_logs', 'active', 'system', '2022-09-15 04:47:49', NULL),
(6, '__user_groups', 'business_administrators', 'view_all_transactions', 'active', 'system', '2022-09-15 04:47:49', NULL),
(7, '__user_groups', 'business_administrators', 'manage_deposit_tokens', 'active', 'system', '2022-09-15 04:47:49', NULL),
(8, '__user_groups', 'business_administrators', 'handle_withdrawals', 'active', 'system', '2022-09-15 04:47:49', NULL),
(9, '__user_groups', 'user_administrators', 'manage_reg_tokens', 'active', 'system', '2022-09-15 04:47:49', NULL),
(10, '__user_groups', 'user_administrators', 'handle_flagged_users', 'active', 'system', '2022-09-15 04:47:49', NULL),
(11, '__user_groups', 'platform_moderators', 'handle_customer_service_chats', 'active', 'system', '2022-09-15 04:47:49', NULL),
(12, '__user_groups', 'platform_moderators', 'handle_flagged_business_elems', 'active', 'system', '2022-09-15 04:47:49', NULL),
(13, '__user_groups', 'platform_moderators', 'manage_update_posts', 'active', 'system', '2022-09-15 04:47:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__phone_nos`
--

CREATE TABLE `__phone_nos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_table` enum('__users') COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_uid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_calling_code` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` enum('whatsapp','calls','calls_or_whatsapp') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'calls_or_whatsapp',
  `verified_datetime` timestamp NULL DEFAULT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `__pinnings`
--

CREATE TABLE `__pinnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_table` enum('__users','__offers') COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_uid` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinning_type` enum('favourite','blocking') COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `__posts`
--

CREATE TABLE `__posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exerpt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('visible','hidden') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'visible',
  `post_datetime` timestamp NULL DEFAULT NULL,
  `expiry_datetime` timestamp NULL DEFAULT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `__pref_items`
--

CREATE TABLE `__pref_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_table` enum('__users','__email_addresses') COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_uid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key_slug` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__pref_items`
--

INSERT INTO `__pref_items` (`id`, `parent_table`, `parent_uid`, `key_name`, `key_slug`, `value`, `value_type`, `creator_username`, `created_datetime`, `updated_datetime`) VALUES
(1, '__users', 'system', 'Backend rest api enabled', 'backend_rest_api_enabled', '1', 'boolean', 'system', '2022-09-15 04:47:49', NULL),
(2, '__users', 'system', 'Scaffolding app enabled', 'scaffolding_app_enabled', '1', 'boolean', 'system', '2022-09-15 04:47:49', NULL),
(3, '__users', 'system', 'Fallback Display Language', 'fallback_pref_lang', 'en', 'enum:langs', 'system', '2022-09-15 04:47:49', NULL),
(4, '__users', 'system', 'Fallback Display Theme', 'fallback_pref_theme', 'light', 'enum:themes', 'system', '2022-09-15 04:47:49', NULL),
(5, '__users', 'system', 'Image storage driver', 'image_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-15 04:47:49', NULL),
(6, '__users', 'system', 'Document storage driver', 'document_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-15 04:47:49', NULL),
(7, '__users', 'system', 'Logs database driver', 'logs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-15 04:47:49', NULL),
(8, '__users', 'system', 'Notifications database driver', 'notifs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-15 04:47:49', NULL),
(9, '__users', 'system', 'Chats database driver', 'chats_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-15 04:47:49', NULL),
(10, '__users', 'system', 'Messages database driver', 'msgs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-15 04:47:49', NULL),
(11, '__users', 'system', 'Offers database driver', 'offers_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-15 04:47:49', NULL),
(12, '__users', 'system', 'Trades database driver', 'trades_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-15 04:47:49', NULL),
(13, '__users', 'system', 'Token registration enabled', 'token_reg_enabled', '1', 'boolean', 'system', '2022-09-15 04:47:49', '2022-09-15 02:49:57'),
(14, '__users', 'system', 'Token registration max use count', 'reg_token_max_use_count', '10', 'integer', 'system', '2022-09-15 04:47:49', NULL),
(15, '__users', 'system', 'Open Registration enabled', 'open_reg_enabled', '0', 'boolean', 'system', '2022-09-15 04:47:49', NULL),
(16, '__users', 'system', 'Learn mode available', 'learn_mode_available', '1', 'boolean', 'system', '2022-09-15 04:47:49', NULL),
(17, '__users', 'system', 'Offers to buy enabled', 'offer_to_buy_enabled', '1', 'boolean', 'system', '2022-09-15 04:47:49', NULL),
(18, '__users', 'system', 'Offers to sell enabled', 'offer_to_sell_enabled', '0', 'boolean', 'system', '2022-09-15 04:47:49', NULL),
(19, '__users', 'system', 'Use development crypto asset engine', 'use_dev_crypto_asset_engine', '1', 'boolean', 'system', '2022-09-15 04:47:49', NULL),
(20, '__users', 'system', 'Use tatum crypto asset engine', 'use_tatum_crypto_asset_engine', '0', 'boolean', 'system', '2022-09-15 04:47:49', NULL),
(21, '__users', 'system', 'Value charged by platform on transactions', 'platform_charge_asset_factor', '0.01', 'float', 'system', '2022-09-15 04:47:49', NULL),
(22, '__users', 'system', 'Minimum allowed price per unit currency on offers', 'min_offer_purchase_price', '0.5', 'float', 'system', '2022-09-15 04:47:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__pymt_methods`
--

CREATE TABLE `__pymt_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hex_color` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details_required` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `choice_currency_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_status` enum('active','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__pymt_methods`
--

INSERT INTO `__pymt_methods` (`id`, `name`, `slug`, `hex_color`, `details_required`, `choice_currency_codes`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
(1, 'Cash in person', 'cash_in_person', '5e5d4b', '[\"phone_no\"]', NULL, 'active', 'system', '2022-09-15 04:47:50', NULL, NULL),
(2, 'Stanbic bank', 'stanbic_bank', '066ef3', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-15 04:47:50', NULL, NULL),
(3, 'FNB bank', 'fnb_bank', '009eaa', '[\"account_holder_name\",\"account_no\"]', '[\"ZAR\"]', 'active', 'system', '2022-09-15 04:47:50', NULL, NULL),
(4, 'Mukuru', 'mukuru', 'e77924', '[\"fullname\",\"phone_no\"]', '[\"USD\"]', 'active', 'system', '2022-09-15 04:47:50', NULL, NULL),
(5, 'Algérie Poste', 'algerie_poste', '01009a', '[\"account_holder_name\",\"account_holder_address\",\"account_no\",\"account_key\"]', '[\"DZD\"]', 'active', 'system', '2022-09-15 04:47:50', NULL, NULL),
(6, 'MTN Mobile Money', 'mtn_momo', 'feca05', '[\"fullname\",\"phone_no\"]', NULL, 'active', 'system', '2022-09-15 04:47:50', NULL, NULL),
(7, 'Ecocash', 'ecocash', '005ba4', '[\"fullname\",\"phone_no\"]', '[\"ZWL\"]', 'active', 'system', '2022-09-15 04:47:50', NULL, NULL),
(8, 'Paypal', 'paypal', '27346a', '[\"fullname\",\"email_address\"]', '[\"USD\",\"EUR\",\"GBP\"]', 'active', 'system', '2022-09-15 04:47:50', NULL, NULL),
(9, 'Skrill', 'skrill', '862165', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-15 04:47:50', NULL, NULL),
(10, 'World Remit', 'world_remit', '604684', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-15 04:47:50', NULL, NULL),
(11, 'Mastercard', 'mastercard', 'cc0001', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-15 04:47:50', NULL, NULL),
(12, 'Visa', 'visa', '0055a5', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-15 04:47:50', NULL, NULL),
(13, 'FBC Bank', 'fbc_bank', '0055a5', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-15 04:47:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__reg_tokens`
--

CREATE TABLE `__reg_tokens` (
  `token` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('usable','unusable','used_up') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'usable',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__reg_tokens`
--

INSERT INTO `__reg_tokens` (`token`, `_status`, `creator_username`, `created_datetime`) VALUES
('1234567890', 'usable', 'system', '2022-09-15 02:47:56');

-- --------------------------------------------------------

--
-- Table structure for table `__seller_extensions`
--

CREATE TABLE `__seller_extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('active','suspended','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__seller_extensions`
--

INSERT INTO `__seller_extensions` (`id`, `user_username`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
(1, 'sysadmin', 'deactivated', 'system', '2022-09-15 02:47:54', '2022-09-15 02:47:54', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-15 02:47:55', '2022-09-15 02:47:55', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-15 02:47:56', '2022-09-15 02:47:56', NULL),
(4, 'guddaz', 'active', 'guddaz', '2022-09-15 02:48:27', '2022-09-15 02:48:27', NULL),
(5, 'lodza', 'active', 'lodza', '2022-09-15 02:48:38', '2022-09-15 02:48:38', NULL),
(6, 'ross', 'active', 'ross', '2022-09-15 02:48:58', '2022-09-15 02:48:58', NULL),
(7, 'keith', 'active', 'keith', '2022-09-15 02:49:05', '2022-09-15 02:49:05', NULL),
(8, 'jimmy', 'active', 'jimmy', '2022-09-15 02:49:25', '2022-09-15 02:49:25', NULL),
(9, 'flint', 'active', 'flint', '2022-09-15 02:49:45', '2022-09-15 02:49:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__sessions`
--

CREATE TABLE `__sessions` (
  `token` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_app_info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('empty','active','ended') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'empty',
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `signin_datetime` timestamp NULL DEFAULT NULL,
  `signout_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__sessions`
--

INSERT INTO `__sessions` (`token`, `user_username`, `device_info`, `agent_app_info`, `_status`, `created_datetime`, `updated_datetime`, `signin_datetime`, `signout_datetime`) VALUES
('FACTORY_SESSION', 'system', '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'ended', '2022-09-15 04:47:49', NULL, NULL, NULL),
('TEST_SESSION', NULL, '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'active', '2022-09-15 04:47:49', NULL, NULL, NULL),
('X1cC8jzm2p8U9SB0', 'guddaz', '{\"name\":null,\"version\":null}', '{\"name\":\"Ankelli Web App\",\"version\":\"1.0.0\",\"extra\":\"Ankelli Web App\"}', 'active', '2022-09-15 03:09:21', '2022-09-15 03:09:23', '2022-09-15 03:09:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__trades`
--

CREATE TABLE `__trades` (
  `ref_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `was_offer_to` enum('buy','sell') COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_value` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_value_escrowed` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform_charge_asset_factor` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_amount` bigint(20) UNSIGNED NOT NULL,
  `offer_price` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pymt_method_slug` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pymt_details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pymt_declared_datetime` timestamp NULL DEFAULT NULL,
  `pymt_confirmed_datetime` timestamp NULL DEFAULT NULL,
  `visible_to_creator` tinyint(1) NOT NULL DEFAULT 1,
  `visible_to_offer_creator` tinyint(1) NOT NULL DEFAULT 1,
  `_status` enum('active','cancelled','flagged','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `offer_creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__trades`
--

INSERT INTO `__trades` (`ref_code`, `country_name`, `location`, `was_offer_to`, `asset_code`, `currency_code`, `asset_value`, `asset_value_escrowed`, `platform_charge_asset_factor`, `currency_amount`, `offer_price`, `pymt_method_slug`, `pymt_details`, `pymt_declared_datetime`, `pymt_confirmed_datetime`, `visible_to_creator`, `visible_to_offer_creator`, `_status`, `offer_creator_username`, `creator_username`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
('101042B2C8E23', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '202.24719101124', '204.26966292135', '0.01', 36000, '178', 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', '2022-09-15 02:49:39', '2022-09-15 02:49:40', 1, 1, 'completed', 'nassim', 'jimmy', '2022-09-15 02:49:39', '2022-09-15 02:49:43', NULL),
('1064008BAA69F', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', '2022-09-15 02:49:46', '2022-09-15 02:49:47', 1, 1, 'completed', 'guddaz', 'flint', '2022-09-15 02:49:46', '2022-09-15 02:49:50', NULL),
('1220018BA42EA', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-15 02:49:00', '2022-09-15 02:49:00', 1, 1, 'completed', 'clarence', 'ross', '2022-09-15 02:49:00', '2022-09-15 02:49:04', NULL),
('124355FDFD1C8', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '265.95744680851', '268.6170212766', '0.01', 250, '0.94', 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', '2022-09-15 02:49:13', '2022-09-15 02:49:14', 1, 1, 'completed', 'peter', 'keith', '2022-09-15 02:49:13', '2022-09-15 02:49:17', NULL),
('126238C930390', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '105.26315789474', '106.31578947368', '0.01', 100, '0.95', 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', '2022-09-15 02:48:40', '2022-09-15 02:48:41', 1, 1, 'completed', 'raymond', 'lodza', '2022-09-15 02:48:40', '2022-09-15 02:48:44', NULL),
('132288FB7E525', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '210.52631578947', '212.63157894737', '0.01', 2800, '13.3', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-15 02:49:07', '2022-09-15 02:49:07', 1, 1, 'completed', 'lodza', 'keith', '2022-09-15 02:49:06', '2022-09-15 02:49:11', NULL),
('1512132F651FE', 'Italy', NULL, 'buy', 'USDT', 'EUR', '263.15789473684', '265.78947368421', '0.01', 200, '0.76', 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', '2022-09-15 02:49:33', '2022-09-15 02:49:33', 1, 1, 'completed', 'raymond', 'jimmy', '2022-09-15 02:49:33', '2022-09-15 02:49:37', NULL),
('165028D8EF243', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '184.21052631579', '186.05263157895', '0.01', 2800, '15.2', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-15 02:49:27', '2022-09-15 02:49:27', 1, 1, 'completed', 'lodza', 'jimmy', '2022-09-15 02:49:26', '2022-09-15 02:49:30', NULL),
('16590765F22DC', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '205.88235294118', '207.94117647059', '0.01', 35000, '170', 'algerie_poste', '{\"account_holder_name\":\"Timothy Tambo\",\"account_number\":\"22558678\",\"account_key\":\"87\"}', '2022-09-15 02:49:53', '2022-09-15 02:49:53', 1, 1, 'completed', 'peter', 'flint', '2022-09-15 02:49:52', '2022-09-15 02:49:56', NULL),
('17258581156D8', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '162.76041666667', '164.38802083333', '0.01', 2500, '15.36', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-15 02:49:20', '2022-09-15 02:49:21', 1, 1, 'completed', 'flint', 'keith', '2022-09-15 02:49:20', '2022-09-15 02:49:24', NULL),
('178310629EEDE', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '106.3829787234', '107.44680851064', '0.01', 100, '0.94', 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', '2022-09-15 02:48:30', '2022-09-15 02:48:34', 1, 1, 'completed', 'ross', 'guddaz', '2022-09-15 02:48:28', '2022-09-15 02:48:37', NULL),
('1799079078FB9', 'Zambia', NULL, 'buy', 'USDT', 'USD', '638.29787234043', '644.68085106383', '0.01', 600, '0.94', 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', '2022-09-15 02:48:53', '2022-09-15 02:48:54', 1, 1, 'completed', 'jimmy', 'lodza', '2022-09-15 02:48:53', '2022-09-15 02:48:57', NULL),
('18586431C4834', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '148.93617021277', '150.42553191489', '0.01', 140, '0.94', 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', '2022-09-15 02:48:47', '2022-09-15 02:48:47', 1, 1, 'completed', 'keith', 'lodza', '2022-09-15 02:48:47', '2022-09-15 02:48:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__transactions`
--

CREATE TABLE `__transactions` (
  `ref_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` enum('onchain','offchain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `blockchain_txid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_token` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation_slug` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destination_user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_asset_value` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_result` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_datetime` timestamp NULL DEFAULT current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__transactions`
--

INSERT INTO `__transactions` (`ref_code`, `context`, `blockchain_txid`, `tatum_reference`, `session_token`, `description`, `operation_slug`, `source_user_username`, `destination_user_username`, `asset_code`, `transfer_asset_value`, `transfer_result`, `transfer_datetime`, `deleted_datetime`) VALUES
('1018672DDD977', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1512132F651FE\"', 'trade_asset_release', 'jimmy', 'raymond', 'USDT', '263.15789473684', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":952.24524076145,\"new_usable_balance_asset_value\":689.08734602461,\"old_total_balance_asset_value\":952.24524076145,\"new_total_balance_asset_value\":689.08734602461},{\"user_username\":\"raymond\",\"old_usable_balance_asset_value\":105.26315789474,\"new_usable_balance_asset_value\":368.42105263158,\"old_total_balance_asset_value\":105.26315789474,\"new_total_balance_asset_value\":368.42105263158}]', '2022-09-15 02:49:35', NULL),
('10843609A01A1', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"1998972B3E336\"', 'deposit_token_topup', 'reserves', 'clarence', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1790,\"new_usable_balance_asset_value\":1690,\"old_total_balance_asset_value\":1790,\"new_total_balance_asset_value\":1690},{\"user_username\":\"clarence\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":100,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":100}]', '2022-09-15 02:48:24', NULL),
('109428D107696', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'flint', 'USDT', '400', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":400,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":400}]', '2022-09-15 02:48:14', NULL),
('1200572F68B29', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"18586431C4834\"', 'trade_asset_release', 'lodza', 'keith', 'USDT', '148.93617021277', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":968.31000052631,\"new_usable_balance_asset_value\":819.37383031354,\"old_total_balance_asset_value\":968.31000052631,\"new_total_balance_asset_value\":819.37383031354},{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":600,\"new_usable_balance_asset_value\":748.93617021277,\"old_total_balance_asset_value\":600,\"new_total_balance_asset_value\":748.93617021277}]', '2022-09-15 02:48:49', NULL),
('12121904242F1', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"132288FB7E525\"', 'trade_asset_release', 'keith', 'lodza', 'USDT', '210.52631578947', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":748.93617021277,\"new_usable_balance_asset_value\":538.4098544233,\"old_total_balance_asset_value\":748.93617021277,\"new_total_balance_asset_value\":538.4098544233},{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":173.20361754758,\"new_usable_balance_asset_value\":383.72993333705,\"old_total_balance_asset_value\":173.20361754758,\"new_total_balance_asset_value\":383.72993333705}]', '2022-09-15 02:49:09', NULL),
('127104E474B67', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Exodus wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '98.9012', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":218.87587867,\"new_usable_balance_asset_value\":317.77707867,\"old_total_balance_asset_value\":218.87587867,\"new_total_balance_asset_value\":317.77707867}]', '2022-09-15 02:48:15', NULL),
('1275782083BB3', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"15526780F9562\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.0224719101124', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":484.208576066,\"new_usable_balance_asset_value\":482.18610415589,\"old_total_balance_asset_value\":484.208576066,\"new_total_balance_asset_value\":482.18610415589},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1612.9825873694,\"new_usable_balance_asset_value\":1615.0050592795,\"old_total_balance_asset_value\":1612.9825873694,\"new_total_balance_asset_value\":1615.0050592795}]', '2022-09-15 02:49:43', NULL),
('1314774FF193A', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"160444658580A\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '6.3829787234043', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":179.58659627098,\"new_usable_balance_asset_value\":173.20361754758,\"old_total_balance_asset_value\":179.58659627098,\"new_total_balance_asset_value\":173.20361754758},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1593.6058230682,\"new_usable_balance_asset_value\":1599.9888017916,\"old_total_balance_asset_value\":1593.6058230682,\"new_total_balance_asset_value\":1599.9888017916}]', '2022-09-15 02:48:57', NULL),
('131559758F02D', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"1546978C84EDE\"', 'deposit_token_topup', 'reserves', 'nassim', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1690,\"new_usable_balance_asset_value\":1590,\"old_total_balance_asset_value\":1690,\"new_total_balance_asset_value\":1590},{\"user_username\":\"nassim\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":100,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":100}]', '2022-09-15 02:48:25', NULL),
('133592453982D', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"18075256FBAF5\"', 'platform_charge', 'guddaz', 'reserves', 'USDT', '1.063829787234', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":211.3940999466,\"new_usable_balance_asset_value\":210.33027015937,\"old_total_balance_asset_value\":211.3940999466,\"new_total_balance_asset_value\":210.33027015937},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1590,\"new_usable_balance_asset_value\":1591.0638297872,\"old_total_balance_asset_value\":1590,\"new_total_balance_asset_value\":1591.0638297872}]', '2022-09-15 02:48:37', NULL),
('135763B89DD91', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"1200572F68B29\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.4893617021277', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":819.37383031354,\"new_usable_balance_asset_value\":817.88446861141,\"old_total_balance_asset_value\":819.37383031354,\"new_total_balance_asset_value\":817.88446861141},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1592.1164613661,\"new_usable_balance_asset_value\":1593.6058230682,\"old_total_balance_asset_value\":1592.1164613661,\"new_total_balance_asset_value\":1593.6058230682}]', '2022-09-15 02:48:50', NULL),
('136343FA41052', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"170894A52E45E\"', 'platform_charge', 'keith', 'reserves', 'USDT', '1.6276041666667', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":104.92715332214,\"new_usable_balance_asset_value\":103.29954915547,\"old_total_balance_asset_value\":104.92715332214,\"new_total_balance_asset_value\":103.29954915547},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1606.8812989921,\"new_usable_balance_asset_value\":1608.5089031588,\"old_total_balance_asset_value\":1606.8812989921,\"new_total_balance_asset_value\":1608.5089031588}]', '2022-09-15 02:49:24', NULL),
('1402445770647', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"194088B782D79\"', 'platform_charge', 'flint', 'reserves', 'USDT', '2.1276595744681', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":349.99445921986,\"new_usable_balance_asset_value\":347.86679964539,\"old_total_balance_asset_value\":349.99445921986,\"new_total_balance_asset_value\":347.86679964539},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1615.0050592795,\"new_usable_balance_asset_value\":1617.132718854,\"old_total_balance_asset_value\":1615.0050592795,\"new_total_balance_asset_value\":1617.132718854}]', '2022-09-15 02:49:50', NULL),
('14204650C895A', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli Reserves Wallet.', 'internalisation', NULL, 'reserves', 'USDT', '3000', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":3000,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":3000}]', '2022-09-15 02:48:10', NULL),
('14448352E5223', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"12121904242F1\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.1052631578947', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":538.4098544233,\"new_usable_balance_asset_value\":536.30459126541,\"old_total_balance_asset_value\":538.4098544233,\"new_total_balance_asset_value\":536.30459126541},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1602.1164613661,\"new_usable_balance_asset_value\":1604.221724524,\"old_total_balance_asset_value\":1602.1164613661,\"new_total_balance_asset_value\":1604.221724524}]', '2022-09-15 02:49:10', NULL),
('1479234A7E470', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"124355FDFD1C8\"', 'trade_asset_release', 'keith', 'peter', 'USDT', '265.95744680851', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":536.30459126541,\"new_usable_balance_asset_value\":270.3471444569,\"old_total_balance_asset_value\":536.30459126541,\"new_total_balance_asset_value\":270.3471444569},{\"user_username\":\"peter\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":265.95744680851,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":265.95744680851}]', '2022-09-15 02:49:16', NULL),
('1530984E38D01', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"1750401D08499\"', 'deposit_token_topup', 'reserves', 'ross', 'USDT', '110', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":3000,\"new_usable_balance_asset_value\":2890,\"old_total_balance_asset_value\":3000,\"new_total_balance_asset_value\":2890},{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":110,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":110}]', '2022-09-15 02:48:18', NULL),
('155005E2A1962', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"197821B3872AE\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '1.8421052631579', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":954.08734602461,\"new_usable_balance_asset_value\":952.24524076145,\"old_total_balance_asset_value\":954.08734602461,\"new_total_balance_asset_value\":952.24524076145},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1608.5089031588,\"new_usable_balance_asset_value\":1610.351008422,\"old_total_balance_asset_value\":1608.5089031588,\"new_total_balance_asset_value\":1610.351008422}]', '2022-09-15 02:49:30', NULL),
('15526780F9562', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"101042B2C8E23\"', 'trade_asset_release', 'jimmy', 'nassim', 'USDT', '202.24719101124', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":686.45576707724,\"new_usable_balance_asset_value\":484.208576066,\"old_total_balance_asset_value\":686.45576707724,\"new_total_balance_asset_value\":484.208576066},{\"user_username\":\"nassim\",\"old_usable_balance_asset_value\":100,\"new_usable_balance_asset_value\":302.24719101124,\"old_total_balance_asset_value\":100,\"new_total_balance_asset_value\":302.24719101124}]', '2022-09-15 02:49:42', NULL),
('15766151E5997', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"1804137158824\"', 'platform_charge', 'flint', 'reserves', 'USDT', '2.0588235294118', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":141.98444670421,\"new_usable_balance_asset_value\":139.9256231748,\"old_total_balance_asset_value\":141.98444670421,\"new_total_balance_asset_value\":139.9256231748},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1617.132718854,\"new_usable_balance_asset_value\":1619.1915423834,\"old_total_balance_asset_value\":1617.132718854,\"new_total_balance_asset_value\":1619.1915423834}]', '2022-09-15 02:49:56', NULL),
('15916418C0934', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"126238C930390\"', 'trade_asset_release', 'lodza', 'raymond', 'USDT', '105.26315789474', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":1074.62579,\"new_usable_balance_asset_value\":969.36263210526,\"old_total_balance_asset_value\":1074.62579,\"new_total_balance_asset_value\":969.36263210526},{\"user_username\":\"raymond\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":105.26315789474,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":105.26315789474}]', '2022-09-15 02:48:42', NULL),
('159437CF61B7B', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1220018BA42EA\"', 'trade_asset_release', 'ross', 'clarence', 'USDT', '212.76595744681', '[{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":216.3829787234,\"new_usable_balance_asset_value\":3.61702127659,\"old_total_balance_asset_value\":216.3829787234,\"new_total_balance_asset_value\":3.61702127659},{\"user_username\":\"clarence\",\"old_usable_balance_asset_value\":100,\"new_usable_balance_asset_value\":312.76595744681,\"old_total_balance_asset_value\":100,\"new_total_balance_asset_value\":312.76595744681}]', '2022-09-15 02:49:02', NULL),
('160444658580A', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1799079078FB9\"', 'trade_asset_release', 'lodza', 'jimmy', 'USDT', '638.29787234043', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":817.88446861141,\"new_usable_balance_asset_value\":179.58659627098,\"old_total_balance_asset_value\":817.88446861141,\"new_total_balance_asset_value\":179.58659627098},{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":500,\"new_usable_balance_asset_value\":1138.2978723404,\"old_total_balance_asset_value\":500,\"new_total_balance_asset_value\":1138.2978723404}]', '2022-09-15 02:48:55', NULL),
('1648166BA62D7', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '106.76', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":967.86579,\"new_usable_balance_asset_value\":1074.62579,\"old_total_balance_asset_value\":967.86579,\"new_total_balance_asset_value\":1074.62579}]', '2022-09-15 02:48:16', NULL),
('16502813197AC', 'onchain', '62BD544D1B9031EFC330A3E855CC3A0D51CA5131455C1AB3BCAC6D243F65460D', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '218.87587867', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":218.87587867,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":218.87587867}]', '2022-09-15 02:48:11', NULL),
('16919137A74F1', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"159437CF61B7B\"', 'platform_charge', 'ross', 'reserves', 'USDT', '2.1276595744681', '[{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":3.61702127659,\"new_usable_balance_asset_value\":1.4893617021219,\"old_total_balance_asset_value\":3.61702127659,\"new_total_balance_asset_value\":1.4893617021219},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1599.9888017916,\"new_usable_balance_asset_value\":1602.1164613661,\"old_total_balance_asset_value\":1599.9888017916,\"new_total_balance_asset_value\":1602.1164613661}]', '2022-09-15 02:49:03', NULL),
('1694484760423', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"1471738093C20\"', 'deposit_token_topup', 'reserves', 'jimmy', 'USDT', '500', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2290,\"new_usable_balance_asset_value\":1790,\"old_total_balance_asset_value\":2290,\"new_total_balance_asset_value\":1790},{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":500,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":500}]', '2022-09-15 02:48:22', NULL),
('170894A52E45E', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"17258581156D8\"', 'trade_asset_release', 'keith', 'flint', 'USDT', '162.76041666667', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":267.68756998881,\"new_usable_balance_asset_value\":104.92715332214,\"old_total_balance_asset_value\":267.68756998881,\"new_total_balance_asset_value\":104.92715332214},{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":400,\"new_usable_balance_asset_value\":562.76041666667,\"old_total_balance_asset_value\":400,\"new_total_balance_asset_value\":562.76041666667}]', '2022-09-15 02:49:22', NULL),
('175856B7FC2DF', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"1018672DDD977\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.6315789473684', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":689.08734602461,\"new_usable_balance_asset_value\":686.45576707724,\"old_total_balance_asset_value\":689.08734602461,\"new_total_balance_asset_value\":686.45576707724},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1610.351008422,\"new_usable_balance_asset_value\":1612.9825873694,\"old_total_balance_asset_value\":1610.351008422,\"new_total_balance_asset_value\":1612.9825873694}]', '2022-09-15 02:49:36', NULL),
('176486E05C720', 'onchain', '62BD544D1B9031EFC330A3E855CC3A0D51CA5131455C1AB3BCAC6D243F65460D', NULL, 'TEST_SESSION', 'Transfer from Ledger wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '967.86579', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":967.86579,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":967.86579}]', '2022-09-15 02:48:13', NULL),
('1804137158824', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"16590765F22DC\"', 'trade_asset_release', 'flint', 'peter', 'USDT', '205.88235294118', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":347.86679964539,\"new_usable_balance_asset_value\":141.98444670421,\"old_total_balance_asset_value\":347.86679964539,\"new_total_balance_asset_value\":141.98444670421},{\"user_username\":\"peter\",\"old_usable_balance_asset_value\":265.95744680851,\"new_usable_balance_asset_value\":471.83979974969,\"old_total_balance_asset_value\":265.95744680851,\"new_total_balance_asset_value\":471.83979974969}]', '2022-09-15 02:49:55', NULL),
('18075256FBAF5', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"178310629EEDE\"', 'trade_asset_release', 'guddaz', 'ross', 'USDT', '106.3829787234', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":317.77707867,\"new_usable_balance_asset_value\":211.3940999466,\"old_total_balance_asset_value\":317.77707867,\"new_total_balance_asset_value\":211.3940999466},{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":110,\"new_usable_balance_asset_value\":216.3829787234,\"old_total_balance_asset_value\":110,\"new_total_balance_asset_value\":216.3829787234}]', '2022-09-15 02:48:35', NULL),
('18290096D57A9', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"146984445F424\"', 'deposit_token_topup', 'reserves', 'keith', 'USDT', '600', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2890,\"new_usable_balance_asset_value\":2290,\"old_total_balance_asset_value\":2890,\"new_total_balance_asset_value\":2290},{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":600,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":600}]', '2022-09-15 02:48:20', NULL),
('1849033216F45', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"15916418C0934\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.0526315789474', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":969.36263210526,\"new_usable_balance_asset_value\":968.31000052631,\"old_total_balance_asset_value\":969.36263210526,\"new_total_balance_asset_value\":968.31000052631},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1591.0638297872,\"new_usable_balance_asset_value\":1592.1164613661,\"old_total_balance_asset_value\":1591.0638297872,\"new_total_balance_asset_value\":1592.1164613661}]', '2022-09-15 02:48:44', NULL),
('1852150133585', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"1479234A7E470\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.6595744680851', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":270.3471444569,\"new_usable_balance_asset_value\":267.68756998881,\"old_total_balance_asset_value\":270.3471444569,\"new_total_balance_asset_value\":267.68756998881},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1604.221724524,\"new_usable_balance_asset_value\":1606.8812989921,\"old_total_balance_asset_value\":1604.221724524,\"new_total_balance_asset_value\":1606.8812989921}]', '2022-09-15 02:49:17', NULL),
('194088B782D79', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1064008BAA69F\"', 'trade_asset_release', 'flint', 'guddaz', 'USDT', '212.76595744681', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":562.76041666667,\"new_usable_balance_asset_value\":349.99445921986,\"old_total_balance_asset_value\":562.76041666667,\"new_total_balance_asset_value\":349.99445921986},{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":210.33027015937,\"new_usable_balance_asset_value\":423.09622760618,\"old_total_balance_asset_value\":210.33027015937,\"new_total_balance_asset_value\":423.09622760618}]', '2022-09-15 02:49:48', NULL),
('197821B3872AE', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"165028D8EF243\"', 'trade_asset_release', 'jimmy', 'lodza', 'USDT', '184.21052631579', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":1138.2978723404,\"new_usable_balance_asset_value\":954.08734602461,\"old_total_balance_asset_value\":1138.2978723404,\"new_total_balance_asset_value\":954.08734602461},{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":383.72993333705,\"new_usable_balance_asset_value\":567.94045965284,\"old_total_balance_asset_value\":383.72993333705,\"new_total_balance_asset_value\":567.94045965284}]', '2022-09-15 02:49:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__users`
--

CREATE TABLE `__users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_token` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_image_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `tatum_customer_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_status` enum('active','inactive','suspended','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__users`
--

INSERT INTO `__users` (`id`, `username`, `email_address`, `password`, `reg_token`, `avatar_image_id`, `tatum_customer_id`, `_status`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
(1, 'system', 'system', '', NULL, NULL, NULL, 'active', '2022-09-15 04:47:48', NULL, NULL),
(2, 'developer', 'developer.ankelli@gmail.com', '$2y$10$HaZ0cWFS/xslYB5zzRnK/u4p9rooHcT9KmA2vWcKWoaeO5ut6CC6S', NULL, NULL, NULL, 'active', '2022-09-15 02:47:52', '2022-09-15 02:47:52', NULL),
(3, 'sysadmin', 'sysadmin@ankelli.com', '$2y$10$Y5Y7h/Y5tFJAudMTEc13BO1HEUNRG05Etd9PmIYHBag49yZA7UkS.', NULL, NULL, NULL, 'active', '2022-09-15 02:47:53', '2022-09-15 02:47:53', NULL),
(4, 'reserves', 'reserves@ankelli.com', '$2y$10$KVTY6dSyBc1Qpw/5w5kmj.eGwa9MqPDQGHqoYfnrDNxKWtSYBdmlO', NULL, NULL, NULL, 'active', '2022-09-15 02:47:54', '2022-09-15 02:47:54', NULL),
(5, 'busadmin', 'busadmin@ankelli.com', '$2y$10$4XcTYD/D/cEYLpletD89v.Y8yF6H7eqDuPAcCjHlCtyu//sB5efMu', NULL, NULL, NULL, 'active', '2022-09-15 02:47:55', '2022-09-15 02:47:55', NULL),
(6, 'guddaz', 'goodhopedhliwayo@gmail.com', '$2y$10$xt8ep.o2iiCVPlQ6b7HP/eo6sXGdvctAVQ4U8vH1LAxmBiBq.t4uW', NULL, NULL, NULL, 'active', '2022-09-15 02:48:03', '2022-09-15 02:48:03', NULL),
(7, 'lodza', 'lodza@example.com', '$2y$10$2yuQmO0QkPk4kfeStH0kzO3tLeA2jY9QE1QjcFTuL/QlxF51wDI0m', NULL, NULL, NULL, 'active', '2022-09-15 02:48:04', '2022-09-15 02:48:04', NULL),
(8, 'ross', 'ross@example.com', '$2y$10$XiCOs1UXp9KxmGsRPAm/mOJOxsUuv3HUbfbxp12Oi6ZGd62YtC7u.', NULL, NULL, NULL, 'active', '2022-09-15 02:48:05', '2022-09-15 02:48:05', NULL),
(9, 'jimmy', 'jimmy@example.com', '$2y$10$MHFUsokamM/pdq7o.b/nneAfqbyENodSNgRZyOQ8Ko/Jxus58VD4u', NULL, NULL, NULL, 'active', '2022-09-15 02:48:06', '2022-09-15 02:48:06', NULL),
(10, 'keith', 'keith@example.com', '$2y$10$8cFeuPt4R3lW5p0pODgQxeLsvi4hb7/PFd2wxxxdCbmmbf/zNbkVa', NULL, NULL, NULL, 'active', '2022-09-15 02:48:06', '2022-09-15 02:48:06', NULL),
(11, 'peter', 'peter@example.com', '$2y$10$zYE89MyRP7Q4IH3You5kwuiFixPHkFgCrZACpu/KPAxq3PdcuwH2u', NULL, NULL, NULL, 'active', '2022-09-15 02:48:07', '2022-09-15 02:48:07', NULL),
(12, 'flint', 'flint@example.com', '$2y$10$ew/WsneILxgzg3firipYAOZ/b.ePYzZJbYf/j8vqokcMxqiVvg.a6', NULL, NULL, NULL, 'active', '2022-09-15 02:48:08', '2022-09-15 02:48:08', NULL),
(13, 'clarence', 'clarence@example.com', '$2y$10$5qUjlJ2y4X8wZ2BwEZlzxeeu9BRglZMvTCaSFmy5k1H8qHxe76gn2', NULL, NULL, NULL, 'active', '2022-09-15 02:48:08', '2022-09-15 02:48:08', NULL),
(14, 'raymond', 'raymond@example.com', '$2y$10$sbta4gk3TKO52iN/bPxUtup7TwFwlEZ5eEOhkoA3wUVOozh3LCGt2', NULL, NULL, NULL, 'active', '2022-09-15 02:48:09', '2022-09-15 02:48:09', NULL),
(15, 'nassim', 'nassim@example.com', '$2y$10$yQyWYkr52bhLun.giMQDE.2/Fgai6cTr1RUolul7ZrTiCKYISfhuy', NULL, NULL, NULL, 'active', '2022-09-15 02:48:09', '2022-09-15 02:48:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__user_groups`
--

CREATE TABLE `__user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('active','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__user_groups`
--

INSERT INTO `__user_groups` (`id`, `name`, `slug`, `description`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
(1, 'Default Users', 'default_users', 'Group for Default User accounts created on system initialization and factory_data loading. \nNew users cannot be added to this group.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(2, 'Administrators', 'administrators', 'Automatically joined group (Users with active Admin Extension). \nMembers can be added to other admin groups.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(3, 'Developers', 'developers', 'Admin group for unrestricted system users. \nMembers have access to all features and OTP access to account named \"developer\". \nOnly \"developer\" account can add members to this group.\nGroup used for System Development and Maintenance.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(4, 'System Administrators', 'system_administrators', 'Admin Group for System Administrators. \nMembers can manage system functions and sysconfig params. \nMembers have OTP access to account named \"sysadmin\".\nOnly \"sysadmin\" account can add members to this group.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(5, 'Business Administrators', 'business_administrators', 'Admin group for Business Administrators.\nMembers have access to business related features.\nMembers have OTP access to accounts named \"reserves\" and \"busadmin\".\nOnly \"busadmin\" account can add members to this group.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(6, 'User Administrators', 'user_administrators', 'Admin group for User Administrators. \nMembers can manage other users and user related queries.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(7, 'Platform moderators', 'platform_moderators', 'Group for Platform moderators. \nMembers can respond in the customer service chat module, handle flagged business elements, manage daily updates.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(8, 'Sellers', 'sellers', 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(9, 'Buyers', 'buyers', 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL),
(10, 'Beta Testers', 'beta_testers', 'User Group for selected individuals to test certain features before they are published.', 'active', 'system', '2022-09-15 04:47:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__user_group_memberships`
--

CREATE TABLE `__user_group_memberships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_group_slug` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('active','revoked') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__user_group_memberships`
--

INSERT INTO `__user_group_memberships` (`id`, `user_username`, `user_group_slug`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`) VALUES
(1, 'developer', 'default_users', 'active', 'system', '2022-09-15 02:47:52', '2022-09-15 02:47:52'),
(2, 'developer', 'developers', 'active', 'system', '2022-09-15 02:47:53', '2022-09-15 02:47:53'),
(3, 'sysadmin', 'default_users', 'active', 'system', '2022-09-15 02:47:53', '2022-09-15 02:47:53'),
(4, 'sysadmin', 'system_administrators', 'active', 'system', '2022-09-15 02:47:54', '2022-09-15 02:47:54'),
(5, 'reserves', 'default_users', 'active', 'system', '2022-09-15 02:47:54', '2022-09-15 02:47:54'),
(6, 'reserves', 'business_administrators', 'active', 'system', '2022-09-15 02:47:55', '2022-09-15 02:47:55'),
(7, 'busadmin', 'default_users', 'active', 'system', '2022-09-15 02:47:55', '2022-09-15 02:47:55'),
(8, 'busadmin', 'business_administrators', 'active', 'system', '2022-09-15 02:47:56', '2022-09-15 02:47:56'),
(9, 'guddaz', 'developers', 'active', 'system', '2022-09-15 02:48:03', '2022-09-15 02:48:03'),
(10, 'lodza', 'system_administrators', 'active', 'system', '2022-09-15 02:48:04', '2022-09-15 02:48:04'),
(11, 'lodza', 'user_administrators', 'active', 'system', '2022-09-15 02:48:05', '2022-09-15 02:48:05'),
(12, 'lodza', 'business_administrators', 'active', 'system', '2022-09-15 02:48:05', '2022-09-15 02:48:05');

-- --------------------------------------------------------

--
-- Table structure for table `__verif_tokens`
--

CREATE TABLE `__verif_tokens` (
  `token` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recepient_resource_table` enum('__phone_nos','__email_addresses') COLLATE utf8mb4_unicode_ci NOT NULL,
  `recepient_resource_id` bigint(20) UNSIGNED NOT NULL,
  `charge` enum('email_address_verification','phone_no_verification','password_reset') COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('unused','verified','annulled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unused',
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `verified_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `__admin_extensions`
--
ALTER TABLE `__admin_extensions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__admin_extensions_user_username_unique` (`user_username`),
  ADD KEY `__admin_extensions_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__assets`
--
ALTER TABLE `__assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__assets_name_unique` (`name`),
  ADD UNIQUE KEY `__assets_code_unique` (`code`),
  ADD KEY `__assets_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__asset_accounts`
--
ALTER TABLE `__asset_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__asset_accounts_user_username_asset_code_unique` (`user_username`,`asset_code`),
  ADD KEY `__asset_accounts_asset_code_foreign` (`asset_code`);

--
-- Indexes for table `__asset_account_addresses`
--
ALTER TABLE `__asset_account_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_account_id_blockchain_address_tatum_derivation_key_unique` (`asset_account_id`,`blockchain_address`,`tatum_derivation_key`);

--
-- Indexes for table `__buyer_extensions`
--
ALTER TABLE `__buyer_extensions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__buyer_extensions_user_username_unique` (`user_username`),
  ADD KEY `__buyer_extensions_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__chats`
--
ALTER TABLE `__chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `__chats_participant_one_username_foreign` (`participant_one_username`),
  ADD KEY `__chats_participant_two_username_foreign` (`participant_two_username`),
  ADD KEY `__chats_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__countries`
--
ALTER TABLE `__countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__countries_name_unique` (`name`),
  ADD UNIQUE KEY `__countries_code_unique` (`code`),
  ADD KEY `__countries_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__currencies`
--
ALTER TABLE `__currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__currencies_name_unique` (`name`),
  ADD UNIQUE KEY `__currencies_code_unique` (`code`),
  ADD KEY `__currencies_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__deposit_tokens`
--
ALTER TABLE `__deposit_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `__deposit_tokens_asset_code_foreign` (`asset_code`),
  ADD KEY `__deposit_tokens_currency_code_foreign` (`currency_code`),
  ADD KEY `__deposit_tokens_creator_username_foreign` (`creator_username`),
  ADD KEY `__deposit_tokens_user_username_foreign` (`user_username`);

--
-- Indexes for table `__email_addresses`
--
ALTER TABLE `__email_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__email_addresses_email_address_unique` (`email_address`),
  ADD KEY `__email_addresses_user_username_foreign` (`user_username`);

--
-- Indexes for table `__exportables`
--
ALTER TABLE `__exportables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__exportables_name_slug_unique` (`name`,`slug`),
  ADD UNIQUE KEY `__exportables_name_unique` (`name`),
  ADD UNIQUE KEY `__exportables_slug_unique` (`slug`),
  ADD KEY `__exportables_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__feedback_reports`
--
ALTER TABLE `__feedback_reports`
  ADD PRIMARY KEY (`ticket_code`),
  ADD KEY `__feedback_reports_session_token_foreign` (`session_token`),
  ADD KEY `__feedback_reports_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__files`
--
ALTER TABLE `__files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__files_parent_table_parent_uid_tag_order_index_unique` (`parent_table`,`parent_uid`,`tag`,`order_index`),
  ADD KEY `__files_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__logs`
--
ALTER TABLE `__logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `__logs_session_token_foreign` (`session_token`),
  ADD KEY `__logs_action_user_username_foreign` (`action_user_username`);

--
-- Indexes for table `__messages`
--
ALTER TABLE `__messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `__messages_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__notifications`
--
ALTER TABLE `__notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `__notifications_user_username_foreign` (`user_username`);

--
-- Indexes for table `__offers`
--
ALTER TABLE `__offers`
  ADD PRIMARY KEY (`ref_code`),
  ADD KEY `__offers_country_name_foreign` (`country_name`),
  ADD KEY `__offers_asset_code_foreign` (`asset_code`),
  ADD KEY `__offers_currency_code_foreign` (`currency_code`),
  ADD KEY `__offers_pymt_method_slug_foreign` (`pymt_method_slug`),
  ADD KEY `__offers_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__permissions`
--
ALTER TABLE `__permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__permissions_name_slug_unique` (`name`,`slug`),
  ADD UNIQUE KEY `__permissions_name_unique` (`name`),
  ADD UNIQUE KEY `__permissions_slug_unique` (`slug`),
  ADD KEY `__permissions_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__permission_instances`
--
ALTER TABLE `__permission_instances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parent_table_parent_uid_permission_slug_unique` (`parent_table`,`parent_uid`,`permission_slug`),
  ADD KEY `__permission_instances_permission_slug_foreign` (`permission_slug`),
  ADD KEY `__permission_instances_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__phone_nos`
--
ALTER TABLE `__phone_nos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `__phone_nos_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__pinnings`
--
ALTER TABLE `__pinnings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__pinnings_user_username_item_table_item_uid_unique` (`user_username`,`item_table`,`item_uid`),
  ADD KEY `__pinnings_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__posts`
--
ALTER TABLE `__posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__posts_slug_unique` (`slug`),
  ADD KEY `__posts_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__pref_items`
--
ALTER TABLE `__pref_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__pref_items_parent_table_parent_uid_key_slug_unique` (`parent_table`,`parent_uid`,`key_slug`),
  ADD KEY `__pref_items_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__pymt_methods`
--
ALTER TABLE `__pymt_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__pymt_methods_name_unique` (`name`),
  ADD UNIQUE KEY `__pymt_methods_slug_unique` (`slug`),
  ADD KEY `__pymt_methods_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__reg_tokens`
--
ALTER TABLE `__reg_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `__reg_tokens_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__seller_extensions`
--
ALTER TABLE `__seller_extensions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__seller_extensions_user_username_unique` (`user_username`),
  ADD KEY `__seller_extensions_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__sessions`
--
ALTER TABLE `__sessions`
  ADD PRIMARY KEY (`token`),
  ADD KEY `__sessions_user_username_foreign` (`user_username`);

--
-- Indexes for table `__trades`
--
ALTER TABLE `__trades`
  ADD PRIMARY KEY (`ref_code`),
  ADD KEY `__trades_country_name_foreign` (`country_name`),
  ADD KEY `__trades_asset_code_foreign` (`asset_code`),
  ADD KEY `__trades_currency_code_foreign` (`currency_code`),
  ADD KEY `__trades_pymt_method_slug_foreign` (`pymt_method_slug`),
  ADD KEY `__trades_offer_creator_username_foreign` (`offer_creator_username`),
  ADD KEY `__trades_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__transactions`
--
ALTER TABLE `__transactions`
  ADD PRIMARY KEY (`ref_code`),
  ADD KEY `__transactions_session_token_foreign` (`session_token`),
  ADD KEY `__transactions_source_user_username_foreign` (`source_user_username`),
  ADD KEY `__transactions_destination_user_username_foreign` (`destination_user_username`),
  ADD KEY `__transactions_asset_code_foreign` (`asset_code`);

--
-- Indexes for table `__users`
--
ALTER TABLE `__users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__users_username_unique` (`username`),
  ADD UNIQUE KEY `__users_email_address_unique` (`email_address`);

--
-- Indexes for table `__user_groups`
--
ALTER TABLE `__user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__user_groups_name_slug_unique` (`name`,`slug`),
  ADD UNIQUE KEY `__user_groups_name_unique` (`name`),
  ADD UNIQUE KEY `__user_groups_slug_unique` (`slug`),
  ADD KEY `__user_groups_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__user_group_memberships`
--
ALTER TABLE `__user_group_memberships`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__user_group_memberships_user_username_user_group_slug_unique` (`user_username`,`user_group_slug`),
  ADD KEY `__user_group_memberships_user_group_slug_foreign` (`user_group_slug`),
  ADD KEY `__user_group_memberships_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__verif_tokens`
--
ALTER TABLE `__verif_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `__verif_tokens_user_username_foreign` (`user_username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

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
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `__admin_extensions`
--
ALTER TABLE `__admin_extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `__assets`
--
ALTER TABLE `__assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `__asset_accounts`
--
ALTER TABLE `__asset_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `__asset_account_addresses`
--
ALTER TABLE `__asset_account_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `__buyer_extensions`
--
ALTER TABLE `__buyer_extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `__countries`
--
ALTER TABLE `__countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `__currencies`
--
ALTER TABLE `__currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `__email_addresses`
--
ALTER TABLE `__email_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `__exportables`
--
ALTER TABLE `__exportables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `__files`
--
ALTER TABLE `__files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `__permissions`
--
ALTER TABLE `__permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `__permission_instances`
--
ALTER TABLE `__permission_instances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `__phone_nos`
--
ALTER TABLE `__phone_nos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `__pinnings`
--
ALTER TABLE `__pinnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `__posts`
--
ALTER TABLE `__posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `__pref_items`
--
ALTER TABLE `__pref_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `__pymt_methods`
--
ALTER TABLE `__pymt_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `__seller_extensions`
--
ALTER TABLE `__seller_extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `__users`
--
ALTER TABLE `__users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `__user_groups`
--
ALTER TABLE `__user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `__user_group_memberships`
--
ALTER TABLE `__user_group_memberships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `__admin_extensions`
--
ALTER TABLE `__admin_extensions`
  ADD CONSTRAINT `__admin_extensions_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__admin_extensions_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `__assets`
--
ALTER TABLE `__assets`
  ADD CONSTRAINT `__assets_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__asset_accounts`
--
ALTER TABLE `__asset_accounts`
  ADD CONSTRAINT `__asset_accounts_asset_code_foreign` FOREIGN KEY (`asset_code`) REFERENCES `__assets` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__asset_accounts_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__asset_account_addresses`
--
ALTER TABLE `__asset_account_addresses`
  ADD CONSTRAINT `__asset_account_addresses_asset_account_id_foreign` FOREIGN KEY (`asset_account_id`) REFERENCES `__asset_accounts` (`id`);

--
-- Constraints for table `__buyer_extensions`
--
ALTER TABLE `__buyer_extensions`
  ADD CONSTRAINT `__buyer_extensions_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__buyer_extensions_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `__chats`
--
ALTER TABLE `__chats`
  ADD CONSTRAINT `__chats_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__chats_participant_one_username_foreign` FOREIGN KEY (`participant_one_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__chats_participant_two_username_foreign` FOREIGN KEY (`participant_two_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__countries`
--
ALTER TABLE `__countries`
  ADD CONSTRAINT `__countries_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__currencies`
--
ALTER TABLE `__currencies`
  ADD CONSTRAINT `__currencies_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__deposit_tokens`
--
ALTER TABLE `__deposit_tokens`
  ADD CONSTRAINT `__deposit_tokens_asset_code_foreign` FOREIGN KEY (`asset_code`) REFERENCES `__assets` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__deposit_tokens_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `__deposit_tokens_currency_code_foreign` FOREIGN KEY (`currency_code`) REFERENCES `__currencies` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__deposit_tokens_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__email_addresses`
--
ALTER TABLE `__email_addresses`
  ADD CONSTRAINT `__email_addresses_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `__exportables`
--
ALTER TABLE `__exportables`
  ADD CONSTRAINT `__exportables_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__feedback_reports`
--
ALTER TABLE `__feedback_reports`
  ADD CONSTRAINT `__feedback_reports_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__feedback_reports_session_token_foreign` FOREIGN KEY (`session_token`) REFERENCES `__sessions` (`token`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__files`
--
ALTER TABLE `__files`
  ADD CONSTRAINT `__files_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__logs`
--
ALTER TABLE `__logs`
  ADD CONSTRAINT `__logs_action_user_username_foreign` FOREIGN KEY (`action_user_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__logs_session_token_foreign` FOREIGN KEY (`session_token`) REFERENCES `__sessions` (`token`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__messages`
--
ALTER TABLE `__messages`
  ADD CONSTRAINT `__messages_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__notifications`
--
ALTER TABLE `__notifications`
  ADD CONSTRAINT `__notifications_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `__offers`
--
ALTER TABLE `__offers`
  ADD CONSTRAINT `__offers_asset_code_foreign` FOREIGN KEY (`asset_code`) REFERENCES `__assets` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__offers_country_name_foreign` FOREIGN KEY (`country_name`) REFERENCES `__countries` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__offers_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__offers_currency_code_foreign` FOREIGN KEY (`currency_code`) REFERENCES `__currencies` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__offers_pymt_method_slug_foreign` FOREIGN KEY (`pymt_method_slug`) REFERENCES `__pymt_methods` (`slug`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__permissions`
--
ALTER TABLE `__permissions`
  ADD CONSTRAINT `__permissions_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__permission_instances`
--
ALTER TABLE `__permission_instances`
  ADD CONSTRAINT `__permission_instances_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__permission_instances_permission_slug_foreign` FOREIGN KEY (`permission_slug`) REFERENCES `__permissions` (`slug`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `__phone_nos`
--
ALTER TABLE `__phone_nos`
  ADD CONSTRAINT `__phone_nos_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__pinnings`
--
ALTER TABLE `__pinnings`
  ADD CONSTRAINT `__pinnings_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__pinnings_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `__posts`
--
ALTER TABLE `__posts`
  ADD CONSTRAINT `__posts_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__pref_items`
--
ALTER TABLE `__pref_items`
  ADD CONSTRAINT `__pref_items_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__pymt_methods`
--
ALTER TABLE `__pymt_methods`
  ADD CONSTRAINT `__pymt_methods_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__reg_tokens`
--
ALTER TABLE `__reg_tokens`
  ADD CONSTRAINT `__reg_tokens_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `__seller_extensions`
--
ALTER TABLE `__seller_extensions`
  ADD CONSTRAINT `__seller_extensions_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__seller_extensions_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `__sessions`
--
ALTER TABLE `__sessions`
  ADD CONSTRAINT `__sessions_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__trades`
--
ALTER TABLE `__trades`
  ADD CONSTRAINT `__trades_asset_code_foreign` FOREIGN KEY (`asset_code`) REFERENCES `__assets` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__trades_country_name_foreign` FOREIGN KEY (`country_name`) REFERENCES `__countries` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__trades_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__trades_currency_code_foreign` FOREIGN KEY (`currency_code`) REFERENCES `__currencies` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__trades_offer_creator_username_foreign` FOREIGN KEY (`offer_creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__trades_pymt_method_slug_foreign` FOREIGN KEY (`pymt_method_slug`) REFERENCES `__pymt_methods` (`slug`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__transactions`
--
ALTER TABLE `__transactions`
  ADD CONSTRAINT `__transactions_asset_code_foreign` FOREIGN KEY (`asset_code`) REFERENCES `__assets` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__transactions_destination_user_username_foreign` FOREIGN KEY (`destination_user_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__transactions_session_token_foreign` FOREIGN KEY (`session_token`) REFERENCES `__sessions` (`token`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__transactions_source_user_username_foreign` FOREIGN KEY (`source_user_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__user_groups`
--
ALTER TABLE `__user_groups`
  ADD CONSTRAINT `__user_groups_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__user_group_memberships`
--
ALTER TABLE `__user_group_memberships`
  ADD CONSTRAINT `__user_group_memberships_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__user_group_memberships_user_group_slug_foreign` FOREIGN KEY (`user_group_slug`) REFERENCES `__user_groups` (`slug`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `__user_group_memberships_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `__verif_tokens`
--
ALTER TABLE `__verif_tokens`
  ADD CONSTRAINT `__verif_tokens_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
