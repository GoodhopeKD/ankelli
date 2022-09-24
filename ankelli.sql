-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 24, 2022 at 10:25 AM
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_07_26_072110_create___admin_extensions_table', 1),
(11, '2022_07_26_072112_create___buyer_extensions_table', 1),
(12, '2022_07_26_072114_create___seller_extensions_table', 1),
(13, '2022_07_26_072120_create___user_groups_table', 1),
(14, '2022_07_26_072122_create___user_group_memberships_table', 1),
(15, '2022_07_26_072124_create___permissions_table', 1),
(16, '2022_07_26_072126_create___permission_instances_table', 1),
(17, '2022_07_26_072130_create___sessions_table', 1),
(18, '2022_07_26_072131_create___notifications_table', 1),
(19, '2022_07_26_072132_create___pref_items_table', 1),
(20, '2022_07_26_072135_create___reg_tokens_table', 1),
(21, '2022_07_26_072136_create___verif_tokens_table', 1),
(22, '2022_07_26_072137_create___email_addresses_table', 1),
(23, '2022_07_26_072140_create___phone_nos_table', 1),
(24, '2022_07_26_072324_create___files_table', 1),
(25, '2022_07_26_072326_create___feedback_reports_table', 1),
(26, '2022_07_26_072327_create___posts_table', 1),
(27, '2022_07_26_072332_create___assets_table', 1),
(28, '2022_07_26_072333_create___asset_accounts_table', 1),
(29, '2022_07_26_072334_create___asset_account_addresses_table', 1),
(30, '2022_07_26_072336_create___currencies_table', 1),
(31, '2022_07_26_072337_create___pymt_methods_table', 1),
(32, '2022_07_26_072345_create___countries_table', 1),
(33, '2022_07_26_072347_create___exportables_table', 1),
(34, '2022_07_26_072410_create___deposit_tokens_table', 1),
(35, '2022_07_26_072416_create___offers_table', 1),
(36, '2022_07_26_072417_create___trades_table', 1),
(37, '2022_07_26_072419_create___chats_table', 1),
(38, '2022_07_26_072420_create___messages_table', 1),
(39, '2022_07_26_072421_create___pinnings_table', 1),
(40, '2022_07_26_072443_create___transactions_table', 1),
(41, '2022_07_26_072444_create___logs_table', 1);

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
(1, NULL, 'Ankelli Personal Access Client', '5Too92k1hujBaNgKUqHvA5EiRaWPz2zFUE27v7CC', NULL, 'http://localhost', 1, 0, 0, '2022-09-24 06:15:43', '2022-09-24 06:15:43'),
(2, NULL, 'Ankelli Password Grant Client', 'rIfvrlFifD2W8mzq5Nn9pIpKhnujFRE5DNO6yG79', 'users', 'http://localhost', 0, 1, 0, '2022-09-24 06:15:43', '2022-09-24 06:15:43');

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
(1, 1, '2022-09-24 06:15:43', '2022-09-24 06:15:43');

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
(1, 'system', 'System', 'active', 'system', '2022-09-24 08:13:07', NULL, NULL),
(2, 'developer', 'Default Developer', 'active', 'system', '2022-09-24 06:13:22', '2022-09-24 06:13:22', NULL),
(3, 'sysadmin', 'Default System Administrator', 'active', 'system', '2022-09-24 06:13:26', '2022-09-24 06:13:26', NULL),
(4, 'reserves', 'Ankelli Asset Reserves', 'active', 'system', '2022-09-24 06:13:51', '2022-09-24 06:13:51', NULL),
(5, 'busadmin', 'Default Business Administrator', 'active', 'system', '2022-09-24 06:14:17', '2022-09-24 06:14:17', NULL),
(6, 'guddaz', 'Head System Developer', 'active', 'system', '2022-09-24 06:14:43', '2022-09-24 06:14:43', NULL),
(7, 'paywyze', 'Head Business Administrator', 'active', 'system', '2022-09-24 06:15:17', '2022-09-24 06:15:17', NULL);

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
(1, 'Tether USD', 'USDT', '0.0001', 'Our USDT is hosted on the Ethereum network.\nAll blockchain transactions should be handled accordingly.', 'again gospel obtain verify purchase insane hazard invest chicken lemon mother spring move tackle meat novel silk attack desk item anger scatter beef talent', 'xpub6ERKWaEy6mLBzYWoo5P19QTexUufpijY5qod5xaH2ksiYtekeFYAoT3JoK87XKULgG7g3yvvxKwsGEVdkTqcC3BFjthMtJendsN1WH9nHoX', 'ETH', 'active', 'system', '2022-09-24 06:13:15', '2022-09-24 06:13:15');

-- --------------------------------------------------------

--
-- Table structure for table `__asset_accounts`
--

CREATE TABLE `__asset_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tatum_virtual_account_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_subscription_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `__asset_accounts` (`id`, `tatum_virtual_account_id`, `tatum_subscription_id`, `user_username`, `asset_code`, `usable_balance_asset_value`, `total_balance_asset_value`, `_status`, `created_datetime`, `updated_datetime`) VALUES
(1, '63296ef838931796fa9e5aed', '632ebc31549914722e287816', 'reserves', 'USDT', '1.3325', '1.3325', 'active', '2022-09-24 06:13:37', '2022-09-24 06:24:19'),
(2, '632970417b09c5d6322bc225', '632ebc684f2b4cbb05c62c41', 'guddaz', 'USDT', '1.0355', '1.0355', 'active', '2022-09-24 06:14:32', '2022-09-24 06:23:50'),
(3, '63298faa64858e37282c6266', '632ebc8cdce3c67af1688af1', 'paywyze', 'USDT', '0.15', '0.15', 'active', '2022-09-24 06:15:11', '2022-09-24 06:24:16'),
(4, '632c29781bfeea9fefca383d', '632ebca6549914722e28781d', 'sekuru', 'USDT', '0.55', '0.55', 'active', '2022-09-24 06:15:34', '2022-09-24 06:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `__asset_account_addresses`
--

CREATE TABLE `__asset_account_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_account_id` bigint(20) UNSIGNED NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blockchain_address` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_derivation_key` int(10) UNSIGNED DEFAULT NULL,
  `onchain_txcount` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_active_datetime` timestamp NULL DEFAULT NULL,
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__asset_account_addresses`
--

INSERT INTO `__asset_account_addresses` (`id`, `asset_account_id`, `user_username`, `blockchain_address`, `tatum_derivation_key`, `onchain_txcount`, `created_datetime`, `last_active_datetime`, `deleted_datetime`) VALUES
(1, 1, 'reserves', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 6, 7, '2022-09-24 06:13:38', '2022-09-24 04:58:57', NULL),
(2, 1, 'reserves', '0x9210f311eae66d5ebed753842e6ba9ae03dd3637', 11, 0, '2022-09-24 06:13:39', NULL, NULL),
(3, 2, 'guddaz', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 7, 3, '2022-09-24 06:14:33', '2022-09-23 05:14:12', NULL),
(4, 2, 'guddaz', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 8, 3, '2022-09-24 06:14:34', '2022-09-23 05:12:42', NULL),
(5, 3, 'paywyze', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 9, 3, '2022-09-24 06:15:12', '2022-09-23 08:47:42', NULL),
(6, 4, 'sekuru', '0x6483545db0f4aeb80d52d67bd5a9ae73f57a14aa', 10, 2, '2022-09-24 06:15:35', '2022-09-23 05:28:12', NULL);

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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-24 06:13:27', '2022-09-24 06:13:27', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-24 06:13:56', '2022-09-24 06:13:56', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-24 06:14:22', '2022-09-24 06:14:22', NULL);

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
(1, 'Zimbabwe', 'ZIM', NULL, NULL, NULL, 'active', 'system', '2022-09-24 08:13:09', NULL),
(2, 'South Africa', 'RSA', NULL, NULL, NULL, 'active', 'system', '2022-09-24 08:13:09', NULL),
(3, 'United Kingdom', 'UK', NULL, NULL, NULL, 'active', 'system', '2022-09-24 08:13:09', NULL),
(4, 'United States of America', 'USA', NULL, NULL, NULL, 'active', 'system', '2022-09-24 08:13:09', NULL),
(5, 'Russia', 'RUS', NULL, NULL, NULL, 'active', 'system', '2022-09-24 08:13:09', NULL),
(6, 'China', 'CHN', NULL, NULL, NULL, 'active', 'system', '2022-09-24 08:13:09', NULL),
(7, 'Ghana', 'GHA', NULL, NULL, NULL, 'active', 'system', '2022-09-24 08:13:09', NULL),
(8, 'Botswana', 'BOT', NULL, NULL, NULL, 'active', 'system', '2022-09-24 08:13:09', NULL),
(9, 'Zambia', 'ZAM', NULL, NULL, NULL, 'active', 'system', '2022-09-24 08:13:09', NULL),
(10, 'Algeria', 'ALG', NULL, NULL, NULL, 'active', 'system', '2022-09-24 08:13:09', NULL),
(11, 'Italy', 'ITA', NULL, NULL, NULL, 'active', 'system', '2022-09-24 08:13:09', NULL),
(12, 'Nigeria', 'NIG', NULL, NULL, NULL, 'active', 'system', '2022-09-24 08:13:09', NULL);

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
(1, 'US Dollar', 'USD', '$', 1, '1', '10', '5', 'active', 'system', '2022-09-24 08:13:09', NULL),
(2, 'Euro', 'EUR', '€', 1, '0.87', '10', '5', 'active', 'system', '2022-09-24 08:13:09', NULL),
(3, 'Pound Sterling', 'GBP', '£', 1, '0.77', '10', '5', 'active', 'system', '2022-09-24 08:13:09', NULL),
(4, 'South African Rand', 'ZAR', 'R', 0, '16', '100', '100', 'active', 'system', '2022-09-24 08:13:09', NULL),
(5, 'Zambian Kwacha', 'ZMW', 'K', 0, '15', '100', '100', 'active', 'system', '2022-09-24 08:13:09', NULL),
(6, 'Algerian Dinar', 'DZD', 'DA', 0, '180', '100', '100', 'active', 'system', '2022-09-24 08:13:09', NULL),
(7, 'Zimbabwean Dollar', 'ZWL', '$', 1, '10000', '500', '5000', 'active', 'system', '2022-09-24 08:13:09', NULL);

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
(1, 'developer.ankelli@gmail.com', 'developer', '2022-09-24 06:13:17', NULL),
(2, 'sysadmin@ankelli.com', 'sysadmin', '2022-09-24 06:13:25', NULL),
(3, 'reserves@ankelli.com', 'reserves', '2022-09-24 06:13:34', NULL),
(4, 'busadmin@ankelli.com', 'busadmin', '2022-09-24 06:14:16', NULL),
(5, 'goodhopedhliwayo@gmail.com', 'guddaz', '2022-09-24 06:14:26', NULL),
(6, 'paywyze@ankelli.com', 'paywyze', '2022-09-24 06:15:01', NULL),
(7, 'sekuru@ankelli.com', 'sekuru', '2022-09-24 06:15:27', NULL);

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
(1, '__pymt_methods', 'cash_in_person', 'images', 'pymt_method_icon', 'Cash in person', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Cash in person.jpg', 'image/jpg', NULL, 'Cash in person.jpg', NULL, 'system', '2022-09-24 06:13:08', NULL),
(2, '__pymt_methods', 'stanbic_bank', 'images', 'pymt_method_icon', 'Stanbic Bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Stanbic bank.jpg', 'image/jpg', NULL, 'Stanbic Bank Icon.jpg', NULL, 'system', '2022-09-24 06:13:08', NULL),
(3, '__pymt_methods', 'fnb_bank', 'images', 'pymt_method_icon', 'FNB Bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/FNB bank.png', 'image/png', NULL, 'FNB Bank Icon.png', NULL, 'system', '2022-09-24 06:13:08', NULL),
(4, '__pymt_methods', 'mukuru', 'images', 'pymt_method_icon', 'Mukuru Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Mukuru.jpg', 'image/jpg', NULL, 'Mukuru Icon.jpg', NULL, 'system', '2022-09-24 06:13:08', NULL),
(5, '__pymt_methods', 'algerie_poste', 'images', 'pymt_method_icon', 'Algerie poste Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Algerie poste.jpg', 'image/jpg', NULL, 'Algerie poste Icon.jpg', NULL, 'system', '2022-09-24 06:13:08', NULL),
(6, '__pymt_methods', 'mtn_momo', 'images', 'pymt_method_icon', 'MTN MOMO Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/MTN MOMO.png', 'image/png', NULL, 'MTN MOMO Icon.png', NULL, 'system', '2022-09-24 06:13:08', NULL),
(7, '__pymt_methods', 'ecocash', 'images', 'pymt_method_icon', 'Ecocash Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Ecocash.png', 'image/png', NULL, 'Ecocash Icon.png', NULL, 'system', '2022-09-24 06:13:08', NULL),
(8, '__pymt_methods', 'paypal', 'images', 'pymt_method_icon', 'Paypal Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Paypal.png', 'image/png', NULL, 'Paypal Icon.png', NULL, 'system', '2022-09-24 06:13:08', NULL),
(9, '__pymt_methods', 'skrill', 'images', 'pymt_method_icon', 'Skrill Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Skrill.jpg', 'image/jpg', NULL, 'Skrill Icon.jpg', NULL, 'system', '2022-09-24 06:13:08', NULL),
(10, '__pymt_methods', 'world_remit', 'images', 'pymt_method_icon', 'World Remit Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/World Remit.png', 'image/png', NULL, 'World Remit Icon.png', NULL, 'system', '2022-09-24 06:13:08', NULL),
(11, '__pymt_methods', 'mastercard', 'images', 'pymt_method_icon', 'Mastercard Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Mastercard.jpeg', 'image/jpeg', NULL, 'Mastercard Icon.jpeg', NULL, 'system', '2022-09-24 06:13:08', NULL),
(12, '__pymt_methods', 'visa', 'images', 'pymt_method_icon', 'Visa Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Visa.jpg', 'image/jpg', NULL, 'Visa Icon.jpg', NULL, 'system', '2022-09-24 06:13:08', NULL),
(13, '__pymt_methods', 'fbc_bank', 'images', 'pymt_method_icon', 'FBC bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/FBC bank.jpg', 'image/jpg', NULL, 'FBC bank Icon.jpg', NULL, 'system', '2022-09-24 06:13:08', NULL);

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
('1s146DEHb4BmZKfC', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-24 06:14:17', NULL, NULL, '__user_group_memberships', '7', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('34G9Icr7TRRTBYqi', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-09-24 06:13:36', NULL, NULL, '__users', 'reserves', '[{\"field_name\":\"tatum_customer_id\",\"old_value\":null,\"new_value\":\"6321ec61d5f2885b44f1bda0\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('5aAVmf72j0LrSIWC', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-09-24 06:23:10', NULL, NULL, '__notifications', '1111063FD044A', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('5rHWw8PGlAcrafxc', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-24 06:13:25', NULL, '1560793054DC5', '__email_addresses', 'sysadmin@ankelli.com', NULL, NULL),
('6FAe2J1arLSd0hn5', 'FACTORY_SSN', 'Addition of _AssetAccountAddress entry to database.', 'entry_create', 'system', '2022-09-24 06:13:41', NULL, NULL, '__asset_account_addresses', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('6FOwFFo76jZMaNfh', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-24 06:15:01', NULL, '1633938CB6FE9', '__notifications', '151079FA4DC23', NULL, NULL),
('8DsZc9DsqkE6pNqZ', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-24 06:15:01', NULL, '1633938CB6FE9', '__email_addresses', 'paywyze@ankelli.com', NULL, NULL),
('9rowGV63Tc8rZlKy', 'FACTORY_SSN', 'Addition of _AssetAccount entry to database.', 'entry_create', 'system', '2022-09-24 06:13:44', NULL, NULL, '__asset_accounts', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('a0Il9Y0jrkYWraQ6', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-24 06:13:34', NULL, '1136567123559', '__users', 'reserves', NULL, NULL),
('aAioZYv3EMl5MMHu', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-24 06:15:01', NULL, '1633938CB6FE9', '__users', 'paywyze', NULL, NULL),
('acocpAuyELFIpoGd', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:23:12', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0.8855,\"new_value\":0.9355},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0.8855,\"new_value\":0.9355}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('AdlQJY0QOtZh4jRE', 'FACTORY_SSN', 'Addition of _AssetAccount entry to database.', 'entry_create', 'system', '2022-09-24 06:14:43', NULL, NULL, '__asset_accounts', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('AiSMLjUjOEHlPqvK', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-24 06:13:17', NULL, '136352D055C4C', '__users', 'developer', NULL, NULL),
('aL0Z7SWVi7nfTLne', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-24 06:14:54', NULL, NULL, '__user_group_memberships', '9', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('aTIePBdAuHSMaYTk', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-24 06:15:27', NULL, '1013803C7F442', '__email_addresses', 'sekuru@ankelli.com', NULL, NULL),
('B2jJNUrZWQ7a38ab', 'FACTORY_SSN', 'Addition of _Asset entry to database.', 'entry_create', 'system', '2022-09-24 06:13:16', NULL, NULL, '__assets', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('bJnjcP1MJtHgPwaA', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-24 06:13:34', NULL, '1136567123559', '__email_addresses', 'reserves@ankelli.com', NULL, NULL),
('bWtVLdSfQBeubRWR', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:22:56', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":0.7855},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":0.7855}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ByEHfhV8cLRSdulN', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-24 06:14:22', NULL, NULL, '__admin_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('ByoU7wBpzP4BkAd8', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-24 06:13:51', NULL, NULL, '__user_group_memberships', '5', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"\",\"regionName\":\"\",\"cityName\":\"\",\"zipCode\":null,\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.751\",\"longitude\":\"-97.822\",\"metroCode\":null,\"areaCode\":\"\",\"timezone\":\"America\\/Chicago\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\GeoPlugin\"}'),
('COJPcB3PbvWKrKfC', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-09-24 06:24:08', NULL, NULL, '__notifications', '166338534FADE', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('COvMXGgyGEVMitgm', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-09-24 06:13:17', NULL, '136352D055C4C', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('d3OhzZcbPYSB1Dwl', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-24 06:13:34', NULL, '1136567123559', '__notifications', '1534057252870', NULL, NULL),
('D4BQiTwHOrYqobrw', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-24 06:13:27', NULL, NULL, '__admin_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('e4qyhOCQDeuMQm0I', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-24 06:14:27', NULL, '147302222542E', '__notifications', '10755698D9588', NULL, NULL),
('eMZoOBvc0eDCcyyC', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-09-24 06:14:30', NULL, NULL, '__users', 'guddaz', '[{\"field_name\":\"tatum_customer_id\",\"old_value\":null,\"new_value\":\"632970417b09c5d6322bc226\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('EpSEVw2LuOVT2S5k', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:23:46', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0.9355,\"new_value\":0.9855},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0.9355,\"new_value\":0.9855}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('eUbZvcynIurhYKE7', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-24 06:13:30', NULL, NULL, '__buyer_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('fBCyiH0eY6IB9jl0', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-09-24 06:23:16', NULL, NULL, '__notifications', '114738AAD4E0C', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('FdF1iI1p8LdrV1FG', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:23:08', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0.8355,\"new_value\":0.8855},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0.8355,\"new_value\":0.8855}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('fjcWkSHC6lSXMwys', 'FACTORY_SSN', 'Addition of _AssetAccountAddress entry to database.', 'entry_create', 'system', '2022-09-24 06:14:40', NULL, NULL, '__asset_account_addresses', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fT6UyJkq6oSoN3qe', 'FACTORY_SSN', 'Addition of _AssetAccountAddress entry to database.', 'entry_create', 'system', '2022-09-24 06:15:16', NULL, NULL, '__asset_account_addresses', '5', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('fwWvvaz3wyk02z1q', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:23:35', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0.05,\"new_value\":0.1},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0.05,\"new_value\":0.1}]', '[false]'),
('g29YU57lazvP9Awp', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-09-24 06:23:42', NULL, NULL, '__notifications', '13501089741A9', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('G4vrignBa8DwhywU', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-24 06:13:17', NULL, '136352D055C4C', '__email_addresses', 'developer.ankelli@gmail.com', NULL, NULL),
('gAkafwZ0OfTBQy9z', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:24:11', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1.04,\"new_value\":1.1025},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1.04,\"new_value\":1.1025}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('gd9Pr7OHfGH8mpnp', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-24 06:14:16', NULL, '17544029CDC98', '__notifications', '143280D464D83', NULL, NULL),
('GInFglDBOZdgWQje', 'FACTORY_SSN', 'Addition of _RegToken entry to database.', 'entry_create', 'system', '2022-09-24 06:15:43', NULL, NULL, '__reg_tokens', '1234567890', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('GQ9Z3UpTvQ87qyC0', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-24 06:14:01', NULL, NULL, '__buyer_extensions', 'reserves', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('gZJbrWBr9lqIkNMb', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-24 06:13:25', NULL, '1560793054DC5', '__notifications', '110423BB91F0A', NULL, NULL),
('H2HDhTUZCh3Zkyc6', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-09-24 06:15:33', NULL, NULL, '__users', 'sekuru', '[{\"field_name\":\"tatum_customer_id\",\"old_value\":null,\"new_value\":\"63207c7291626c6cd5860a21\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('h69X6bin9a0iY5QI', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:23:58', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0.99,\"new_value\":1.04},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0.99,\"new_value\":1.04}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('H7NeF59NbSTZoY5T', 'FACTORY_SSN', 'Addition of _AssetAccountAddress entry to database.', 'entry_create', 'system', '2022-09-24 06:15:36', NULL, NULL, '__asset_account_addresses', '6', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('hLLFtsXyrvBzjFq4', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-24 06:13:17', NULL, '136352D055C4C', '__notifications', '130537F04AAA9', NULL, NULL),
('hLliXExfbBzCjWCN', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-24 06:14:15', NULL, NULL, '__user_group_memberships', '6', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('Hqf0o14cXViesyk6', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-24 06:14:24', NULL, NULL, '__seller_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('i1YHYK6IVm2Y95OW', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-24 06:13:24', NULL, NULL, '__user_group_memberships', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('I4naIbgpe9xxWtHt', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-24 06:14:27', NULL, '147302222542E', '__email_addresses', 'goodhopedhliwayo@gmail.com', NULL, NULL),
('iEP7XR3oWSjWf4dR', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:23:01', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0.7855,\"new_value\":0.8355},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0.7855,\"new_value\":0.8355}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('IG4pyjJKmEkjjHkS', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-24 06:14:23', NULL, NULL, '__buyer_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('IIlLCdobSv4Gqho2', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-24 06:15:27', NULL, '1013803C7F442', '__users', 'sekuru', NULL, NULL),
('Im8UlpQ45h9zzaon', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-09-24 06:14:26', NULL, '147302222542E', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('it4GdmjZRWgKc6Kx', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-24 06:15:24', NULL, NULL, '__user_group_memberships', '11', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('JhK0d0wqQGEtyThd', 'FACTORY_SSN', 'Addition of _AssetAccountAddress entry to database.', 'entry_create', 'system', '2022-09-24 06:14:34', NULL, NULL, '__asset_account_addresses', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('JN92uOcowipMSGGj', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-24 06:14:49', NULL, NULL, '__admin_extensions', 'guddaz', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('jNQPJPqZhExFZ7X3', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:22:53', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0.085,\"new_value\":0.135},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0.085,\"new_value\":0.135}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('KgSgxOiLAQ8Xjp7Q', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-09-24 06:15:01', NULL, '1633938CB6FE9', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('LdjQU4hXQTHT3WZd', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-24 06:13:56', NULL, NULL, '__admin_extensions', 'reserves', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('LtMeYOmDQE71xdoh', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-24 06:14:26', NULL, '147302222542E', '__users', 'guddaz', NULL, NULL),
('MCyyx9ZcwqOxdBxt', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-09-24 06:14:16', NULL, '17544029CDC98', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('mDZUAcgp1fL7Kt9t', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:22:48', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":0.085},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":0.085}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('MG6z5ZswUg9zgN3a', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:24:19', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1.1025,\"new_value\":1.3325},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1.1025,\"new_value\":1.3325}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('MKkOaR62Ue4DSdQ3', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:23:50', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0.9855,\"new_value\":1.0355},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0.9855,\"new_value\":1.0355}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('NKURbhIixamuDPpH', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-24 06:15:23', NULL, NULL, '__user_group_memberships', '10', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('NMg49ubNiMJe9AwZ', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-09-24 06:15:08', NULL, NULL, '__users', 'paywyze', '[{\"field_name\":\"tatum_customer_id\",\"old_value\":null,\"new_value\":\"63298faa64858e37282c6267\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('nRz1dIfRNCVKLqNq', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-24 06:14:25', NULL, NULL, '__user_group_memberships', '8', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('oQpCGmKBDq7hf0Zc', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-24 06:15:21', NULL, NULL, '__admin_extensions', 'paywyze', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('pjBCQ7tOF4W9UtJv', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-24 06:14:07', NULL, NULL, '__seller_extensions', 'reserves', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('pv6N1svgHNgzsu3G', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:24:16', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0.1,\"new_value\":0.15},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0.1,\"new_value\":0.15}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Py2DA5mZDYAxtTmc', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-24 06:13:25', NULL, '1560793054DC5', '__users', 'sysadmin', NULL, NULL),
('pzpkaoPyNJoe70Dr', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-09-24 06:22:57', NULL, NULL, '__notifications', '115585A87189D', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('qEOmXJsvBMaQyLvC', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-24 06:13:22', NULL, NULL, '__user_group_memberships', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('QJ9AocvkxNld4swl', 'FACTORY_SSN', 'Addition of _AssetAccountAddress entry to database.', 'entry_create', 'system', '2022-09-24 06:13:39', NULL, NULL, '__asset_account_addresses', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('qK2sl0GLnoW5Fhwu', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-24 06:14:16', NULL, '17544029CDC98', '__users', 'busadmin', NULL, NULL),
('qPOzo1l7PLQPGMgI', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:22:43', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":0.5},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":0.5}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('R0XcDDtWRbm2wQIK', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-09-24 06:23:56', NULL, NULL, '__notifications', '1787915376194', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"\",\"regionName\":\"\",\"cityName\":\"\",\"zipCode\":null,\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.751\",\"longitude\":\"-97.822\",\"metroCode\":null,\"areaCode\":\"\",\"timezone\":\"America\\/Chicago\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\GeoPlugin\"}'),
('R6u0BjAas4dtswUt', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-24 06:15:26', NULL, NULL, '__user_group_memberships', '12', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('R9z9opsUC2MbZWYP', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:23:06', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0.185,\"new_value\":0.99},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0.185,\"new_value\":0.99}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('sC82HCdrXQWBBgYx', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-09-24 06:15:27', NULL, '1013803C7F442', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('SLAXPdPLZG1QoM8u', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:23:19', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":0.05},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":0.05}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('soC4IbEvU17o7iYw', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-24 06:13:23', NULL, NULL, '__admin_extensions', 'developer', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('SYDjlECqpKfAnI8y', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-09-24 06:13:25', NULL, '1560793054DC5', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('tcV4pdGA9o5eGvhb', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-09-24 06:23:48', NULL, NULL, '__notifications', '1309378C7FC65', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('TWwOtdHcsDtpWLoA', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-09-24 06:22:45', NULL, NULL, '__notifications', '13728783EF2B0', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Vgoq5kCiDe4jaFEr', 'FACTORY_SSN', 'Addition of _AssetAccount entry to database.', 'entry_create', 'system', '2022-09-24 06:15:17', NULL, NULL, '__asset_accounts', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('VIHsWSwJz5JgQp4H', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-24 06:15:27', NULL, '1013803C7F442', '__notifications', '1453610F56FC6', NULL, NULL),
('VLE30VdPS4xiznZ2', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:24:05', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0.5,\"new_value\":0.55},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0.5,\"new_value\":0.55}]', '{\"ip\":\"127.0.0.1\"}'),
('VNf1ElNAMwMAAcNO', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-09-24 06:23:03', NULL, NULL, '__notifications', '1261564D2A423', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('wE1p8j173iXTw2ZG', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-24 06:14:16', NULL, '17544029CDC98', '__email_addresses', 'busadmin@ankelli.com', NULL, NULL),
('wySITRFhsIDW0EQi', 'TEST_SSN', 'Updating of _AssetAccount entry in database.', 'entry_update', NULL, '2022-09-24 06:22:59', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0.135,\"new_value\":0.185},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0.135,\"new_value\":0.185}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('XMvQ2LPM71284KEo', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-24 06:13:33', NULL, NULL, '__user_group_memberships', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('y3IUdyLUJkj4JuSx', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-09-24 06:24:17', NULL, NULL, '__notifications', '1707178931905', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Y6JcJcbnVENPEeGc', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-24 06:13:32', NULL, NULL, '__seller_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('YkAwyblLZQc9fSwx', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-09-24 06:23:25', NULL, NULL, '__notifications', '113701D59B500', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}');
INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('ZFI3SkCD5eErRsKn', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-09-24 06:13:34', NULL, '1136567123559', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Zmx88f9ibfinxFaq', 'FACTORY_SSN', 'Addition of _AssetAccount entry to database.', 'entry_create', 'system', '2022-09-24 06:15:38', NULL, NULL, '__asset_accounts', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('zunE2d12jG0aZ5yw', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-24 06:13:26', NULL, NULL, '__user_group_memberships', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}');

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
('10755698D9588', 'guddaz', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-24 06:14:27', NULL),
('110423BB91F0A', 'sysadmin', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-24 06:13:25', NULL),
('1111063FD044A', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 USDT has been credited into your account.\",\"body\":\"0.05 USDT has been credited into your account.\\nTxn ref: 1963121A13B75.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.8855 USDT, Total : 0.8855 USDT\"}', '2022-09-24 06:23:08', NULL),
('113701D59B500', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 USDT has been credited into your account.\",\"body\":\"0.05 USDT has been credited into your account.\\nTxn ref: 1937079346282.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.05 USDT, Total : 0.05 USDT\"}', '2022-09-24 06:23:19', NULL),
('114738AAD4E0C', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 USDT has been credited into your account.\",\"body\":\"0.05 USDT has been credited into your account.\\nTxn ref: 166566B8F05DB.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.9355 USDT, Total : 0.9355 USDT\"}', '2022-09-24 06:23:12', NULL),
('115585A87189D', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.7855 USDT has been credited into your account.\",\"body\":\"0.7855 USDT has been credited into your account.\\nTxn ref: 12028306EB4F5.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.7855 USDT, Total : 0.7855 USDT\"}', '2022-09-24 06:22:56', NULL),
('1261564D2A423', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 USDT has been credited into your account.\",\"body\":\"0.05 USDT has been credited into your account.\\nTxn ref: 190274D45E8BC.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.8355 USDT, Total : 0.8355 USDT\"}', '2022-09-24 06:23:01', NULL),
('130537F04AAA9', 'developer', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-24 06:13:17', NULL),
('1309378C7FC65', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 USDT has been credited into your account.\",\"body\":\"0.05 USDT has been credited into your account.\\nTxn ref: 161744F1D0A24.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.9855 USDT, Total : 0.9855 USDT\"}', '2022-09-24 06:23:46', NULL),
('13501089741A9', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 USDT has been credited into your account.\",\"body\":\"0.05 USDT has been credited into your account.\\nTxn ref: 13080685DE409.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.1 USDT, Total : 0.1 USDT\"}', '2022-09-24 06:23:35', NULL),
('13728783EF2B0', 'sekuru', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.5 USDT has been credited into your account.\",\"body\":\"0.5 USDT has been credited into your account.\\nTxn ref: 1930419C3E615.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.5 USDT, Total : 0.5 USDT\"}', '2022-09-24 06:22:43', NULL),
('143280D464D83', 'busadmin', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-24 06:14:16', NULL),
('1453610F56FC6', 'sekuru', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-24 06:15:27', NULL),
('151079FA4DC23', 'paywyze', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-24 06:15:01', NULL),
('1534057252870', 'reserves', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-24 06:13:34', NULL),
('166338534FADE', 'sekuru', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 USDT has been credited into your account.\",\"body\":\"0.05 USDT has been credited into your account.\\nTxn ref: 135712453FE16.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.55 USDT, Total : 0.55 USDT\"}', '2022-09-24 06:24:05', NULL),
('1707178931905', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 USDT has been credited into your account.\",\"body\":\"0.05 USDT has been credited into your account.\\nTxn ref: 162669C98CE4E.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.15 USDT, Total : 0.15 USDT\"}', '2022-09-24 06:24:16', NULL),
('1787915376194', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 USDT has been credited into your account.\",\"body\":\"0.05 USDT has been credited into your account.\\nTxn ref: 134946D0C1412.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 1.0355 USDT, Total : 1.0355 USDT\"}', '2022-09-24 06:23:50', NULL);

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
(1, 'Update system config params', 'update_sysconfig_params', 'Permission holder can update system config params.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(2, 'Handle feedback reports', 'handle_feedback_reports', 'Permission holder can handle feedback reports.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(3, 'Manage datalists', 'manage_datalists', 'Permission holder can manage datalists.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(4, 'Manage system tools', 'manage_systools', 'Permission holder can manage system tools.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(5, 'View all logs', 'view_all_logs', 'Permission holder can view all logs.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(6, 'View all transactions', 'view_all_transactions', 'Permission holder can view all transactions.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(7, 'Manage Deposit Tokens', 'manage_deposit_tokens', 'Permission holder can create and edit deposit tokens.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(8, 'Handle Withdrawals', 'handle_withdrawals', 'Permission holder can handle withdrawals.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(9, 'Manage Registration Tokens', 'manage_reg_tokens', 'Permission holder can create and edit registration tokens.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(10, 'Handle flagged users', 'handle_flagged_users', 'Permission holder can handle flagged Users.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(11, 'Handle customer service chats', 'handle_customer_service_chats', 'Permission holder can handle customer service chats.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(12, 'Manage update posts', 'manage_update_posts', 'Permission holder can handle posting and editing update posts.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(13, 'Handle flagged business elems', 'handle_flagged_business_elems', 'Permission holder can handle flagged business elems (Offers, Trades, etc).', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL);

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
(1, '__user_groups', 'system_administrators', 'update_sysconfig_params', 'active', 'system', '2022-09-24 08:13:08', NULL),
(2, '__user_groups', 'system_administrators', 'handle_feedback_reports', 'active', 'system', '2022-09-24 08:13:08', NULL),
(3, '__user_groups', 'system_administrators', 'manage_systools', 'active', 'system', '2022-09-24 08:13:08', NULL),
(4, '__user_groups', 'system_administrators', 'manage_datalists', 'active', 'system', '2022-09-24 08:13:08', NULL),
(5, '__user_groups', 'system_administrators', 'view_all_logs', 'active', 'system', '2022-09-24 08:13:08', NULL),
(6, '__user_groups', 'business_administrators', 'view_all_transactions', 'active', 'system', '2022-09-24 08:13:08', NULL),
(7, '__user_groups', 'business_administrators', 'manage_deposit_tokens', 'active', 'system', '2022-09-24 08:13:08', NULL),
(8, '__user_groups', 'business_administrators', 'handle_withdrawals', 'active', 'system', '2022-09-24 08:13:08', NULL),
(9, '__user_groups', 'user_administrators', 'manage_reg_tokens', 'active', 'system', '2022-09-24 08:13:08', NULL),
(10, '__user_groups', 'user_administrators', 'handle_flagged_users', 'active', 'system', '2022-09-24 08:13:08', NULL),
(11, '__user_groups', 'platform_moderators', 'handle_customer_service_chats', 'active', 'system', '2022-09-24 08:13:08', NULL),
(12, '__user_groups', 'platform_moderators', 'handle_flagged_business_elems', 'active', 'system', '2022-09-24 08:13:08', NULL),
(13, '__user_groups', 'platform_moderators', 'manage_update_posts', 'active', 'system', '2022-09-24 08:13:08', NULL);

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
(1, '__users', 'system', 'Backend rest api enabled', 'backend_rest_api_enabled', '1', 'boolean', 'system', '2022-09-24 08:13:08', NULL),
(2, '__users', 'system', 'Scaffolding app enabled', 'scaffolding_app_enabled', '1', 'boolean', 'system', '2022-09-24 08:13:08', NULL),
(3, '__users', 'system', 'Fallback Display Language', 'fallback_pref_lang', 'en', 'enum:langs', 'system', '2022-09-24 08:13:08', NULL),
(4, '__users', 'system', 'Fallback Display Theme', 'fallback_pref_theme', 'light', 'enum:themes', 'system', '2022-09-24 08:13:08', NULL),
(5, '__users', 'system', 'Image storage driver', 'image_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-24 08:13:08', NULL),
(6, '__users', 'system', 'Document storage driver', 'document_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-24 08:13:08', NULL),
(7, '__users', 'system', 'Open Registration enabled', 'open_reg_enabled', '0', 'boolean', 'system', '2022-09-24 08:13:08', NULL),
(8, '__users', 'system', 'Token registration enabled', 'token_reg_enabled', '0', 'boolean', 'system', '2022-09-24 08:13:08', NULL),
(9, '__users', 'system', 'Registration token max use count', 'reg_token_max_use_count', '10', 'integer', 'system', '2022-09-24 08:13:08', NULL),
(10, '__users', 'system', 'Learn mode available', 'learn_mode_available', '1', 'boolean', 'system', '2022-09-24 08:13:08', NULL),
(11, '__users', 'system', 'Offers to buy enabled', 'offer_to_buy_enabled', '1', 'boolean', 'system', '2022-09-24 08:13:08', NULL),
(12, '__users', 'system', 'Offers to sell enabled', 'offer_to_sell_enabled', '0', 'boolean', 'system', '2022-09-24 08:13:08', NULL),
(13, '__users', 'system', 'Use development crypto asset engine', 'use_dev_crypto_asset_engine', '0', 'boolean', 'system', '2022-09-24 08:13:08', NULL),
(14, '__users', 'system', 'Use tatum crypto asset engine', 'use_tatum_crypto_asset_engine', '1', 'boolean', 'system', '2022-09-24 08:13:08', NULL),
(15, '__users', 'system', 'Factor of value charged by platform on transactions', 'platform_charge_asset_factor', '0.01', 'float', 'system', '2022-09-24 08:13:08', NULL);

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
(1, 'Cash in person', 'cash_in_person', '5e5d4b', '[\"phone_no\"]', NULL, 'active', 'system', '2022-09-24 08:13:09', NULL, NULL),
(2, 'Stanbic bank', 'stanbic_bank', '066ef3', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-24 08:13:09', NULL, NULL),
(3, 'FNB bank', 'fnb_bank', '009eaa', '[\"account_holder_name\",\"account_no\"]', '[\"ZAR\"]', 'active', 'system', '2022-09-24 08:13:09', NULL, NULL),
(4, 'Mukuru', 'mukuru', 'e77924', '[\"fullname\",\"phone_no\"]', '[\"USD\"]', 'active', 'system', '2022-09-24 08:13:09', NULL, NULL),
(5, 'Algérie Poste', 'algerie_poste', '01009a', '[\"account_holder_name\",\"account_holder_address\",\"account_no\",\"account_key\"]', '[\"DZD\"]', 'active', 'system', '2022-09-24 08:13:09', NULL, NULL),
(6, 'MTN Mobile Money', 'mtn_momo', 'feca05', '[\"fullname\",\"phone_no\"]', NULL, 'active', 'system', '2022-09-24 08:13:09', NULL, NULL),
(7, 'Ecocash', 'ecocash', '005ba4', '[\"fullname\",\"phone_no\"]', '[\"ZWL\"]', 'active', 'system', '2022-09-24 08:13:09', NULL, NULL),
(8, 'Paypal', 'paypal', '27346a', '[\"fullname\",\"email_address\"]', '[\"USD\",\"EUR\",\"GBP\"]', 'active', 'system', '2022-09-24 08:13:09', NULL, NULL),
(9, 'Skrill', 'skrill', '862165', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-24 08:13:09', NULL, NULL),
(10, 'World Remit', 'world_remit', '604684', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-24 08:13:09', NULL, NULL),
(11, 'Mastercard', 'mastercard', 'cc0001', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-24 08:13:09', NULL, NULL),
(12, 'Visa', 'visa', '0055a5', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-24 08:13:09', NULL, NULL),
(13, 'FBC Bank', 'fbc_bank', '0055a5', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-24 08:13:09', NULL, NULL);

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
('1234567890', 'usable', 'system', '2022-09-24 06:15:38');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-24 06:13:31', '2022-09-24 06:13:31', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-24 06:14:01', '2022-09-24 06:14:01', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-24 06:14:23', '2022-09-24 06:14:23', NULL);

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
('FACTORY_SSN', 'system', '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'ended', '2022-09-24 08:13:08', NULL, NULL, NULL),
('TATUM_NOTIFS_SSN', 'system', '{\"name\":\"Tatum Notification Station device\",\"version\":1}', '{\"name\":\"Tatum Notification Station agent app\",\"version\":1}', 'active', '2022-09-24 08:13:08', NULL, NULL, NULL),
('TEST_SSN', NULL, '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'active', '2022-09-24 08:13:08', NULL, NULL, NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `__transactions`
--

CREATE TABLE `__transactions` (
  `ref_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `txcontext` enum('onchain','offchain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `blockchain_txid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_token` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation_slug` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_blockchain_address` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destination_user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destination_blockchain_address` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_asset_value` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_result` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_datetime` timestamp NULL DEFAULT current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__transactions`
--

INSERT INTO `__transactions` (`ref_code`, `txcontext`, `blockchain_txid`, `tatum_reference`, `session_token`, `description`, `operation_slug`, `source_user_username`, `source_blockchain_address`, `destination_user_username`, `destination_blockchain_address`, `asset_code`, `transfer_asset_value`, `transfer_result`, `transfer_datetime`, `deleted_datetime`) VALUES
('105212943986F', 'onchain', '0x3814d1d3c488aae7ec6f3e0d38e44273df12375770fbd45af1fdfadf117cb454', '600816e0-d753-4c13-a5ed-6411549150ee', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'reserves', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '0.05', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":0.135,\"new_usable_balance_asset_value\":0.185,\"old_total_balance_asset_value\":0.135,\"new_total_balance_asset_value\":0.185}]', '2022-09-22 16:32:43', NULL),
('12028306EB4F5', 'onchain', '0xafd28520c21f6b505ec126bd0ddb198837c8702dba634a655074a07c6c027545', 'b9f1fa14-6d94-47f5-afb4-63f5eb6dc749', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'guddaz', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 'USDT', '0.7855', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":0.7855,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":0.7855}]', '2022-09-22 16:30:57', NULL),
('13080685DE409', 'onchain', '0xc997855772123270b396ac8b9cc4143f60a9a57aa93b40fc962210e1c11dbc8b', 'bb6492ad-49f1-4226-ae2b-c4056e6066d6', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'paywyze', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'USDT', '0.05', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":0.05,\"new_usable_balance_asset_value\":0.1,\"old_total_balance_asset_value\":0.05,\"new_total_balance_asset_value\":0.1}]', '2022-09-23 04:17:42', NULL),
('134946D0C1412', 'onchain', '0x8deeae1f13c3bf1080e6b92246fbf63518455f4958c252b971ae650771755847', '9f60b02a-a83c-46be-a1d8-973c5503fa03', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'guddaz', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 'USDT', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":0.9855,\"new_usable_balance_asset_value\":1.0355,\"old_total_balance_asset_value\":0.9855,\"new_total_balance_asset_value\":1.0355}]', '2022-09-23 05:14:12', NULL),
('135712453FE16', 'onchain', '0x653654a901061ea2c09da6bc94c3e7b0c0cb63e4ba04101e81e0f84bb1381430', '03ba56b7-2354-480b-9611-3412f1d282f6', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'sekuru', '0x6483545db0f4aeb80d52d67bd5a9ae73f57a14aa', 'USDT', '0.05', '[{\"user_username\":\"sekuru\",\"old_usable_balance_asset_value\":0.5,\"new_usable_balance_asset_value\":0.55,\"old_total_balance_asset_value\":0.5,\"new_total_balance_asset_value\":0.55}]', '2022-09-23 05:28:12', NULL),
('1357776C2D373', 'onchain', '0xb62d8880a8f5cd9e2e10f8a60d73ca4f5568758506b67939f9a989a62f3cbcba', '5af4daab-2298-418a-b7a9-8d2341046c26', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'reserves', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '0.085', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":0.085,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":0.085}]', '2022-09-22 13:26:42', NULL),
('1435841324D7C', 'onchain', '0x57128993c347bcdbf13c3dda8ccf82cf8f8baa5622b4ec39a68878dd9cdcf9e4', '98c76796-a6e4-4724-909e-08df1d407e91', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'reserves', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '0.23', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1.1025,\"new_usable_balance_asset_value\":1.3325,\"old_total_balance_asset_value\":1.1025,\"new_total_balance_asset_value\":1.3325}]', '2022-09-24 04:58:57', NULL),
('161744F1D0A24', 'onchain', '0x70de60f70bb4930f4d2711d3dbe0f87154f0405ce7a8d7e7c08dd5a634ce59b1', '9bd28cc6-9635-4abb-8dfe-618c66f991d9', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'guddaz', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 'USDT', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":0.9355,\"new_usable_balance_asset_value\":0.9855,\"old_total_balance_asset_value\":0.9355,\"new_total_balance_asset_value\":0.9855}]', '2022-09-23 05:12:42', NULL),
('162669C98CE4E', 'onchain', '0x37565f0833d8a65355f80136429a246311d6394af2f2670ab405915f0df3eef5', 'e465fa91-d750-4377-8679-f5643b73aca8', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'paywyze', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'USDT', '0.05', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":0.1,\"new_usable_balance_asset_value\":0.15,\"old_total_balance_asset_value\":0.1,\"new_total_balance_asset_value\":0.15}]', '2022-09-23 08:47:42', NULL),
('166566B8F05DB', 'onchain', '0x7314a046630710fda5032d86af2b98d3dd5f21fa3c2b81839120417b2f31f468', '86840ae6-58da-47b5-84da-ef8517f2d1e6', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'guddaz', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 'USDT', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":0.8855,\"new_usable_balance_asset_value\":0.9355,\"old_total_balance_asset_value\":0.8855,\"new_total_balance_asset_value\":0.9355}]', '2022-09-23 01:19:12', NULL),
('168013A79A502', 'onchain', '0x0d517112324571b63b159117c4eec22f61299254e3c4b2816b28a74fd18b85a7', '3a17f454-92a3-4dae-b445-13607f51bda7', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'reserves', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '0.805', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":0.185,\"new_usable_balance_asset_value\":0.99,\"old_total_balance_asset_value\":0.185,\"new_total_balance_asset_value\":0.99}]', '2022-09-22 19:35:42', NULL),
('189279E1D44C4', 'onchain', '0xec4d69d07b5912932bfa0bbe087c79847b550f78ce5f3bc48858822caad6ade3', '630d71b4-bc46-4947-b4c5-7f39646f2e1f', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'reserves', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '0.05', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":0.085,\"new_usable_balance_asset_value\":0.135,\"old_total_balance_asset_value\":0.085,\"new_total_balance_asset_value\":0.135}]', '2022-09-22 14:44:27', NULL),
('190274D45E8BC', 'onchain', '0x1f32121d65b6564d8c0bf7b3db0707fbe9898486160f6096ca0c366bf8daae0e', '58ccea92-1eaf-412d-84cc-3334c8e0f38c', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'guddaz', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 'USDT', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":0.7855,\"new_usable_balance_asset_value\":0.8355,\"old_total_balance_asset_value\":0.7855,\"new_total_balance_asset_value\":0.8355}]', '2022-09-22 17:22:12', NULL),
('1930419C3E615', 'onchain', '0x1dc621ba6a1a797ba3bcc82d6487fa9611d68057105d3938276f80b620e19fc1', '55b36f0b-f4c1-49b5-8d31-1a2bc81e006b', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'sekuru', '0x6483545db0f4aeb80d52d67bd5a9ae73f57a14aa', 'USDT', '0.5', '[{\"user_username\":\"sekuru\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":0.5,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":0.5}]', '2022-09-22 07:37:41', NULL),
('1937079346282', 'onchain', '0x8c2e8bbf031aa14db91d2b2485c4960b544184a48fc018ea81c5dcceaa26be44', '97699c1c-a3b2-434b-b9eb-e2fd29fc5e8d', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'paywyze', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'USDT', '0.05', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":0.05,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":0.05}]', '2022-09-23 01:24:12', NULL),
('196304A0D0882', 'onchain', '0xac43f07a966f85c2f148105da58218522ea3577d6bfb192c29904607bb960e79', 'd75a2c60-096b-457d-809e-004a2eb8a362', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'reserves', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '0.0625', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1.04,\"new_usable_balance_asset_value\":1.1025,\"old_total_balance_asset_value\":1.04,\"new_total_balance_asset_value\":1.1025}]', '2022-09-23 05:43:42', NULL),
('1963121A13B75', 'onchain', '0x2884c784ce31f809476e48b28c67a9695d0a1303ca085b61517a0ac71fdffe44', '1297c197-0a96-4cad-9302-8d50736d84a0', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'guddaz', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 'USDT', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":0.8355,\"new_usable_balance_asset_value\":0.8855,\"old_total_balance_asset_value\":0.8355,\"new_total_balance_asset_value\":0.8855}]', '2022-09-23 01:07:42', NULL),
('197497024EECF', 'onchain', '0x16a1d7e1a6d948dc64406ddabfef44af9b1128d9d03ae78f8a331a422e0dd423', '0035d3b9-66ae-40b5-b424-a4dbb5ffdbe8', 'TEST_SSN', 'Transfer from CoinGecko wallet to Ankelli wallet', 'internalisation', NULL, NULL, 'reserves', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'USDT', '0.05', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":0.99,\"new_usable_balance_asset_value\":1.04,\"old_total_balance_asset_value\":0.99,\"new_total_balance_asset_value\":1.04}]', '2022-09-23 05:17:27', NULL);

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
(1, 'system', 'system', '', NULL, NULL, NULL, 'active', '2022-09-24 08:13:07', NULL, NULL),
(2, 'developer', 'developer.ankelli@gmail.com', '$2y$10$.MQCwrelUqhWHJ54GEB8S.MJ2ILoFuAOaYWTKaaPm6SvJrDWUnM0G', NULL, NULL, NULL, 'active', '2022-09-24 06:13:16', '2022-09-24 06:13:16', NULL),
(3, 'sysadmin', 'sysadmin@ankelli.com', '$2y$10$GRLZ5UQw9RW0Iiuks/Wllu58d5kRoIA47NyWgGTMAH3N8d9Incxgy', NULL, NULL, NULL, 'active', '2022-09-24 06:13:24', '2022-09-24 06:13:24', NULL),
(4, 'reserves', 'reserves@ankelli.com', '$2y$10$8SeaGzMVbpGNGiRSUzUhf.so.M3pcApmwKJC0pzzy99xserWe.jha', NULL, NULL, '6321ec61d5f2885b44f1bda0', 'active', '2022-09-24 06:13:33', '2022-09-24 06:13:36', NULL),
(5, 'busadmin', 'busadmin@ankelli.com', '$2y$10$hEp1E3emurGmv08C0HWqOui6pHq9KVA6MSIyyGGQYBKeHTEvLxrb6', NULL, NULL, NULL, 'active', '2022-09-24 06:14:15', '2022-09-24 06:14:15', NULL),
(6, 'guddaz', 'goodhopedhliwayo@gmail.com', '$2y$10$.oDdCtQ9DFrUhztXsU0jzONnilkwsYNgVE/yAOomMTKDz1N0/p/VC', NULL, NULL, '632970417b09c5d6322bc226', 'active', '2022-09-24 06:14:25', '2022-09-24 06:14:30', NULL),
(7, 'paywyze', 'paywyze@ankelli.com', '$2y$10$6HM6YOcTgMXjlqhwE1NUHuQWLMnFAVYwQseZ4ULFSmJrW9UgGEJv.', NULL, NULL, '63298faa64858e37282c6267', 'active', '2022-09-24 06:14:55', '2022-09-24 06:15:08', NULL),
(8, 'sekuru', 'sekuru@ankelli.com', '$2y$10$BoDAvW6vi2pCD6dkjTffLOYAMkqvvT3iIPf2Ft5fsLNorl2dDb8my', NULL, NULL, '63207c7291626c6cd5860a21', 'active', '2022-09-24 06:15:26', '2022-09-24 06:15:33', NULL);

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
(1, 'Default Users', 'default_users', 'Group for Default User accounts created on system initialization and factory_data loading. \nNew users cannot be added to this group.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(2, 'Administrators', 'administrators', 'Automatically joined group (Users with active Admin Extension). \nMembers can be added to other admin groups.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(3, 'Developers', 'developers', 'Admin group for unrestricted system users. \nMembers have access to all features and OTP access to account named \"developer\". \nOnly \"developer\" account can add members to this group.\nGroup used for System Development and Maintenance.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(4, 'System Administrators', 'system_administrators', 'Admin Group for System Administrators. \nMembers can manage system functions and sysconfig params. \nMembers have OTP access to account named \"sysadmin\".\nOnly \"sysadmin\" account can add members to this group.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(5, 'Business Administrators', 'business_administrators', 'Admin group for Business Administrators.\nMembers have access to business related features.\nMembers have OTP access to accounts named \"reserves\" and \"busadmin\".\nOnly \"busadmin\" account can add members to this group.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(6, 'User Administrators', 'user_administrators', 'Admin group for User Administrators. \nMembers can manage other users and user related queries.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(7, 'Platform moderators', 'platform_moderators', 'Group for Platform moderators. \nMembers can respond in the customer service chat module, handle flagged business elements, manage daily updates.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(8, 'Sellers', 'sellers', 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(9, 'Buyers', 'buyers', 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL),
(10, 'Beta Testers', 'beta_testers', 'User Group for selected individuals to test certain features before they are published.', 'active', 'system', '2022-09-24 08:13:08', NULL, NULL);

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
(1, 'developer', 'default_users', 'active', 'system', '2022-09-24 06:13:17', '2022-09-24 06:13:17'),
(2, 'developer', 'developers', 'active', 'system', '2022-09-24 06:13:23', '2022-09-24 06:13:23'),
(3, 'sysadmin', 'default_users', 'active', 'system', '2022-09-24 06:13:25', '2022-09-24 06:13:25'),
(4, 'sysadmin', 'system_administrators', 'active', 'system', '2022-09-24 06:13:32', '2022-09-24 06:13:32'),
(5, 'reserves', 'default_users', 'active', 'system', '2022-09-24 06:13:44', '2022-09-24 06:13:44'),
(6, 'reserves', 'business_administrators', 'active', 'system', '2022-09-24 06:14:07', '2022-09-24 06:14:07'),
(7, 'busadmin', 'default_users', 'active', 'system', '2022-09-24 06:14:16', '2022-09-24 06:14:16'),
(8, 'busadmin', 'business_administrators', 'active', 'system', '2022-09-24 06:14:24', '2022-09-24 06:14:24'),
(9, 'guddaz', 'developers', 'active', 'system', '2022-09-24 06:14:49', '2022-09-24 06:14:49'),
(10, 'paywyze', 'system_administrators', 'active', 'system', '2022-09-24 06:15:21', '2022-09-24 06:15:21'),
(11, 'paywyze', 'user_administrators', 'active', 'system', '2022-09-24 06:15:23', '2022-09-24 06:15:23'),
(12, 'paywyze', 'business_administrators', 'active', 'system', '2022-09-24 06:15:24', '2022-09-24 06:15:24');

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
  ADD UNIQUE KEY `asset_account_id_blockchain_address_tatum_derivation_key_unique` (`asset_account_id`,`blockchain_address`,`tatum_derivation_key`),
  ADD UNIQUE KEY `__asset_account_addresses_blockchain_address_unique` (`blockchain_address`),
  ADD KEY `__asset_account_addresses_user_username_foreign` (`user_username`);

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
  ADD UNIQUE KEY `__transactions_blockchain_txid_unique` (`blockchain_txid`),
  ADD KEY `__transactions_session_token_foreign` (`session_token`),
  ADD KEY `__transactions_source_user_username_foreign` (`source_user_username`),
  ADD KEY `__transactions_destination_user_username_foreign` (`destination_user_username`),
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `__asset_account_addresses`
--
ALTER TABLE `__asset_account_addresses`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `__pymt_methods`
--
ALTER TABLE `__pymt_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
-- Constraints for table `__asset_accounts`
--
ALTER TABLE `__asset_accounts`
  ADD CONSTRAINT `__asset_accounts_asset_code_foreign` FOREIGN KEY (`asset_code`) REFERENCES `__assets` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__asset_accounts_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `__asset_account_addresses`
--
ALTER TABLE `__asset_account_addresses`
  ADD CONSTRAINT `__asset_account_addresses_asset_account_id_foreign` FOREIGN KEY (`asset_account_id`) REFERENCES `__asset_accounts` (`id`),
  ADD CONSTRAINT `__asset_account_addresses_user_username_foreign` FOREIGN KEY (`user_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

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
  ADD CONSTRAINT `__transactions_destination_blockchain_address_foreign` FOREIGN KEY (`destination_blockchain_address`) REFERENCES `__asset_account_addresses` (`blockchain_address`) ON DELETE SET NULL ON UPDATE CASCADE,
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
