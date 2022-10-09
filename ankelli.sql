-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 09, 2022 at 11:11 AM
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
(44, '2014_10_12_000000_create_users_table', 1),
(45, '2014_10_12_100000_create_password_resets_table', 1),
(46, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(47, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(48, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(49, '2016_06_01_000004_create_oauth_clients_table', 1),
(50, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(51, '2019_08_19_000000_create_failed_jobs_table', 1),
(52, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(53, '2022_07_26_072110_create___admin_extensions_table', 1),
(54, '2022_07_26_072112_create___buyer_extensions_table', 1),
(55, '2022_07_26_072114_create___seller_extensions_table', 1),
(56, '2022_07_26_072120_create___user_groups_table', 1),
(57, '2022_07_26_072122_create___user_group_memberships_table', 1),
(58, '2022_07_26_072124_create___permissions_table', 1),
(59, '2022_07_26_072126_create___permission_instances_table', 1),
(60, '2022_07_26_072130_create___sessions_table', 1),
(61, '2022_07_26_072131_create___notifications_table', 1),
(62, '2022_07_26_072132_create___pref_items_table', 1),
(63, '2022_07_26_072135_create___reg_tokens_table', 1),
(64, '2022_07_26_072136_create___verif_tokens_table', 1),
(65, '2022_07_26_072137_create___email_addresses_table', 1),
(66, '2022_07_26_072140_create___phone_nos_table', 1),
(67, '2022_07_26_072324_create___files_table', 1),
(68, '2022_07_26_072326_create___feedback_reports_table', 1),
(69, '2022_07_26_072327_create___posts_table', 1),
(70, '2022_07_26_072332_create___assets_table', 1),
(71, '2022_07_26_072333_create___asset_wallets_table', 1),
(72, '2022_07_26_072334_create___asset_wallet_addresses_table', 1),
(73, '2022_07_26_072335_create___asset_custodial_wallet_addresses_table', 1),
(74, '2022_07_26_072336_create___currencies_table', 1),
(75, '2022_07_26_072337_create___pymt_methods_table', 1),
(76, '2022_07_26_072345_create___countries_table', 1),
(77, '2022_07_26_072347_create___exportables_table', 1),
(78, '2022_07_26_072410_create___deposit_tokens_table', 1),
(79, '2022_07_26_072416_create___offers_table', 1),
(80, '2022_07_26_072417_create___trades_table', 1),
(81, '2022_07_26_072419_create___chats_table', 1),
(82, '2022_07_26_072420_create___messages_table', 1),
(83, '2022_07_26_072421_create___pinnings_table', 1),
(84, '2022_07_26_072424_create___reviews_table', 1),
(85, '2022_07_26_072443_create___transactions_table', 1),
(86, '2022_07_26_072444_create___logs_table', 1);

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
(1, NULL, 'Ankelli Personal Access Client', 'ljMDIJ4w5vb1TEb7xP6Kiqfjp8va5vwxvXjofbss', NULL, 'http://localhost', 1, 0, 0, '2022-10-09 07:01:35', '2022-10-09 07:01:35'),
(2, NULL, 'Ankelli Password Grant Client', 'W53DhnFPh5XknSnd4rOnXMQn1UDlaP9fAd43JXsv', 'users', 'http://localhost', 0, 1, 0, '2022-10-09 07:01:35', '2022-10-09 07:01:35');

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
(1, 1, '2022-10-09 07:01:35', '2022-10-09 07:01:35');

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
(1, 'system', 'System', 'active', 'system', '2022-10-09 08:59:05', NULL, NULL),
(2, 'developer', 'Default Developer', 'active', 'system', '2022-10-09 06:59:28', '2022-10-09 06:59:28', NULL),
(3, 'sysadmin', 'Default System Administrator', 'active', 'system', '2022-10-09 06:59:32', '2022-10-09 06:59:32', NULL),
(4, 'busops', 'Ankelli Asset Reserves', 'active', 'system', '2022-10-09 06:59:54', '2022-10-09 06:59:54', NULL),
(5, 'busadmin', 'Default Business Administrator', 'active', 'system', '2022-10-09 07:00:24', '2022-10-09 07:00:24', NULL),
(6, 'guddaz', 'Head System Developer', 'active', 'system', '2022-10-09 07:00:35', '2022-10-09 07:00:35', NULL),
(7, 'paywyze', 'Head Business Administrator', 'active', 'system', '2022-10-09 07:01:07', '2022-10-09 07:01:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__assets`
--

CREATE TABLE `__assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chain` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smallest_display_unit` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdrawal_txn_fee_usd_fctr` decimal(8,4) UNSIGNED NOT NULL,
  `payment_txn_fee_usd_fctr` decimal(8,4) UNSIGNED NOT NULL,
  `usd_asset_exchange_rate` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `onchain_disclaimer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ttm_xpub` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttm_currency` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_status` enum('active','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__assets`
--

INSERT INTO `__assets` (`id`, `name`, `code`, `chain`, `smallest_display_unit`, `withdrawal_txn_fee_usd_fctr`, `payment_txn_fee_usd_fctr`, `usd_asset_exchange_rate`, `onchain_disclaimer`, `ttm_xpub`, `ttm_currency`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`) VALUES
(1, 'Ethereum', 'ETH', 'ETH', '0.0000000001', '1.0000', '1.0000', '0.00076', 'This platform is still in test mode on the sepolia testnet chain.\nOnchain transactions should be handled accordingly.', 'xpub6ERKWaEy6mLBzYWoo5P19QTexUufpijY5qod5xaH2ksiYtekeFYAoT3JoK87XKULgG7g3yvvxKwsGEVdkTqcC3BFjthMtJendsN1WH9nHoX', 'ETH', 'active', 'system', '2022-10-09 06:59:23', '2022-10-09 06:59:23');

-- --------------------------------------------------------

--
-- Table structure for table `__asset_custodial_wallet_addresses`
--

CREATE TABLE `__asset_custodial_wallet_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blockchain_address` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ttm_wallet_id` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `onchain_txn_count` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `last_active_datetime` timestamp NULL DEFAULT NULL,
  `ttm_gp_address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttm_gp_index_from` int(10) UNSIGNED DEFAULT NULL,
  `ttm_gp_index_to` int(10) UNSIGNED DEFAULT NULL,
  `ttm_gp_trx_fee_limit` smallint(5) UNSIGNED DEFAULT NULL,
  `ttm_gp_actvxn_txn_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__asset_custodial_wallet_addresses`
--

INSERT INTO `__asset_custodial_wallet_addresses` (`id`, `asset_code`, `blockchain_address`, `ttm_wallet_id`, `onchain_txn_count`, `last_active_datetime`, `ttm_gp_address`, `ttm_gp_index_from`, `ttm_gp_index_to`, `ttm_gp_trx_fee_limit`, `ttm_gp_actvxn_txn_id`, `creator_username`, `created_datetime`, `deleted_datetime`) VALUES
(1, 'ETH', '0x4e9470217400b27ccdb64237e6776abcda535956', '7dc19c98-a3f5-44f6-8ca1-10ae57af6832', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'system', '2022-10-09 06:59:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__asset_wallets`
--

CREATE TABLE `__asset_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ttm_virtual_account_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttm_subscription_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `__asset_wallets` (`id`, `ttm_virtual_account_id`, `ttm_subscription_id`, `user_username`, `asset_code`, `usable_balance_asset_value`, `total_balance_asset_value`, `_status`, `created_datetime`, `updated_datetime`) VALUES
(1, '63296ef838931796fa9e5aed', '63428d7b0bd6b4651175e47d', 'busops', 'ETH', '1.59014505050505', '1.59014505050505', 'active', '2022-10-09 06:59:39', '2022-10-09 07:11:10'),
(2, '632970417b09c5d6322bc225', '63428dafbe7aa1e22a454f19', 'guddaz', 'ETH', '1.14600505050505', '1.14600505050505', 'active', '2022-10-09 07:00:31', '2022-10-09 07:07:17'),
(3, '63298faa64858e37282c6266', '63428dc6b66d2c45de60540a', 'paywyze', 'ETH', '0.45', '0.45', 'active', '2022-10-09 07:00:54', '2022-10-09 07:06:28'),
(4, '632c29781bfeea9fefca383d', '63428de9468f9853419e520b', 'john_doe', 'ETH', '0.1214193989901935', '0.1214193989901935', 'active', '2022-10-09 07:01:29', '2022-10-09 07:11:19');

-- --------------------------------------------------------

--
-- Table structure for table `__asset_wallet_addresses`
--

CREATE TABLE `__asset_wallet_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_wallet_id` bigint(20) UNSIGNED NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blockchain_address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttm_derivation_key` int(10) UNSIGNED DEFAULT NULL,
  `onchain_txn_count` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `last_active_datetime` timestamp NULL DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__asset_wallet_addresses`
--

INSERT INTO `__asset_wallet_addresses` (`id`, `asset_wallet_id`, `user_username`, `blockchain_address`, `ttm_derivation_key`, `onchain_txn_count`, `last_active_datetime`, `created_datetime`, `deleted_datetime`) VALUES
(1, 1, 'busops', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 6, 8, '2022-09-24 07:04:12', '2022-10-09 06:59:39', NULL),
(2, 1, 'busops', '0x9210f311eae66d5ebed753842e6ba9ae03dd3637', 11, 3, '2022-10-04 23:25:22', '2022-10-09 06:59:40', NULL),
(3, 2, 'guddaz', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 7, 3, '2022-09-23 05:14:12', '2022-10-09 07:00:32', NULL),
(4, 2, 'guddaz', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 8, 3, '2022-09-23 05:12:42', '2022-10-09 07:00:33', NULL),
(5, 3, 'paywyze', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 9, 4, '2022-10-05 07:10:13', '2022-10-09 07:00:54', NULL),
(6, 4, 'john_doe', '0x6483545db0f4aeb80d52d67bd5a9ae73f57a14aa', 10, 2, '2022-09-23 05:28:12', '2022-10-09 07:01:30', NULL);

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
(1, 'sysadmin', 'deactivated', 'system', '2022-10-09 06:59:33', '2022-10-09 06:59:33', NULL),
(2, 'busops', 'deactivated', 'system', '2022-10-09 06:59:59', '2022-10-09 06:59:59', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-10-09 07:00:25', '2022-10-09 07:00:25', NULL);

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
(1, 'Zimbabwe', 'ZIM', NULL, NULL, NULL, 'active', 'system', '2022-10-09 08:59:07', NULL),
(2, 'South Africa', 'RSA', NULL, NULL, NULL, 'active', 'system', '2022-10-09 08:59:07', NULL),
(3, 'United Kingdom', 'UK', NULL, NULL, NULL, 'active', 'system', '2022-10-09 08:59:07', NULL),
(4, 'United States of America', 'USA', NULL, NULL, NULL, 'active', 'system', '2022-10-09 08:59:07', NULL),
(5, 'Russia', 'RUS', NULL, NULL, NULL, 'active', 'system', '2022-10-09 08:59:07', NULL),
(6, 'China', 'CHN', NULL, NULL, NULL, 'active', 'system', '2022-10-09 08:59:07', NULL),
(7, 'Ghana', 'GHA', NULL, NULL, NULL, 'active', 'system', '2022-10-09 08:59:07', NULL),
(8, 'Botswana', 'BOT', NULL, NULL, NULL, 'active', 'system', '2022-10-09 08:59:07', NULL),
(9, 'Zambia', 'ZAM', NULL, NULL, NULL, 'active', 'system', '2022-10-09 08:59:07', NULL),
(10, 'Algeria', 'ALG', NULL, NULL, NULL, 'active', 'system', '2022-10-09 08:59:07', NULL),
(11, 'Italy', 'ITA', NULL, NULL, NULL, 'active', 'system', '2022-10-09 08:59:07', NULL),
(12, 'Nigeria', 'NIG', NULL, NULL, NULL, 'active', 'system', '2022-10-09 08:59:07', NULL);

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
  `usd_rate` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_transactable_cash_amount` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smallest_transactable_cash_denomination_amount` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('active','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__currencies`
--

INSERT INTO `__currencies` (`id`, `name`, `code`, `symbol`, `symbol_before_number`, `usd_rate`, `min_transactable_cash_amount`, `smallest_transactable_cash_denomination_amount`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`) VALUES
(1, 'US Dollar', 'USD', '$', 1, '1', '10', '1', 'active', 'system', '2022-10-09 08:59:07', NULL),
(2, 'Euro', 'EUR', '€', 1, '1.02', '10', '1', 'active', 'system', '2022-10-09 08:59:07', NULL),
(3, 'Pound Sterling', 'GBP', '£', 1, '0.89', '10', '1', 'active', 'system', '2022-10-09 08:59:07', NULL),
(4, 'South African Rand', 'ZAR', 'R', 0, '18', '100', '10', 'active', 'system', '2022-10-09 08:59:07', NULL),
(5, 'Zambian Kwacha', 'ZMW', 'K', 0, '14', '100', '10', 'active', 'system', '2022-10-09 08:59:07', NULL),
(6, 'Algerian Dinar', 'DZD', 'DA', 0, '210', '100', '100', 'active', 'system', '2022-10-09 08:59:07', NULL),
(7, 'Zimbabwean Dollar', 'ZWL', '$', 1, '800', '500', '50', 'active', 'system', '2022-10-09 08:59:07', NULL);

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
(1, 'developer.ankelli@gmail.com', 'developer', '2022-10-09 06:59:27', NULL),
(2, 'sysadmin@ankelli.com', 'sysadmin', '2022-10-09 06:59:31', NULL),
(3, 'busops@ankelli.com', 'busops', '2022-10-09 06:59:36', NULL),
(4, 'busadmin@ankelli.com', 'busadmin', '2022-10-09 07:00:19', NULL),
(5, 'goodhopedhliwayo@gmail.com', 'guddaz', '2022-10-09 07:00:28', NULL),
(6, 'paywyze@ankelli.com', 'paywyze', '2022-10-09 07:00:47', NULL),
(7, 'john_doe@ankelli.com', 'john_doe', '2022-10-09 07:01:25', NULL);

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
(1, '__pymt_methods', 'cash_in_person', 'images', 'pymt_method_icon', 'Cash in person', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Cash in person.jpg', 'image/jpg', NULL, 'Cash in person.jpg', NULL, 'system', '2022-10-09 06:59:06', NULL),
(2, '__pymt_methods', 'stanbic_bank', 'images', 'pymt_method_icon', 'Stanbic Bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Stanbic bank.jpg', 'image/jpg', NULL, 'Stanbic Bank Icon.jpg', NULL, 'system', '2022-10-09 06:59:06', NULL),
(3, '__pymt_methods', 'fnb_bank', 'images', 'pymt_method_icon', 'FNB Bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/FNB bank.png', 'image/png', NULL, 'FNB Bank Icon.png', NULL, 'system', '2022-10-09 06:59:06', NULL),
(4, '__pymt_methods', 'mukuru', 'images', 'pymt_method_icon', 'Mukuru Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Mukuru.jpg', 'image/jpg', NULL, 'Mukuru Icon.jpg', NULL, 'system', '2022-10-09 06:59:06', NULL),
(5, '__pymt_methods', 'algerie_poste', 'images', 'pymt_method_icon', 'Algerie poste Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Algerie poste.jpg', 'image/jpg', NULL, 'Algerie poste Icon.jpg', NULL, 'system', '2022-10-09 06:59:06', NULL),
(6, '__pymt_methods', 'mtn_momo', 'images', 'pymt_method_icon', 'MTN MOMO Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/MTN MOMO.png', 'image/png', NULL, 'MTN MOMO Icon.png', NULL, 'system', '2022-10-09 06:59:06', NULL),
(7, '__pymt_methods', 'ecocash', 'images', 'pymt_method_icon', 'Ecocash Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Ecocash.png', 'image/png', NULL, 'Ecocash Icon.png', NULL, 'system', '2022-10-09 06:59:06', NULL),
(8, '__pymt_methods', 'paypal', 'images', 'pymt_method_icon', 'Paypal Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Paypal.png', 'image/png', NULL, 'Paypal Icon.png', NULL, 'system', '2022-10-09 06:59:06', NULL),
(9, '__pymt_methods', 'skrill', 'images', 'pymt_method_icon', 'Skrill Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Skrill.jpg', 'image/jpg', NULL, 'Skrill Icon.jpg', NULL, 'system', '2022-10-09 06:59:06', NULL),
(10, '__pymt_methods', 'world_remit', 'images', 'pymt_method_icon', 'World Remit Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/World Remit.png', 'image/png', NULL, 'World Remit Icon.png', NULL, 'system', '2022-10-09 06:59:06', NULL),
(11, '__pymt_methods', 'mastercard', 'images', 'pymt_method_icon', 'Mastercard Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Mastercard.jpeg', 'image/jpeg', NULL, 'Mastercard Icon.jpeg', NULL, 'system', '2022-10-09 06:59:06', NULL),
(12, '__pymt_methods', 'visa', 'images', 'pymt_method_icon', 'Visa Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Visa.jpg', 'image/jpg', NULL, 'Visa Icon.jpg', NULL, 'system', '2022-10-09 06:59:06', NULL),
(13, '__pymt_methods', 'fbc_bank', 'images', 'pymt_method_icon', 'FBC bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/FBC bank.jpg', 'image/jpg', NULL, 'FBC bank Icon.jpg', NULL, 'system', '2022-10-09 06:59:06', NULL);

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
  `entry_table` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry_uid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry_update_result` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_location` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__logs`
--

INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('0e5drczz9cWbCVZ2', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-09 06:59:45', NULL, NULL, '__asset_wallet_addresses', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('0nLOgzCtwpP40Z5k', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-10-09 07:00:26', NULL, NULL, '__buyer_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('1D8te6VtkRuXcCnH', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:04:22', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.08500000000000001\",\"new_value\":0.135},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.08500000000000001\",\"new_value\":0.135}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('1iPTMJsbudyRRYpS', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:06:26', NULL, NULL, '__notifications', '12056520F78A1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('1psvzNNElyDyOyGd', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:06:21', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.0355\",\"new_value\":1.0855},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.0355\",\"new_value\":1.0855}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('2qjtT2LPmYUepOu2', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-09 06:59:38', NULL, NULL, '__users', 'busops', '[{\"field_name\":\"ttm_customer_id\",\"old_value\":null,\"new_value\":\"6321ec61d5f2885b44f1bda0\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('34WspkziDL2JN34n', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:06:22', NULL, NULL, '__notifications', '1304388BE5082', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('37pnSETwuasIanmr', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:04:21', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.08500000000000001},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.08500000000000001}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('3qK8QwJ9uMQzYelj', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-09 07:01:25', NULL, '1696979489591', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('4hCePC2Wh5qnxz2M', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:09:21', NULL, NULL, '__notifications', '1140433D88A03', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('4kn6SEhOzqaeLTgf', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-10-09 07:00:09', NULL, NULL, '__seller_extensions', 'busops', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('4l03wTuFTbE2KEOw', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:04:44', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.05\",\"new_value\":0.1},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.05\",\"new_value\":0.1}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('4unzlkgK8On6duap', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:07:06', NULL, NULL, '__notifications', '1404305569381', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('5GKAGz2hnIMUXRMm', 'FACTORY_SSN', 'Addition of _Asset entry to database.', 'entry_create', 'system', '2022-10-09 06:59:24', NULL, NULL, '__assets', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('5obi7Il1R8qzg1A6', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:09:20', NULL, NULL, '__notifications', '14189476206C3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('63lGVLUO5VB4E4PC', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:07:33', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1358898989898995\",\"new_value\":0.1252598989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1358898989898995\",\"new_value\":0.1252598989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('6MCHIT4nrVB2Dus6', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:07:23', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1358898989898995\",\"new_value\":0.1256063989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1358898989898995\",\"new_value\":0.1256063989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('6SH0ctQKr1Cqzynk', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:11:00', NULL, NULL, '__notifications', '180361A9C7FF9', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('79nzQEtIrFLeA2um', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:10:41', NULL, NULL, '__notifications', '113459BBADF82', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('7AYfhk3pWYwuaRxD', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:10:32', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1087603989978585\",\"new_value\":0.1080003989978585},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1087603989978585\",\"new_value\":0.1080003989978585}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('7BTTUICAyAR4VbOS', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:05:18', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.5\",\"new_value\":0.55},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.5\",\"new_value\":0.55}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('7MO7uUhj9hXCRdqw', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-09 06:59:31', NULL, '1075866D8F13C', '__email_addresses', 'sysadmin@ankelli.com', NULL, NULL),
('8VdE7SF5PJUEUFaG', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-09 06:59:36', NULL, '125600A2D61EB', '__email_addresses', 'busops@ankelli.com', NULL, NULL),
('9ERpEyba467Vs6Ar', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:07:12', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1459898989898995\",\"new_value\":0.1359898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1459898989898995\",\"new_value\":0.1359898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('9GYyaUpv7jiTnaED', 'FACTORY_SSN', 'Addition of _AssetCustodialWalletAddress entry to database.', 'entry_create', 'system', '2022-10-09 06:59:26', NULL, NULL, '__asset_custodial_wallet_addresses', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('9MkN6U9rVWKiMxtz', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-09 06:59:27', NULL, '167096F5C7A10', '__notifications', '139248939C70E', NULL, NULL),
('ABgxnNbuY59gAYZA', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-09 06:59:28', NULL, NULL, '__user_group_memberships', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('AbIbQSq0VwT3X5F8', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-09 06:59:40', NULL, NULL, '__asset_wallet_addresses', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ag6A1ZX9kmjQyfnF', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-09 07:01:32', NULL, NULL, '__asset_wallets', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ATC338vRQCkMD73K', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-09 06:59:27', NULL, '167096F5C7A10', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('AvjJoHgjpwXbCtPI', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:10:21', NULL, NULL, '__notifications', '165323DE195FE', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('b47f4QWNodBZMDNo', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-09 07:01:01', NULL, NULL, '__asset_wallet_addresses', '5', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"\",\"regionName\":\"\",\"cityName\":\"\",\"zipCode\":null,\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.751\",\"longitude\":\"-97.822\",\"metroCode\":null,\"areaCode\":\"\",\"timezone\":\"America\\/Chicago\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\GeoPlugin\"}'),
('bBDIrgfL0PvwUf7X', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-09 07:00:53', NULL, NULL, '__users', 'paywyze', '[{\"field_name\":\"ttm_customer_id\",\"old_value\":null,\"new_value\":\"63298faa64858e37282c6267\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('BCxeYZ7Jj5dGnuWY', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:10:46', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1080003989978585\",\"new_value\":0.1221793989901935},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1080003989978585\",\"new_value\":0.1221793989901935}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('bdcQyANJTSvHxXn1', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:04:24', NULL, NULL, '__notifications', '118892078E56F', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('BqW4gCTKYj5xD2gu', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:08:50', NULL, NULL, '__notifications', '130210E717191', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('btZmafvPblQw9c7U', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:11:15', NULL, NULL, '__notifications', '1422544BEB2B6', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('BXOnPqMSYrESjdFy', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:07:20', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1359898989898995\",\"new_value\":0.1358898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1359898989898995\",\"new_value\":0.1358898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('BzKrxFfVECJKClGC', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:05:50', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.3\",\"new_value\":0.2975},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.3\",\"new_value\":0.2975}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('ccFERvRaAR0LN5Bb', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:05:04', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.9855000000000002\",\"new_value\":1.0355},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.9855000000000002\",\"new_value\":1.0355}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('CE2nG1dfh4qljH7T', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:08:23', NULL, NULL, '__notifications', '1623583AD5301', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('CfaellcjWBlBcrsJ', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-09 07:01:25', NULL, '1696979489591', '__users', 'john_doe', NULL, NULL),
('CgLzytNH7MTuOL18', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:05:45', NULL, NULL, '__notifications', '191703A00605D', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('CKywobiqF0HsI168', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-09 07:00:47', NULL, '100061D92FD8C', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('D7UnLA2koFNEyzjZ', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-09 07:00:33', NULL, NULL, '__asset_wallet_addresses', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('dEJzTA2dZhDG7rLU', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:07:17', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.13600505050505\",\"new_value\":1.14600505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.13600505050505\",\"new_value\":1.14600505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('Do7pnTLmgv6iR3HM', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:11:05', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1099848989940155\",\"new_value\":0.1092248989940155},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1099848989940155\",\"new_value\":0.1092248989940155}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('eCztms457MLNJu1U', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-09 07:00:47', NULL, '100061D92FD8C', '__notifications', '127024CF6587B', NULL, NULL),
('ej91cYiWEQJ9AwHj', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:06:23', NULL, NULL, '__notifications', '154153EE19125', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('elARPNlQcH4NDaal', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-09 07:01:25', NULL, '1696979489591', '__email_addresses', 'john_doe@ankelli.com', NULL, NULL),
('eLdSYwqzyGb4ylmJ', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:06:56', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.14649494949495\",\"new_value\":0.1459898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.14649494949495\",\"new_value\":0.1459898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('em5M7kHSVYbkXAQF', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:09:04', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.08273739899136952\",\"new_value\":0.07238039899136951},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.08273739899136952\",\"new_value\":0.07238039899136951}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('EtJxXRZZ4xzqLDSG', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:04:59', NULL, NULL, '__notifications', '143932EAE1962', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('eXkpA0SIqWAgkr9h', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:06:28', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.4\",\"new_value\":0.45},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.4\",\"new_value\":0.45}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('f2sdemTriFVMbJNn', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:09:24', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.0933883989904875\",\"new_value\":0.1038188989901935},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.0933883989904875\",\"new_value\":0.1038188989901935}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('F2w5Ksudmij5XI7r', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:09:22', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.0829578989907815\",\"new_value\":0.0933883989904875},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.0829578989907815\",\"new_value\":0.0933883989904875}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('fBaZySvNtidr5LuJ', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:07:25', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1256063989898995\",\"new_value\":0.1358898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1256063989898995\",\"new_value\":0.1358898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('fezIUDF7u6EZteRs', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:08:59', NULL, NULL, '__notifications', '1190916943A9F', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('fJdeRbQ9Vj6eIQwQ', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-10-09 07:00:26', NULL, NULL, '__seller_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('fK8E39TpqjyzvO2m', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:06:14', NULL, NULL, '__notifications', '149332A7E6C66', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('FNiBBYjPtWWELrYU', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:06:52', NULL, NULL, '__notifications', '1290550CE1E94', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('FqKddfdsiwW14NSx', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:10:23', NULL, NULL, '__notifications', '168069FDA8450', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('fwCH6cmMCqbYgkbF', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:04:23', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.7855},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.7855}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('GeNVg9nVOd8x5Pbm', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-09 06:59:50', NULL, NULL, '__asset_wallets', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('GgiSEXFRGNcy4ra3', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:08:20', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1348898989898995\",\"new_value\":0.1246063989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1348898989898995\",\"new_value\":0.1246063989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('GPg1c474pCyCszJL', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:09:25', NULL, NULL, '__notifications', '192655DB7CC5C', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('hc6syZHgi9cuvPS3', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:04:32', NULL, NULL, '__notifications', '133013C8DCB04', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('HQPtxPLczyDe8xlh', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:05:40', NULL, NULL, '__notifications', '171650D5E2007', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('HUzNkEBI4MN6DGmv', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-09 06:59:54', NULL, NULL, '__user_group_memberships', '5', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('HZdxzDdJKzVbmUP3', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:05:18', NULL, NULL, '__notifications', '177050356E330', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('i3XAj0EhqEFnnCLS', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:10:15', NULL, NULL, '__notifications', '125240B7C0761', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('i4Kxq0YGWmwVMh1j', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:08:00', NULL, NULL, '__notifications', '109978DDE2DC2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('I4PzcqsuzV07LpEP', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-09 07:00:47', NULL, '100061D92FD8C', '__email_addresses', 'paywyze@ankelli.com', NULL, NULL),
('IcqY3jDHqPHg21If', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:08:18', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1186298989898995\",\"new_value\":0.1348898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1186298989898995\",\"new_value\":0.1348898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ICT8mF1TPdoDLK4x', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:10:27', NULL, NULL, '__notifications', '194633B9216DF', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('IF4MZ1mWfJb1cLeP', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:06:00', NULL, NULL, '__notifications', '1002658C3C40A', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('IiUSnMFQFmBEnvMA', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-09 07:01:31', NULL, NULL, '__asset_wallet_addresses', '6', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('iM7SicqSSqn6YIb0', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:05:22', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.1025\",\"new_value\":1.3325},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.1025\",\"new_value\":1.3325}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ImKHpAiXnPPoaUZM', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-09 06:59:30', NULL, NULL, '__user_group_memberships', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('iPUOcnSsoceA8e1p', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-09 07:00:14', NULL, NULL, '__user_group_memberships', '6', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}');
INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('IqG9zaK4asiDyUg7', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-09 06:59:27', NULL, '167096F5C7A10', '__email_addresses', 'developer.ankelli@gmail.com', NULL, NULL),
('Iv2FaMkRbWzCiJAd', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-09 06:59:29', NULL, NULL, '__admin_extensions', 'developer', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('J4v9luNQquvsBzWX', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-10-09 07:00:04', NULL, NULL, '__buyer_extensions', 'busops', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('jAZgsjEuy1Hxe8bI', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:04:34', NULL, NULL, '__notifications', '1207239290083', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('JkaWEcObHTjOG0SG', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:10:23', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.58786505050505\",\"new_value\":1.58862505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.58786505050505\",\"new_value\":1.58862505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('JkmB5uppQUu4g88j', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:10:22', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1236993989901935\",\"new_value\":0.1229393989901935},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1236993989901935\",\"new_value\":0.1229393989901935}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('jnpxHsOiec3oGGTZ', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:06:09', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.485\",\"new_value\":1.535},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.485\",\"new_value\":1.535}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('jpNmVAVfFPmjzeZr', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:09:18', NULL, NULL, '__notifications', '1171894B1AAD3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('jW3edt5BCBH21BHy', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:07:21', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.58600505050505\",\"new_value\":1.58610505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.58600505050505\",\"new_value\":1.58610505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('jZobrvuvfazPhfx6', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-09 07:01:12', NULL, NULL, '__admin_extensions', 'paywyze', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('K00e42oVPiJHtGBZ', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:07:50', NULL, NULL, '__notifications', '166540688DA7E', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('K2KYtJZKngqgL4hC', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-09 07:01:28', NULL, NULL, '__users', 'john_doe', '[{\"field_name\":\"ttm_customer_id\",\"old_value\":null,\"new_value\":\"63207c7291626c6cd5860a21\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('KfrkTu5g36F9kaiu', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:08:30', NULL, NULL, '__notifications', '191060643F157', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('KHMDvalD6R6iIRBr', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:09:19', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.06209689899136951\",\"new_value\":0.07252739899107551},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.06209689899136951\",\"new_value\":0.07252739899107551}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('kiw1bvuWn2Wt7K1u', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:04:30', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.185\",\"new_value\":0.99},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.185\",\"new_value\":0.99}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('KKGtgcWFQKhWD4UH', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:09:33', NULL, NULL, '__notifications', '1493630D375E9', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('KN6w5cjV78BC8X7K', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:08:25', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1244593989901935\",\"new_value\":0.1140288989904875},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1244593989901935\",\"new_value\":0.1140288989904875}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('knXsDWE87Ypr5gXG', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:08:24', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1348898989898995\",\"new_value\":0.1244593989901935},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1348898989898995\",\"new_value\":0.1244593989901935}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('KvWgsbokbMGusssm', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:08:05', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1196298989898995\",\"new_value\":0.1186298989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1196298989898995\",\"new_value\":0.1186298989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('kyWdo5UPlKNtoNC7', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:06:38', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.197\",\"new_value\":0.14649494949495},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.197\",\"new_value\":0.14649494949495}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('L6PsNCNgvkw2hv1s', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-09 07:00:28', NULL, '148589DFED6F1', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Lbmtm2hIBrbj0Z6S', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:10:20', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1341298989898995\",\"new_value\":0.1236993989901935},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1341298989898995\",\"new_value\":0.1236993989901935}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('LbYcb73vClw0ZJCH', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:11:19', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1092248989940155\",\"new_value\":0.1214193989901935},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1092248989940155\",\"new_value\":0.1214193989901935}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('lDXcNN9r4KPNEGnU', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-09 07:00:37', NULL, NULL, '__admin_extensions', 'guddaz', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('lEcCUvhsJQ3kU5Uv', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:05:14', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.99\",\"new_value\":1.04},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.99\",\"new_value\":1.04}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('lhGh10UXpgezlFoj', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-09 07:00:35', NULL, NULL, '__asset_wallets', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('lrbwDuX6tSvw1lsJ', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:06:42', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.0855\",\"new_value\":1.13600505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.0855\",\"new_value\":1.13600505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('LuvQduv3S8vVYTbo', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:08:10', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.58610505050505\",\"new_value\":1.58710505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.58610505050505\",\"new_value\":1.58710505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('m0NMh5SpQJGqfnWX', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:06:17', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.2475\",\"new_value\":0.1975},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.2475\",\"new_value\":0.1975}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('M33DeaC55SBLQEWc', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:09:28', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1038188989901935\",\"new_value\":0.1142493989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1038188989901935\",\"new_value\":0.1142493989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('M9MuSXBRzj0ere03', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:05:20', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1\",\"new_value\":0.15},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1\",\"new_value\":0.15}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('m9sq9OsLrMKGU7NY', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:09:47', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1246063989898995\",\"new_value\":0.1348898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1246063989898995\",\"new_value\":0.1348898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('MdqxiN0LMeBbl5hS', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:07:02', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.5855\",\"new_value\":1.58600505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.5855\",\"new_value\":1.58600505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('MQ3qTTyyWpaop6Gg', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:09:23', NULL, NULL, '__notifications', '194176B8C682E', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Mwnuouv51qM3YrZV', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-09 06:59:36', NULL, '125600A2D61EB', '__users', 'busops', NULL, NULL),
('mWwsU1iggg5j1ZFT', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-09 07:01:24', NULL, NULL, '__user_group_memberships', '12', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('n47NNuzgHVH0iB2v', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:04:27', NULL, NULL, '__notifications', '182124FB95AAD', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('nByR0KHBBMz6SQmK', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:09:09', NULL, NULL, '__notifications', '1306988ADD12C', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('ngxTdBChQE0nX3DR', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:06:27', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.5355\",\"new_value\":1.5855},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.5355\",\"new_value\":1.5855}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('NmZBuLJR1bmelROy', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:05:27', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.4325\",\"new_value\":1.4825},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.4325\",\"new_value\":1.4825}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('nNnxsPGG9jEuXXkq', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:10:51', NULL, NULL, '__notifications', '16036406968DD', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('NOxVWRNNSRCX2UIn', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-09 07:00:29', NULL, '148589DFED6F1', '__notifications', '106707DCE1D9D', NULL, NULL),
('nXWINzhBB7FIB4rw', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-10-09 06:59:33', NULL, NULL, '__buyer_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('NZMFAjyEuFug8CPe', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:10:05', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1235668989898995\",\"new_value\":0.1228068989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1235668989898995\",\"new_value\":0.1228068989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('ObJmYNESpdxgvte8', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:07:28', NULL, NULL, '__notifications', '192956C2E4B5C', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('oEqzpriEGm1fIdYA', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-09 06:59:32', NULL, NULL, '__user_group_memberships', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('OIY4ML8HZa66oNpZ', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-09 07:00:34', NULL, NULL, '__asset_wallet_addresses', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('OlfWkyS1S2LhTgTu', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:07:38', NULL, NULL, '__notifications', '196013FD99382', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('oNE9ymIVOyCndAnZ', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:10:19', NULL, NULL, '__notifications', '19629059C8F7E', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('OQcfsfSq6k3rL1PF', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:10:55', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1221793989901935\",\"new_value\":0.1099848989940155},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1221793989901935\",\"new_value\":0.1099848989940155}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('P5AXeNZPGRzZT5Nx', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:06:47', NULL, NULL, '__notifications', '1626555F440B9', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('p7xKsoG4bnd03jXR', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:04:40', NULL, NULL, '__notifications', '169553AB2DA1F', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('pdGcp3c7UXAPiJU8', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:10:18', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1228068989898995\",\"new_value\":0.1341298989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1228068989898995\",\"new_value\":0.1341298989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('PFOgtjbBhEs3NUyu', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-09 06:59:31', NULL, '1075866D8F13C', '__notifications', '13247343967E9', NULL, NULL),
('PhmCcafL0NiN1Bf6', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-09 06:59:36', NULL, '125600A2D61EB', '__notifications', '1574900B3E562', NULL, NULL),
('PjYJtlNPewctE0h9', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:09:51', NULL, NULL, '__notifications', '118432CD67E6E', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('PmdleHpUJP42odNb', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:04:26', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.7855\",\"new_value\":0.8355},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.7855\",\"new_value\":0.8355}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('przJLfsCreJZmaXI', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:08:54', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.09316789899107551\",\"new_value\":0.08273739899136952},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.09316789899107551\",\"new_value\":0.08273739899136952}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('pvETnPD299f1avcs', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:08:19', NULL, NULL, '__notifications', '1539559A2ABC9', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('PwxglD6C0FMCDVnn', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-10-09 06:59:34', NULL, NULL, '__seller_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Q3hrjQ4696qLFmoE', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:06:33', NULL, NULL, '__notifications', '190800C5CE2A8', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('q7YG2qMg6B2P5QtY', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-09 06:59:27', NULL, '167096F5C7A10', '__users', 'developer', NULL, NULL),
('Q8VXBI5Z3zv8z3Ug', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-09 07:01:07', NULL, NULL, '__asset_wallets', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('QCsRGQlv80zXle5f', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:09:42', NULL, NULL, '__notifications', '1286087B87B3A', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('QdhJlDUTGCLCqfsL', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-09 06:59:36', NULL, '125600A2D61EB', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('qdhUoVmbkqyiwiYs', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:08:35', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1140288989904875\",\"new_value\":0.1035983989907815},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1140288989904875\",\"new_value\":0.1035983989907815}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('QLYa3Xkk1L7JePNi', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:05:23', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.3325\",\"new_value\":1.3825},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.3325\",\"new_value\":1.3825}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('QSQ5NDZzdt98kJlp', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:11:10', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.58938505050505\",\"new_value\":1.59014505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.58938505050505\",\"new_value\":1.59014505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('QVtrOI62aDqEVFXo', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-09 06:59:59', NULL, NULL, '__admin_extensions', 'busops', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('r5d2cmhjIRtPpvb3', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:07:44', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1252598989898995\",\"new_value\":0.1358898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1252598989898995\",\"new_value\":0.1358898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('r8I6FZkd9wysbLNO', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:07:23', NULL, NULL, '__notifications', '1193064DAD240', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('rfbXJ9zEk6hlTG1l', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-09 07:00:42', NULL, NULL, '__user_group_memberships', '9', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('rgJK65uegQmyzUIm', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:09:20', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.07252739899107551\",\"new_value\":0.0829578989907815},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.07252739899107551\",\"new_value\":0.0829578989907815}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('rJbhtR9mBNDL3CGo', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:04:35', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.05},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.05}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('rN8C53NEOboPANgH', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:05:21', NULL, NULL, '__notifications', '148902F1DA0B9', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('RQHL268cWNruXjcD', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:08:25', NULL, NULL, '__notifications', '18049052B42A6', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('rRupDXmEMiC0K3r5', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-09 07:01:26', NULL, '1696979489591', '__notifications', '1750312B4C867', NULL, NULL);
INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('sf4gHW4YA6hOaddE', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:08:40', NULL, NULL, '__notifications', '103661D64790F', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('siniLxL7TXbcE1gc', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:05:31', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.55\",\"new_value\":0.3},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.55\",\"new_value\":0.3}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('SJ60xX3sN04Vv6zd', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-09 07:00:29', NULL, '148589DFED6F1', '__email_addresses', 'goodhopedhliwayo@gmail.com', NULL, NULL),
('SNpodskYbhZod7EA', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-09 07:00:19', NULL, '13381901860CA', '__notifications', '192273D715649', NULL, NULL),
('T8v8tbvMpMAIUrYC', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:10:37', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.58862505050505\",\"new_value\":1.58938505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.58862505050505\",\"new_value\":1.58938505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('U8BmRKgl2nunTjah', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-09 07:00:28', NULL, '148589DFED6F1', '__users', 'guddaz', NULL, NULL),
('uEvCXxTHUYlTZ2EP', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:04:25', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.135\",\"new_value\":0.185},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.135\",\"new_value\":0.185}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('uNZwgp5X39XJGLDw', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:04:49', NULL, NULL, '__notifications', '140653F44C747', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('Uo21wY4g2NE9CwzW', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-09 07:00:27', NULL, NULL, '__user_group_memberships', '8', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('UOHxqoBuQOk5twnl', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-09 06:59:31', NULL, '1075866D8F13C', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('V0R5nFfIh0UMcFO8', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-09 07:00:19', NULL, '13381901860CA', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('v3UoLSahe2ovnqT7', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:07:19', NULL, NULL, '__notifications', '1236398FF832D', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('V3v9RjRGmwWJDrpO', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-09 06:59:33', NULL, NULL, '__admin_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('VajBTfriOuCwO1JZ', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-09 07:00:31', NULL, NULL, '__users', 'guddaz', '[{\"field_name\":\"ttm_customer_id\",\"old_value\":null,\"new_value\":\"632970417b09c5d6322bc226\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Vc7fTCDbVcrgRk8d', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-09 07:00:19', NULL, '13381901860CA', '__email_addresses', 'busadmin@ankelli.com', NULL, NULL),
('vfrMcq5QQS4X1zNi', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:05:09', NULL, NULL, '__notifications', '196801D1EF4CC', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('vPR1xtwTHMTn9GMk', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:09:14', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.07238039899136951\",\"new_value\":0.06209689899136951},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.07238039899136951\",\"new_value\":0.06209689899136951}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('VsC6N5kVN7rpzFNg', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-09 07:00:19', NULL, '13381901860CA', '__users', 'busadmin', NULL, NULL),
('vYzdnHUKCpKlym8n', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-09 07:01:16', NULL, NULL, '__user_group_memberships', '10', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('W6568tQekaAh5ZTL', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:08:15', NULL, NULL, '__notifications', '12919277305E8', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('w86jMyeSsear63MO', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:04:17', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.5},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.5}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('wkMg9dOB7qAobx1Q', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:10:10', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.58710505050505\",\"new_value\":1.58786505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.58710505050505\",\"new_value\":1.58786505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('Wp3R7Skj5vsolqkF', 'FACTORY_SSN', 'Addition of _RegToken entry to database.', 'entry_create', 'system', '2022-10-09 07:01:34', NULL, NULL, '__reg_tokens', '1234567890', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('wQgnDV2zO9OraF59', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:10:24', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1229393989901935\",\"new_value\":0.1087603989978585},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1229393989901935\",\"new_value\":0.1087603989978585}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('wRPZuw89RYrV1LA3', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:06:24', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1975\",\"new_value\":0.197},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1975\",\"new_value\":0.197}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('WTWBTpcw3kxeZ1hH', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:04:20', NULL, NULL, '__notifications', '1815907F5BAD8', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('x9c3t1sMutBYW2Jl', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:08:21', NULL, NULL, '__notifications', '1789821AB9604', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('XacWn9iDpc2lrBX8', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:07:22', NULL, NULL, '__notifications', '138431430E0D8', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('XCDKNBnow2c22CZ5', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:04:31', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.8355\",\"new_value\":0.8855000000000001},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.8355\",\"new_value\":0.8855000000000001}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('xgglBKZI0gZXBU3Z', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-09 06:59:31', NULL, '1075866D8F13C', '__users', 'sysadmin', NULL, NULL),
('xgnq6lbaWqsxY9iu', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:08:22', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1246063989898995\",\"new_value\":0.1348898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1246063989898995\",\"new_value\":0.1348898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('xiFPB3Ts6L15Me05', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:08:45', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1035983989907815\",\"new_value\":0.09316789899107551},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1035983989907815\",\"new_value\":0.09316789899107551}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('xwlnKjMi6bLf98Dm', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:09:56', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1348898989898995\",\"new_value\":0.1235668989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1348898989898995\",\"new_value\":0.1235668989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('XYawzHrk8Gb3zm82', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:04:55', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.9355000000000001\",\"new_value\":0.9855000000000002},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.9355000000000001\",\"new_value\":0.9855000000000002}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('y2FY9xk1thskmbmt', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-09 07:00:24', NULL, NULL, '__user_group_memberships', '7', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('y9rpy05PahJq9hDg', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:09:37', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1142493989898995\",\"new_value\":0.1246063989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1142493989898995\",\"new_value\":0.1246063989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('YebaXEFoQSAOZKZb', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:06:25', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.535\",\"new_value\":1.5355},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.535\",\"new_value\":1.5355}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('yl3Rh51vl5u9ujmI', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:07:18', NULL, NULL, '__notifications', '183855572B9A2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Z1Spz46qIwRgIZ58', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-09 07:00:25', NULL, NULL, '__admin_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ZaC9SJWonZ5upqhQ', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:10:01', NULL, NULL, '__notifications', '106197231B659', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('zb5NjLe0B2IyYqGz', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:06:04', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.2975\",\"new_value\":0.2475},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.2975\",\"new_value\":0.2475}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('zcjGdHOULeBJq1lD', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-09 06:59:35', NULL, NULL, '__user_group_memberships', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('zfXDLg6g8iBUiR1s', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-09 07:11:19', NULL, NULL, '__notifications', '112770CA655A7', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ZgFMXlrNNevHVCPn', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:05:19', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.04\",\"new_value\":1.1025},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.04\",\"new_value\":1.1025}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ZktkHfEEBltCpS5A', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-09 07:01:22', NULL, NULL, '__user_group_memberships', '11', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('Zky4FQh5DS7cA23f', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:07:55', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1358898989898995\",\"new_value\":0.1196298989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1358898989898995\",\"new_value\":0.1196298989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('zoCK8SIUtZL2umuW', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:05:55', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.4825\",\"new_value\":1.485},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.4825\",\"new_value\":1.485}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('ZOp1g8Mn1r6Jtv9c', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-09 07:00:47', NULL, '100061D92FD8C', '__users', 'paywyze', NULL, NULL),
('Zow5aJBqGDQxqR4E', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:05:36', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.15\",\"new_value\":0.4},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.15\",\"new_value\":0.4}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('zSAARlKKHknyyBaI', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:04:33', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.8855000000000001\",\"new_value\":0.9355000000000001},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.8855000000000001\",\"new_value\":0.9355000000000001}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('zWtVe4FImw6iKy8K', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-09 07:05:24', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.3825\",\"new_value\":1.4325},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.3825\",\"new_value\":1.4325}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}');

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
('1002658C3C40A', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0025 ETH has been debited from your account.\",\"body\":\"0.0025 ETH has been debited from your account.\\nTxn ref: 168427D29D3B2.\\nDescription: Reconciled payment\\nNew balances: Usable : 0.2975 ETH, Total : 0.2975 ETH\"}', '2022-10-09 07:05:55', NULL),
('103661D64790F', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been debited from your account.\",\"body\":\"0.010430499999706 ETH has been debited from your account.\\nTxn ref: 17069492F7920.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1035983989907815 ETH, Total : 0.1035983989907815 ETH\"}', '2022-10-09 07:08:35', NULL),
('106197231B659', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.011323 ETH has been debited from your account.\",\"body\":\"0.011323 ETH has been debited from your account.\\nTxn ref: 1292403907A5E.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1235668989898995 ETH, Total : 0.1235668989898995 ETH\"}', '2022-10-09 07:09:56', NULL),
('106707DCE1D9D', 'guddaz', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-09 07:00:29', NULL),
('109978DDE2DC2', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.01626 ETH has been debited from your account.\",\"body\":\"0.01626 ETH has been debited from your account.\\nTxn ref: 1984011DEC1BD.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1196298989898995 ETH, Total : 0.1196298989898995 ETH\"}', '2022-10-09 07:07:55', NULL),
('112770CA655A7', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.012194499996178 ETH has been credited into your account.\",\"body\":\"0.012194499996178 ETH has been credited into your account.\\nTxn ref: 1022248546ABF.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1214193989901935 ETH, Total : 0.1214193989901935 ETH\"}', '2022-10-09 07:11:19', NULL),
('113459BBADF82', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.00076 ETH has been debited from your account.\",\"body\":\"0.00076 ETH has been debited from your account.\\nTxn ref: 179556B28E21B.\\nDescription: Outbound platform charge fee for transaction 1791281F36FB8\\nNew balances: Usable : 0.1080003989978585 ETH, Total : 0.1080003989978585 ETH\"}', '2022-10-09 07:10:37', NULL),
('1140433D88A03', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been credited into your account.\",\"body\":\"0.010430499999706 ETH has been credited into your account.\\nTxn ref: 1912602ABCA69.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.0829578989907815 ETH, Total : 0.0829578989907815 ETH\"}', '2022-10-09 07:09:20', NULL),
('1171894B1AAD3', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0102835 ETH has been debited from your account.\",\"body\":\"0.0102835 ETH has been debited from your account.\\nTxn ref: 150156958C49F.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.06209689899136951 ETH, Total : 0.06209689899136951 ETH\"}', '2022-10-09 07:09:14', NULL),
('118432CD67E6E', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.0102835 ETH has been credited into your account.\",\"body\":\"0.0102835 ETH has been credited into your account.\\nTxn ref: 14769425EFC68.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1348898989898995 ETH, Total : 0.1348898989898995 ETH\"}', '2022-10-09 07:09:47', NULL),
('118892078E56F', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.7855 ETH has been credited into your account.\",\"body\":\"0.7855 ETH has been credited into your account.\\nTxn ref: 145206C1CD68E.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.7855 ETH, Total : 0.7855 ETH\"}', '2022-10-09 07:04:23', NULL),
('1190916943A9F', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been debited from your account.\",\"body\":\"0.010430499999706 ETH has been debited from your account.\\nTxn ref: 175648D22DFC4.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.08273739899136952 ETH, Total : 0.08273739899136952 ETH\"}', '2022-10-09 07:08:54', NULL),
('1193064DAD240', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0102835 ETH has been debited from your account.\",\"body\":\"0.0102835 ETH has been debited from your account.\\nTxn ref: 1162236FE077D.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1256063989898995 ETH, Total : 0.1256063989898995 ETH\"}', '2022-10-09 07:07:23', NULL),
('12056520F78A1', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0005 ETH has been debited from your account.\",\"body\":\"0.0005 ETH has been debited from your account.\\nTxn ref: 181288F7CAFB4.\\nDescription: Outbound platform charge fee for transaction 1105790DA4D87\\nNew balances: Usable : 0.197 ETH, Total : 0.197 ETH\"}', '2022-10-09 07:06:25', NULL),
('1207239290083', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 1983346E2C5F4.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.9355000000000001 ETH, Total : 0.9355000000000001 ETH\"}', '2022-10-09 07:04:33', NULL),
('1236398FF832D', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.01 ETH has been credited into your account.\",\"body\":\"0.01 ETH has been credited into your account.\\nTxn ref: 144276C9EC950.\\nDescription: Test send via email\\nNew balances: Usable : 1.14600505050505 ETH, Total : 1.14600505050505 ETH\"}', '2022-10-09 07:07:18', NULL),
('125240B7C0761', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.00076 ETH has been debited from your account.\",\"body\":\"0.00076 ETH has been debited from your account.\\nTxn ref: 1023638BF5EE3.\\nDescription: Outbound platform charge fee for transaction 1137866E2C98F\\nNew balances: Usable : 0.1228068989898995 ETH, Total : 0.1228068989898995 ETH\"}', '2022-10-09 07:10:11', NULL),
('127024CF6587B', 'paywyze', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-09 07:00:47', NULL),
('1286087B87B3A', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.010357 ETH has been credited into your account.\",\"body\":\"0.010357 ETH has been credited into your account.\\nTxn ref: 1362018B82A19.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1246063989898995 ETH, Total : 0.1246063989898995 ETH\"}', '2022-10-09 07:09:37', NULL),
('1290550CE1E94', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05050505050505 ETH has been credited into your account.\",\"body\":\"0.05050505050505 ETH has been credited into your account.\\nTxn ref: 194571F261DE5.\\nDescription: Inbound asset release for trade 181964B45B4FD\\nNew balances: Usable : 1.13600505050505 ETH, Total : 1.13600505050505 ETH\"}', '2022-10-09 07:06:47', NULL),
('12919277305E8', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.001 ETH has been debited from your account.\",\"body\":\"0.001 ETH has been debited from your account.\\nTxn ref: 10541152D8CF2.\\nDescription: Outbound platform charge fee for transaction 154888FE1206C\\nNew balances: Usable : 0.1186298989898995 ETH, Total : 0.1186298989898995 ETH\"}', '2022-10-09 07:08:10', NULL),
('130210E717191', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been debited from your account.\",\"body\":\"0.010430499999706 ETH has been debited from your account.\\nTxn ref: 183662C7A6F4C.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.09316789899107551 ETH, Total : 0.09316789899107551 ETH\"}', '2022-10-09 07:08:45', NULL),
('1304388BE5082', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.05 ETH has been debited from your account.\",\"body\":\"0.05 ETH has been debited from your account.\\nTxn ref: 1068795C0D6DF.\\nDescription: Outbound asset release for trade 198388B36A31C\\nNew balances: Usable : 0.1975 ETH, Total : 0.1975 ETH\"}', '2022-10-09 07:06:21', NULL),
('1306988ADD12C', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010357 ETH has been debited from your account.\",\"body\":\"0.010357 ETH has been debited from your account.\\nTxn ref: 183841CEBAAC7.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.07238039899136951 ETH, Total : 0.07238039899136951 ETH\"}', '2022-10-09 07:09:04', NULL),
('13247343967E9', 'sysadmin', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-09 06:59:31', NULL),
('133013C8DCB04', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 1420060C8BD92.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.8855000000000001 ETH, Total : 0.8855000000000001 ETH\"}', '2022-10-09 07:04:31', NULL),
('138431430E0D8', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0001 ETH has been debited from your account.\",\"body\":\"0.0001 ETH has been debited from your account.\\nTxn ref: 1472751915A7C.\\nDescription: Outbound platform charge fee for transaction 186678F719852\\nNew balances: Usable : 0.1358898989898995 ETH, Total : 0.1358898989898995 ETH\"}', '2022-10-09 07:07:21', NULL),
('139248939C70E', 'developer', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-09 06:59:27', NULL),
('1404305569381', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0005050505050505 ETH has been debited from your account.\",\"body\":\"0.0005050505050505 ETH has been debited from your account.\\nTxn ref: 190684F6C3645.\\nDescription: Outbound platform charge fee for transaction 148377AB4E3EB\\nNew balances: Usable : 0.1459898989898995 ETH, Total : 0.1459898989898995 ETH\"}', '2022-10-09 07:07:02', NULL),
('140653F44C747', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 116265F0C3674.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.1 ETH, Total : 0.1 ETH\"}', '2022-10-09 07:04:44', NULL),
('14189476206C3', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been credited into your account.\",\"body\":\"0.010430499999706 ETH has been credited into your account.\\nTxn ref: 1015197542723.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.07252739899107551 ETH, Total : 0.07252739899107551 ETH\"}', '2022-10-09 07:09:19', NULL),
('1422544BEB2B6', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.00076 ETH has been debited from your account.\",\"body\":\"0.00076 ETH has been debited from your account.\\nTxn ref: 168736C728FAF.\\nDescription: Outbound platform charge fee for transaction 10515514D1ED7\\nNew balances: Usable : 0.1092248989940155 ETH, Total : 0.1092248989940155 ETH\"}', '2022-10-09 07:11:10', NULL),
('143932EAE1962', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 1212452C3360C.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.9855000000000002 ETH, Total : 0.9855000000000002 ETH\"}', '2022-10-09 07:04:55', NULL),
('148902F1DA0B9', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 1777520821A1A.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.15 ETH, Total : 0.15 ETH\"}', '2022-10-09 07:05:20', NULL),
('149332A7E6C66', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.05 ETH has been debited from your account.\",\"body\":\"0.05 ETH has been debited from your account.\\nTxn ref: 1253160136FEC.\\nDescription: Test sending offchain\\nNew balances: Usable : 0.2475 ETH, Total : 0.2475 ETH\"}', '2022-10-09 07:06:09', NULL),
('1493630D375E9', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been credited into your account.\",\"body\":\"0.010430499999706 ETH has been credited into your account.\\nTxn ref: 18065211992F5.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1142493989898995 ETH, Total : 0.1142493989898995 ETH\"}', '2022-10-09 07:09:28', NULL),
('1539559A2ABC9', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.01626 ETH has been credited into your account.\",\"body\":\"0.01626 ETH has been credited into your account.\\nTxn ref: 163863B5F4C3A.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1348898989898995 ETH, Total : 0.1348898989898995 ETH\"}', '2022-10-09 07:08:18', NULL),
('154153EE19125', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 1068795C0D6DF.\\nDescription: Inbound asset release for trade 198388B36A31C\\nNew balances: Usable : 1.0855 ETH, Total : 1.0855 ETH\"}', '2022-10-09 07:06:22', NULL),
('1574900B3E562', 'busops', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-09 06:59:36', NULL),
('16036406968DD', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.014178999992335 ETH has been credited into your account.\",\"body\":\"0.014178999992335 ETH has been credited into your account.\\nTxn ref: 1842350A48229.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1221793989901935 ETH, Total : 0.1221793989901935 ETH\"}', '2022-10-09 07:10:46', NULL),
('1623583AD5301', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.0102835 ETH has been credited into your account.\",\"body\":\"0.0102835 ETH has been credited into your account.\\nTxn ref: 184750EF1E8BA.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1348898989898995 ETH, Total : 0.1348898989898995 ETH\"}', '2022-10-09 07:08:22', NULL),
('1626555F440B9', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.05050505050505 ETH has been debited from your account.\",\"body\":\"0.05050505050505 ETH has been debited from your account.\\nTxn ref: 194571F261DE5.\\nDescription: Outbound asset release for trade 181964B45B4FD\\nNew balances: Usable : 0.14649494949495 ETH, Total : 0.14649494949495 ETH\"}', '2022-10-09 07:06:42', NULL),
('165323DE195FE', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been debited from your account.\",\"body\":\"0.010430499999706 ETH has been debited from your account.\\nTxn ref: 190151085B228.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1236993989901935 ETH, Total : 0.1236993989901935 ETH\"}', '2022-10-09 07:10:20', NULL),
('166540688DA7E', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.01063 ETH has been credited into your account.\",\"body\":\"0.01063 ETH has been credited into your account.\\nTxn ref: 167780F47D50F.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1358898989898995 ETH, Total : 0.1358898989898995 ETH\"}', '2022-10-09 07:07:44', NULL),
('168069FDA8450', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.00076 ETH has been debited from your account.\",\"body\":\"0.00076 ETH has been debited from your account.\\nTxn ref: 18427346BF03B.\\nDescription: Outbound platform charge fee for transaction 140870C02D892\\nNew balances: Usable : 0.1229393989901935 ETH, Total : 0.1229393989901935 ETH\"}', '2022-10-09 07:10:23', NULL),
('169553AB2DA1F', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 1490304DA9D24.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.05 ETH, Total : 0.05 ETH\"}', '2022-10-09 07:04:35', NULL),
('171650D5E2007', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.25 ETH has been debited from your account.\",\"body\":\"0.25 ETH has been debited from your account.\\nTxn ref: 12487021DA750.\\nDescription: Reconciled payment\\nNew balances: Usable : 0.3 ETH, Total : 0.3 ETH\"}', '2022-10-09 07:05:36', NULL),
('1750312B4C867', 'john_doe', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-09 07:01:25', NULL),
('177050356E330', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 1075206B2CDA2.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.55 ETH, Total : 0.55 ETH\"}', '2022-10-09 07:05:18', NULL),
('1789821AB9604', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0102835 ETH has been debited from your account.\",\"body\":\"0.0102835 ETH has been debited from your account.\\nTxn ref: 149641F71BFA0.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1246063989898995 ETH, Total : 0.1246063989898995 ETH\"}', '2022-10-09 07:08:20', NULL),
('180361A9C7FF9', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.012194499996178 ETH has been debited from your account.\",\"body\":\"0.012194499996178 ETH has been debited from your account.\\nTxn ref: 103069ABE5A4A.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1099848989940155 ETH, Total : 0.1099848989940155 ETH\"}', '2022-10-09 07:10:55', NULL),
('18049052B42A6', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been debited from your account.\",\"body\":\"0.010430499999706 ETH has been debited from your account.\\nTxn ref: 1882520AC970E.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1244593989901935 ETH, Total : 0.1244593989901935 ETH\"}', '2022-10-09 07:08:24', NULL),
('1815907F5BAD8', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.5 ETH has been credited into your account.\",\"body\":\"0.5 ETH has been credited into your account.\\nTxn ref: 1013540249531.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.5 ETH, Total : 0.5 ETH\"}', '2022-10-09 07:04:17', NULL),
('182124FB95AAD', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 154256ED30C07.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.8355 ETH, Total : 0.8355 ETH\"}', '2022-10-09 07:04:26', NULL),
('183855572B9A2', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.01 ETH has been debited from your account.\",\"body\":\"0.01 ETH has been debited from your account.\\nTxn ref: 144276C9EC950.\\nDescription: Test send via email\\nNew balances: Usable : 0.1359898989898995 ETH, Total : 0.1359898989898995 ETH\"}', '2022-10-09 07:07:17', NULL),
('190800C5CE2A8', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 167653D3EAC21.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.45 ETH, Total : 0.45 ETH\"}', '2022-10-09 07:06:28', NULL),
('191060643F157', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been debited from your account.\",\"body\":\"0.010430499999706 ETH has been debited from your account.\\nTxn ref: 1163685208739.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1140288989904875 ETH, Total : 0.1140288989904875 ETH\"}', '2022-10-09 07:08:25', NULL),
('191703A00605D', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.25 ETH has been credited into your account.\",\"body\":\"0.25 ETH has been credited into your account.\\nTxn ref: 12487021DA750.\\nDescription: Reconciled payment\\nNew balances: Usable : 0.4 ETH, Total : 0.4 ETH\"}', '2022-10-09 07:05:40', NULL),
('192273D715649', 'busadmin', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-09 07:00:19', NULL),
('192655DB7CC5C', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been credited into your account.\",\"body\":\"0.010430499999706 ETH has been credited into your account.\\nTxn ref: 1687704B08814.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1038188989901935 ETH, Total : 0.1038188989901935 ETH\"}', '2022-10-09 07:09:24', NULL),
('192956C2E4B5C', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.0102835 ETH has been credited into your account.\",\"body\":\"0.0102835 ETH has been credited into your account.\\nTxn ref: 162314BD024CC.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1358898989898995 ETH, Total : 0.1358898989898995 ETH\"}', '2022-10-09 07:07:25', NULL),
('194176B8C682E', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been credited into your account.\",\"body\":\"0.010430499999706 ETH has been credited into your account.\\nTxn ref: 14138391443C0.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.0933883989904875 ETH, Total : 0.0933883989904875 ETH\"}', '2022-10-09 07:09:22', NULL),
('194633B9216DF', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.014178999992335 ETH has been debited from your account.\",\"body\":\"0.014178999992335 ETH has been debited from your account.\\nTxn ref: 129737B6EA996.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1087603989978585 ETH, Total : 0.1087603989978585 ETH\"}', '2022-10-09 07:10:24', NULL),
('196013FD99382', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.01063 ETH has been debited from your account.\",\"body\":\"0.01063 ETH has been debited from your account.\\nTxn ref: 1183675BF8A5B.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1252598989898995 ETH, Total : 0.1252598989898995 ETH\"}', '2022-10-09 07:07:33', NULL),
('19629059C8F7E', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.011323 ETH has been credited into your account.\",\"body\":\"0.011323 ETH has been credited into your account.\\nTxn ref: 1289998A4ED47.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1341298989898995 ETH, Total : 0.1341298989898995 ETH\"}', '2022-10-09 07:10:18', NULL),
('196801D1EF4CC', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 168872AEA55A5.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 1.0355 ETH, Total : 1.0355 ETH\"}', '2022-10-09 07:05:04', NULL);

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
  `offer_price` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trade_txn_fee_fctr` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 'Update system config params', 'update_sysconfig_params', 'Permission holder can update system config params.', 'active', 'system', '2022-10-09 08:59:06', NULL, NULL),
(2, 'Handle feedback reports', 'handle_feedback_reports', 'Permission holder can handle feedback reports.', 'active', 'system', '2022-10-09 08:59:06', NULL, NULL),
(3, 'Manage datalists', 'manage_datalists', 'Permission holder can manage datalists.', 'active', 'system', '2022-10-09 08:59:06', NULL, NULL),
(4, 'Manage system tools', 'manage_systools', 'Permission holder can manage system tools.', 'active', 'system', '2022-10-09 08:59:06', NULL, NULL),
(5, 'View all logs', 'view_all_logs', 'Permission holder can view all logs.', 'active', 'system', '2022-10-09 08:59:06', NULL, NULL),
(6, 'View all transactions', 'view_all_transactions', 'Permission holder can view all transactions.', 'active', 'system', '2022-10-09 08:59:06', NULL, NULL),
(7, 'Manage Deposit Tokens', 'manage_deposit_tokens', 'Permission holder can create and edit deposit tokens.', 'active', 'system', '2022-10-09 08:59:06', NULL, NULL),
(8, 'Handle Withdrawals', 'handle_withdrawals', 'Permission holder can handle withdrawals.', 'active', 'system', '2022-10-09 08:59:06', NULL, NULL),
(9, 'Manage Registration Tokens', 'manage_reg_tokens', 'Permission holder can create and edit registration tokens.', 'active', 'system', '2022-10-09 08:59:06', NULL, NULL),
(10, 'Handle flagged users', 'handle_flagged_users', 'Permission holder can handle flagged Users.', 'active', 'system', '2022-10-09 08:59:06', NULL, NULL),
(11, 'Handle customer service chats', 'handle_customer_service_chats', 'Permission holder can handle customer service chats.', 'active', 'system', '2022-10-09 08:59:06', NULL, NULL),
(12, 'Manage update posts', 'manage_update_posts', 'Permission holder can handle posting and editing update posts.', 'active', 'system', '2022-10-09 08:59:06', NULL, NULL),
(13, 'Handle flagged business elems', 'handle_flagged_business_elems', 'Permission holder can handle flagged business elems (Offers, Trades, etc).', 'active', 'system', '2022-10-09 08:59:06', NULL, NULL);

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
(1, '__user_groups', 'system_administrators', 'update_sysconfig_params', 'active', 'system', '2022-10-09 08:59:06', NULL),
(2, '__user_groups', 'system_administrators', 'handle_feedback_reports', 'active', 'system', '2022-10-09 08:59:06', NULL),
(3, '__user_groups', 'system_administrators', 'manage_systools', 'active', 'system', '2022-10-09 08:59:06', NULL),
(4, '__user_groups', 'system_administrators', 'manage_datalists', 'active', 'system', '2022-10-09 08:59:06', NULL),
(5, '__user_groups', 'system_administrators', 'view_all_logs', 'active', 'system', '2022-10-09 08:59:06', NULL),
(6, '__user_groups', 'business_administrators', 'view_all_transactions', 'active', 'system', '2022-10-09 08:59:06', NULL),
(7, '__user_groups', 'business_administrators', 'manage_deposit_tokens', 'active', 'system', '2022-10-09 08:59:06', NULL),
(8, '__user_groups', 'business_administrators', 'handle_withdrawals', 'active', 'system', '2022-10-09 08:59:06', NULL),
(9, '__user_groups', 'user_administrators', 'manage_reg_tokens', 'active', 'system', '2022-10-09 08:59:06', NULL),
(10, '__user_groups', 'user_administrators', 'handle_flagged_users', 'active', 'system', '2022-10-09 08:59:06', NULL),
(11, '__user_groups', 'moderators', 'handle_customer_service_chats', 'active', 'system', '2022-10-09 08:59:06', NULL),
(12, '__user_groups', 'moderators', 'handle_flagged_business_elems', 'active', 'system', '2022-10-09 08:59:06', NULL),
(13, '__user_groups', 'moderators', 'manage_update_posts', 'active', 'system', '2022-10-09 08:59:06', NULL);

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
(1, '__users', 'system', 'Backend rest api enabled', 'backend_rest_api_enabled', '1', 'boolean', 'system', '2022-10-09 08:59:06', NULL),
(2, '__users', 'system', 'Scaffolding app enabled', 'scaffolding_app_enabled', '1', 'boolean', 'system', '2022-10-09 08:59:06', NULL),
(3, '__users', 'system', 'Fallback Display Language', 'fallback_pref_lang', 'en', 'enum:langs', 'system', '2022-10-09 08:59:06', NULL),
(4, '__users', 'system', 'Fallback Display Theme', 'fallback_pref_theme', 'light', 'enum:themes', 'system', '2022-10-09 08:59:06', NULL),
(5, '__users', 'system', 'Image storage driver', 'image_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-10-09 08:59:06', NULL),
(6, '__users', 'system', 'Document storage driver', 'document_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-10-09 08:59:06', NULL),
(7, '__users', 'system', 'Open Registration enabled', 'open_reg_enabled', '0', 'boolean', 'system', '2022-10-09 08:59:06', NULL),
(8, '__users', 'system', 'Token registration enabled', 'token_reg_enabled', '0', 'boolean', 'system', '2022-10-09 08:59:06', NULL),
(9, '__users', 'system', 'Registration token max use count', 'reg_token_max_use_count', '10', 'integer', 'system', '2022-10-09 08:59:06', NULL),
(10, '__users', 'system', 'Offers to sell enabled', 'offer_to_sell_enabled', '0', 'boolean', 'system', '2022-10-09 08:59:06', NULL),
(11, '__users', 'system', 'Offers to buy enabled', 'offer_to_buy_enabled', '1', 'boolean', 'system', '2022-10-09 08:59:06', NULL),
(12, '__users', 'system', 'Min timeout (minutes) for buyer to open trade', 'buyer_open_trade_min_mins_tmt', '10', 'integer', 'system', '2022-10-09 08:59:06', NULL),
(13, '__users', 'system', 'Max timeout (minutes) for buyer to complete trade (auto flags)', 'buyer_cmplt_trade_max_mins_tmt', '240', 'integer', 'system', '2022-10-09 08:59:06', NULL),
(14, '__users', 'system', 'Use tatum crypto asset engine API', 'use_ttm_api', '1', 'boolean', 'system', '2022-10-09 08:59:06', NULL),
(15, '__users', 'system', 'Platform fee factor on trade transactions', 'trade_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-09 08:59:06', NULL),
(16, '__users', 'system', 'Platform fee factor on direct onchain transfers', 'withdrawal_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-09 08:59:06', NULL),
(17, '__users', 'system', 'Platform fee factor on direct offchain transfers', 'pymt_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-09 08:59:06', NULL),
(18, '__users', 'system', 'Platform fee factor on ankelli pay payments', 'pay_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-09 08:59:06', NULL),
(19, '__users', 'system', 'Platform fee factor on crypto conversions', 'crypto_conv_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-09 08:59:06', NULL);

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
(1, 'Cash in person', 'cash_in_person', '5e5d4b', '[\"phone_no\"]', NULL, 'active', 'system', '2022-10-09 08:59:07', NULL, NULL),
(2, 'Stanbic bank', 'stanbic_bank', '066ef3', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-10-09 08:59:07', NULL, NULL),
(3, 'FNB bank', 'fnb_bank', '009eaa', '[\"account_holder_name\",\"account_no\"]', '[\"ZAR\"]', 'active', 'system', '2022-10-09 08:59:07', NULL, NULL),
(4, 'Mukuru', 'mukuru', 'e77924', '[\"fullname\",\"phone_no\"]', '[\"USD\"]', 'active', 'system', '2022-10-09 08:59:07', NULL, NULL),
(5, 'Algérie Poste', 'algerie_poste', '01009a', '[\"account_holder_name\",\"account_holder_address\",\"account_no\",\"account_key\"]', '[\"DZD\"]', 'active', 'system', '2022-10-09 08:59:07', NULL, NULL),
(6, 'MTN Mobile Money', 'mtn_momo', 'feca05', '[\"fullname\",\"phone_no\"]', NULL, 'active', 'system', '2022-10-09 08:59:07', NULL, NULL),
(7, 'Ecocash', 'ecocash', '005ba4', '[\"fullname\",\"phone_no\"]', '[\"ZWL\"]', 'active', 'system', '2022-10-09 08:59:07', NULL, NULL),
(8, 'Paypal', 'paypal', '27346a', '[\"fullname\",\"email_address\"]', '[\"USD\",\"EUR\",\"GBP\"]', 'active', 'system', '2022-10-09 08:59:07', NULL, NULL),
(9, 'Skrill', 'skrill', '862165', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-10-09 08:59:07', NULL, NULL),
(10, 'World Remit', 'world_remit', '604684', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-10-09 08:59:07', NULL, NULL),
(11, 'Mastercard', 'mastercard', 'cc0001', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-10-09 08:59:07', NULL, NULL),
(12, 'Visa', 'visa', '0055a5', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-10-09 08:59:07', NULL, NULL),
(13, 'FBC Bank', 'fbc_bank', '0055a5', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-10-09 08:59:07', NULL, NULL);

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
('1234567890', 'usable', 'system', '2022-10-09 07:01:32');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-10-09 06:59:33', '2022-10-09 06:59:33', NULL),
(2, 'busops', 'deactivated', 'system', '2022-10-09 07:00:04', '2022-10-09 07:00:04', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-10-09 07:00:26', '2022-10-09 07:00:26', NULL);

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
('FACTORY_SSN', 'system', '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'ended', '2022-10-09 08:59:06', NULL, NULL, NULL),
('TATUM_NOTIFS_SSN', 'system', '{\"name\":\"Tatum Notification Station device\",\"version\":1}', '{\"name\":\"Tatum Notification Station agent app\",\"version\":1}', 'active', '2022-10-09 08:59:06', NULL, NULL, NULL),
('TEST_SSN', NULL, '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'active', '2022-10-09 08:59:06', NULL, NULL, NULL);

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
  `ttm_amount_blockage_id` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_value_escrowed` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer_price` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_txn_fee_fctr` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `tatum_unsigned_txn_signature_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttm_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_token` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_slug` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_blockchain_address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destination_blockchain_address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xfer_asset_value` varchar(38) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_result` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_datetime` timestamp NULL DEFAULT current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__transactions`
--

INSERT INTO `__transactions` (`ref_code`, `txn_context`, `blockchain_txn_id`, `tatum_unsigned_txn_signature_id`, `ttm_reference`, `session_token`, `operation_slug`, `sender_username`, `sender_note`, `source_blockchain_address`, `recipient_username`, `recipient_note`, `destination_blockchain_address`, `asset_code`, `xfer_asset_value`, `transfer_result`, `transfer_datetime`, `deleted_datetime`) VALUES
('1013540249531', 'onchain', '0x1dc621ba6a1a797ba3bcc82d6487fa9611d68057105d3938276f80b620e19fc1', NULL, '55b36f0b-f4c1-49b5-8d31-1a2bc81e006b', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'john_doe', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x6483545db0f4aeb80d52d67bd5a9ae73f57a14aa', 'ETH', '0.5', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0\",\"new_usable_balance_asset_value\":0.5,\"old_total_balance_asset_value\":\"0\",\"new_total_balance_asset_value\":0.5}]', '2022-09-22 07:37:41', NULL),
('1015197542723', 'onchain', NULL, NULL, '63a0b897-331d-47e2-8a91-c7032863d9ee', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.06209689899136951\",\"new_usable_balance_asset_value\":0.07252739899107551,\"old_total_balance_asset_value\":\"0.06209689899136951\",\"new_total_balance_asset_value\":0.07252739899107551}]', '2022-10-08 17:08:23', NULL),
('1022248546ABF', 'onchain', NULL, NULL, 'e9a65f19-49ec-4eae-bf31-7ff1b7792571', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.012194499996178', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1092248989940155\",\"new_usable_balance_asset_value\":0.1214193989901935,\"old_total_balance_asset_value\":\"0.1092248989940155\",\"new_total_balance_asset_value\":0.1214193989901935}]', '2022-10-09 06:59:10', NULL),
('1023638BF5EE3', 'offchain', NULL, NULL, '12a6937c-d173-487a-9db1-eaa7ffa3448d', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 1137866E2C98F', NULL, 'busops', 'Platform charge fee for transaction 1137866E2C98F', NULL, 'ETH', '0.00076', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1235668989898995\",\"new_usable_balance_asset_value\":0.1228068989898995,\"old_total_balance_asset_value\":\"0.1235668989898995\",\"new_total_balance_asset_value\":0.1228068989898995},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.58710505050505\",\"new_usable_balance_asset_value\":1.58786505050505,\"old_total_balance_asset_value\":\"1.58710505050505\",\"new_total_balance_asset_value\":1.58786505050505}]', '2022-10-08 17:18:44', NULL),
('103069ABE5A4A', 'onchain', NULL, NULL, 'e9a65f19-49ec-4eae-bf31-7ff1b7792571', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.012194499996178', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1221793989901935\",\"new_usable_balance_asset_value\":0.1099848989940155,\"old_total_balance_asset_value\":\"0.1221793989901935\",\"new_total_balance_asset_value\":0.1099848989940155}]', '2022-10-09 06:03:48', NULL),
('105118F180C72', 'onchain', '0x01dc63a1138eb09bb62ff0f5728b437b7b5da39ec842f86baa86b3f7153ca2d9', NULL, 'a41e6250-0499-44a3-95be-b3f45b2742e9', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x9210f311eae66d5ebed753842e6ba9ae03dd3637', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.3825\",\"new_usable_balance_asset_value\":1.4325,\"old_total_balance_asset_value\":\"1.3825\",\"new_total_balance_asset_value\":1.4325}]', '2022-09-24 07:18:27', NULL),
('10541152D8CF2', 'offchain', NULL, NULL, '205f9017-0601-4979-8469-63e6c943a0b0', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 154888FE1206C', NULL, 'busops', 'Platform charge fee for transaction 154888FE1206C', NULL, 'ETH', '0.001', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1196298989898995\",\"new_usable_balance_asset_value\":0.1186298989898995,\"old_total_balance_asset_value\":\"0.1196298989898995\",\"new_total_balance_asset_value\":0.1186298989898995},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.58610505050505\",\"new_usable_balance_asset_value\":1.58710505050505,\"old_total_balance_asset_value\":\"1.58610505050505\",\"new_total_balance_asset_value\":1.58710505050505}]', '2022-10-08 15:29:08', NULL),
('1068795C0D6DF', 'offchain', NULL, NULL, '83c91649-3d41-4110-8ebd-9c6ffd9da299', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound asset release for trade 198388B36A31C', NULL, 'guddaz', 'Inbound asset release for trade 198388B36A31C', NULL, 'ETH', '0.05', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.2475\",\"new_usable_balance_asset_value\":0.1975,\"old_total_balance_asset_value\":\"0.2475\",\"new_total_balance_asset_value\":0.1975},{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"1.0355\",\"new_usable_balance_asset_value\":1.0855,\"old_total_balance_asset_value\":\"1.0355\",\"new_total_balance_asset_value\":1.0855}]', '2022-10-04 17:13:35', NULL),
('1075206B2CDA2', 'onchain', '0x653654a901061ea2c09da6bc94c3e7b0c0cb63e4ba04101e81e0f84bb1381430', NULL, '03ba56b7-2354-480b-9611-3412f1d282f6', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'john_doe', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x6483545db0f4aeb80d52d67bd5a9ae73f57a14aa', 'ETH', '0.05', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.5\",\"new_usable_balance_asset_value\":0.55,\"old_total_balance_asset_value\":\"0.5\",\"new_total_balance_asset_value\":0.55}]', '2022-09-23 05:28:12', NULL),
('1111723CF800E', 'onchain', '0x16a1d7e1a6d948dc64406ddabfef44af9b1128d9d03ae78f8a331a422e0dd423', NULL, '0035d3b9-66ae-40b5-b424-a4dbb5ffdbe8', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"0.99\",\"new_usable_balance_asset_value\":1.04,\"old_total_balance_asset_value\":\"0.99\",\"new_total_balance_asset_value\":1.04}]', '2022-09-23 05:17:27', NULL),
('1127337E47DF5', 'onchain', '0x0d517112324571b63b159117c4eec22f61299254e3c4b2816b28a74fd18b85a7', NULL, '3a17f454-92a3-4dae-b445-13607f51bda7', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.805', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"0.185\",\"new_usable_balance_asset_value\":0.99,\"old_total_balance_asset_value\":\"0.185\",\"new_total_balance_asset_value\":0.99}]', '2022-09-22 19:35:42', NULL),
('1162236FE077D', 'onchain', NULL, NULL, 'f957fc35-a988-4fcb-b0fa-f488278bd51f', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.0102835', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1358898989898995\",\"new_usable_balance_asset_value\":0.1256063989898995,\"old_total_balance_asset_value\":\"0.1358898989898995\",\"new_total_balance_asset_value\":0.1256063989898995}]', '2022-10-08 13:18:44', NULL),
('116265F0C3674', 'onchain', '0xc997855772123270b396ac8b9cc4143f60a9a57aa93b40fc962210e1c11dbc8b', NULL, 'bb6492ad-49f1-4226-ae2b-c4056e6066d6', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'paywyze', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'ETH', '0.05', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":\"0.05\",\"new_usable_balance_asset_value\":0.1,\"old_total_balance_asset_value\":\"0.05\",\"new_total_balance_asset_value\":0.1}]', '2022-09-23 04:17:42', NULL),
('1163685208739', 'onchain', NULL, NULL, '7369fad5-05e1-4d81-b124-c902016fc7e8', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1244593989901935\",\"new_usable_balance_asset_value\":0.1140288989904875,\"old_total_balance_asset_value\":\"0.1244593989901935\",\"new_total_balance_asset_value\":0.1140288989904875}]', '2022-10-08 16:53:19', NULL),
('1183675BF8A5B', 'onchain', NULL, NULL, '68cd2840-5de9-4d81-b4cc-6d08a16a6850', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.01063', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1358898989898995\",\"new_usable_balance_asset_value\":0.1252598989898995,\"old_total_balance_asset_value\":\"0.1358898989898995\",\"new_total_balance_asset_value\":0.1252598989898995}]', '2022-10-08 13:43:26', NULL),
('1212452C3360C', 'onchain', '0x70de60f70bb4930f4d2711d3dbe0f87154f0405ce7a8d7e7c08dd5a634ce59b1', NULL, '9bd28cc6-9635-4abb-8dfe-618c66f991d9', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 'ETH', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"0.9355000000000001\",\"new_usable_balance_asset_value\":0.9855000000000002,\"old_total_balance_asset_value\":\"0.9355000000000001\",\"new_total_balance_asset_value\":0.9855000000000002}]', '2022-09-23 05:12:42', NULL),
('122702A28FB6E', 'onchain', '0xac43f07a966f85c2f148105da58218522ea3577d6bfb192c29904607bb960e79', NULL, 'd75a2c60-096b-457d-809e-004a2eb8a362', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.0625', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.04\",\"new_usable_balance_asset_value\":1.1025,\"old_total_balance_asset_value\":\"1.04\",\"new_total_balance_asset_value\":1.1025}]', '2022-09-23 05:43:42', NULL),
('12487021DA750', 'offchain', NULL, NULL, '916d3ee4-faee-4db0-b703-8f4341622305', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Reconciled payment', NULL, 'paywyze', 'Reconciled payment', NULL, 'ETH', '0.25', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.55\",\"new_usable_balance_asset_value\":0.3,\"old_total_balance_asset_value\":\"0.55\",\"new_total_balance_asset_value\":0.3},{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":\"0.15\",\"new_usable_balance_asset_value\":0.4,\"old_total_balance_asset_value\":\"0.15\",\"new_total_balance_asset_value\":0.4}]', '2022-10-04 09:14:35', NULL),
('1253160136FEC', 'offchain', NULL, NULL, 'bec599f3-c526-4680-b0c0-38260e0223ab', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Test sending offchain', NULL, 'busops', 'Test receiving offchain', NULL, 'ETH', '0.05', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.2975\",\"new_usable_balance_asset_value\":0.2475,\"old_total_balance_asset_value\":\"0.2975\",\"new_total_balance_asset_value\":0.2475},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.485\",\"new_usable_balance_asset_value\":1.535,\"old_total_balance_asset_value\":\"1.485\",\"new_total_balance_asset_value\":1.535}]', '2022-10-04 15:24:31', NULL),
('1289998A4ED47', 'onchain', NULL, NULL, 'f7d26835-32c3-49ad-9ba4-a854658f60c2', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.011323', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1228068989898995\",\"new_usable_balance_asset_value\":0.1341298989898995,\"old_total_balance_asset_value\":\"0.1228068989898995\",\"new_total_balance_asset_value\":0.1341298989898995}]', '2022-10-08 17:23:11', NULL),
('1292403907A5E', 'onchain', NULL, NULL, 'f7d26835-32c3-49ad-9ba4-a854658f60c2', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.011323', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1348898989898995\",\"new_usable_balance_asset_value\":0.1235668989898995,\"old_total_balance_asset_value\":\"0.1348898989898995\",\"new_total_balance_asset_value\":0.1235668989898995}]', '2022-10-08 17:18:40', NULL),
('129737B6EA996', 'onchain', NULL, NULL, 'c49d2237-8ddb-4885-a6b5-6e3da741a8e9', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.014178999992335', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1229393989901935\",\"new_usable_balance_asset_value\":0.1087603989978585,\"old_total_balance_asset_value\":\"0.1229393989901935\",\"new_total_balance_asset_value\":0.1087603989978585}]', '2022-10-09 06:00:18', NULL),
('130789467441F', 'onchain', '0xec4d69d07b5912932bfa0bbe087c79847b550f78ce5f3bc48858822caad6ade3', NULL, '630d71b4-bc46-4947-b4c5-7f39646f2e1f', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"0.08500000000000001\",\"new_usable_balance_asset_value\":0.135,\"old_total_balance_asset_value\":\"0.08500000000000001\",\"new_total_balance_asset_value\":0.135}]', '2022-09-22 14:44:27', NULL),
('13224466C62CF', 'onchain', '0xc2f701e71bed4ebee047b3a1d9c728e6bdd4c64a4bfd83bc0fb57f9435ec85ad', NULL, '8d699d15-14dc-44b8-a1ac-f72b570ef285', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x9210f311eae66d5ebed753842e6ba9ae03dd3637', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.5355\",\"new_usable_balance_asset_value\":1.5855,\"old_total_balance_asset_value\":\"1.5355\",\"new_total_balance_asset_value\":1.5855}]', '2022-10-04 23:25:22', NULL),
('1362018B82A19', 'onchain', NULL, NULL, '571b13ab-82cc-48fa-8370-b2104a2dcdb6', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.010357', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1142493989898995\",\"new_usable_balance_asset_value\":0.1246063989898995,\"old_total_balance_asset_value\":\"0.1142493989898995\",\"new_total_balance_asset_value\":0.1246063989898995}]', '2022-10-08 17:08:30', NULL),
('14138391443C0', 'onchain', NULL, NULL, '7369fad5-05e1-4d81-b124-c902016fc7e8', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.0829578989907815\",\"new_usable_balance_asset_value\":0.0933883989904875,\"old_total_balance_asset_value\":\"0.0829578989907815\",\"new_total_balance_asset_value\":0.0933883989904875}]', '2022-10-08 17:08:25', NULL),
('1420060C8BD92', 'onchain', '0x2884c784ce31f809476e48b28c67a9695d0a1303ca085b61517a0ac71fdffe44', NULL, '1297c197-0a96-4cad-9302-8d50736d84a0', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 'ETH', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"0.8355\",\"new_usable_balance_asset_value\":0.8855000000000001,\"old_total_balance_asset_value\":\"0.8355\",\"new_total_balance_asset_value\":0.8855000000000001}]', '2022-09-23 01:07:42', NULL),
('144276C9EC950', 'offchain', NULL, NULL, 'dd01fe23-14a3-4c6a-807c-3b9c2290039e', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Test send via email', NULL, 'guddaz', 'Test send via email', NULL, 'ETH', '0.01', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1459898989898995\",\"new_usable_balance_asset_value\":0.1359898989898995,\"old_total_balance_asset_value\":\"0.1459898989898995\",\"new_total_balance_asset_value\":0.1359898989898995},{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"1.13600505050505\",\"new_usable_balance_asset_value\":1.14600505050505,\"old_total_balance_asset_value\":\"1.13600505050505\",\"new_total_balance_asset_value\":1.14600505050505}]', '2022-10-08 13:04:45', NULL),
('145206C1CD68E', 'onchain', '0xafd28520c21f6b505ec126bd0ddb198837c8702dba634a655074a07c6c027545', NULL, 'b9f1fa14-6d94-47f5-afb4-63f5eb6dc749', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 'ETH', '0.7855', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"0\",\"new_usable_balance_asset_value\":0.7855,\"old_total_balance_asset_value\":\"0\",\"new_total_balance_asset_value\":0.7855}]', '2022-09-22 16:30:57', NULL),
('1472751915A7C', 'offchain', NULL, NULL, '2ef329bd-af1b-4e1f-bfa9-7354ff8f5213', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 186678F719852', NULL, 'busops', 'Platform charge fee for transaction 186678F719852', NULL, 'ETH', '0.0001', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1359898989898995\",\"new_usable_balance_asset_value\":0.1358898989898995,\"old_total_balance_asset_value\":\"0.1359898989898995\",\"new_total_balance_asset_value\":0.1358898989898995},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.58600505050505\",\"new_usable_balance_asset_value\":1.58610505050505,\"old_total_balance_asset_value\":\"1.58600505050505\",\"new_total_balance_asset_value\":1.58610505050505}]', '2022-10-08 13:04:51', NULL),
('14769425EFC68', 'onchain', NULL, NULL, '5e448202-ecf8-4a52-b08d-18442800658b', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.0102835', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1246063989898995\",\"new_usable_balance_asset_value\":0.1348898989898995,\"old_total_balance_asset_value\":\"0.1246063989898995\",\"new_total_balance_asset_value\":0.1348898989898995}]', '2022-10-08 17:08:32', NULL),
('1490304DA9D24', 'onchain', '0x8c2e8bbf031aa14db91d2b2485c4960b544184a48fc018ea81c5dcceaa26be44', NULL, '97699c1c-a3b2-434b-b9eb-e2fd29fc5e8d', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'paywyze', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'ETH', '0.05', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":\"0\",\"new_usable_balance_asset_value\":0.05,\"old_total_balance_asset_value\":\"0\",\"new_total_balance_asset_value\":0.05}]', '2022-09-23 01:24:12', NULL),
('149641F71BFA0', 'onchain', NULL, NULL, 'aee57543-8bbc-4ad6-b2e7-1d3c24cc77c7', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.0102835', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1348898989898995\",\"new_usable_balance_asset_value\":0.1246063989898995,\"old_total_balance_asset_value\":\"0.1348898989898995\",\"new_total_balance_asset_value\":0.1246063989898995}]', '2022-10-08 16:11:27', NULL),
('150156958C49F', 'onchain', NULL, NULL, '5e448202-ecf8-4a52-b08d-18442800658b', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.0102835', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.07238039899136951\",\"new_usable_balance_asset_value\":0.06209689899136951,\"old_total_balance_asset_value\":\"0.07238039899136951\",\"new_total_balance_asset_value\":0.06209689899136951}]', '2022-10-08 17:02:33', NULL),
('154256ED30C07', 'onchain', '0x1f32121d65b6564d8c0bf7b3db0707fbe9898486160f6096ca0c366bf8daae0e', NULL, '58ccea92-1eaf-412d-84cc-3334c8e0f38c', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 'ETH', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"0.7855\",\"new_usable_balance_asset_value\":0.8355,\"old_total_balance_asset_value\":\"0.7855\",\"new_total_balance_asset_value\":0.8355}]', '2022-09-22 17:22:12', NULL),
('1577126C207B2', 'onchain', '0x57128993c347bcdbf13c3dda8ccf82cf8f8baa5622b4ec39a68878dd9cdcf9e4', NULL, '98c76796-a6e4-4724-909e-08df1d407e91', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.23', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.1025\",\"new_usable_balance_asset_value\":1.3325,\"old_total_balance_asset_value\":\"1.1025\",\"new_total_balance_asset_value\":1.3325}]', '2022-09-24 04:58:57', NULL),
('1623107C8FC1C', 'onchain', '0xb394cca0ae08d34f068563799b8b6f82b88d5d42a9a80061a67f75982b2cfc5d', NULL, '61f71d83-b816-4a86-ab9b-82bd4efafc99', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.3325\",\"new_usable_balance_asset_value\":1.3825,\"old_total_balance_asset_value\":\"1.3325\",\"new_total_balance_asset_value\":1.3825}]', '2022-09-24 07:04:12', NULL),
('162314BD024CC', 'onchain', NULL, NULL, 'f957fc35-a988-4fcb-b0fa-f488278bd51f', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.0102835', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1256063989898995\",\"new_usable_balance_asset_value\":0.1358898989898995,\"old_total_balance_asset_value\":\"0.1256063989898995\",\"new_total_balance_asset_value\":0.1358898989898995}]', '2022-10-08 13:33:20', NULL),
('163618D4AF634', 'onchain', '0x443bcefcd7d4e3c818217686f8e6a7e8fa4a90a2cb88e52f76aa8abf365b0149', NULL, '144a6741-b3d2-46ce-891d-e1e2dd4382b2', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x9210f311eae66d5ebed753842e6ba9ae03dd3637', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.4325\",\"new_usable_balance_asset_value\":1.4825,\"old_total_balance_asset_value\":\"1.4325\",\"new_total_balance_asset_value\":1.4825}]', '2022-09-25 04:45:12', NULL),
('163863B5F4C3A', 'onchain', NULL, NULL, '7de7f765-9496-49c0-bf3d-6ea530744fa7', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.01626', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1186298989898995\",\"new_usable_balance_asset_value\":0.1348898989898995,\"old_total_balance_asset_value\":\"0.1186298989898995\",\"new_total_balance_asset_value\":0.1348898989898995}]', '2022-10-08 16:11:09', NULL),
('167653D3EAC21', 'onchain', '0x1b65e0f3e35a061e00874b7cdc5a37cf57972a51c07e55be0b469c493d382fef', NULL, 'a1cabdba-fd9b-4fee-a3c8-2c9ea2b2f1ef', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'paywyze', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'ETH', '0.05', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":\"0.4\",\"new_usable_balance_asset_value\":0.45,\"old_total_balance_asset_value\":\"0.4\",\"new_total_balance_asset_value\":0.45}]', '2022-10-05 07:10:13', NULL),
('167780F47D50F', 'onchain', NULL, NULL, '68cd2840-5de9-4d81-b4cc-6d08a16a6850', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.01063', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1252598989898995\",\"new_usable_balance_asset_value\":0.1358898989898995,\"old_total_balance_asset_value\":\"0.1252598989898995\",\"new_total_balance_asset_value\":0.1358898989898995}]', '2022-10-08 15:26:53', NULL),
('168427D29D3B2', 'offchain', NULL, NULL, 'c363c123-5f67-4228-a0d8-c9ee029c9615', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Reconciled payment', NULL, 'busops', 'Reconciled payment', NULL, 'ETH', '0.0025', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.3\",\"new_usable_balance_asset_value\":0.2975,\"old_total_balance_asset_value\":\"0.3\",\"new_total_balance_asset_value\":0.2975},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.4825\",\"new_usable_balance_asset_value\":1.485,\"old_total_balance_asset_value\":\"1.4825\",\"new_total_balance_asset_value\":1.485}]', '2022-10-04 09:14:40', NULL),
('168736C728FAF', 'offchain', NULL, NULL, '9911a5d2-560b-4fb4-b8da-d920506a3fca', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 10515514D1ED7', NULL, 'busops', 'Platform charge fee for transaction 10515514D1ED7', NULL, 'ETH', '0.00076', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1099848989940155\",\"new_usable_balance_asset_value\":0.1092248989940155,\"old_total_balance_asset_value\":\"0.1099848989940155\",\"new_total_balance_asset_value\":0.1092248989940155},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.58938505050505\",\"new_usable_balance_asset_value\":1.59014505050505,\"old_total_balance_asset_value\":\"1.58938505050505\",\"new_total_balance_asset_value\":1.59014505050505}]', '2022-10-09 06:03:52', NULL),
('1687704B08814', 'onchain', NULL, NULL, 'd0ddeda2-5399-4883-9be4-8dde748f861f', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.0933883989904875\",\"new_usable_balance_asset_value\":0.1038188989901935,\"old_total_balance_asset_value\":\"0.0933883989904875\",\"new_total_balance_asset_value\":0.1038188989901935}]', '2022-10-08 17:08:26', NULL),
('168872AEA55A5', 'onchain', '0x8deeae1f13c3bf1080e6b92246fbf63518455f4958c252b971ae650771755847', NULL, '9f60b02a-a83c-46be-a1d8-973c5503fa03', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 'ETH', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"0.9855000000000002\",\"new_usable_balance_asset_value\":1.0355,\"old_total_balance_asset_value\":\"0.9855000000000002\",\"new_total_balance_asset_value\":1.0355}]', '2022-09-23 05:14:12', NULL),
('17069492F7920', 'onchain', NULL, NULL, 'd70ae82e-c26a-4ca3-be81-3f30245ff125', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1140288989904875\",\"new_usable_balance_asset_value\":0.1035983989907815,\"old_total_balance_asset_value\":\"0.1140288989904875\",\"new_total_balance_asset_value\":0.1035983989907815}]', '2022-10-08 16:55:47', NULL),
('175648D22DFC4', 'onchain', NULL, NULL, '1f50ffa6-401b-4113-a13c-206abea8dbdc', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.09316789899107551\",\"new_usable_balance_asset_value\":0.08273739899136952,\"old_total_balance_asset_value\":\"0.09316789899107551\",\"new_total_balance_asset_value\":0.08273739899136952}]', '2022-10-08 16:57:34', NULL),
('1777520821A1A', 'onchain', '0x37565f0833d8a65355f80136429a246311d6394af2f2670ab405915f0df3eef5', NULL, 'e465fa91-d750-4377-8679-f5643b73aca8', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'paywyze', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'ETH', '0.05', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":\"0.1\",\"new_usable_balance_asset_value\":0.15,\"old_total_balance_asset_value\":\"0.1\",\"new_total_balance_asset_value\":0.15}]', '2022-09-23 08:47:42', NULL),
('179556B28E21B', 'offchain', NULL, NULL, '806e98b8-6a4d-4a61-82ac-7d2dc09a54c6', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 1791281F36FB8', NULL, 'busops', 'Platform charge fee for transaction 1791281F36FB8', NULL, 'ETH', '0.00076', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1087603989978585\",\"new_usable_balance_asset_value\":0.1080003989978585,\"old_total_balance_asset_value\":\"0.1087603989978585\",\"new_total_balance_asset_value\":0.1080003989978585},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.58862505050505\",\"new_usable_balance_asset_value\":1.58938505050505,\"old_total_balance_asset_value\":\"1.58862505050505\",\"new_total_balance_asset_value\":1.58938505050505}]', '2022-10-09 06:00:22', NULL),
('18065211992F5', 'onchain', NULL, NULL, '1f50ffa6-401b-4113-a13c-206abea8dbdc', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1038188989901935\",\"new_usable_balance_asset_value\":0.1142493989898995,\"old_total_balance_asset_value\":\"0.1038188989901935\",\"new_total_balance_asset_value\":0.1142493989898995}]', '2022-10-08 17:08:27', NULL),
('181288F7CAFB4', 'offchain', NULL, NULL, '252194ba-9748-4110-9e02-ed2e3b3bc918', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 1105790DA4D87', NULL, 'busops', 'Inbound platform charge fee for transaction 1105790DA4D87', NULL, 'ETH', '0.0005', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1975\",\"new_usable_balance_asset_value\":0.197,\"old_total_balance_asset_value\":\"0.1975\",\"new_total_balance_asset_value\":0.197},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.535\",\"new_usable_balance_asset_value\":1.5355,\"old_total_balance_asset_value\":\"1.535\",\"new_total_balance_asset_value\":1.5355}]', '2022-10-04 17:13:43', NULL),
('183662C7A6F4C', 'onchain', NULL, NULL, 'd0ddeda2-5399-4883-9be4-8dde748f861f', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1035983989907815\",\"new_usable_balance_asset_value\":0.09316789899107551,\"old_total_balance_asset_value\":\"0.1035983989907815\",\"new_total_balance_asset_value\":0.09316789899107551}]', '2022-10-08 16:57:04', NULL),
('183841CEBAAC7', 'onchain', NULL, NULL, '571b13ab-82cc-48fa-8370-b2104a2dcdb6', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.010357', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.08273739899136952\",\"new_usable_balance_asset_value\":0.07238039899136951,\"old_total_balance_asset_value\":\"0.08273739899136952\",\"new_total_balance_asset_value\":0.07238039899136951}]', '2022-10-08 17:00:15', NULL),
('1842350A48229', 'onchain', NULL, NULL, 'c49d2237-8ddb-4885-a6b5-6e3da741a8e9', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.014178999992335', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1080003989978585\",\"new_usable_balance_asset_value\":0.1221793989901935,\"old_total_balance_asset_value\":\"0.1080003989978585\",\"new_total_balance_asset_value\":0.1221793989901935}]', '2022-10-09 06:02:20', NULL),
('18427346BF03B', 'offchain', NULL, NULL, '01c34a77-a1a6-4f2b-9f2c-d924e84ce476', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 140870C02D892', NULL, 'busops', 'Platform charge fee for transaction 140870C02D892', NULL, 'ETH', '0.00076', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1236993989901935\",\"new_usable_balance_asset_value\":0.1229393989901935,\"old_total_balance_asset_value\":\"0.1236993989901935\",\"new_total_balance_asset_value\":0.1229393989901935},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.58786505050505\",\"new_usable_balance_asset_value\":1.58862505050505,\"old_total_balance_asset_value\":\"1.58786505050505\",\"new_total_balance_asset_value\":1.58862505050505}]', '2022-10-08 17:23:34', NULL),
('184750EF1E8BA', 'onchain', NULL, NULL, 'aee57543-8bbc-4ad6-b2e7-1d3c24cc77c7', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.0102835', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1246063989898995\",\"new_usable_balance_asset_value\":0.1348898989898995,\"old_total_balance_asset_value\":\"0.1246063989898995\",\"new_total_balance_asset_value\":0.1348898989898995}]', '2022-10-08 16:47:22', NULL),
('18487475D5B45', 'onchain', '0xb62d8880a8f5cd9e2e10f8a60d73ca4f5568758506b67939f9a989a62f3cbcba', NULL, '5af4daab-2298-418a-b7a9-8d2341046c26', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.08500000000000001', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"0\",\"new_usable_balance_asset_value\":0.08500000000000001,\"old_total_balance_asset_value\":\"0\",\"new_total_balance_asset_value\":0.08500000000000001}]', '2022-09-22 13:26:42', NULL),
('1879815C29E86', 'onchain', '0x3814d1d3c488aae7ec6f3e0d38e44273df12375770fbd45af1fdfadf117cb454', NULL, '600816e0-d753-4c13-a5ed-6411549150ee', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"0.135\",\"new_usable_balance_asset_value\":0.185,\"old_total_balance_asset_value\":\"0.135\",\"new_total_balance_asset_value\":0.185}]', '2022-09-22 16:32:43', NULL),
('1882520AC970E', 'onchain', NULL, NULL, '63a0b897-331d-47e2-8a91-c7032863d9ee', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1348898989898995\",\"new_usable_balance_asset_value\":0.1244593989901935,\"old_total_balance_asset_value\":\"0.1348898989898995\",\"new_total_balance_asset_value\":0.1244593989901935}]', '2022-10-08 16:52:04', NULL),
('190151085B228', 'onchain', '0x3074702685d0b8c9342ab7b498292ac475e9a21fab7b74c043d5bfec5eb510de', NULL, 'b0b5aed0-3019-4d6d-8b37-1f6e3cef7ac2', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1341298989898995\",\"new_usable_balance_asset_value\":0.1236993989901935,\"old_total_balance_asset_value\":\"0.1341298989898995\",\"new_total_balance_asset_value\":0.1236993989901935}]', '2022-10-08 17:23:31', NULL),
('190684F6C3645', 'offchain', NULL, NULL, '8601798b-b072-4eb1-9cf4-f64f0d19ecf7', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 148377AB4E3EB', NULL, 'busops', 'Inbound platform charge fee for transaction 148377AB4E3EB', NULL, 'ETH', '0.0005050505050505', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.14649494949495\",\"new_usable_balance_asset_value\":0.1459898989898995,\"old_total_balance_asset_value\":\"0.14649494949495\",\"new_total_balance_asset_value\":0.1459898989898995},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.5855\",\"new_usable_balance_asset_value\":1.58600505050505,\"old_total_balance_asset_value\":\"1.5855\",\"new_total_balance_asset_value\":1.58600505050505}]', '2022-10-05 14:07:14', NULL),
('1912602ABCA69', 'onchain', NULL, NULL, 'd70ae82e-c26a-4ca3-be81-3f30245ff125', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.07252739899107551\",\"new_usable_balance_asset_value\":0.0829578989907815,\"old_total_balance_asset_value\":\"0.07252739899107551\",\"new_total_balance_asset_value\":0.0829578989907815}]', '2022-10-08 17:08:25', NULL),
('194571F261DE5', 'offchain', NULL, NULL, '3272759e-8f68-4517-b49b-02f3862c0e70', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound asset release for trade 181964B45B4FD', NULL, 'guddaz', 'Inbound asset release for trade 181964B45B4FD', NULL, 'ETH', '0.05050505050505', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.197\",\"new_usable_balance_asset_value\":0.14649494949495,\"old_total_balance_asset_value\":\"0.197\",\"new_total_balance_asset_value\":0.14649494949495},{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"1.0855\",\"new_usable_balance_asset_value\":1.13600505050505,\"old_total_balance_asset_value\":\"1.0855\",\"new_total_balance_asset_value\":1.13600505050505}]', '2022-10-05 14:07:13', NULL),
('1983346E2C5F4', 'onchain', '0x7314a046630710fda5032d86af2b98d3dd5f21fa3c2b81839120417b2f31f468', NULL, '86840ae6-58da-47b5-84da-ef8517f2d1e6', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 'ETH', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"0.8855000000000001\",\"new_usable_balance_asset_value\":0.9355000000000001,\"old_total_balance_asset_value\":\"0.8855000000000001\",\"new_total_balance_asset_value\":0.9355000000000001}]', '2022-09-23 01:19:12', NULL),
('1984011DEC1BD', 'onchain', NULL, NULL, '7de7f765-9496-49c0-bf3d-6ea530744fa7', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xB2A8E24a90E5B5F7f4CBD26D350B83674652D65e', 'ETH', '0.01626', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1358898989898995\",\"new_usable_balance_asset_value\":0.1196298989898995,\"old_total_balance_asset_value\":\"0.1358898989898995\",\"new_total_balance_asset_value\":0.1196298989898995}]', '2022-10-08 15:29:05', NULL);

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
  `ttm_customer_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_status` enum('active','inactive','suspended','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__users`
--

INSERT INTO `__users` (`id`, `username`, `email_address`, `password`, `reg_token`, `avatar_image_id`, `ttm_customer_id`, `_status`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
(1, 'system', 'system', '', NULL, NULL, NULL, 'active', '2022-10-09 08:59:05', NULL, NULL),
(2, 'developer', 'developer.ankelli@gmail.com', '$2y$10$FV7oOYXzjwXhMO/VyTQaGuQ8rbeJinaryjICT68ExfvZzYVZVeoBy', NULL, NULL, NULL, 'active', '2022-10-09 06:59:26', '2022-10-09 06:59:26', NULL),
(3, 'sysadmin', 'sysadmin@ankelli.com', '$2y$10$zjt32g2fb7DzYfA8tQ7R8O1hfKQHlNByE8/f8Om6NEyMo7r/fDXQK', NULL, NULL, NULL, 'active', '2022-10-09 06:59:30', '2022-10-09 06:59:30', NULL),
(4, 'busops', 'busops@ankelli.com', '$2y$10$QBVkA.d9OsfcmtVXcjSPceotMCt8g4g9bPP1V3u3SUbpduaa6zEV2', NULL, NULL, '6321ec61d5f2885b44f1bda0', 'active', '2022-10-09 06:59:35', '2022-10-09 06:59:38', NULL),
(5, 'busadmin', 'busadmin@ankelli.com', '$2y$10$d19AaXG6T0tvJzZUTZQIbuvgaPTXdgPTyy8J7cf.Kz3Ln3l2jytQW', NULL, NULL, NULL, 'active', '2022-10-09 07:00:14', '2022-10-09 07:00:14', NULL),
(6, 'guddaz', 'goodhopedhliwayo@gmail.com', '$2y$10$C0MGBtpkoWTR8yizhUcKUumkOiTOz4UKwsxSWTZdsSJiN4lplCFA2', NULL, NULL, '632970417b09c5d6322bc226', 'active', '2022-10-09 07:00:27', '2022-10-09 07:00:31', NULL),
(7, 'paywyze', 'paywyze@ankelli.com', '$2y$10$q3y/cijiIOIID6ka98dHXOS2WzTgux0V3VtzjfAK8hoyQ4xGBdW9i', NULL, NULL, '63298faa64858e37282c6267', 'active', '2022-10-09 07:00:42', '2022-10-09 07:00:53', NULL),
(8, 'john_doe', 'john_doe@ankelli.com', '$2y$10$HF.9.l6Fy8ulFGhHbddKdOgcLcLyGh39M0hC5DXeBmTPx8Nljn6Fe', NULL, NULL, '63207c7291626c6cd5860a21', 'active', '2022-10-09 07:01:24', '2022-10-09 07:01:28', NULL);

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
(1, 'Default Users', 'default_users', 'Group for Default User accounts created on system initialization and factory_data loading. \nNew users cannot be added to this group.', 'active', 'system', '2022-10-09 08:59:05', NULL, NULL),
(2, 'Administrators', 'administrators', 'Automatically joined group (Users with active Admin Extension). \nMembers can be added to other admin groups.', 'active', 'system', '2022-10-09 08:59:05', NULL, NULL),
(3, 'Developers', 'developers', 'Admin group for unrestricted system users. \nMembers have access to all features and OTP access to account named \"developer\". \nOnly \"developer\" account can add members to this group.\nGroup used for System Development and Maintenance.', 'active', 'system', '2022-10-09 08:59:05', NULL, NULL),
(4, 'System Administrators', 'system_administrators', 'Admin Group for System Administrators. \nMembers can manage system functions and sysconfig params. \nMembers have OTP access to account named \"sysadmin\".\nOnly \"sysadmin\" account can add members to this group.', 'active', 'system', '2022-10-09 08:59:05', NULL, NULL),
(5, 'Business Administrators', 'business_administrators', 'Admin group for Business Administrators.\nMembers have access to business related features.\nMembers have OTP access to accounts named \"busops\" and \"busadmin\".\nOnly \"busadmin\" account can add members to this group.', 'active', 'system', '2022-10-09 08:59:05', NULL, NULL),
(6, 'User Administrators', 'user_administrators', 'Admin group for User Administrators. \nMembers can manage other users and user related queries.', 'active', 'system', '2022-10-09 08:59:05', NULL, NULL),
(7, 'Platform moderators', 'moderators', 'Group for Platform moderators. \nMembers can respond in the customer service chat module, handle flagged business elements, manage daily updates.', 'active', 'system', '2022-10-09 08:59:05', NULL, NULL),
(8, 'Sellers', 'sellers', 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.', 'active', 'system', '2022-10-09 08:59:05', NULL, NULL),
(9, 'Buyers', 'buyers', 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.', 'active', 'system', '2022-10-09 08:59:05', NULL, NULL),
(10, 'Beta Testers', 'beta_testers', 'User Group for selected individuals to test certain features before they are published.', 'active', 'system', '2022-10-09 08:59:05', NULL, NULL);

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
(1, 'developer', 'default_users', 'active', 'system', '2022-10-09 06:59:27', '2022-10-09 06:59:27'),
(2, 'developer', 'developers', 'active', 'system', '2022-10-09 06:59:29', '2022-10-09 06:59:29'),
(3, 'sysadmin', 'default_users', 'active', 'system', '2022-10-09 06:59:31', '2022-10-09 06:59:31'),
(4, 'sysadmin', 'system_administrators', 'active', 'system', '2022-10-09 06:59:34', '2022-10-09 06:59:34'),
(5, 'busops', 'default_users', 'active', 'system', '2022-10-09 06:59:50', '2022-10-09 06:59:50'),
(6, 'busops', 'business_administrators', 'active', 'system', '2022-10-09 07:00:09', '2022-10-09 07:00:09'),
(7, 'busadmin', 'default_users', 'active', 'system', '2022-10-09 07:00:19', '2022-10-09 07:00:19'),
(8, 'busadmin', 'business_administrators', 'active', 'system', '2022-10-09 07:00:26', '2022-10-09 07:00:26'),
(9, 'guddaz', 'developers', 'active', 'system', '2022-10-09 07:00:37', '2022-10-09 07:00:37'),
(10, 'paywyze', 'system_administrators', 'active', 'system', '2022-10-09 07:01:12', '2022-10-09 07:01:12'),
(11, 'paywyze', 'user_administrators', 'active', 'system', '2022-10-09 07:01:16', '2022-10-09 07:01:16'),
(12, 'paywyze', 'business_administrators', 'active', 'system', '2022-10-09 07:01:22', '2022-10-09 07:01:22');

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
-- Indexes for table `__asset_custodial_wallet_addresses`
--
ALTER TABLE `__asset_custodial_wallet_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__asset_custodial_wallet_addresses_blockchain_address_unique` (`blockchain_address`),
  ADD UNIQUE KEY `__asset_custodial_wallet_addresses_ttm_wallet_id_unique` (`ttm_wallet_id`),
  ADD UNIQUE KEY `asset_code_blockchain_address_ttm_wallet_id_unique` (`asset_code`,`blockchain_address`,`ttm_wallet_id`),
  ADD UNIQUE KEY `__asset_custodial_wallet_addresses_ttm_gp_address_unique` (`ttm_gp_address`),
  ADD UNIQUE KEY `__asset_custodial_wallet_addresses_ttm_gp_actvxn_txn_id_unique` (`ttm_gp_actvxn_txn_id`),
  ADD KEY `__asset_custodial_wallet_addresses_creator_username_foreign` (`creator_username`);

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
  ADD UNIQUE KEY `asset_wallet_id_blockchain_address_ttm_derivation_key_unique` (`asset_wallet_id`,`blockchain_address`,`ttm_derivation_key`),
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
  ADD UNIQUE KEY `__transactions_tatum_unsigned_txn_signature_id_unique` (`tatum_unsigned_txn_signature_id`),
  ADD KEY `__transactions_session_token_foreign` (`session_token`),
  ADD KEY `__transactions_sender_username_foreign` (`sender_username`),
  ADD KEY `__transactions_recipient_username_foreign` (`recipient_username`),
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

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
-- AUTO_INCREMENT for table `__asset_custodial_wallet_addresses`
--
ALTER TABLE `__asset_custodial_wallet_addresses`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
-- Constraints for table `__asset_custodial_wallet_addresses`
--
ALTER TABLE `__asset_custodial_wallet_addresses`
  ADD CONSTRAINT `__asset_custodial_wallet_addresses_asset_code_foreign` FOREIGN KEY (`asset_code`) REFERENCES `__assets` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `__asset_custodial_wallet_addresses_creator_username_foreign` FOREIGN KEY (`creator_username`) REFERENCES `__users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

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
