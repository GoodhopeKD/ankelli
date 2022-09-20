-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 17, 2022 at 07:37 AM
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
(329, '2014_10_12_000000_create_users_table', 1),
(330, '2014_10_12_100000_create_password_resets_table', 1),
(331, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(332, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(333, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(334, '2016_06_01_000004_create_oauth_clients_table', 1),
(335, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(336, '2019_08_19_000000_create_failed_jobs_table', 1),
(337, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(338, '2022_07_26_072110_create___admin_extensions_table', 1),
(339, '2022_07_26_072112_create___buyer_extensions_table', 1),
(340, '2022_07_26_072114_create___seller_extensions_table', 1),
(341, '2022_07_26_072120_create___user_groups_table', 1),
(342, '2022_07_26_072122_create___user_group_memberships_table', 1),
(343, '2022_07_26_072124_create___permissions_table', 1),
(344, '2022_07_26_072126_create___permission_instances_table', 1),
(345, '2022_07_26_072130_create___sessions_table', 1),
(346, '2022_07_26_072131_create___notifications_table', 1),
(347, '2022_07_26_072132_create___pref_items_table', 1),
(348, '2022_07_26_072135_create___reg_tokens_table', 1),
(349, '2022_07_26_072136_create___verif_tokens_table', 1),
(350, '2022_07_26_072137_create___email_addresses_table', 1),
(351, '2022_07_26_072140_create___phone_nos_table', 1),
(352, '2022_07_26_072324_create___files_table', 1),
(353, '2022_07_26_072326_create___feedback_reports_table', 1),
(354, '2022_07_26_072327_create___posts_table', 1),
(355, '2022_07_26_072332_create___assets_table', 1),
(356, '2022_07_26_072333_create___asset_accounts_table', 1),
(357, '2022_07_26_072334_create___asset_account_addresses_table', 1),
(358, '2022_07_26_072336_create___currencies_table', 1),
(359, '2022_07_26_072337_create___pymt_methods_table', 1),
(360, '2022_07_26_072345_create___countries_table', 1),
(361, '2022_07_26_072347_create___exportables_table', 1),
(362, '2022_07_26_072410_create___deposit_tokens_table', 1),
(363, '2022_07_26_072416_create___offers_table', 1),
(364, '2022_07_26_072417_create___trades_table', 1),
(365, '2022_07_26_072419_create___chats_table', 1),
(366, '2022_07_26_072420_create___messages_table', 1),
(367, '2022_07_26_072421_create___pinnings_table', 1),
(368, '2022_07_26_072443_create___transactions_table', 1),
(369, '2022_07_26_072444_create___logs_table', 1);

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
(1, NULL, 'Ankelli Personal Access Client', 'WNheX0UpskJGnbA897DIoJp4NSt9ejohLnG6wGhU', NULL, 'http://localhost', 1, 0, 0, '2022-09-17 03:34:17', '2022-09-17 03:34:17'),
(2, NULL, 'Ankelli Password Grant Client', 'XLHZ7WXGfJggb41Q3wiccgKPHHMGz2dZGbV3krvz', 'users', 'http://localhost', 0, 1, 0, '2022-09-17 03:34:17', '2022-09-17 03:34:17');

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
(1, 1, '2022-09-17 03:34:17', '2022-09-17 03:34:17');

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
(1, 'system', 'System', 'active', 'system', '2022-09-17 05:34:09', NULL, NULL),
(2, 'developer', 'Default Developer', 'active', 'system', '2022-09-17 03:34:13', '2022-09-17 03:34:13', NULL),
(3, 'sysadmin', 'Default System Administrator', 'active', 'system', '2022-09-17 03:34:14', '2022-09-17 03:34:14', NULL),
(4, 'reserves', 'Ankelli Asset Reserves', 'active', 'system', '2022-09-17 03:34:15', '2022-09-17 03:34:15', NULL),
(5, 'busadmin', 'Default Business Administrator', 'active', 'system', '2022-09-17 03:34:16', '2022-09-17 03:34:16', NULL),
(6, 'guddaz', 'Head System Developer', 'active', 'system', '2022-09-17 03:34:59', '2022-09-17 03:34:59', NULL),
(7, 'lodza', 'Head Business Administrator', 'active', 'system', '2022-09-17 03:35:00', '2022-09-17 03:35:00', NULL);

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
(1, NULL, NULL, 'Tether USD', 'USDT', '0.0001', 'active', 'system', '2022-09-17 03:34:12', '2022-09-17 03:34:12');

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
(1, NULL, 'reserves', 'USDT', '1619.1915423834', '1619.1915423834', 'active', '2022-09-17 03:34:15', '2022-09-17 03:36:48'),
(2, NULL, 'guddaz', 'USDT', '423.09622760618', '423.09622760618', 'active', '2022-09-17 03:35:07', '2022-09-17 03:36:40'),
(3, NULL, 'lodza', 'USDT', '567.94045965284', '567.94045965284', 'active', '2022-09-17 03:35:08', '2022-09-17 03:36:21'),
(4, NULL, 'flint', 'USDT', '139.9256231748', '139.9256231748', 'active', '2022-09-17 03:35:09', '2022-09-17 03:36:48'),
(5, NULL, 'ross', 'USDT', '1.4893617021219', '1.4893617021219', 'active', '2022-09-17 03:35:13', '2022-09-17 03:35:56'),
(6, NULL, 'keith', 'USDT', '103.29954915547', '103.29954915547', 'active', '2022-09-17 03:35:15', '2022-09-17 03:36:16'),
(7, NULL, 'jimmy', 'USDT', '482.18610415589', '482.18610415589', 'active', '2022-09-17 03:35:17', '2022-09-17 03:36:35'),
(8, NULL, 'clarence', 'USDT', '312.76595744681', '312.76595744681', 'active', '2022-09-17 03:35:18', '2022-09-17 03:35:55'),
(9, NULL, 'nassim', 'USDT', '302.24719101124', '302.24719101124', 'active', '2022-09-17 03:35:20', '2022-09-17 03:36:34'),
(10, NULL, 'raymond', 'USDT', '368.42105263158', '368.42105263158', 'active', '2022-09-17 03:35:35', '2022-09-17 03:36:28'),
(11, NULL, 'peter', 'USDT', '471.83979974969', '471.83979974969', 'active', '2022-09-17 03:36:08', '2022-09-17 03:36:46');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-17 03:34:14', '2022-09-17 03:34:14', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-17 03:34:15', '2022-09-17 03:34:15', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-17 03:34:16', '2022-09-17 03:34:16', NULL),
(4, 'ross', 'active', 'guddaz', '2022-09-17 03:35:21', '2022-09-17 03:35:21', NULL),
(5, 'raymond', 'active', 'lodza', '2022-09-17 03:35:32', '2022-09-17 03:35:32', NULL),
(6, 'keith', 'active', 'lodza', '2022-09-17 03:35:39', '2022-09-17 03:35:39', NULL),
(7, 'jimmy', 'active', 'lodza', '2022-09-17 03:35:45', '2022-09-17 03:35:45', NULL),
(8, 'clarence', 'active', 'ross', '2022-09-17 03:35:51', '2022-09-17 03:35:51', NULL),
(9, 'lodza', 'active', 'keith', '2022-09-17 03:35:58', '2022-09-17 03:35:58', NULL),
(10, 'peter', 'active', 'keith', '2022-09-17 03:36:04', '2022-09-17 03:36:04', NULL),
(11, 'flint', 'active', 'keith', '2022-09-17 03:36:11', '2022-09-17 03:36:11', NULL),
(12, 'nassim', 'active', 'jimmy', '2022-09-17 03:36:30', '2022-09-17 03:36:30', NULL),
(13, 'guddaz', 'active', 'flint', '2022-09-17 03:36:37', '2022-09-17 03:36:37', NULL);

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
(1, 'Zimbabwe', 'ZIM', NULL, NULL, NULL, 'active', 'system', '2022-09-17 05:34:11', NULL),
(2, 'South Africa', 'RSA', NULL, NULL, NULL, 'active', 'system', '2022-09-17 05:34:11', NULL),
(3, 'United Kingdom', 'UK', NULL, NULL, NULL, 'active', 'system', '2022-09-17 05:34:11', NULL),
(4, 'United States of America', 'USA', NULL, NULL, NULL, 'active', 'system', '2022-09-17 05:34:11', NULL),
(5, 'Russia', 'RUS', NULL, NULL, NULL, 'active', 'system', '2022-09-17 05:34:11', NULL),
(6, 'China', 'CHN', NULL, NULL, NULL, 'active', 'system', '2022-09-17 05:34:11', NULL),
(7, 'Ghana', 'GHA', NULL, NULL, NULL, 'active', 'system', '2022-09-17 05:34:11', NULL),
(8, 'Botswana', 'BOT', NULL, NULL, NULL, 'active', 'system', '2022-09-17 05:34:11', NULL),
(9, 'Zambia', 'ZAM', NULL, NULL, NULL, 'active', 'system', '2022-09-17 05:34:11', NULL),
(10, 'Algeria', 'ALG', NULL, NULL, NULL, 'active', 'system', '2022-09-17 05:34:11', NULL),
(11, 'Italy', 'ITA', NULL, NULL, NULL, 'active', 'system', '2022-09-17 05:34:11', NULL),
(12, 'Nigeria', 'NIG', NULL, NULL, NULL, 'active', 'system', '2022-09-17 05:34:11', NULL);

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
(1, 'US Dollar', 'USD', '$', 1, '1', '10', '5', 'active', 'system', '2022-09-17 05:34:11', NULL),
(2, 'Euro', 'EUR', '€', 1, '0.87', '10', '5', 'active', 'system', '2022-09-17 05:34:11', NULL),
(3, 'Pound Sterling', 'GBP', '£', 1, '0.77', '10', '5', 'active', 'system', '2022-09-17 05:34:11', NULL),
(4, 'South African Rand', 'ZAR', 'R', 0, '16', '100', '100', 'active', 'system', '2022-09-17 05:34:11', NULL),
(5, 'Zambian Kwacha', 'ZMW', 'K', 0, '15', '100', '100', 'active', 'system', '2022-09-17 05:34:11', NULL),
(6, 'Algerian Dinar', 'DZD', 'DA', 0, '180', '100', '100', 'active', 'system', '2022-09-17 05:34:11', NULL),
(7, 'Zimbabwean Dollar', 'ZWL', '$', 1, '10000', '500', '5000', 'active', 'system', '2022-09-17 05:34:11', NULL);

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
('1160710644605', 'USDT', '100', 'DZD', 18000, 'lodza', '2022-09-17 03:35:19', 'nassim', '2022-09-17 03:35:20'),
('147079F9A7C3C', 'USDT', '100', 'EUR', 93, 'lodza', '2022-09-17 03:35:18', 'clarence', '2022-09-17 03:35:18'),
('1803936AC4D50', 'USDT', '110', 'USD', 111, 'lodza', '2022-09-17 03:35:13', 'ross', '2022-09-17 03:35:13'),
('190466C418F93', 'USDT', '600', 'USD', 601, 'lodza', '2022-09-17 03:35:15', 'keith', '2022-09-17 03:35:15'),
('19501377BAA63', 'USDT', '500', 'USD', 501, 'lodza', '2022-09-17 03:35:16', 'jimmy', '2022-09-17 03:35:16');

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
(1, 'developer.ankelli@gmail.com', 'developer', '2022-09-17 03:34:13', NULL),
(2, 'sysadmin@ankelli.com', 'sysadmin', '2022-09-17 03:34:14', NULL),
(3, 'reserves@ankelli.com', 'reserves', '2022-09-17 03:34:15', NULL),
(4, 'busadmin@ankelli.com', 'busadmin', '2022-09-17 03:34:16', NULL),
(5, 'goodhopedhliwayo@gmail.com', 'guddaz', '2022-09-17 03:34:59', NULL),
(6, 'lodza@example.com', 'lodza', '2022-09-17 03:35:00', NULL),
(7, 'ross@example.com', 'ross', '2022-09-17 03:35:01', NULL),
(8, 'jimmy@example.com', 'jimmy', '2022-09-17 03:35:02', NULL),
(9, 'keith@example.com', 'keith', '2022-09-17 03:35:02', NULL),
(10, 'peter@example.com', 'peter', '2022-09-17 03:35:03', NULL),
(11, 'flint@example.com', 'flint', '2022-09-17 03:35:04', NULL),
(12, 'clarence@example.com', 'clarence', '2022-09-17 03:35:04', NULL),
(13, 'raymond@example.com', 'raymond', '2022-09-17 03:35:05', NULL),
(14, 'nassim@example.com', 'nassim', '2022-09-17 03:35:05', NULL);

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
(1, '__pymt_methods', 'cash_in_person', 'images', 'pymt_method_icon', 'Cash in person', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Cash in person.jpg', 'image/jpg', NULL, 'Cash in person.jpg', NULL, 'system', '2022-09-17 03:34:10', NULL),
(2, '__pymt_methods', 'stanbic_bank', 'images', 'pymt_method_icon', 'Stanbic Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Stanbic bank.jpg', 'image/jpg', NULL, 'Stanbic Bank Icon.jpg', NULL, 'system', '2022-09-17 03:34:10', NULL),
(3, '__pymt_methods', 'fnb_bank', 'images', 'pymt_method_icon', 'FNB Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FNB bank.png', 'image/png', NULL, 'FNB Bank Icon.png', NULL, 'system', '2022-09-17 03:34:10', NULL),
(4, '__pymt_methods', 'mukuru', 'images', 'pymt_method_icon', 'Mukuru Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mukuru.jpg', 'image/jpg', NULL, 'Mukuru Icon.jpg', NULL, 'system', '2022-09-17 03:34:10', NULL),
(5, '__pymt_methods', 'algerie_poste', 'images', 'pymt_method_icon', 'Algerie poste Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Algerie poste.jpg', 'image/jpg', NULL, 'Algerie poste Icon.jpg', NULL, 'system', '2022-09-17 03:34:10', NULL),
(6, '__pymt_methods', 'mtn_momo', 'images', 'pymt_method_icon', 'MTN MOMO Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/MTN MOMO.png', 'image/png', NULL, 'MTN MOMO Icon.png', NULL, 'system', '2022-09-17 03:34:10', NULL),
(7, '__pymt_methods', 'ecocash', 'images', 'pymt_method_icon', 'Ecocash Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Ecocash.png', 'image/png', NULL, 'Ecocash Icon.png', NULL, 'system', '2022-09-17 03:34:10', NULL),
(8, '__pymt_methods', 'paypal', 'images', 'pymt_method_icon', 'Paypal Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Paypal.png', 'image/png', NULL, 'Paypal Icon.png', NULL, 'system', '2022-09-17 03:34:10', NULL),
(9, '__pymt_methods', 'skrill', 'images', 'pymt_method_icon', 'Skrill Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Skrill.jpg', 'image/jpg', NULL, 'Skrill Icon.jpg', NULL, 'system', '2022-09-17 03:34:10', NULL),
(10, '__pymt_methods', 'world_remit', 'images', 'pymt_method_icon', 'World Remit Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/World Remit.png', 'image/png', NULL, 'World Remit Icon.png', NULL, 'system', '2022-09-17 03:34:10', NULL),
(11, '__pymt_methods', 'mastercard', 'images', 'pymt_method_icon', 'Mastercard Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mastercard.jpeg', 'image/jpeg', NULL, 'Mastercard Icon.jpeg', NULL, 'system', '2022-09-17 03:34:10', NULL),
(12, '__pymt_methods', 'visa', 'images', 'pymt_method_icon', 'Visa Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Visa.jpg', 'image/jpg', NULL, 'Visa Icon.jpg', NULL, 'system', '2022-09-17 03:34:10', NULL),
(13, '__pymt_methods', 'fbc_bank', 'images', 'pymt_method_icon', 'FBC bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FBC bank.jpg', 'image/jpg', NULL, 'FBC bank Icon.jpg', NULL, 'system', '2022-09-17 03:34:10', NULL);

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
('0f34j0v1D2Cq0R5c', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-17 03:36:00', NULL, NULL, '__trades', '143249D28E91D', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:59\"}]', '{\"ip\":\"127.0.0.1\"}'),
('0h6OOLngjPW0jbsT', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'nassim', '2022-09-17 03:36:36', NULL, NULL, '__trades', '111361CCCD2B4', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:32\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('0koKzH2hhSs0Dc84', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-17 03:36:16', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1606.8812989921,\"new_value\":1608.5089031588},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1606.8812989921,\"new_value\":1608.5089031588}]', '{\"ip\":\"127.0.0.1\"}'),
('0mP3W0FiEiGrFUJC', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:35:50', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":179.58659627098,\"new_value\":173.20361754758},{\"field_name\":\"total_balance_asset_value\",\"old_value\":179.58659627098,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('0MY9RWHbZDo2QnuT', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'peter', '2022-09-17 03:36:48', NULL, NULL, '__trades', '11976069C8145', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"peter\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:45\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('0P5J9SPfuGKmEjQi', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-17 03:35:00', NULL, NULL, '__admin_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('0qHJguCwIxoox79Y', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:35:02', NULL, '12445379A93AD', '__email_addresses', 'jimmy@example.com', NULL, NULL),
('19QGEi7LYSCk3R54', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:44', NULL, NULL, '__messages', '10254692C990E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('1FZMIA44SzviDQmv', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:35:03', NULL, '1741323000734', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('1HTCyaPuDAqSkIZ5', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-17 03:35:30', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1590,\"new_value\":1591.0638297872},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1590,\"new_value\":1591.0638297872}]', '{\"ip\":\"127.0.0.1\"}'),
('1j42m5OYwteDaNPB', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-17 03:36:33', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":482.18610415589,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('1jFyx8JNDojOBNux', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:23', NULL, NULL, '__messages', '130827985B59B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('1vtBXCA4aX9PqXMb', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-17 03:35:43', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1592.1164613661,\"new_value\":1593.6058230682},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1592.1164613661,\"new_value\":1593.6058230682}]', '{\"ip\":\"127.0.0.1\"}'),
('1XhONdKMkNCov4qg', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:35:05', NULL, '144240F211E7B', '__notifications', '1795309F32117', NULL, NULL),
('21nVtyPO130jaAkF', 'FACTORY_SESSION', 'Temporarily disabling for factory users.', 'entry_update', 'system', '2022-09-17 03:34:13', NULL, NULL, '__pref_items', '8', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for factory users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('22YkIP01zD0bKpK0', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:36:32', NULL, NULL, '__trades', '111361CCCD2B4', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:32\"}]', '{\"ip\":\"127.0.0.1\"}'),
('2dvcT8L1fRpJWWDU', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-17 03:35:34', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":968.31000052632,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}'),
('2gc7iJMnQiic4Pds', 'FACTORY_SESSION', 'Resetting to default value.', 'entry_update', 'system', '2022-09-17 03:34:17', NULL, NULL, '__pref_items', '8', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Resetting to default value.\"},{\"field_name\":\"value\",\"old_value\":\"0\",\"new_value\":true}]', '{\"ip\":\"127.0.0.1\"}'),
('2mRjfDqITKhnqFcm', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-17 03:35:20', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1690,\"new_value\":1590},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1690,\"new_value\":1590}]', '{\"ip\":\"127.0.0.1\"}'),
('2pK6dto2bO2YRc5s', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:39', NULL, NULL, '__messages', '1459047510865', NULL, '{\"ip\":\"127.0.0.1\"}'),
('2V5Z3eZTLQRjKJXv', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-17 03:36:17', NULL, NULL, '__offers', '10892113BA3FF', NULL, '{\"ip\":\"127.0.0.1\"}'),
('31U8CbW1XajsTxxg', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-17 03:36:13', NULL, NULL, '__trades', '164896F5B4AC9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('3EEZDr8RrFbmw7ce', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:35:45', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":817.88446861141,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('3mfN5FZI27WqO77v', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:19', NULL, NULL, '__messages', '135936ADED23F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('3o9qNLhFFMOwwbIu', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:35:48', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":500,\"new_value\":1138.2978723404},{\"field_name\":\"total_balance_asset_value\",\"old_value\":500,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('3oTKwQHgQH7lCjhs', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-17 03:35:37', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1591.0638297872,\"new_value\":1592.1164613661},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1591.0638297872,\"new_value\":1592.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('3PgIoXgvqUHTwyG5', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'flint', '2022-09-17 03:36:38', NULL, NULL, '__trades', '108525F6A9B6D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('43c6aQnEVk2wybDQ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:56', NULL, NULL, '__messages', '171671BEB5778', NULL, '{\"ip\":\"127.0.0.1\"}'),
('44lfhzKULKPPPz2x', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:30', NULL, NULL, '__messages', '1972152E4EA5D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('4Af4AOmz8dB1zuiG', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-17 03:36:18', NULL, NULL, '__seller_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('4meKyzhUFKSfvwSd', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-17 03:34:13', NULL, NULL, '__user_group_memberships', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('4PlvNUFHZqF9CJh4', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:41', NULL, NULL, '__messages', '1254459293E17', NULL, '{\"ip\":\"127.0.0.1\"}'),
('57bKv0yHpiaA0cC7', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:40', NULL, NULL, '__messages', '113992A33F1F9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('5l9imsC2Kr6q7ZUI', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-17 03:36:08', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":536.30459126541,\"new_value\":270.3471444569},{\"field_name\":\"total_balance_asset_value\",\"old_value\":536.30459126541,\"new_value\":270.3471444569}]', '{\"ip\":\"127.0.0.1\"}'),
('5NF1GHh1eKGD8Bwg', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-17 03:36:37', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":562.76041666667,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('5P6U4eQlL5ppOVnd', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:35:00', NULL, '1840840755035', '__email_addresses', 'lodza@example.com', NULL, NULL),
('65QFTB1YHkJuPJ8Y', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:35:05', NULL, '144240F211E7B', '__users', 'raymond', NULL, NULL),
('6h0KxxD1jDt9WC7g', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-17 03:34:14', NULL, NULL, '__buyer_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('6qC1kinymqDfLfDv', 'FACTORY_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'system', '2022-09-17 03:34:15', NULL, NULL, '__asset_accounts', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('6qS1nl8ZDWstl5XY', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-17 03:36:46', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":347.86679964539,\"new_value\":141.98444670421},{\"field_name\":\"total_balance_asset_value\",\"old_value\":347.86679964539,\"new_value\":141.98444670421}]', '{\"ip\":\"127.0.0.1\"}'),
('73B8l7oCPiPrxzKJ', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:35:04', NULL, '1029137E2ABC7', '__email_addresses', 'clarence@example.com', NULL, NULL),
('75zvdS6J2aNMfZQE', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:34:16', NULL, '188976AEBCE30', '__notifications', '1485317C19D00', NULL, NULL),
('7EiGDbiFZZz1Djuk', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-17 03:36:31', NULL, NULL, '__buyer_extensions', 'nassim', NULL, '{\"ip\":\"127.0.0.1\"}'),
('7oNC84Jpl6ASwIqE', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:35:05', NULL, '144240F211E7B', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('7YoewlFBv8Z8yshL', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:36:22', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":954.08734602461,\"new_value\":952.24524076145},{\"field_name\":\"total_balance_asset_value\",\"old_value\":954.08734602461,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('8bS4lkBrurVDNuj5', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-17 03:36:05', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":536.30459126541,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('8g0FwOQJTw323Wq5', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:34:15', NULL, '11187424BA19D', '__notifications', '133395F3C6051', NULL, NULL),
('8tidJMzec7mh3YF8', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'ross', '2022-09-17 03:35:51', NULL, NULL, '__buyer_extensions', 'clarence', NULL, '{\"ip\":\"127.0.0.1\"}'),
('8zBrrHiQ48EWqf1j', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-17 03:36:08', NULL, NULL, '__asset_accounts', '11', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":265.95744680851},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":265.95744680851}]', '{\"ip\":\"127.0.0.1\"}'),
('9eGUtPtQ8GkEesH5', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-17 03:36:34', NULL, NULL, '__asset_accounts', '9', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":100,\"new_value\":302.24719101124},{\"field_name\":\"total_balance_asset_value\",\"old_value\":100,\"new_value\":302.24719101124}]', '{\"ip\":\"127.0.0.1\"}'),
('9esKvTI6rkUzmJm9', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:35:04', NULL, '1029137E2ABC7', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('9kjHrmWzpwcRwPmz', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-17 03:35:42', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":968.31000052631,\"new_value\":819.37383031354},{\"field_name\":\"total_balance_asset_value\",\"old_value\":968.31000052631,\"new_value\":819.37383031354}]', '{\"ip\":\"127.0.0.1\"}'),
('9MZouHC8HrpWU1wm', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'nassim', '2022-09-17 03:36:30', NULL, NULL, '__offers', '139282D503EB0', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9nJAWN3hGQbmqRSD', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:50', NULL, NULL, '__messages', '178097D38CF83', NULL, '{\"ip\":\"127.0.0.1\"}'),
('A04EWtfJsxQY4HjX', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-17 03:34:14', NULL, NULL, '__user_group_memberships', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('A2keRcdkJ1cLzxke', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'jimmy', '2022-09-17 03:35:45', NULL, NULL, '__offers', '1349554097581', NULL, '{\"ip\":\"127.0.0.1\"}'),
('a3duwQEv5Rp5WQTB', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:34:59', NULL, '1870829A9FD3F', '__email_addresses', 'goodhopedhliwayo@gmail.com', NULL, NULL),
('a8ahA9AAHwKhjGaW', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'reserves', '2022-09-17 03:35:06', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":3000},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":3000}]', '{\"ip\":\"127.0.0.1\"}'),
('AB9WFooqc9ztGGOG', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:20', NULL, NULL, '__deposit_tokens', '1160710644605', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Aby7YldR0dAs5ytt', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:35:00', NULL, '1840840755035', '__notifications', '1043479BCAC80', NULL, NULL),
('aC6wPAGeAJkLGHgb', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:36:26', NULL, NULL, '__trades', '117105C9C9628', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:26\"}]', '{\"ip\":\"127.0.0.1\"}'),
('AEwMQCXkqfK8c5Lv', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'peter', '2022-09-17 03:36:04', NULL, NULL, '__offers', '15889625AEC3D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ALkl0Z51PaF9r6ZB', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-17 03:35:29', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":110,\"new_value\":216.3829787234},{\"field_name\":\"total_balance_asset_value\",\"old_value\":110,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('Ap9hCwPk8BeAzQ5y', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:34:59', NULL, '1870829A9FD3F', '__users', 'guddaz', NULL, NULL),
('awSpUl1MtC6QKHYm', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'ross', '2022-09-17 03:35:13', NULL, NULL, '__asset_accounts', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('b6vbnoHaBWrXLxLL', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:18', NULL, NULL, '__deposit_tokens', '147079F9A7C3C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('B91vpBhWsfS2abcX', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-17 03:35:07', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":218.87587867},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":218.87587867}]', '{\"ip\":\"127.0.0.1\"}'),
('be0AfFgyKjFjB8ci', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'guddaz', '2022-09-17 03:35:07', NULL, NULL, '__asset_accounts', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('BeNzZSq6xtaSVuEK', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:25', NULL, NULL, '__messages', '105074C7531CA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('BEQqBwhWlfEXET9d', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:12', NULL, NULL, '__messages', '156260B5617DF', NULL, '{\"ip\":\"127.0.0.1\"}'),
('bjHZ8CLaqxp0gGPx', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:34:15', NULL, '11187424BA19D', '__users', 'reserves', NULL, NULL),
('Bl3uy8ryTSpOuDow', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:32', NULL, NULL, '__buyer_extensions', 'raymond', NULL, '{\"ip\":\"127.0.0.1\"}'),
('BmdCiJXXNyWTfGjS', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'clarence', '2022-09-17 03:35:18', NULL, NULL, '__deposit_tokens', '147079F9A7C3C', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:18\"}]', '{\"ip\":\"127.0.0.1\"}'),
('BNsRYRjo5aTgFekH', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:35:04', NULL, '1029137E2ABC7', '__users', 'clarence', NULL, NULL),
('BVKG6AutZ0XGuJqi', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-17 03:35:25', NULL, NULL, '__messages', '177776189C387', NULL, '{\"ip\":\"127.0.0.1\"}'),
('c36ys8yN7GVttOfT', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-17 03:35:00', NULL, NULL, '__user_group_memberships', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('C9z6vhWnyJJzjeov', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:35:06', NULL, '1573569EC41F7', '__email_addresses', 'nassim@example.com', NULL, NULL),
('Camtad0QVjm5rHER', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:13', NULL, NULL, '__deposit_tokens', '1803936AC4D50', NULL, '{\"ip\":\"127.0.0.1\"}'),
('CFJ4KBhrK9pGi7Wi', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-17 03:35:42', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":600,\"new_value\":748.93617021277},{\"field_name\":\"total_balance_asset_value\",\"old_value\":600,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('CgpLi2s6GQc0gMox', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'guddaz', '2022-09-17 03:35:23', NULL, NULL, '__trades', '173183B5B498B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Cgv1dl6SFiNmFPOL', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-17 03:36:48', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1617.132718854,\"new_value\":1619.1915423834},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1617.132718854,\"new_value\":1619.1915423834}]', '{\"ip\":\"127.0.0.1\"}'),
('Ci7a2EUxuyKSMlbH', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'ross', '2022-09-17 03:35:51', NULL, NULL, '__seller_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('cIGKqbAht8Uww5wT', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-17 03:34:59', NULL, NULL, '__admin_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('cKKOqhEzX6jPYMSZ', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-17 03:35:21', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":317.77707867,\"new_value\":210.33027015936}]', '{\"ip\":\"127.0.0.1\"}'),
('CLB58iFKT0yMg9D8', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:46', NULL, NULL, '__trades', '11313227D1802', NULL, '{\"ip\":\"127.0.0.1\"}'),
('d2knACg0XL90ikys', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:34:14', NULL, '14354510B5620', '__notifications', '1104830D259C9', NULL, NULL),
('d47xSXM3muoVvsaH', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'keith', '2022-09-17 03:35:15', NULL, NULL, '__asset_accounts', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('D8BXAaZEImTYIwa3', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'flint', '2022-09-17 03:36:37', NULL, NULL, '__buyer_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('DAJzrC2xOVcsMpgD', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:35:12', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":967.86579,\"new_value\":1074.62579},{\"field_name\":\"total_balance_asset_value\",\"old_value\":967.86579,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}'),
('dBD2MZ6JBlWTGN2J', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:59', NULL, NULL, '__messages', '136826E441A2E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dD54KbcD78CqKUIY', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:32', NULL, NULL, '__messages', '114275523CFC9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dFgxSXUkOK7iKn0A', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:40', NULL, NULL, '__trades', '185523B2CAD56', NULL, '{\"ip\":\"127.0.0.1\"}'),
('DjPDzkIpFYxVDlui', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-17 03:35:37', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":969.36263210526,\"new_value\":968.31000052631},{\"field_name\":\"total_balance_asset_value\",\"old_value\":969.36263210526,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('dJT7J2B3EBI6YXJG', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:35:05', NULL, '144240F211E7B', '__email_addresses', 'raymond@example.com', NULL, NULL),
('DMx0KbbXsebNAhAL', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:40', NULL, NULL, '__messages', '15033366A5766', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dPU8LQFFW5eUErdY', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:34:59', NULL, '1870829A9FD3F', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('e1ACVaunEEA2XVdr', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:34:14', NULL, '14354510B5620', '__users', 'sysadmin', NULL, NULL),
('e6M2hdvv0aK6UMO2', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'ross', '2022-09-17 03:35:14', NULL, NULL, '__deposit_tokens', '1803936AC4D50', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:13\"}]', '{\"ip\":\"127.0.0.1\"}'),
('ebe7TkwDeCzrW9fX', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'keith', '2022-09-17 03:35:58', NULL, NULL, '__seller_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ECITsAfQ2xGBbb9F', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:35:04', NULL, '1741323000734', '__notifications', '124998CAA2902', NULL, NULL),
('egMigIL7Fzb4X0f0', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:35:04', NULL, '1741323000734', '__email_addresses', 'flint@example.com', NULL, NULL),
('EIepDjgnBaOwffBH', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:48', NULL, NULL, '__messages', '171778A9BF67E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('eMqHtOSDstAijvgY', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:35:06', NULL, '1573569EC41F7', '__notifications', '118417884E4DB', NULL, NULL),
('EpFmghrn7pwjsCFO', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:36:31', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('eqpQUEhm3UAisYkK', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-17 03:36:32', NULL, NULL, '__trades', '111361CCCD2B4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('EsbFCEFPxrMghb4g', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:29', NULL, NULL, '__messages', '19098863803C1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('eTmtY3uRcuGu82it', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-17 03:36:13', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":103.29954915548,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('EY8b40jiIcnxn80w', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:35:39', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":968.31000052631,\"new_value\":817.88446861142}]', '{\"ip\":\"127.0.0.1\"}'),
('FA0mvkzUvELnztej', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:45', NULL, NULL, '__messages', '1911036F53388', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Fj5lF5BslE7ABPxD', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:33', NULL, NULL, '__messages', '192160981DCE7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('FjzZnMZNVyi3kVe0', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-17 03:36:29', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1610.351008422,\"new_value\":1612.9825873694},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1610.351008422,\"new_value\":1612.9825873694}]', '{\"ip\":\"127.0.0.1\"}'),
('FKqizry95vcFUu4M', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-17 03:35:43', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":819.37383031354,\"new_value\":817.88446861141},{\"field_name\":\"total_balance_asset_value\",\"old_value\":819.37383031354,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('FRVJqE3DYYU49aFR', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-17 03:36:42', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1615.0050592795,\"new_value\":1617.132718854},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1615.0050592795,\"new_value\":1617.132718854}]', '{\"ip\":\"127.0.0.1\"}'),
('FTlbyqDyfD0Oi0LD', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-17 03:36:40', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":210.33027015937,\"new_value\":423.09622760618},{\"field_name\":\"total_balance_asset_value\",\"old_value\":210.33027015937,\"new_value\":423.09622760618}]', '{\"ip\":\"127.0.0.1\"}'),
('g2fXj9KQ187ZfeqN', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-17 03:35:14', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":110},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":110}]', '{\"ip\":\"127.0.0.1\"}'),
('G2ZqeWwNZTqUbmfK', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-17 03:36:35', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1612.9825873694,\"new_value\":1615.0050592795},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1612.9825873694,\"new_value\":1615.0050592795}]', '{\"ip\":\"127.0.0.1\"}'),
('GCYbTuG1XBk90Kzt', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:39', NULL, NULL, '__messages', '188347BCBE6F6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GLbnLGaykWAFk0zp', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:35:50', NULL, NULL, '__trades', '11313227D1802', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:47\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('gmrNqIQDexxO9fJc', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:36:23', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1608.5089031588,\"new_value\":1610.351008422},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1608.5089031588,\"new_value\":1610.351008422}]', '{\"ip\":\"127.0.0.1\"}'),
('gMtfYdHOZzEg6vFL', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-17 03:36:24', NULL, NULL, '__offers', '1113499635C0E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GOfvGNQyPXhDB28N', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'peter', '2022-09-17 03:36:43', NULL, NULL, '__offers', '171655D05341A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('gQsR2A6Bz7FwxnYw', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:35:32', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1074.62579,\"new_value\":968.31000052632}]', '{\"ip\":\"127.0.0.1\"}'),
('gre7dP3bNpFmgVCC', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-17 03:36:39', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":347.86679964539,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('gSLXPLdFsa7M1Okr', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:35:03', NULL, '124142B230AA5', '__users', 'peter', NULL, NULL),
('GTRvabYxJMuQ4ixK', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:32', NULL, NULL, '__messages', '149056F88F94C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Gx4hUkp3henbmIkf', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:35:05', NULL, '1573569EC41F7', '__users', 'nassim', NULL, NULL),
('h2TuUedHEZrT8WHB', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-17 03:35:44', NULL, NULL, '__trades', '185523B2CAD56', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:41\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('hbifWZcGSh1NvlgM', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:34:16', NULL, '188976AEBCE30', '__users', 'busadmin', NULL, NULL),
('hiBmp43BizFzXv72', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:35:00', NULL, '1840840755035', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('hjTWV5b2VQStIpD7', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-17 03:35:01', NULL, NULL, '__user_group_memberships', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HKpMtyIzE5lQe99J', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-17 03:36:11', NULL, NULL, '__buyer_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hMqU3N4hl8l5fpwO', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:36:19', NULL, NULL, '__trades', '188209D4E9885', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:19\"}]', '{\"ip\":\"127.0.0.1\"}'),
('HnsNFbt6gVgGBGds', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'jimmy', '2022-09-17 03:35:17', NULL, NULL, '__asset_accounts', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hS9Itlqu4lMZ1qRm', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:35:00', NULL, '1840840755035', '__users', 'lodza', NULL, NULL),
('HvuiPemiORDVUfxF', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:35:17', NULL, NULL, '__deposit_tokens', '19501377BAA63', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:16\"}]', '{\"ip\":\"127.0.0.1\"}'),
('hwsFExG9XtX9vL0L', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:38', NULL, NULL, '__messages', '1748217AB263D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hxrSX6nPbkTxKpSu', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-17 03:36:37', NULL, NULL, '__offers', '141749F7AABC5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ic9o1vN1wrTsuys6', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:35:03', NULL, '124142B230AA5', '__email_addresses', 'peter@example.com', NULL, NULL),
('IdNGIduWpkXDn4SR', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:16', NULL, NULL, '__deposit_tokens', '19501377BAA63', NULL, '{\"ip\":\"127.0.0.1\"}'),
('IetWlBrx1C02ZIfT', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:36:03', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":538.4098544233,\"new_value\":536.30459126541},{\"field_name\":\"total_balance_asset_value\",\"old_value\":538.4098544233,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('ifGW2eqMJnzQ4rKV', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-17 03:35:56', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1599.9888017916,\"new_value\":1602.1164613661},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1599.9888017916,\"new_value\":1602.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('imfMQ9vb6xbY6y30', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-17 03:35:11', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":218.87587867,\"new_value\":317.77707867},{\"field_name\":\"total_balance_asset_value\",\"old_value\":218.87587867,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('iUiDRwhiJ5jwojHZ', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:34:59', NULL, '1870829A9FD3F', '__notifications', '11160740D4555', NULL, NULL),
('IZcisX0ds3MzgTJ6', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-17 03:36:48', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":141.98444670421,\"new_value\":139.9256231748},{\"field_name\":\"total_balance_asset_value\",\"old_value\":141.98444670421,\"new_value\":139.9256231748}]', '{\"ip\":\"127.0.0.1\"}'),
('j2lcBXohr1b6iiWb', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:58', NULL, NULL, '__offers', '132464C4F8551', NULL, '{\"ip\":\"127.0.0.1\"}'),
('J3Cav7D9AfEGO1dU', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:35:47', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":173.20361754758,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('J8YbR6GrSLuFVJOw', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:35:02', NULL, '10911435557EF', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('JbNyEp0fFJIE0JmJ', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-17 03:35:01', NULL, NULL, '__user_group_memberships', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('jc5He4cz1TiBnLmH', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'raymond', '2022-09-17 03:35:36', NULL, NULL, '__asset_accounts', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Jdm9iBJzSELpOTfj', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:35', NULL, NULL, '__messages', '170323B510258', NULL, '{\"ip\":\"127.0.0.1\"}'),
('jjX0kzBLSHU8tCWZ', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-17 03:36:10', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1604.221724524,\"new_value\":1606.8812989921},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1604.221724524,\"new_value\":1606.8812989921}]', '{\"ip\":\"127.0.0.1\"}'),
('jKSwosAOH6YifQix', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:23', NULL, NULL, '__messages', '176938AC318B7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('jlZ97SRnBUYMtkQI', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:47', NULL, NULL, '__messages', '19335857D29B6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('jn7JLyA3C0eioJiD', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:45', NULL, NULL, '__messages', '1058347ACED7B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Jo2FUMeQBwHsNAWJ', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'clarence', '2022-09-17 03:35:56', NULL, NULL, '__trades', '191834F743305', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:53\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('JpMNy2hSfejxiFKM', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-17 03:35:56', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":3.61702127659,\"new_value\":1.4893617021219},{\"field_name\":\"total_balance_asset_value\",\"old_value\":3.61702127659,\"new_value\":1.4893617021219}]', '{\"ip\":\"127.0.0.1\"}'),
('jpN7h7I0fRXvci4u', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-17 03:35:27', NULL, NULL, '__messages', '114372D676878', NULL, '{\"ip\":\"127.0.0.1\"}'),
('jt29RORb4Xsa3Q1j', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-17 03:36:19', NULL, NULL, '__trades', '188209D4E9885', NULL, '{\"ip\":\"127.0.0.1\"}'),
('jw2ebx9XrmfFtLyu', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-17 03:36:45', NULL, NULL, '__trades', '11976069C8145', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:45\"}]', '{\"ip\":\"127.0.0.1\"}'),
('Jxp8sXrgu25wNbBu', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'clarence', '2022-09-17 03:35:18', NULL, NULL, '__asset_accounts', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('K0NvZa5gQ87xvVlA', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'peter', '2022-09-17 03:36:10', NULL, NULL, '__trades', '1454393C469F3', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"peter\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:06\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('K1KC8So9OMUzZu1W', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:35:02', NULL, '10911435557EF', '__email_addresses', 'keith@example.com', NULL, NULL),
('kBwwYALT5SlQCwSC', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-17 03:36:26', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('KHVGTHqwPAsfxa3G', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:35:17', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2290,\"new_value\":1790},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2290,\"new_value\":1790}]', '{\"ip\":\"127.0.0.1\"}'),
('kj2bPFYRt3ERWgDl', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-17 03:35:53', NULL, NULL, '__trades', '191834F743305', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:53\"}]', '{\"ip\":\"127.0.0.1\"}'),
('KKoP9OKCFxUq0lES', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:35:08', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":967.86579},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":967.86579}]', '{\"ip\":\"127.0.0.1\"}'),
('kMMILbpa1TGjPjJz', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'peter', '2022-09-17 03:36:08', NULL, NULL, '__asset_accounts', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('kQbw43ZC7DkujHqg', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:15', NULL, NULL, '__deposit_tokens', '190466C418F93', NULL, '{\"ip\":\"127.0.0.1\"}'),
('krJ7kj9cH92IlFcI', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:28', NULL, NULL, '__messages', '16722934E8CA7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('KSHFC21xKBau8uFy', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-17 03:34:16', NULL, NULL, '__seller_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('kSMTWA2BtOIQK5Cw', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-17 03:35:35', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1074.62579,\"new_value\":969.36263210526},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1074.62579,\"new_value\":969.36263210526}]', '{\"ip\":\"127.0.0.1\"}'),
('ktDBEww6PCf2o7jO', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:26', NULL, NULL, '__messages', '1453192D833BF', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ku4I8HDQNAVmZNoU', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-17 03:35:55', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":216.3829787234,\"new_value\":3.61702127659},{\"field_name\":\"total_balance_asset_value\",\"old_value\":216.3829787234,\"new_value\":3.61702127659}]', '{\"ip\":\"127.0.0.1\"}'),
('kXzoqXkXLx8b1gks', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:35:03', NULL, '124142B230AA5', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('kZ3FaxPLGrRUUD7o', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-17 03:35:18', NULL, NULL, '__asset_accounts', '8', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":100},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('KzSq8lmltdSzOusM', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-17 03:36:26', NULL, NULL, '__trades', '117105C9C9628', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Lbs16j76EkYSubr2', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:35:02', NULL, '12445379A93AD', '__users', 'jimmy', NULL, NULL);
INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('lIuubloMERsuTCce', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-17 03:36:14', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":104.92715332214},{\"field_name\":\"total_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":104.92715332214}]', '{\"ip\":\"127.0.0.1\"}'),
('ljX1y9wnly0rjbXm', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-17 03:36:29', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":689.08734602461,\"new_value\":686.45576707724},{\"field_name\":\"total_balance_asset_value\",\"old_value\":689.08734602461,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('LN6aFuJ203lUDQJM', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:34:13', NULL, '1570176E782AF', '__notifications', '136619A8339EF', NULL, NULL),
('lRQzSE9orTsR9d0Q', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-17 03:36:42', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":349.99445921986,\"new_value\":347.86679964539},{\"field_name\":\"total_balance_asset_value\",\"old_value\":349.99445921986,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('lsob0uobEGgpFo8s', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-17 03:36:28', NULL, NULL, '__asset_accounts', '10', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":105.26315789474,\"new_value\":368.42105263158},{\"field_name\":\"total_balance_asset_value\",\"old_value\":105.26315789474,\"new_value\":368.42105263158}]', '{\"ip\":\"127.0.0.1\"}'),
('LT3lBTau1Xe7KwsQ', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-17 03:34:14', NULL, NULL, '__admin_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('LuqjzZSmbVNJ8ASi', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:32', NULL, NULL, '__seller_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('LxF9Ctk6AslrA3gs', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-17 03:34:15', NULL, NULL, '__admin_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('m85VzNjE35jVDwfJ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:34', NULL, NULL, '__messages', '119329E5834CF', NULL, '{\"ip\":\"127.0.0.1\"}'),
('mCiuIvfGn2WEuLor', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:35:50', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1593.6058230682,\"new_value\":1599.9888017916},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1593.6058230682,\"new_value\":1599.9888017916}]', '{\"ip\":\"127.0.0.1\"}'),
('mDdB4x9rmx48DKeP', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:39', NULL, NULL, '__buyer_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('menYKsjgTJ96BVYf', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:35:05', NULL, '1573569EC41F7', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('miUwB91NaFfzwkau', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'keith', '2022-09-17 03:35:15', NULL, NULL, '__deposit_tokens', '190466C418F93', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:15\"}]', '{\"ip\":\"127.0.0.1\"}'),
('mJy0uIw4oNldK403', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'ross', '2022-09-17 03:35:53', NULL, NULL, '__trades', '191834F743305', NULL, '{\"ip\":\"127.0.0.1\"}'),
('moPnTR2pTqSNmE3j', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-17 03:34:16', NULL, NULL, '__admin_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('mPcq2QBP1L2O7Suc', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-17 03:36:16', NULL, NULL, '__trades', '164896F5B4AC9', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:13\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('mQ3g4YaM4EsEJ7QM', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:13', NULL, NULL, '__messages', '1168964A22370', NULL, '{\"ip\":\"127.0.0.1\"}'),
('nCHF1qUZs6xguRBg', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:36:24', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('Nf2A7BBsqbIr44tt', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-17 03:35:13', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":3000,\"new_value\":2890},{\"field_name\":\"total_balance_asset_value\",\"old_value\":3000,\"new_value\":2890}]', '{\"ip\":\"127.0.0.1\"}'),
('nhIG2sM9gEXZXIkH', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:35:03', NULL, '10911435557EF', '__notifications', '13996752E747B', NULL, NULL),
('NpM1UigVTHV7GfEO', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:34:15', NULL, '11187424BA19D', '__email_addresses', 'reserves@ankelli.com', NULL, NULL),
('nRBltkONUNnBWPo2', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:37', NULL, NULL, '__messages', '171480CAFD8F8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('nrMz0exPEGNVD6P1', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:32', NULL, NULL, '__messages', '1841002E74D84', NULL, '{\"ip\":\"127.0.0.1\"}'),
('O1897n19V0GOHSLE', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-17 03:34:13', NULL, NULL, '__user_group_memberships', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('O1tT9GjpRjpFpshx', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:20', NULL, NULL, '__messages', '1487232F2C820', NULL, '{\"ip\":\"127.0.0.1\"}'),
('o2EQFx65cHlXIEZO', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:16', NULL, NULL, '__messages', '1437576D66256', NULL, '{\"ip\":\"127.0.0.1\"}'),
('O2HwUr9Dz1JSyfCu', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-17 03:35:53', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1.4893617021234,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('o2jhNKkF2wB9PlVT', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-17 03:34:16', NULL, NULL, '__user_group_memberships', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('O7UzGTrPXU7UrT4b', 'TEST_SESSION', 'Temporarily disabling for test users.', 'entry_update', 'system', '2022-09-17 03:34:59', NULL, NULL, '__pref_items', '8', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for test users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('OaZl3VdU925aDPWR', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-17 03:36:13', NULL, NULL, '__trades', '164896F5B4AC9', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:13\"}]', '{\"ip\":\"127.0.0.1\"}'),
('ObnZSKPW2Y9YEiJV', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-17 03:35:18', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1790,\"new_value\":1690},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1790,\"new_value\":1690}]', '{\"ip\":\"127.0.0.1\"}'),
('ocFqGVSX9sN08qt5', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-17 03:34:15', NULL, NULL, '__user_group_memberships', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('OdwzkdVZ321mieER', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:34:16', NULL, '188976AEBCE30', '__email_addresses', 'busadmin@ankelli.com', NULL, NULL),
('Oe9hiLftSBtTE9GO', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:00', NULL, NULL, '__messages', '125609E4E22E6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('OHDVLxaNyv6ANpZD', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'guddaz', '2022-09-17 03:35:24', NULL, NULL, '__trades', '173183B5B498B', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"guddaz\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:24\"}]', '{\"ip\":\"127.0.0.1\"}'),
('OJ51wg7makZb5ch6', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:35:03', NULL, '124142B230AA5', '__notifications', '1131140C8C69A', NULL, NULL),
('OKtc3WAOdHcAdAoi', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:47', NULL, NULL, '__messages', '161908E9C1D47', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ooUtajPcbhgntuD2', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:34:15', NULL, '11187424BA19D', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('OpUCKXhHLtwBi67t', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-17 03:35:59', NULL, NULL, '__trades', '143249D28E91D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('OqJdhdo7wMWbw6Ul', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-17 03:35:15', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":2890,\"new_value\":2290},{\"field_name\":\"total_balance_asset_value\",\"old_value\":2890,\"new_value\":2290}]', '{\"ip\":\"127.0.0.1\"}'),
('OSFbPPCUQOw7OngI', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-17 03:35:20', NULL, NULL, '__asset_accounts', '9', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":100},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('OUrJSm7rJ05c6vI3', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-17 03:35:15', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":600},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":600}]', '{\"ip\":\"127.0.0.1\"}'),
('OXxDY8AjvgvT4UEy', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-17 03:35:38', NULL, NULL, '__trades', '1722127CC3BC1', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:34\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('P02Whn9tb26TalFO', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:35:48', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":817.88446861141,\"new_value\":179.58659627098},{\"field_name\":\"total_balance_asset_value\",\"old_value\":817.88446861141,\"new_value\":179.58659627098}]', '{\"ip\":\"127.0.0.1\"}'),
('P4f8nxolRmzKCF9x', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:03', NULL, NULL, '__messages', '111767E4D662C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('PB4vcm3x5bHw4zvE', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-17 03:36:09', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":270.3471444569,\"new_value\":267.68756998881},{\"field_name\":\"total_balance_asset_value\",\"old_value\":270.3471444569,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('PbXbn3dJzc7T1JNs', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:44', NULL, NULL, '__messages', '16634557B9B08', NULL, '{\"ip\":\"127.0.0.1\"}'),
('PhR2kpsDcmxA6c6z', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-17 03:34:14', NULL, NULL, '__user_group_memberships', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('prG4AHY1PQf9yYnT', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-17 03:36:06', NULL, NULL, '__trades', '1454393C469F3', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:06\"}]', '{\"ip\":\"127.0.0.1\"}'),
('PSlW8VAKrfbkW7kp', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'clarence', '2022-09-17 03:35:55', NULL, NULL, '__asset_accounts', '8', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":100,\"new_value\":312.76595744681},{\"field_name\":\"total_balance_asset_value\",\"old_value\":100,\"new_value\":312.76595744681}]', '{\"ip\":\"127.0.0.1\"}'),
('Q6KL11Ykilkc0hOM', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:36:21', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":383.72993333705,\"new_value\":567.94045965284},{\"field_name\":\"total_balance_asset_value\",\"old_value\":383.72993333705,\"new_value\":567.94045965284}]', '{\"ip\":\"127.0.0.1\"}'),
('q9DFKM5fq1nci4tB', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'nassim', '2022-09-17 03:35:20', NULL, NULL, '__asset_accounts', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qaeXIlvofECVeMtZ', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-17 03:36:43', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":347.86679964539,\"new_value\":139.9256231748}]', '{\"ip\":\"127.0.0.1\"}'),
('qbFG7hoYJ1CqXgRa', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-17 03:34:15', NULL, NULL, '__seller_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qcQiPzl8LmbxqzRZ', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:45', NULL, NULL, '__buyer_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('QEG49IfZJrfzz1RL', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-17 03:35:23', NULL, NULL, '__messages', '178638D5222F2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qgryQ3czTy9ni0d5', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-17 03:34:16', NULL, NULL, '__user_group_memberships', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('QhAi8ptQyN2eShP3', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:06', NULL, NULL, '__messages', '185799E73D3BD', NULL, '{\"ip\":\"127.0.0.1\"}'),
('QiMBh71GGCf15roJ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:53', NULL, NULL, '__messages', '1449488260CE4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qNtzmXrkE52zl1mg', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:34:13', NULL, '1570176E782AF', '__users', 'developer', NULL, NULL),
('qO0V77fkGTYrRa0a', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-17 03:36:23', NULL, NULL, '__trades', '188209D4E9885', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:19\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('QR6ENUB6qTQB22cQ', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-17 03:35:34', NULL, NULL, '__trades', '1722127CC3BC1', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:33\"}]', '{\"ip\":\"127.0.0.1\"}'),
('qSCkWdl6y7sUAbtA', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'ross', '2022-09-17 03:35:21', NULL, NULL, '__offers', '1314935D32E10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qsjslIoQO49FQfVX', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-17 03:35:47', NULL, NULL, '__trades', '11313227D1802', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:46\"}]', '{\"ip\":\"127.0.0.1\"}'),
('QXGaUIFNzUpv7Gpz', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:35:02', NULL, '10911435557EF', '__users', 'keith', NULL, NULL),
('R0xz97ZK57jmTcdT', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-17 03:36:39', NULL, NULL, '__trades', '108525F6A9B6D', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:38\"}]', '{\"ip\":\"127.0.0.1\"}'),
('rc5OG9gGidul6FGk', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-17 03:36:46', NULL, NULL, '__asset_accounts', '11', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":265.95744680851,\"new_value\":471.83979974969},{\"field_name\":\"total_balance_asset_value\",\"old_value\":265.95744680851,\"new_value\":471.83979974969}]', '{\"ip\":\"127.0.0.1\"}'),
('RcxPUBdTMZDEtTi9', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-17 03:35:21', NULL, NULL, '__seller_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('RdtPtJcSBGuIcjpJ', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:36:18', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1138.2978723404,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('rEF75EFnyZe9sXdk', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-17 03:36:34', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":484.208576066},{\"field_name\":\"total_balance_asset_value\",\"old_value\":686.45576707724,\"new_value\":484.208576066}]', '{\"ip\":\"127.0.0.1\"}'),
('Rh2M5VAsP4u4tazY', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-17 03:34:15', NULL, NULL, '__buyer_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('riXrOc5y6cPGcyoa', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-17 03:35:30', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":211.3940999466,\"new_value\":210.33027015937},{\"field_name\":\"total_balance_asset_value\",\"old_value\":211.3940999466,\"new_value\":210.33027015937}]', '{\"ip\":\"127.0.0.1\"}'),
('rJ1x66TffOB8FB4i', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:06', NULL, NULL, '__messages', '12804604F5CA9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('RjEv2st5WD9tT5oa', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:42', NULL, NULL, '__messages', '1348989EE86BB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('RjsxQObOr8bPtGVV', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:35:04', NULL, '1741323000734', '__users', 'flint', NULL, NULL),
('rlPF2uoFTtPKwM5u', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'nassim', '2022-09-17 03:36:35', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":484.208576066,\"new_value\":482.18610415589},{\"field_name\":\"total_balance_asset_value\",\"old_value\":484.208576066,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('rTNgE01l5erfvbyY', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:24', NULL, NULL, '__messages', '1287157E80F31', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ru6YYaCeaWVXO23Y', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-17 03:35:32', NULL, NULL, '__offers', '178458DA4E3EF', NULL, '{\"ip\":\"127.0.0.1\"}'),
('rvoThre3twam9QU4', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:06', NULL, NULL, '__messages', '130965B5113D9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('RvQTqzycGSUqJhh9', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-17 03:36:27', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":689.08734602461},{\"field_name\":\"total_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":689.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('RW7LSd4cmvkloooM', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:36:02', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":173.20361754758,\"new_value\":383.72993333705},{\"field_name\":\"total_balance_asset_value\",\"old_value\":173.20361754758,\"new_value\":383.72993333705}]', '{\"ip\":\"127.0.0.1\"}'),
('rY8B6R64Cp5Yknhz', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:35:01', NULL, '193442DD5C399', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('S1v17W2V3eDNmiJi', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:34:14', NULL, '14354510B5620', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('S4sa6uPqeP1q4LFQ', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:34:13', NULL, '1570176E782AF', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('SbPRrSo72gnstLl2', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'guddaz', '2022-09-17 03:36:40', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":562.76041666667,\"new_value\":349.99445921986},{\"field_name\":\"total_balance_asset_value\",\"old_value\":562.76041666667,\"new_value\":349.99445921986}]', '{\"ip\":\"127.0.0.1\"}'),
('sG9zV0bP9sgVaQLk', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:26', NULL, NULL, '__messages', '117033D44D795', NULL, '{\"ip\":\"127.0.0.1\"}'),
('SlPpMku6Y2iYPNyZ', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-17 03:34:13', NULL, NULL, '__admin_extensions', 'developer', NULL, '{\"ip\":\"127.0.0.1\"}'),
('smDQMgLEf5PUAjul', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:34:14', NULL, '14354510B5620', '__email_addresses', 'sysadmin@ankelli.com', NULL, NULL),
('sr2UVh46BkvskhAX', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:34:16', NULL, '188976AEBCE30', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('SSB6mWxcxk5lKVtB', 'TEST_SESSION', 'Resetting to default value.', 'entry_update', 'peter', '2022-09-17 03:36:49', NULL, NULL, '__pref_items', '8', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Resetting to default value.\"},{\"field_name\":\"value\",\"old_value\":\"0\",\"new_value\":true}]', '{\"ip\":\"127.0.0.1\"}'),
('SviSHF7Qj8FVNlzX', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-17 03:36:45', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":139.9256231748,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('SyJiaJ2ULAbrAHuQ', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-17 03:36:29', NULL, NULL, '__trades', '117105C9C9628', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:26\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('TG3eXtVkBdJi6YM4', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-17 03:35:01', NULL, NULL, '__user_group_memberships', '12', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TmRfhZhFOQAw4brf', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-17 03:35:26', NULL, NULL, '__messages', '12837601AE2FE', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TNLfbuUuKSsNAlWc', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-17 03:35:02', NULL, '12445379A93AD', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('TpGFnLQIh2bCpaTT', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-17 03:35:29', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":317.77707867,\"new_value\":211.3940999466},{\"field_name\":\"total_balance_asset_value\",\"old_value\":317.77707867,\"new_value\":211.3940999466}]', '{\"ip\":\"127.0.0.1\"}'),
('TXMj1GVK3DmVReHP', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-17 03:35:52', NULL, NULL, '__asset_accounts', '5', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":216.3829787234,\"new_value\":1.4893617021234}]', '{\"ip\":\"127.0.0.1\"}'),
('Ty3YaKoGZTakXt8e', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:53', NULL, NULL, '__messages', '1954410C04319', NULL, '{\"ip\":\"127.0.0.1\"}'),
('tzgIWRuEas19WNqs', 'FACTORY_SESSION', 'Addition of _Asset entry to database.', 'entry_create', 'system', '2022-09-17 03:34:12', NULL, NULL, '__assets', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('U0tMcfSLlhoKG1K5', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:36:00', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":536.3045912654,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('u9jdkWv7RZQzxcIv', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:34:13', NULL, '1570176E782AF', '__email_addresses', 'developer.ankelli@gmail.com', NULL, NULL),
('ucKCzw2kjBkjXqWS', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-17 03:34:14', NULL, NULL, '__seller_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ucksdX16kws8WPTL', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:10', NULL, NULL, '__messages', '19712336E249B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UD7DAAjq3UMErUxX', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-17 03:35:21', NULL, NULL, '__buyer_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Uj9TMhi4FTyeN6LM', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:35:01', NULL, '193442DD5C399', '__notifications', '1986816B89AF5', NULL, NULL),
('UkkkX75FnAiSrYKf', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-17 03:36:15', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":400,\"new_value\":562.76041666667},{\"field_name\":\"total_balance_asset_value\",\"old_value\":400,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('UNmqHoKr7e27kXUN', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-17 03:35:01', NULL, '193442DD5C399', '__users', 'ross', NULL, NULL),
('uqll2sHL4O738mdY', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:53', NULL, NULL, '__messages', '118042B2C0B05', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UqQZvCp1olhcmbjm', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-17 03:35:32', NULL, NULL, '__offers', '12272187F9570', NULL, '{\"ip\":\"127.0.0.1\"}'),
('USrTacihaW9zS2KI', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-17 03:36:06', NULL, NULL, '__trades', '1454393C469F3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('uw4cdN5ZCEPp9Inm', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-17 03:36:03', NULL, NULL, '__trades', '143249D28E91D', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:00\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('uY0C4fmgRlbUqL5y', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-17 03:34:16', NULL, NULL, '__buyer_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('vB8gQE5DxSam8sGf', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'raymond', '2022-09-17 03:35:36', NULL, NULL, '__asset_accounts', '10', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":105.26315789474},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":105.26315789474}]', '{\"ip\":\"127.0.0.1\"}'),
('vSfjY4suD2mpGAcr', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-17 03:35:41', NULL, NULL, '__asset_accounts', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":817.88446861142,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('VSLPfAOxg4uDdyC5', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'peter', '2022-09-17 03:36:07', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('vULMipmFGx30arCY', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'flint', '2022-09-17 03:36:11', NULL, NULL, '__offers', '116291C3B5651', NULL, '{\"ip\":\"127.0.0.1\"}'),
('VVJQdWORuqVWosY1', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'flint', '2022-09-17 03:36:37', NULL, NULL, '__seller_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('vvOpO3lFwJ7nIvFq', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:36:20', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":952.24524076145,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('wkKeKwJXBOxrWYPS', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'nassim', '2022-09-17 03:35:20', NULL, NULL, '__deposit_tokens', '1160710644605', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:20\"}]', '{\"ip\":\"127.0.0.1\"}'),
('WmCL3zoV3WNjP4CW', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'clarence', '2022-09-17 03:35:51', NULL, NULL, '__offers', '156601D73C5DB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('WSUqstqTXqiL4xeP', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'flint', '2022-09-17 03:35:10', NULL, NULL, '__asset_accounts', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('WVbp9D5DzfQGhscE', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-17 03:34:15', NULL, NULL, '__user_group_memberships', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('WVS2F3G4fuqUR9Ue', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:00', NULL, NULL, '__messages', '176818FB5BA5F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('X5yFdH7ZuT6CAbOt', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:36:01', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":748.93617021277,\"new_value\":538.4098544233},{\"field_name\":\"total_balance_asset_value\",\"old_value\":748.93617021277,\"new_value\":538.4098544233}]', '{\"ip\":\"127.0.0.1\"}'),
('x70erG0rxNjtEaW9', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-17 03:36:05', NULL, NULL, '__buyer_extensions', 'peter', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XhiG7F1ok1PTrD7L', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'flint', '2022-09-17 03:36:44', NULL, NULL, '__trades', '11976069C8145', NULL, '{\"ip\":\"127.0.0.1\"}'),
('xMF98gClEKc7g6s0', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'guddaz', '2022-09-17 03:36:42', NULL, NULL, '__trades', '108525F6A9B6D', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"guddaz\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:36:39\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('XPnPArujf110CZlu', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-17 03:35:40', NULL, NULL, '__trades', '185523B2CAD56', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:40\"}]', '{\"ip\":\"127.0.0.1\"}'),
('XSBIBvZplGO9a3ny', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:13', NULL, NULL, '__messages', '1060600607C5E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XYUbZE1mgW6o39nh', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-17 03:35:30', NULL, NULL, '__trades', '173183B5B498B', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-17 05:35:27\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('xzHtvNaP1UpJW5Pk', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:36:03', NULL, NULL, '__asset_accounts', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1602.1164613661,\"new_value\":1604.221724524},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1602.1164613661,\"new_value\":1604.221724524}]', '{\"ip\":\"127.0.0.1\"}'),
('Y0yuD3z7hMNakvkl', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-17 03:35:58', NULL, NULL, '__buyer_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('y1apVHAYzs32z2ni', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:34', NULL, NULL, '__messages', '1909729E77505', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Y1M7aZxPNfg4JytK', 'FACTORY_SESSION', 'Addition of _RegToken entry to database.', 'entry_create', 'system', '2022-09-17 03:34:17', NULL, NULL, '__reg_tokens', '1234567890', NULL, '{\"ip\":\"127.0.0.1\"}'),
('YxgHru5bXCXVoQEx', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:33', NULL, NULL, '__trades', '1722127CC3BC1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('z5hl9Qr31BPwTplq', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-17 03:36:11', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":267.68756998881,\"new_value\":103.29954915548}]', '{\"ip\":\"127.0.0.1\"}'),
('Z7I6ZVuL6DGR33Qi', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-17 03:36:16', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":104.92715332214,\"new_value\":103.29954915547},{\"field_name\":\"total_balance_asset_value\",\"old_value\":104.92715332214,\"new_value\":103.29954915547}]', '{\"ip\":\"127.0.0.1\"}'),
('Za5UybIHZWuCHJ87', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-17 03:35:01', NULL, '193442DD5C399', '__email_addresses', 'ross@example.com', NULL, NULL),
('zfbPE6tEHzGUJ1Jt', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:35:02', NULL, '12445379A93AD', '__notifications', '189629B3D0C8B', NULL, NULL),
('zG3dmd6eCQGHbhIz', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'keith', '2022-09-17 03:35:39', NULL, NULL, '__offers', '101955C3D9611', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zgS3b60ZuzG37oXR', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:36:19', NULL, NULL, '__messages', '115667D631485', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zHFYq3IXQlGktnr4', 'TEST_SESSION', 'Addition of _AssetAccount entry to database.', 'entry_create', 'lodza', '2022-09-17 03:35:08', NULL, NULL, '__asset_accounts', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zHRQgtNxmSZDeAZ4', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'keith', '2022-09-17 03:35:58', NULL, NULL, '__asset_accounts', '6', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":748.93617021277,\"new_value\":536.3045912654}]', '{\"ip\":\"127.0.0.1\"}'),
('zn5KHaGfiwQ30jOM', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'ross', '2022-09-17 03:35:28', NULL, NULL, '__asset_accounts', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":210.33027015936,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('ZPieP1uR9WlNbGTq', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-17 03:35:46', NULL, NULL, '__messages', '19159948F253E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ZS7ZmXDzWsJopMI2', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'jimmy', '2022-09-17 03:35:17', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":500},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":500}]', '{\"ip\":\"127.0.0.1\"}'),
('ZUXROChGJIH85u44', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'flint', '2022-09-17 03:35:10', NULL, NULL, '__asset_accounts', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":0,\"new_value\":400},{\"field_name\":\"total_balance_asset_value\",\"old_value\":0,\"new_value\":400}]', '{\"ip\":\"127.0.0.1\"}'),
('Zwj8Pd0ZdQQO7ELK', 'TEST_SESSION', 'Updating of _AssetAccount entry in database.', 'entry_update', 'lodza', '2022-09-17 03:36:21', NULL, NULL, '__asset_accounts', '7', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":1138.2978723404,\"new_value\":954.08734602461},{\"field_name\":\"total_balance_asset_value\",\"old_value\":1138.2978723404,\"new_value\":954.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('zWoELJqQcQicWsBz', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-17 03:35:04', NULL, '1029137E2ABC7', '__notifications', '1263220F41611', NULL, NULL);

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
('10254692C990E', '__trades', '185523B2CAD56', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-17 03:35:43', NULL),
('105074C7531CA', '__trades', '117105C9C9628', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-17 03:36:25', NULL),
('1058347ACED7B', '__trades', '11976069C8145', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-17 03:36:45', NULL),
('1060600607C5E', '__trades', '164896F5B4AC9', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-17 03:36:13', NULL),
('111767E4D662C', '__trades', '143249D28E91D', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-17 03:36:03', NULL),
('113992A33F1F9', '__trades', '185523B2CAD56', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-17 03:35:40', NULL),
('114275523CFC9', '__trades', '111361CCCD2B4', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-17 03:36:32', NULL),
('114372D676878', '__trades', '173183B5B498B', 'Pleasure doing business with you.', 'ross', '2022-09-17 03:35:27', NULL),
('115667D631485', '__trades', '188209D4E9885', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-17 03:36:19', NULL),
('1168964A22370', '__trades', '164896F5B4AC9', 'Asset buyer just declared their payment.', 'system', '2022-09-17 03:36:13', NULL),
('117033D44D795', '__trades', '117105C9C9628', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-17 03:36:26', NULL),
('118042B2C0B05', '__trades', '191834F743305', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-17 03:35:53', NULL),
('119329E5834CF', '__trades', '1722127CC3BC1', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-17 03:35:34', NULL),
('1254459293E17', '__trades', '185523B2CAD56', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-17 03:35:41', NULL),
('125609E4E22E6', '__trades', '143249D28E91D', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-17 03:36:00', NULL),
('12804604F5CA9', '__trades', '1454393C469F3', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-17 03:36:06', NULL),
('12837601AE2FE', '__trades', '173183B5B498B', 'I\'ve collected the money.', 'ross', '2022-09-17 03:35:26', NULL),
('1287157E80F31', '__trades', '173183B5B498B', 'Asset buyer just declared their payment.', 'system', '2022-09-17 03:35:24', NULL),
('130827985B59B', '__trades', '188209D4E9885', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-17 03:36:23', NULL),
('130965B5113D9', '__trades', '1454393C469F3', 'Asset buyer just declared their payment.', 'system', '2022-09-17 03:36:06', NULL),
('1348989EE86BB', '__trades', '108525F6A9B6D', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-17 03:36:42', NULL),
('135936ADED23F', '__trades', '188209D4E9885', 'Asset buyer just declared their payment.', 'system', '2022-09-17 03:36:19', NULL),
('136826E441A2E', '__trades', '143249D28E91D', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-17 03:35:59', NULL),
('1437576D66256', '__trades', '164896F5B4AC9', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-17 03:36:16', NULL),
('1449488260CE4', '__trades', '191834F743305', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-17 03:35:53', NULL),
('1453192D833BF', '__trades', '117105C9C9628', 'Asset buyer just declared their payment.', 'system', '2022-09-17 03:36:26', NULL),
('1459047510865', '__trades', '108525F6A9B6D', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-17 03:36:39', NULL),
('1487232F2C820', '__trades', '188209D4E9885', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-17 03:36:19', NULL),
('149056F88F94C', '__trades', '111361CCCD2B4', 'Asset buyer just declared their payment.', 'system', '2022-09-17 03:36:32', NULL),
('15033366A5766', '__trades', '185523B2CAD56', 'Asset buyer just declared their payment.', 'system', '2022-09-17 03:35:40', NULL),
('156260B5617DF', '__trades', '164896F5B4AC9', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-17 03:36:12', NULL),
('161908E9C1D47', '__trades', '11313227D1802', 'Asset buyer just declared their payment.', 'system', '2022-09-17 03:35:46', NULL),
('16634557B9B08', '__trades', '11976069C8145', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-17 03:36:44', NULL),
('16722934E8CA7', '__trades', '173183B5B498B', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-17 03:35:27', NULL),
('170323B510258', '__trades', '111361CCCD2B4', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-17 03:36:35', NULL),
('171480CAFD8F8', '__trades', '1722127CC3BC1', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-17 03:35:37', NULL),
('171671BEB5778', '__trades', '191834F743305', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-17 03:35:56', NULL),
('171778A9BF67E', '__trades', '11976069C8145', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-17 03:36:48', NULL),
('1748217AB263D', '__trades', '108525F6A9B6D', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-17 03:36:38', NULL),
('176818FB5BA5F', '__trades', '143249D28E91D', 'Asset buyer just declared their payment.', 'system', '2022-09-17 03:35:59', NULL),
('176938AC318B7', '__trades', '173183B5B498B', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-17 03:35:22', NULL),
('177776189C387', '__trades', '173183B5B498B', 'I\'ve sent the cash.\nPlease confirm receiving it.', 'guddaz', '2022-09-17 03:35:25', NULL),
('178097D38CF83', '__trades', '11313227D1802', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-17 03:35:50', NULL),
('178638D5222F2', '__trades', '173183B5B498B', 'I\'m sending the cash in a couple of minutes.', 'guddaz', '2022-09-17 03:35:23', NULL),
('1841002E74D84', '__trades', '111361CCCD2B4', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-17 03:36:32', NULL),
('185799E73D3BD', '__trades', '1454393C469F3', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-17 03:36:06', NULL),
('188347BCBE6F6', '__trades', '108525F6A9B6D', 'Asset buyer just declared their payment.', 'system', '2022-09-17 03:36:38', NULL),
('1909729E77505', '__trades', '1722127CC3BC1', 'Asset buyer just declared their payment.', 'system', '2022-09-17 03:35:33', NULL),
('19098863803C1', '__trades', '117105C9C9628', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-17 03:36:29', NULL),
('1911036F53388', '__trades', '11976069C8145', 'Asset buyer just declared their payment.', 'system', '2022-09-17 03:36:45', NULL),
('19159948F253E', '__trades', '11313227D1802', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-17 03:35:46', NULL),
('192160981DCE7', '__trades', '1722127CC3BC1', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-17 03:35:33', NULL),
('19335857D29B6', '__trades', '11313227D1802', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-17 03:35:47', NULL),
('1954410C04319', '__trades', '191834F743305', 'Asset buyer just declared their payment.', 'system', '2022-09-17 03:35:53', NULL),
('19712336E249B', '__trades', '1454393C469F3', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-17 03:36:10', NULL),
('1972152E4EA5D', '__trades', '173183B5B498B', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-17 03:35:30', NULL);

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
('1043479BCAC80', 'lodza', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:35:00', NULL),
('1104830D259C9', 'sysadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:34:14', NULL),
('11160740D4555', 'guddaz', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:34:59', NULL),
('1131140C8C69A', 'peter', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:35:03', NULL),
('118417884E4DB', 'nassim', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:35:06', NULL),
('124998CAA2902', 'flint', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:35:04', NULL),
('1263220F41611', 'clarence', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:35:04', NULL),
('133395F3C6051', 'reserves', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:34:15', NULL),
('136619A8339EF', 'developer', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:34:13', NULL),
('13996752E747B', 'keith', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:35:02', NULL),
('1485317C19D00', 'busadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:34:16', NULL),
('1795309F32117', 'raymond', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:35:05', NULL),
('189629B3D0C8B', 'jimmy', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:35:02', NULL),
('1986816B89AF5', 'ross', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-17 03:35:01', NULL);

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
('101955C3D9611', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', NULL, 'online', 'keith', '2022-09-17 03:35:39', '2022-09-17 03:35:39', NULL),
('10892113BA3FF', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.2', 700, 3000, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'lodza', '2022-09-17 03:36:17', '2022-09-17 03:36:17', NULL),
('1113499635C0E', 'Italy', NULL, 'buy', 'USDT', 'EUR', '0.76', 200, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', NULL, 'online', 'raymond', '2022-09-17 03:36:24', '2022-09-17 03:36:24', NULL),
('116291C3B5651', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.36', 1500, 2500, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'flint', '2022-09-17 03:36:11', '2022-09-17 03:36:11', NULL),
('12272187F9570', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.95', 100, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', NULL, 'online', 'raymond', '2022-09-17 03:35:32', '2022-09-17 03:35:32', NULL),
('1314935D32E10', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'ross', '2022-09-17 03:35:21', '2022-09-17 03:35:21', NULL),
('132464C4F8551', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'ZMW', '13.3', 2800, 14000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'lodza', '2022-09-17 03:35:58', '2022-09-17 03:35:58', NULL),
('1349554097581', 'Zambia', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', NULL, 'online', 'jimmy', '2022-09-17 03:35:45', '2022-09-17 03:35:45', NULL),
('139282D503EB0', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '178', 10000, 40000, NULL, NULL, 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', NULL, 'online', 'nassim', '2022-09-17 03:36:30', '2022-09-17 03:36:30', NULL),
('141749F7AABC5', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '0.94', 100, 200, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'guddaz', '2022-09-17 03:36:37', '2022-09-17 03:36:37', NULL),
('156601D73C5DB', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'clarence', '2022-09-17 03:35:51', '2022-09-17 03:35:51', NULL),
('15889625AEC3D', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 200, 300, NULL, NULL, 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', NULL, 'online', 'peter', '2022-09-17 03:36:04', '2022-09-17 03:36:04', NULL),
('171655D05341A', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '170', 20000, 40000, NULL, NULL, 'algerie_poste', '{\"account_holder_name\":\"Timothy Tambo\",\"account_number\":\"22558678\",\"account_key\":\"87\"}', NULL, 'online', 'peter', '2022-09-17 03:36:43', '2022-09-17 03:36:43', NULL),
('178458DA4E3EF', 'Zimbabwe', 'Norton', 'sell', 'USDT', 'USD', '1.04', NULL, NULL, '50', '200', 'cash_in_person', NULL, NULL, 'online', 'guddaz', '2022-09-17 03:35:31', '2022-09-17 03:35:31', NULL);

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
(1, 'Update system config params', 'update_sysconfig_params', 'Permission holder can update system config params.', 'active', 'system', '2022-09-17 05:34:10', NULL, NULL),
(2, 'Handle feedback reports', 'handle_feedback_reports', 'Permission holder can handle feedback reports.', 'active', 'system', '2022-09-17 05:34:10', NULL, NULL),
(3, 'Manage datalists', 'manage_datalists', 'Permission holder can manage datalists.', 'active', 'system', '2022-09-17 05:34:10', NULL, NULL),
(4, 'Manage system tools', 'manage_systools', 'Permission holder can manage system tools.', 'active', 'system', '2022-09-17 05:34:10', NULL, NULL),
(5, 'View all logs', 'view_all_logs', 'Permission holder can view all logs.', 'active', 'system', '2022-09-17 05:34:10', NULL, NULL),
(6, 'View all transactions', 'view_all_transactions', 'Permission holder can view all transactions.', 'active', 'system', '2022-09-17 05:34:10', NULL, NULL),
(7, 'Manage Deposit Tokens', 'manage_deposit_tokens', 'Permission holder can create and edit deposit tokens.', 'active', 'system', '2022-09-17 05:34:10', NULL, NULL),
(8, 'Handle Withdrawals', 'handle_withdrawals', 'Permission holder can handle withdrawals.', 'active', 'system', '2022-09-17 05:34:10', NULL, NULL),
(9, 'Manage Registration Tokens', 'manage_reg_tokens', 'Permission holder can create and edit registration tokens.', 'active', 'system', '2022-09-17 05:34:10', NULL, NULL),
(10, 'Handle flagged users', 'handle_flagged_users', 'Permission holder can handle flagged Users.', 'active', 'system', '2022-09-17 05:34:10', NULL, NULL),
(11, 'Handle customer service chats', 'handle_customer_service_chats', 'Permission holder can handle customer service chats.', 'active', 'system', '2022-09-17 05:34:10', NULL, NULL),
(12, 'Manage update posts', 'manage_update_posts', 'Permission holder can handle posting and editing update posts.', 'active', 'system', '2022-09-17 05:34:10', NULL, NULL),
(13, 'Handle flagged business elems', 'handle_flagged_business_elems', 'Permission holder can handle flagged business elems (Offers, Trades, etc).', 'active', 'system', '2022-09-17 05:34:10', NULL, NULL);

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
(1, '__user_groups', 'system_administrators', 'update_sysconfig_params', 'active', 'system', '2022-09-17 05:34:10', NULL),
(2, '__user_groups', 'system_administrators', 'handle_feedback_reports', 'active', 'system', '2022-09-17 05:34:10', NULL),
(3, '__user_groups', 'system_administrators', 'manage_systools', 'active', 'system', '2022-09-17 05:34:10', NULL),
(4, '__user_groups', 'system_administrators', 'manage_datalists', 'active', 'system', '2022-09-17 05:34:10', NULL),
(5, '__user_groups', 'system_administrators', 'view_all_logs', 'active', 'system', '2022-09-17 05:34:10', NULL),
(6, '__user_groups', 'business_administrators', 'view_all_transactions', 'active', 'system', '2022-09-17 05:34:10', NULL),
(7, '__user_groups', 'business_administrators', 'manage_deposit_tokens', 'active', 'system', '2022-09-17 05:34:10', NULL),
(8, '__user_groups', 'business_administrators', 'handle_withdrawals', 'active', 'system', '2022-09-17 05:34:10', NULL),
(9, '__user_groups', 'user_administrators', 'manage_reg_tokens', 'active', 'system', '2022-09-17 05:34:10', NULL),
(10, '__user_groups', 'user_administrators', 'handle_flagged_users', 'active', 'system', '2022-09-17 05:34:10', NULL),
(11, '__user_groups', 'platform_moderators', 'handle_customer_service_chats', 'active', 'system', '2022-09-17 05:34:10', NULL),
(12, '__user_groups', 'platform_moderators', 'handle_flagged_business_elems', 'active', 'system', '2022-09-17 05:34:10', NULL),
(13, '__user_groups', 'platform_moderators', 'manage_update_posts', 'active', 'system', '2022-09-17 05:34:10', NULL);

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
(1, '__users', 'system', 'Backend rest api enabled', 'backend_rest_api_enabled', '1', 'boolean', 'system', '2022-09-17 05:34:10', NULL),
(2, '__users', 'system', 'Scaffolding app enabled', 'scaffolding_app_enabled', '1', 'boolean', 'system', '2022-09-17 05:34:10', NULL),
(3, '__users', 'system', 'Fallback Display Language', 'fallback_pref_lang', 'en', 'enum:langs', 'system', '2022-09-17 05:34:10', NULL),
(4, '__users', 'system', 'Fallback Display Theme', 'fallback_pref_theme', 'light', 'enum:themes', 'system', '2022-09-17 05:34:10', NULL),
(5, '__users', 'system', 'Image storage driver', 'image_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-17 05:34:10', NULL),
(6, '__users', 'system', 'Document storage driver', 'document_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-17 05:34:10', NULL),
(7, '__users', 'system', 'Open Registration enabled', 'open_reg_enabled', '0', 'boolean', 'system', '2022-09-17 05:34:10', NULL),
(8, '__users', 'system', 'Token registration enabled', 'token_reg_enabled', '1', 'boolean', 'system', '2022-09-17 05:34:10', '2022-09-17 03:36:49'),
(9, '__users', 'system', 'Token registration max use count', 'reg_token_max_use_count', '10', 'integer', 'system', '2022-09-17 05:34:10', NULL),
(10, '__users', 'system', 'Learn mode available', 'learn_mode_available', '1', 'boolean', 'system', '2022-09-17 05:34:10', NULL),
(11, '__users', 'system', 'Offers to buy enabled', 'offer_to_buy_enabled', '1', 'boolean', 'system', '2022-09-17 05:34:10', NULL),
(12, '__users', 'system', 'Offers to sell enabled', 'offer_to_sell_enabled', '0', 'boolean', 'system', '2022-09-17 05:34:10', NULL),
(13, '__users', 'system', 'Use development crypto asset engine', 'use_dev_crypto_asset_engine', '0', 'boolean', 'system', '2022-09-17 05:34:10', NULL),
(14, '__users', 'system', 'Use tatum crypto asset engine', 'use_tatum_crypto_asset_engine', '0', 'boolean', 'system', '2022-09-17 05:34:10', NULL),
(15, '__users', 'system', 'Factor of value charged by platform on transactions', 'platform_charge_asset_factor', '0.01', 'float', 'system', '2022-09-17 05:34:10', NULL);

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
(1, 'Cash in person', 'cash_in_person', '5e5d4b', '[\"phone_no\"]', NULL, 'active', 'system', '2022-09-17 05:34:11', NULL, NULL),
(2, 'Stanbic bank', 'stanbic_bank', '066ef3', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-17 05:34:11', NULL, NULL),
(3, 'FNB bank', 'fnb_bank', '009eaa', '[\"account_holder_name\",\"account_no\"]', '[\"ZAR\"]', 'active', 'system', '2022-09-17 05:34:11', NULL, NULL),
(4, 'Mukuru', 'mukuru', 'e77924', '[\"fullname\",\"phone_no\"]', '[\"USD\"]', 'active', 'system', '2022-09-17 05:34:11', NULL, NULL),
(5, 'Algérie Poste', 'algerie_poste', '01009a', '[\"account_holder_name\",\"account_holder_address\",\"account_no\",\"account_key\"]', '[\"DZD\"]', 'active', 'system', '2022-09-17 05:34:11', NULL, NULL),
(6, 'MTN Mobile Money', 'mtn_momo', 'feca05', '[\"fullname\",\"phone_no\"]', NULL, 'active', 'system', '2022-09-17 05:34:11', NULL, NULL),
(7, 'Ecocash', 'ecocash', '005ba4', '[\"fullname\",\"phone_no\"]', '[\"ZWL\"]', 'active', 'system', '2022-09-17 05:34:11', NULL, NULL),
(8, 'Paypal', 'paypal', '27346a', '[\"fullname\",\"email_address\"]', '[\"USD\",\"EUR\",\"GBP\"]', 'active', 'system', '2022-09-17 05:34:11', NULL, NULL),
(9, 'Skrill', 'skrill', '862165', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-17 05:34:11', NULL, NULL),
(10, 'World Remit', 'world_remit', '604684', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-17 05:34:11', NULL, NULL),
(11, 'Mastercard', 'mastercard', 'cc0001', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-17 05:34:11', NULL, NULL),
(12, 'Visa', 'visa', '0055a5', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-17 05:34:11', NULL, NULL),
(13, 'FBC Bank', 'fbc_bank', '0055a5', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-17 05:34:11', NULL, NULL);

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
('1234567890', 'usable', 'system', '2022-09-17 03:34:17');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-17 03:34:14', '2022-09-17 03:34:14', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-17 03:34:15', '2022-09-17 03:34:15', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-17 03:34:16', '2022-09-17 03:34:16', NULL),
(4, 'guddaz', 'active', 'guddaz', '2022-09-17 03:35:21', '2022-09-17 03:35:21', NULL),
(5, 'lodza', 'active', 'lodza', '2022-09-17 03:35:32', '2022-09-17 03:35:32', NULL),
(6, 'ross', 'active', 'ross', '2022-09-17 03:35:51', '2022-09-17 03:35:51', NULL),
(7, 'keith', 'active', 'keith', '2022-09-17 03:35:58', '2022-09-17 03:35:58', NULL),
(8, 'jimmy', 'active', 'jimmy', '2022-09-17 03:36:18', '2022-09-17 03:36:18', NULL),
(9, 'flint', 'active', 'flint', '2022-09-17 03:36:37', '2022-09-17 03:36:37', NULL);

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
('FACTORY_SESSION', 'system', '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'ended', '2022-09-17 05:34:10', NULL, NULL, NULL),
('TEST_SESSION', NULL, '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'active', '2022-09-17 05:34:10', NULL, NULL, NULL);

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
('108525F6A9B6D', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', '2022-09-17 03:36:38', '2022-09-17 03:36:39', 1, 1, 'completed', 'guddaz', 'flint', '2022-09-17 03:36:38', '2022-09-17 03:36:42', NULL),
('111361CCCD2B4', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '202.24719101124', '204.26966292135', '0.01', 36000, '178', 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', '2022-09-17 03:36:32', '2022-09-17 03:36:32', 1, 1, 'completed', 'nassim', 'jimmy', '2022-09-17 03:36:32', '2022-09-17 03:36:36', NULL),
('11313227D1802', 'Zambia', NULL, 'buy', 'USDT', 'USD', '638.29787234043', '644.68085106383', '0.01', 600, '0.94', 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', '2022-09-17 03:35:46', '2022-09-17 03:35:47', 1, 1, 'completed', 'jimmy', 'lodza', '2022-09-17 03:35:46', '2022-09-17 03:35:50', NULL),
('117105C9C9628', 'Italy', NULL, 'buy', 'USDT', 'EUR', '263.15789473684', '265.78947368421', '0.01', 200, '0.76', 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', '2022-09-17 03:36:26', '2022-09-17 03:36:26', 1, 1, 'completed', 'raymond', 'jimmy', '2022-09-17 03:36:25', '2022-09-17 03:36:29', NULL),
('11976069C8145', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '205.88235294118', '207.94117647059', '0.01', 35000, '170', 'algerie_poste', '{\"account_holder_name\":\"Timothy Tambo\",\"account_number\":\"22558678\",\"account_key\":\"87\"}', '2022-09-17 03:36:45', '2022-09-17 03:36:45', 1, 1, 'completed', 'peter', 'flint', '2022-09-17 03:36:44', '2022-09-17 03:36:48', NULL),
('143249D28E91D', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'ZMW', '210.52631578947', '212.63157894737', '0.01', 2800, '13.3', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-17 03:35:59', '2022-09-17 03:36:00', 1, 1, 'completed', 'lodza', 'keith', '2022-09-17 03:35:59', '2022-09-17 03:36:03', NULL),
('1454393C469F3', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '265.95744680851', '268.6170212766', '0.01', 250, '0.94', 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', '2022-09-17 03:36:06', '2022-09-17 03:36:06', 1, 1, 'completed', 'peter', 'keith', '2022-09-17 03:36:06', '2022-09-17 03:36:10', NULL),
('164896F5B4AC9', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '162.76041666667', '164.38802083333', '0.01', 2500, '15.36', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-17 03:36:13', '2022-09-17 03:36:13', 1, 1, 'completed', 'flint', 'keith', '2022-09-17 03:36:12', '2022-09-17 03:36:16', NULL),
('1722127CC3BC1', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '105.26315789474', '106.31578947368', '0.01', 100, '0.95', 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', '2022-09-17 03:35:33', '2022-09-17 03:35:34', 1, 1, 'completed', 'raymond', 'lodza', '2022-09-17 03:35:33', '2022-09-17 03:35:38', NULL),
('173183B5B498B', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '106.3829787234', '107.44680851064', '0.01', 100, '0.94', 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', '2022-09-17 03:35:24', '2022-09-17 03:35:27', 1, 1, 'completed', 'ross', 'guddaz', '2022-09-17 03:35:22', '2022-09-17 03:35:30', NULL),
('185523B2CAD56', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '148.93617021277', '150.42553191489', '0.01', 140, '0.94', 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', '2022-09-17 03:35:40', '2022-09-17 03:35:41', 1, 1, 'completed', 'keith', 'lodza', '2022-09-17 03:35:40', '2022-09-17 03:35:44', NULL),
('188209D4E9885', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '184.21052631579', '186.05263157895', '0.01', 2800, '15.2', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-17 03:36:19', '2022-09-17 03:36:19', 1, 1, 'completed', 'lodza', 'jimmy', '2022-09-17 03:36:19', '2022-09-17 03:36:23', NULL),
('191834F743305', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-17 03:35:53', '2022-09-17 03:35:53', 1, 1, 'completed', 'clarence', 'ross', '2022-09-17 03:35:53', '2022-09-17 03:35:56', NULL);

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
('101949D653599', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'flint', 'USDT', '400', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":400,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":400}]', '2022-09-17 03:35:10', NULL),
('101977A590586', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '106.76', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":967.86579,\"new_usable_balance_asset_value\":1074.62579,\"old_total_balance_asset_value\":967.86579,\"new_total_balance_asset_value\":1074.62579}]', '2022-09-17 03:35:12', NULL),
('106263CF935AB', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"111361CCCD2B4\"', 'trade_asset_release', 'jimmy', 'nassim', 'USDT', '202.24719101124', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":686.45576707724,\"new_usable_balance_asset_value\":484.208576066,\"old_total_balance_asset_value\":686.45576707724,\"new_total_balance_asset_value\":484.208576066},{\"user_username\":\"nassim\",\"old_usable_balance_asset_value\":100,\"new_usable_balance_asset_value\":302.24719101124,\"old_total_balance_asset_value\":100,\"new_total_balance_asset_value\":302.24719101124}]', '2022-09-17 03:36:34', NULL),
('1065398C90528', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"180056E9F9E94\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '6.3829787234043', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":179.58659627098,\"new_usable_balance_asset_value\":173.20361754758,\"old_total_balance_asset_value\":179.58659627098,\"new_total_balance_asset_value\":173.20361754758},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1593.6058230682,\"new_usable_balance_asset_value\":1599.9888017916,\"old_total_balance_asset_value\":1593.6058230682,\"new_total_balance_asset_value\":1599.9888017916}]', '2022-09-17 03:35:50', NULL),
('106554A4BC357', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"108525F6A9B6D\"', 'trade_asset_release', 'flint', 'guddaz', 'USDT', '212.76595744681', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":562.76041666667,\"new_usable_balance_asset_value\":349.99445921986,\"old_total_balance_asset_value\":562.76041666667,\"new_total_balance_asset_value\":349.99445921986},{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":210.33027015937,\"new_usable_balance_asset_value\":423.09622760618,\"old_total_balance_asset_value\":210.33027015937,\"new_total_balance_asset_value\":423.09622760618}]', '2022-09-17 03:36:40', NULL),
('107947E7F078A', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"191834F743305\"', 'trade_asset_release', 'ross', 'clarence', 'USDT', '212.76595744681', '[{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":216.3829787234,\"new_usable_balance_asset_value\":3.61702127659,\"old_total_balance_asset_value\":216.3829787234,\"new_total_balance_asset_value\":3.61702127659},{\"user_username\":\"clarence\",\"old_usable_balance_asset_value\":100,\"new_usable_balance_asset_value\":312.76595744681,\"old_total_balance_asset_value\":100,\"new_total_balance_asset_value\":312.76595744681}]', '2022-09-17 03:35:55', NULL),
('109703B50F8B9', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"188209D4E9885\"', 'trade_asset_release', 'jimmy', 'lodza', 'USDT', '184.21052631579', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":1138.2978723404,\"new_usable_balance_asset_value\":954.08734602461,\"old_total_balance_asset_value\":1138.2978723404,\"new_total_balance_asset_value\":954.08734602461},{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":383.72993333705,\"new_usable_balance_asset_value\":567.94045965284,\"old_total_balance_asset_value\":383.72993333705,\"new_total_balance_asset_value\":567.94045965284}]', '2022-09-17 03:36:21', NULL),
('110040C7CC196', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"1803936AC4D50\"', 'deposit_token_topup', 'reserves', 'ross', 'USDT', '110', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":3000,\"new_usable_balance_asset_value\":2890,\"old_total_balance_asset_value\":3000,\"new_total_balance_asset_value\":2890},{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":110,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":110}]', '2022-09-17 03:35:14', NULL),
('1117340B60C16', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"1160710644605\"', 'deposit_token_topup', 'reserves', 'nassim', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1690,\"new_usable_balance_asset_value\":1590,\"old_total_balance_asset_value\":1690,\"new_total_balance_asset_value\":1590},{\"user_username\":\"nassim\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":100,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":100}]', '2022-09-17 03:35:20', NULL),
('114962B23DBC4', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1454393C469F3\"', 'trade_asset_release', 'keith', 'peter', 'USDT', '265.95744680851', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":536.30459126541,\"new_usable_balance_asset_value\":270.3471444569,\"old_total_balance_asset_value\":536.30459126541,\"new_total_balance_asset_value\":270.3471444569},{\"user_username\":\"peter\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":265.95744680851,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":265.95744680851}]', '2022-09-17 03:36:08', NULL),
('1174059F49FE9', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Exodus wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '98.9012', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":218.87587867,\"new_usable_balance_asset_value\":317.77707867,\"old_total_balance_asset_value\":218.87587867,\"new_total_balance_asset_value\":317.77707867}]', '2022-09-17 03:35:11', NULL),
('1226399FFCE9B', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"1453866809A2D\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.1052631578947', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":538.4098544233,\"new_usable_balance_asset_value\":536.30459126541,\"old_total_balance_asset_value\":538.4098544233,\"new_total_balance_asset_value\":536.30459126541},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1602.1164613661,\"new_usable_balance_asset_value\":1604.221724524,\"old_total_balance_asset_value\":1602.1164613661,\"new_total_balance_asset_value\":1604.221724524}]', '2022-09-17 03:36:03', NULL),
('123449E104DB7', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"138078E2D7777\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.0526315789474', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":969.36263210526,\"new_usable_balance_asset_value\":968.31000052631,\"old_total_balance_asset_value\":969.36263210526,\"new_total_balance_asset_value\":968.31000052631},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1591.0638297872,\"new_usable_balance_asset_value\":1592.1164613661,\"old_total_balance_asset_value\":1591.0638297872,\"new_total_balance_asset_value\":1592.1164613661}]', '2022-09-17 03:35:37', NULL),
('1261314CF15CF', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"190466C418F93\"', 'deposit_token_topup', 'reserves', 'keith', 'USDT', '600', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2890,\"new_usable_balance_asset_value\":2290,\"old_total_balance_asset_value\":2890,\"new_total_balance_asset_value\":2290},{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":600,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":600}]', '2022-09-17 03:35:15', NULL),
('1304227C53D3A', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"189142A74425D\"', 'platform_charge', 'keith', 'reserves', 'USDT', '1.6276041666667', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":104.92715332214,\"new_usable_balance_asset_value\":103.29954915547,\"old_total_balance_asset_value\":104.92715332214,\"new_total_balance_asset_value\":103.29954915547},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1606.8812989921,\"new_usable_balance_asset_value\":1608.5089031588,\"old_total_balance_asset_value\":1606.8812989921,\"new_total_balance_asset_value\":1608.5089031588}]', '2022-09-17 03:36:16', NULL),
('1304660AD13DB', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"171590413501A\"', 'platform_charge', 'guddaz', 'reserves', 'USDT', '1.063829787234', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":211.3940999466,\"new_usable_balance_asset_value\":210.33027015937,\"old_total_balance_asset_value\":211.3940999466,\"new_total_balance_asset_value\":210.33027015937},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1590,\"new_usable_balance_asset_value\":1591.0638297872,\"old_total_balance_asset_value\":1590,\"new_total_balance_asset_value\":1591.0638297872}]', '2022-09-17 03:35:30', NULL),
('133332DB599A1', 'onchain', 'c83f8818db43d9ba4accfe454aa44fc33123d47a4f89d47b314d6748eb0e9bc9', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli Reserves Wallet.', 'internalisation', NULL, 'reserves', 'USDT', '3000', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":3000,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":3000}]', '2022-09-17 03:35:06', NULL),
('1349425042416', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"19501377BAA63\"', 'deposit_token_topup', 'reserves', 'jimmy', 'USDT', '500', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":2290,\"new_usable_balance_asset_value\":1790,\"old_total_balance_asset_value\":2290,\"new_total_balance_asset_value\":1790},{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":500,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":500}]', '2022-09-17 03:35:17', NULL),
('1360177BFB507', 'onchain', '62BD544D1B9031EFC330A3E855CC3A0D51CA5131455C1AB3BCAC6D243F65460D', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '218.87587867', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":218.87587867,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":218.87587867}]', '2022-09-17 03:35:07', NULL),
('13694933AA17B', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"114962B23DBC4\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.6595744680851', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":270.3471444569,\"new_usable_balance_asset_value\":267.68756998881,\"old_total_balance_asset_value\":270.3471444569,\"new_total_balance_asset_value\":267.68756998881},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1604.221724524,\"new_usable_balance_asset_value\":1606.8812989921,\"old_total_balance_asset_value\":1604.221724524,\"new_total_balance_asset_value\":1606.8812989921}]', '2022-09-17 03:36:10', NULL),
('138078E2D7777', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"1722127CC3BC1\"', 'trade_asset_release', 'lodza', 'raymond', 'USDT', '105.26315789474', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":1074.62579,\"new_usable_balance_asset_value\":969.36263210526,\"old_total_balance_asset_value\":1074.62579,\"new_total_balance_asset_value\":969.36263210526},{\"user_username\":\"raymond\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":105.26315789474,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":105.26315789474}]', '2022-09-17 03:35:36', NULL),
('141824DD8F2CB', 'offchain', NULL, NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"147079F9A7C3C\"', 'deposit_token_topup', 'reserves', 'clarence', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1790,\"new_usable_balance_asset_value\":1690,\"old_total_balance_asset_value\":1790,\"new_total_balance_asset_value\":1690},{\"user_username\":\"clarence\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":100,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":100}]', '2022-09-17 03:35:18', NULL),
('142574A02F40C', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"106554A4BC357\"', 'platform_charge', 'flint', 'reserves', 'USDT', '2.1276595744681', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":349.99445921986,\"new_usable_balance_asset_value\":347.86679964539,\"old_total_balance_asset_value\":349.99445921986,\"new_total_balance_asset_value\":347.86679964539},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1615.0050592795,\"new_usable_balance_asset_value\":1617.132718854,\"old_total_balance_asset_value\":1615.0050592795,\"new_total_balance_asset_value\":1617.132718854}]', '2022-09-17 03:36:42', NULL),
('1453866809A2D', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"143249D28E91D\"', 'trade_asset_release', 'keith', 'lodza', 'USDT', '210.52631578947', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":748.93617021277,\"new_usable_balance_asset_value\":538.4098544233,\"old_total_balance_asset_value\":748.93617021277,\"new_total_balance_asset_value\":538.4098544233},{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":173.20361754758,\"new_usable_balance_asset_value\":383.72993333705,\"old_total_balance_asset_value\":173.20361754758,\"new_total_balance_asset_value\":383.72993333705}]', '2022-09-17 03:36:02', NULL),
('14727663FFA27', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"1612778605DF8\"', 'platform_charge', 'flint', 'reserves', 'USDT', '2.0588235294118', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":141.98444670421,\"new_usable_balance_asset_value\":139.9256231748,\"old_total_balance_asset_value\":141.98444670421,\"new_total_balance_asset_value\":139.9256231748},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1617.132718854,\"new_usable_balance_asset_value\":1619.1915423834,\"old_total_balance_asset_value\":1617.132718854,\"new_total_balance_asset_value\":1619.1915423834}]', '2022-09-17 03:36:48', NULL),
('157859681D514', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"161242AA97D15\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.6315789473684', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":689.08734602461,\"new_usable_balance_asset_value\":686.45576707724,\"old_total_balance_asset_value\":689.08734602461,\"new_total_balance_asset_value\":686.45576707724},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1610.351008422,\"new_usable_balance_asset_value\":1612.9825873694,\"old_total_balance_asset_value\":1610.351008422,\"new_total_balance_asset_value\":1612.9825873694}]', '2022-09-17 03:36:29', NULL),
('161242AA97D15', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"117105C9C9628\"', 'trade_asset_release', 'jimmy', 'raymond', 'USDT', '263.15789473684', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":952.24524076145,\"new_usable_balance_asset_value\":689.08734602461,\"old_total_balance_asset_value\":952.24524076145,\"new_total_balance_asset_value\":689.08734602461},{\"user_username\":\"raymond\",\"old_usable_balance_asset_value\":105.26315789474,\"new_usable_balance_asset_value\":368.42105263158,\"old_total_balance_asset_value\":105.26315789474,\"new_total_balance_asset_value\":368.42105263158}]', '2022-09-17 03:36:28', NULL),
('1612778605DF8', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"11976069C8145\"', 'trade_asset_release', 'flint', 'peter', 'USDT', '205.88235294118', '[{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":347.86679964539,\"new_usable_balance_asset_value\":141.98444670421,\"old_total_balance_asset_value\":347.86679964539,\"new_total_balance_asset_value\":141.98444670421},{\"user_username\":\"peter\",\"old_usable_balance_asset_value\":265.95744680851,\"new_usable_balance_asset_value\":471.83979974969,\"old_total_balance_asset_value\":265.95744680851,\"new_total_balance_asset_value\":471.83979974969}]', '2022-09-17 03:36:46', NULL),
('1650626265A2B', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"1772162C97C11\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.4893617021277', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":819.37383031354,\"new_usable_balance_asset_value\":817.88446861141,\"old_total_balance_asset_value\":819.37383031354,\"new_total_balance_asset_value\":817.88446861141},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1592.1164613661,\"new_usable_balance_asset_value\":1593.6058230682,\"old_total_balance_asset_value\":1592.1164613661,\"new_total_balance_asset_value\":1593.6058230682}]', '2022-09-17 03:35:43', NULL),
('171590413501A', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"173183B5B498B\"', 'trade_asset_release', 'guddaz', 'ross', 'USDT', '106.3829787234', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":317.77707867,\"new_usable_balance_asset_value\":211.3940999466,\"old_total_balance_asset_value\":317.77707867,\"new_total_balance_asset_value\":211.3940999466},{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":110,\"new_usable_balance_asset_value\":216.3829787234,\"old_total_balance_asset_value\":110,\"new_total_balance_asset_value\":216.3829787234}]', '2022-09-17 03:35:29', NULL),
('1772162C97C11', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"185523B2CAD56\"', 'trade_asset_release', 'lodza', 'keith', 'USDT', '148.93617021277', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":968.31000052631,\"new_usable_balance_asset_value\":819.37383031354,\"old_total_balance_asset_value\":968.31000052631,\"new_total_balance_asset_value\":819.37383031354},{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":600,\"new_usable_balance_asset_value\":748.93617021277,\"old_total_balance_asset_value\":600,\"new_total_balance_asset_value\":748.93617021277}]', '2022-09-17 03:35:42', NULL),
('178350D858E55', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"109703B50F8B9\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '1.8421052631579', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":954.08734602461,\"new_usable_balance_asset_value\":952.24524076145,\"old_total_balance_asset_value\":954.08734602461,\"new_total_balance_asset_value\":952.24524076145},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1608.5089031588,\"new_usable_balance_asset_value\":1610.351008422,\"old_total_balance_asset_value\":1608.5089031588,\"new_total_balance_asset_value\":1610.351008422}]', '2022-09-17 03:36:23', NULL),
('180056E9F9E94', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"11313227D1802\"', 'trade_asset_release', 'lodza', 'jimmy', 'USDT', '638.29787234043', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":817.88446861141,\"new_usable_balance_asset_value\":179.58659627098,\"old_total_balance_asset_value\":817.88446861141,\"new_total_balance_asset_value\":179.58659627098},{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":500,\"new_usable_balance_asset_value\":1138.2978723404,\"old_total_balance_asset_value\":500,\"new_total_balance_asset_value\":1138.2978723404}]', '2022-09-17 03:35:48', NULL),
('187258BB3C237', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"107947E7F078A\"', 'platform_charge', 'ross', 'reserves', 'USDT', '2.1276595744681', '[{\"user_username\":\"ross\",\"old_usable_balance_asset_value\":3.61702127659,\"new_usable_balance_asset_value\":1.4893617021219,\"old_total_balance_asset_value\":3.61702127659,\"new_total_balance_asset_value\":1.4893617021219},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1599.9888017916,\"new_usable_balance_asset_value\":1602.1164613661,\"old_total_balance_asset_value\":1599.9888017916,\"new_total_balance_asset_value\":1602.1164613661}]', '2022-09-17 03:35:56', NULL),
('18841048B888F', 'offchain', NULL, NULL, 'TEST_SESSION', 'Platform charge for transaction \"106263CF935AB\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.0224719101124', '[{\"user_username\":\"jimmy\",\"old_usable_balance_asset_value\":484.208576066,\"new_usable_balance_asset_value\":482.18610415589,\"old_total_balance_asset_value\":484.208576066,\"new_total_balance_asset_value\":482.18610415589},{\"user_username\":\"reserves\",\"old_usable_balance_asset_value\":1612.9825873694,\"new_usable_balance_asset_value\":1615.0050592795,\"old_total_balance_asset_value\":1612.9825873694,\"new_total_balance_asset_value\":1615.0050592795}]', '2022-09-17 03:36:35', NULL),
('189142A74425D', 'offchain', NULL, NULL, 'TEST_SESSION', 'Asset release for trade \"164896F5B4AC9\"', 'trade_asset_release', 'keith', 'flint', 'USDT', '162.76041666667', '[{\"user_username\":\"keith\",\"old_usable_balance_asset_value\":267.68756998881,\"new_usable_balance_asset_value\":104.92715332214,\"old_total_balance_asset_value\":267.68756998881,\"new_total_balance_asset_value\":104.92715332214},{\"user_username\":\"flint\",\"old_usable_balance_asset_value\":400,\"new_usable_balance_asset_value\":562.76041666667,\"old_total_balance_asset_value\":400,\"new_total_balance_asset_value\":562.76041666667}]', '2022-09-17 03:36:15', NULL),
('198909719FAA8', 'onchain', '62BD544D1B9031EFC330A3E855CC3A0D51CA5131455C1AB3BCAC6D243F65460D', NULL, 'TEST_SESSION', 'Transfer from Ledger wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '967.86579', '[{\"user_username\":\"lodza\",\"old_usable_balance_asset_value\":0,\"new_usable_balance_asset_value\":967.86579,\"old_total_balance_asset_value\":0,\"new_total_balance_asset_value\":967.86579}]', '2022-09-17 03:35:08', NULL);

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
(1, 'system', 'system', '', NULL, NULL, NULL, 'active', '2022-09-17 05:34:09', NULL, NULL),
(2, 'developer', 'developer.ankelli@gmail.com', '$2y$10$cNmwQ5zxKe4wlMoKpvxzReW6SqWcpuwM.aJgLqQVhxjo53bVkytBS', NULL, NULL, NULL, 'active', '2022-09-17 03:34:13', '2022-09-17 03:34:13', NULL),
(3, 'sysadmin', 'sysadmin@ankelli.com', '$2y$10$npiaNoZzrPr.dTcCClugJeMJ1YAkaVdviCK90q3981NJcGTTF7dXy', NULL, NULL, NULL, 'active', '2022-09-17 03:34:14', '2022-09-17 03:34:14', NULL),
(4, 'reserves', 'reserves@ankelli.com', '$2y$10$5Y3Swws3dVfIlk36Fkwa/udUDtd8oPsTk6cLhXDnxZ5SPHUVG0Gua', NULL, NULL, NULL, 'active', '2022-09-17 03:34:15', '2022-09-17 03:34:15', NULL),
(5, 'busadmin', 'busadmin@ankelli.com', '$2y$10$IgDJwDYNjyp8FsHCU8Z53OkUVNKji041kOGf/SQRTBCzzyvDzEhza', NULL, NULL, NULL, 'active', '2022-09-17 03:34:16', '2022-09-17 03:34:16', NULL),
(6, 'guddaz', 'goodhopedhliwayo@gmail.com', '$2y$10$DKNqbHpWw9WBFkGpsiBD5OqSlPii0vPuAt0ks3tDxZG/TvEnf9vce', NULL, NULL, NULL, 'active', '2022-09-17 03:34:59', '2022-09-17 03:34:59', NULL),
(7, 'lodza', 'lodza@example.com', '$2y$10$.POz3X36f6HgJwL8OOoHDu070XA6Kz7yiwgHcIvKK7sdBczcIjsmm', NULL, NULL, NULL, 'active', '2022-09-17 03:35:00', '2022-09-17 03:35:00', NULL),
(8, 'ross', 'ross@example.com', '$2y$10$J.696PlkchVkxcM29q97BuqEj5wn1Kuj7Dw2cYsIVDT1GiUkW2wie', NULL, NULL, NULL, 'active', '2022-09-17 03:35:01', '2022-09-17 03:35:01', NULL),
(9, 'jimmy', 'jimmy@example.com', '$2y$10$u7eBIVQhj.bAt6tEA11fNe8vw5oaPa/73YI3UIygML1yeil1KaXNS', NULL, NULL, NULL, 'active', '2022-09-17 03:35:02', '2022-09-17 03:35:02', NULL),
(10, 'keith', 'keith@example.com', '$2y$10$1vjC6Sjfgk4UMvRmU7aG/.rjUhEWYvVcOSC5cYlEu.ytsVFU.S.sm', NULL, NULL, NULL, 'active', '2022-09-17 03:35:02', '2022-09-17 03:35:02', NULL),
(11, 'peter', 'peter@example.com', '$2y$10$O.YQ/mG3eaEbHAOv1GZ8e.mF0PkrZ1okg3AOLtdd1FEicLVJmLcRq', NULL, NULL, NULL, 'active', '2022-09-17 03:35:03', '2022-09-17 03:35:03', NULL),
(12, 'flint', 'flint@example.com', '$2y$10$D9j1i1x/84F26a2E9nK8sulBBGzhnyEe9GSrKhgGQhytxgKv9gOge', NULL, NULL, NULL, 'active', '2022-09-17 03:35:03', '2022-09-17 03:35:03', NULL),
(13, 'clarence', 'clarence@example.com', '$2y$10$TNZNSjLWylcH3k0QA4fuvuJ3VrwPhPKBsgib8WuWtSjE0LYlZ.d3C', NULL, NULL, NULL, 'active', '2022-09-17 03:35:04', '2022-09-17 03:35:04', NULL),
(14, 'raymond', 'raymond@example.com', '$2y$10$izGB7liesmRGdR8QtNFo1ujINGTDVEvF5rFWmaE8UwcssU23w3YnC', NULL, NULL, NULL, 'active', '2022-09-17 03:35:05', '2022-09-17 03:35:05', NULL),
(15, 'nassim', 'nassim@example.com', '$2y$10$Mmf422laRRfXbwHdbUrxoevmI.o1T6TcjhK/Fx05VRlx4Z4woYTBC', NULL, NULL, NULL, 'active', '2022-09-17 03:35:05', '2022-09-17 03:35:05', NULL);

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
(1, 'Default Users', 'default_users', 'Group for Default User accounts created on system initialization and factory_data loading. \nNew users cannot be added to this group.', 'active', 'system', '2022-09-17 05:34:09', NULL, NULL),
(2, 'Administrators', 'administrators', 'Automatically joined group (Users with active Admin Extension). \nMembers can be added to other admin groups.', 'active', 'system', '2022-09-17 05:34:09', NULL, NULL),
(3, 'Developers', 'developers', 'Admin group for unrestricted system users. \nMembers have access to all features and OTP access to account named \"developer\". \nOnly \"developer\" account can add members to this group.\nGroup used for System Development and Maintenance.', 'active', 'system', '2022-09-17 05:34:09', NULL, NULL),
(4, 'System Administrators', 'system_administrators', 'Admin Group for System Administrators. \nMembers can manage system functions and sysconfig params. \nMembers have OTP access to account named \"sysadmin\".\nOnly \"sysadmin\" account can add members to this group.', 'active', 'system', '2022-09-17 05:34:09', NULL, NULL),
(5, 'Business Administrators', 'business_administrators', 'Admin group for Business Administrators.\nMembers have access to business related features.\nMembers have OTP access to accounts named \"reserves\" and \"busadmin\".\nOnly \"busadmin\" account can add members to this group.', 'active', 'system', '2022-09-17 05:34:09', NULL, NULL),
(6, 'User Administrators', 'user_administrators', 'Admin group for User Administrators. \nMembers can manage other users and user related queries.', 'active', 'system', '2022-09-17 05:34:09', NULL, NULL),
(7, 'Platform moderators', 'platform_moderators', 'Group for Platform moderators. \nMembers can respond in the customer service chat module, handle flagged business elements, manage daily updates.', 'active', 'system', '2022-09-17 05:34:09', NULL, NULL),
(8, 'Sellers', 'sellers', 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.', 'active', 'system', '2022-09-17 05:34:09', NULL, NULL),
(9, 'Buyers', 'buyers', 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.', 'active', 'system', '2022-09-17 05:34:09', NULL, NULL),
(10, 'Beta Testers', 'beta_testers', 'User Group for selected individuals to test certain features before they are published.', 'active', 'system', '2022-09-17 05:34:09', NULL, NULL);

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
(1, 'developer', 'default_users', 'active', 'system', '2022-09-17 03:34:13', '2022-09-17 03:34:13'),
(2, 'developer', 'developers', 'active', 'system', '2022-09-17 03:34:13', '2022-09-17 03:34:13'),
(3, 'sysadmin', 'default_users', 'active', 'system', '2022-09-17 03:34:14', '2022-09-17 03:34:14'),
(4, 'sysadmin', 'system_administrators', 'active', 'system', '2022-09-17 03:34:14', '2022-09-17 03:34:14'),
(5, 'reserves', 'default_users', 'active', 'system', '2022-09-17 03:34:15', '2022-09-17 03:34:15'),
(6, 'reserves', 'business_administrators', 'active', 'system', '2022-09-17 03:34:15', '2022-09-17 03:34:15'),
(7, 'busadmin', 'default_users', 'active', 'system', '2022-09-17 03:34:16', '2022-09-17 03:34:16'),
(8, 'busadmin', 'business_administrators', 'active', 'system', '2022-09-17 03:34:16', '2022-09-17 03:34:16'),
(9, 'guddaz', 'developers', 'active', 'system', '2022-09-17 03:34:59', '2022-09-17 03:34:59'),
(10, 'lodza', 'system_administrators', 'active', 'system', '2022-09-17 03:35:00', '2022-09-17 03:35:00'),
(11, 'lodza', 'user_administrators', 'active', 'system', '2022-09-17 03:35:01', '2022-09-17 03:35:01'),
(12, 'lodza', 'business_administrators', 'active', 'system', '2022-09-17 03:35:01', '2022-09-17 03:35:01');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;

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
