-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 15, 2022 at 04:54 PM
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
(206, '2014_10_12_000000_create_users_table', 1),
(207, '2014_10_12_100000_create_password_resets_table', 1),
(208, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(209, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(210, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(211, '2016_06_01_000004_create_oauth_clients_table', 1),
(212, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(213, '2019_08_19_000000_create_failed_jobs_table', 1),
(214, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(215, '2022_07_26_072110_create___admin_extensions_table', 1),
(216, '2022_07_26_072112_create___buyer_extensions_table', 1),
(217, '2022_07_26_072114_create___seller_extensions_table', 1),
(218, '2022_07_26_072120_create___user_groups_table', 1),
(219, '2022_07_26_072122_create___user_group_memberships_table', 1),
(220, '2022_07_26_072124_create___permissions_table', 1),
(221, '2022_07_26_072126_create___permission_instances_table', 1),
(222, '2022_07_26_072130_create___sessions_table', 1),
(223, '2022_07_26_072131_create___notifications_table', 1),
(224, '2022_07_26_072132_create___pref_items_table', 1),
(225, '2022_07_26_072135_create___reg_tokens_table', 1),
(226, '2022_07_26_072136_create___verif_tokens_table', 1),
(227, '2022_07_26_072137_create___email_addresses_table', 1),
(228, '2022_07_26_072140_create___phone_nos_table', 1),
(229, '2022_07_26_072324_create___files_table', 1),
(230, '2022_07_26_072326_create___feedback_reports_table', 1),
(231, '2022_07_26_072327_create___posts_table', 1),
(232, '2022_07_26_072332_create___assets_table', 1),
(233, '2022_07_26_072333_create___asset_accounts_table', 1),
(234, '2022_07_26_072334_create___asset_account_addresses_table', 1),
(235, '2022_07_26_072336_create___currencies_table', 1),
(236, '2022_07_26_072337_create___pymt_methods_table', 1),
(237, '2022_07_26_072345_create___countries_table', 1),
(238, '2022_07_26_072347_create___exportables_table', 1),
(239, '2022_07_26_072410_create___deposit_tokens_table', 1),
(240, '2022_07_26_072416_create___offers_table', 1),
(241, '2022_07_26_072417_create___trades_table', 1),
(242, '2022_07_26_072419_create___chats_table', 1),
(243, '2022_07_26_072420_create___messages_table', 1),
(244, '2022_07_26_072421_create___pinnings_table', 1),
(245, '2022_07_26_072443_create___transactions_table', 1),
(246, '2022_07_26_072444_create___logs_table', 1);

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
(1, NULL, 'Ankelli Personal Access Client', 'L3BukZoM4PXpq47P6wmplsqgKRHvIJASIpCGImwz', NULL, 'http://localhost', 1, 0, 0, '2022-09-15 12:52:23', '2022-09-15 12:52:23'),
(2, NULL, 'Ankelli Password Grant Client', 'idPtUmQ6Qx4B0Hpwp2KLTVsr3OHwPluwrdORFPCc', 'users', 'http://localhost', 0, 1, 0, '2022-09-15 12:52:23', '2022-09-15 12:52:23');

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
(1, 1, '2022-09-15 12:52:23', '2022-09-15 12:52:23');

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
(1, 'system', 'System', 'active', 'system', '2022-09-15 14:51:52', NULL, NULL),
(2, 'developer', 'Default Developer', 'active', 'system', '2022-09-15 12:52:19', '2022-09-15 12:52:19', NULL),
(3, 'sysadmin', 'Default System Administrator', 'active', 'system', '2022-09-15 12:52:19', '2022-09-15 12:52:19', NULL),
(4, 'reserves', 'Ankelli Asset Reserves', 'active', 'system', '2022-09-15 12:52:21', '2022-09-15 12:52:21', NULL),
(5, 'busadmin', 'Default Business Administrator', 'active', 'system', '2022-09-15 12:52:22', '2022-09-15 12:52:22', NULL),
(6, 'guddaz', 'Head System Developer', 'active', 'system', '2022-09-15 12:52:32', '2022-09-15 12:52:32', NULL),
(7, 'lodza', 'Head Business Administrator', 'active', 'system', '2022-09-15 12:52:34', '2022-09-15 12:52:34', NULL);

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
(1, NULL, NULL, 'Tether USD', 'USDT', '0.0001', 'active', 'system', '2022-09-15 12:51:56', '2022-09-15 12:51:56');

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
(1, NULL, 'reserves', 'USDT', '1619.1915423834', '1619.1915423834', 'active', '2022-09-15 12:52:20', '2022-09-15 12:54:29'),
(2, NULL, 'guddaz', 'USDT', '423.09622760618', '423.09622760618', 'active', '2022-09-15 12:52:42', '2022-09-15 12:54:21'),
(3, NULL, 'lodza', 'USDT', '567.94045965284', '567.94045965284', 'active', '2022-09-15 12:52:43', '2022-09-15 12:54:01'),
(4, NULL, 'flint', 'USDT', '139.9256231748', '139.9256231748', 'active', '2022-09-15 12:52:44', '2022-09-15 12:54:28'),
(5, NULL, 'ross', 'USDT', '1.4893617021219', '1.4893617021219', 'active', '2022-09-15 12:52:48', '2022-09-15 12:53:36'),
(6, NULL, 'keith', 'USDT', '103.29954915547', '103.29954915547', 'active', '2022-09-15 12:52:50', '2022-09-15 12:53:56'),
(7, NULL, 'jimmy', 'USDT', '482.18610415589', '482.18610415589', 'active', '2022-09-15 12:52:52', '2022-09-15 12:54:15'),
(8, NULL, 'clarence', 'USDT', '312.76595744681', '312.76595744681', 'active', '2022-09-15 12:52:54', '2022-09-15 12:53:35'),
(9, NULL, 'nassim', 'USDT', '302.24719101124', '302.24719101124', 'active', '2022-09-15 12:52:56', '2022-09-15 12:54:14'),
(10, NULL, 'raymond', 'USDT', '368.42105263158', '368.42105263158', 'active', '2022-09-15 12:53:14', '2022-09-15 12:54:08'),
(11, NULL, 'peter', 'USDT', '471.83979974969', '471.83979974969', 'active', '2022-09-15 12:53:48', '2022-09-15 12:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `__asset_account_addresses`
--

CREATE TABLE `__asset_account_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_account_id` bigint(20) UNSIGNED NOT NULL,
  `blockchain_address` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_derivation_key` int(10) UNSIGNED DEFAULT NULL,
  `tx_count` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_active_datetime` timestamp NULL DEFAULT NULL,
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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-15 12:52:20', '2022-09-15 12:52:20', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-15 12:52:21', '2022-09-15 12:52:21', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-15 12:52:22', '2022-09-15 12:52:22', NULL),
(4, 'ross', 'active', 'guddaz', '2022-09-15 12:52:58', '2022-09-15 12:52:58', NULL),
(5, 'raymond', 'active', 'lodza', '2022-09-15 12:53:10', '2022-09-15 12:53:10', NULL),
(6, 'keith', 'active', 'lodza', '2022-09-15 12:53:18', '2022-09-15 12:53:18', NULL),
(7, 'jimmy', 'active', 'lodza', '2022-09-15 12:53:24', '2022-09-15 12:53:24', NULL),
(8, 'clarence', 'active', 'ross', '2022-09-15 12:53:31', '2022-09-15 12:53:31', NULL),
(9, 'lodza', 'active', 'keith', '2022-09-15 12:53:38', '2022-09-15 12:53:38', NULL),
(10, 'peter', 'active', 'keith', '2022-09-15 12:53:44', '2022-09-15 12:53:44', NULL),
(11, 'flint', 'active', 'keith', '2022-09-15 12:53:51', '2022-09-15 12:53:51', NULL),
(12, 'nassim', 'active', 'jimmy', '2022-09-15 12:54:11', '2022-09-15 12:54:11', NULL),
(13, 'guddaz', 'active', 'flint', '2022-09-15 12:54:17', '2022-09-15 12:54:17', NULL);

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
(1, 'Zimbabwe', 'ZIM', NULL, NULL, NULL, 'active', 'system', '2022-09-15 14:51:54', NULL),
(2, 'South Africa', 'RSA', NULL, NULL, NULL, 'active', 'system', '2022-09-15 14:51:54', NULL),
(3, 'United Kingdom', 'UK', NULL, NULL, NULL, 'active', 'system', '2022-09-15 14:51:54', NULL),
(4, 'United States of America', 'USA', NULL, NULL, NULL, 'active', 'system', '2022-09-15 14:51:54', NULL),
(5, 'Russia', 'RUS', NULL, NULL, NULL, 'active', 'system', '2022-09-15 14:51:54', NULL),
(6, 'China', 'CHN', NULL, NULL, NULL, 'active', 'system', '2022-09-15 14:51:54', NULL),
(7, 'Ghana', 'GHA', NULL, NULL, NULL, 'active', 'system', '2022-09-15 14:51:54', NULL),
(8, 'Botswana', 'BOT', NULL, NULL, NULL, 'active', 'system', '2022-09-15 14:51:54', NULL),
(9, 'Zambia', 'ZAM', NULL, NULL, NULL, 'active', 'system', '2022-09-15 14:51:54', NULL),
(10, 'Algeria', 'ALG', NULL, NULL, NULL, 'active', 'system', '2022-09-15 14:51:54', NULL),
(11, 'Italy', 'ITA', NULL, NULL, NULL, 'active', 'system', '2022-09-15 14:51:54', NULL),
(12, 'Nigeria', 'NIG', NULL, NULL, NULL, 'active', 'system', '2022-09-15 14:51:54', NULL);

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
(1, 'US Dollar', 'USD', '$', 1, '1', '10', '5', 'active', 'system', '2022-09-15 14:51:54', NULL),
(2, 'Euro', 'EUR', '€', 1, '0.87', '10', '5', 'active', 'system', '2022-09-15 14:51:54', NULL),
(3, 'Pound Sterling', 'GBP', '£', 1, '0.77', '10', '5', 'active', 'system', '2022-09-15 14:51:54', NULL),
(4, 'South African Rand', 'ZAR', 'R', 0, '16', '100', '100', 'active', 'system', '2022-09-15 14:51:54', NULL),
(5, 'Zambian Kwacha', 'ZMW', 'K', 0, '15', '100', '100', 'active', 'system', '2022-09-15 14:51:54', NULL),
(6, 'Algerian Dinar', 'DZD', 'DA', 0, '180', '100', '100', 'active', 'system', '2022-09-15 14:51:54', NULL),
(7, 'Zimbabwean Dollar', 'ZWL', '$', 1, '10000', '500', '5000', 'active', 'system', '2022-09-15 14:51:54', NULL);

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
('132876B24E252', 'USDT', '500', 'USD', 501, 'lodza', '2022-09-15 12:52:52', 'jimmy', '2022-09-15 12:52:52'),
('163554057E0FC', 'USDT', '100', 'DZD', 18000, 'lodza', '2022-09-15 12:52:56', 'nassim', '2022-09-15 12:52:56'),
('17618828366A7', 'USDT', '110', 'USD', 111, 'lodza', '2022-09-15 12:52:48', 'ross', '2022-09-15 12:52:48'),
('177738C540D3F', 'USDT', '600', 'USD', 601, 'lodza', '2022-09-15 12:52:50', 'keith', '2022-09-15 12:52:50'),
('186548AC1B95D', 'USDT', '100', 'EUR', 93, 'lodza', '2022-09-15 12:52:54', 'clarence', '2022-09-15 12:52:54');

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
(1, 'developer.ankelli@gmail.com', 'developer', '2022-09-15 12:52:14', NULL),
(2, 'sysadmin@ankelli.com', 'sysadmin', '2022-09-15 12:52:19', NULL),
(3, 'reserves@ankelli.com', 'reserves', '2022-09-15 12:52:20', NULL),
(4, 'busadmin@ankelli.com', 'busadmin', '2022-09-15 12:52:21', NULL),
(5, 'goodhopedhliwayo@gmail.com', 'guddaz', '2022-09-15 12:52:32', NULL),
(6, 'lodza@example.com', 'lodza', '2022-09-15 12:52:33', NULL),
(7, 'ross@example.com', 'ross', '2022-09-15 12:52:35', NULL),
(8, 'jimmy@example.com', 'jimmy', '2022-09-15 12:52:36', NULL),
(9, 'keith@example.com', 'keith', '2022-09-15 12:52:36', NULL),
(10, 'peter@example.com', 'peter', '2022-09-15 12:52:37', NULL),
(11, 'flint@example.com', 'flint', '2022-09-15 12:52:38', NULL),
(12, 'clarence@example.com', 'clarence', '2022-09-15 12:52:39', NULL),
(13, 'raymond@example.com', 'raymond', '2022-09-15 12:52:40', NULL),
(14, 'nassim@example.com', 'nassim', '2022-09-15 12:52:40', NULL);

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
(1, '__pymt_methods', 'cash_in_person', 'images', 'pymt_method_icon', 'Cash in person', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Cash in person.jpg', 'image/jpg', NULL, 'Cash in person.jpg', NULL, 'system', '2022-09-15 12:51:53', NULL),
(2, '__pymt_methods', 'stanbic_bank', 'images', 'pymt_method_icon', 'Stanbic Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Stanbic bank.jpg', 'image/jpg', NULL, 'Stanbic Bank Icon.jpg', NULL, 'system', '2022-09-15 12:51:53', NULL),
(3, '__pymt_methods', 'fnb_bank', 'images', 'pymt_method_icon', 'FNB Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FNB bank.png', 'image/png', NULL, 'FNB Bank Icon.png', NULL, 'system', '2022-09-15 12:51:53', NULL),
(4, '__pymt_methods', 'mukuru', 'images', 'pymt_method_icon', 'Mukuru Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mukuru.jpg', 'image/jpg', NULL, 'Mukuru Icon.jpg', NULL, 'system', '2022-09-15 12:51:53', NULL),
(5, '__pymt_methods', 'algerie_poste', 'images', 'pymt_method_icon', 'Algerie poste Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Algerie poste.jpg', 'image/jpg', NULL, 'Algerie poste Icon.jpg', NULL, 'system', '2022-09-15 12:51:53', NULL),
(6, '__pymt_methods', 'mtn_momo', 'images', 'pymt_method_icon', 'MTN MOMO Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/MTN MOMO.png', 'image/png', NULL, 'MTN MOMO Icon.png', NULL, 'system', '2022-09-15 12:51:53', NULL),
(7, '__pymt_methods', 'ecocash', 'images', 'pymt_method_icon', 'Ecocash Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Ecocash.png', 'image/png', NULL, 'Ecocash Icon.png', NULL, 'system', '2022-09-15 12:51:53', NULL),
(8, '__pymt_methods', 'paypal', 'images', 'pymt_method_icon', 'Paypal Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Paypal.png', 'image/png', NULL, 'Paypal Icon.png', NULL, 'system', '2022-09-15 12:51:53', NULL),
(9, '__pymt_methods', 'skrill', 'images', 'pymt_method_icon', 'Skrill Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Skrill.jpg', 'image/jpg', NULL, 'Skrill Icon.jpg', NULL, 'system', '2022-09-15 12:51:53', NULL),
(10, '__pymt_methods', 'world_remit', 'images', 'pymt_method_icon', 'World Remit Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/World Remit.png', 'image/png', NULL, 'World Remit Icon.png', NULL, 'system', '2022-09-15 12:51:53', NULL),
(11, '__pymt_methods', 'mastercard', 'images', 'pymt_method_icon', 'Mastercard Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mastercard.jpeg', 'image/jpeg', NULL, 'Mastercard Icon.jpeg', NULL, 'system', '2022-09-15 12:51:53', NULL),
(12, '__pymt_methods', 'visa', 'images', 'pymt_method_icon', 'Visa Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Visa.jpg', 'image/jpg', NULL, 'Visa Icon.jpg', NULL, 'system', '2022-09-15 12:51:53', NULL),
(13, '__pymt_methods', 'fbc_bank', 'images', 'pymt_method_icon', 'FBC bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FBC bank.jpg', 'image/jpg', NULL, 'FBC bank Icon.jpg', NULL, 'system', '2022-09-15 12:51:53', NULL);

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
('0clhkyc4gy8RX80C', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'clarence', '2022-09-15 12:52:55', NULL, NULL, '__deposit_tokens', '186548AC1B95D', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:52:54\"}]', '{\"ip\":\"127.0.0.1\"}'),
('0dtfn9xgmhvUrQLG', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 12:52:54', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1790,\"new_value\":1690},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1790,\"new_value\":1690}]', '{\"ip\":\"127.0.0.1\"}'),
('0iSVtmJJLYWJuo6l', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-15 12:53:39', NULL, NULL, '__trades', '1660964F3FD53', NULL, '{\"ip\":\"127.0.0.1\"}'),
('0mEgotEoSxFxwoIW', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:53:29', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1593.6058230682,\"new_value\":1599.9888017916},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1593.6058230682,\"new_value\":1599.9888017916}]', '{\"ip\":\"127.0.0.1\"}'),
('0PGQPiLK0csTUvDz', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 12:53:23', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1592.1164613661,\"new_value\":1593.6058230682},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1592.1164613661,\"new_value\":1593.6058230682}]', '{\"ip\":\"127.0.0.1\"}'),
('0r2GysTObGuunnA3', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-15 12:53:56', NULL, NULL, '__trades', '17686029289C2', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:53\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('0SMHDuerJ6IlrPhv', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:53:28', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":500,\"new_value\":1138.2978723404},{\"field_name\":\"total_balance_asset_value\",\"old_value\":500,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('0V8uNMmve7MlsmCi', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 12:52:19', NULL, NULL, '__user_group_memberships', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('0xcB3lngn0Nm4E2h', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:54:01', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":383.72993333705,\"new_value\":567.94045965284},{\"field_name\":\"total_balance_asset_value\",\"old_value\":383.72993333705,\"new_value\":567.94045965284}]', '{\"ip\":\"127.0.0.1\"}'),
('0ZiVq1S4bjq8j8vs', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 12:54:09', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":689.08734602461,\"new_value\":686.45576707724},{\"field_name\":\"total_balance_asset_value\",\"old_value\":689.08734602461,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('1mSrF9YFMX5t7RcR', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 12:54:21', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":562.76041666667,\"new_value\":349.99445921986},{\"field_name\":\"total_balance_asset_value\",\"old_value\":562.76041666667,\"new_value\":349.99445921986}]', '{\"ip\":\"127.0.0.1\"}'),
('1nV8Ytp9SD6z7f1p', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 12:52:34', NULL, NULL, '__user_group_memberships', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('1oCVyUzBgAVNF5IV', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 12:54:28', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":141.98444670421,\"new_value\":139.9256231748},{\"field_name\":\"total_balance_asset_value\",\"old_value\":141.98444670421,\"new_value\":139.9256231748}]', '{\"ip\":\"127.0.0.1\"}'),
('1pT4bYrTxGpIG9e7', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-15 12:53:38', NULL, NULL, '__buyer_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('1scwiaQYxXu0sXed', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-15 12:53:23', NULL, NULL, '__trades', '183787710F538', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:20\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('2f2ro62kL3yvqjmX', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:53', NULL, NULL, '__messages', '1800763E05DCC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('2G6rC3FA4AnZOgEi', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-15 12:53:26', NULL, NULL, '__trades', '1887449E651CE', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:26\"}]', '{\"ip\":\"127.0.0.1\"}'),
('2KQn0H52SaU69ol8', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:53:18', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":968.31000052631,\"new_value\":817.88446861142}]', '{\"ip\":\"127.0.0.1\"}'),
('2kQpXug9Xzj16NmK', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:40', NULL, '1360375AFD653', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('2OCtLLVVTZHl8CfZ', 'FACTORY_SESSION', 'Temporarily disabling for factory users.', 'entry_update', 'system', '2022-09-15 12:52:08', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for factory users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('2qDav6qfy2pZXghh', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 12:52:20', NULL, NULL, '__user_group_memberships', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('2tjDxLo9DKpXBTd9', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:50', NULL, NULL, '__messages', '143883D4D02E1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('2zJDsbUE8mjfx5NE', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 12:53:55', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":104.92715332214},{\"field_name\":\"total_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":104.92715332214}]', '{\"ip\":\"127.0.0.1\"}'),
('35numXHkJaCCYsAy', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:36', NULL, NULL, '__messages', '1928412E8E033', NULL, '{\"ip\":\"127.0.0.1\"}'),
('3dzM5qeeAgdGo1Qw', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:36', NULL, '18436927BF238', '__notifications', '147168E6D5B57', NULL, NULL),
('3eGr9bAFBP8U9lpg', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'peter', '2022-09-15 12:53:50', NULL, NULL, '__trades', '107373C946C69', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"peter\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:46\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('3ErNkyxt8V34cVjM', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 12:54:06', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('3h0Yy4Hhe33LLtbD', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 12:53:07', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":110,\"new_value\":216.3829787234},{\"field_name\":\"total_balance_asset_value\",\"old_value\":110,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('3wqK1JsLYXd9vaCD', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-15 12:53:16', NULL, NULL, '__trades', '19948073AED96', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:13\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('49KbIvwh2N8GVnNu', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-15 12:52:22', NULL, NULL, '__admin_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('4THzT81IMEWwU4fi', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-15 12:53:40', NULL, NULL, '__trades', '1660964F3FD53', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:39\"}]', '{\"ip\":\"127.0.0.1\"}'),
('4X6ElS2tseC1yyuE', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 12:53:49', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1604.221724524,\"new_value\":1606.8812989921},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1604.221724524,\"new_value\":1606.8812989921}]', '{\"ip\":\"127.0.0.1\"}'),
('50pvcy3hLIoYQPRB', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:19', NULL, '147598F6E40B1', '__notifications', '106756C5ECFA0', NULL, NULL),
('52QoOdEkNz606uRl', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:19', NULL, '147598F6E40B1', '__email_addresses', 'sysadmin@ankelli.com', NULL, NULL),
('57gzPGmJjDeXY2RY', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:53:29', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":179.58659627098,\"new_value\":173.20361754758},{\"field_name\":\"total_balance_asset_value\",\"old_value\":179.58659627098,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('5fnm0S7cxVrOL1bY', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:40', NULL, '1270036862425', '__users', 'raymond', NULL, NULL),
('5m1xf8YArFdzj7sx', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 12:53:14', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1074.62579,\"new_value\":969.36263210526},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1074.62579,\"new_value\":969.36263210526}]', '{\"ip\":\"127.0.0.1\"}'),
('5RljTa6RNiO5vwp8', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:38', NULL, '138205973FC80', '__email_addresses', 'flint@example.com', NULL, NULL),
('5vlGCtaqwcaDfniT', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:52:53', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":500},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":500}]', '{\"ip\":\"127.0.0.1\"}'),
('5zdazse7lYty9Ks5', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'keith', '2022-09-15 12:53:18', NULL, NULL, '__offers', '1582079F20A93', NULL, '{\"ip\":\"127.0.0.1\"}'),
('5zy7Coz38kgVHGEQ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:59', NULL, NULL, '__messages', '156388CBEC86E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('6FFoQyI7qSEkrcKq', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'guddaz', '2022-09-15 12:53:00', NULL, NULL, '__trades', '131916A79CD16', NULL, '{\"ip\":\"127.0.0.1\"}'),
('6GrEcHihyKMTcoIQ', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'peter', '2022-09-15 12:54:29', NULL, NULL, '__trades', '175199B2BBE33', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"peter\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:54:26\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('6PZ4embRhDHZ8Sxf', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:38', NULL, '138205973FC80', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('6SvT5HeyDBMLqY7o', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:16', NULL, NULL, '__messages', '149233471598E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('79ckME4g69HqQ4g6', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:52:47', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":967.86579,\"new_value\":1074.62579},{\"field_name\":\"total_balance_asset_value\",\"old_value\":967.86579,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}'),
('7gthBiOC3UzhQoBL', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-15 12:53:03', NULL, NULL, '__messages', '108043F412D61', NULL, '{\"ip\":\"127.0.0.1\"}'),
('7mr6BscKywdtiEuk', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:29', NULL, NULL, '__messages', '12791032EC55E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('7OujhTe4oS4vdz06', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'peter', '2022-09-15 12:54:24', NULL, NULL, '__offers', '156104B3C1574', NULL, '{\"ip\":\"127.0.0.1\"}'),
('8dEGG85k5wZc1jfa', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 12:54:13', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":482.18610415589,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('8PjB7xZtTEU4Bswq', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-15 12:53:58', NULL, NULL, '__offers', '175323CCD2AD1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('92roQh7HWptFnxUu', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-15 12:54:19', NULL, NULL, '__trades', '14596543F19BE', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:54:19\"}]', '{\"ip\":\"127.0.0.1\"}'),
('9j9rb2pWPb1fZ65N', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'jimmy', '2022-09-15 12:52:52', NULL, NULL, '__asset_accounts', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9pBP2kMtOejpFkcB', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:19', NULL, '147598F6E40B1', '__users', 'sysadmin', NULL, NULL),
('9RLgIQ2To6quGxqE', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-15 12:53:12', NULL, NULL, '__trades', '19948073AED96', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:12\"}]', '{\"ip\":\"127.0.0.1\"}'),
('9SgT67sICQVdadXa', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 12:52:33', NULL, NULL, '__user_group_memberships', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9Tcv01Kg5nZ1BGS4', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:37', NULL, '1382283E715A0', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('9XpU2UG7936RJTNR', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:05', NULL, NULL, '__messages', '131967843085A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('AabjjEpzqTrCuGHC', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'nassim', '2022-09-15 12:54:16', NULL, NULL, '__trades', '137771494E4D1', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:54:13\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('abnKXYuditVCNVfT', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:20', NULL, NULL, '__messages', '17961134BC1D7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('aBrqarmUZ4Lxb4oL', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 12:53:20', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":817.88446861142,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('adSq2aZ77lJTwpD6', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-15 12:53:46', NULL, NULL, '__trades', '107373C946C69', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:46\"}]', '{\"ip\":\"127.0.0.1\"}'),
('AJT1RlqCmQlC5b93', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:52', NULL, NULL, '__messages', '165883D8EC5AB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ALpNp6xRz1SebMs2', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:52:53', NULL, NULL, '__deposit_tokens', '132876B24E252', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:52:52\"}]', '{\"ip\":\"127.0.0.1\"}'),
('Ao5RWpqzfgc7Sv5K', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:46', NULL, NULL, '__messages', '193812505AD07', NULL, '{\"ip\":\"127.0.0.1\"}'),
('aq8Q58TuGNYQsErS', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'ross', '2022-09-15 12:53:31', NULL, NULL, '__seller_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('aQpejO9FDfRFAJpy', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-15 12:52:52', NULL, NULL, '__deposit_tokens', '132876B24E252', NULL, '{\"ip\":\"127.0.0.1\"}'),
('AT0mGZfhmgkrmtLz', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:39', NULL, '10800995D5027', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('AWbctB1zNJDEeIca', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 12:54:29', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1617.132718854,\"new_value\":1619.1915423834},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1617.132718854,\"new_value\":1619.1915423834}]', '{\"ip\":\"127.0.0.1\"}'),
('AwwOzlIwSSNjUv9W', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-15 12:52:34', NULL, NULL, '__admin_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('AyMvDFkVe3Qw8MsJ', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 12:54:09', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1610.351008422,\"new_value\":1612.9825873694},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1610.351008422,\"new_value\":1612.9825873694}]', '{\"ip\":\"127.0.0.1\"}'),
('B5l2pLoW51QiN2Qd', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 12:53:16', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1591.0638297872,\"new_value\":1592.1164613661},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1591.0638297872,\"new_value\":1592.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('B9stH3ABTlmsr2H1', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 12:52:50', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2890,\"new_value\":2290},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2890,\"new_value\":2290}]', '{\"ip\":\"127.0.0.1\"}'),
('bG8UgKbYOhAoAPWR', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:12', NULL, NULL, '__messages', '167514BB80D45', NULL, '{\"ip\":\"127.0.0.1\"}'),
('bhwKg1HoziwPaacu', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 12:52:45', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":400},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":400}]', '{\"ip\":\"127.0.0.1\"}'),
('BjXERrob4hBZCIFq', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 12:54:22', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":349.99445921986,\"new_value\":347.86679964539},{\"field_name\":\"total_balance_asset_value\",\"old_value\":349.99445921986,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('blWb7ppfKa69f2yg', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-15 12:53:05', NULL, NULL, '__messages', '1803913E39C57', NULL, '{\"ip\":\"127.0.0.1\"}'),
('bnk6I1BdMYhQxrm9', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-15 12:53:00', NULL, NULL, '__messages', '1891403506143', NULL, '{\"ip\":\"127.0.0.1\"}'),
('BoaS8nAlyFL4HZ60', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 12:53:22', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":600,\"new_value\":748.93617021277},{\"field_name\":\"total_balance_asset_value\",\"old_value\":600,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('bSqrqN5rojkJ9SZR', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-15 12:52:22', NULL, NULL, '__seller_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('BWGQ9dxdH9ks6vYQ', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:21', NULL, '1023525EFAC38', '__notifications', '106119375DD44', NULL, NULL),
('BxMPsfMy78kpxvcV', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 12:53:48', NULL, NULL, '__asset_accounts', '11', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":265.95744680851},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":265.95744680851}]', '{\"ip\":\"127.0.0.1\"}'),
('CbMA27WuqK3TxW3f', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:37', NULL, '1382283E715A0', '__notifications', '124556ABFC6DA', NULL, NULL),
('cEVITK1xUpCFsFDg', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:25', NULL, NULL, '__messages', '157341001D976', NULL, '{\"ip\":\"127.0.0.1\"}'),
('cLt1Q5UiNmpodRV2', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 12:52:34', NULL, NULL, '__user_group_memberships', '12', NULL, '{\"ip\":\"127.0.0.1\"}'),
('cQ8wLAmu8XsH7HFN', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:53:25', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":817.88446861141,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('d1xthpEhatfE9iTQ', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 12:54:27', NULL, NULL, '__asset_accounts', '11', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":265.95744680851,\"new_value\":471.83979974969},{\"field_name\":\"total_balance_asset_value\",\"old_value\":265.95744680851,\"new_value\":471.83979974969}]', '{\"ip\":\"127.0.0.1\"}'),
('d9pYQ8l3yGFNYh17', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 12:52:21', NULL, NULL, '__user_group_memberships', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('DfVyfZC6aTJ8xJF6', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-15 12:52:32', NULL, NULL, '__admin_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('DN99HQpWII5t5QSh', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:12', NULL, NULL, '__messages', '17080034147BF', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dpnV9r5ecqJovu8L', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-15 12:54:25', NULL, NULL, '__trades', '175199B2BBE33', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:54:25\"}]', '{\"ip\":\"127.0.0.1\"}'),
('DsGjEYBD4o8QSM1x', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:12', NULL, NULL, '__messages', '1511161A70CB2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('DT6lh6FcD1Rim97F', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-15 12:52:48', NULL, NULL, '__deposit_tokens', '17618828366A7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dWAeGfS8APMbMbiK', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 12:53:36', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":3.61702127659,\"new_value\":1.4893617021219},{\"field_name\":\"total_balance_asset_value\",\"old_value\":3.61702127659,\"new_value\":1.4893617021219}]', '{\"ip\":\"127.0.0.1\"}'),
('DWz4fKvtAs1YLtNn', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'nassim', '2022-09-15 12:52:56', NULL, NULL, '__asset_accounts', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('e5bH5FZfPBOp6AC8', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-15 12:53:18', NULL, NULL, '__buyer_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('e93DRtYMg2fgciW9', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:21', NULL, '1023525EFAC38', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('ec2jFHDzTJ2QxtgG', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:20', NULL, '120733E67795E', '__email_addresses', 'reserves@ankelli.com', NULL, NULL),
('eeGQ8JDlvqgpyish', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:16', NULL, NULL, '__messages', '121436A1A8C6C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Efj3edOoFQoelS6z', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-15 12:53:53', NULL, NULL, '__trades', '17686029289C2', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:53\"}]', '{\"ip\":\"127.0.0.1\"}'),
('EFnlLCJgwVEvR3uL', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 12:52:46', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":218.87587867,\"new_value\":317.77707867},{\"field_name\":\"total_balance_asset_value\",\"old_value\":218.87587867,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('ElsA1p1kaFkUWWSL', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-15 12:53:24', NULL, NULL, '__buyer_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('EN6hiG3YAcbJXq0s', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:19', NULL, NULL, '__messages', '160309EC9DDA1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('EsqacwQQSnDU1gqx', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'ross', '2022-09-15 12:52:58', NULL, NULL, '__offers', '14908507EAA32', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ewvh42IwXZr6cTd5', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 12:53:48', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":536.30459126541,\"new_value\":270.3471444569},{\"field_name\":\"total_balance_asset_value\",\"old_value\":536.30459126541,\"new_value\":270.3471444569}]', '{\"ip\":\"127.0.0.1\"}'),
('f985GkvEBkKUypKZ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:33', NULL, NULL, '__messages', '12288229A06C5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fcAAx0qGwnhU06b5', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:32', NULL, '1281993A319D1', '__notifications', '198728AF2655B', NULL, NULL),
('FdPNIjXC59YnSSOr', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:32', NULL, NULL, '__messages', '1493603A9B3B3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('FfCt5auwEhPEEAlI', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-15 12:54:17', NULL, NULL, '__offers', '1921862ABF61F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fKKSzZgraNWrN7Ju', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 12:52:48', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":3000,\"new_value\":2890},{\"field_name\":\"total_balance_asset_value\",\"old_value\":3000,\"new_value\":2890}]', '{\"ip\":\"127.0.0.1\"}'),
('fNhAbjGFRJebR3nM', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:33', NULL, '1386543DF287A', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('fNHwRc1YZpLZ3SEt', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'ross', '2022-09-15 12:53:31', NULL, NULL, '__buyer_extensions', 'clarence', NULL, '{\"ip\":\"127.0.0.1\"}'),
('For43jgarB40SvBi', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:54:01', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1138.2978723404,\"new_value\":954.08734602461},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1138.2978723404,\"new_value\":954.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('fPuhNWCNg8BFoH63', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 12:54:14', NULL, NULL, '__asset_accounts', '9', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":100,\"new_value\":302.24719101124},{\"field_name\":\"total_balance_asset_value\",\"old_value\":100,\"new_value\":302.24719101124}]', '{\"ip\":\"127.0.0.1\"}'),
('FVcn2Qh0GwVSvCgC', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'clarence', '2022-09-15 12:52:54', NULL, NULL, '__asset_accounts', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fXil5b1Ewkc4UjBA', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-15 12:53:59', NULL, NULL, '__trades', '1163470D8807E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('g1X7G25JhHCoab0u', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 12:52:34', NULL, NULL, '__user_group_memberships', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('G2ysZnwOIErR2wDc', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 12:54:08', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":689.08734602461},{\"field_name\":\"total_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":689.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('G36FWCoFZ7jGaqLl', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 12:53:05', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":210.33027015936,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('g5kJQlDQSrDuBmEK', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-15 12:54:09', NULL, NULL, '__trades', '1847854EF21F9', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:54:06\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('GAzuJAHFuUEOHxfu', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'flint', '2022-09-15 12:54:19', NULL, NULL, '__trades', '14596543F19BE', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GBn4sHgBWmkTwlQC', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:40', NULL, NULL, '__messages', '1037647DFC92F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GCcBxBaGHAG2UkPt', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:36', NULL, '18436927BF238', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('GoKqku8L6bxenXL4', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:26', NULL, NULL, '__messages', '1815001574E11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('gpkSelqOvVSgy2OX', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-15 12:52:20', NULL, NULL, '__buyer_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('gUKgZstfmkXtZYVE', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:19', NULL, NULL, '__messages', '10141839D1F51', NULL, '{\"ip\":\"127.0.0.1\"}'),
('gUl3Y2hyjlX11hEP', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-15 12:52:50', NULL, NULL, '__deposit_tokens', '177738C540D3F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('gYIy1XNyfCaJnei4', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:09', NULL, NULL, '__messages', '114378CE1E5A8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('H0EWOJvdx2Ba77pJ', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:33', NULL, '1386543DF287A', '__email_addresses', 'lodza@example.com', NULL, NULL),
('H556jSWaBDZfvVKV', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 12:53:08', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1590,\"new_value\":1591.0638297872},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1590,\"new_value\":1591.0638297872}]', '{\"ip\":\"127.0.0.1\"}'),
('HEq2WpuyjOMXEWXg', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:26', NULL, NULL, '__messages', '1690344A00AD3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hfwjf8pAyxzJPdMd', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:53:26', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":173.20361754758,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('hI4ZMMO5vSBXA8Lj', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:36', NULL, '17012665A0CCA', '__users', 'keith', NULL, NULL),
('hJNhvMEXS3eRaGBI', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-15 12:53:11', NULL, NULL, '__buyer_extensions', 'raymond', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HK0yMcBbCdrBosxG', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'flint', '2022-09-15 12:52:45', NULL, NULL, '__asset_accounts', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HM4QY5yNR9ZK3hX1', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'ross', '2022-09-15 12:52:49', NULL, NULL, '__asset_accounts', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HNUNIcSsZ7II5rv4', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-15 12:53:19', NULL, NULL, '__trades', '183787710F538', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hOaGZ3HsGgDZOKgI', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 12:53:23', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":819.37383031354,\"new_value\":817.88446861141},{\"field_name\":\"total_balance_asset_value\",\"old_value\":819.37383031354,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('HPgl7rBCjLFfkchM', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'peter', '2022-09-15 12:53:48', NULL, NULL, '__asset_accounts', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hpTq2ekucEMJ3Jx8', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:53:41', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":748.93617021277,\"new_value\":538.4098544233},{\"field_name\":\"total_balance_asset_value\",\"old_value\":748.93617021277,\"new_value\":538.4098544233}]', '{\"ip\":\"127.0.0.1\"}'),
('HShYX4OeqzSE8Wk4', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 12:53:53', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":103.29954915548,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('hUiPSDtZ5tgVmX16', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:38', NULL, '138205973FC80', '__users', 'flint', NULL, NULL),
('HxxFc7cnlnajFZtl', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 12:52:51', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":600},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":600}]', '{\"ip\":\"127.0.0.1\"}'),
('I0PHXGgxzV0pg7AU', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'flint', '2022-09-15 12:54:17', NULL, NULL, '__buyer_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('iBJ7f9KViTKXTjE1', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'clarence', '2022-09-15 12:53:36', NULL, NULL, '__trades', '15288346C745B', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:33\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('idf7JHrp8O44kqBD', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 12:52:56', NULL, NULL, '__asset_accounts', '9', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":100},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('iEA6ApM6nO4vqwKd', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:36', NULL, '17012665A0CCA', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('IESqkoFByzxt3ko7', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 12:53:13', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":968.31000052632,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}'),
('IT3PE3CHRddSrfOH', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-15 12:53:51', NULL, NULL, '__buyer_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('j2ixwXsPi0AjlqWT', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 12:53:51', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":103.29954915548}]', '{\"ip\":\"127.0.0.1\"}'),
('J4tnqTw91RVIK18E', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-15 12:53:12', NULL, NULL, '__trades', '19948073AED96', NULL, '{\"ip\":\"127.0.0.1\"}'),
('J4xOkSXPWIynU2sd', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 12:54:21', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":210.33027015937,\"new_value\":423.09622760618},{\"field_name\":\"total_balance_asset_value\",\"old_value\":210.33027015937,\"new_value\":423.09622760618}]', '{\"ip\":\"127.0.0.1\"}'),
('J70fyyzch5gk4saP', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 12:53:07', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":317.77707867,\"new_value\":211.3940999466},{\"field_name\":\"total_balance_asset_value\",\"old_value\":317.77707867,\"new_value\":211.3940999466}]', '{\"ip\":\"127.0.0.1\"}'),
('J9C2LYG6PzWMQ3js', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:53:28', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":817.88446861141,\"new_value\":179.58659627098},{\"field_name\":\"total_balance_asset_value\",\"old_value\":817.88446861141,\"new_value\":179.58659627098}]', '{\"ip\":\"127.0.0.1\"}'),
('jH0ztYMrdUpuaIEH', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:54:00', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('JHjQJRLofM7GNJcm', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:34', NULL, '1386543DF287A', '__notifications', '139341A5A891A', NULL, NULL),
('jKlXgqYR0XQsr78r', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 12:54:27', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":347.86679964539,\"new_value\":141.98444670421},{\"field_name\":\"total_balance_asset_value\",\"old_value\":347.86679964539,\"new_value\":141.98444670421}]', '{\"ip\":\"127.0.0.1\"}'),
('JNqwH8LvkJpGtWmE', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-15 12:53:53', NULL, NULL, '__trades', '17686029289C2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Jse1hQaDIuCiFqJx', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 12:54:08', NULL, NULL, '__asset_accounts', '10', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":105.26315789474,\"new_value\":368.42105263158},{\"field_name\":\"total_balance_asset_value\",\"old_value\":105.26315789474,\"new_value\":368.42105263158}]', '{\"ip\":\"127.0.0.1\"}'),
('JV8ZOU0bGtL0BZxK', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 12:53:55', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":400,\"new_value\":562.76041666667},{\"field_name\":\"total_balance_asset_value\",\"old_value\":400,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('jXD6Y3N7XX4asAnt', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'nassim', '2022-09-15 12:52:57', NULL, NULL, '__deposit_tokens', '163554057E0FC', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:52:56\"}]', '{\"ip\":\"127.0.0.1\"}'),
('jz5SXeHY0hNEgvFp', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:22', NULL, NULL, '__messages', '1673626C15832', NULL, '{\"ip\":\"127.0.0.1\"}'),
('K2BQcFvCCdUBI9Ux', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 12:53:49', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":270.3471444569,\"new_value\":267.68756998881},{\"field_name\":\"total_balance_asset_value\",\"old_value\":270.3471444569,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('k2QvlXKIVBaWnFfG', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:54:11', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('K4oSwTOi6Lpt2Lch', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-15 12:53:04', NULL, NULL, '__messages', '1072898D4BF2C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('K5Tf2PZ1vSLZ2u6I', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:53:40', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":536.3045912654,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('kEU8G0AVALpHDLbv', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:31', NULL, '1281993A319D1', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}');
INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('kFo5VNV9QnpMwWYa', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:54:03', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1608.5089031588,\"new_value\":1610.351008422},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1608.5089031588,\"new_value\":1610.351008422}]', '{\"ip\":\"127.0.0.1\"}'),
('km5qEQCW5rysCAH0', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:20', NULL, '120733E67795E', '__notifications', '129892047A7E2', NULL, NULL),
('kQ4Oxdi7yvOS68xm', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-15 12:52:20', NULL, NULL, '__seller_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('KqHH3jcBDCd58A2Q', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'flint', '2022-09-15 12:54:17', NULL, NULL, '__seller_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('krmh47HVp3S3Tx0x', 'FACTORY_SESSION', 'Addition of _RegToken entry to database.', 'entry_create', 'system', '2022-09-15 12:52:22', NULL, NULL, '__reg_tokens', '1234567890', NULL, '{\"ip\":\"127.0.0.1\"}'),
('KTweLWwaBUqRPA5j', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:53:11', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1074.62579,\"new_value\":968.31000052632}]', '{\"ip\":\"127.0.0.1\"}'),
('KuUh3xmNdCtyh9cN', 'TEST_SESSION', 'Temporarily disabling for test users.', 'entry_update', 'system', '2022-09-15 12:52:31', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for test users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('KUXkCGd7T4UFdxGk', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:26', NULL, NULL, '__messages', '115796A81FC5E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('kVGJOHzYlRT5x8P1', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 12:52:42', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":218.87587867},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":218.87587867}]', '{\"ip\":\"127.0.0.1\"}'),
('L8eWSMlHobkBtiog', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 12:53:16', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":969.36263210526,\"new_value\":968.31000052631},{\"field_name\":\"total_balance_asset_value\",\"old_value\":969.36263210526,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('laUiJYqAZgu87iac', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:40', NULL, '1270036862425', '__notifications', '1998002C9AB80', NULL, NULL),
('LEEpc8XxfAde9n0R', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:21', NULL, '1023525EFAC38', '__email_addresses', 'busadmin@ankelli.com', NULL, NULL),
('lGPjELg7TOExW4S6', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:14', NULL, '12970759892B1', '__email_addresses', 'developer.ankelli@gmail.com', NULL, NULL),
('LlpT823b3FtB92VL', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'keith', '2022-09-15 12:52:50', NULL, NULL, '__asset_accounts', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('lOzPC7EgLmvpaHst', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-15 12:52:56', NULL, NULL, '__deposit_tokens', '163554057E0FC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('lQ9jM2EIoklvjDIz', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-15 12:52:21', NULL, NULL, '__seller_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('lqHJIDBZlpq9o57U', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'peter', '2022-09-15 12:53:44', NULL, NULL, '__offers', '1678789397180', NULL, '{\"ip\":\"127.0.0.1\"}'),
('lrVxq0qOgc9svgm5', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:32', NULL, '1281993A319D1', '__users', 'guddaz', NULL, NULL),
('lssPblSpSv1IQLfQ', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-15 12:53:43', NULL, NULL, '__trades', '1660964F3FD53', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:40\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('lxAdEbEU0ifY39xm', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:54:00', NULL, NULL, '__trades', '1163470D8807E', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:59\"}]', '{\"ip\":\"127.0.0.1\"}'),
('LxJ9NQbhf10FtwYD', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:37', NULL, '17012665A0CCA', '__email_addresses', 'keith@example.com', NULL, NULL),
('MA8sV7nSsi2uRJOf', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:20', NULL, '120733E67795E', '__users', 'reserves', NULL, NULL),
('MAVQdExmIglpOe7E', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:54:03', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":954.08734602461,\"new_value\":952.24524076145},{\"field_name\":\"total_balance_asset_value\",\"old_value\":954.08734602461,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('mDXEW3hg9NjiMIXi', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 12:52:56', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1690,\"new_value\":1590},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1690,\"new_value\":1590}]', '{\"ip\":\"127.0.0.1\"}'),
('mfQsSk8XJX9yNLnA', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:09', NULL, NULL, '__messages', '156063B33FE57', NULL, '{\"ip\":\"127.0.0.1\"}'),
('mJSrT2GcZQnLMui0', 'FACTORY_SESSION', 'Addition of _Asset entry to database.', 'entry_create', 'system', '2022-09-15 12:52:02', NULL, NULL, '__assets', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('MKTI73ptUQZPfoVU', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:52:52', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2290,\"new_value\":1790},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2290,\"new_value\":1790}]', '{\"ip\":\"127.0.0.1\"}'),
('mLzKx0PallKBUlEN', 'FACTORY_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'system', '2022-09-15 12:52:20', NULL, NULL, '__asset_accounts', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('mvEN88fxtPc7ksRw', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-15 12:53:33', NULL, NULL, '__trades', '15288346C745B', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:32\"}]', '{\"ip\":\"127.0.0.1\"}'),
('n1MRgMIQ4gdaGC3H', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 12:52:49', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":110},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":110}]', '{\"ip\":\"127.0.0.1\"}'),
('n4Mac6i6inSHs038', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-15 12:53:26', NULL, NULL, '__trades', '1887449E651CE', NULL, '{\"ip\":\"127.0.0.1\"}'),
('n56oQqiB49BXCRaf', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:20', NULL, NULL, '__messages', '146025B0442C4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('n8iWasmrBLihNaWz', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 12:54:26', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":139.9256231748,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('NCDTobn0WoKMXPi1', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:36', NULL, '18436927BF238', '__email_addresses', 'jimmy@example.com', NULL, NULL),
('ndV6xdT4GMHcfZhE', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-15 12:54:06', NULL, NULL, '__trades', '1847854EF21F9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('nifOKTbTiQSutbbk', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:19', NULL, NULL, '__messages', '11874240EB360', NULL, '{\"ip\":\"127.0.0.1\"}'),
('NJImsNGohpGVDJbs', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:14', NULL, '12970759892B1', '__users', 'developer', NULL, NULL),
('NOlO5Vx1sDYZwGCI', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 12:53:35', NULL, NULL, '__asset_accounts', '8', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":100,\"new_value\":312.76595744681},{\"field_name\":\"total_balance_asset_value\",\"old_value\":100,\"new_value\":312.76595744681}]', '{\"ip\":\"127.0.0.1\"}'),
('Noxz8EVdCrTtzQrY', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-15 12:53:20', NULL, NULL, '__trades', '183787710F538', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:19\"}]', '{\"ip\":\"127.0.0.1\"}'),
('nRMqt4t7OhTCJkFp', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:26', NULL, NULL, '__messages', '182911B721625', NULL, '{\"ip\":\"127.0.0.1\"}'),
('nTFDAsZN4fFjQGMn', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-15 12:53:15', NULL, NULL, '__asset_accounts', '10', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":105.26315789474},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":105.26315789474}]', '{\"ip\":\"127.0.0.1\"}'),
('NWFKBdn84Pc0aMDu', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 12:53:45', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":536.30459126541,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('NzFUGmTLmQgsJmyX', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 12:52:21', NULL, NULL, '__user_group_memberships', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Oa15CfGsTulYxCeg', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-15 12:52:21', NULL, NULL, '__buyer_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('oCqsvwGXm3gKXW7l', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-15 12:53:09', NULL, NULL, '__trades', '131916A79CD16', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:05\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('OeD6HJkls2WwSky6', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'reserves', '2022-09-15 12:52:41', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":3000},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":3000}]', '{\"ip\":\"127.0.0.1\"}'),
('ofWSJKSBBz2wP2Qy', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 12:54:16', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1612.9825873694,\"new_value\":1615.0050592795},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1612.9825873694,\"new_value\":1615.0050592795}]', '{\"ip\":\"127.0.0.1\"}'),
('oO5PdqXktBHBwf7b', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:39', NULL, '10800995D5027', '__email_addresses', 'clarence@example.com', NULL, NULL),
('oQUnDaoH7lq8TCqu', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:13', NULL, NULL, '__messages', '1488796244BED', NULL, '{\"ip\":\"127.0.0.1\"}'),
('os0TLOSqO1QRK9Lf', 'FACTORY_SESSION', 'Resetting to default value.', 'entry_update', 'system', '2022-09-15 12:52:22', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Resetting to default value.\"},{\"field_name\":\"value\",\"old_value\":\"0\",\"new_value\":true}]', '{\"ip\":\"127.0.0.1\"}'),
('OVdYJVEJSruSCFSl', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:35', NULL, '16167428FCAF6', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('oYoO61g3P8tuw8vj', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:35', NULL, '16167428FCAF6', '__users', 'ross', NULL, NULL),
('oZGXbNSmjZwL9oSD', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'guddaz', '2022-09-15 12:52:42', NULL, NULL, '__asset_accounts', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('P5Go1YB7jWw1rykt', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:54:04', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('p9ph7Pu8JULfVab6', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:39', NULL, '10800995D5027', '__notifications', '162775634DC63', NULL, NULL),
('PEFp5eR3lNxfFwnd', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'nassim', '2022-09-15 12:54:11', NULL, NULL, '__offers', '12088209FC7AB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('pJ9WeO2Se73xjyod', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-15 12:53:10', NULL, NULL, '__offers', '111500C7B0DC8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Pkm6J47hpVCWUKbo', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:53:43', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":538.4098544233,\"new_value\":536.30459126541},{\"field_name\":\"total_balance_asset_value\",\"old_value\":538.4098544233,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('PnkmibHqFD4oWKfv', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 12:53:56', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":104.92715332214,\"new_value\":103.29954915547},{\"field_name\":\"total_balance_asset_value\",\"old_value\":104.92715332214,\"new_value\":103.29954915547}]', '{\"ip\":\"127.0.0.1\"}'),
('pQfOhG9jfO1EDG51', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-15 12:53:37', NULL, NULL, '__offers', '184168FF1E957', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Pt4dvSHdBjzIPtOg', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:37', NULL, '1382283E715A0', '__users', 'peter', NULL, NULL),
('PuX5xCUylCUshkYF', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 12:54:18', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":562.76041666667,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('pw0GAHx5b2AACqJj', 'TEST_SESSION', 'Resetting to default value.', 'entry_update', 'peter', '2022-09-15 12:54:30', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Resetting to default value.\"},{\"field_name\":\"value\",\"old_value\":\"0\",\"new_value\":true}]', '{\"ip\":\"127.0.0.1\"}'),
('pyj3vlM8xSwGQgbu', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 12:52:19', NULL, NULL, '__user_group_memberships', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('pZMByGmQM7i66DO6', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:52:43', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":967.86579},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":967.86579}]', '{\"ip\":\"127.0.0.1\"}'),
('Q2ogKkoraf6E18jr', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 12:54:22', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1615.0050592795,\"new_value\":1617.132718854},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1615.0050592795,\"new_value\":1617.132718854}]', '{\"ip\":\"127.0.0.1\"}'),
('q6fka6Cf7wzHZyXm', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:54:06', NULL, NULL, '__trades', '1847854EF21F9', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:54:06\"}]', '{\"ip\":\"127.0.0.1\"}'),
('qbvUCvTkJDYtpJXO', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-15 12:53:47', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('qDW9juhBert6kHTU', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:39', NULL, NULL, '__messages', '112334200146D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('QGGOvHDWnuWMtdqI', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 12:54:15', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":484.208576066,\"new_value\":482.18610415589},{\"field_name\":\"total_balance_asset_value\",\"old_value\":484.208576066,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('Qi7o17UVL8tWhGsz', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:19', NULL, '147598F6E40B1', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('QpFbd2uohvLdGZLm', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:46', NULL, NULL, '__messages', '1079966A6E593', NULL, '{\"ip\":\"127.0.0.1\"}'),
('QsYXHS6WQWH4W1VE', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:25', NULL, NULL, '__messages', '17243975B3F5C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qTS1rAJhGcG0fhqo', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:37', NULL, '1382283E715A0', '__email_addresses', 'peter@example.com', NULL, NULL),
('QYAzVZOt02cHeCgA', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:43', NULL, NULL, '__messages', '104699A1ABAC9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('r46uZ5EmUdTy1t6y', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-15 12:52:54', NULL, NULL, '__deposit_tokens', '186548AC1B95D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('rDkXwMKW9sjcHzFv', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:14', NULL, '12970759892B1', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('RemIc9zQTHds7HjA', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 12:53:56', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1606.8812989921,\"new_value\":1608.5089031588},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1606.8812989921,\"new_value\":1608.5089031588}]', '{\"ip\":\"127.0.0.1\"}'),
('RIyZT8zxz5R16g2j', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 12:53:38', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":748.93617021277,\"new_value\":536.3045912654}]', '{\"ip\":\"127.0.0.1\"}'),
('rk86P5oBcJBizFJn', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:01', NULL, NULL, '__messages', '1738557133E69', NULL, '{\"ip\":\"127.0.0.1\"}'),
('RL93Orah1ul9NOaz', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:12', NULL, NULL, '__messages', '170171B8FEE6D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('rlqoMrATu77vCAbC', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:38', NULL, '138205973FC80', '__notifications', '1862761C00CEC', NULL, NULL),
('RNbr1304ylUEPMdU', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'lodza', '2022-09-15 12:52:43', NULL, NULL, '__asset_accounts', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('rsC3wiuOj0OM0X64', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-15 12:53:44', NULL, NULL, '__buyer_extensions', 'peter', NULL, '{\"ip\":\"127.0.0.1\"}'),
('RvKSNV2JKrRVCaiN', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-15 12:54:11', NULL, NULL, '__buyer_extensions', 'nassim', NULL, '{\"ip\":\"127.0.0.1\"}'),
('SCZMODTqXaoyZHEx', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:14', NULL, '12970759892B1', '__notifications', '1180182A564C4', NULL, NULL),
('Sen7BMB47srHTVCN', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:13', NULL, NULL, '__messages', '1468164D76EF5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('sFSehjc8P4bk9w5H', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 12:53:33', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1.4893617021234,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('sg8Ei3Ecd54ZPzJ7', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:36', NULL, '18436927BF238', '__users', 'jimmy', NULL, NULL),
('sHsqr17dq8dnukG2', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'guddaz', '2022-09-15 12:54:23', NULL, NULL, '__trades', '14596543F19BE', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"guddaz\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:54:19\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('SiC3cEqDsaiQA2HI', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:53:41', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":173.20361754758,\"new_value\":383.72993333705},{\"field_name\":\"total_balance_asset_value\",\"old_value\":173.20361754758,\"new_value\":383.72993333705}]', '{\"ip\":\"127.0.0.1\"}'),
('SirVwv9qZeyDzakf', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 12:52:54', NULL, NULL, '__asset_accounts', '8', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":100},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('SKgWhR5rTtGGTAtJ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:06', NULL, NULL, '__messages', '1717320F9BE9F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('sMljIc9NED0HC6Xj', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 12:53:36', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1599.9888017916,\"new_value\":1602.1164613661},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1599.9888017916,\"new_value\":1602.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('spF923HVn50LZDHf', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:35', NULL, '16167428FCAF6', '__notifications', '101872AAA1415', NULL, NULL),
('sQiPaqnV4rpOuBTa', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:59', NULL, NULL, '__messages', '139016AC9F86F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('SxyQg4LWaqMwQBNT', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-15 12:52:22', NULL, NULL, '__buyer_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('t0O6LuLWT51v8RSj', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:46', NULL, NULL, '__messages', '18797451CFA93', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TDOPMWWlS2Bho3Nh', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 12:52:22', NULL, NULL, '__user_group_memberships', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TFR4hj5yKqcdQBzO', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:39', NULL, '10800995D5027', '__users', 'clarence', NULL, NULL),
('tGIvX5j7MVIo8cgR', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:53:58', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1138.2978723404,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('tizKFyKuQPLCkVpg', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'raymond', '2022-09-15 12:53:14', NULL, NULL, '__asset_accounts', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('tn7J0XQIqHSnkm71', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-15 12:53:46', NULL, NULL, '__trades', '107373C946C69', NULL, '{\"ip\":\"127.0.0.1\"}'),
('tNKZioc2WYoSVb0G', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:37', NULL, '17012665A0CCA', '__notifications', '1616945187E43', NULL, NULL),
('TOPAgy0fJAkyQbcw', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-15 12:52:20', NULL, NULL, '__admin_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('tRUZ4fZdscAvcQiA', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 12:52:19', NULL, NULL, '__user_group_memberships', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('tWGSH5aizi1nFgHa', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:33', NULL, '1386543DF287A', '__users', 'lodza', NULL, NULL),
('u244lq702YTe1rrA', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-15 12:53:10', NULL, NULL, '__offers', '119609680ECA6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('u2NLJ3DCHophKaEk', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-15 12:54:14', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":484.208576066},{\"field_name\":\"total_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":484.208576066}]', '{\"ip\":\"127.0.0.1\"}'),
('u9RXaDAxnVQFNENc', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-15 12:53:43', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1602.1164613661,\"new_value\":1604.221724524},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1602.1164613661,\"new_value\":1604.221724524}]', '{\"ip\":\"127.0.0.1\"}'),
('uHJu0XBQiJPQl9jy', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:19', NULL, NULL, '__messages', '142227D8DDBFE', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UM7WTp79FYC88Zxo', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-15 12:54:12', NULL, NULL, '__trades', '137771494E4D1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UmohgrEp7hUetkjF', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 12:53:31', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":216.3829787234,\"new_value\":1.4893617021234}]', '{\"ip\":\"127.0.0.1\"}'),
('uYM1aAVhXFXOQ5UO', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-15 12:52:58', NULL, NULL, '__seller_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('V6sAzVWhEji7nTqk', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'clarence', '2022-09-15 12:53:31', NULL, NULL, '__offers', '1383837EA16F3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('vczBRxYs2aZS6IVI', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:33', NULL, NULL, '__messages', '15563301AE62F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('vIxbuNOZvJq9kTeE', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'flint', '2022-09-15 12:53:51', NULL, NULL, '__offers', '163303C665BB8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('vOpNuE84yBfX2DN5', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'jimmy', '2022-09-15 12:53:24', NULL, NULL, '__offers', '159086AEC7F01', NULL, '{\"ip\":\"127.0.0.1\"}'),
('VuCCHej4zzPSldWd', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:40', NULL, '1360375AFD653', '__users', 'nassim', NULL, NULL),
('vxvcVSccwPEPj5NO', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:54:12', NULL, NULL, '__trades', '137771494E4D1', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:54:12\"}]', '{\"ip\":\"127.0.0.1\"}'),
('vySYQI2sLrkENL0b', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:20', NULL, '120733E67795E', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('vyY0GjJwjFj2maKp', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:00', NULL, NULL, '__messages', '126990B9A0214', NULL, '{\"ip\":\"127.0.0.1\"}'),
('W9di2gYgjhyIpECW', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:35', NULL, '16167428FCAF6', '__email_addresses', 'ross@example.com', NULL, NULL),
('wb2X2kqaUzamPs0C', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:03', NULL, NULL, '__messages', '135580D0A3E89', NULL, '{\"ip\":\"127.0.0.1\"}'),
('WCF4XiNw9nf43bgq', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:39', NULL, NULL, '__messages', '1358482D4B89E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('wEcYjl6ewANjeiLb', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'lodza', '2022-09-15 12:53:10', NULL, NULL, '__seller_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('whzgkhx2nb4Q6758', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-15 12:53:08', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":211.3940999466,\"new_value\":210.33027015937},{\"field_name\":\"total_balance_asset_value\",\"old_value\":211.3940999466,\"new_value\":210.33027015937}]', '{\"ip\":\"127.0.0.1\"}'),
('wikUmtMIHH9w148v', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-15 12:54:24', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":347.86679964539,\"new_value\":139.9256231748}]', '{\"ip\":\"127.0.0.1\"}'),
('WQY1YZdFrlK05Xvm', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-15 12:52:39', NULL, '1270036862425', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('WRstEOsHIY6HIOX5', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-15 12:52:19', NULL, NULL, '__admin_extensions', 'developer', NULL, '{\"ip\":\"127.0.0.1\"}'),
('x2CrAU5igo90gO4V', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-15 12:53:34', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":216.3829787234,\"new_value\":3.61702127659},{\"field_name\":\"total_balance_asset_value\",\"old_value\":216.3829787234,\"new_value\":3.61702127659}]', '{\"ip\":\"127.0.0.1\"}'),
('X35hGQ02psQPoMAv', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-15 12:53:29', NULL, NULL, '__trades', '1887449E651CE', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:26\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('XESFbSRP0WBbE016', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:40', NULL, '1270036862425', '__email_addresses', 'raymond@example.com', NULL, NULL),
('xpLRhxJMwF9hTtAh', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:00', NULL, NULL, '__messages', '103070F27DB06', NULL, '{\"ip\":\"127.0.0.1\"}'),
('xRZhROvgw1SnmVDi', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-15 12:53:58', NULL, NULL, '__seller_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('xuLoS3IkcJjMbCp6', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'flint', '2022-09-15 12:54:25', NULL, NULL, '__trades', '175199B2BBE33', NULL, '{\"ip\":\"127.0.0.1\"}'),
('xvbLBvs24EteOq4U', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'ross', '2022-09-15 12:53:32', NULL, NULL, '__trades', '15288346C745B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('xYh8RSzCbBgCjkSO', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:53', NULL, NULL, '__messages', '12089349CD6CA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ydHnOmBsKJ3WyqfF', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:06', NULL, NULL, '__messages', '162205ED54F0C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('yez6A8snFN6ZeXb3', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:40', NULL, '1360375AFD653', '__email_addresses', 'nassim@example.com', NULL, NULL),
('yKqPvwirufWN0bjx', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-15 12:53:21', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":968.31000052631,\"new_value\":819.37383031354},{\"field_name\":\"total_balance_asset_value\",\"old_value\":968.31000052631,\"new_value\":819.37383031354}]', '{\"ip\":\"127.0.0.1\"}'),
('YL7hfNkgYKvbtW9w', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:56', NULL, NULL, '__messages', '190451AF81D44', NULL, '{\"ip\":\"127.0.0.1\"}'),
('YMVCO2xTgJorjJ2X', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-15 12:52:32', NULL, '1281993A319D1', '__email_addresses', 'goodhopedhliwayo@gmail.com', NULL, NULL),
('yoAPLWfKX8qhGyHk', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-15 12:52:21', NULL, '1023525EFAC38', '__users', 'busadmin', NULL, NULL),
('yVjwGS6sKyUZz2xg', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 12:54:20', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":347.86679964539,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('ywkYtclNqFcsXEAe', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-15 12:52:41', NULL, '1360375AFD653', '__notifications', '1152298020DEA', NULL, NULL),
('Z62RVXOZcQUPe21M', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-15 12:52:58', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":317.77707867,\"new_value\":210.33027015936}]', '{\"ip\":\"127.0.0.1\"}'),
('Z92fpupq20OC8iq9', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'guddaz', '2022-09-15 12:53:01', NULL, NULL, '__trades', '131916A79CD16', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"guddaz\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:53:01\"}]', '{\"ip\":\"127.0.0.1\"}'),
('zAWLZZLjRIVvg7Bd', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:29', NULL, NULL, '__messages', '1358645539BC4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zD0qnjfab16xteEW', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-15 12:52:22', NULL, NULL, '__user_group_memberships', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ze2QrkuAiqFYqpME', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'ross', '2022-09-15 12:52:49', NULL, NULL, '__deposit_tokens', '17618828366A7', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:52:48\"}]', '{\"ip\":\"127.0.0.1\"}'),
('ZHiT1t3P1DJsiocY', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'keith', '2022-09-15 12:52:51', NULL, NULL, '__deposit_tokens', '177738C540D3F', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:52:50\"}]', '{\"ip\":\"127.0.0.1\"}'),
('ZKaZNdzfJbUooqyd', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-15 12:54:03', NULL, NULL, '__trades', '1163470D8807E', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-15 14:54:00\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('ZLJOl5F6t1VPi9Mr', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-15 12:54:04', NULL, NULL, '__offers', '1635913408868', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ZmHjTgTHLA867X6P', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'keith', '2022-09-15 12:53:38', NULL, NULL, '__seller_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Zq06Ipp3CadA7HAd', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-15 12:52:58', NULL, NULL, '__buyer_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zSmGOUQmKt7YQJv7', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:54:06', NULL, NULL, '__messages', '12294653420A4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zYKWiGfGxp74suXl', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-15 12:53:23', NULL, NULL, '__messages', '163640445E09A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zz88UJUdUTRVaoN8', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-15 12:52:21', NULL, NULL, '__admin_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}');

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
('10141839D1F51', '__trades', '14596543F19BE', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 12:54:19', NULL),
('103070F27DB06', '__trades', '1163470D8807E', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 12:54:00', NULL),
('1037647DFC92F', '__trades', '1660964F3FD53', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 12:53:40', NULL),
('104699A1ABAC9', '__trades', '1660964F3FD53', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 12:53:43', NULL),
('1072898D4BF2C', '__trades', '131916A79CD16', 'I\'ve collected the money.', 'ross', '2022-09-15 12:53:04', NULL),
('1079966A6E593', '__trades', '107373C946C69', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 12:53:46', NULL),
('108043F412D61', '__trades', '131916A79CD16', 'I\'ve sent the cash.\nPlease confirm receiving it.', 'guddaz', '2022-09-15 12:53:02', NULL),
('112334200146D', '__trades', '1660964F3FD53', 'Asset buyer just declared their payment.', 'system', '2022-09-15 12:53:39', NULL),
('114378CE1E5A8', '__trades', '1847854EF21F9', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 12:54:09', NULL),
('115796A81FC5E', '__trades', '1887449E651CE', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 12:53:26', NULL),
('11874240EB360', '__trades', '14596543F19BE', 'Asset buyer just declared their payment.', 'system', '2022-09-15 12:54:19', NULL),
('12089349CD6CA', '__trades', '17686029289C2', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 12:53:53', NULL),
('121436A1A8C6C', '__trades', '137771494E4D1', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 12:54:16', NULL),
('12288229A06C5', '__trades', '15288346C745B', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 12:53:33', NULL),
('12294653420A4', '__trades', '1847854EF21F9', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 12:54:06', NULL),
('126990B9A0214', '__trades', '131916A79CD16', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 12:53:00', NULL),
('12791032EC55E', '__trades', '175199B2BBE33', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 12:54:29', NULL),
('131967843085A', '__trades', '131916A79CD16', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 12:53:05', NULL),
('135580D0A3E89', '__trades', '1163470D8807E', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 12:54:03', NULL),
('1358482D4B89E', '__trades', '1660964F3FD53', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 12:53:39', NULL),
('1358645539BC4', '__trades', '1887449E651CE', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 12:53:29', NULL),
('139016AC9F86F', '__trades', '1163470D8807E', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 12:53:59', NULL),
('142227D8DDBFE', '__trades', '14596543F19BE', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 12:54:19', NULL),
('143883D4D02E1', '__trades', '107373C946C69', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 12:53:49', NULL),
('146025B0442C4', '__trades', '183787710F538', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 12:53:20', NULL),
('1468164D76EF5', '__trades', '137771494E4D1', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 12:54:13', NULL),
('1488796244BED', '__trades', '19948073AED96', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 12:53:13', NULL),
('149233471598E', '__trades', '19948073AED96', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 12:53:16', NULL),
('1493603A9B3B3', '__trades', '15288346C745B', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 12:53:32', NULL),
('1511161A70CB2', '__trades', '19948073AED96', 'Asset buyer just declared their payment.', 'system', '2022-09-15 12:53:12', NULL),
('15563301AE62F', '__trades', '15288346C745B', 'Asset buyer just declared their payment.', 'system', '2022-09-15 12:53:32', NULL),
('156063B33FE57', '__trades', '131916A79CD16', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 12:53:08', NULL),
('156388CBEC86E', '__trades', '1163470D8807E', 'Asset buyer just declared their payment.', 'system', '2022-09-15 12:53:59', NULL),
('157341001D976', '__trades', '175199B2BBE33', 'Asset buyer just declared their payment.', 'system', '2022-09-15 12:54:25', NULL),
('160309EC9DDA1', '__trades', '183787710F538', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 12:53:19', NULL),
('162205ED54F0C', '__trades', '1847854EF21F9', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 12:54:05', NULL),
('163640445E09A', '__trades', '183787710F538', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 12:53:23', NULL),
('165883D8EC5AB', '__trades', '17686029289C2', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 12:53:52', NULL),
('1673626C15832', '__trades', '14596543F19BE', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 12:54:22', NULL),
('167514BB80D45', '__trades', '137771494E4D1', 'Asset buyer just declared their payment.', 'system', '2022-09-15 12:54:12', NULL),
('1690344A00AD3', '__trades', '1887449E651CE', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 12:53:26', NULL),
('170171B8FEE6D', '__trades', '137771494E4D1', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 12:54:12', NULL),
('17080034147BF', '__trades', '19948073AED96', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 12:53:12', NULL),
('1717320F9BE9F', '__trades', '1847854EF21F9', 'Asset buyer just declared their payment.', 'system', '2022-09-15 12:54:06', NULL),
('17243975B3F5C', '__trades', '175199B2BBE33', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-15 12:54:25', NULL),
('1738557133E69', '__trades', '131916A79CD16', 'Asset buyer just declared their payment.', 'system', '2022-09-15 12:53:01', NULL),
('17961134BC1D7', '__trades', '183787710F538', 'Asset buyer just declared their payment.', 'system', '2022-09-15 12:53:19', NULL),
('1800763E05DCC', '__trades', '17686029289C2', 'Asset buyer just declared their payment.', 'system', '2022-09-15 12:53:53', NULL),
('1803913E39C57', '__trades', '131916A79CD16', 'Pleasure doing business with you.', 'ross', '2022-09-15 12:53:05', NULL),
('1815001574E11', '__trades', '175199B2BBE33', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 12:54:26', NULL),
('182911B721625', '__trades', '1887449E651CE', 'Asset buyer just declared their payment.', 'system', '2022-09-15 12:53:26', NULL),
('18797451CFA93', '__trades', '107373C946C69', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-15 12:53:46', NULL),
('1891403506143', '__trades', '131916A79CD16', 'I\'m sending the cash in a couple of minutes.', 'guddaz', '2022-09-15 12:53:00', NULL),
('190451AF81D44', '__trades', '17686029289C2', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 12:53:56', NULL),
('1928412E8E033', '__trades', '15288346C745B', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-15 12:53:36', NULL),
('193812505AD07', '__trades', '107373C946C69', 'Asset buyer just declared their payment.', 'system', '2022-09-15 12:53:46', NULL);

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
('101872AAA1415', 'ross', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:35', NULL),
('106119375DD44', 'busadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:21', NULL),
('106756C5ECFA0', 'sysadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:19', NULL),
('1152298020DEA', 'nassim', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:40', NULL),
('1180182A564C4', 'developer', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:14', NULL),
('124556ABFC6DA', 'peter', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:37', NULL),
('129892047A7E2', 'reserves', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:20', NULL),
('139341A5A891A', 'lodza', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:33', NULL),
('147168E6D5B57', 'jimmy', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:36', NULL),
('1616945187E43', 'keith', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:37', NULL),
('162775634DC63', 'clarence', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:39', NULL),
('1862761C00CEC', 'flint', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:38', NULL),
('198728AF2655B', 'guddaz', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:32', NULL),
('1998002C9AB80', 'raymond', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-15 12:52:40', NULL);

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
('111500C7B0DC8', 'Zimbabwe', 'Norton', 'sell', 'USDT', 'USD', '1.04', NULL, NULL, '50', '200', 'cash_in_person', NULL, NULL, 'online', 'guddaz', '2022-09-15 12:53:10', '2022-09-15 12:53:10', NULL),
('119609680ECA6', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.95', 100, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', NULL, 'online', 'raymond', '2022-09-15 12:53:10', '2022-09-15 12:53:10', NULL),
('12088209FC7AB', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '178', 10000, 40000, NULL, NULL, 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', NULL, 'online', 'nassim', '2022-09-15 12:54:10', '2022-09-15 12:54:10', NULL),
('1383837EA16F3', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'clarence', '2022-09-15 12:53:30', '2022-09-15 12:53:30', NULL),
('14908507EAA32', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'ross', '2022-09-15 12:52:58', '2022-09-15 12:52:58', NULL),
('156104B3C1574', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '170', 20000, 40000, NULL, NULL, 'algerie_poste', '{\"account_holder_name\":\"Timothy Tambo\",\"account_number\":\"22558678\",\"account_key\":\"87\"}', NULL, 'online', 'peter', '2022-09-15 12:54:24', '2022-09-15 12:54:24', NULL),
('1582079F20A93', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', NULL, 'online', 'keith', '2022-09-15 12:53:18', '2022-09-15 12:53:18', NULL),
('159086AEC7F01', 'Zambia', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', NULL, 'online', 'jimmy', '2022-09-15 12:53:24', '2022-09-15 12:53:24', NULL),
('163303C665BB8', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.36', 1500, 2500, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'flint', '2022-09-15 12:53:51', '2022-09-15 12:53:51', NULL),
('1635913408868', 'Italy', NULL, 'buy', 'USDT', 'EUR', '0.76', 200, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', NULL, 'online', 'raymond', '2022-09-15 12:54:04', '2022-09-15 12:54:04', NULL),
('1678789397180', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 200, 300, NULL, NULL, 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', NULL, 'online', 'peter', '2022-09-15 12:53:44', '2022-09-15 12:53:44', NULL),
('175323CCD2AD1', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.2', 700, 3000, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'lodza', '2022-09-15 12:53:57', '2022-09-15 12:53:57', NULL),
('184168FF1E957', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'ZMW', '13.3', 2800, 14000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'lodza', '2022-09-15 12:53:37', '2022-09-15 12:53:37', NULL),
('1921862ABF61F', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '0.94', 100, 200, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'guddaz', '2022-09-15 12:54:17', '2022-09-15 12:54:17', NULL);

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
(1, 'Update system config params', 'update_sysconfig_params', 'Permission holder can update system config params.', 'active', 'system', '2022-09-15 14:51:53', NULL, NULL),
(2, 'Handle feedback reports', 'handle_feedback_reports', 'Permission holder can handle feedback reports.', 'active', 'system', '2022-09-15 14:51:53', NULL, NULL),
(3, 'Manage datalists', 'manage_datalists', 'Permission holder can manage datalists.', 'active', 'system', '2022-09-15 14:51:53', NULL, NULL),
(4, 'Manage system tools', 'manage_systools', 'Permission holder can manage system tools.', 'active', 'system', '2022-09-15 14:51:53', NULL, NULL),
(5, 'View all logs', 'view_all_logs', 'Permission holder can view all logs.', 'active', 'system', '2022-09-15 14:51:53', NULL, NULL),
(6, 'View all transactions', 'view_all_transactions', 'Permission holder can view all transactions.', 'active', 'system', '2022-09-15 14:51:53', NULL, NULL),
(7, 'Manage Deposit Tokens', 'manage_deposit_tokens', 'Permission holder can create and edit deposit tokens.', 'active', 'system', '2022-09-15 14:51:53', NULL, NULL),
(8, 'Handle Withdrawals', 'handle_withdrawals', 'Permission holder can handle withdrawals.', 'active', 'system', '2022-09-15 14:51:53', NULL, NULL),
(9, 'Manage Registration Tokens', 'manage_reg_tokens', 'Permission holder can create and edit registration tokens.', 'active', 'system', '2022-09-15 14:51:53', NULL, NULL),
(10, 'Handle flagged users', 'handle_flagged_users', 'Permission holder can handle flagged Users.', 'active', 'system', '2022-09-15 14:51:53', NULL, NULL),
(11, 'Handle customer service chats', 'handle_customer_service_chats', 'Permission holder can handle customer service chats.', 'active', 'system', '2022-09-15 14:51:53', NULL, NULL),
(12, 'Manage update posts', 'manage_update_posts', 'Permission holder can handle posting and editing update posts.', 'active', 'system', '2022-09-15 14:51:53', NULL, NULL),
(13, 'Handle flagged business elems', 'handle_flagged_business_elems', 'Permission holder can handle flagged business elems (Offers, Trades, etc).', 'active', 'system', '2022-09-15 14:51:53', NULL, NULL);

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
(1, '__user_groups', 'system_administrators', 'update_sysconfig_params', 'active', 'system', '2022-09-15 14:51:53', NULL),
(2, '__user_groups', 'system_administrators', 'handle_feedback_reports', 'active', 'system', '2022-09-15 14:51:53', NULL),
(3, '__user_groups', 'system_administrators', 'manage_systools', 'active', 'system', '2022-09-15 14:51:53', NULL),
(4, '__user_groups', 'system_administrators', 'manage_datalists', 'active', 'system', '2022-09-15 14:51:53', NULL),
(5, '__user_groups', 'system_administrators', 'view_all_logs', 'active', 'system', '2022-09-15 14:51:53', NULL),
(6, '__user_groups', 'business_administrators', 'view_all_transactions', 'active', 'system', '2022-09-15 14:51:53', NULL),
(7, '__user_groups', 'business_administrators', 'manage_deposit_tokens', 'active', 'system', '2022-09-15 14:51:53', NULL),
(8, '__user_groups', 'business_administrators', 'handle_withdrawals', 'active', 'system', '2022-09-15 14:51:53', NULL),
(9, '__user_groups', 'user_administrators', 'manage_reg_tokens', 'active', 'system', '2022-09-15 14:51:53', NULL),
(10, '__user_groups', 'user_administrators', 'handle_flagged_users', 'active', 'system', '2022-09-15 14:51:53', NULL),
(11, '__user_groups', 'platform_moderators', 'handle_customer_service_chats', 'active', 'system', '2022-09-15 14:51:53', NULL),
(12, '__user_groups', 'platform_moderators', 'handle_flagged_business_elems', 'active', 'system', '2022-09-15 14:51:53', NULL),
(13, '__user_groups', 'platform_moderators', 'manage_update_posts', 'active', 'system', '2022-09-15 14:51:53', NULL);

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
(1, '__users', 'system', 'Backend rest api enabled', 'backend_rest_api_enabled', '1', 'boolean', 'system', '2022-09-15 14:51:53', NULL),
(2, '__users', 'system', 'Scaffolding app enabled', 'scaffolding_app_enabled', '1', 'boolean', 'system', '2022-09-15 14:51:53', NULL),
(3, '__users', 'system', 'Fallback Display Language', 'fallback_pref_lang', 'en', 'enum:langs', 'system', '2022-09-15 14:51:53', NULL),
(4, '__users', 'system', 'Fallback Display Theme', 'fallback_pref_theme', 'light', 'enum:themes', 'system', '2022-09-15 14:51:53', NULL),
(5, '__users', 'system', 'Image storage driver', 'image_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-15 14:51:53', NULL),
(6, '__users', 'system', 'Document storage driver', 'document_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-15 14:51:53', NULL),
(7, '__users', 'system', 'Logs database driver', 'logs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-15 14:51:53', NULL),
(8, '__users', 'system', 'Notifications database driver', 'notifs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-15 14:51:53', NULL),
(9, '__users', 'system', 'Chats database driver', 'chats_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-15 14:51:53', NULL),
(10, '__users', 'system', 'Messages database driver', 'msgs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-15 14:51:53', NULL),
(11, '__users', 'system', 'Offers database driver', 'offers_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-15 14:51:53', NULL),
(12, '__users', 'system', 'Trades database driver', 'trades_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-15 14:51:53', NULL),
(13, '__users', 'system', 'Token registration enabled', 'token_reg_enabled', '1', 'boolean', 'system', '2022-09-15 14:51:53', '2022-09-15 12:54:30'),
(14, '__users', 'system', 'Token registration max use count', 'reg_token_max_use_count', '10', 'integer', 'system', '2022-09-15 14:51:53', NULL),
(15, '__users', 'system', 'Open Registration enabled', 'open_reg_enabled', '0', 'boolean', 'system', '2022-09-15 14:51:53', NULL),
(16, '__users', 'system', 'Learn mode available', 'learn_mode_available', '1', 'boolean', 'system', '2022-09-15 14:51:53', NULL),
(17, '__users', 'system', 'Offers to buy enabled', 'offer_to_buy_enabled', '1', 'boolean', 'system', '2022-09-15 14:51:53', NULL),
(18, '__users', 'system', 'Offers to sell enabled', 'offer_to_sell_enabled', '0', 'boolean', 'system', '2022-09-15 14:51:53', NULL),
(19, '__users', 'system', 'Use development crypto asset engine', 'use_dev_crypto_asset_engine', '1', 'boolean', 'system', '2022-09-15 14:51:53', NULL),
(20, '__users', 'system', 'Use tatum crypto asset engine', 'use_tatum_crypto_asset_engine', '0', 'boolean', 'system', '2022-09-15 14:51:53', NULL),
(21, '__users', 'system', 'Value charged by platform on transactions', 'platform_charge_asset_factor', '0.01', 'float', 'system', '2022-09-15 14:51:53', NULL),
(22, '__users', 'system', 'Minimum allowed price per unit currency on offers', 'min_offer_purchase_price', '0.5', 'float', 'system', '2022-09-15 14:51:53', NULL);

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
(1, 'Cash in person', 'cash_in_person', '5e5d4b', '[\"phone_no\"]', NULL, 'active', 'system', '2022-09-15 14:51:54', NULL, NULL),
(2, 'Stanbic bank', 'stanbic_bank', '066ef3', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-15 14:51:54', NULL, NULL),
(3, 'FNB bank', 'fnb_bank', '009eaa', '[\"account_holder_name\",\"account_no\"]', '[\"ZAR\"]', 'active', 'system', '2022-09-15 14:51:54', NULL, NULL),
(4, 'Mukuru', 'mukuru', 'e77924', '[\"fullname\",\"phone_no\"]', '[\"USD\"]', 'active', 'system', '2022-09-15 14:51:54', NULL, NULL),
(5, 'Algérie Poste', 'algerie_poste', '01009a', '[\"account_holder_name\",\"account_holder_address\",\"account_no\",\"account_key\"]', '[\"DZD\"]', 'active', 'system', '2022-09-15 14:51:54', NULL, NULL),
(6, 'MTN Mobile Money', 'mtn_momo', 'feca05', '[\"fullname\",\"phone_no\"]', NULL, 'active', 'system', '2022-09-15 14:51:54', NULL, NULL),
(7, 'Ecocash', 'ecocash', '005ba4', '[\"fullname\",\"phone_no\"]', '[\"ZWL\"]', 'active', 'system', '2022-09-15 14:51:54', NULL, NULL),
(8, 'Paypal', 'paypal', '27346a', '[\"fullname\",\"email_address\"]', '[\"USD\",\"EUR\",\"GBP\"]', 'active', 'system', '2022-09-15 14:51:54', NULL, NULL),
(9, 'Skrill', 'skrill', '862165', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-15 14:51:54', NULL, NULL),
(10, 'World Remit', 'world_remit', '604684', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-15 14:51:54', NULL, NULL),
(11, 'Mastercard', 'mastercard', 'cc0001', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-15 14:51:54', NULL, NULL),
(12, 'Visa', 'visa', '0055a5', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-15 14:51:54', NULL, NULL),
(13, 'FBC Bank', 'fbc_bank', '0055a5', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-15 14:51:54', NULL, NULL);

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
('1234567890', 'usable', 'system', '2022-09-15 12:52:22');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-15 12:52:20', '2022-09-15 12:52:20', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-15 12:52:21', '2022-09-15 12:52:21', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-15 12:52:22', '2022-09-15 12:52:22', NULL),
(4, 'guddaz', 'active', 'guddaz', '2022-09-15 12:52:58', '2022-09-15 12:52:58', NULL),
(5, 'lodza', 'active', 'lodza', '2022-09-15 12:53:10', '2022-09-15 12:53:10', NULL),
(6, 'ross', 'active', 'ross', '2022-09-15 12:53:31', '2022-09-15 12:53:31', NULL),
(7, 'keith', 'active', 'keith', '2022-09-15 12:53:38', '2022-09-15 12:53:38', NULL),
(8, 'jimmy', 'active', 'jimmy', '2022-09-15 12:53:58', '2022-09-15 12:53:58', NULL),
(9, 'flint', 'active', 'flint', '2022-09-15 12:54:17', '2022-09-15 12:54:17', NULL);

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
('FACTORY_SESSION', 'system', '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'ended', '2022-09-15 14:51:53', NULL, NULL, NULL),
('TEST_SESSION', NULL, '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'active', '2022-09-15 14:51:53', NULL, NULL, NULL);

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
('107373C946C69', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '265.95744680851', '268.6170212766', '0.01', 250, '0.94', 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', '2022-09-15 12:53:46', '2022-09-15 12:53:46', 1, 1, 'completed', 'peter', 'keith', '2022-09-15 12:53:46', '2022-09-15 12:53:50', NULL),
('1163470D8807E', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '184.21052631579', '186.05263157895', '0.01', 2800, '15.2', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-15 12:53:59', '2022-09-15 12:54:00', 1, 1, 'completed', 'lodza', 'jimmy', '2022-09-15 12:53:59', '2022-09-15 12:54:03', NULL),
('131916A79CD16', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '106.3829787234', '107.44680851064', '0.01', 100, '0.94', 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', '2022-09-15 12:53:01', '2022-09-15 12:53:05', 1, 1, 'completed', 'ross', 'guddaz', '2022-09-15 12:52:59', '2022-09-15 12:53:09', NULL),
('137771494E4D1', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '202.24719101124', '204.26966292135', '0.01', 36000, '178', 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', '2022-09-15 12:54:12', '2022-09-15 12:54:13', 1, 1, 'completed', 'nassim', 'jimmy', '2022-09-15 12:54:12', '2022-09-15 12:54:16', NULL),
('14596543F19BE', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', '2022-09-15 12:54:19', '2022-09-15 12:54:19', 1, 1, 'completed', 'guddaz', 'flint', '2022-09-15 12:54:19', '2022-09-15 12:54:23', NULL),
('15288346C745B', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-15 12:53:32', '2022-09-15 12:53:33', 1, 1, 'completed', 'clarence', 'ross', '2022-09-15 12:53:32', '2022-09-15 12:53:36', NULL),
('1660964F3FD53', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'ZMW', '210.52631578947', '212.63157894737', '0.01', 2800, '13.3', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-15 12:53:39', '2022-09-15 12:53:40', 1, 1, 'completed', 'lodza', 'keith', '2022-09-15 12:53:39', '2022-09-15 12:53:43', NULL),
('175199B2BBE33', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '205.88235294118', '207.94117647059', '0.01', 35000, '170', 'algerie_poste', '{\"account_holder_name\":\"Timothy Tambo\",\"account_number\":\"22558678\",\"account_key\":\"87\"}', '2022-09-15 12:54:25', '2022-09-15 12:54:26', 1, 1, 'completed', 'peter', 'flint', '2022-09-15 12:54:25', '2022-09-15 12:54:29', NULL),
('17686029289C2', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '162.76041666667', '164.38802083333', '0.01', 2500, '15.36', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-15 12:53:53', '2022-09-15 12:53:53', 1, 1, 'completed', 'flint', 'keith', '2022-09-15 12:53:52', '2022-09-15 12:53:56', NULL),
('183787710F538', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '148.93617021277', '150.42553191489', '0.01', 140, '0.94', 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', '2022-09-15 12:53:19', '2022-09-15 12:53:20', 1, 1, 'completed', 'keith', 'lodza', '2022-09-15 12:53:19', '2022-09-15 12:53:23', NULL),
('1847854EF21F9', 'Italy', NULL, 'buy', 'USDT', 'EUR', '263.15789473684', '265.78947368421', '0.01', 200, '0.76', 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', '2022-09-15 12:54:06', '2022-09-15 12:54:06', 1, 1, 'completed', 'raymond', 'jimmy', '2022-09-15 12:54:05', '2022-09-15 12:54:09', NULL),
('1887449E651CE', 'Zambia', NULL, 'buy', 'USDT', 'USD', '638.29787234043', '644.68085106383', '0.01', 600, '0.94', 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', '2022-09-15 12:53:26', '2022-09-15 12:53:26', 1, 1, 'completed', 'jimmy', 'lodza', '2022-09-15 12:53:26', '2022-09-15 12:53:29', NULL),
('19948073AED96', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '105.26315789474', '106.31578947368', '0.01', 100, '0.95', 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', '2022-09-15 12:53:12', '2022-09-15 12:53:13', 1, 1, 'completed', 'raymond', 'lodza', '2022-09-15 12:53:12', '2022-09-15 12:53:16', NULL);

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
('100572E6202DF', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"1374662DDCD80\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.4893617021277', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":819.37383031354,\"new_usable_balance_asset_value\":817.88446861141,\"old_total_balance_asset_value\":819.37383031354,\"new_total_balance_asset_value\":817.88446861141},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1592.1164613661,\"new_usable_balance_asset_value\":1593.6058230682,\"old_total_balance_asset_value\":1592.1164613661,\"new_total_balance_asset_value\":1593.6058230682}]', '2022-09-15 12:53:23', NULL),
('101074CF0B59A', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"14596543F19BE\"', 'trade_asset_release', 'flint', 'guddaz', 'USDT', '212.76595744681', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":562.76041666667,\"new_usable_balance_asset_value\":349.99445921986,\"old_total_balance_asset_value\":562.76041666667,\"new_total_balance_asset_value\":349.99445921986},{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":210.33027015937,\"new_usable_balance_asset_value\":423.09622760618,\"old_total_balance_asset_value\":210.33027015937,\"new_total_balance_asset_value\":423.09622760618}]', '2022-09-15 12:54:21', NULL),
('102660EBADDC0', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1660964F3FD53\"', 'trade_asset_release', 'keith', 'lodza', 'USDT', '210.52631578947', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":748.93617021277,\"new_usable_balance_asset_value\":538.4098544233,\"old_total_balance_asset_value\":748.93617021277,\"new_total_balance_asset_value\":538.4098544233},{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":173.20361754758,\"new_usable_balance_asset_value\":383.72993333705,\"old_total_balance_asset_value\":173.20361754758,\"new_total_balance_asset_value\":383.72993333705}]', '2022-09-15 12:53:41', NULL),
('1045358F2B289', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"107373C946C69\"', 'trade_asset_release', 'keith', 'peter', 'USDT', '265.95744680851', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":536.30459126541,\"new_usable_balance_asset_value\":270.3471444569,\"old_total_balance_asset_value\":536.30459126541,\"new_total_balance_asset_value\":270.3471444569},{\"user_username\":\"peter\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":265.95744680851,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":265.95744680851}]', '2022-09-15 12:53:48', NULL),
('107132FE7B236', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"17686029289C2\"', 'trade_asset_release', 'keith', 'flint', 'USDT', '162.76041666667', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":267.68756998881,\"new_usable_balance_asset_value\":104.92715332214,\"old_total_balance_asset_value\":267.68756998881,\"new_total_balance_asset_value\":104.92715332214},{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":400,\"new_usable_balance_asset_value\":562.76041666667,\"old_total_balance_asset_value\":400,\"new_total_balance_asset_value\":562.76041666667}]', '2022-09-15 12:53:55', NULL),
('10891335B75FB', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1847854EF21F9\"', 'trade_asset_release', 'jimmy', 'raymond', 'USDT', '263.15789473684', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":952.24524076145,\"new_usable_balance_asset_value\":689.08734602461,\"old_total_balance_asset_value\":952.24524076145,\"new_total_balance_asset_value\":689.08734602461},{\"user_username\":\"raymond\",\"old_usable_balance_asset_value\":105.26315789474,\"new_usable_balance_asset_value\":368.42105263158,\"old_total_balance_asset_value\":105.26315789474,\"new_total_balance_asset_value\":368.42105263158}]', '2022-09-15 12:54:08', NULL),
('110678D7060BF', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"107132FE7B236\"', 'platform_charge', 'keith', 'reserves', 'USDT', '1.6276041666667', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":104.92715332214,\"new_usable_balance_asset_value\":103.29954915547,\"old_total_balance_asset_value\":104.92715332214,\"new_total_balance_asset_value\":103.29954915547},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1606.8812989921,\"new_usable_balance_asset_value\":1608.5089031588,\"old_total_balance_asset_value\":1606.8812989921,\"new_total_balance_asset_value\":1608.5089031588}]', '2022-09-15 12:53:56', NULL),
('111783FA670E1', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"19948073AED96\"', 'trade_asset_release', 'lodza', 'raymond', 'USDT', '105.26315789474', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":1074.62579,\"new_usable_balance_asset_value\":969.36263210526,\"old_total_balance_asset_value\":1074.62579,\"new_total_balance_asset_value\":969.36263210526},{\"user_username\":\"raymond\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":105.26315789474,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":105.26315789474}]', '2022-09-15 12:53:15', NULL),
('113564037BC90', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"160395E9B2FC0\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '6.3829787234043', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":179.58659627098,\"new_usable_balance_asset_value\":173.20361754758,\"old_total_balance_asset_value\":179.58659627098,\"new_total_balance_asset_value\":173.20361754758},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1593.6058230682,\"new_usable_balance_asset_value\":1599.9888017916,\"old_total_balance_asset_value\":1593.6058230682,\"new_total_balance_asset_value\":1599.9888017916}]', '2022-09-15 12:53:29', NULL),
('1159888912216', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"15288346C745B\"', 'trade_asset_release', 'ross', 'clarence', 'USDT', '212.76595744681', '[{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":216.3829787234,\"new_usable_balance_asset_value\":3.61702127659,\"old_total_balance_asset_value\":216.3829787234,\"new_total_balance_asset_value\":3.61702127659},{\"user_username\":\"clarence\",\"old_usable_balance_asset_value\":100,\"new_usable_balance_asset_value\":312.76595744681,\"old_total_balance_asset_value\":100,\"new_total_balance_asset_value\":312.76595744681}]', '2022-09-15 12:53:35', NULL),
('125050A75B07B', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"177738C540D3F\"', 'deposit_token_topup', 'reserves', 'keith', 'USDT', '600', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2890,\"new_usable_balance_asset_value\":2290,\"old_total_balance_asset_value\":2890,\"new_total_balance_asset_value\":2290},{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":600,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":600}]', '2022-09-15 12:52:51', NULL),
('130005D1E617F', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"102660EBADDC0\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.1052631578947', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":538.4098544233,\"new_usable_balance_asset_value\":536.30459126541,\"old_total_balance_asset_value\":538.4098544233,\"new_total_balance_asset_value\":536.30459126541},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1602.1164613661,\"new_usable_balance_asset_value\":1604.221724524,\"old_total_balance_asset_value\":1602.1164613661,\"new_total_balance_asset_value\":1604.221724524}]', '2022-09-15 12:53:43', NULL),
('13065366B3DC0', 'onchain', '62BD544D1B9031EFC330A3E855CC3A0D51CA5131455C1AB3BCAC6D243F65460D', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '218.87587867', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":218.87587867,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":218.87587867}]', '2022-09-15 12:52:42', NULL),
('13137138B96C3', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Exodus wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '98.9012', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":218.87587867,\"new_usable_balance_asset_value\":317.77707867,\"old_total_balance_asset_value\":218.87587867,\"new_total_balance_asset_value\":317.77707867}]', '2022-09-15 12:52:46', NULL),
('1374662DDCD80', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"183787710F538\"', 'trade_asset_release', 'lodza', 'keith', 'USDT', '148.93617021277', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":968.31000052631,\"new_usable_balance_asset_value\":819.37383031354,\"old_total_balance_asset_value\":968.31000052631,\"new_total_balance_asset_value\":819.37383031354},{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":600,\"new_usable_balance_asset_value\":748.93617021277,\"old_total_balance_asset_value\":600,\"new_total_balance_asset_value\":748.93617021277}]', '2022-09-15 12:53:22', NULL),
('1381024A50343', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"186548AC1B95D\"', 'deposit_token_topup', 'reserves', 'clarence', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1790,\"new_usable_balance_asset_value\":1690,\"old_total_balance_asset_value\":1790,\"new_total_balance_asset_value\":1690},{\"user_username\":\"clarence\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":100,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":100}]', '2022-09-15 12:52:54', NULL),
('143362B7F4137', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"111783FA670E1\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.0526315789474', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":969.36263210526,\"new_usable_balance_asset_value\":968.31000052631,\"old_total_balance_asset_value\":969.36263210526,\"new_total_balance_asset_value\":968.31000052631},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1591.0638297872,\"new_usable_balance_asset_value\":1592.1164613661,\"old_total_balance_asset_value\":1591.0638297872,\"new_total_balance_asset_value\":1592.1164613661}]', '2022-09-15 12:53:16', NULL),
('143706C5AD035', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"137771494E4D1\"', 'trade_asset_release', 'jimmy', 'nassim', 'USDT', '202.24719101124', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":686.45576707724,\"new_usable_balance_asset_value\":484.208576066,\"old_total_balance_asset_value\":686.45576707724,\"new_total_balance_asset_value\":484.208576066},{\"user_username\":\"nassim\",\"old_usable_balance_asset_value\":100,\"new_usable_balance_asset_value\":302.24719101124,\"old_total_balance_asset_value\":100,\"new_total_balance_asset_value\":302.24719101124}]', '2022-09-15 12:54:14', NULL),
('151338E4B7DEC', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"161749EF12AF4\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '1.8421052631579', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":954.08734602461,\"new_usable_balance_asset_value\":952.24524076145,\"old_total_balance_asset_value\":954.08734602461,\"new_total_balance_asset_value\":952.24524076145},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1608.5089031588,\"new_usable_balance_asset_value\":1610.351008422,\"old_total_balance_asset_value\":1608.5089031588,\"new_total_balance_asset_value\":1610.351008422}]', '2022-09-15 12:54:03', NULL),
('1522790B42DB9', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"143706C5AD035\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.0224719101124', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":484.208576066,\"new_usable_balance_asset_value\":482.18610415589,\"old_total_balance_asset_value\":484.208576066,\"new_total_balance_asset_value\":482.18610415589},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1612.9825873694,\"new_usable_balance_asset_value\":1615.0050592795,\"old_total_balance_asset_value\":1612.9825873694,\"new_total_balance_asset_value\":1615.0050592795}]', '2022-09-15 12:54:16', NULL),
('1530336E84881', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"163554057E0FC\"', 'deposit_token_topup', 'reserves', 'nassim', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1690,\"new_usable_balance_asset_value\":1590,\"old_total_balance_asset_value\":1690,\"new_total_balance_asset_value\":1590},{\"user_username\":\"nassim\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":100,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":100}]', '2022-09-15 12:52:56', NULL),
('156747B66FBDF', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"1159888912216\"', 'platform_charge', 'ross', 'reserves', 'USDT', '2.1276595744681', '[{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":3.61702127659,\"new_usable_balance_asset_value\":1.4893617021219,\"old_total_balance_asset_value\":3.61702127659,\"new_total_balance_asset_value\":1.4893617021219},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1599.9888017916,\"new_usable_balance_asset_value\":1602.1164613661,\"old_total_balance_asset_value\":1599.9888017916,\"new_total_balance_asset_value\":1602.1164613661}]', '2022-09-15 12:53:36', NULL),
('1598299FCBA2C', 'onchain', '62BD544D1B9031EFC330A3E855CC3A0D51CA5131455C1AB3BCAC6D243F65460D', NULL, 'TEST_SESSION', 'Transfer from Ledger wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '967.86579', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":967.86579,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":967.86579}]', '2022-09-15 12:52:43', NULL),
('160395E9B2FC0', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1887449E651CE\"', 'trade_asset_release', 'lodza', 'jimmy', 'USDT', '638.29787234043', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":817.88446861141,\"new_usable_balance_asset_value\":179.58659627098,\"old_total_balance_asset_value\":817.88446861141,\"new_total_balance_asset_value\":179.58659627098},{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":500,\"new_usable_balance_asset_value\":1138.2978723404,\"old_total_balance_asset_value\":500,\"new_total_balance_asset_value\":1138.2978723404}]', '2022-09-15 12:53:28', NULL),
('161749EF12AF4', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1163470D8807E\"', 'trade_asset_release', 'jimmy', 'lodza', 'USDT', '184.21052631579', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":1138.2978723404,\"new_usable_balance_asset_value\":954.08734602461,\"old_total_balance_asset_value\":1138.2978723404,\"new_total_balance_asset_value\":954.08734602461},{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":383.72993333705,\"new_usable_balance_asset_value\":567.94045965284,\"old_total_balance_asset_value\":383.72993333705,\"new_total_balance_asset_value\":567.94045965284}]', '2022-09-15 12:54:01', NULL),
('161798405D37B', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"175199B2BBE33\"', 'trade_asset_release', 'flint', 'peter', 'USDT', '205.88235294118', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":347.86679964539,\"new_usable_balance_asset_value\":141.98444670421,\"old_total_balance_asset_value\":347.86679964539,\"new_total_balance_asset_value\":141.98444670421},{\"user_username\":\"peter\",\"old_usable_balance_asset_value\":265.95744680851,\"new_usable_balance_asset_value\":471.83979974969,\"old_total_balance_asset_value\":265.95744680851,\"new_total_balance_asset_value\":471.83979974969}]', '2022-09-15 12:54:27', NULL),
('1643370D81301', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '106.76', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":967.86579,\"new_usable_balance_asset_value\":1074.62579,\"old_total_balance_asset_value\":967.86579,\"new_total_balance_asset_value\":1074.62579}]', '2022-09-15 12:52:47', NULL),
('165123D525450', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli Reserves Wallet.', 'internalisation', NULL, 'reserves', 'USDT', '3000', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":3000,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":3000}]', '2022-09-15 12:52:41', NULL),
('167760CD42653', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"17618828366A7\"', 'deposit_token_topup', 'reserves', 'ross', 'USDT', '110', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":3000,\"new_usable_balance_asset_value\":2890,\"old_total_balance_asset_value\":3000,\"new_total_balance_asset_value\":2890},{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":110,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":110}]', '2022-09-15 12:52:49', NULL),
('169298DC18942', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"101074CF0B59A\"', 'platform_charge', 'flint', 'reserves', 'USDT', '2.1276595744681', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":349.99445921986,\"new_usable_balance_asset_value\":347.86679964539,\"old_total_balance_asset_value\":349.99445921986,\"new_total_balance_asset_value\":347.86679964539},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1615.0050592795,\"new_usable_balance_asset_value\":1617.132718854,\"old_total_balance_asset_value\":1615.0050592795,\"new_total_balance_asset_value\":1617.132718854}]', '2022-09-15 12:54:22', NULL),
('17253377EA7F1', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"17869635F7649\"', 'platform_charge', 'guddaz', 'reserves', 'USDT', '1.063829787234', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":211.3940999466,\"new_usable_balance_asset_value\":210.33027015937,\"old_total_balance_asset_value\":211.3940999466,\"new_total_balance_asset_value\":210.33027015937},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1590,\"new_usable_balance_asset_value\":1591.0638297872,\"old_total_balance_asset_value\":1590,\"new_total_balance_asset_value\":1591.0638297872}]', '2022-09-15 12:53:08', NULL),
('1752484FB8011', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"10891335B75FB\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.6315789473684', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":689.08734602461,\"new_usable_balance_asset_value\":686.45576707724,\"old_total_balance_asset_value\":689.08734602461,\"new_total_balance_asset_value\":686.45576707724},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1610.351008422,\"new_usable_balance_asset_value\":1612.9825873694,\"old_total_balance_asset_value\":1610.351008422,\"new_total_balance_asset_value\":1612.9825873694}]', '2022-09-15 12:54:09', NULL),
('175615B017175', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"132876B24E252\"', 'deposit_token_topup', 'reserves', 'jimmy', 'USDT', '500', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2290,\"new_usable_balance_asset_value\":1790,\"old_total_balance_asset_value\":2290,\"new_total_balance_asset_value\":1790},{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":500,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":500}]', '2022-09-15 12:52:53', NULL),
('1783014B3486F', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"1045358F2B289\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.6595744680851', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":270.3471444569,\"new_usable_balance_asset_value\":267.68756998881,\"old_total_balance_asset_value\":270.3471444569,\"new_total_balance_asset_value\":267.68756998881},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1604.221724524,\"new_usable_balance_asset_value\":1606.8812989921,\"old_total_balance_asset_value\":1604.221724524,\"new_total_balance_asset_value\":1606.8812989921}]', '2022-09-15 12:53:49', NULL),
('17869635F7649', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"131916A79CD16\"', 'trade_asset_release', 'guddaz', 'ross', 'USDT', '106.3829787234', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":317.77707867,\"new_usable_balance_asset_value\":211.3940999466,\"old_total_balance_asset_value\":317.77707867,\"new_total_balance_asset_value\":211.3940999466},{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":110,\"new_usable_balance_asset_value\":216.3829787234,\"old_total_balance_asset_value\":110,\"new_total_balance_asset_value\":216.3829787234}]', '2022-09-15 12:53:07', NULL),
('1852003264ECA', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"161798405D37B\"', 'platform_charge', 'flint', 'reserves', 'USDT', '2.0588235294118', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":141.98444670421,\"new_usable_balance_asset_value\":139.9256231748,\"old_total_balance_asset_value\":141.98444670421,\"new_total_balance_asset_value\":139.9256231748},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1617.132718854,\"new_usable_balance_asset_value\":1619.1915423834,\"old_total_balance_asset_value\":1617.132718854,\"new_total_balance_asset_value\":1619.1915423834}]', '2022-09-15 12:54:29', NULL),
('194381A3CE6F9', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'flint', 'USDT', '400', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":400,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":400}]', '2022-09-15 12:52:45', NULL);

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
(1, 'system', 'system', '', NULL, NULL, NULL, 'active', '2022-09-15 14:51:52', NULL, NULL),
(2, 'developer', 'developer.ankelli@gmail.com', '$2y$10$pKneqVUufO4/RBLhLG0rEOVgTqAbsypLVO05iXBHnXdoO4ttlFHX2', NULL, NULL, NULL, 'active', '2022-09-15 12:52:08', '2022-09-15 12:52:08', NULL),
(3, 'sysadmin', 'sysadmin@ankelli.com', '$2y$10$l6YUW1W7/ve4aDy/KBxewOZC4Wb.CApjYriSVOIdHR3VcpY3FKyqe', NULL, NULL, NULL, 'active', '2022-09-15 12:52:19', '2022-09-15 12:52:19', NULL),
(4, 'reserves', 'reserves@ankelli.com', '$2y$10$Eu5Uz6oLL3JLMaq2QjzoA.IQ0mxv2EtA/uBBmLenJxwQSh6Wdmv/2', NULL, NULL, NULL, 'active', '2022-09-15 12:52:20', '2022-09-15 12:52:20', NULL),
(5, 'busadmin', 'busadmin@ankelli.com', '$2y$10$Gs5qZepthOL0jT0uaamRh.YkY5WoRP.6u3A6SNln/1kUIoi9DlRjG', NULL, NULL, NULL, 'active', '2022-09-15 12:52:21', '2022-09-15 12:52:21', NULL),
(6, 'guddaz', 'goodhopedhliwayo@gmail.com', '$2y$10$VyHRWBCQOQGzivICesFwkex5JRjLwzc.zmctfDJ6q83fUNFRSpBh.', NULL, NULL, NULL, 'active', '2022-09-15 12:52:31', '2022-09-15 12:52:31', NULL),
(7, 'lodza', 'lodza@example.com', '$2y$10$bjs0537PA.jdqd/Z7YfpE.kdj2ImlIAdd5WFw0uA9XciPGAeJI7.u', NULL, NULL, NULL, 'active', '2022-09-15 12:52:33', '2022-09-15 12:52:33', NULL),
(8, 'ross', 'ross@example.com', '$2y$10$XLBqtYQHV5addE2Qlg6UXO0peUGqYwulgXyQ9lmMTIRevdJoHxCBO', NULL, NULL, NULL, 'active', '2022-09-15 12:52:35', '2022-09-15 12:52:35', NULL),
(9, 'jimmy', 'jimmy@example.com', '$2y$10$zuRUCXeImikQw5zToi52uu1kIP0Rx.12Dt06.GhmvoO5JKRY0xye2', NULL, NULL, NULL, 'active', '2022-09-15 12:52:35', '2022-09-15 12:52:35', NULL),
(10, 'keith', 'keith@example.com', '$2y$10$ST3Rbfe8QG1mZ8E9e/hSuuFXe1XGJSP6Qd4A.N4usKXfi4D0z8S2q', NULL, NULL, NULL, 'active', '2022-09-15 12:52:36', '2022-09-15 12:52:36', NULL),
(11, 'peter', 'peter@example.com', '$2y$10$PSwG8PO/3tLNN7TsMviaK.II/d.2G9HTp88QtH8889mue7QZT1Ioa', NULL, NULL, NULL, 'active', '2022-09-15 12:52:37', '2022-09-15 12:52:37', NULL),
(12, 'flint', 'flint@example.com', '$2y$10$JfOIiJrTe0QfypXMjLKcu.YfxPHnjNae19wEOAUSxIrO6EDShgybe', NULL, NULL, NULL, 'active', '2022-09-15 12:52:38', '2022-09-15 12:52:38', NULL),
(13, 'clarence', 'clarence@example.com', '$2y$10$5At2qoAjfk/sgneGhjshVetgkBn5tDhLbSKH5zzUQgcJVJrEn9Zj.', NULL, NULL, NULL, 'active', '2022-09-15 12:52:38', '2022-09-15 12:52:38', NULL),
(14, 'raymond', 'raymond@example.com', '$2y$10$OOcOO1uq8wJAeuBZ4rbxf.bi/F9rSHaneWPBcBlFykyukJnPFV.pm', NULL, NULL, NULL, 'active', '2022-09-15 12:52:39', '2022-09-15 12:52:39', NULL),
(15, 'nassim', 'nassim@example.com', '$2y$10$gwZOebYO60uZFAqgSUPKFeUrlelOW2F1UYpc07TLJ6ejV6JiE4tSy', NULL, NULL, NULL, 'active', '2022-09-15 12:52:40', '2022-09-15 12:52:40', NULL);

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
(1, 'Default Users', 'default_users', 'Group for Default User accounts created on system initialization and factory_data loading. \nNew users cannot be added to this group.', 'active', 'system', '2022-09-15 14:51:52', NULL, NULL),
(2, 'Administrators', 'administrators', 'Automatically joined group (Users with active Admin Extension). \nMembers can be added to other admin groups.', 'active', 'system', '2022-09-15 14:51:52', NULL, NULL),
(3, 'Developers', 'developers', 'Admin group for unrestricted system users. \nMembers have access to all features and OTP access to account named \"developer\". \nOnly \"developer\" account can add members to this group.\nGroup used for System Development and Maintenance.', 'active', 'system', '2022-09-15 14:51:52', NULL, NULL),
(4, 'System Administrators', 'system_administrators', 'Admin Group for System Administrators. \nMembers can manage system functions and sysconfig params. \nMembers have OTP access to account named \"sysadmin\".\nOnly \"sysadmin\" account can add members to this group.', 'active', 'system', '2022-09-15 14:51:52', NULL, NULL),
(5, 'Business Administrators', 'business_administrators', 'Admin group for Business Administrators.\nMembers have access to business related features.\nMembers have OTP access to accounts named \"reserves\" and \"busadmin\".\nOnly \"busadmin\" account can add members to this group.', 'active', 'system', '2022-09-15 14:51:52', NULL, NULL),
(6, 'User Administrators', 'user_administrators', 'Admin group for User Administrators. \nMembers can manage other users and user related queries.', 'active', 'system', '2022-09-15 14:51:52', NULL, NULL),
(7, 'Platform moderators', 'platform_moderators', 'Group for Platform moderators. \nMembers can respond in the customer service chat module, handle flagged business elements, manage daily updates.', 'active', 'system', '2022-09-15 14:51:52', NULL, NULL),
(8, 'Sellers', 'sellers', 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.', 'active', 'system', '2022-09-15 14:51:52', NULL, NULL),
(9, 'Buyers', 'buyers', 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.', 'active', 'system', '2022-09-15 14:51:52', NULL, NULL),
(10, 'Beta Testers', 'beta_testers', 'User Group for selected individuals to test certain features before they are published.', 'active', 'system', '2022-09-15 14:51:52', NULL, NULL);

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
(1, 'developer', 'default_users', 'active', 'system', '2022-09-15 12:52:14', '2022-09-15 12:52:14'),
(2, 'developer', 'developers', 'active', 'system', '2022-09-15 12:52:19', '2022-09-15 12:52:19'),
(3, 'sysadmin', 'default_users', 'active', 'system', '2022-09-15 12:52:19', '2022-09-15 12:52:19'),
(4, 'sysadmin', 'system_administrators', 'active', 'system', '2022-09-15 12:52:20', '2022-09-15 12:52:20'),
(5, 'reserves', 'default_users', 'active', 'system', '2022-09-15 12:52:20', '2022-09-15 12:52:20'),
(6, 'reserves', 'business_administrators', 'active', 'system', '2022-09-15 12:52:21', '2022-09-15 12:52:21'),
(7, 'busadmin', 'default_users', 'active', 'system', '2022-09-15 12:52:21', '2022-09-15 12:52:21'),
(8, 'busadmin', 'business_administrators', 'active', 'system', '2022-09-15 12:52:22', '2022-09-15 12:52:22'),
(9, 'guddaz', 'developers', 'active', 'system', '2022-09-15 12:52:32', '2022-09-15 12:52:32'),
(10, 'lodza', 'system_administrators', 'active', 'system', '2022-09-15 12:52:34', '2022-09-15 12:52:34'),
(11, 'lodza', 'user_administrators', 'active', 'system', '2022-09-15 12:52:34', '2022-09-15 12:52:34'),
(12, 'lodza', 'business_administrators', 'active', 'system', '2022-09-15 12:52:34', '2022-09-15 12:52:34');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

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
