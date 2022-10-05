-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 04, 2022 at 09:40 PM
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
(43, '2014_10_12_000000_create_users_table', 1),
(44, '2014_10_12_100000_create_password_resets_table', 1),
(45, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(46, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(47, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(48, '2016_06_01_000004_create_oauth_clients_table', 1),
(49, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(50, '2019_08_19_000000_create_failed_jobs_table', 1),
(51, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(52, '2022_07_26_072110_create___admin_extensions_table', 1),
(53, '2022_07_26_072112_create___buyer_extensions_table', 1),
(54, '2022_07_26_072114_create___seller_extensions_table', 1),
(55, '2022_07_26_072120_create___user_groups_table', 1),
(56, '2022_07_26_072122_create___user_group_memberships_table', 1),
(57, '2022_07_26_072124_create___permissions_table', 1),
(58, '2022_07_26_072126_create___permission_instances_table', 1),
(59, '2022_07_26_072130_create___sessions_table', 1),
(60, '2022_07_26_072131_create___notifications_table', 1),
(61, '2022_07_26_072132_create___pref_items_table', 1),
(62, '2022_07_26_072135_create___reg_tokens_table', 1),
(63, '2022_07_26_072136_create___verif_tokens_table', 1),
(64, '2022_07_26_072137_create___email_addresses_table', 1),
(65, '2022_07_26_072140_create___phone_nos_table', 1),
(66, '2022_07_26_072324_create___files_table', 1),
(67, '2022_07_26_072326_create___feedback_reports_table', 1),
(68, '2022_07_26_072327_create___posts_table', 1),
(69, '2022_07_26_072332_create___assets_table', 1),
(70, '2022_07_26_072333_create___asset_wallets_table', 1),
(71, '2022_07_26_072334_create___asset_wallet_addresses_table', 1),
(72, '2022_07_26_072336_create___currencies_table', 1),
(73, '2022_07_26_072337_create___pymt_methods_table', 1),
(74, '2022_07_26_072345_create___countries_table', 1),
(75, '2022_07_26_072347_create___exportables_table', 1),
(76, '2022_07_26_072410_create___deposit_tokens_table', 1),
(77, '2022_07_26_072416_create___offers_table', 1),
(78, '2022_07_26_072417_create___trades_table', 1),
(79, '2022_07_26_072419_create___chats_table', 1),
(80, '2022_07_26_072420_create___messages_table', 1),
(81, '2022_07_26_072421_create___pinnings_table', 1),
(82, '2022_07_26_072424_create___reviews_table', 1),
(83, '2022_07_26_072443_create___transactions_table', 1),
(84, '2022_07_26_072444_create___logs_table', 1);

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
(1, NULL, 'Ankelli Personal Access Client', 'sh2Wk7EmTkVvHzFBIvUI1FrkJjbqz4M4yV9gdfG6', NULL, 'http://localhost', 1, 0, 0, '2022-10-04 17:34:27', '2022-10-04 17:34:27'),
(2, NULL, 'Ankelli Password Grant Client', 'J6dXPMWLmJrp8soNYpdA1uflL1ESQc2aj5WYuY9R', 'users', 'http://localhost', 0, 1, 0, '2022-10-04 17:34:27', '2022-10-04 17:34:27');

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
(1, 1, '2022-10-04 17:34:27', '2022-10-04 17:34:27');

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
(1, 'system', 'System', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(2, 'developer', 'Default Developer', 'active', 'system', '2022-10-04 17:32:17', '2022-10-04 17:32:17', NULL),
(3, 'sysadmin', 'Default System Administrator', 'active', 'system', '2022-10-04 17:32:22', '2022-10-04 17:32:22', NULL),
(4, 'reserves', 'Ankelli Asset Reserves', 'active', 'system', '2022-10-04 17:32:47', '2022-10-04 17:32:47', NULL),
(5, 'busadmin', 'Default Business Administrator', 'active', 'system', '2022-10-04 17:33:13', '2022-10-04 17:33:13', NULL),
(6, 'guddaz', 'Head System Developer', 'active', 'system', '2022-10-04 17:33:32', '2022-10-04 17:33:32', NULL),
(7, 'paywyze', 'Head Business Administrator', 'active', 'system', '2022-10-04 17:34:07', '2022-10-04 17:34:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__assets`
--

CREATE TABLE `__assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smallest_display_unit` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `onchain_disclaimer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tatum_mnemonic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_xpub` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_currency` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_status` enum('active','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__assets`
--

INSERT INTO `__assets` (`id`, `name`, `code`, `smallest_display_unit`, `onchain_disclaimer`, `tatum_mnemonic`, `tatum_xpub`, `tatum_currency`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`) VALUES
(1, 'Tether USD', 'USDT', '0.0001', 'This platform is still in test mode using the testnet chain.\nUSDT doesn\'t exist on testnet so we\'re using ETH but referring to it here as USDT.\nThe system does an internal conversion such that 1 ETH = 2000 USDT.\nHandle all internal transactions normally but know that these values will be reflected differently outside this platform.', 'again gospel obtain verify purchase insane hazard invest chicken lemon mother spring move tackle meat novel silk attack desk item anger scatter beef talent', 'xpub6ERKWaEy6mLBzYWoo5P19QTexUufpijY5qod5xaH2ksiYtekeFYAoT3JoK87XKULgG7g3yvvxKwsGEVdkTqcC3BFjthMtJendsN1WH9nHoX', 'ETH', 'active', 'system', '2022-10-04 17:32:12', '2022-10-04 17:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `__asset_wallets`
--

CREATE TABLE `__asset_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tatum_virtual_account_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_subscription_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usable_balance_asset_value` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_balance_asset_value` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `_status` enum('active','frozen') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__asset_wallets`
--

INSERT INTO `__asset_wallets` (`id`, `tatum_virtual_account_id`, `tatum_subscription_id`, `user_username`, `asset_code`, `usable_balance_asset_value`, `total_balance_asset_value`, `_status`, `created_datetime`, `updated_datetime`) VALUES
(1, '63296ef838931796fa9e5aed', '633c8a503813bd175c43f14c', 'reserves', 'USDT', '3071', '3071', 'active', '2022-10-04 17:32:33', '2022-10-04 17:39:24'),
(2, '632970417b09c5d6322bc225', '633c8a84c680ddc35db72a50', 'guddaz', 'USDT', '2171', '2171', 'active', '2022-10-04 17:33:24', '2022-10-04 17:39:19'),
(3, '63298faa64858e37282c6266', '633c8aa3bb3c96867b8e6ea1', 'paywyze', 'USDT', '800', '800', 'active', '2022-10-04 17:33:56', '2022-10-04 17:38:45'),
(4, '632c29781bfeea9fefca383d', '633c8abe46520598d78e9401', 'sekuru', 'USDT', '394', '394', 'active', '2022-10-04 17:34:22', '2022-10-04 17:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `__asset_wallet_addresses`
--

CREATE TABLE `__asset_wallet_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_wallet_id` bigint(20) UNSIGNED NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blockchain_address` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_derivation_key` int(10) UNSIGNED DEFAULT NULL,
  `onchain_txn_count` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_active_datetime` timestamp NULL DEFAULT NULL,
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__asset_wallet_addresses`
--

INSERT INTO `__asset_wallet_addresses` (`id`, `asset_wallet_id`, `user_username`, `blockchain_address`, `tatum_derivation_key`, `onchain_txn_count`, `created_datetime`, `last_active_datetime`, `deleted_datetime`) VALUES
(1, 1, 'reserves', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 6, 8, '2022-10-04 17:32:34', '2022-09-24 07:04:12', NULL),
(2, 1, 'reserves', '0x9210f311eae66d5ebed753842e6ba9ae03dd3637', 11, 2, '2022-10-04 17:32:35', '2022-09-25 04:45:12', NULL),
(3, 2, 'guddaz', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 7, 3, '2022-10-04 17:33:25', '2022-09-23 05:14:12', NULL),
(4, 2, 'guddaz', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 8, 3, '2022-10-04 17:33:26', '2022-09-23 05:12:42', NULL),
(5, 3, 'paywyze', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 9, 3, '2022-10-04 17:33:56', '2022-09-23 08:47:42', NULL),
(6, 4, 'sekuru', '0x6483545db0f4aeb80d52d67bd5a9ae73f57a14aa', 10, 2, '2022-10-04 17:34:23', '2022-09-23 05:28:12', NULL);

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
(1, 'sysadmin', 'deactivated', 'system', '2022-10-04 17:32:23', '2022-10-04 17:32:23', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-10-04 17:32:52', '2022-10-04 17:32:52', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-10-04 17:33:15', '2022-10-04 17:33:15', NULL);

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
(1, 'Zimbabwe', 'ZIM', NULL, NULL, NULL, 'active', 'system', '2022-10-04 19:32:01', NULL),
(2, 'South Africa', 'RSA', NULL, NULL, NULL, 'active', 'system', '2022-10-04 19:32:01', NULL),
(3, 'United Kingdom', 'UK', NULL, NULL, NULL, 'active', 'system', '2022-10-04 19:32:01', NULL),
(4, 'United States of America', 'USA', NULL, NULL, NULL, 'active', 'system', '2022-10-04 19:32:01', NULL),
(5, 'Russia', 'RUS', NULL, NULL, NULL, 'active', 'system', '2022-10-04 19:32:01', NULL),
(6, 'China', 'CHN', NULL, NULL, NULL, 'active', 'system', '2022-10-04 19:32:01', NULL),
(7, 'Ghana', 'GHA', NULL, NULL, NULL, 'active', 'system', '2022-10-04 19:32:01', NULL),
(8, 'Botswana', 'BOT', NULL, NULL, NULL, 'active', 'system', '2022-10-04 19:32:01', NULL),
(9, 'Zambia', 'ZAM', NULL, NULL, NULL, 'active', 'system', '2022-10-04 19:32:01', NULL),
(10, 'Algeria', 'ALG', NULL, NULL, NULL, 'active', 'system', '2022-10-04 19:32:01', NULL),
(11, 'Italy', 'ITA', NULL, NULL, NULL, 'active', 'system', '2022-10-04 19:32:01', NULL),
(12, 'Nigeria', 'NIG', NULL, NULL, NULL, 'active', 'system', '2022-10-04 19:32:01', NULL);

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
(1, 'US Dollar', 'USD', '$', 1, '1', '10', '1', 'active', 'system', '2022-10-04 19:32:01', NULL),
(2, 'Euro', 'EUR', '€', 1, '1.02', '10', '1', 'active', 'system', '2022-10-04 19:32:01', NULL),
(3, 'Pound Sterling', 'GBP', '£', 1, '0.89', '10', '1', 'active', 'system', '2022-10-04 19:32:01', NULL),
(4, 'South African Rand', 'ZAR', 'R', 0, '18', '100', '10', 'active', 'system', '2022-10-04 19:32:01', NULL),
(5, 'Zambian Kwacha', 'ZMW', 'K', 0, '14', '100', '10', 'active', 'system', '2022-10-04 19:32:01', NULL),
(6, 'Algerian Dinar', 'DZD', 'DA', 0, '210', '100', '100', 'active', 'system', '2022-10-04 19:32:01', NULL),
(7, 'Zimbabwean Dollar', 'ZWL', '$', 1, '800', '500', '50', 'active', 'system', '2022-10-04 19:32:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__deposit_tokens`
--

CREATE TABLE `__deposit_tokens` (
  `token` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_value` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_amount` bigint(20) UNSIGNED NOT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'developer.ankelli@gmail.com', 'developer', '2022-10-04 17:32:16', NULL),
(2, 'sysadmin@ankelli.com', 'sysadmin', '2022-10-04 17:32:21', NULL),
(3, 'reserves@ankelli.com', 'reserves', '2022-10-04 17:32:28', NULL),
(4, 'busadmin@ankelli.com', 'busadmin', '2022-10-04 17:33:12', NULL),
(5, 'goodhopedhliwayo@gmail.com', 'guddaz', '2022-10-04 17:33:20', NULL),
(6, 'paywyze@ankelli.com', 'paywyze', '2022-10-04 17:33:48', NULL),
(7, 'sekuru@ankelli.com', 'sekuru', '2022-10-04 17:34:19', NULL);

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
(1, '__pymt_methods', 'cash_in_person', 'images', 'pymt_method_icon', 'Cash in person', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Cash in person.jpg', 'image/jpg', NULL, 'Cash in person.jpg', NULL, 'system', '2022-10-04 17:32:00', NULL),
(2, '__pymt_methods', 'stanbic_bank', 'images', 'pymt_method_icon', 'Stanbic Bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Stanbic bank.jpg', 'image/jpg', NULL, 'Stanbic Bank Icon.jpg', NULL, 'system', '2022-10-04 17:32:00', NULL),
(3, '__pymt_methods', 'fnb_bank', 'images', 'pymt_method_icon', 'FNB Bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/FNB bank.png', 'image/png', NULL, 'FNB Bank Icon.png', NULL, 'system', '2022-10-04 17:32:00', NULL),
(4, '__pymt_methods', 'mukuru', 'images', 'pymt_method_icon', 'Mukuru Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Mukuru.jpg', 'image/jpg', NULL, 'Mukuru Icon.jpg', NULL, 'system', '2022-10-04 17:32:00', NULL),
(5, '__pymt_methods', 'algerie_poste', 'images', 'pymt_method_icon', 'Algerie poste Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Algerie poste.jpg', 'image/jpg', NULL, 'Algerie poste Icon.jpg', NULL, 'system', '2022-10-04 17:32:00', NULL),
(6, '__pymt_methods', 'mtn_momo', 'images', 'pymt_method_icon', 'MTN MOMO Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/MTN MOMO.png', 'image/png', NULL, 'MTN MOMO Icon.png', NULL, 'system', '2022-10-04 17:32:00', NULL),
(7, '__pymt_methods', 'ecocash', 'images', 'pymt_method_icon', 'Ecocash Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Ecocash.png', 'image/png', NULL, 'Ecocash Icon.png', NULL, 'system', '2022-10-04 17:32:00', NULL),
(8, '__pymt_methods', 'paypal', 'images', 'pymt_method_icon', 'Paypal Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Paypal.png', 'image/png', NULL, 'Paypal Icon.png', NULL, 'system', '2022-10-04 17:32:00', NULL),
(9, '__pymt_methods', 'skrill', 'images', 'pymt_method_icon', 'Skrill Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Skrill.jpg', 'image/jpg', NULL, 'Skrill Icon.jpg', NULL, 'system', '2022-10-04 17:32:00', NULL),
(10, '__pymt_methods', 'world_remit', 'images', 'pymt_method_icon', 'World Remit Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/World Remit.png', 'image/png', NULL, 'World Remit Icon.png', NULL, 'system', '2022-10-04 17:32:00', NULL),
(11, '__pymt_methods', 'mastercard', 'images', 'pymt_method_icon', 'Mastercard Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Mastercard.jpeg', 'image/jpeg', NULL, 'Mastercard Icon.jpeg', NULL, 'system', '2022-10-04 17:32:00', NULL),
(12, '__pymt_methods', 'visa', 'images', 'pymt_method_icon', 'Visa Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Visa.jpg', 'image/jpg', NULL, 'Visa Icon.jpg', NULL, 'system', '2022-10-04 17:32:00', NULL),
(13, '__pymt_methods', 'fbc_bank', 'images', 'pymt_method_icon', 'FBC bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/FBC bank.jpg', 'image/jpg', NULL, 'FBC bank Icon.jpg', NULL, 'system', '2022-10-04 17:32:00', NULL);

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
('0aynz9e0J5oNfjMg', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-04 17:32:31', NULL, NULL, '__users', 'reserves', '[{\"field_name\":\"tatum_customer_id\",\"old_value\":null,\"new_value\":\"6321ec61d5f2885b44f1bda0\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('0VIa3t8Tk0v1CPic', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:38:45', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":300,\"new_value\":800},{\"field_name\":\"total_balance_asset_value\",\"old_value\":300,\"new_value\":800}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('0Z9NxxhvFismZEgS', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-04 17:32:27', NULL, NULL, '__user_group_memberships', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('1BWemE3mkPSeUFoS', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-04 17:32:21', NULL, '1988824855F46', '__users', 'sysadmin', NULL, NULL),
('2GBSAfzAadKNZw0b', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-04 17:32:28', NULL, '188564A9BBCCF', '__email_addresses', 'reserves@ankelli.com', NULL, NULL),
('3c9FVHSWNxkMpfDR', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:37:15', NULL, NULL, '__notifications', '1619743951DBB', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('4kM3g0tk9X0WBiPJ', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:39:11', NULL, NULL, '__notifications', '1389200B86996', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('4ObksuSGeHEKjCa3', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:37:39', NULL, NULL, '__notifications', '192362E0B0AC7', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('4u3pgLoz3Ef9RDD5', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-04 17:33:18', NULL, NULL, '__user_group_memberships', '8', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('4ZSn9DZR94BSrlTv', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:37:21', NULL, NULL, '__notifications', '18857719A6A2A', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('5EeSTasMLcvXu7Yo', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:39:17', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":495,\"new_value\":395},{\"field_name\":\"total_balance_asset_value\",\"old_value\":495,\"new_value\":395}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('5JMEVR6MKa9lL2Vy', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-04 17:33:43', NULL, NULL, '__user_group_memberships', '9', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('5KeYifFjkiiMsqgp', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-04 17:33:32', NULL, NULL, '__asset_wallets', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('61foLULHnxj1l9Sb', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-04 17:33:07', NULL, NULL, '__user_group_memberships', '6', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('66WDTgFrt7rsa2Kc', 'FACTORY_SSN', 'Addition of _RegToken entry to database.', 'entry_create', 'system', '2022-10-04 17:34:26', NULL, NULL, '__reg_tokens', '1234567890', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('6KsefhFyXZ1qfblY', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:37:44', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":100,\"new_value\":200},{\"field_name\":\"total_balance_asset_value\",\"old_value\":100,\"new_value\":200}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('6WWBOgNCOldKaF2y', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-04 17:32:21', NULL, '1988824855F46', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('6Z7QAXmlpqlIttE3', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-04 17:32:17', NULL, NULL, '__user_group_memberships', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('7uAODQmGRHHpxlfp', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:37:18', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":170,\"new_value\":270},{\"field_name\":\"total_balance_asset_value\",\"old_value\":170,\"new_value\":270}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('7YI4m1BuEmNWHloB', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:38:51', NULL, NULL, '__notifications', '1579197A1FDD7', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('8gdaRRtD6qfegKzz', 'FACTORY_SSN', 'Addition of _Asset entry to database.', 'entry_create', 'system', '2022-10-04 17:32:14', NULL, NULL, '__assets', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('8oSjJ00YzY2av17a', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-04 17:34:15', NULL, NULL, '__user_group_memberships', '10', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('9GquVqurBfXb2S9L', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-04 17:33:26', NULL, NULL, '__asset_wallet_addresses', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('9YhUaRtdHYldWTPc', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-04 17:33:20', NULL, '1110598FAD9FF', '__users', 'guddaz', NULL, NULL),
('acfzSQC5aMtYd0to', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-04 17:33:12', NULL, '103957E86AA51', '__email_addresses', 'busadmin@ankelli.com', NULL, NULL),
('AyFiAC2lF4cN7OoR', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-04 17:32:16', NULL, '161345022F2DE', '__email_addresses', 'developer.ankelli@gmail.com', NULL, NULL),
('bhQKKFgzeIkwe4oL', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-04 17:32:47', NULL, NULL, '__user_group_memberships', '5', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('BMeA8fcimOLvM4nC', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-04 17:32:18', NULL, NULL, '__admin_extensions', 'developer', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('bShmutf1axCMdKvh', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:38:00', NULL, NULL, '__notifications', '168826809E6DC', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('C4I9qFJiQ4gyqewq', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-04 17:33:48', NULL, '1912531B23D5A', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('c81oh6QFI0mfSVoY', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-04 17:34:19', NULL, '1326063862249', '__notifications', '1792776F2CB56', NULL, NULL),
('CBGy61rFHq6bONZw', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-04 17:34:21', NULL, NULL, '__users', 'sekuru', '[{\"field_name\":\"tatum_customer_id\",\"old_value\":null,\"new_value\":\"63207c7291626c6cd5860a21\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('CcELnJSJcKJtUNiL', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:38:22', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":200,\"new_value\":300},{\"field_name\":\"total_balance_asset_value\",\"old_value\":200,\"new_value\":300}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('cnLqOlmTQ44wY5jE', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:37:24', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1571,\"new_value\":1671},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1571,\"new_value\":1671}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('CPgx4642ndWriiv6', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-04 17:32:23', NULL, NULL, '__admin_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('dfIxnY2BbCv7lkzm', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:37:25', NULL, NULL, '__notifications', '1349023F695B7', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('dHCoS7qTHbeeTtHf', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-04 17:33:48', NULL, '1912531B23D5A', '__email_addresses', 'paywyze@ankelli.com', NULL, NULL),
('dHdbDoHpUfQzUHcN', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-04 17:33:12', NULL, '103957E86AA51', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('dXTa8rpmnZ76lmHX', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-04 17:33:20', NULL, '1110598FAD9FF', '__email_addresses', 'goodhopedhliwayo@gmail.com', NULL, NULL),
('Ehlz9Q5Vu0wF7Wpt', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-10-04 17:32:25', NULL, NULL, '__buyer_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('eIIgG5RkAr2w4ZhD', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:38:25', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2205,\"new_value\":2665},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2205,\"new_value\":2665}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('EOP6EUD5QuEykTu0', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-04 17:32:28', NULL, '188564A9BBCCF', '__users', 'reserves', NULL, NULL),
('eRkgJGdGIYM0mGSO', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:38:18', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1000,\"new_value\":1100},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1000,\"new_value\":1100}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('F9oWyzGCbuHbvRUc', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-04 17:32:29', NULL, '188564A9BBCCF', '__notifications', '1068111B0F980', NULL, NULL),
('FHiEaUMYBfEm6IA0', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-04 17:33:37', NULL, NULL, '__admin_extensions', 'guddaz', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('hTBmzKEi6JsgMVzJ', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-04 17:32:41', NULL, NULL, '__asset_wallets', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('huMhzJbzAFcflno7', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-04 17:33:20', NULL, '1110598FAD9FF', '__notifications', '1597013C1FEA1', NULL, NULL),
('I7yQopmjoXz2P8vV', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:38:26', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2665,\"new_value\":2765},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2665,\"new_value\":2765}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('iAsthX9nt3XaFQ94', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-04 17:32:21', NULL, '1988824855F46', '__notifications', '140364C6E91B9', NULL, NULL),
('IBjzLsRrmxOscg23', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:39:01', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":600,\"new_value\":595},{\"field_name\":\"total_balance_asset_value\",\"old_value\":600,\"new_value\":595}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('ICKGg9NhIvTz8lcq', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:39:22', NULL, NULL, '__notifications', '17288554C80E7', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('iqJdGNjCrts4HzGE', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:38:29', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2765,\"new_value\":2865},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2765,\"new_value\":2865}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('is5g8zkXT8wPX6YS', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:38:23', NULL, NULL, '__notifications', '18211559CF5E4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('itUU1qL9SQiSG1la', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-04 17:33:23', NULL, NULL, '__users', 'guddaz', '[{\"field_name\":\"tatum_customer_id\",\"old_value\":null,\"new_value\":\"632970417b09c5d6322bc226\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('jAw04oIinR6NvmAu', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:38:11', NULL, NULL, '__notifications', '1957118DEDE65', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('JqNVBJfn8ibiK0P4', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:39:15', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2970,\"new_value\":3070},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2970,\"new_value\":3070}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('KeWuKcAIqI3Zx3FE', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:37:49', NULL, NULL, '__notifications', '1117115DD2F81', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('Kf6vvFRAqeR3xKko', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-04 17:32:52', NULL, NULL, '__admin_extensions', 'reserves', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('KJiwAmgIEoZD1Vch', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-04 17:34:19', NULL, '1326063862249', '__users', 'sekuru', NULL, NULL),
('LaqoNGcXfC83Lu0E', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-04 17:34:19', NULL, '1326063862249', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ln9kLGJiDwDMItgO', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:38:20', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2080,\"new_value\":2205},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2080,\"new_value\":2205}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('lWjHg8aahkhkzJtq', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-04 17:32:16', NULL, '161345022F2DE', '__notifications', '112713C115187', NULL, NULL),
('MbgKC9Q3dE0vJF0W', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-04 17:33:12', NULL, '103957E86AA51', '__users', 'busadmin', NULL, NULL),
('mE7TmbAFsDGo8pGA', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-04 17:33:48', NULL, '1912531B23D5A', '__users', 'paywyze', NULL, NULL),
('MG49rGu0KNWHiwxl', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:37:31', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1771,\"new_value\":1871},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1771,\"new_value\":1871}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('mGFkbWRdh7UnEOao', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-10-04 17:33:17', NULL, NULL, '__seller_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('mIUeMKuueKJT96cz', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-04 17:33:55', NULL, NULL, '__users', 'paywyze', '[{\"field_name\":\"tatum_customer_id\",\"old_value\":null,\"new_value\":\"63298faa64858e37282c6267\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('mJGPOOix43WzbLjb', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-04 17:33:19', NULL, '1110598FAD9FF', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('MovNlhvReqHnVCOi', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:37:17', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":170},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":170}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('mtFUI8UwQvbuoLKF', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-04 17:33:27', NULL, NULL, '__asset_wallet_addresses', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('mzDCjCvn1f6WiSjR', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-04 17:34:24', NULL, NULL, '__asset_wallet_addresses', '6', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('o01V6X8WwkiQm9h4', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:37:19', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":1571},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":1571}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('oEywNfZYc1Jstln5', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-04 17:34:07', NULL, NULL, '__asset_wallets', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('of7h8CJ9qUqDvFuZ', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-04 17:32:28', NULL, '188564A9BBCCF', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('okU45UjTG3COTtuE', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:37:55', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1871,\"new_value\":1971},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1871,\"new_value\":1971}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('QaN01cHVl22X4yd6', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:39:24', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":3070,\"new_value\":3071},{\"field_name\":\"total_balance_asset_value\",\"old_value\":3070,\"new_value\":3071}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('QayulfWRKD5PsgpR', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:37:33', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":100},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('QCuA5zom6ZejTSJU', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-04 17:33:48', NULL, '1912531B23D5A', '__notifications', '1346137B30D76', NULL, NULL),
('rdpXj2I1WnQN0hVr', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:38:05', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1971,\"new_value\":2071},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1971,\"new_value\":2071}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('ReDbrTPIUnQxFrsJ', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:39:06', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2965,\"new_value\":2970},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2965,\"new_value\":2970}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('rQoq2Xh3GZoJPaEl', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:39:14', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":595,\"new_value\":495},{\"field_name\":\"total_balance_asset_value\",\"old_value\":595,\"new_value\":495}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Rv3XZ0FdzbPRORkk', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-10-04 17:33:16', NULL, NULL, '__buyer_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('sHDFtBNSvIrZ9gXl', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-04 17:34:17', NULL, NULL, '__user_group_memberships', '12', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('sysXDiqWfU2THPtb', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:39:16', NULL, NULL, '__notifications', '169197482A66A', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('t3cozjC14wZp1s2s', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:38:35', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2865,\"new_value\":2965},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2865,\"new_value\":2965}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('TG1CdUyx8N3qpA1h', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-10-04 17:32:26', NULL, NULL, '__seller_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('tjXPQRkRd5nUUo2C', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:39:29', NULL, NULL, '__notifications', '103937827E348', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('TL8rG8f6k7vK0N4N', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-04 17:33:13', NULL, NULL, '__user_group_memberships', '7', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}');
INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('twe6f2ModcqBhEPy', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:37:22', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":270,\"new_value\":370},{\"field_name\":\"total_balance_asset_value\",\"old_value\":270,\"new_value\":370}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('tzVfCXxtaN8P7Aqw', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:38:19', NULL, NULL, '__notifications', '1115325634DAE', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('U7NJEI6976RP4Tlf', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-04 17:34:12', NULL, NULL, '__admin_extensions', 'paywyze', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('UDuEmcGfC9EhNEAu', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-04 17:32:35', NULL, NULL, '__asset_wallet_addresses', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('UfkzQn2ORNUOgMi1', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:37:14', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":1000},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":1000}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('uMzYyjheWY7xARaw', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-04 17:32:36', NULL, NULL, '__asset_wallet_addresses', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('v1B3od18PT21EmdB', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-04 17:32:22', NULL, NULL, '__user_group_memberships', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('vSO7AqLK2DfucvUL', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-04 17:33:15', NULL, NULL, '__admin_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('vvXywJHvlpPBkSGv', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:39:21', NULL, NULL, '__notifications', '196089736AFD5', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('vYJoKi8800ULRSNK', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-04 17:34:02', NULL, NULL, '__asset_wallet_addresses', '5', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('w4QP6JZHZ1rWo9ak', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-10-04 17:32:57', NULL, NULL, '__buyer_extensions', 'reserves', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('wGXBrQxgVwAvqoGu', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:38:15', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1980,\"new_value\":2080},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1980,\"new_value\":2080}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('WUCiAtnaTB30t3Tq', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:38:56', NULL, NULL, '__notifications', '1908519440DB4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('xaxAlaXfSKK8E3wP', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-04 17:32:20', NULL, NULL, '__user_group_memberships', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('y4mCN74iDA8pmYe9', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-04 17:34:25', NULL, NULL, '__asset_wallets', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('y7DPKSyygm0n1hqS', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:37:28', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1671,\"new_value\":1771},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1671,\"new_value\":1771}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('YFpURwWlwjkQRt7z', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:38:40', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1100,\"new_value\":600},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1100,\"new_value\":600}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('yHeAqpNb5L9c1NoQ', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-04 17:34:16', NULL, NULL, '__user_group_memberships', '11', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('YJFEPdzaPlEfFxbn', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-04 17:32:16', NULL, '161345022F2DE', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('YoO4c4vVCUaO8RmH', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-04 17:34:19', NULL, '1326063862249', '__email_addresses', 'sekuru@ankelli.com', NULL, NULL),
('YV0GC0H9CsxptQcs', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-04 17:33:12', NULL, '103957E86AA51', '__notifications', '1766065D64745', NULL, NULL),
('YYzMQ1A5aMVKegXS', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-04 17:32:16', NULL, '161345022F2DE', '__users', 'developer', NULL, NULL),
('z1ezKdEtBV9bxwnS', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:37:29', NULL, NULL, '__notifications', '141897CE5858C', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('z9wV6eFYz8eieS7l', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:37:26', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":370,\"new_value\":1980},{\"field_name\":\"total_balance_asset_value\",\"old_value\":370,\"new_value\":1980}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ZAHH7hQ7puH6KvG5', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-04 17:37:32', NULL, NULL, '__notifications', '1399491F5183B', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('zetoRZjdLHWoHleE', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-10-04 17:33:02', NULL, NULL, '__seller_extensions', 'reserves', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('zlKnZDkXAxn5KkSV', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:39:19', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2071,\"new_value\":2171},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2071,\"new_value\":2171}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ZLltdApqsxL9r7Mo', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-04 17:32:21', NULL, '1988824855F46', '__email_addresses', 'sysadmin@ankelli.com', NULL, NULL),
('zOvSoydlagR5pB18', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-04 17:39:23', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":395,\"new_value\":394},{\"field_name\":\"total_balance_asset_value\",\"old_value\":395,\"new_value\":394}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}');

-- --------------------------------------------------------

--
-- Table structure for table `__messages`
--

CREATE TABLE `__messages` (
  `id` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_table` enum('__chats','__trades') COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_uid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('103937827E348', 'sekuru', '{\"title\":\"Debit Transaction\",\"subtitle\":\"1 USDT has been debited from your account.\",\"body\":\"1 USDT has been debited from your account.\\nTxn ref: 18736415E1B9B.\\nDescription: Outbound platform charge fee for transaction 1105790DA4D87\\nNew balances: Usable : 394 USDT, Total : 394 USDT\"}', '2022-10-04 17:39:24', NULL),
('1068111B0F980', 'reserves', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-04 17:32:28', NULL),
('1115325634DAE', 'sekuru', '{\"title\":\"Credit Transaction\",\"subtitle\":\"100 USDT has been credited into your account.\",\"body\":\"100 USDT has been credited into your account.\\nTxn ref: 197664782819E.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 1100 USDT, Total : 1100 USDT\"}', '2022-10-04 17:38:18', NULL),
('1117115DD2F81', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"100 USDT has been credited into your account.\",\"body\":\"100 USDT has been credited into your account.\\nTxn ref: 1184687BAE9D1.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 200 USDT, Total : 200 USDT\"}', '2022-10-04 17:37:44', NULL),
('112713C115187', 'developer', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-04 17:32:16', NULL),
('1346137B30D76', 'paywyze', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-04 17:33:48', NULL),
('1349023F695B7', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"100 USDT has been credited into your account.\",\"body\":\"100 USDT has been credited into your account.\\nTxn ref: 15399962C764A.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 1671 USDT, Total : 1671 USDT\"}', '2022-10-04 17:37:24', NULL),
('1389200B86996', 'sekuru', '{\"title\":\"Debit Transaction\",\"subtitle\":\"5 USDT has been debited from your account.\",\"body\":\"5 USDT has been debited from your account.\\nTxn ref: 1706898F75A3C.\\nDescription: Reconciled payment\\nNew balances: Usable : 595 USDT, Total : 595 USDT\"}', '2022-10-04 17:39:06', NULL),
('1399491F5183B', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"100 USDT has been credited into your account.\",\"body\":\"100 USDT has been credited into your account.\\nTxn ref: 124057EC96AC5.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 1871 USDT, Total : 1871 USDT\"}', '2022-10-04 17:37:31', NULL),
('140364C6E91B9', 'sysadmin', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-04 17:32:21', NULL),
('141897CE5858C', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"100 USDT has been credited into your account.\",\"body\":\"100 USDT has been credited into your account.\\nTxn ref: 1836758EF2E8A.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 1771 USDT, Total : 1771 USDT\"}', '2022-10-04 17:37:28', NULL),
('1579197A1FDD7', 'sekuru', '{\"title\":\"Debit Transaction\",\"subtitle\":\"500 USDT has been debited from your account.\",\"body\":\"500 USDT has been debited from your account.\\nTxn ref: 1427315C0C6D0.\\nDescription: Reconciled payment\\nNew balances: Usable : 600 USDT, Total : 600 USDT\"}', '2022-10-04 17:38:45', NULL),
('1597013C1FEA1', 'guddaz', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-04 17:33:20', NULL),
('1619743951DBB', 'sekuru', '{\"title\":\"Credit Transaction\",\"subtitle\":\"1000 USDT has been credited into your account.\",\"body\":\"1000 USDT has been credited into your account.\\nTxn ref: 13344889D3BCD.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 1000 USDT, Total : 1000 USDT\"}', '2022-10-04 17:37:14', NULL),
('168826809E6DC', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"100 USDT has been credited into your account.\",\"body\":\"100 USDT has been credited into your account.\\nTxn ref: 18064151DFDDB.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 1971 USDT, Total : 1971 USDT\"}', '2022-10-04 17:37:55', NULL),
('169197482A66A', 'sekuru', '{\"title\":\"Debit Transaction\",\"subtitle\":\"100 USDT has been debited from your account.\",\"body\":\"100 USDT has been debited from your account.\\nTxn ref: 19810467CA02F.\\nDescription: Test sending offchain\\nNew balances: Usable : 495 USDT, Total : 495 USDT\"}', '2022-10-04 17:39:15', NULL),
('17288554C80E7', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"100 USDT has been credited into your account.\",\"body\":\"100 USDT has been credited into your account.\\nTxn ref: 1646717BD0F14.\\nDescription: Inbound asset release for trade 198388B36A31C\\nNew balances: Usable : 2171 USDT, Total : 2171 USDT\"}', '2022-10-04 17:39:21', NULL),
('1766065D64745', 'busadmin', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-04 17:33:12', NULL),
('1792776F2CB56', 'sekuru', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-04 17:34:19', NULL),
('18211559CF5E4', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"100 USDT has been credited into your account.\",\"body\":\"100 USDT has been credited into your account.\\nTxn ref: 1143453DDF3F4.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 300 USDT, Total : 300 USDT\"}', '2022-10-04 17:38:22', NULL),
('18857719A6A2A', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"1571 USDT has been credited into your account.\",\"body\":\"1571 USDT has been credited into your account.\\nTxn ref: 1318518240E93.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 1571 USDT, Total : 1571 USDT\"}', '2022-10-04 17:37:19', NULL),
('1908519440DB4', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"500 USDT has been credited into your account.\",\"body\":\"500 USDT has been credited into your account.\\nTxn ref: 1427315C0C6D0.\\nDescription: Reconciled payment\\nNew balances: Usable : 800 USDT, Total : 800 USDT\"}', '2022-10-04 17:38:51', NULL),
('192362E0B0AC7', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"100 USDT has been credited into your account.\",\"body\":\"100 USDT has been credited into your account.\\nTxn ref: 1351298AD29EC.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 100 USDT, Total : 100 USDT\"}', '2022-10-04 17:37:33', NULL),
('1957118DEDE65', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"100 USDT has been credited into your account.\",\"body\":\"100 USDT has been credited into your account.\\nTxn ref: 109078D71CEEC.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 2071 USDT, Total : 2071 USDT\"}', '2022-10-04 17:38:05', NULL),
('196089736AFD5', 'sekuru', '{\"title\":\"Debit Transaction\",\"subtitle\":\"100 USDT has been debited from your account.\",\"body\":\"100 USDT has been debited from your account.\\nTxn ref: 1646717BD0F14.\\nDescription: Outbound asset release for trade 198388B36A31C\\nNew balances: Usable : 395 USDT, Total : 395 USDT\"}', '2022-10-04 17:39:19', NULL);

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
  `offer_price` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trade_txn_fee_fctr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_trade_purchase_amount` bigint(20) UNSIGNED DEFAULT NULL,
  `max_trade_purchase_amount` bigint(20) UNSIGNED DEFAULT NULL,
  `offer_total_purchase_amount` bigint(20) UNSIGNED DEFAULT NULL,
  `filled_amount` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `min_trade_sell_value` varchar(38) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_trade_sell_value` varchar(38) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_total_sell_value` varchar(38) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filled_value` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `buyer_cmplt_trade_mins_tmt` tinyint(3) UNSIGNED NOT NULL,
  `pymt_method_slug` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pymt_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_status` enum('online','offline') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'online',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Update system config params', 'update_sysconfig_params', 'Permission holder can update system config params.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(2, 'Handle feedback reports', 'handle_feedback_reports', 'Permission holder can handle feedback reports.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(3, 'Manage datalists', 'manage_datalists', 'Permission holder can manage datalists.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(4, 'Manage system tools', 'manage_systools', 'Permission holder can manage system tools.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(5, 'View all logs', 'view_all_logs', 'Permission holder can view all logs.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(6, 'View all transactions', 'view_all_transactions', 'Permission holder can view all transactions.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(7, 'Manage Deposit Tokens', 'manage_deposit_tokens', 'Permission holder can create and edit deposit tokens.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(8, 'Handle Withdrawals', 'handle_withdrawals', 'Permission holder can handle withdrawals.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(9, 'Manage Registration Tokens', 'manage_reg_tokens', 'Permission holder can create and edit registration tokens.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(10, 'Handle flagged users', 'handle_flagged_users', 'Permission holder can handle flagged Users.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(11, 'Handle customer service chats', 'handle_customer_service_chats', 'Permission holder can handle customer service chats.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(12, 'Manage update posts', 'manage_update_posts', 'Permission holder can handle posting and editing update posts.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(13, 'Handle flagged business elems', 'handle_flagged_business_elems', 'Permission holder can handle flagged business elems (Offers, Trades, etc).', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL);

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
(1, '__user_groups', 'system_administrators', 'update_sysconfig_params', 'active', 'system', '2022-10-04 19:31:59', NULL),
(2, '__user_groups', 'system_administrators', 'handle_feedback_reports', 'active', 'system', '2022-10-04 19:31:59', NULL),
(3, '__user_groups', 'system_administrators', 'manage_systools', 'active', 'system', '2022-10-04 19:31:59', NULL),
(4, '__user_groups', 'system_administrators', 'manage_datalists', 'active', 'system', '2022-10-04 19:31:59', NULL),
(5, '__user_groups', 'system_administrators', 'view_all_logs', 'active', 'system', '2022-10-04 19:31:59', NULL),
(6, '__user_groups', 'business_administrators', 'view_all_transactions', 'active', 'system', '2022-10-04 19:31:59', NULL),
(7, '__user_groups', 'business_administrators', 'manage_deposit_tokens', 'active', 'system', '2022-10-04 19:31:59', NULL),
(8, '__user_groups', 'business_administrators', 'handle_withdrawals', 'active', 'system', '2022-10-04 19:31:59', NULL),
(9, '__user_groups', 'user_administrators', 'manage_reg_tokens', 'active', 'system', '2022-10-04 19:31:59', NULL),
(10, '__user_groups', 'user_administrators', 'handle_flagged_users', 'active', 'system', '2022-10-04 19:31:59', NULL),
(11, '__user_groups', 'moderators', 'handle_customer_service_chats', 'active', 'system', '2022-10-04 19:31:59', NULL),
(12, '__user_groups', 'moderators', 'handle_flagged_business_elems', 'active', 'system', '2022-10-04 19:31:59', NULL),
(13, '__user_groups', 'moderators', 'manage_update_posts', 'active', 'system', '2022-10-04 19:31:59', NULL);

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
(1, '__users', 'system', 'Backend rest api enabled', 'backend_rest_api_enabled', '1', 'boolean', 'system', '2022-10-04 19:32:00', NULL),
(2, '__users', 'system', 'Scaffolding app enabled', 'scaffolding_app_enabled', '1', 'boolean', 'system', '2022-10-04 19:32:00', NULL),
(3, '__users', 'system', 'Fallback Display Language', 'fallback_pref_lang', 'en', 'enum:langs', 'system', '2022-10-04 19:32:00', NULL),
(4, '__users', 'system', 'Fallback Display Theme', 'fallback_pref_theme', 'light', 'enum:themes', 'system', '2022-10-04 19:32:00', NULL),
(5, '__users', 'system', 'Image storage driver', 'image_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-10-04 19:32:00', NULL),
(6, '__users', 'system', 'Document storage driver', 'document_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-10-04 19:32:00', NULL),
(7, '__users', 'system', 'Open Registration enabled', 'open_reg_enabled', '0', 'boolean', 'system', '2022-10-04 19:32:00', NULL),
(8, '__users', 'system', 'Token registration enabled', 'token_reg_enabled', '0', 'boolean', 'system', '2022-10-04 19:32:00', NULL),
(9, '__users', 'system', 'Registration token max use count', 'reg_token_max_use_count', '10', 'integer', 'system', '2022-10-04 19:32:00', NULL),
(10, '__users', 'system', 'Offers to sell enabled', 'offer_to_sell_enabled', '0', 'boolean', 'system', '2022-10-04 19:32:00', NULL),
(11, '__users', 'system', 'Offers to buy enabled', 'offer_to_buy_enabled', '1', 'boolean', 'system', '2022-10-04 19:32:00', NULL),
(12, '__users', 'system', 'Min timeout (minutes) for buyer to open trade', 'buyer_open_trade_min_mins_tmt', '10', 'integer', 'system', '2022-10-04 19:32:00', NULL),
(13, '__users', 'system', 'Max timeout (minutes) for buyer to complete trade (auto flags)', 'buyer_cmplt_trade_max_mins_tmt', '240', 'integer', 'system', '2022-10-04 19:32:00', NULL),
(14, '__users', 'system', 'Use tatum crypto asset engine API', 'use_tatum_api', '1', 'boolean', 'system', '2022-10-04 19:32:00', NULL),
(15, '__users', 'system', 'Platform fee factor on trade transactions', 'trade_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-04 19:32:00', NULL),
(16, '__users', 'system', 'Platform fee factor on direct onchain transfers', 'drct_xfer_onchain_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-04 19:32:00', NULL),
(17, '__users', 'system', 'Platform fee factor on direct offchain transfers', 'drct_xfer_offchain_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-04 19:32:00', NULL),
(18, '__users', 'system', 'Platform fee factor on withdrawals', 'withdrawal_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-04 19:32:00', NULL),
(19, '__users', 'system', 'Platform fee factor on payments', 'pymt_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-04 19:32:00', NULL),
(20, '__users', 'system', 'Platform fee factor on crypto-fiat conversions', 'crypto_fiat_conv_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-04 19:32:00', NULL);

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
(1, 'Cash in person', 'cash_in_person', '5e5d4b', '[\"phone_no\"]', NULL, 'active', 'system', '2022-10-04 19:32:01', NULL, NULL),
(2, 'Stanbic bank', 'stanbic_bank', '066ef3', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-10-04 19:32:01', NULL, NULL),
(3, 'FNB bank', 'fnb_bank', '009eaa', '[\"account_holder_name\",\"account_no\"]', '[\"ZAR\"]', 'active', 'system', '2022-10-04 19:32:01', NULL, NULL),
(4, 'Mukuru', 'mukuru', 'e77924', '[\"fullname\",\"phone_no\"]', '[\"USD\"]', 'active', 'system', '2022-10-04 19:32:01', NULL, NULL),
(5, 'Algérie Poste', 'algerie_poste', '01009a', '[\"account_holder_name\",\"account_holder_address\",\"account_no\",\"account_key\"]', '[\"DZD\"]', 'active', 'system', '2022-10-04 19:32:01', NULL, NULL),
(6, 'MTN Mobile Money', 'mtn_momo', 'feca05', '[\"fullname\",\"phone_no\"]', NULL, 'active', 'system', '2022-10-04 19:32:01', NULL, NULL),
(7, 'Ecocash', 'ecocash', '005ba4', '[\"fullname\",\"phone_no\"]', '[\"ZWL\"]', 'active', 'system', '2022-10-04 19:32:01', NULL, NULL),
(8, 'Paypal', 'paypal', '27346a', '[\"fullname\",\"email_address\"]', '[\"USD\",\"EUR\",\"GBP\"]', 'active', 'system', '2022-10-04 19:32:01', NULL, NULL),
(9, 'Skrill', 'skrill', '862165', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-10-04 19:32:01', NULL, NULL),
(10, 'World Remit', 'world_remit', '604684', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-10-04 19:32:01', NULL, NULL),
(11, 'Mastercard', 'mastercard', 'cc0001', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-10-04 19:32:01', NULL, NULL),
(12, 'Visa', 'visa', '0055a5', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-10-04 19:32:01', NULL, NULL),
(13, 'FBC Bank', 'fbc_bank', '0055a5', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-10-04 19:32:01', NULL, NULL);

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
('1234567890', 'usable', 'system', '2022-10-04 17:34:25');

-- --------------------------------------------------------

--
-- Table structure for table `__reviews`
--

CREATE TABLE `__reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_table` enum('__users','__merchants') COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_uid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pivot_parent_table` enum('__trades','__orders') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pivot_parent_uid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `comment` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'sysadmin', 'deactivated', 'system', '2022-10-04 17:32:25', '2022-10-04 17:32:25', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-10-04 17:32:57', '2022-10-04 17:32:57', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-10-04 17:33:16', '2022-10-04 17:33:16', NULL);

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
('FACTORY_SSN', 'system', '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'ended', '2022-10-04 19:32:00', NULL, NULL, NULL),
('TATUM_NOTIFS_SSN', 'system', '{\"name\":\"Tatum Notification Station device\",\"version\":1}', '{\"name\":\"Tatum Notification Station agent app\",\"version\":1}', 'active', '2022-10-04 19:32:00', NULL, NULL, NULL),
('TEST_SSN', NULL, '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'active', '2022-10-04 19:32:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__trades`
--

CREATE TABLE `__trades` (
  `ref_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_ref_code` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `was_offer_to` enum('buy','sell') COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_value` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_amount` bigint(20) UNSIGNED NOT NULL,
  `tatum_amount_blockage_id` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_value_escrowed` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer_price` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_txn_fee_fctr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyer_cmplt_trade_mins_tmt` tinyint(3) UNSIGNED NOT NULL,
  `pymt_method_slug` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pymt_details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pymt_details_visible` tinyint(1) NOT NULL DEFAULT 0,
  `pymt_declared_datetime` timestamp NULL DEFAULT NULL,
  `pymt_confirmed_datetime` timestamp NULL DEFAULT NULL,
  `visible_to_creator` tinyint(1) NOT NULL DEFAULT 1,
  `visible_to_offer_creator` tinyint(1) NOT NULL DEFAULT 1,
  `buyer_opened_datetime` timestamp NULL DEFAULT NULL,
  `closed_datetime` timestamp NULL DEFAULT NULL,
  `_status` enum('active','cancelled','flagged','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `flag_raiser_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `__transactions`
--

CREATE TABLE `__transactions` (
  `ref_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_context` enum('onchain','offchain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `blockchain_txn_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_token` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_slug` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_blockchain_address` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destination_blockchain_address` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xfer_asset_value` varchar(38) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_result` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_datetime` timestamp NULL DEFAULT current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__transactions`
--

INSERT INTO `__transactions` (`ref_code`, `txn_context`, `blockchain_txn_id`, `tatum_reference`, `session_token`, `operation_slug`, `sender_username`, `sender_note`, `source_blockchain_address`, `recipient_username`, `recipient_note`, `destination_blockchain_address`, `asset_code`, `xfer_asset_value`, `transfer_result`, `transfer_datetime`, `deleted_datetime`) VALUES
('101080DC7180D', 'onchain', '0x57128993c347bcdbf13c3dda8ccf82cf8f8baa5622b4ec39a68878dd9cdcf9e4', '98c76796-a6e4-4724-909e-08df1d407e91', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'reserves', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '460', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2205,\"new_usable_balance_asset_value\":2665,\"old_total_balance_asset_value\":2205,\"new_total_balance_asset_value\":2665}]', '2022-09-24 04:58:57', NULL),
('109078D71CEEC', 'onchain', '0x8deeae1f13c3bf1080e6b92246fbf63518455f4958c252b971ae650771755847', '9f60b02a-a83c-46be-a1d8-973c5503fa03', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 'USDT', '100', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":1971,\"new_usable_balance_asset_value\":2071,\"old_total_balance_asset_value\":1971,\"new_total_balance_asset_value\":2071}]', '2022-09-23 05:14:12', NULL),
('111475CE54E22', 'onchain', '0xec4d69d07b5912932bfa0bbe087c79847b550f78ce5f3bc48858822caad6ade3', '630d71b4-bc46-4947-b4c5-7f39646f2e1f', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'reserves', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":170,\"new_usable_balance_asset_value\":270,\"old_total_balance_asset_value\":170,\"new_total_balance_asset_value\":270}]', '2022-09-22 14:44:27', NULL),
('1126196CB6A03', 'onchain', '0xac43f07a966f85c2f148105da58218522ea3577d6bfb192c29904607bb960e79', 'd75a2c60-096b-457d-809e-004a2eb8a362', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'reserves', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '125', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2080,\"new_usable_balance_asset_value\":2205,\"old_total_balance_asset_value\":2080,\"new_total_balance_asset_value\":2205}]', '2022-09-23 05:43:42', NULL),
('1143453DDF3F4', 'onchain', '0x37565f0833d8a65355f80136429a246311d6394af2f2670ab405915f0df3eef5', 'e465fa91-d750-4377-8679-f5643b73aca8', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'paywyze', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'USDT', '100', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":200,\"new_usable_balance_asset_value\":300,\"old_total_balance_asset_value\":200,\"new_total_balance_asset_value\":300}]', '2022-09-23 08:47:42', NULL),
('1184687BAE9D1', 'onchain', '0xc997855772123270b396ac8b9cc4143f60a9a57aa93b40fc962210e1c11dbc8b', 'bb6492ad-49f1-4226-ae2b-c4056e6066d6', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'paywyze', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'USDT', '100', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":100,\"new_usable_balance_asset_value\":200,\"old_total_balance_asset_value\":100,\"new_total_balance_asset_value\":200}]', '2022-09-23 04:17:42', NULL),
('124057EC96AC5', 'onchain', '0x7314a046630710fda5032d86af2b98d3dd5f21fa3c2b81839120417b2f31f468', '86840ae6-58da-47b5-84da-ef8517f2d1e6', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 'USDT', '100', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":1771,\"new_usable_balance_asset_value\":1871,\"old_total_balance_asset_value\":1771,\"new_total_balance_asset_value\":1871}]', '2022-09-23 01:19:12', NULL),
('129187D0F6BB0', 'onchain', '0x443bcefcd7d4e3c818217686f8e6a7e8fa4a90a2cb88e52f76aa8abf365b0149', '144a6741-b3d2-46ce-891d-e1e2dd4382b2', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'reserves', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x9210f311eae66d5ebed753842e6ba9ae03dd3637', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2865,\"new_usable_balance_asset_value\":2965,\"old_total_balance_asset_value\":2865,\"new_total_balance_asset_value\":2965}]', '2022-09-25 04:45:12', NULL),
('1318518240E93', 'onchain', '0xafd28520c21f6b505ec126bd0ddb198837c8702dba634a655074a07c6c027545', 'b9f1fa14-6d94-47f5-afb4-63f5eb6dc749', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 'USDT', '1571', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":1571,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":1571}]', '2022-09-22 16:30:57', NULL),
('13344889D3BCD', 'onchain', '0x1dc621ba6a1a797ba3bcc82d6487fa9611d68057105d3938276f80b620e19fc1', '55b36f0b-f4c1-49b5-8d31-1a2bc81e006b', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'sekuru', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x6483545db0f4aeb80d52d67bd5a9ae73f57a14aa', 'USDT', '1000', '[{\"user_username\":\"sekuru\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":1000,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":1000}]', '2022-09-22 07:37:41', NULL),
('1351298AD29EC', 'onchain', '0x8c2e8bbf031aa14db91d2b2485c4960b544184a48fc018ea81c5dcceaa26be44', '97699c1c-a3b2-434b-b9eb-e2fd29fc5e8d', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'paywyze', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'USDT', '100', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":100,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":100}]', '2022-09-23 01:24:12', NULL),
('138823228ACBD', 'onchain', '0xb62d8880a8f5cd9e2e10f8a60d73ca4f5568758506b67939f9a989a62f3cbcba', '5af4daab-2298-418a-b7a9-8d2341046c26', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'reserves', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '170', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":170,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":170}]', '2022-09-22 13:26:42', NULL),
('1427315C0C6D0', 'offchain', NULL, '916d3ee4-faee-4db0-b703-8f4341622305', 'TEST_SSN', 'payment_reconciliation', 'sekuru', 'Reconciled payment', NULL, 'paywyze', 'Reconciled payment', NULL, 'USDT', '500', '[{\"user_username\":\"sekuru\",\"old_usable_balance_asset_value\":1100,\"new_usable_balance_asset_value\":600,\"old_total_balance_asset_value\":1100,\"new_total_balance_asset_value\":600},{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":300,\"new_usable_balance_asset_value\":800,\"old_total_balance_asset_value\":300,\"new_total_balance_asset_value\":800}]', '2022-10-04 09:14:35', NULL),
('15399962C764A', 'onchain', '0x1f32121d65b6564d8c0bf7b3db0707fbe9898486160f6096ca0c366bf8daae0e', '58ccea92-1eaf-412d-84cc-3334c8e0f38c', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 'USDT', '100', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":1571,\"new_usable_balance_asset_value\":1671,\"old_total_balance_asset_value\":1571,\"new_total_balance_asset_value\":1671}]', '2022-09-22 17:22:12', NULL),
('158183C1378D9', 'onchain', '0x0d517112324571b63b159117c4eec22f61299254e3c4b2816b28a74fd18b85a7', '3a17f454-92a3-4dae-b445-13607f51bda7', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'reserves', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '1610', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":370,\"new_usable_balance_asset_value\":1980,\"old_total_balance_asset_value\":370,\"new_total_balance_asset_value\":1980}]', '2022-09-22 19:35:42', NULL),
('158646598181B', 'onchain', '0x3814d1d3c488aae7ec6f3e0d38e44273df12375770fbd45af1fdfadf117cb454', '600816e0-d753-4c13-a5ed-6411549150ee', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'reserves', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":270,\"new_usable_balance_asset_value\":370,\"old_total_balance_asset_value\":270,\"new_total_balance_asset_value\":370}]', '2022-09-22 16:32:43', NULL),
('1646717BD0F14', 'offchain', NULL, '83c91649-3d41-4110-8ebd-9c6ffd9da299', 'TEST_SSN', 'payment_reconciliation', 'sekuru', 'Outbound asset release for trade 198388B36A31C', NULL, 'guddaz', 'Inbound asset release for trade 198388B36A31C', NULL, 'USDT', '100', '[{\"user_username\":\"sekuru\",\"old_usable_balance_asset_value\":495,\"new_usable_balance_asset_value\":395,\"old_total_balance_asset_value\":495,\"new_total_balance_asset_value\":395},{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":2071,\"new_usable_balance_asset_value\":2171,\"old_total_balance_asset_value\":2071,\"new_total_balance_asset_value\":2171}]', '2022-10-04 17:13:35', NULL),
('1670540495F78', 'onchain', '0x16a1d7e1a6d948dc64406ddabfef44af9b1128d9d03ae78f8a331a422e0dd423', '0035d3b9-66ae-40b5-b424-a4dbb5ffdbe8', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'reserves', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1980,\"new_usable_balance_asset_value\":2080,\"old_total_balance_asset_value\":1980,\"new_total_balance_asset_value\":2080}]', '2022-09-23 05:17:27', NULL),
('1706898F75A3C', 'offchain', NULL, 'c363c123-5f67-4228-a0d8-c9ee029c9615', 'TEST_SSN', 'payment_reconciliation', 'sekuru', 'Reconciled payment', NULL, 'reserves', 'Reconciled payment', NULL, 'USDT', '5', '[{\"user_username\":\"sekuru\",\"old_usable_balance_asset_value\":600,\"new_usable_balance_asset_value\":595,\"old_total_balance_asset_value\":600,\"new_total_balance_asset_value\":595},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2965,\"new_usable_balance_asset_value\":2970,\"old_total_balance_asset_value\":2965,\"new_total_balance_asset_value\":2970}]', '2022-10-04 09:14:40', NULL),
('18064151DFDDB', 'onchain', '0x70de60f70bb4930f4d2711d3dbe0f87154f0405ce7a8d7e7c08dd5a634ce59b1', '9bd28cc6-9635-4abb-8dfe-618c66f991d9', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 'USDT', '100', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":1871,\"new_usable_balance_asset_value\":1971,\"old_total_balance_asset_value\":1871,\"new_total_balance_asset_value\":1971}]', '2022-09-23 05:12:42', NULL),
('1836758EF2E8A', 'onchain', '0x2884c784ce31f809476e48b28c67a9695d0a1303ca085b61517a0ac71fdffe44', '1297c197-0a96-4cad-9302-8d50736d84a0', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 'USDT', '100', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":1671,\"new_usable_balance_asset_value\":1771,\"old_total_balance_asset_value\":1671,\"new_total_balance_asset_value\":1771}]', '2022-09-23 01:07:42', NULL),
('18736415E1B9B', 'offchain', NULL, '252194ba-9748-4110-9e02-ed2e3b3bc918', 'TEST_SSN', 'payment_reconciliation', 'sekuru', 'Outbound platform charge fee for transaction 1105790DA4D87', NULL, 'reserves', 'Inbound platform charge fee for transaction 1105790DA4D87', NULL, 'USDT', '1', '[{\"user_username\":\"sekuru\",\"old_usable_balance_asset_value\":395,\"new_usable_balance_asset_value\":394,\"old_total_balance_asset_value\":395,\"new_total_balance_asset_value\":394},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":3070,\"new_usable_balance_asset_value\":3071,\"old_total_balance_asset_value\":3070,\"new_total_balance_asset_value\":3071}]', '2022-10-04 17:13:43', NULL),
('19268783B4427', 'onchain', '0x01dc63a1138eb09bb62ff0f5728b437b7b5da39ec842f86baa86b3f7153ca2d9', 'a41e6250-0499-44a3-95be-b3f45b2742e9', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'reserves', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x9210f311eae66d5ebed753842e6ba9ae03dd3637', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2765,\"new_usable_balance_asset_value\":2865,\"old_total_balance_asset_value\":2765,\"new_total_balance_asset_value\":2865}]', '2022-09-24 07:18:27', NULL),
('19509578AF535', 'onchain', '0xb394cca0ae08d34f068563799b8b6f82b88d5d42a9a80061a67f75982b2cfc5d', '61f71d83-b816-4a86-ab9b-82bd4efafc99', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'reserves', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2665,\"new_usable_balance_asset_value\":2765,\"old_total_balance_asset_value\":2665,\"new_total_balance_asset_value\":2765}]', '2022-09-24 07:04:12', NULL),
('197664782819E', 'onchain', '0x653654a901061ea2c09da6bc94c3e7b0c0cb63e4ba04101e81e0f84bb1381430', '03ba56b7-2354-480b-9611-3412f1d282f6', 'TEST_SSN', 'inbound_direct_transfer', NULL, NULL, NULL, 'sekuru', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x6483545db0f4aeb80d52d67bd5a9ae73f57a14aa', 'USDT', '100', '[{\"user_username\":\"sekuru\",\"old_usable_balance_asset_value\":1000,\"new_usable_balance_asset_value\":1100,\"old_total_balance_asset_value\":1000,\"new_total_balance_asset_value\":1100}]', '2022-09-23 05:28:12', NULL),
('19810467CA02F', 'offchain', NULL, 'bec599f3-c526-4680-b0c0-38260e0223ab', 'TEST_SSN', 'payment_reconciliation', 'sekuru', 'Test sending offchain', NULL, 'reserves', 'Test receiving offchain', NULL, 'USDT', '100', '[{\"user_username\":\"sekuru\",\"old_usable_balance_asset_value\":595,\"new_usable_balance_asset_value\":495,\"old_total_balance_asset_value\":595,\"new_total_balance_asset_value\":495},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2970,\"new_usable_balance_asset_value\":3070,\"old_total_balance_asset_value\":2970,\"new_total_balance_asset_value\":3070}]', '2022-10-04 15:24:31', NULL);

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
(1, 'system', 'system', '', NULL, NULL, NULL, 'active', '2022-10-04 19:31:58', NULL, NULL),
(2, 'developer', 'developer.ankelli@gmail.com', '$2y$10$56HdbLtH6NF408UMVqX8ieh5iIgLmiklBejvU6lah5vpM6JnUYHRe', NULL, NULL, NULL, 'active', '2022-10-04 17:32:14', '2022-10-04 17:32:14', NULL),
(3, 'sysadmin', 'sysadmin@ankelli.com', '$2y$10$BvDdkS0EjMm6lLTdDRFLf.dr8LRk6U8ctYrS80SWtrevBsGOhExJW', NULL, NULL, NULL, 'active', '2022-10-04 17:32:20', '2022-10-04 17:32:20', NULL),
(4, 'reserves', 'reserves@ankelli.com', '$2y$10$wnXZVc6YX2JFfWHqI34cHup4JBkRQE9.NwzP72wjPlVnwmt9N.c3e', NULL, NULL, '6321ec61d5f2885b44f1bda0', 'active', '2022-10-04 17:32:27', '2022-10-04 17:32:31', NULL),
(5, 'busadmin', 'busadmin@ankelli.com', '$2y$10$yUhZIQEOwbL41LL66POJXuZDlIHfZIsBw66IS0f20NRIoPuQoGC.a', NULL, NULL, NULL, 'active', '2022-10-04 17:33:07', '2022-10-04 17:33:07', NULL),
(6, 'guddaz', 'goodhopedhliwayo@gmail.com', '$2y$10$xarS6GJ2IuFw2nSp.Stf7OeVCVt4L2VCUxFM4s8vCtc8L54qXAxvC', NULL, NULL, '632970417b09c5d6322bc226', 'active', '2022-10-04 17:33:18', '2022-10-04 17:33:23', NULL),
(7, 'paywyze', 'paywyze@ankelli.com', '$2y$10$7GLKnq4pVunodZVyQffMdujAU7W1gNFrN1m88oZyGgmE0Zaxkfi1S', NULL, NULL, '63298faa64858e37282c6267', 'active', '2022-10-04 17:33:43', '2022-10-04 17:33:55', NULL),
(8, 'sekuru', 'sekuru@ankelli.com', '$2y$10$sRiR4Mz5oVWi6gPZy5J0.uQlQLCLp5JP6PcBP1aerb71OJ5on7LQi', NULL, NULL, '63207c7291626c6cd5860a21', 'active', '2022-10-04 17:34:17', '2022-10-04 17:34:21', NULL);

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
(1, 'Default Users', 'default_users', 'Group for Default User accounts created on system initialization and factory_data loading. \nNew users cannot be added to this group.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(2, 'Administrators', 'administrators', 'Automatically joined group (Users with active Admin Extension). \nMembers can be added to other admin groups.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(3, 'Developers', 'developers', 'Admin group for unrestricted system users. \nMembers have access to all features and OTP access to account named \"developer\". \nOnly \"developer\" account can add members to this group.\nGroup used for System Development and Maintenance.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(4, 'System Administrators', 'system_administrators', 'Admin Group for System Administrators. \nMembers can manage system functions and sysconfig params. \nMembers have OTP access to account named \"sysadmin\".\nOnly \"sysadmin\" account can add members to this group.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(5, 'Business Administrators', 'business_administrators', 'Admin group for Business Administrators.\nMembers have access to business related features.\nMembers have OTP access to accounts named \"reserves\" and \"busadmin\".\nOnly \"busadmin\" account can add members to this group.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(6, 'User Administrators', 'user_administrators', 'Admin group for User Administrators. \nMembers can manage other users and user related queries.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(7, 'Platform moderators', 'moderators', 'Group for Platform moderators. \nMembers can respond in the customer service chat module, handle flagged business elements, manage daily updates.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(8, 'Sellers', 'sellers', 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(9, 'Buyers', 'buyers', 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL),
(10, 'Beta Testers', 'beta_testers', 'User Group for selected individuals to test certain features before they are published.', 'active', 'system', '2022-10-04 19:31:59', NULL, NULL);

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
(1, 'developer', 'default_users', 'active', 'system', '2022-10-04 17:32:16', '2022-10-04 17:32:16'),
(2, 'developer', 'developers', 'active', 'system', '2022-10-04 17:32:18', '2022-10-04 17:32:18'),
(3, 'sysadmin', 'default_users', 'active', 'system', '2022-10-04 17:32:21', '2022-10-04 17:32:21'),
(4, 'sysadmin', 'system_administrators', 'active', 'system', '2022-10-04 17:32:26', '2022-10-04 17:32:26'),
(5, 'reserves', 'default_users', 'active', 'system', '2022-10-04 17:32:41', '2022-10-04 17:32:41'),
(6, 'reserves', 'business_administrators', 'active', 'system', '2022-10-04 17:33:02', '2022-10-04 17:33:02'),
(7, 'busadmin', 'default_users', 'active', 'system', '2022-10-04 17:33:12', '2022-10-04 17:33:12'),
(8, 'busadmin', 'business_administrators', 'active', 'system', '2022-10-04 17:33:17', '2022-10-04 17:33:17'),
(9, 'guddaz', 'developers', 'active', 'system', '2022-10-04 17:33:38', '2022-10-04 17:33:38'),
(10, 'paywyze', 'system_administrators', 'active', 'system', '2022-10-04 17:34:12', '2022-10-04 17:34:12'),
(11, 'paywyze', 'user_administrators', 'active', 'system', '2022-10-04 17:34:15', '2022-10-04 17:34:15'),
(12, 'paywyze', 'business_administrators', 'active', 'system', '2022-10-04 17:34:16', '2022-10-04 17:34:16');

-- --------------------------------------------------------

--
-- Table structure for table `__verif_tokens`
--

CREATE TABLE `__verif_tokens` (
  `token` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiving_resource_table` enum('__phone_nos','__email_addresses') COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiving_resource_id` bigint(20) UNSIGNED NOT NULL,
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
-- Indexes for table `__asset_wallets`
--
ALTER TABLE `__asset_wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__asset_wallets_user_username_asset_code_unique` (`user_username`,`asset_code`),
  ADD KEY `__asset_wallets_asset_code_foreign` (`asset_code`);

--
-- Indexes for table `__asset_wallet_addresses`
--
ALTER TABLE `__asset_wallet_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_wallet_id_blockchain_address_tatum_derivation_key_unique` (`asset_wallet_id`,`blockchain_address`,`tatum_derivation_key`),
  ADD UNIQUE KEY `__asset_wallet_addresses_blockchain_address_unique` (`blockchain_address`),
  ADD KEY `__asset_wallet_addresses_user_username_foreign` (`user_username`);

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
-- Indexes for table `__reviews`
--
ALTER TABLE `__reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parent_table_uid_pivot_parent_table_uid_creator_username_unique` (`parent_table`,`parent_uid`,`pivot_parent_table`,`pivot_parent_uid`,`creator_username`),
  ADD KEY `__reviews_creator_username_foreign` (`creator_username`);

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
  ADD KEY `__trades_offer_ref_code_foreign` (`offer_ref_code`),
  ADD KEY `__trades_asset_code_foreign` (`asset_code`),
  ADD KEY `__trades_currency_code_foreign` (`currency_code`),
  ADD KEY `__trades_pymt_method_slug_foreign` (`pymt_method_slug`),
  ADD KEY `__trades_flag_raiser_username_foreign` (`flag_raiser_username`),
  ADD KEY `__trades_offer_creator_username_foreign` (`offer_creator_username`),
  ADD KEY `__trades_creator_username_foreign` (`creator_username`);

--
-- Indexes for table `__transactions`
--
ALTER TABLE `__transactions`
  ADD PRIMARY KEY (`ref_code`),
  ADD UNIQUE KEY `__transactions_blockchain_txn_id_unique` (`blockchain_txn_id`),
  ADD KEY `__transactions_session_token_foreign` (`session_token`),
  ADD KEY `__transactions_sender_username_foreign` (`sender_username`),
  ADD KEY `__transactions_recipient_username_foreign` (`recipient_username`),
  ADD KEY `__transactions_destination_blockchain_address_foreign` (`destination_blockchain_address`),
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

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
-- AUTO_INCREMENT for table `__asset_wallets`
--
ALTER TABLE `__asset_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `__asset_wallet_addresses`
--
ALTER TABLE `__asset_wallet_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `__buyer_extensions`
--
ALTER TABLE `__buyer_extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `__pymt_methods`
--
ALTER TABLE `__pymt_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `__reviews`
--
ALTER TABLE `__reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `__seller_extensions`
--
ALTER TABLE `__seller_extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `__users`
--
ALTER TABLE `__users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- Constraints for table `__asset_wallets`
--
ALTER TABLE `__asset_wallets`
  ADD CONSTRAINT `__asset_wallets_asset_code_foreign` FOREIGN KEY (`asset_code`) REFERENCES `__assets` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__asset_wallets_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__asset_wallet_addresses`
--
ALTER TABLE `__asset_wallet_addresses`
  ADD CONSTRAINT `__asset_wallet_addresses_asset_wallet_id_foreign` FOREIGN KEY (`asset_wallet_id`) REFERENCES `__asset_wallets` (`id`),
  ADD CONSTRAINT `__asset_wallet_addresses_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

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
-- Constraints for table `__reviews`
--
ALTER TABLE `__reviews`
  ADD CONSTRAINT `__reviews_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

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
  ADD CONSTRAINT `__trades_flag_raiser_username_foreign` FOREIGN KEY (`flag_raiser_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__trades_offer_creator_username_foreign` FOREIGN KEY (`offer_creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__trades_offer_ref_code_foreign` FOREIGN KEY (`offer_ref_code`) REFERENCES `__offers` (`ref_code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__trades_pymt_method_slug_foreign` FOREIGN KEY (`pymt_method_slug`) REFERENCES `__pymt_methods` (`slug`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__transactions`
--
ALTER TABLE `__transactions`
  ADD CONSTRAINT `__transactions_asset_code_foreign` FOREIGN KEY (`asset_code`) REFERENCES `__assets` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__transactions_destination_blockchain_address_foreign` FOREIGN KEY (`destination_blockchain_address`) REFERENCES `__asset_wallet_addresses` (`blockchain_address`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__transactions_recipient_username_foreign` FOREIGN KEY (`recipient_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__transactions_sender_username_foreign` FOREIGN KEY (`sender_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__transactions_session_token_foreign` FOREIGN KEY (`session_token`) REFERENCES `__sessions` (`token`) ON DELETE SET NULL ON UPDATE CASCADE;

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
