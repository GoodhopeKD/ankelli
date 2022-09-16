-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 16, 2022 at 10:34 AM
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
(288, '2014_10_12_000000_create_users_table', 1),
(289, '2014_10_12_100000_create_password_resets_table', 1),
(290, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(291, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(292, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(293, '2016_06_01_000004_create_oauth_clients_table', 1),
(294, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(295, '2019_08_19_000000_create_failed_jobs_table', 1),
(296, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(297, '2022_07_26_072110_create___admin_extensions_table', 1),
(298, '2022_07_26_072112_create___buyer_extensions_table', 1),
(299, '2022_07_26_072114_create___seller_extensions_table', 1),
(300, '2022_07_26_072120_create___user_groups_table', 1),
(301, '2022_07_26_072122_create___user_group_memberships_table', 1),
(302, '2022_07_26_072124_create___permissions_table', 1),
(303, '2022_07_26_072126_create___permission_instances_table', 1),
(304, '2022_07_26_072130_create___sessions_table', 1),
(305, '2022_07_26_072131_create___notifications_table', 1),
(306, '2022_07_26_072132_create___pref_items_table', 1),
(307, '2022_07_26_072135_create___reg_tokens_table', 1),
(308, '2022_07_26_072136_create___verif_tokens_table', 1),
(309, '2022_07_26_072137_create___email_addresses_table', 1),
(310, '2022_07_26_072140_create___phone_nos_table', 1),
(311, '2022_07_26_072324_create___files_table', 1),
(312, '2022_07_26_072326_create___feedback_reports_table', 1),
(313, '2022_07_26_072327_create___posts_table', 1),
(314, '2022_07_26_072332_create___assets_table', 1),
(315, '2022_07_26_072333_create___asset_accounts_table', 1),
(316, '2022_07_26_072334_create___asset_account_addresses_table', 1),
(317, '2022_07_26_072336_create___currencies_table', 1),
(318, '2022_07_26_072337_create___pymt_methods_table', 1),
(319, '2022_07_26_072345_create___countries_table', 1),
(320, '2022_07_26_072347_create___exportables_table', 1),
(321, '2022_07_26_072410_create___deposit_tokens_table', 1),
(322, '2022_07_26_072416_create___offers_table', 1),
(323, '2022_07_26_072417_create___trades_table', 1),
(324, '2022_07_26_072419_create___chats_table', 1),
(325, '2022_07_26_072420_create___messages_table', 1),
(326, '2022_07_26_072421_create___pinnings_table', 1),
(327, '2022_07_26_072443_create___transactions_table', 1),
(328, '2022_07_26_072444_create___logs_table', 1);

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
(1, NULL, 'Ankelli Personal Access Client', 'bnRk75DZbbobm7EiFxn0BMw2GhF8xhkyghQK54a1', NULL, 'http://localhost', 1, 0, 0, '2022-09-16 06:32:05', '2022-09-16 06:32:05'),
(2, NULL, 'Ankelli Password Grant Client', '5QW3PVZJW1xcmurKHyPauRlcSUUpMGpagkM8r5ct', 'users', 'http://localhost', 0, 1, 0, '2022-09-16 06:32:05', '2022-09-16 06:32:05');

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
(1, 1, '2022-09-16 06:32:05', '2022-09-16 06:32:05');

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
(1, 'system', 'System', 'active', 'system', '2022-09-16 08:31:39', NULL, NULL),
(2, 'developer', 'Default Developer', 'active', 'system', '2022-09-16 06:31:59', '2022-09-16 06:31:59', NULL),
(3, 'sysadmin', 'Default System Administrator', 'active', 'system', '2022-09-16 06:32:00', '2022-09-16 06:32:00', NULL),
(4, 'reserves', 'Ankelli Asset Reserves', 'active', 'system', '2022-09-16 06:32:01', '2022-09-16 06:32:01', NULL),
(5, 'busadmin', 'Default Business Administrator', 'active', 'system', '2022-09-16 06:32:02', '2022-09-16 06:32:02', NULL),
(6, 'guddaz', 'Head System Developer', 'active', 'system', '2022-09-16 06:32:33', '2022-09-16 06:32:33', NULL),
(7, 'lodza', 'Head Business Administrator', 'active', 'system', '2022-09-16 06:32:34', '2022-09-16 06:32:34', NULL);

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
(1, NULL, NULL, 'Tether USD', 'USDT', '0.0001', 'active', 'system', '2022-09-16 06:31:58', '2022-09-16 06:31:58');

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
(1, NULL, 'reserves', 'USDT', '1615.0050592795', '1615.0050592795', 'active', '2022-09-16 06:32:01', '2022-09-16 06:34:15'),
(2, NULL, 'guddaz', 'USDT', '210.33027015937', '210.33027015937', 'active', '2022-09-16 06:32:41', '2022-09-16 06:33:07'),
(3, NULL, 'lodza', 'USDT', '567.94045965284', '567.94045965284', 'active', '2022-09-16 06:32:42', '2022-09-16 06:34:01'),
(4, NULL, 'flint', 'USDT', '562.76041666667', '562.76041666667', 'active', '2022-09-16 06:32:44', '2022-09-16 06:34:18'),
(5, NULL, 'ross', 'USDT', '1.4893617021219', '1.4893617021219', 'active', '2022-09-16 06:32:48', '2022-09-16 06:33:36'),
(6, NULL, 'keith', 'USDT', '103.29954915547', '103.29954915547', 'active', '2022-09-16 06:32:50', '2022-09-16 06:33:55'),
(7, NULL, 'jimmy', 'USDT', '482.18610415589', '482.18610415589', 'active', '2022-09-16 06:32:52', '2022-09-16 06:34:15'),
(8, NULL, 'clarence', 'USDT', '312.76595744681', '312.76595744681', 'active', '2022-09-16 06:32:54', '2022-09-16 06:33:35'),
(9, NULL, 'nassim', 'USDT', '302.24719101124', '302.24719101124', 'active', '2022-09-16 06:32:55', '2022-09-16 06:34:13'),
(10, NULL, 'raymond', 'USDT', '368.42105263158', '368.42105263158', 'active', '2022-09-16 06:33:13', '2022-09-16 06:34:07'),
(11, NULL, 'peter', 'USDT', '265.95744680851', '265.95744680851', 'active', '2022-09-16 06:33:48', '2022-09-16 06:33:48');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-16 06:32:00', '2022-09-16 06:32:00', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-16 06:32:02', '2022-09-16 06:32:02', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-16 06:32:03', '2022-09-16 06:32:03', NULL),
(4, 'ross', 'active', 'guddaz', '2022-09-16 06:32:57', '2022-09-16 06:32:57', NULL),
(5, 'raymond', 'active', 'lodza', '2022-09-16 06:33:09', '2022-09-16 06:33:09', NULL),
(6, 'keith', 'active', 'lodza', '2022-09-16 06:33:17', '2022-09-16 06:33:17', NULL),
(7, 'jimmy', 'active', 'lodza', '2022-09-16 06:33:24', '2022-09-16 06:33:24', NULL),
(8, 'clarence', 'active', 'ross', '2022-09-16 06:33:31', '2022-09-16 06:33:31', NULL),
(9, 'lodza', 'active', 'keith', '2022-09-16 06:33:38', '2022-09-16 06:33:38', NULL),
(10, 'peter', 'active', 'keith', '2022-09-16 06:33:44', '2022-09-16 06:33:44', NULL),
(11, 'flint', 'active', 'keith', '2022-09-16 06:33:51', '2022-09-16 06:33:51', NULL),
(12, 'nassim', 'active', 'jimmy', '2022-09-16 06:34:10', '2022-09-16 06:34:10', NULL),
(13, 'guddaz', 'active', 'flint', '2022-09-16 06:34:16', '2022-09-16 06:34:16', NULL);

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
(1, 'Zimbabwe', 'ZIM', NULL, NULL, NULL, 'active', 'system', '2022-09-16 08:31:51', NULL),
(2, 'South Africa', 'RSA', NULL, NULL, NULL, 'active', 'system', '2022-09-16 08:31:51', NULL),
(3, 'United Kingdom', 'UK', NULL, NULL, NULL, 'active', 'system', '2022-09-16 08:31:51', NULL),
(4, 'United States of America', 'USA', NULL, NULL, NULL, 'active', 'system', '2022-09-16 08:31:51', NULL),
(5, 'Russia', 'RUS', NULL, NULL, NULL, 'active', 'system', '2022-09-16 08:31:51', NULL),
(6, 'China', 'CHN', NULL, NULL, NULL, 'active', 'system', '2022-09-16 08:31:51', NULL),
(7, 'Ghana', 'GHA', NULL, NULL, NULL, 'active', 'system', '2022-09-16 08:31:51', NULL),
(8, 'Botswana', 'BOT', NULL, NULL, NULL, 'active', 'system', '2022-09-16 08:31:51', NULL),
(9, 'Zambia', 'ZAM', NULL, NULL, NULL, 'active', 'system', '2022-09-16 08:31:51', NULL),
(10, 'Algeria', 'ALG', NULL, NULL, NULL, 'active', 'system', '2022-09-16 08:31:51', NULL),
(11, 'Italy', 'ITA', NULL, NULL, NULL, 'active', 'system', '2022-09-16 08:31:51', NULL),
(12, 'Nigeria', 'NIG', NULL, NULL, NULL, 'active', 'system', '2022-09-16 08:31:51', NULL);

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
(1, 'US Dollar', 'USD', '$', 1, '1', '10', '5', 'active', 'system', '2022-09-16 08:31:49', NULL),
(2, 'Euro', 'EUR', '€', 1, '0.87', '10', '5', 'active', 'system', '2022-09-16 08:31:49', NULL),
(3, 'Pound Sterling', 'GBP', '£', 1, '0.77', '10', '5', 'active', 'system', '2022-09-16 08:31:49', NULL),
(4, 'South African Rand', 'ZAR', 'R', 0, '16', '100', '100', 'active', 'system', '2022-09-16 08:31:49', NULL),
(5, 'Zambian Kwacha', 'ZMW', 'K', 0, '15', '100', '100', 'active', 'system', '2022-09-16 08:31:49', NULL),
(6, 'Algerian Dinar', 'DZD', 'DA', 0, '180', '100', '100', 'active', 'system', '2022-09-16 08:31:49', NULL),
(7, 'Zimbabwean Dollar', 'ZWL', '$', 1, '10000', '500', '5000', 'active', 'system', '2022-09-16 08:31:49', NULL);

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
('1342184DAFF72', 'USDT', '500', 'USD', 501, 'lodza', '2022-09-16 06:32:51', 'jimmy', '2022-09-16 06:32:51'),
('15026706508BB', 'USDT', '600', 'USD', 601, 'lodza', '2022-09-16 06:32:49', 'keith', '2022-09-16 06:32:50'),
('1651132B90355', 'USDT', '110', 'USD', 111, 'lodza', '2022-09-16 06:32:48', 'ross', '2022-09-16 06:32:48'),
('177527203BF80', 'USDT', '100', 'DZD', 18000, 'lodza', '2022-09-16 06:32:55', 'nassim', '2022-09-16 06:32:55'),
('1965474620984', 'USDT', '100', 'EUR', 93, 'lodza', '2022-09-16 06:32:53', 'clarence', '2022-09-16 06:32:53');

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
(1, 'developer.ankelli@gmail.com', 'developer', '2022-09-16 06:31:59', NULL),
(2, 'sysadmin@ankelli.com', 'sysadmin', '2022-09-16 06:32:00', NULL),
(3, 'reserves@ankelli.com', 'reserves', '2022-09-16 06:32:01', NULL),
(4, 'busadmin@ankelli.com', 'busadmin', '2022-09-16 06:32:02', NULL),
(5, 'goodhopedhliwayo@gmail.com', 'guddaz', '2022-09-16 06:32:32', NULL),
(6, 'lodza@example.com', 'lodza', '2022-09-16 06:32:34', NULL),
(7, 'ross@example.com', 'ross', '2022-09-16 06:32:35', NULL),
(8, 'jimmy@example.com', 'jimmy', '2022-09-16 06:32:35', NULL),
(9, 'keith@example.com', 'keith', '2022-09-16 06:32:36', NULL),
(10, 'peter@example.com', 'peter', '2022-09-16 06:32:36', NULL),
(11, 'flint@example.com', 'flint', '2022-09-16 06:32:37', NULL),
(12, 'clarence@example.com', 'clarence', '2022-09-16 06:32:38', NULL),
(13, 'raymond@example.com', 'raymond', '2022-09-16 06:32:39', NULL),
(14, 'nassim@example.com', 'nassim', '2022-09-16 06:32:39', NULL);

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
(1, '__pymt_methods', 'cash_in_person', 'images', 'pymt_method_icon', 'Cash in person', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Cash in person.jpg', 'image/jpg', NULL, 'Cash in person.jpg', NULL, 'system', '2022-09-16 06:31:46', NULL),
(2, '__pymt_methods', 'stanbic_bank', 'images', 'pymt_method_icon', 'Stanbic Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Stanbic bank.jpg', 'image/jpg', NULL, 'Stanbic Bank Icon.jpg', NULL, 'system', '2022-09-16 06:31:46', NULL),
(3, '__pymt_methods', 'fnb_bank', 'images', 'pymt_method_icon', 'FNB Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FNB bank.png', 'image/png', NULL, 'FNB Bank Icon.png', NULL, 'system', '2022-09-16 06:31:46', NULL),
(4, '__pymt_methods', 'mukuru', 'images', 'pymt_method_icon', 'Mukuru Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mukuru.jpg', 'image/jpg', NULL, 'Mukuru Icon.jpg', NULL, 'system', '2022-09-16 06:31:46', NULL),
(5, '__pymt_methods', 'algerie_poste', 'images', 'pymt_method_icon', 'Algerie poste Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Algerie poste.jpg', 'image/jpg', NULL, 'Algerie poste Icon.jpg', NULL, 'system', '2022-09-16 06:31:46', NULL),
(6, '__pymt_methods', 'mtn_momo', 'images', 'pymt_method_icon', 'MTN MOMO Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/MTN MOMO.png', 'image/png', NULL, 'MTN MOMO Icon.png', NULL, 'system', '2022-09-16 06:31:46', NULL),
(7, '__pymt_methods', 'ecocash', 'images', 'pymt_method_icon', 'Ecocash Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Ecocash.png', 'image/png', NULL, 'Ecocash Icon.png', NULL, 'system', '2022-09-16 06:31:46', NULL),
(8, '__pymt_methods', 'paypal', 'images', 'pymt_method_icon', 'Paypal Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Paypal.png', 'image/png', NULL, 'Paypal Icon.png', NULL, 'system', '2022-09-16 06:31:46', NULL),
(9, '__pymt_methods', 'skrill', 'images', 'pymt_method_icon', 'Skrill Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Skrill.jpg', 'image/jpg', NULL, 'Skrill Icon.jpg', NULL, 'system', '2022-09-16 06:31:46', NULL),
(10, '__pymt_methods', 'world_remit', 'images', 'pymt_method_icon', 'World Remit Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/World Remit.png', 'image/png', NULL, 'World Remit Icon.png', NULL, 'system', '2022-09-16 06:31:46', NULL),
(11, '__pymt_methods', 'mastercard', 'images', 'pymt_method_icon', 'Mastercard Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mastercard.jpeg', 'image/jpeg', NULL, 'Mastercard Icon.jpeg', NULL, 'system', '2022-09-16 06:31:46', NULL),
(12, '__pymt_methods', 'visa', 'images', 'pymt_method_icon', 'Visa Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Visa.jpg', 'image/jpg', NULL, 'Visa Icon.jpg', NULL, 'system', '2022-09-16 06:31:46', NULL),
(13, '__pymt_methods', 'fbc_bank', 'images', 'pymt_method_icon', 'FBC bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FBC bank.jpg', 'image/jpg', NULL, 'FBC bank Icon.jpg', NULL, 'system', '2022-09-16 06:31:46', NULL);

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
('01wcsg1u0UkMucPj', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'flint', '2022-09-16 06:34:16', NULL, NULL, '__seller_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('0Heciz4lVQjPGU1a', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:34:18', NULL, NULL, '__messages', '168643B4725F0', NULL, '{\"ip\":\"127.0.0.1\"}'),
('0lcv1vztbfMMhg02', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'ross', '2022-09-16 06:32:48', NULL, NULL, '__asset_accounts', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('1gIgt9OtsGmujPab', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:32:37', NULL, '142600162DC99', '__users', 'flint', NULL, NULL),
('1NCdGVHwsmhZwet2', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-16 06:31:59', NULL, NULL, '__admin_extensions', 'developer', NULL, '{\"ip\":\"127.0.0.1\"}'),
('1VUZtphZcNWqzaWK', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:33:57', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1138.2978723404,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('1W7OIA1ox6uHI1lg', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:33', NULL, NULL, '__messages', '1815493DA8A75', NULL, '{\"ip\":\"127.0.0.1\"}'),
('1XHoetgXYFJILmo7', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:32:52', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2290,\"new_value\":1790},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2290,\"new_value\":1790}]', '{\"ip\":\"127.0.0.1\"}'),
('1yOeDORceKJD6A6R', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'lodza', '2022-09-16 06:33:09', NULL, NULL, '__seller_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('24Seu200qbSDaDHF', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'guddaz', '2022-09-16 06:32:59', NULL, NULL, '__trades', '16831934AC0D6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('26MOmPkyelmv9g04', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:53', NULL, NULL, '__messages', '162609F9570EB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('2EcB6EXwj3Xhi3d6', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-16 06:32:34', NULL, NULL, '__admin_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('2fgJqga2SrBxQJZk', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-16 06:33:56', NULL, NULL, '__trades', '10705942DCD16', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:53\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('2h9FqtgObasKmcRz', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:33:41', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":748.93617021277,\"new_value\":538.4098544233},{\"field_name\":\"total_balance_asset_value\",\"old_value\":748.93617021277,\"new_value\":538.4098544233}]', '{\"ip\":\"127.0.0.1\"}'),
('2IfxlkGWIgC5sRts', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:32:35', NULL, '15958540D1099', '__notifications', '161931D0E7481', NULL, NULL),
('2M0VYPhSNSyvxwYt', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-16 06:33:01', NULL, NULL, '__messages', '1435030067844', NULL, '{\"ip\":\"127.0.0.1\"}'),
('2oIGD8tKACciOWQH', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-16 06:33:03', NULL, NULL, '__messages', '107640DB68601', NULL, '{\"ip\":\"127.0.0.1\"}'),
('2vJifdWaJYynxYTr', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-16 06:33:05', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":110,\"new_value\":216.3829787234},{\"field_name\":\"total_balance_asset_value\",\"old_value\":110,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('2wSiY8M9Kxxre7e5', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-16 06:32:01', NULL, NULL, '__user_group_memberships', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('3PX0zOeIcl9V1NGC', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-16 06:32:50', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":600},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":600}]', '{\"ip\":\"127.0.0.1\"}'),
('3rESRxtO1oXO26GO', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-16 06:32:50', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2890,\"new_value\":2290},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2890,\"new_value\":2290}]', '{\"ip\":\"127.0.0.1\"}'),
('3yiuLYMlHJ39k7IK', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-16 06:33:57', NULL, NULL, '__offers', '13488710E76EC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('3ZgI9QID5WbAMhnl', 'FACTORY_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'system', '2022-09-16 06:32:01', NULL, NULL, '__asset_accounts', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('4BuYyXSIKWuDm3Yn', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-16 06:33:46', NULL, NULL, '__trades', '1206014AC6CC1', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:46\"}]', '{\"ip\":\"127.0.0.1\"}'),
('4Crl4MTCPvBWPLGb', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:25', NULL, NULL, '__messages', '1616676627E92', NULL, '{\"ip\":\"127.0.0.1\"}'),
('4IApU5fs7N7b4Ryg', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-16 06:32:50', NULL, NULL, '__deposit_tokens', '15026706508BB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('546U6T82iDNjQi05', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'ross', '2022-09-16 06:33:33', NULL, NULL, '__trades', '1378157E475D4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('5Q4f7Ok5Gj6Zm4ti', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'ross', '2022-09-16 06:33:31', NULL, NULL, '__buyer_extensions', 'clarence', NULL, '{\"ip\":\"127.0.0.1\"}'),
('5t4hpxqk3sxqAMKY', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-16 06:33:18', NULL, NULL, '__trades', '171734AF9F897', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:18\"}]', '{\"ip\":\"127.0.0.1\"}'),
('5ZXMklCnep61KV0C', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:32:36', NULL, '13744776D210F', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('617n9q1NUsmeMI8N', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-16 06:33:15', NULL, NULL, '__trades', '10990828E1E14', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:11\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('63rLd2JJAkZCVSAM', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:36', NULL, NULL, '__messages', '155362C103301', NULL, '{\"ip\":\"127.0.0.1\"}'),
('64TEyTs8IxwH10T7', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'peter', '2022-09-16 06:33:50', NULL, NULL, '__trades', '1206014AC6CC1', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"peter\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:46\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('66nx6g1o1J9l7pNM', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:32:37', NULL, '1756393D3A42F', '__notifications', '153462888F6C0', NULL, NULL),
('69DXwtGT6d6lJ5ea', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:32:39', NULL, '17834139FB259', '__email_addresses', 'raymond@example.com', NULL, NULL),
('6KPuRVVeXO57j0yE', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-16 06:32:33', NULL, NULL, '__admin_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('6mLRBrFg16zqTy4I', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:34:04', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('6SwnraCHbx7iWiWs', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:26', NULL, NULL, '__messages', '10496748154E1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('6UR3SnZ0BCAQT64a', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:32:01', NULL, '1255864A919A0', '__notifications', '1472654EC402D', NULL, NULL),
('75W2VMshHLtQ4tlR', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-16 06:34:15', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":484.208576066,\"new_value\":482.18610415589},{\"field_name\":\"total_balance_asset_value\",\"old_value\":484.208576066,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('79O9DrsTadXMxKte', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-16 06:34:07', NULL, NULL, '__asset_accounts', '10', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":105.26315789474,\"new_value\":368.42105263158},{\"field_name\":\"total_balance_asset_value\",\"old_value\":105.26315789474,\"new_value\":368.42105263158}]', '{\"ip\":\"127.0.0.1\"}'),
('7g8SrFBdDLkI2FwF', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:32:37', NULL, '142600162DC99', '__email_addresses', 'flint@example.com', NULL, NULL),
('7OOe4i1OVnXiHoAT', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-16 06:33:53', NULL, NULL, '__trades', '10705942DCD16', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:52\"}]', '{\"ip\":\"127.0.0.1\"}'),
('7XC2rl0xLra42C27', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:32:02', NULL, '151700BAD87AB', '__notifications', '187631D01DB0B', NULL, NULL),
('80J9CfoLQeQu8o8b', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'ross', '2022-09-16 06:32:48', NULL, NULL, '__deposit_tokens', '1651132B90355', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:32:48\"}]', '{\"ip\":\"127.0.0.1\"}'),
('8QDFKGdO815ci21n', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:32:43', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":967.86579},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":967.86579}]', '{\"ip\":\"127.0.0.1\"}'),
('8xMKp7wQgInOgvak', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:32:00', NULL, '142283EADCECF', '__email_addresses', 'sysadmin@ankelli.com', NULL, NULL),
('92aUmZe6NXeRDO5b', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-16 06:32:54', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1790,\"new_value\":1690},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1790,\"new_value\":1690}]', '{\"ip\":\"127.0.0.1\"}'),
('9coOw04Ih49SaAR1', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-16 06:32:02', NULL, NULL, '__seller_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9cs91bfsm1Wu9Lkd', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-16 06:32:48', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":3000,\"new_value\":2890},{\"field_name\":\"total_balance_asset_value\",\"old_value\":3000,\"new_value\":2890}]', '{\"ip\":\"127.0.0.1\"}'),
('9emL7UnKvDCtv3G0', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'flint', '2022-09-16 06:32:44', NULL, NULL, '__asset_accounts', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9f2Zmpupx8hq1BNJ', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'ross', '2022-09-16 06:32:57', NULL, NULL, '__offers', '18647758F60B7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9o8W72pdvoHsFN4L', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:32:01', NULL, '1255864A919A0', '__email_addresses', 'reserves@ankelli.com', NULL, NULL),
('9tUoI9lpztTdFNIa', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:39', NULL, NULL, '__messages', '1089111BEE78C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9vA334bI2sEmPZQ5', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:34:15', NULL, NULL, '__messages', '13508816DDD9B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('a3x4CRTDg5VXBp1Z', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-16 06:32:57', NULL, NULL, '__seller_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('A79uXfBwAVmH7TKW', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-16 06:32:57', NULL, NULL, '__buyer_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('AaMj2ufw6nncpaI0', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-16 06:33:49', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1604.221724524,\"new_value\":1606.8812989921},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1604.221724524,\"new_value\":1606.8812989921}]', '{\"ip\":\"127.0.0.1\"}'),
('Ag6pvyz6ISMlOn4x', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:32:38', NULL, '156001E3FE2A5', '__users', 'clarence', NULL, NULL),
('ANwbZpL7vGMxqmMl', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-16 06:34:08', NULL, NULL, '__trades', '124364124345C', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:34:05\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('aO6sYU9SqlWv96pc', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:32:02', NULL, '151700BAD87AB', '__users', 'busadmin', NULL, NULL),
('APOSUukCTkZfPdi9', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:33:17', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":968.31000052631,\"new_value\":817.88446861142}]', '{\"ip\":\"127.0.0.1\"}'),
('Aqh2I7nNL6lK3uwK', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:46', NULL, NULL, '__messages', '100878F11AF8E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('aS6EgSkPiAB7WhO0', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:34:00', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1138.2978723404,\"new_value\":954.08734602461},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1138.2978723404,\"new_value\":954.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('BAKm7j2RgVFra2LL', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-16 06:33:09', NULL, NULL, '__offers', '133967055389F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('BaKw0SNr5TjimH8c', 'FACTORY_SESSION', 'Temporarily disabling for factory users.', 'entry_update', 'system', '2022-09-16 06:31:58', NULL, NULL, '__pref_items', '8', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for factory users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('beu5NWg7dGgP3gFw', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:32:36', NULL, '1756393D3A42F', '__email_addresses', 'peter@example.com', NULL, NULL),
('BJ1RU9LzfCn3zi82', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-16 06:33:19', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":817.88446861142,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('BKMsNQy944EAbaIc', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'guddaz', '2022-09-16 06:32:41', NULL, NULL, '__asset_accounts', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('btMZKLfQO85TB6oR', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:34:05', NULL, NULL, '__trades', '124364124345C', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:34:05\"}]', '{\"ip\":\"127.0.0.1\"}'),
('BUNGBI2YnrmR9HTL', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-16 06:33:20', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":600,\"new_value\":748.93617021277},{\"field_name\":\"total_balance_asset_value\",\"old_value\":600,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('Bw1qOplTQYNay2UM', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'reserves', '2022-09-16 06:32:40', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":3000},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":3000}]', '{\"ip\":\"127.0.0.1\"}'),
('c4KWW1Cr3MbCR9YS', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:34:08', NULL, NULL, '__messages', '1073474613981', NULL, '{\"ip\":\"127.0.0.1\"}'),
('C4LzMWtfQ5NqFcYc', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:32:33', NULL, '19899941DF802', '__notifications', '160515BD78CC2', NULL, NULL),
('c8NU4yDZKn0OiMJ5', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-16 06:34:02', NULL, NULL, '__trades', '1014424733E93', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:59\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('C8NYpt1aAmASi2pa', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-16 06:33:02', NULL, NULL, '__messages', '155084626049E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('c8Xny3EoGj7IyVhF', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:19', NULL, NULL, '__messages', '1096547C14104', NULL, '{\"ip\":\"127.0.0.1\"}'),
('CcWBggN7gf4qnGbs', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:33:42', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":538.4098544233,\"new_value\":536.30459126541},{\"field_name\":\"total_balance_asset_value\",\"old_value\":538.4098544233,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('cfuYNXACasCQiaiW', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-16 06:32:41', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":218.87587867},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":218.87587867}]', '{\"ip\":\"127.0.0.1\"}'),
('Cj3tz34pwsLDsI7W', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-16 06:33:59', NULL, NULL, '__trades', '1014424733E93', NULL, '{\"ip\":\"127.0.0.1\"}'),
('CkiAlpPwhLtVH62j', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-16 06:33:53', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":103.29954915548,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('CM0mroBiX3g5MMoi', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-16 06:33:37', NULL, NULL, '__offers', '1467121D2CA86', NULL, '{\"ip\":\"127.0.0.1\"}'),
('CRPLiujXIOOb0NM4', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-16 06:34:20', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":562.76041666667,\"new_value\":349.99445921986},{\"field_name\":\"total_balance_asset_value\",\"old_value\":562.76041666667,\"new_value\":349.99445921986}]', '{\"ip\":\"127.0.0.1\"}'),
('CseNeCUKPF3Wu5Fo', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'raymond', '2022-09-16 06:33:13', NULL, NULL, '__asset_accounts', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('cuBBc7n6qLPT3uTX', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-16 06:32:02', NULL, NULL, '__user_group_memberships', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('CyTlyFa9Rjx1Fskb', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:15', NULL, NULL, '__messages', '130547F425442', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ddhn7WKS8Oc0qMwz', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:34:18', NULL, NULL, '__messages', '1665200E37CB1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dDJ1ZBk2A88WULHX', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-16 06:32:55', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1690,\"new_value\":1590},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1690,\"new_value\":1590}]', '{\"ip\":\"127.0.0.1\"}'),
('DjsDrLsv6MjcduL7', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-16 06:32:34', NULL, NULL, '__user_group_memberships', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dNRIJOjBOCbbFw7v', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:33:59', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('DtvYXPJF5SZIMHdR', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-16 06:33:35', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":216.3829787234,\"new_value\":3.61702127659},{\"field_name\":\"total_balance_asset_value\",\"old_value\":216.3829787234,\"new_value\":3.61702127659}]', '{\"ip\":\"127.0.0.1\"}'),
('e0bbcm6pYx4gTnSk', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'clarence', '2022-09-16 06:32:54', NULL, NULL, '__asset_accounts', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ebx9sBjXXgtREwSK', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'flint', '2022-09-16 06:34:16', NULL, NULL, '__buyer_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('eD1iL0CkAa3owBHX', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:32:00', NULL, '142283EADCECF', '__notifications', '1711100BB70C6', NULL, NULL),
('EFFebo1kKjltI43l', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:33:40', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":536.3045912654,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('egssaT8PaWqk5piI', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:32:35', NULL, '15958540D1099', '__email_addresses', 'ross@example.com', NULL, NULL),
('eRSSz1K5Y6DKruRK', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-16 06:32:53', NULL, NULL, '__deposit_tokens', '1965474620984', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Es7dhbFd61vqFDWL', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:11', NULL, NULL, '__messages', '142552A372C65', NULL, '{\"ip\":\"127.0.0.1\"}'),
('EWtgzgkbrFQxMKh4', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-16 06:33:13', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1074.62579,\"new_value\":969.36263210526},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1074.62579,\"new_value\":969.36263210526}]', '{\"ip\":\"127.0.0.1\"}'),
('F1KYMM7AGm1YuKUM', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:34:01', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":383.72993333705,\"new_value\":567.94045965284},{\"field_name\":\"total_balance_asset_value\",\"old_value\":383.72993333705,\"new_value\":567.94045965284}]', '{\"ip\":\"127.0.0.1\"}'),
('F3tIlmsKrQwXjXLU', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-16 06:32:00', NULL, NULL, '__user_group_memberships', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('F5rjslp9IRHGb7gU', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-16 06:34:17', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":562.76041666667,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('fjIcUuCJ87CgqjCp', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-16 06:32:44', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":400},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":400}]', '{\"ip\":\"127.0.0.1\"}'),
('FJXTrpPnu4a3NEsf', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-16 06:33:52', NULL, NULL, '__trades', '10705942DCD16', NULL, '{\"ip\":\"127.0.0.1\"}'),
('FOB1W2SLnRATdmo4', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-16 06:34:13', NULL, NULL, '__asset_accounts', '9', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":100,\"new_value\":302.24719101124},{\"field_name\":\"total_balance_asset_value\",\"old_value\":100,\"new_value\":302.24719101124}]', '{\"ip\":\"127.0.0.1\"}'),
('fR4zIrpO2erU7P1p', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:25', NULL, NULL, '__messages', '109090A2B9757', NULL, '{\"ip\":\"127.0.0.1\"}'),
('g2ihtEn5zZo07Cqc', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:32:38', NULL, '156001E3FE2A5', '__email_addresses', 'clarence@example.com', NULL, NULL),
('g7M5hxg2YwIt67a8', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-16 06:32:03', NULL, NULL, '__user_group_memberships', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('g819orMsYaZVcK00', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-16 06:33:25', NULL, NULL, '__trades', '15835932D42CF', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Geoz42Q37BkUZChT', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:32:52', NULL, NULL, '__deposit_tokens', '1342184DAFF72', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:32:51\"}]', '{\"ip\":\"127.0.0.1\"}'),
('gjMWGCoNLSVGIOVU', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'keith', '2022-09-16 06:32:50', NULL, NULL, '__asset_accounts', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('gKgqNZRehRxbA9ex', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'clarence', '2022-09-16 06:32:54', NULL, NULL, '__deposit_tokens', '1965474620984', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:32:53\"}]', '{\"ip\":\"127.0.0.1\"}'),
('GObR4EBsoQ2dUxbl', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-16 06:33:36', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1599.9888017916,\"new_value\":1602.1164613661},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1599.9888017916,\"new_value\":1602.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('gTJgoVvkz80BhSrl', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:32:32', NULL, '19899941DF802', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('GtvK7H7HcJPH3kbv', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:32:39', NULL, '133572C9DD943', '__users', 'nassim', NULL, NULL),
('GwTG9DNyFRSiU1T2', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:32:38', NULL, '17834139FB259', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('GxTFLZKpEowgU21u', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:43', NULL, NULL, '__messages', '1365593DBE8B8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('H3I8aOITYL10Jaoh', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:00', NULL, NULL, '__messages', '1580015C38E64', NULL, '{\"ip\":\"127.0.0.1\"}'),
('H8GPZOw8B8gHeWIR', 'FACTORY_SESSION', 'Resetting to default value.', 'entry_update', 'system', '2022-09-16 06:32:03', NULL, NULL, '__pref_items', '8', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Resetting to default value.\"},{\"field_name\":\"value\",\"old_value\":\"0\",\"new_value\":true}]', '{\"ip\":\"127.0.0.1\"}'),
('hA9Fq2MNLsg4dFZp', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:33:59', NULL, NULL, '__trades', '1014424733E93', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:59\"}]', '{\"ip\":\"127.0.0.1\"}'),
('HABdFhlmU36JiLOb', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:34:12', NULL, NULL, '__trades', '1262810D700CD', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:34:11\"}]', '{\"ip\":\"127.0.0.1\"}'),
('hDGXqrvuRpPqhPxM', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'keith', '2022-09-16 06:32:50', NULL, NULL, '__deposit_tokens', '15026706508BB', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:32:50\"}]', '{\"ip\":\"127.0.0.1\"}'),
('hfZtzvyNgGi1p7vE', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:32:35', NULL, '1809428AEE6DB', '__notifications', '136197B23C4BD', NULL, NULL),
('hGtWrMQMhC2BakjN', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-16 06:33:18', NULL, NULL, '__trades', '171734AF9F897', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Hi0IPhjeErl3xUtU', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:18', NULL, NULL, '__messages', '137505CFE4081', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HN7We2exCdFBmy0S', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-16 06:33:22', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":819.37383031354,\"new_value\":817.88446861141},{\"field_name\":\"total_balance_asset_value\",\"old_value\":819.37383031354,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('hnYbs6u6Djh7d4bH', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-16 06:32:02', NULL, NULL, '__admin_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HoHwUvdrENSO2SkR', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-16 06:33:07', NULL, NULL, '__trades', '16831934AC0D6', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:04\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('HQErNf2FR7aBqEdr', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'flint', '2022-09-16 06:34:18', NULL, NULL, '__trades', '10549159C6513', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HqVuHiE9yFmhcOI0', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-16 06:32:00', NULL, NULL, '__seller_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HR98UeSa354MTxTE', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:53', NULL, NULL, '__messages', '187525CAB996C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HTNGlDaoFJ2LZbU3', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-16 06:32:02', NULL, NULL, '__user_group_memberships', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('i44W7wpi65Xs6BsY', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-16 06:33:39', NULL, NULL, '__trades', '1068751738D12', NULL, '{\"ip\":\"127.0.0.1\"}'),
('i4vpgECrUBUj0UhI', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-16 06:33:11', NULL, NULL, '__trades', '10990828E1E14', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ial3VHF3m5V6xNAo', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-16 06:34:10', NULL, NULL, '__buyer_extensions', 'nassim', NULL, '{\"ip\":\"127.0.0.1\"}'),
('iB2RNIgsu0dexGqw', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:11', NULL, NULL, '__messages', '164889478D8DB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('IkkVXHmojLLLiom1', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:31:59', NULL, '178037A658B65', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('imouGEjsbLRI4BoD', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-16 06:32:54', NULL, NULL, '__asset_accounts', '8', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":100},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('iQWJyiCpnGRBReD9', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-16 06:32:46', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":218.87587867,\"new_value\":317.77707867},{\"field_name\":\"total_balance_asset_value\",\"old_value\":218.87587867,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('j8W64NS8kQIZwEaa', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:34:12', NULL, NULL, '__messages', '1559129267BBB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('JglIVoJB5aYUu5ES', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:33', NULL, NULL, '__messages', '1910047DC2267', NULL, '{\"ip\":\"127.0.0.1\"}'),
('JKo6rYtuMOzbw1BC', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-16 06:33:43', NULL, NULL, '__trades', '1068751738D12', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:40\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('JP47LM9nhUSCGxN8', 'FACTORY_SESSION', 'Addition of _RegToken entry to database.', 'entry_create', 'system', '2022-09-16 06:32:03', NULL, NULL, '__reg_tokens', '1234567890', NULL, '{\"ip\":\"127.0.0.1\"}'),
('jPPHu7uLbBj5rd6o', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-16 06:32:57', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":317.77707867,\"new_value\":210.33027015936}]', '{\"ip\":\"127.0.0.1\"}'),
('jqLXNICuLNwGMhvw', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-16 06:34:18', NULL, NULL, '__trades', '10549159C6513', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:34:18\"}]', '{\"ip\":\"127.0.0.1\"}'),
('jtzRy8njBmhcRmBV', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-16 06:32:51', NULL, NULL, '__deposit_tokens', '1342184DAFF72', NULL, '{\"ip\":\"127.0.0.1\"}'),
('jxsztjHib9rdV67H', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-16 06:34:12', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":482.18610415589,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('kb1UGgHMv0p9H92T', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:31:59', NULL, '178037A658B65', '__email_addresses', 'developer.ankelli@gmail.com', NULL, NULL),
('KEzwBPFXRgF6lr26', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-16 06:33:12', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":968.31000052632,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}'),
('Kg4o0qIByM5RHlTE', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-16 06:33:11', NULL, NULL, '__trades', '10990828E1E14', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:11\"}]', '{\"ip\":\"127.0.0.1\"}'),
('kqksbffcOnIQ1ING', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:33:27', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":817.88446861141,\"new_value\":179.58659627098},{\"field_name\":\"total_balance_asset_value\",\"old_value\":817.88446861141,\"new_value\":179.58659627098}]', '{\"ip\":\"127.0.0.1\"}'),
('kV2iJj2ZIAhmP7oa', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:33:43', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1602.1164613661,\"new_value\":1604.221724524},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1602.1164613661,\"new_value\":1604.221724524}]', '{\"ip\":\"127.0.0.1\"}'),
('KwI928HVq7U6NAyH', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:33:10', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1074.62579,\"new_value\":968.31000052632}]', '{\"ip\":\"127.0.0.1\"}'),
('L46tTjLlruyCfXj1', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'nassim', '2022-09-16 06:32:55', NULL, NULL, '__asset_accounts', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('lcuDcjMLZQxrMzeq', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:32:33', NULL, '1446023C1F480', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('lIQJiWth1qZbHMRN', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:34:10', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('lUL4r6dHudLDIcr6', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-16 06:34:11', NULL, NULL, '__trades', '1262810D700CD', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Lz61uqQpjEBHdJfv', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-16 06:33:20', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":968.31000052631,\"new_value\":819.37383031354},{\"field_name\":\"total_balance_asset_value\",\"old_value\":968.31000052631,\"new_value\":819.37383031354}]', '{\"ip\":\"127.0.0.1\"}'),
('lZjUxDYSzn5Nf9b2', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-16 06:32:56', NULL, NULL, '__asset_accounts', '9', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":100},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('m0j15Ymblcllkte0', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'ross', '2022-09-16 06:33:31', NULL, NULL, '__seller_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('mdUHVPjC8SadKWUo', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-16 06:32:03', NULL, NULL, '__buyer_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('MfxMYytPUjSi98Rn', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-16 06:33:17', NULL, NULL, '__buyer_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('mHCDuJoEOROTOtSX', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'guddaz', '2022-09-16 06:33:00', NULL, NULL, '__trades', '16831934AC0D6', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"guddaz\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:00\"}]', '{\"ip\":\"127.0.0.1\"}'),
('mnmhNGMu90CqExhf', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:32:00', NULL, '142283EADCECF', '__users', 'sysadmin', NULL, NULL),
('MNMpLywazeWUOzaN', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:33:29', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1593.6058230682,\"new_value\":1599.9888017916},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1593.6058230682,\"new_value\":1599.9888017916}]', '{\"ip\":\"127.0.0.1\"}'),
('MPHmlsAqAxDhmNco', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:32:34', NULL, '1446023C1F480', '__email_addresses', 'lodza@example.com', NULL, NULL),
('MwILhln1xjPOwSuO', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'nassim', '2022-09-16 06:34:15', NULL, NULL, '__trades', '1262810D700CD', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:34:12\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('mxHG0VbNns70J8Uy', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-16 06:33:38', NULL, NULL, '__buyer_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('n0JhRNa2tfuVh47x', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:32:36', NULL, '1756393D3A42F', '__users', 'peter', NULL, NULL),
('N1DKMggv4xHBT3TO', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-16 06:32:33', NULL, NULL, '__user_group_memberships', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('n3RslWlxYtjjAVYE', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:33:29', NULL, NULL, '__trades', '15835932D42CF', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:26\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('n8G5z4ZPJ8iSTXOS', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-16 06:33:35', NULL, NULL, '__asset_accounts', '8', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":100,\"new_value\":312.76595744681},{\"field_name\":\"total_balance_asset_value\",\"old_value\":100,\"new_value\":312.76595744681}]', '{\"ip\":\"127.0.0.1\"}');
INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('n9dVAintP75r1wiQ', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:32:02', NULL, '151700BAD87AB', '__email_addresses', 'busadmin@ankelli.com', NULL, NULL),
('n9TEvP1Lex79Twmt', 'FACTORY_SESSION', 'Addition of _Asset entry to database.', 'entry_create', 'system', '2022-09-16 06:31:58', NULL, NULL, '__assets', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('nC8C5H4wO5yVBslZ', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-16 06:33:15', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":969.36263210526,\"new_value\":968.31000052631},{\"field_name\":\"total_balance_asset_value\",\"old_value\":969.36263210526,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('nCLeayYnUUPFoIVO', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-16 06:33:56', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1606.8812989921,\"new_value\":1608.5089031588},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1606.8812989921,\"new_value\":1608.5089031588}]', '{\"ip\":\"127.0.0.1\"}'),
('ndZ2Ao8X4m8LadvP', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'lodza', '2022-09-16 06:32:43', NULL, NULL, '__asset_accounts', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('neZX5Us7zf6fvZhF', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:32:34', NULL, '1446023C1F480', '__notifications', '14885224DD909', NULL, NULL),
('NiVh9yW1MDd8bJrH', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:34:05', NULL, NULL, '__messages', '1309497855E0D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('NOCLwjNEV5tA3kWF', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-16 06:33:48', NULL, NULL, '__asset_accounts', '11', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":265.95744680851},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":265.95744680851}]', '{\"ip\":\"127.0.0.1\"}'),
('nX2Nyv3VcHWg6Gk0', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-16 06:31:59', NULL, NULL, '__user_group_memberships', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('o2hjOiz9IQtGdskI', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:32:36', NULL, '1756393D3A42F', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('O3jIer2ygu1Grdh8', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:32:02', NULL, '151700BAD87AB', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('oHZA3TBeJLR6LSGP', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:32:38', NULL, '156001E3FE2A5', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('oLXKp2G7kbWKoDqv', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-16 06:32:02', NULL, NULL, '__buyer_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ONhHjhhhNNh18X1g', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'peter', '2022-09-16 06:33:48', NULL, NULL, '__asset_accounts', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('onMWofz6jrb7bWME', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-16 06:34:08', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1610.351008422,\"new_value\":1612.9825873694},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1610.351008422,\"new_value\":1612.9825873694}]', '{\"ip\":\"127.0.0.1\"}'),
('oNyOy4uZRJofqiA2', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:32:01', NULL, '1255864A919A0', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('OQOzr7Qen0etFIpj', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:31:59', NULL, '178037A658B65', '__notifications', '135444E871AC7', NULL, NULL),
('OSzSqX4TZ7ZY6LB3', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-16 06:33:25', NULL, NULL, '__trades', '15835932D42CF', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:25\"}]', '{\"ip\":\"127.0.0.1\"}'),
('Oyj5frBtyIQqPyPo', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:32:34', NULL, '1446023C1F480', '__users', 'lodza', NULL, NULL),
('OyU7nz1FeexiGUOE', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:46', NULL, NULL, '__messages', '106926E8E4861', NULL, '{\"ip\":\"127.0.0.1\"}'),
('p350fMdB73V7NL29', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-16 06:32:34', NULL, NULL, '__user_group_memberships', '12', NULL, '{\"ip\":\"127.0.0.1\"}'),
('P9bbPYPhkk7bDXDG', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:32:00', NULL, '142283EADCECF', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('pCcp37Dsuk8soBzm', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'jimmy', '2022-09-16 06:33:23', NULL, NULL, '__offers', '172210A91A0B3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('pCxUDCALwGigMxd6', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-16 06:32:03', NULL, NULL, '__admin_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('pFo41XTttQpUR9kD', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:04', NULL, NULL, '__messages', '198728A53CD2E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Pop0An8JAvPPA5NY', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:32:36', NULL, '13744776D210F', '__email_addresses', 'keith@example.com', NULL, NULL),
('Ps9rxKSgeS9pCjB5', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-16 06:33:09', NULL, NULL, '__buyer_extensions', 'raymond', NULL, '{\"ip\":\"127.0.0.1\"}'),
('pUpgy029FJNLzqK9', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-16 06:33:47', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('PW9ffUpSMos3U1rA', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-16 06:33:51', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":103.29954915548}]', '{\"ip\":\"127.0.0.1\"}'),
('pzM2ehoVDQ1HcuOC', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-16 06:33:05', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":317.77707867,\"new_value\":211.3940999466},{\"field_name\":\"total_balance_asset_value\",\"old_value\":317.77707867,\"new_value\":211.3940999466}]', '{\"ip\":\"127.0.0.1\"}'),
('q787redyycYxy5cb', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-16 06:33:51', NULL, NULL, '__buyer_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qaewQxzipq1r0qj1', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:29', NULL, NULL, '__messages', '1757815922E46', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qEme6DAgEPcAmDmd', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:32:35', NULL, '1809428AEE6DB', '__users', 'jimmy', NULL, NULL),
('QgebfiOQtfHXFmJ8', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:52', NULL, NULL, '__messages', '123268DAD33A8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qiRcuFRPXxXtu6Wt', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-16 06:33:46', NULL, NULL, '__trades', '1206014AC6CC1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('QkTGVB0FeYL698dT', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-16 06:33:33', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1.4893617021234,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('QLgaka3tcjGLsKkS', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:34:05', NULL, NULL, '__messages', '12386674DE694', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Quhu8FvZOG1vyeDx', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:33:26', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":173.20361754758,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('quXo6lENCjmiGkN5', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:32:38', NULL, '156001E3FE2A5', '__notifications', '15799004CA4FB', NULL, NULL),
('QWzbHUAbkXJvl6dp', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:32:36', NULL, '13744776D210F', '__users', 'keith', NULL, NULL),
('QZf2yoU8Xseh8wY7', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'nassim', '2022-09-16 06:32:56', NULL, NULL, '__deposit_tokens', '177527203BF80', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:32:55\"}]', '{\"ip\":\"127.0.0.1\"}'),
('qzUoAbbTCX94e8BM', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-16 06:33:31', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":216.3829787234,\"new_value\":1.4893617021234}]', '{\"ip\":\"127.0.0.1\"}'),
('R1eliB4tnyNhGMUn', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:40', NULL, NULL, '__messages', '141862F6A7E58', NULL, '{\"ip\":\"127.0.0.1\"}'),
('r35JLpgw7yC3rNzS', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:34:05', NULL, NULL, '__messages', '1613947C2CBB3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ra7emc9bdCJx07a5', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-16 06:34:18', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":347.86679964539,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('rA8LWjvN0EANy4jw', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:32:34', NULL, '15958540D1099', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('rfRy6Nms3gsGB7LL', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-16 06:34:13', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":484.208576066},{\"field_name\":\"total_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":484.208576066}]', '{\"ip\":\"127.0.0.1\"}'),
('rGd4lLS5JUtC7xYl', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-16 06:33:13', NULL, NULL, '__asset_accounts', '10', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":105.26315789474},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":105.26315789474}]', '{\"ip\":\"127.0.0.1\"}'),
('RjBn0vZB0urO6DIc', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-16 06:32:03', NULL, NULL, '__seller_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('RKIXVvKhmYKuhkLe', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-16 06:33:22', NULL, NULL, '__trades', '171734AF9F897', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:19\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('rLNwH3KsG1i6wO7n', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:11', NULL, NULL, '__messages', '10449866CF8F1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('scMrux04q2eDiumh', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:33:24', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":817.88446861141,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('ScT3905TgtCrojpM', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:32:40', NULL, '133572C9DD943', '__notifications', '17974495939D5', NULL, NULL),
('sE51p2mRsIpj3ZX0', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'nassim', '2022-09-16 06:34:10', NULL, NULL, '__offers', '1421684C755A2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('SFzD9xQLZpfONJSN', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-16 06:33:44', NULL, NULL, '__buyer_extensions', 'peter', NULL, '{\"ip\":\"127.0.0.1\"}'),
('sgPyuHKRZPKiDpk9', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-16 06:33:49', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":270.3471444569,\"new_value\":267.68756998881},{\"field_name\":\"total_balance_asset_value\",\"old_value\":270.3471444569,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('sIeKqWtdrT1NOJF5', 'TEST_SESSION', 'Temporarily disabling for test users.', 'entry_update', 'system', '2022-09-16 06:32:32', NULL, NULL, '__pref_items', '8', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for test users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('slhHcgtVvZgzWfn0', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:31:59', NULL, '178037A658B65', '__users', 'developer', NULL, NULL),
('sOyBi1jXSW7OzxKV', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:22', NULL, NULL, '__messages', '121293B1E95A7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('sPJYafdBQzScXdo2', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-16 06:34:08', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":689.08734602461,\"new_value\":686.45576707724},{\"field_name\":\"total_balance_asset_value\",\"old_value\":689.08734602461,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('SvhNas8rLDLxJvai', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-16 06:34:16', NULL, NULL, '__offers', '152316A8F5A93', NULL, '{\"ip\":\"127.0.0.1\"}'),
('SVrH9fW4JRzNVMSE', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'flint', '2022-09-16 06:33:51', NULL, NULL, '__offers', '107503C550813', NULL, '{\"ip\":\"127.0.0.1\"}'),
('sWDA9LvfSRxZ6tED', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-16 06:33:36', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":3.61702127659,\"new_value\":1.4893617021219},{\"field_name\":\"total_balance_asset_value\",\"old_value\":3.61702127659,\"new_value\":1.4893617021219}]', '{\"ip\":\"127.0.0.1\"}'),
('T0vHxJaiBp75HeaX', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:32:37', NULL, '142600162DC99', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('T5nqDw24LJxCNIHw', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-16 06:33:22', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1592.1164613661,\"new_value\":1593.6058230682},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1592.1164613661,\"new_value\":1593.6058230682}]', '{\"ip\":\"127.0.0.1\"}'),
('TF0OhtfR5nLkiPn1', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:34:02', NULL, NULL, '__messages', '129468AA33A30', NULL, '{\"ip\":\"127.0.0.1\"}'),
('tJf2hG4lrlsORe7j', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:56', NULL, NULL, '__messages', '15324098FD1EC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('tKTMRdKMc3LpJUmz', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-16 06:33:33', NULL, NULL, '__trades', '1378157E475D4', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:33\"}]', '{\"ip\":\"127.0.0.1\"}'),
('TlCEArUEnFftqi2R', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-16 06:32:34', NULL, NULL, '__user_group_memberships', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TMKZTN1NSpIBEAXV', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-16 06:33:07', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":211.3940999466,\"new_value\":210.33027015937},{\"field_name\":\"total_balance_asset_value\",\"old_value\":211.3940999466,\"new_value\":210.33027015937}]', '{\"ip\":\"127.0.0.1\"}'),
('tWkVzhEeODETPlmQ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:34:18', NULL, NULL, '__messages', '1813509EDA9E2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('tXLSKDcw8qFIOvYo', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-16 06:33:54', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":400,\"new_value\":562.76041666667},{\"field_name\":\"total_balance_asset_value\",\"old_value\":400,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('TysdZiQRXROLcT6l', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-16 06:33:04', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":210.33027015936,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('U3dOaT5MbkmNNl5p', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-16 06:32:55', NULL, NULL, '__deposit_tokens', '177527203BF80', NULL, '{\"ip\":\"127.0.0.1\"}'),
('u3U4J4chSzzL23Al', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-16 06:32:48', NULL, NULL, '__deposit_tokens', '1651132B90355', NULL, '{\"ip\":\"127.0.0.1\"}'),
('U5nHnJc85CYkHA4Q', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:34:02', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1608.5089031588,\"new_value\":1610.351008422},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1608.5089031588,\"new_value\":1610.351008422}]', '{\"ip\":\"127.0.0.1\"}'),
('UbUXjIHSuPTF205a', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-16 06:33:54', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":104.92715332214},{\"field_name\":\"total_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":104.92715332214}]', '{\"ip\":\"127.0.0.1\"}'),
('UCIzYDRLwIRVW1z6', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:33:29', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":179.58659627098,\"new_value\":173.20361754758},{\"field_name\":\"total_balance_asset_value\",\"old_value\":179.58659627098,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('udLfmioRs0fpNQ2b', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:32:39', NULL, '17834139FB259', '__users', 'raymond', NULL, NULL),
('Ui7z6jXaajqKdWDi', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:32', NULL, NULL, '__messages', '121974D6FC9DA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UiSAwJ4VLj5DNtgU', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-16 06:34:07', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":689.08734602461},{\"field_name\":\"total_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":689.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('UljLV0H89ep7CfkC', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:49', NULL, NULL, '__messages', '10596546A1EF5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UN5WiBMpTNzpL6By', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-16 06:33:48', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":536.30459126541,\"new_value\":270.3471444569},{\"field_name\":\"total_balance_asset_value\",\"old_value\":536.30459126541,\"new_value\":270.3471444569}]', '{\"ip\":\"127.0.0.1\"}'),
('uOeXOHAKZpgHGqlx', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-16 06:31:59', NULL, NULL, '__user_group_memberships', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('usAcQEecykdUQ2Nq', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:32:35', NULL, '15958540D1099', '__users', 'ross', NULL, NULL),
('utRsAQmd2RhVjKe8', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-16 06:33:39', NULL, NULL, '__trades', '1068751738D12', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:39\"}]', '{\"ip\":\"127.0.0.1\"}'),
('uxuKloWb1AoXFY0Z', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:18', NULL, NULL, '__messages', '192179D3836C1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('V0giYXvLZ1ZrfA4W', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-16 06:33:44', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":536.30459126541,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('VElhiRHzj4GjZAlO', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-16 06:32:48', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":110},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":110}]', '{\"ip\":\"127.0.0.1\"}'),
('vgDoypuPw8aqX9EF', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-16 06:32:59', NULL, NULL, '__messages', '176960F088237', NULL, '{\"ip\":\"127.0.0.1\"}'),
('VgSbAd0K4K7kkJKa', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:34:02', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":954.08734602461,\"new_value\":952.24524076145},{\"field_name\":\"total_balance_asset_value\",\"old_value\":954.08734602461,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('vjw21IAobUwhonE8', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:33:41', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":173.20361754758,\"new_value\":383.72993333705},{\"field_name\":\"total_balance_asset_value\",\"old_value\":173.20361754758,\"new_value\":383.72993333705}]', '{\"ip\":\"127.0.0.1\"}'),
('vkZEMTYAuaSS0jpF', 'Ox4KkaZBn9BSZ78h', 'Addition of _Session entry to database.', 'entry_create', NULL, '2022-09-16 06:32:17', '+02:00', NULL, '__sessions', 'Ox4KkaZBn9BSZ78h', NULL, '{\"ip\":\"127.0.0.1\"}'),
('vnmGFrRJsJKSkWjp', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:33:27', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":500,\"new_value\":1138.2978723404},{\"field_name\":\"total_balance_asset_value\",\"old_value\":500,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('vXmLWYBZFESml1pR', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-16 06:34:05', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('wAg27Z8NpPkCFYNr', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'keith', '2022-09-16 06:33:16', NULL, NULL, '__offers', '18860808F1E95', NULL, '{\"ip\":\"127.0.0.1\"}'),
('wVtW4SKdZKcETCoH', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-16 06:34:15', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1612.9825873694,\"new_value\":1615.0050592795},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1612.9825873694,\"new_value\":1615.0050592795}]', '{\"ip\":\"127.0.0.1\"}'),
('x7Vk3wkIIRYVvmfh', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:32:01', NULL, '1255864A919A0', '__users', 'reserves', NULL, NULL),
('xaml6FpSBhKvR32C', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:32:35', NULL, '1809428AEE6DB', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('XILgvhCIkuSAWoR1', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'keith', '2022-09-16 06:33:38', NULL, NULL, '__seller_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Xk1mOgcoJTGCRtrR', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-16 06:33:09', NULL, NULL, '__offers', '121773A84216F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('xOMCTTPHvLjqsqYA', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:46', NULL, NULL, '__messages', '116101B4632C2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('xou5dmst1slmF5P3', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:32:38', NULL, '142600162DC99', '__notifications', '137389DB87048', NULL, NULL),
('xPjAyya2fAaBjx5J', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:59', NULL, NULL, '__messages', '179959CBD2BB1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XVtqcn9mlwpBPA2Y', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-16 06:33:24', NULL, NULL, '__buyer_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('xyn2mXRCiCVmzHch', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-16 06:32:00', NULL, NULL, '__buyer_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('xZJDC8Vo9kOrQ8Zg', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-16 06:33:07', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1590,\"new_value\":1591.0638297872},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1590,\"new_value\":1591.0638297872}]', '{\"ip\":\"127.0.0.1\"}'),
('y3jbSpCXoE8PhUns', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:32:33', NULL, '19899941DF802', '__email_addresses', 'goodhopedhliwayo@gmail.com', NULL, NULL),
('Y57yCzkiCCdC64RZ', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-16 06:32:00', NULL, NULL, '__admin_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('y9zCO0rGAt1R44Hb', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-16 06:32:52', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":500},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":500}]', '{\"ip\":\"127.0.0.1\"}'),
('ycnrgQuvrw9tuNgP', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:32:40', NULL, '133572C9DD943', '__email_addresses', 'nassim@example.com', NULL, NULL),
('ycyTzznutIklvee2', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:39', NULL, NULL, '__messages', '1834039C6DAEA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('yez5DPka7qE3O0hC', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'clarence', '2022-09-16 06:33:36', NULL, NULL, '__trades', '1378157E475D4', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-16 08:33:33\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('YgXscXygyWYawgqO', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-16 06:33:55', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":104.92715332214,\"new_value\":103.29954915547},{\"field_name\":\"total_balance_asset_value\",\"old_value\":104.92715332214,\"new_value\":103.29954915547}]', '{\"ip\":\"127.0.0.1\"}'),
('YkJex4oHRkKB0NGI', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:32:36', NULL, '13744776D210F', '__notifications', '125137EE817D5', NULL, NULL),
('YKZiYZqHjwadmHMT', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-16 06:32:39', NULL, '133572C9DD943', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('YmN859ftYGthfPKN', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-16 06:34:05', NULL, NULL, '__trades', '124364124345C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('yp6qafmD91TrNLyK', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:32:58', NULL, NULL, '__messages', '15162835246F2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('yq34KPjYBGmmVgZO', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'jimmy', '2022-09-16 06:32:52', NULL, NULL, '__asset_accounts', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('YVrDAsPO5A3LX3Rq', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'peter', '2022-09-16 06:33:44', NULL, NULL, '__offers', '15756675E57C4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('z0W7FUmniWQQT3Ky', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:34:11', NULL, NULL, '__messages', '178523B462CD8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('z39CDQxlArpUsroX', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-16 06:32:47', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":967.86579,\"new_value\":1074.62579},{\"field_name\":\"total_balance_asset_value\",\"old_value\":967.86579,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}'),
('z66lHyhovO3AId4q', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-16 06:34:03', NULL, NULL, '__offers', '106413F138426', NULL, '{\"ip\":\"127.0.0.1\"}'),
('z6ipGyJ1hAHBJygn', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'clarence', '2022-09-16 06:33:31', NULL, NULL, '__offers', '123907ED59B8D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('z78EjSXr3AwMKnXz', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:07', NULL, NULL, '__messages', '127618369D7FD', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ZBFceAhiEg6eiczU', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-16 06:32:35', NULL, '1809428AEE6DB', '__email_addresses', 'jimmy@example.com', NULL, NULL),
('zCn5amCo3i6nd5jD', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-16 06:32:01', NULL, NULL, '__user_group_memberships', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ZERuZxtGYvTC3rj8', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:34:12', NULL, NULL, '__messages', '160798E1EE726', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zItYvKjMEr7mGOR8', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-16 06:33:38', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":748.93617021277,\"new_value\":536.3045912654}]', '{\"ip\":\"127.0.0.1\"}'),
('ZJYLUuSqNJza5jQE', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:59', NULL, NULL, '__messages', '1635909777A81', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ZmgroHFNIPSJcxvj', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-16 06:33:57', NULL, NULL, '__seller_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ZQnW7U8FSjJPyl8R', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-16 06:33:15', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1591.0638297872,\"new_value\":1592.1164613661},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1591.0638297872,\"new_value\":1592.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('zs9vBkuhY4u7D16Q', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-16 06:33:58', NULL, NULL, '__messages', '1860194B1BA6F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ZtsAIKGQyDcKt3XW', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-16 06:32:39', NULL, '17834139FB259', '__notifications', '119937314C881', NULL, NULL),
('ZZdZAce6aqhFbbqR', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-16 06:32:32', NULL, '19899941DF802', '__users', 'guddaz', NULL, NULL);

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
('100878F11AF8E', '__trades', '1206014AC6CC1', 'Asset buyer just declared their payment.', 'system', '2022-09-16 06:33:46', NULL),
('10449866CF8F1', '__trades', '10990828E1E14', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-16 06:33:11', NULL),
('10496748154E1', '__trades', '15835932D42CF', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-16 06:33:26', NULL),
('10596546A1EF5', '__trades', '1206014AC6CC1', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-16 06:33:49', NULL),
('106926E8E4861', '__trades', '1206014AC6CC1', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-16 06:33:46', NULL),
('1073474613981', '__trades', '124364124345C', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-16 06:34:08', NULL),
('107640DB68601', '__trades', '16831934AC0D6', 'Pleasure doing business with you.', 'ross', '2022-09-16 06:33:03', NULL),
('1089111BEE78C', '__trades', '1068751738D12', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-16 06:33:39', NULL),
('109090A2B9757', '__trades', '15835932D42CF', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-16 06:33:25', NULL),
('1096547C14104', '__trades', '171734AF9F897', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-16 06:33:19', NULL),
('116101B4632C2', '__trades', '1206014AC6CC1', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-16 06:33:46', NULL),
('121293B1E95A7', '__trades', '171734AF9F897', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-16 06:33:22', NULL),
('121974D6FC9DA', '__trades', '1378157E475D4', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-16 06:33:32', NULL),
('123268DAD33A8', '__trades', '10705942DCD16', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-16 06:33:52', NULL),
('12386674DE694', '__trades', '124364124345C', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-16 06:34:05', NULL),
('127618369D7FD', '__trades', '16831934AC0D6', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-16 06:33:07', NULL),
('129468AA33A30', '__trades', '1014424733E93', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-16 06:34:02', NULL),
('130547F425442', '__trades', '10990828E1E14', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-16 06:33:15', NULL),
('1309497855E0D', '__trades', '124364124345C', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-16 06:34:05', NULL),
('13508816DDD9B', '__trades', '1262810D700CD', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-16 06:34:15', NULL),
('1365593DBE8B8', '__trades', '1068751738D12', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-16 06:33:43', NULL),
('137505CFE4081', '__trades', '171734AF9F897', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-16 06:33:18', NULL),
('141862F6A7E58', '__trades', '1068751738D12', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-16 06:33:40', NULL),
('142552A372C65', '__trades', '10990828E1E14', 'Asset buyer just declared their payment.', 'system', '2022-09-16 06:33:11', NULL),
('1435030067844', '__trades', '16831934AC0D6', 'I\'ve sent the cash.\nPlease confirm receiving it.', 'guddaz', '2022-09-16 06:33:01', NULL),
('15162835246F2', '__trades', '16831934AC0D6', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-16 06:32:58', NULL),
('15324098FD1EC', '__trades', '10705942DCD16', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-16 06:33:56', NULL),
('155084626049E', '__trades', '16831934AC0D6', 'I\'ve collected the money.', 'ross', '2022-09-16 06:33:02', NULL),
('155362C103301', '__trades', '1378157E475D4', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-16 06:33:36', NULL),
('1559129267BBB', '__trades', '1262810D700CD', 'Asset buyer just declared their payment.', 'system', '2022-09-16 06:34:11', NULL),
('1580015C38E64', '__trades', '16831934AC0D6', 'Asset buyer just declared their payment.', 'system', '2022-09-16 06:33:00', NULL),
('160798E1EE726', '__trades', '1262810D700CD', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-16 06:34:12', NULL),
('1613947C2CBB3', '__trades', '124364124345C', 'Asset buyer just declared their payment.', 'system', '2022-09-16 06:34:05', NULL),
('1616676627E92', '__trades', '15835932D42CF', 'Asset buyer just declared their payment.', 'system', '2022-09-16 06:33:25', NULL),
('162609F9570EB', '__trades', '10705942DCD16', 'Asset buyer just declared their payment.', 'system', '2022-09-16 06:33:52', NULL),
('1635909777A81', '__trades', '1014424733E93', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-16 06:33:59', NULL),
('164889478D8DB', '__trades', '10990828E1E14', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-16 06:33:11', NULL),
('1665200E37CB1', '__trades', '10549159C6513', 'Asset buyer just declared their payment.', 'system', '2022-09-16 06:34:18', NULL),
('168643B4725F0', '__trades', '10549159C6513', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-16 06:34:18', NULL),
('1757815922E46', '__trades', '15835932D42CF', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-16 06:33:29', NULL),
('176960F088237', '__trades', '16831934AC0D6', 'I\'m sending the cash in a couple of minutes.', 'guddaz', '2022-09-16 06:32:59', NULL),
('178523B462CD8', '__trades', '1262810D700CD', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-16 06:34:11', NULL),
('179959CBD2BB1', '__trades', '1014424733E93', 'Asset buyer just declared their payment.', 'system', '2022-09-16 06:33:59', NULL),
('1813509EDA9E2', '__trades', '10549159C6513', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-16 06:34:18', NULL),
('1815493DA8A75', '__trades', '1378157E475D4', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-16 06:33:33', NULL),
('1834039C6DAEA', '__trades', '1068751738D12', 'Asset buyer just declared their payment.', 'system', '2022-09-16 06:33:39', NULL),
('1860194B1BA6F', '__trades', '1014424733E93', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-16 06:33:58', NULL),
('187525CAB996C', '__trades', '10705942DCD16', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-16 06:33:53', NULL),
('1910047DC2267', '__trades', '1378157E475D4', 'Asset buyer just declared their payment.', 'system', '2022-09-16 06:33:33', NULL),
('192179D3836C1', '__trades', '171734AF9F897', 'Asset buyer just declared their payment.', 'system', '2022-09-16 06:33:18', NULL),
('198728A53CD2E', '__trades', '16831934AC0D6', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-16 06:33:04', NULL);

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
('119937314C881', 'raymond', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:32:39', NULL),
('125137EE817D5', 'keith', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:32:36', NULL),
('135444E871AC7', 'developer', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:31:59', NULL),
('136197B23C4BD', 'jimmy', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:32:35', NULL),
('137389DB87048', 'flint', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:32:37', NULL),
('1472654EC402D', 'reserves', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:32:01', NULL),
('14885224DD909', 'lodza', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:32:34', NULL),
('153462888F6C0', 'peter', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:32:36', NULL),
('15799004CA4FB', 'clarence', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:32:38', NULL),
('160515BD78CC2', 'guddaz', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:32:33', NULL),
('161931D0E7481', 'ross', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:32:35', NULL),
('1711100BB70C6', 'sysadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:32:00', NULL),
('17974495939D5', 'nassim', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:32:40', NULL),
('187631D01DB0B', 'busadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-16 06:32:02', NULL);

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
('106413F138426', 'Italy', NULL, 'buy', 'USDT', 'EUR', '0.76', 200, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', NULL, 'online', 'raymond', '2022-09-16 06:34:03', '2022-09-16 06:34:03', NULL),
('107503C550813', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.36', 1500, 2500, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'flint', '2022-09-16 06:33:51', '2022-09-16 06:33:51', NULL),
('121773A84216F', 'Zimbabwe', 'Norton', 'sell', 'USDT', 'USD', '1.04', NULL, NULL, '50', '200', 'cash_in_person', NULL, NULL, 'online', 'guddaz', '2022-09-16 06:33:09', '2022-09-16 06:33:09', NULL),
('123907ED59B8D', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'clarence', '2022-09-16 06:33:31', '2022-09-16 06:33:31', NULL),
('133967055389F', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.95', 100, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', NULL, 'online', 'raymond', '2022-09-16 06:33:09', '2022-09-16 06:33:09', NULL),
('13488710E76EC', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.2', 700, 3000, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'lodza', '2022-09-16 06:33:57', '2022-09-16 06:33:57', NULL),
('1421684C755A2', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '178', 10000, 40000, NULL, NULL, 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', NULL, 'online', 'nassim', '2022-09-16 06:34:10', '2022-09-16 06:34:10', NULL),
('1467121D2CA86', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'ZMW', '13.3', 2800, 14000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'lodza', '2022-09-16 06:33:37', '2022-09-16 06:33:37', NULL),
('152316A8F5A93', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '0.94', 100, 200, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'guddaz', '2022-09-16 06:34:16', '2022-09-16 06:34:16', NULL),
('15756675E57C4', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 200, 300, NULL, NULL, 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', NULL, 'online', 'peter', '2022-09-16 06:33:44', '2022-09-16 06:33:44', NULL),
('172210A91A0B3', 'Zambia', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', NULL, 'online', 'jimmy', '2022-09-16 06:33:23', '2022-09-16 06:33:23', NULL),
('18647758F60B7', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'ross', '2022-09-16 06:32:57', '2022-09-16 06:32:57', NULL),
('18860808F1E95', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', NULL, 'online', 'keith', '2022-09-16 06:33:16', '2022-09-16 06:33:16', NULL);

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
(1, 'Update system config params', 'update_sysconfig_params', 'Permission holder can update system config params.', 'active', 'system', '2022-09-16 08:31:42', NULL, NULL),
(2, 'Handle feedback reports', 'handle_feedback_reports', 'Permission holder can handle feedback reports.', 'active', 'system', '2022-09-16 08:31:42', NULL, NULL),
(3, 'Manage datalists', 'manage_datalists', 'Permission holder can manage datalists.', 'active', 'system', '2022-09-16 08:31:42', NULL, NULL),
(4, 'Manage system tools', 'manage_systools', 'Permission holder can manage system tools.', 'active', 'system', '2022-09-16 08:31:42', NULL, NULL),
(5, 'View all logs', 'view_all_logs', 'Permission holder can view all logs.', 'active', 'system', '2022-09-16 08:31:42', NULL, NULL),
(6, 'View all transactions', 'view_all_transactions', 'Permission holder can view all transactions.', 'active', 'system', '2022-09-16 08:31:42', NULL, NULL),
(7, 'Manage Deposit Tokens', 'manage_deposit_tokens', 'Permission holder can create and edit deposit tokens.', 'active', 'system', '2022-09-16 08:31:42', NULL, NULL),
(8, 'Handle Withdrawals', 'handle_withdrawals', 'Permission holder can handle withdrawals.', 'active', 'system', '2022-09-16 08:31:42', NULL, NULL),
(9, 'Manage Registration Tokens', 'manage_reg_tokens', 'Permission holder can create and edit registration tokens.', 'active', 'system', '2022-09-16 08:31:42', NULL, NULL),
(10, 'Handle flagged users', 'handle_flagged_users', 'Permission holder can handle flagged Users.', 'active', 'system', '2022-09-16 08:31:42', NULL, NULL),
(11, 'Handle customer service chats', 'handle_customer_service_chats', 'Permission holder can handle customer service chats.', 'active', 'system', '2022-09-16 08:31:42', NULL, NULL),
(12, 'Manage update posts', 'manage_update_posts', 'Permission holder can handle posting and editing update posts.', 'active', 'system', '2022-09-16 08:31:42', NULL, NULL),
(13, 'Handle flagged business elems', 'handle_flagged_business_elems', 'Permission holder can handle flagged business elems (Offers, Trades, etc).', 'active', 'system', '2022-09-16 08:31:42', NULL, NULL);

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
(1, '__user_groups', 'system_administrators', 'update_sysconfig_params', 'active', 'system', '2022-09-16 08:31:42', NULL),
(2, '__user_groups', 'system_administrators', 'handle_feedback_reports', 'active', 'system', '2022-09-16 08:31:42', NULL),
(3, '__user_groups', 'system_administrators', 'manage_systools', 'active', 'system', '2022-09-16 08:31:42', NULL),
(4, '__user_groups', 'system_administrators', 'manage_datalists', 'active', 'system', '2022-09-16 08:31:42', NULL),
(5, '__user_groups', 'system_administrators', 'view_all_logs', 'active', 'system', '2022-09-16 08:31:42', NULL),
(6, '__user_groups', 'business_administrators', 'view_all_transactions', 'active', 'system', '2022-09-16 08:31:42', NULL),
(7, '__user_groups', 'business_administrators', 'manage_deposit_tokens', 'active', 'system', '2022-09-16 08:31:42', NULL),
(8, '__user_groups', 'business_administrators', 'handle_withdrawals', 'active', 'system', '2022-09-16 08:31:42', NULL),
(9, '__user_groups', 'user_administrators', 'manage_reg_tokens', 'active', 'system', '2022-09-16 08:31:42', NULL),
(10, '__user_groups', 'user_administrators', 'handle_flagged_users', 'active', 'system', '2022-09-16 08:31:42', NULL),
(11, '__user_groups', 'platform_moderators', 'handle_customer_service_chats', 'active', 'system', '2022-09-16 08:31:42', NULL),
(12, '__user_groups', 'platform_moderators', 'handle_flagged_business_elems', 'active', 'system', '2022-09-16 08:31:42', NULL),
(13, '__user_groups', 'platform_moderators', 'manage_update_posts', 'active', 'system', '2022-09-16 08:31:42', NULL);

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
(1, '__users', 'system', 'Backend rest api enabled', 'backend_rest_api_enabled', '1', 'boolean', 'system', '2022-09-16 08:31:44', NULL),
(2, '__users', 'system', 'Scaffolding app enabled', 'scaffolding_app_enabled', '1', 'boolean', 'system', '2022-09-16 08:31:44', NULL),
(3, '__users', 'system', 'Fallback Display Language', 'fallback_pref_lang', 'en', 'enum:langs', 'system', '2022-09-16 08:31:44', NULL),
(4, '__users', 'system', 'Fallback Display Theme', 'fallback_pref_theme', 'light', 'enum:themes', 'system', '2022-09-16 08:31:44', NULL),
(5, '__users', 'system', 'Image storage driver', 'image_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-16 08:31:44', NULL),
(6, '__users', 'system', 'Document storage driver', 'document_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-16 08:31:44', NULL),
(7, '__users', 'system', 'Open Registration enabled', 'open_reg_enabled', '0', 'boolean', 'system', '2022-09-16 08:31:44', NULL),
(8, '__users', 'system', 'Token registration enabled', 'token_reg_enabled', '0', 'boolean', 'system', '2022-09-16 08:31:44', '2022-09-16 06:32:32'),
(9, '__users', 'system', 'Token registration max use count', 'reg_token_max_use_count', '10', 'integer', 'system', '2022-09-16 08:31:44', NULL),
(10, '__users', 'system', 'Learn mode available', 'learn_mode_available', '1', 'boolean', 'system', '2022-09-16 08:31:44', NULL),
(11, '__users', 'system', 'Offers to buy enabled', 'offer_to_buy_enabled', '1', 'boolean', 'system', '2022-09-16 08:31:44', NULL),
(12, '__users', 'system', 'Offers to sell enabled', 'offer_to_sell_enabled', '0', 'boolean', 'system', '2022-09-16 08:31:44', NULL),
(13, '__users', 'system', 'Use development crypto asset engine', 'use_dev_crypto_asset_engine', '0', 'boolean', 'system', '2022-09-16 08:31:44', NULL),
(14, '__users', 'system', 'Use tatum crypto asset engine', 'use_tatum_crypto_asset_engine', '0', 'boolean', 'system', '2022-09-16 08:31:44', NULL),
(15, '__users', 'system', 'Factor of value charged by platform on transactions', 'platform_charge_asset_factor', '0.01', 'float', 'system', '2022-09-16 08:31:44', NULL);

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
(1, 'Cash in person', 'cash_in_person', '5e5d4b', '[\"phone_no\"]', NULL, 'active', 'system', '2022-09-16 08:31:50', NULL, NULL),
(2, 'Stanbic bank', 'stanbic_bank', '066ef3', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-16 08:31:50', NULL, NULL),
(3, 'FNB bank', 'fnb_bank', '009eaa', '[\"account_holder_name\",\"account_no\"]', '[\"ZAR\"]', 'active', 'system', '2022-09-16 08:31:50', NULL, NULL),
(4, 'Mukuru', 'mukuru', 'e77924', '[\"fullname\",\"phone_no\"]', '[\"USD\"]', 'active', 'system', '2022-09-16 08:31:50', NULL, NULL),
(5, 'Algérie Poste', 'algerie_poste', '01009a', '[\"account_holder_name\",\"account_holder_address\",\"account_no\",\"account_key\"]', '[\"DZD\"]', 'active', 'system', '2022-09-16 08:31:50', NULL, NULL),
(6, 'MTN Mobile Money', 'mtn_momo', 'feca05', '[\"fullname\",\"phone_no\"]', NULL, 'active', 'system', '2022-09-16 08:31:50', NULL, NULL),
(7, 'Ecocash', 'ecocash', '005ba4', '[\"fullname\",\"phone_no\"]', '[\"ZWL\"]', 'active', 'system', '2022-09-16 08:31:50', NULL, NULL),
(8, 'Paypal', 'paypal', '27346a', '[\"fullname\",\"email_address\"]', '[\"USD\",\"EUR\",\"GBP\"]', 'active', 'system', '2022-09-16 08:31:50', NULL, NULL),
(9, 'Skrill', 'skrill', '862165', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-16 08:31:50', NULL, NULL),
(10, 'World Remit', 'world_remit', '604684', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-16 08:31:50', NULL, NULL),
(11, 'Mastercard', 'mastercard', 'cc0001', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-16 08:31:50', NULL, NULL),
(12, 'Visa', 'visa', '0055a5', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-16 08:31:50', NULL, NULL),
(13, 'FBC Bank', 'fbc_bank', '0055a5', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-16 08:31:50', NULL, NULL);

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
('1234567890', 'usable', 'system', '2022-09-16 06:32:03');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-16 06:32:00', '2022-09-16 06:32:00', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-16 06:32:02', '2022-09-16 06:32:02', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-16 06:32:03', '2022-09-16 06:32:03', NULL),
(4, 'guddaz', 'active', 'guddaz', '2022-09-16 06:32:57', '2022-09-16 06:32:57', NULL),
(5, 'lodza', 'active', 'lodza', '2022-09-16 06:33:09', '2022-09-16 06:33:09', NULL),
(6, 'ross', 'active', 'ross', '2022-09-16 06:33:31', '2022-09-16 06:33:31', NULL),
(7, 'keith', 'active', 'keith', '2022-09-16 06:33:38', '2022-09-16 06:33:38', NULL),
(8, 'jimmy', 'active', 'jimmy', '2022-09-16 06:33:57', '2022-09-16 06:33:57', NULL),
(9, 'flint', 'active', 'flint', '2022-09-16 06:34:16', '2022-09-16 06:34:16', NULL);

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
('FACTORY_SESSION', 'system', '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'ended', '2022-09-16 08:31:43', NULL, NULL, NULL),
('Ox4KkaZBn9BSZ78h', NULL, '{\"name\":null,\"version\":null}', '{\"name\":\"Ankelli Web App\",\"version\":\"1.0.0\",\"extra\":\"Ankelli Web App\"}', 'empty', '2022-09-16 06:32:17', '2022-09-16 06:32:17', NULL, NULL),
('TEST_SESSION', NULL, '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'active', '2022-09-16 08:31:43', NULL, NULL, NULL);

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
('1014424733E93', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '184.21052631579', '186.05263157895', '0.01', 2800, '15.2', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-16 06:33:59', '2022-09-16 06:33:59', 1, 1, 'completed', 'lodza', 'jimmy', '2022-09-16 06:33:58', '2022-09-16 06:34:02', NULL),
('10549159C6513', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', '2022-09-16 06:34:18', NULL, 1, 1, 'active', 'guddaz', 'flint', '2022-09-16 06:34:18', '2022-09-16 06:34:18', NULL),
('1068751738D12', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'ZMW', '210.52631578947', '212.63157894737', '0.01', 2800, '13.3', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-16 06:33:39', '2022-09-16 06:33:40', 1, 1, 'completed', 'lodza', 'keith', '2022-09-16 06:33:39', '2022-09-16 06:33:43', NULL),
('10705942DCD16', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '162.76041666667', '164.38802083333', '0.01', 2500, '15.36', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-16 06:33:52', '2022-09-16 06:33:53', 1, 1, 'completed', 'flint', 'keith', '2022-09-16 06:33:52', '2022-09-16 06:33:56', NULL),
('10990828E1E14', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '105.26315789474', '106.31578947368', '0.01', 100, '0.95', 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', '2022-09-16 06:33:11', '2022-09-16 06:33:11', 1, 1, 'completed', 'raymond', 'lodza', '2022-09-16 06:33:11', '2022-09-16 06:33:15', NULL),
('1206014AC6CC1', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '265.95744680851', '268.6170212766', '0.01', 250, '0.94', 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', '2022-09-16 06:33:46', '2022-09-16 06:33:46', 1, 1, 'completed', 'peter', 'keith', '2022-09-16 06:33:45', '2022-09-16 06:33:50', NULL),
('124364124345C', 'Italy', NULL, 'buy', 'USDT', 'EUR', '263.15789473684', '265.78947368421', '0.01', 200, '0.76', 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', '2022-09-16 06:34:05', '2022-09-16 06:34:05', 1, 1, 'completed', 'raymond', 'jimmy', '2022-09-16 06:34:05', '2022-09-16 06:34:08', NULL),
('1262810D700CD', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '202.24719101124', '204.26966292135', '0.01', 36000, '178', 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', '2022-09-16 06:34:11', '2022-09-16 06:34:12', 1, 1, 'completed', 'nassim', 'jimmy', '2022-09-16 06:34:11', '2022-09-16 06:34:15', NULL),
('1378157E475D4', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-16 06:33:33', '2022-09-16 06:33:33', 1, 1, 'completed', 'clarence', 'ross', '2022-09-16 06:33:32', '2022-09-16 06:33:36', NULL),
('15835932D42CF', 'Zambia', NULL, 'buy', 'USDT', 'USD', '638.29787234043', '644.68085106383', '0.01', 600, '0.94', 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', '2022-09-16 06:33:25', '2022-09-16 06:33:26', 1, 1, 'completed', 'jimmy', 'lodza', '2022-09-16 06:33:25', '2022-09-16 06:33:30', NULL),
('16831934AC0D6', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '106.3829787234', '107.44680851064', '0.01', 100, '0.94', 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', '2022-09-16 06:33:00', '2022-09-16 06:33:04', 1, 1, 'completed', 'ross', 'guddaz', '2022-09-16 06:32:58', '2022-09-16 06:33:07', NULL),
('171734AF9F897', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '148.93617021277', '150.42553191489', '0.01', 140, '0.94', 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', '2022-09-16 06:33:18', '2022-09-16 06:33:19', 1, 1, 'completed', 'keith', 'lodza', '2022-09-16 06:33:18', '2022-09-16 06:33:22', NULL);

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
('1022840AB52AB', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1378157E475D4\"', 'trade_asset_release', 'ross', 'clarence', 'USDT', '212.76595744681', '[{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":216.3829787234,\"new_usable_balance_asset_value\":3.61702127659,\"old_total_balance_asset_value\":216.3829787234,\"new_total_balance_asset_value\":3.61702127659},{\"user_username\":\"clarence\",\"old_usable_balance_asset_value\":100,\"new_usable_balance_asset_value\":312.76595744681,\"old_total_balance_asset_value\":100,\"new_total_balance_asset_value\":312.76595744681}]', '2022-09-16 06:33:35', NULL),
('10344423149FA', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1206014AC6CC1\"', 'trade_asset_release', 'keith', 'peter', 'USDT', '265.95744680851', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":536.30459126541,\"new_usable_balance_asset_value\":270.3471444569,\"old_total_balance_asset_value\":536.30459126541,\"new_total_balance_asset_value\":270.3471444569},{\"user_username\":\"peter\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":265.95744680851,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":265.95744680851}]', '2022-09-16 06:33:48', NULL),
('105520316ECAD', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"1651132B90355\"', 'deposit_token_topup', 'reserves', 'ross', 'USDT', '110', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":3000,\"new_usable_balance_asset_value\":2890,\"old_total_balance_asset_value\":3000,\"new_total_balance_asset_value\":2890},{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":110,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":110}]', '2022-09-16 06:32:48', NULL),
('106558F8BF560', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"10344423149FA\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.6595744680851', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":270.3471444569,\"new_usable_balance_asset_value\":267.68756998881,\"old_total_balance_asset_value\":270.3471444569,\"new_total_balance_asset_value\":267.68756998881},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1604.221724524,\"new_usable_balance_asset_value\":1606.8812989921,\"old_total_balance_asset_value\":1604.221724524,\"new_total_balance_asset_value\":1606.8812989921}]', '2022-09-16 06:33:49', NULL),
('10784249A26DC', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"177527203BF80\"', 'deposit_token_topup', 'reserves', 'nassim', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1690,\"new_usable_balance_asset_value\":1590,\"old_total_balance_asset_value\":1690,\"new_total_balance_asset_value\":1590},{\"user_username\":\"nassim\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":100,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":100}]', '2022-09-16 06:32:56', NULL),
('108245CEC3032', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"113164EB15F9D\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.0224719101124', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":484.208576066,\"new_usable_balance_asset_value\":482.18610415589,\"old_total_balance_asset_value\":484.208576066,\"new_total_balance_asset_value\":482.18610415589},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1612.9825873694,\"new_usable_balance_asset_value\":1615.0050592795,\"old_total_balance_asset_value\":1612.9825873694,\"new_total_balance_asset_value\":1615.0050592795}]', '2022-09-16 06:34:15', NULL),
('113164EB15F9D', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1262810D700CD\"', 'trade_asset_release', 'jimmy', 'nassim', 'USDT', '202.24719101124', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":686.45576707724,\"new_usable_balance_asset_value\":484.208576066,\"old_total_balance_asset_value\":686.45576707724,\"new_total_balance_asset_value\":484.208576066},{\"user_username\":\"nassim\",\"old_usable_balance_asset_value\":100,\"new_usable_balance_asset_value\":302.24719101124,\"old_total_balance_asset_value\":100,\"new_total_balance_asset_value\":302.24719101124}]', '2022-09-16 06:34:13', NULL),
('11441439CD5BE', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"1965474620984\"', 'deposit_token_topup', 'reserves', 'clarence', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1790,\"new_usable_balance_asset_value\":1690,\"old_total_balance_asset_value\":1790,\"new_total_balance_asset_value\":1690},{\"user_username\":\"clarence\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":100,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":100}]', '2022-09-16 06:32:54', NULL),
('1166865D83228', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"16831934AC0D6\"', 'trade_asset_release', 'guddaz', 'ross', 'USDT', '106.3829787234', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":317.77707867,\"new_usable_balance_asset_value\":211.3940999466,\"old_total_balance_asset_value\":317.77707867,\"new_total_balance_asset_value\":211.3940999466},{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":110,\"new_usable_balance_asset_value\":216.3829787234,\"old_total_balance_asset_value\":110,\"new_total_balance_asset_value\":216.3829787234}]', '2022-09-16 06:33:05', NULL),
('11747144D9692', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"124364124345C\"', 'trade_asset_release', 'jimmy', 'raymond', 'USDT', '263.15789473684', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":952.24524076145,\"new_usable_balance_asset_value\":689.08734602461,\"old_total_balance_asset_value\":952.24524076145,\"new_total_balance_asset_value\":689.08734602461},{\"user_username\":\"raymond\",\"old_usable_balance_asset_value\":105.26315789474,\"new_usable_balance_asset_value\":368.42105263158,\"old_total_balance_asset_value\":105.26315789474,\"new_total_balance_asset_value\":368.42105263158}]', '2022-09-16 06:34:07', NULL),
('1252286D84901', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"19755072DCE6B\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.0526315789474', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":969.36263210526,\"new_usable_balance_asset_value\":968.31000052631,\"old_total_balance_asset_value\":969.36263210526,\"new_total_balance_asset_value\":968.31000052631},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1591.0638297872,\"new_usable_balance_asset_value\":1592.1164613661,\"old_total_balance_asset_value\":1591.0638297872,\"new_total_balance_asset_value\":1592.1164613661}]', '2022-09-16 06:33:15', NULL),
('1317404A07968', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"10549159C6513\"', 'trade_asset_release', 'flint', 'guddaz', 'USDT', '212.76595744681', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":562.76041666667,\"new_usable_balance_asset_value\":349.99445921986,\"old_total_balance_asset_value\":562.76041666667,\"new_total_balance_asset_value\":349.99445921986},{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":210.33027015937,\"new_usable_balance_asset_value\":423.09622760618,\"old_total_balance_asset_value\":210.33027015937,\"new_total_balance_asset_value\":423.09622760618}]', '2022-09-16 06:34:20', NULL),
('133004B8C2658', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"1022840AB52AB\"', 'platform_charge', 'ross', 'reserves', 'USDT', '2.1276595744681', '[{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":3.61702127659,\"new_usable_balance_asset_value\":1.4893617021219,\"old_total_balance_asset_value\":3.61702127659,\"new_total_balance_asset_value\":1.4893617021219},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1599.9888017916,\"new_usable_balance_asset_value\":1602.1164613661,\"old_total_balance_asset_value\":1599.9888017916,\"new_total_balance_asset_value\":1602.1164613661}]', '2022-09-16 06:33:36', NULL),
('1438207F4402A', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"17418117DC4DA\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.1052631578947', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":538.4098544233,\"new_usable_balance_asset_value\":536.30459126541,\"old_total_balance_asset_value\":538.4098544233,\"new_total_balance_asset_value\":536.30459126541},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1602.1164613661,\"new_usable_balance_asset_value\":1604.221724524,\"old_total_balance_asset_value\":1602.1164613661,\"new_total_balance_asset_value\":1604.221724524}]', '2022-09-16 06:33:43', NULL),
('1456750C17156', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"176631CA7266B\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.4893617021277', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":819.37383031354,\"new_usable_balance_asset_value\":817.88446861141,\"old_total_balance_asset_value\":819.37383031354,\"new_total_balance_asset_value\":817.88446861141},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1592.1164613661,\"new_usable_balance_asset_value\":1593.6058230682,\"old_total_balance_asset_value\":1592.1164613661,\"new_total_balance_asset_value\":1593.6058230682}]', '2022-09-16 06:33:22', NULL),
('1505871639C16', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1014424733E93\"', 'trade_asset_release', 'jimmy', 'lodza', 'USDT', '184.21052631579', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":1138.2978723404,\"new_usable_balance_asset_value\":954.08734602461,\"old_total_balance_asset_value\":1138.2978723404,\"new_total_balance_asset_value\":954.08734602461},{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":383.72993333705,\"new_usable_balance_asset_value\":567.94045965284,\"old_total_balance_asset_value\":383.72993333705,\"new_total_balance_asset_value\":567.94045965284}]', '2022-09-16 06:34:01', NULL),
('1514523FD3A49', 'onchain', '62BD544D1B9031EFC330A3E855CC3A0D51CA5131455C1AB3BCAC6D243F65460D', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '218.87587867', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":218.87587867,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":218.87587867}]', '2022-09-16 06:32:41', NULL),
('153552638E82A', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"1342184DAFF72\"', 'deposit_token_topup', 'reserves', 'jimmy', 'USDT', '500', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2290,\"new_usable_balance_asset_value\":1790,\"old_total_balance_asset_value\":2290,\"new_total_balance_asset_value\":1790},{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":500,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":500}]', '2022-09-16 06:32:52', NULL),
('1539703C28BEC', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"1166865D83228\"', 'platform_charge', 'guddaz', 'reserves', 'USDT', '1.063829787234', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":211.3940999466,\"new_usable_balance_asset_value\":210.33027015937,\"old_total_balance_asset_value\":211.3940999466,\"new_total_balance_asset_value\":210.33027015937},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1590,\"new_usable_balance_asset_value\":1591.0638297872,\"old_total_balance_asset_value\":1590,\"new_total_balance_asset_value\":1591.0638297872}]', '2022-09-16 06:33:07', NULL),
('154829986A86B', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Exodus wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '98.9012', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":218.87587867,\"new_usable_balance_asset_value\":317.77707867,\"old_total_balance_asset_value\":218.87587867,\"new_total_balance_asset_value\":317.77707867}]', '2022-09-16 06:32:46', NULL),
('15696155C5482', 'onchain', '62BD544D1B9031EFC330A3E855CC3A0D51CA5131455C1AB3BCAC6D243F65460D', NULL, 'TEST_SESSION', 'Transfer from Ledger wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '967.86579', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":967.86579,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":967.86579}]', '2022-09-16 06:32:43', NULL),
('157197C5AA6E4', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"191497DA156FA\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '6.3829787234043', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":179.58659627098,\"new_usable_balance_asset_value\":173.20361754758,\"old_total_balance_asset_value\":179.58659627098,\"new_total_balance_asset_value\":173.20361754758},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1593.6058230682,\"new_usable_balance_asset_value\":1599.9888017916,\"old_total_balance_asset_value\":1593.6058230682,\"new_total_balance_asset_value\":1599.9888017916}]', '2022-09-16 06:33:29', NULL),
('163675D04DCF2', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"10705942DCD16\"', 'trade_asset_release', 'keith', 'flint', 'USDT', '162.76041666667', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":267.68756998881,\"new_usable_balance_asset_value\":104.92715332214,\"old_total_balance_asset_value\":267.68756998881,\"new_total_balance_asset_value\":104.92715332214},{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":400,\"new_usable_balance_asset_value\":562.76041666667,\"old_total_balance_asset_value\":400,\"new_total_balance_asset_value\":562.76041666667}]', '2022-09-16 06:33:54', NULL),
('16414228DD99A', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"11747144D9692\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.6315789473684', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":689.08734602461,\"new_usable_balance_asset_value\":686.45576707724,\"old_total_balance_asset_value\":689.08734602461,\"new_total_balance_asset_value\":686.45576707724},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1610.351008422,\"new_usable_balance_asset_value\":1612.9825873694,\"old_total_balance_asset_value\":1610.351008422,\"new_total_balance_asset_value\":1612.9825873694}]', '2022-09-16 06:34:08', NULL),
('164668357A1F3', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"1505871639C16\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '1.8421052631579', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":954.08734602461,\"new_usable_balance_asset_value\":952.24524076145,\"old_total_balance_asset_value\":954.08734602461,\"new_total_balance_asset_value\":952.24524076145},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1608.5089031588,\"new_usable_balance_asset_value\":1610.351008422,\"old_total_balance_asset_value\":1608.5089031588,\"new_total_balance_asset_value\":1610.351008422}]', '2022-09-16 06:34:02', NULL),
('17418117DC4DA', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1068751738D12\"', 'trade_asset_release', 'keith', 'lodza', 'USDT', '210.52631578947', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":748.93617021277,\"new_usable_balance_asset_value\":538.4098544233,\"old_total_balance_asset_value\":748.93617021277,\"new_total_balance_asset_value\":538.4098544233},{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":173.20361754758,\"new_usable_balance_asset_value\":383.72993333705,\"old_total_balance_asset_value\":173.20361754758,\"new_total_balance_asset_value\":383.72993333705}]', '2022-09-16 06:33:41', NULL),
('176631CA7266B', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"171734AF9F897\"', 'trade_asset_release', 'lodza', 'keith', 'USDT', '148.93617021277', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":968.31000052631,\"new_usable_balance_asset_value\":819.37383031354,\"old_total_balance_asset_value\":968.31000052631,\"new_total_balance_asset_value\":819.37383031354},{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":600,\"new_usable_balance_asset_value\":748.93617021277,\"old_total_balance_asset_value\":600,\"new_total_balance_asset_value\":748.93617021277}]', '2022-09-16 06:33:21', NULL),
('1827751CEF009', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '106.76', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":967.86579,\"new_usable_balance_asset_value\":1074.62579,\"old_total_balance_asset_value\":967.86579,\"new_total_balance_asset_value\":1074.62579}]', '2022-09-16 06:32:47', NULL),
('184737108D19F', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli Reserves Wallet.', 'internalisation', NULL, 'reserves', 'USDT', '3000', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":3000,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":3000}]', '2022-09-16 06:32:40', NULL),
('191497DA156FA', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"15835932D42CF\"', 'trade_asset_release', 'lodza', 'jimmy', 'USDT', '638.29787234043', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":817.88446861141,\"new_usable_balance_asset_value\":179.58659627098,\"old_total_balance_asset_value\":817.88446861141,\"new_total_balance_asset_value\":179.58659627098},{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":500,\"new_usable_balance_asset_value\":1138.2978723404,\"old_total_balance_asset_value\":500,\"new_total_balance_asset_value\":1138.2978723404}]', '2022-09-16 06:33:27', NULL),
('191750E927422', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"15026706508BB\"', 'deposit_token_topup', 'reserves', 'keith', 'USDT', '600', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2890,\"new_usable_balance_asset_value\":2290,\"old_total_balance_asset_value\":2890,\"new_total_balance_asset_value\":2290},{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":600,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":600}]', '2022-09-16 06:32:50', NULL),
('1922933166EE9', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"163675D04DCF2\"', 'platform_charge', 'keith', 'reserves', 'USDT', '1.6276041666667', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":104.92715332214,\"new_usable_balance_asset_value\":103.29954915547,\"old_total_balance_asset_value\":104.92715332214,\"new_total_balance_asset_value\":103.29954915547},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1606.8812989921,\"new_usable_balance_asset_value\":1608.5089031588,\"old_total_balance_asset_value\":1606.8812989921,\"new_total_balance_asset_value\":1608.5089031588}]', '2022-09-16 06:33:56', NULL),
('19755072DCE6B', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"10990828E1E14\"', 'trade_asset_release', 'lodza', 'raymond', 'USDT', '105.26315789474', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":1074.62579,\"new_usable_balance_asset_value\":969.36263210526,\"old_total_balance_asset_value\":1074.62579,\"new_total_balance_asset_value\":969.36263210526},{\"user_username\":\"raymond\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":105.26315789474,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":105.26315789474}]', '2022-09-16 06:33:13', NULL),
('1991606449181', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'flint', 'USDT', '400', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":400,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":400}]', '2022-09-16 06:32:44', NULL);

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
(1, 'system', 'system', '', NULL, NULL, NULL, 'active', '2022-09-16 08:31:37', NULL, NULL),
(2, 'developer', 'developer.ankelli@gmail.com', '$2y$10$9yjN2UkqtTf0fpXT3byjBeOZpC.XvgqzZkljqmTNGaagkZvMeVPtW', NULL, NULL, NULL, 'active', '2022-09-16 06:31:59', '2022-09-16 06:31:59', NULL),
(3, 'sysadmin', 'sysadmin@ankelli.com', '$2y$10$tZf2gnHhY14VliIoMIi11.HmdwnVpMgAEnBVawCRCNOX15yj53nCW', NULL, NULL, NULL, 'active', '2022-09-16 06:32:00', '2022-09-16 06:32:00', NULL),
(4, 'reserves', 'reserves@ankelli.com', '$2y$10$pSLTjMLothC54qhaiDrUFee7gQA0TV/0bfq5g2bIHG65ev6WPOulC', NULL, NULL, NULL, 'active', '2022-09-16 06:32:01', '2022-09-16 06:32:01', NULL),
(5, 'busadmin', 'busadmin@ankelli.com', '$2y$10$ovwx4.e6UkFChd.8rnyhgOTDp6lAWg3ghLk79EHUIU0IMjSXEfNVS', NULL, NULL, NULL, 'active', '2022-09-16 06:32:02', '2022-09-16 06:32:02', NULL),
(6, 'guddaz', 'goodhopedhliwayo@gmail.com', '$2y$10$jaz.S9m/EvdwV2t1yEsiTeRU0t8e0V6UQQEO0v0fckTupWld0w4n6', NULL, NULL, NULL, 'active', '2022-09-16 06:32:32', '2022-09-16 06:32:32', NULL),
(7, 'lodza', 'lodza@example.com', '$2y$10$doxsJiLPkoWq1fAEKqc/DeWpNU.wdhRVZwZ4o7kPzkVwSqY/w/Q6i', NULL, NULL, NULL, 'active', '2022-09-16 06:32:33', '2022-09-16 06:32:33', NULL),
(8, 'ross', 'ross@example.com', '$2y$10$3Q7HSTB863WRDgFHXeucQ.ARXwKMDdcIWExrF6mDX/pOKGoCo1Pr6', NULL, NULL, NULL, 'active', '2022-09-16 06:32:34', '2022-09-16 06:32:34', NULL),
(9, 'jimmy', 'jimmy@example.com', '$2y$10$W00kvykZ/jQMdgl6YVwnHu.TBVTAcFDEsfH8s1VyWa/zrlSXlpPUC', NULL, NULL, NULL, 'active', '2022-09-16 06:32:35', '2022-09-16 06:32:35', NULL),
(10, 'keith', 'keith@example.com', '$2y$10$.FMGNYZqgiusvRiEb/Jjsu5exzRMdKLGs1pwauTfYDOR8Lnl1EZH.', NULL, NULL, NULL, 'active', '2022-09-16 06:32:35', '2022-09-16 06:32:35', NULL),
(11, 'peter', 'peter@example.com', '$2y$10$dQSeVUglrH3cLGZxlXB73O4vB/BzOqYta9oM5PyIF0Jws8Q7Omk2e', NULL, NULL, NULL, 'active', '2022-09-16 06:32:36', '2022-09-16 06:32:36', NULL),
(12, 'flint', 'flint@example.com', '$2y$10$cAy/DbWQmqRXt7gbmz5IpOjBqu9qXIoDxSlC7Ohz2ihyvsMM3uLDW', NULL, NULL, NULL, 'active', '2022-09-16 06:32:37', '2022-09-16 06:32:37', NULL),
(13, 'clarence', 'clarence@example.com', '$2y$10$4CIlh4Pwb6WbhQn8cAYVqu/2DnrQYEMz4eElJw4A2oh8ALfgmzLdq', NULL, NULL, NULL, 'active', '2022-09-16 06:32:38', '2022-09-16 06:32:38', NULL),
(14, 'raymond', 'raymond@example.com', '$2y$10$DGqYniaJsURw.u6AbkEggu83pslZhnKqcMe1KX4eyPDzvz2sknq9m', NULL, NULL, NULL, 'active', '2022-09-16 06:32:38', '2022-09-16 06:32:38', NULL),
(15, 'nassim', 'nassim@example.com', '$2y$10$s2rSdc2U.v9nsj3H4Oafnug1R1LnhFu6kbTGNDRPLN7zJhYgQb6nW', NULL, NULL, NULL, 'active', '2022-09-16 06:32:39', '2022-09-16 06:32:39', NULL);

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
(1, 'Default Users', 'default_users', 'Group for Default User accounts created on system initialization and factory_data loading. \nNew users cannot be added to this group.', 'active', 'system', '2022-09-16 08:31:41', NULL, NULL),
(2, 'Administrators', 'administrators', 'Automatically joined group (Users with active Admin Extension). \nMembers can be added to other admin groups.', 'active', 'system', '2022-09-16 08:31:41', NULL, NULL),
(3, 'Developers', 'developers', 'Admin group for unrestricted system users. \nMembers have access to all features and OTP access to account named \"developer\". \nOnly \"developer\" account can add members to this group.\nGroup used for System Development and Maintenance.', 'active', 'system', '2022-09-16 08:31:41', NULL, NULL),
(4, 'System Administrators', 'system_administrators', 'Admin Group for System Administrators. \nMembers can manage system functions and sysconfig params. \nMembers have OTP access to account named \"sysadmin\".\nOnly \"sysadmin\" account can add members to this group.', 'active', 'system', '2022-09-16 08:31:41', NULL, NULL),
(5, 'Business Administrators', 'business_administrators', 'Admin group for Business Administrators.\nMembers have access to business related features.\nMembers have OTP access to accounts named \"reserves\" and \"busadmin\".\nOnly \"busadmin\" account can add members to this group.', 'active', 'system', '2022-09-16 08:31:41', NULL, NULL),
(6, 'User Administrators', 'user_administrators', 'Admin group for User Administrators. \nMembers can manage other users and user related queries.', 'active', 'system', '2022-09-16 08:31:41', NULL, NULL),
(7, 'Platform moderators', 'platform_moderators', 'Group for Platform moderators. \nMembers can respond in the customer service chat module, handle flagged business elements, manage daily updates.', 'active', 'system', '2022-09-16 08:31:41', NULL, NULL),
(8, 'Sellers', 'sellers', 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.', 'active', 'system', '2022-09-16 08:31:41', NULL, NULL),
(9, 'Buyers', 'buyers', 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.', 'active', 'system', '2022-09-16 08:31:41', NULL, NULL),
(10, 'Beta Testers', 'beta_testers', 'User Group for selected individuals to test certain features before they are published.', 'active', 'system', '2022-09-16 08:31:41', NULL, NULL);

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
(1, 'developer', 'default_users', 'active', 'system', '2022-09-16 06:31:59', '2022-09-16 06:31:59'),
(2, 'developer', 'developers', 'active', 'system', '2022-09-16 06:31:59', '2022-09-16 06:31:59'),
(3, 'sysadmin', 'default_users', 'active', 'system', '2022-09-16 06:32:00', '2022-09-16 06:32:00'),
(4, 'sysadmin', 'system_administrators', 'active', 'system', '2022-09-16 06:32:00', '2022-09-16 06:32:00'),
(5, 'reserves', 'default_users', 'active', 'system', '2022-09-16 06:32:01', '2022-09-16 06:32:01'),
(6, 'reserves', 'business_administrators', 'active', 'system', '2022-09-16 06:32:02', '2022-09-16 06:32:02'),
(7, 'busadmin', 'default_users', 'active', 'system', '2022-09-16 06:32:02', '2022-09-16 06:32:02'),
(8, 'busadmin', 'business_administrators', 'active', 'system', '2022-09-16 06:32:03', '2022-09-16 06:32:03'),
(9, 'guddaz', 'developers', 'active', 'system', '2022-09-16 06:32:33', '2022-09-16 06:32:33'),
(10, 'lodza', 'system_administrators', 'active', 'system', '2022-09-16 06:32:34', '2022-09-16 06:32:34'),
(11, 'lodza', 'user_administrators', 'active', 'system', '2022-09-16 06:32:34', '2022-09-16 06:32:34'),
(12, 'lodza', 'business_administrators', 'active', 'system', '2022-09-16 06:32:34', '2022-09-16 06:32:34');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

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
