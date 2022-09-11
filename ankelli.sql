-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 11, 2022 at 03:32 AM
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
(481, '2014_10_12_000000_create_users_table', 1),
(482, '2014_10_12_100000_create_password_resets_table', 1),
(483, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(484, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(485, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(486, '2016_06_01_000004_create_oauth_clients_table', 1),
(487, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(488, '2019_08_19_000000_create_failed_jobs_table', 1),
(489, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(490, '2022_07_26_072130_create___sessions_table', 1),
(491, '2022_07_26_072137_create___email_addresses_table', 1),
(492, '2022_07_26_072141_create___pref_items_table', 1),
(493, '2022_07_26_072144_create___notifications_table', 1),
(494, '2022_07_26_072147_create___verif_tokens_table', 1),
(495, '2022_07_26_072151_create___reg_tokens_table', 1),
(496, '2022_07_26_072323_create___phone_nos_table', 1),
(497, '2022_07_26_072326_create___files_table', 1),
(498, '2022_07_26_072330_create___logs_table', 1),
(499, '2022_07_26_072334_create___messages_table', 1),
(500, '2022_07_26_072335_create___assets_table', 1),
(501, '2022_07_26_072336_create___currencies_table', 1),
(502, '2022_07_26_072337_create___pymt_methods_table', 1),
(503, '2022_07_26_072341_create___exportables_table', 1),
(504, '2022_07_26_072345_create___countries_table', 1),
(505, '2022_07_26_072349_create___user_groups_table', 1),
(506, '2022_07_26_072353_create___user_group_memberships_table', 1),
(507, '2022_07_26_072356_create___permissions_table', 1),
(508, '2022_07_26_072400_create___permission_instances_table', 1),
(509, '2022_07_26_072403_create___asset_wallets_table', 1),
(510, '2022_07_26_072406_create___chats_table', 1),
(511, '2022_07_26_072410_create___deposit_tokens_table', 1),
(512, '2022_07_26_072413_create___feedback_reports_table', 1),
(513, '2022_07_26_072416_create___offers_table', 1),
(514, '2022_07_26_072421_create___pinnings_table', 1),
(515, '2022_07_26_072424_create___posts_table', 1),
(516, '2022_07_26_072427_create___transactions_table', 1),
(517, '2022_07_26_072428_create___trades_table', 1),
(518, '2022_07_26_072435_create___admin_extensions_table', 1),
(519, '2022_07_26_072438_create___buyer_extensions_table', 1),
(520, '2022_07_26_072442_create___seller_extensions_table', 1);

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
('f67f519b3f1f830363d0a7a7a9876a39d621ead000fcbfe9c4d78c090827c89b62ac4a1a730692a3', 7, 1, 'auth_token', '[]', 0, '2022-09-10 23:27:19', '2022-09-10 23:27:19', '2023-09-11 01:27:19');

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
(1, NULL, 'Ankelli Personal Access Client', 'vtHhpp5LMo7UXm7dAjtZOaW1xE5YibqHobWvA0pP', NULL, 'http://localhost', 1, 0, 0, '2022-09-10 23:24:57', '2022-09-10 23:24:57'),
(2, NULL, 'Ankelli Password Grant Client', 'WtVQqWQJM0Czqu69eN2RqQ8DHbZF83Fms8yOPoli', 'users', 'http://localhost', 0, 1, 0, '2022-09-10 23:24:57', '2022-09-10 23:24:57');

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
(1, 1, '2022-09-10 23:24:57', '2022-09-10 23:24:57');

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
(1, 'system', 'System', 'active', 'system', '2022-09-11 01:24:53', NULL, NULL),
(2, 'developer', 'Default Developer', 'active', 'system', '2022-09-10 23:24:54', '2022-09-10 23:24:54', NULL),
(3, 'sysadmin', 'Default System Administrator', 'active', 'system', '2022-09-10 23:24:54', '2022-09-10 23:24:54', NULL),
(4, 'reserves', 'Ankelli Asset Reserves', 'active', 'system', '2022-09-10 23:24:55', '2022-09-10 23:24:55', NULL),
(5, 'busadmin', 'Default Business Administrator', 'active', 'system', '2022-09-10 23:24:56', '2022-09-10 23:24:56', NULL),
(6, 'guddaz', 'Head System Developer', 'active', 'system', '2022-09-10 23:25:01', '2022-09-10 23:25:01', NULL),
(7, 'lodza', 'Head Business Administrator', 'active', 'system', '2022-09-10 23:25:02', '2022-09-10 23:25:02', NULL);

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
(1, NULL, NULL, 'Tether USD', 'USDT', '0.0001', 'active', 'system', '2022-09-10 23:24:53', '2022-09-10 23:24:53');

-- --------------------------------------------------------

--
-- Table structure for table `__asset_wallets`
--

CREATE TABLE `__asset_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blockchain_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blockchain_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blockchain_private_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_value` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `_status` enum('active','frozen') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__asset_wallets`
--

INSERT INTO `__asset_wallets` (`id`, `blockchain_id`, `blockchain_address`, `blockchain_private_key`, `tatum_customer_id`, `user_username`, `asset_code`, `asset_value`, `_status`, `created_datetime`, `updated_datetime`) VALUES
(1, NULL, NULL, NULL, NULL, 'reserves', 'USDT', '1619.1915423834', 'active', '2022-09-10 23:25:08', '2022-09-10 23:26:52'),
(2, NULL, NULL, NULL, NULL, 'guddaz', 'USDT', '423.09622760618', 'active', '2022-09-10 23:25:09', '2022-09-10 23:26:44'),
(3, NULL, NULL, NULL, NULL, 'lodza', 'USDT', '567.94045965284', 'active', '2022-09-10 23:25:10', '2022-09-10 23:26:25'),
(4, NULL, NULL, NULL, NULL, 'flint', 'USDT', '139.9256231748', 'active', '2022-09-10 23:25:12', '2022-09-10 23:26:52'),
(5, NULL, NULL, NULL, NULL, 'ross', 'USDT', '1.4893617021219', 'active', '2022-09-10 23:25:15', '2022-09-10 23:26:00'),
(6, NULL, NULL, NULL, NULL, 'keith', 'USDT', '103.29954915547', 'active', '2022-09-10 23:25:17', '2022-09-10 23:26:20'),
(7, NULL, NULL, NULL, NULL, 'jimmy', 'USDT', '482.18610415589', 'active', '2022-09-10 23:25:19', '2022-09-10 23:26:39'),
(8, NULL, NULL, NULL, NULL, 'clarence', 'USDT', '312.76595744681', 'active', '2022-09-10 23:25:21', '2022-09-10 23:25:59'),
(9, NULL, NULL, NULL, NULL, 'nassim', 'USDT', '302.24719101124', 'active', '2022-09-10 23:25:23', '2022-09-10 23:26:38'),
(10, NULL, NULL, NULL, NULL, 'escrow', 'USDT', '0', 'active', '2022-09-10 23:25:25', '2022-09-10 23:26:49'),
(11, NULL, NULL, NULL, NULL, 'raymond', 'USDT', '368.42105263158', 'active', '2022-09-10 23:25:39', '2022-09-10 23:26:31'),
(12, NULL, NULL, NULL, NULL, 'peter', 'USDT', '471.83979974969', 'active', '2022-09-10 23:26:12', '2022-09-10 23:26:51');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-10 23:24:54', '2022-09-10 23:24:54', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-10 23:24:55', '2022-09-10 23:24:55', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-10 23:24:56', '2022-09-10 23:24:56', NULL),
(4, 'ross', 'active', 'guddaz', '2022-09-10 23:25:24', '2022-09-10 23:25:24', NULL),
(5, 'raymond', 'active', 'lodza', '2022-09-10 23:25:36', '2022-09-10 23:25:36', NULL),
(6, 'keith', 'active', 'lodza', '2022-09-10 23:25:42', '2022-09-10 23:25:42', NULL),
(7, 'jimmy', 'active', 'lodza', '2022-09-10 23:25:49', '2022-09-10 23:25:49', NULL),
(8, 'clarence', 'active', 'ross', '2022-09-10 23:25:55', '2022-09-10 23:25:55', NULL),
(9, 'lodza', 'active', 'keith', '2022-09-10 23:26:01', '2022-09-10 23:26:01', NULL),
(10, 'peter', 'active', 'keith', '2022-09-10 23:26:08', '2022-09-10 23:26:08', NULL),
(11, 'flint', 'active', 'keith', '2022-09-10 23:26:15', '2022-09-10 23:26:15', NULL),
(12, 'nassim', 'active', 'jimmy', '2022-09-10 23:26:34', '2022-09-10 23:26:34', NULL),
(13, 'guddaz', 'active', 'flint', '2022-09-10 23:26:40', '2022-09-10 23:26:40', NULL);

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
(1, 'Zimbabwe', 'ZIM', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:24:51', NULL),
(2, 'South Africa', 'RSA', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:24:51', NULL),
(3, 'United Kingdom', 'UK', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:24:51', NULL),
(4, 'United States of America', 'USA', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:24:51', NULL),
(5, 'Russia', 'RUS', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:24:51', NULL),
(6, 'China', 'CHN', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:24:51', NULL),
(7, 'Ghana', 'GHA', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:24:51', NULL),
(8, 'Botswana', 'BOT', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:24:51', NULL),
(9, 'Zambia', 'ZAM', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:24:51', NULL),
(10, 'Algeria', 'ALG', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:24:51', NULL),
(11, 'Italy', 'ITA', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:24:51', NULL),
(12, 'Nigeria', 'NIG', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:24:51', NULL);

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
(1, 'US Dollar', 'USD', '$', 1, '1', '10', '5', 'active', 'system', '2022-09-11 01:24:50', NULL),
(2, 'Euro', 'EUR', '€', 1, '0.87', '10', '5', 'active', 'system', '2022-09-11 01:24:50', NULL),
(3, 'Pound Sterling', 'GBP', '£', 1, '0.77', '10', '5', 'active', 'system', '2022-09-11 01:24:50', NULL),
(4, 'South African Rand', 'ZAR', 'R', 0, '16', '100', '100', 'active', 'system', '2022-09-11 01:24:50', NULL),
(5, 'Zambian Kwacha', 'ZMW', 'K', 0, '15', '100', '100', 'active', 'system', '2022-09-11 01:24:50', NULL),
(6, 'Algerian Dinar', 'DZD', 'DA', 0, '180', '100', '100', 'active', 'system', '2022-09-11 01:24:50', NULL),
(7, 'Zimbabwean Dollar', 'ZWL', '$', 1, '10000', '500', '5000', 'active', 'system', '2022-09-11 01:24:50', NULL);

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
('1031770F3F073', 'USDT', '110', 'USD', 111, 'lodza', '2022-09-10 23:25:15', 'ross', '2022-09-10 23:25:15'),
('124677150B4D9', 'USDT', '500', 'USD', 501, 'lodza', '2022-09-10 23:25:19', 'jimmy', '2022-09-10 23:25:19'),
('137414588EF84', 'USDT', '100', 'EUR', 93, 'lodza', '2022-09-10 23:25:21', 'clarence', '2022-09-10 23:25:21'),
('154549EC96131', 'USDT', '600', 'USD', 601, 'lodza', '2022-09-10 23:25:17', 'keith', '2022-09-10 23:25:17'),
('175549C4C4E9B', 'USDT', '100', 'DZD', 18000, 'lodza', '2022-09-10 23:25:22', 'nassim', '2022-09-10 23:25:22');

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
(1, 'developer.ankelli@gmail.com', 'developer', '2022-09-10 23:24:53', NULL),
(2, 'sysadmin@ankelli.com', 'sysadmin', '2022-09-10 23:24:54', NULL),
(3, 'reserves@ankelli.com', 'reserves', '2022-09-10 23:24:55', NULL),
(4, 'busadmin@ankelli.com', 'busadmin', '2022-09-10 23:24:56', NULL),
(5, 'goodhopedhliwayo@gmail.com', 'guddaz', '2022-09-10 23:25:00', NULL),
(6, 'lodza@example.com', 'lodza', '2022-09-10 23:25:01', NULL),
(7, 'ross@example.com', 'ross', '2022-09-10 23:25:03', NULL),
(8, 'jimmy@example.com', 'jimmy', '2022-09-10 23:25:03', NULL),
(9, 'keith@example.com', 'keith', '2022-09-10 23:25:04', NULL),
(10, 'peter@example.com', 'peter', '2022-09-10 23:25:05', NULL),
(11, 'flint@example.com', 'flint', '2022-09-10 23:25:05', NULL),
(12, 'clarence@example.com', 'clarence', '2022-09-10 23:25:06', NULL),
(13, 'raymond@example.com', 'raymond', '2022-09-10 23:25:07', NULL),
(14, 'nassim@example.com', 'nassim', '2022-09-10 23:25:07', NULL);

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
(1, '__pymt_methods', 'cash_in_person', 'images', 'pymt_method_icon', 'Cash in person', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Cash in person.jpg', 'image/jpg', NULL, 'Cash in person.jpg', NULL, 'system', '2022-09-10 23:24:50', NULL),
(2, '__pymt_methods', 'stanbic_bank', 'images', 'pymt_method_icon', 'Stanbic Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Stanbic bank.jpg', 'image/jpg', NULL, 'Stanbic Bank Icon.jpg', NULL, 'system', '2022-09-10 23:24:50', NULL),
(3, '__pymt_methods', 'fnb_bank', 'images', 'pymt_method_icon', 'FNB Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FNB bank.png', 'image/png', NULL, 'FNB Bank Icon.png', NULL, 'system', '2022-09-10 23:24:50', NULL),
(4, '__pymt_methods', 'mukuru', 'images', 'pymt_method_icon', 'Mukuru Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mukuru.jpg', 'image/jpg', NULL, 'Mukuru Icon.jpg', NULL, 'system', '2022-09-10 23:24:50', NULL),
(5, '__pymt_methods', 'algerie_poste', 'images', 'pymt_method_icon', 'Algerie poste Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Algerie poste.jpg', 'image/jpg', NULL, 'Algerie poste Icon.jpg', NULL, 'system', '2022-09-10 23:24:50', NULL),
(6, '__pymt_methods', 'mtn_momo', 'images', 'pymt_method_icon', 'MTN MOMO Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/MTN MOMO.png', 'image/png', NULL, 'MTN MOMO Icon.png', NULL, 'system', '2022-09-10 23:24:50', NULL),
(7, '__pymt_methods', 'ecocash', 'images', 'pymt_method_icon', 'Ecocash Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Ecocash.png', 'image/png', NULL, 'Ecocash Icon.png', NULL, 'system', '2022-09-10 23:24:50', NULL),
(8, '__pymt_methods', 'paypal', 'images', 'pymt_method_icon', 'Paypal Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Paypal.png', 'image/png', NULL, 'Paypal Icon.png', NULL, 'system', '2022-09-10 23:24:50', NULL),
(9, '__pymt_methods', 'skrill', 'images', 'pymt_method_icon', 'Skrill Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Skrill.jpg', 'image/jpg', NULL, 'Skrill Icon.jpg', NULL, 'system', '2022-09-10 23:24:50', NULL),
(10, '__pymt_methods', 'world_remit', 'images', 'pymt_method_icon', 'World Remit Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/World Remit.png', 'image/png', NULL, 'World Remit Icon.png', NULL, 'system', '2022-09-10 23:24:50', NULL),
(11, '__pymt_methods', 'mastercard', 'images', 'pymt_method_icon', 'Mastercard Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mastercard.jpeg', 'image/jpeg', NULL, 'Mastercard Icon.jpeg', NULL, 'system', '2022-09-10 23:24:50', NULL),
(12, '__pymt_methods', 'visa', 'images', 'pymt_method_icon', 'Visa Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Visa.jpg', 'image/jpg', NULL, 'Visa Icon.jpg', NULL, 'system', '2022-09-10 23:24:50', NULL),
(13, '__pymt_methods', 'fbc_bank', 'images', 'pymt_method_icon', 'FBC bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FBC bank.jpg', 'image/jpg', NULL, 'FBC bank Icon.jpg', NULL, 'system', '2022-09-10 23:24:50', NULL);

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
('09KFHV3T8BMZyuWg', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:04', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":212.63157894737,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('0D7onLJUATy6195t', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:24:55', NULL, NULL, '__user_group_memberships', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('0g9dMvqdbVWundyB', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:24:53', NULL, '107422E95BA6C', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('0Ocd2MehzbiEJfMq', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-10 23:25:34', NULL, NULL, '__trades', '189625F7A18FC', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:31\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('0PaLdly1OUC6JHEM', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:26:21', NULL, NULL, '__seller_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('0tEEnNwcZtDzz2J0', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'ross', '2022-09-10 23:25:16', NULL, NULL, '__asset_wallets', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('109qjvdgbHF54mF9', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:25:06', NULL, '147690B3C4DF2', '__email_addresses', 'clarence@example.com', NULL, NULL),
('10VhgxbIcRtPHE2l', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:25:39', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":1074.62579,\"new_value\":969.36263210526}]', '{\"ip\":\"127.0.0.1\"}'),
('1odFvQxNEr5PmtHG', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'flint', '2022-09-10 23:25:12', NULL, NULL, '__asset_wallets', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('1sfBQ2pvMc28PKSt', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:49', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":207.94117647059,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('1SP57zS2AXkQN4Gj', 'TEST_SESSION', 'Addition of _RegToken entry to database.', 'entry_create', 'system', '2022-09-10 23:25:00', NULL, NULL, '__reg_tokens', '1234567890', NULL, '{\"ip\":\"127.0.0.1\"}'),
('24waqhSsyPxe6y9S', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-10 23:25:57', NULL, NULL, '__trades', '1760821ED9C2C', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:57\"}]', '{\"ip\":\"127.0.0.1\"}'),
('2B2d9KjijlwKwMtG', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:26:21', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":1138.2978723404,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('2GDwvDsNmjhEe6Kj', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:25:01', NULL, '1665088D243A7', '__notifications', '14545432630D0', NULL, NULL),
('2H6R8tTNkqvcxCzQ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:26:28', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":265.78947368421}]', '{\"ip\":\"127.0.0.1\"}'),
('2K9qPjhXx6UVZZnX', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:25:19', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":2290,\"new_value\":1790}]', '{\"ip\":\"127.0.0.1\"}'),
('2LNsxUSV2UzeSizS', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:25:06', NULL, '147690B3C4DF2', '__users', 'clarence', NULL, NULL),
('2t3T6rxksF15n9JV', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:05', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":748.93617021277,\"new_value\":538.4098544233}]', '{\"ip\":\"127.0.0.1\"}'),
('2UAekDW7PD8wNbdy', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:25:41', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":969.36263210526,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('3b37sBz6IXJPf7Ah', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:25:53', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1593.6058230682,\"new_value\":1599.9888017916}]', '{\"ip\":\"127.0.0.1\"}'),
('3E7DREbD6M6XxlDh', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:24:53', NULL, '107422E95BA6C', '__email_addresses', 'developer.ankelli@gmail.com', NULL, NULL),
('3tGuBHkHd7dXDsha', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:26:41', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":562.76041666667,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('3v2VafDULvpjPYLQ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:52', NULL, NULL, '__messages', '114683B341853', NULL, '{\"ip\":\"127.0.0.1\"}'),
('49SWWxkFrrWRlzCU', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:24:55', NULL, NULL, '__user_group_memberships', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('4bdcBYDHszOiEzPO', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:25:05', NULL, '151447CA881E4', '__email_addresses', 'peter@example.com', NULL, NULL),
('4GofXfuOlSZswUdx', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:25:47', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":819.37383031354,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('4GXSrqCECEYmBOTM', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:04', NULL, NULL, '__messages', '124162297600F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('4IjICOrc8WW0rJC9', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:04', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":536.3045912654,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('4J1mxbMoqtVIQzYm', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:23', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":952.24524076145,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('4KIxmVOjzkaHHN0M', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:25:23', NULL, NULL, '__asset_wallets', '9', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('4MFjgMff82ERCDhy', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:25:12', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":400}]', '{\"ip\":\"127.0.0.1\"}'),
('4mS761jixB93ylH8', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:36', NULL, NULL, '__messages', '1870234141DEA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('59yzh2CVidHDJKZj', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:07', NULL, NULL, '__messages', '1593756E0B3BB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('5cteu6Qi6RtdkO7I', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:25:04', NULL, '13522050303B6', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('5FOsDzLRN1euyyp9', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:25:09', NULL, NULL, '__asset_wallets', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('5FqKznBiely8zn6h', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:26:29', NULL, NULL, '__trades', '158043048EED8', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:29\"}]', '{\"ip\":\"127.0.0.1\"}'),
('5ofcI1v6SiIXt2o9', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'keith', '2022-09-10 23:25:42', NULL, NULL, '__offers', '1670592D47DD3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('5OQGsIBffPif7gHH', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:25:07', NULL, '1520351ED0C69', '__users', 'raymond', NULL, NULL),
('5sdKAQs294PCWYbh', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-10 23:25:47', NULL, NULL, '__trades', '1186403F67447', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:44\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('5sskgx1MJ7IFIaOu', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:52', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":141.98444670421,\"new_value\":139.9256231748}]', '{\"ip\":\"127.0.0.1\"}'),
('5tq0pOidD7wbL200', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:25:54', NULL, NULL, '__trades', '145892D663C9F', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:50\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('60flrT11h2GF8gpd', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:49', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":139.9256231748,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('69NH8bPf4kBXyLOf', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:26:00', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1599.9888017916,\"new_value\":1602.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('6AEnVnAnHtgSEGP7', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:26:44', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":562.76041666667,\"new_value\":349.99445921986}]', '{\"ip\":\"127.0.0.1\"}'),
('6bKrz1YGnN5BHN9Q', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:26:02', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":748.93617021277,\"new_value\":536.3045912654}]', '{\"ip\":\"127.0.0.1\"}'),
('6CGJp28GgF0nUzcm', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:24:54', NULL, '16434596DC465', '__users', 'sysadmin', NULL, NULL),
('6JE0vaMOCp66agPy', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-10 23:25:49', NULL, NULL, '__buyer_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('6k5DI1cSEcYPnTB0', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:24:57', NULL, NULL, '__buyer_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('6tUPH3MAi0FbCI18', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:25:04', NULL, '1001321715339', '__notifications', '190993DED58B7', NULL, NULL),
('6YNadtzJnn4TKw97', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:25:06', NULL, '147690B3C4DF2', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('76Htii5NTh14yEQw', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:26:40', NULL, NULL, '__offers', '10130100574C6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('7l6ZMnh0A5J84exu', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:26:31', NULL, NULL, '__asset_wallets', '11', '[{\"field_name\":\"asset_value\",\"old_value\":105.26315789474,\"new_value\":368.42105263158}]', '{\"ip\":\"127.0.0.1\"}'),
('7S0KgQWubBVXHQLl', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-10 23:26:03', NULL, NULL, '__trades', '122235A5C0C77', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:03\"}]', '{\"ip\":\"127.0.0.1\"}'),
('7WwQrk38GtfeybnK', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:25:52', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":500,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('84TGcbhRkbrI3uUV', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-10 23:26:02', NULL, NULL, '__buyer_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('8AnvxvqlFowHuD1o', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:25:49', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":817.88446861141,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('8ii0FPAVznP0QMav', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:25:02', NULL, NULL, '__user_group_memberships', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('8MWKEP8GkSGW1ZF3', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:23', NULL, NULL, '__messages', '1474691DD4F75', NULL, '{\"ip\":\"127.0.0.1\"}'),
('91ipDnbm8NL38orY', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:25:05', NULL, '151447CA881E4', '__notifications', '1857421A46529', NULL, NULL),
('92cyGvQtwN4cDUiu', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:25:55', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":214.89361702128}]', '{\"ip\":\"127.0.0.1\"}'),
('97xNfGMWC1SW7Ipd', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:26:23', NULL, NULL, '__trades', '123840146D8A8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9fWRQvcdvkst8mrm', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'raymond', '2022-09-10 23:25:39', NULL, NULL, '__asset_wallets', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9Lt8CrJtsx1AUbTX', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-10 23:25:30', NULL, NULL, '__messages', '1448359DCD14C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9MQtMAxB5Bd24Gwx', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:25:45', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":817.88446861142,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('9T0Sz0aw3N5mXEbB', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:26:20', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1606.8812989921,\"new_value\":1608.5089031588}]', '{\"ip\":\"127.0.0.1\"}'),
('9vk5XLvIrQPW4FPc', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:25:07', NULL, '1520351ED0C69', '__email_addresses', 'raymond@example.com', NULL, NULL),
('A2DN67kF3ZXhacJW', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:26:37', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":686.45576707724,\"new_value\":484.208576066}]', '{\"ip\":\"127.0.0.1\"}'),
('a7XyIBZgxaW33fH0', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-10 23:26:27', NULL, NULL, '__offers', '1557647D1123B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('a8fGmXe2Yguj7QU9', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:25:46', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":968.31000052631,\"new_value\":819.37383031354}]', '{\"ip\":\"127.0.0.1\"}'),
('AaUVGsRvTQhxqP9p', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:24:55', NULL, NULL, '__seller_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('AC4M5SsvlxYS7Sk5', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'nassim', '2022-09-10 23:26:39', NULL, NULL, '__trades', '136199905D397', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:36\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('aofTB0LUYQGW672u', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:49', NULL, NULL, '__messages', '192796D772A89', NULL, '{\"ip\":\"127.0.0.1\"}'),
('AOK1rgcNDFd3yLpv', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:26:46', NULL, NULL, '__trades', '1430769DA99F8', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"guddaz\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:42\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('AptzZ8YT2JZqparO', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:56', NULL, NULL, '__messages', '125713BA55719', NULL, '{\"ip\":\"127.0.0.1\"}'),
('AUUKwFbCDfmNaGIR', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:24:54', NULL, '16434596DC465', '__notifications', '1409467B98921', NULL, NULL),
('ava5oowlP6KUWbXZ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:26:31', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":952.24524076145,\"new_value\":689.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('avFlvNkcZiEv7MEq', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-10 23:26:21', NULL, NULL, '__offers', '12728038F1971', NULL, '{\"ip\":\"127.0.0.1\"}'),
('BaCBDfas5yRI57d5', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-10 23:26:20', NULL, NULL, '__trades', '188640BA1D4C2', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:17\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('bB7jmoCoGFoY5Y29', 'FACTORY_SESSION', 'Temporarily disabling for factory users.', 'entry_update', 'system', '2022-09-10 23:24:53', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for factory users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('bBa2jxT9NT9rHHcT', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:41', NULL, NULL, '__messages', '166541274EE41', NULL, '{\"ip\":\"127.0.0.1\"}'),
('bCgRkrD5sFaG96du', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'clarence', '2022-09-10 23:26:00', NULL, NULL, '__trades', '1760821ED9C2C', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:57\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('bCpohNVI7li8cBKD', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'flint', '2022-09-10 23:26:49', NULL, NULL, '__trades', '165474C5BAFA5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('BdPCI1TDRRHRhy1f', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:00', NULL, NULL, '__messages', '188173824EC3B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('BG1HHaVdkdQ2gkF9', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:25:08', NULL, '17068584DC4FD', '__email_addresses', 'nassim@example.com', NULL, NULL),
('blJklJN6cwTN6wHo', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:25:03', NULL, '155294B189D33', '__notifications', '161422B995807', NULL, NULL),
('BNJxkpyEepKnNRRd', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:25:04', NULL, '13522050303B6', '__email_addresses', 'keith@example.com', NULL, NULL),
('Bo65pbTnAH6XTvYK', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:50', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":347.86679964539,\"new_value\":141.98444670421}]', '{\"ip\":\"127.0.0.1\"}'),
('bRghECz9E6lz4iqn', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 23:25:15', NULL, NULL, '__deposit_tokens', '1031770F3F073', NULL, '{\"ip\":\"127.0.0.1\"}'),
('BVL7ktrpEN4nHFEL', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:25:31', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":210.33027015936,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('bw2JBMg7Jrz4uW9v', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:23', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":186.05263157895,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('C2eRJAfJdf2yC5u6', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:25:03', NULL, '155294B189D33', '__users', 'ross', NULL, NULL),
('C57YFX3mYNTRKGjG', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:25:07', NULL, '1520351ED0C69', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('c91JWaE8DrXZ9c2Y', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:25:08', NULL, '17068584DC4FD', '__notifications', '179902C3C3692', NULL, NULL),
('caIFOEdEkvcsD0KR', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:25:01', NULL, '1188202116102', '__email_addresses', 'lodza@example.com', NULL, NULL),
('caOTdwvakt3vhxvc', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'peter', '2022-09-10 23:26:08', NULL, NULL, '__offers', '103981088CAD6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('cbdJ2xFEbcYbVmdO', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:51', NULL, NULL, '__messages', '1553521CE508D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('cbx0glwcxi6VlXFr', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:26', NULL, NULL, '__trades', '123840146D8A8', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:23\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('CCbdBTjcZOm0VhFL', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:26:36', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":204.26966292135,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('cCVrWHzHQftjmWDi', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:24:56', NULL, NULL, '__user_group_memberships', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('CElynCsDHF0x6XET', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:26:43', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":214.89361702128,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('CFdxwGQ1sSWTLAW6', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:26:34', NULL, NULL, '__buyer_extensions', 'nassim', NULL, '{\"ip\":\"127.0.0.1\"}'),
('cFw5RcgNDMoQVF6I', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:24:57', NULL, NULL, '__user_group_memberships', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('CG09qZH78CtqGq8V', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:25:05', NULL, '145887D6B9AFF', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('cGmp7FJM33bARWn6', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:24:54', NULL, NULL, '__user_group_memberships', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('CTfeMe2Go84fjRDw', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:25:06', NULL, '147690B3C4DF2', '__notifications', '1276983D26C34', NULL, NULL),
('cX2BjV9TgC5QNnF4', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:26:23', NULL, NULL, '__trades', '123840146D8A8', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:23\"}]', '{\"ip\":\"127.0.0.1\"}'),
('d8cVRWkDIqjJk5ed', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:44', NULL, NULL, '__messages', '10313659255E2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dhFKz6Ke7JHUzaPl', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:25:41', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1591.0638297872,\"new_value\":1592.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('Dj8sYhoxcSoG4tpy', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:25:11', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":967.86579}]', '{\"ip\":\"127.0.0.1\"}'),
('DmXw2VFzseRek7bu', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:24:56', NULL, NULL, '__seller_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('DNelHZjKHSJWT6Y1', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:24:56', NULL, '1441916B15BB7', '__users', 'busadmin', NULL, NULL),
('dNHMe0RUMfU219pu', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:25:25', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":107.44680851064}]', '{\"ip\":\"127.0.0.1\"}'),
('DNQLeCcivdKXs9nG', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:26:17', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":103.29954915548,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('dTNTGgaXkC9lgAAk', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:24:57', NULL, NULL, '__seller_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('DuSMWViVjCz2VfBv', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'keith', '2022-09-10 23:26:01', NULL, NULL, '__seller_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dVmaCD4Y6mXtGle1', 'JhBwiiR5lTJjmtxz', 'Addition of _Session entry to database.', 'entry_create', NULL, '2022-09-10 23:27:18', '+02:00', NULL, '__sessions', 'JhBwiiR5lTJjmtxz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dWDPtlk3IqySutxT', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:26:38', NULL, NULL, '__asset_wallets', '9', '[{\"field_name\":\"asset_value\",\"old_value\":100,\"new_value\":302.24719101124}]', '{\"ip\":\"127.0.0.1\"}'),
('dzNFnJ489ITSG28R', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:25:57', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":214.89361702128,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('E8XAar5mdPo6igTW', 'FACTORY_SESSION', 'Addition of _Asset entry to database.', 'entry_create', 'system', '2022-09-10 23:24:53', NULL, NULL, '__assets', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('EDhC51Nl9PnqKUkD', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:24:56', NULL, NULL, '__admin_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ee1wmJsV1yz0azPh', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'nassim', '2022-09-10 23:25:23', NULL, NULL, '__deposit_tokens', '175549C4C4E9B', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:22\"}]', '{\"ip\":\"127.0.0.1\"}'),
('eElZIAfJ9grcgSld', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:43', NULL, NULL, '__messages', '132257CB703B7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('EibyZSu2a75LZ95I', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 23:25:50', NULL, NULL, '__trades', '145892D663C9F', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:50\"}]', '{\"ip\":\"127.0.0.1\"}'),
('Ekzm0PXmoFTvXksJ', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:13', NULL, NULL, '__trades', '1431047100D34', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"peter\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:10\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('eN3EpPQf4H2pyjuD', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:25:42', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":968.31000052631,\"new_value\":817.88446861142}]', '{\"ip\":\"127.0.0.1\"}'),
('EvtBcSl5Tm5ndPUN', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:13', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1604.221724524,\"new_value\":1606.8812989921}]', '{\"ip\":\"127.0.0.1\"}'),
('ExymrIh7sbG469P0', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:25:24', NULL, NULL, '__buyer_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('EyMhysiwU75RvNl5', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'ross', '2022-09-10 23:25:55', NULL, NULL, '__seller_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('FAaDvW76FUyAQE9z', 'JhBwiiR5lTJjmtxz', 'User signin.', 'entry_update', 'guddaz', '2022-09-10 23:27:19', NULL, NULL, '__sessions', 'JhBwiiR5lTJjmtxz', '[{\"field_name\":\"_status\",\"old_value\":\"empty\",\"new_value\":\"active\"}]', '{\"ip\":\"127.0.0.1\"}'),
('fBqpDkKJCgAiLFZn', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:25:00', NULL, '1665088D243A7', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('ff4avX58vhIGfN76', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:26:30', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":686.45576707724,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('fi0u1QU9xeenM3xp', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:26:39', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":484.208576066,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('fmfOPxCoKcqwwF0e', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:25:03', NULL, '1001321715339', '__users', 'jimmy', NULL, NULL),
('fMpJ7AjGA6Iba9r6', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:12', NULL, NULL, '__asset_wallets', '12', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":265.95744680851}]', '{\"ip\":\"127.0.0.1\"}'),
('fOACmt5pw0hI1iHy', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:25:44', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":150.42553191489,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('fPssQn3ocMpu1hnR', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'nassim', '2022-09-10 23:25:23', NULL, NULL, '__asset_wallets', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('FUEvSPYl2so6MBIY', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:26:34', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":686.45576707724,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('fXBMSlfDA8qzKMeJ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:09', NULL, NULL, '__messages', '1754068A076E5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fZPeYBFZqJXM1WCJ', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:26:29', NULL, NULL, '__trades', '158043048EED8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('g60LZbKy1rQVK9mu', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:17', NULL, NULL, '__messages', '133564784F08E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GdCyMbx3QTCbdPM8', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-10 23:25:44', NULL, NULL, '__trades', '1186403F67447', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GEMluuvbQOjMZGa7', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:26:15', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":164.38802083333}]', '{\"ip\":\"127.0.0.1\"}'),
('GF7EdxUV9E9hDG9W', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:10', NULL, NULL, '__messages', '1788422A622BB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GfN0YCgESuXeU5cf', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:24:55', NULL, '136416A5DA1BB', '__notifications', '142332B06DE2D', NULL, NULL),
('GkAbND6uemmRCn0l', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-10 23:26:49', NULL, NULL, '__trades', '165474C5BAFA5', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:49\"}]', '{\"ip\":\"127.0.0.1\"}'),
('gkDZKAMzB4nQsgpJ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:26:18', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":267.68756998881,\"new_value\":104.92715332214}]', '{\"ip\":\"127.0.0.1\"}'),
('gOvB6Ij10UN11CnU', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'flint', '2022-09-10 23:26:41', NULL, NULL, '__buyer_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('gSqQTKBKMf6HyG00', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'clarence', '2022-09-10 23:25:21', NULL, NULL, '__deposit_tokens', '137414588EF84', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:21\"}]', '{\"ip\":\"127.0.0.1\"}'),
('GucflPLkDNxxSuAg', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:26:00', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":3.61702127659,\"new_value\":1.4893617021219}]', '{\"ip\":\"127.0.0.1\"}'),
('gZWKspDoRzVwGvcy', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'clarence', '2022-09-10 23:25:21', NULL, NULL, '__asset_wallets', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('h7uRLoKlmYME7Vqo', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:24:54', NULL, '107422E95BA6C', '__notifications', '114874AB51D76', NULL, NULL),
('H9inmInXrzoXRkQv', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:26:08', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":268.6170212766}]', '{\"ip\":\"127.0.0.1\"}'),
('hA8ww47x48p4cAYv', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:06', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1602.1164613661,\"new_value\":1604.221724524}]', '{\"ip\":\"127.0.0.1\"}'),
('hAETyOrBAy67qcNa', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:26:46', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1615.0050592795,\"new_value\":1617.132718854}]', '{\"ip\":\"127.0.0.1\"}'),
('hblfaBMjS7wcDqj1', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'keith', '2022-09-10 23:25:18', NULL, NULL, '__deposit_tokens', '154549EC96131', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:17\"}]', '{\"ip\":\"127.0.0.1\"}'),
('HDE97PTcmFFGmJT1', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:35', NULL, NULL, '__messages', '1208553AFDCBA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HIHDuX92IuJYf6J7', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:25:28', NULL, NULL, '__trades', '189625F7A18FC', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"guddaz\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:27\"}]', '{\"ip\":\"127.0.0.1\"}'),
('hJB3tYKq5Us54zjo', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'flint', '2022-09-10 23:26:15', NULL, NULL, '__offers', '153580408ECCF', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hJoVdAC95AO7535f', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:54', NULL, NULL, '__messages', '1253277377610', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hmTkmtKU5HAWRUGj', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-10 23:26:15', NULL, NULL, '__buyer_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hT6Hd5qNz7xUg2DV', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-10 23:26:10', NULL, NULL, '__trades', '1431047100D34', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hVcUQPklx9boPVP3', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:25:34', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":211.3940999466,\"new_value\":210.33027015937}]', '{\"ip\":\"127.0.0.1\"}'),
('HXwU3P8wnpw0DsPE', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:23', NULL, NULL, '__messages', '100446E0247A7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HzEEkqQrN9KoWSf1', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'flint', '2022-09-10 23:26:42', NULL, NULL, '__trades', '1430769DA99F8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HZZTINNZICjPL7o1', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 23:25:21', NULL, NULL, '__deposit_tokens', '137414588EF84', NULL, '{\"ip\":\"127.0.0.1\"}'),
('i00DwztKYGNFxj4c', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:25:06', NULL, '145887D6B9AFF', '__notifications', '1780347C5AD8E', NULL, NULL),
('i7cRaCKn4avvjiZa', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:32', NULL, NULL, '__messages', '1511710AEB4A2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('IchA1cViCAvdZvJ6', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:10', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":267.68756998881,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('id9Q6EY4NXtWjVDJ', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:25:01', NULL, NULL, '__admin_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('IeNdVsADURaKzR7v', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:26', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":954.08734602461,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('iFXrdSbpbEVi6FeB', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-10 23:25:42', NULL, NULL, '__buyer_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('IjjlXDYMO3Kmr9hL', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:03', NULL, NULL, '__messages', '169307C907D9E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('iLVjUcs8AuZQfB34', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:25:34', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1590,\"new_value\":1591.0638297872}]', '{\"ip\":\"127.0.0.1\"}'),
('IsABmZa6IOEGRLNa', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:46', NULL, NULL, '__messages', '17434632E012E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('IzaWcWGBAeBxgLS1', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:26:02', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":212.63157894737}]', '{\"ip\":\"127.0.0.1\"}'),
('j40YFfLAVVzOAaqT', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:26', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1608.5089031588,\"new_value\":1610.351008422}]', '{\"ip\":\"127.0.0.1\"}'),
('jBjwm08NDP7u4Nb9', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:25:05', NULL, '151447CA881E4', '__users', 'peter', NULL, NULL),
('Jcdkh5xdaccYyS1m', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:25:07', NULL, '17068584DC4FD', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('je2pSylFE61lYBWo', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:24:56', NULL, '1441916B15BB7', '__notifications', '116214F34D33C', NULL, NULL),
('JNap3DzBp6HnjmPb', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:25:07', NULL, '17068584DC4FD', '__users', 'nassim', NULL, NULL),
('jPmMS9jyA4Wa85bC', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:25:00', NULL, '1665088D243A7', '__email_addresses', 'goodhopedhliwayo@gmail.com', NULL, NULL),
('k1T7e1EnjeT86kK5', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:24:54', NULL, NULL, '__admin_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('K6OdAEY8S7WmwBvw', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:25:14', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":967.86579,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}'),
('k6w02E5dy8R0CNGl', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 23:25:19', NULL, NULL, '__deposit_tokens', '124677150B4D9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('K9xP0a4hHDc9CHLn', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:25:26', NULL, NULL, '__messages', '128468AF3B397', NULL, '{\"ip\":\"127.0.0.1\"}'),
('KAxnloMddPScTgll', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:10', NULL, NULL, '__messages', '178476203E2D2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('KdD8xAB6GcHPe6MI', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:51', NULL, NULL, '__asset_wallets', '12', '[{\"field_name\":\"asset_value\",\"old_value\":265.95744680851,\"new_value\":471.83979974969}]', '{\"ip\":\"127.0.0.1\"}'),
('KGSTAPQoJiJbPuFd', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:34', NULL, NULL, '__messages', '13145525F6711', NULL, '{\"ip\":\"127.0.0.1\"}'),
('KiAY4UzYTWZr4ZJb', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:26:47', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":207.94117647059}]', '{\"ip\":\"127.0.0.1\"}');
INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('Kidi4lRa38MjUaCU', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:26:41', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":214.89361702128}]', '{\"ip\":\"127.0.0.1\"}'),
('kJXq9M5TjZtnGxE0', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:38', NULL, NULL, '__messages', '15217671E0974', NULL, '{\"ip\":\"127.0.0.1\"}'),
('kMCD2saRLxb3oZGb', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:03', NULL, NULL, '__messages', '18844349D7D00', NULL, '{\"ip\":\"127.0.0.1\"}'),
('kqgLFSCWzTvKtrMi', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:26:20', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":104.92715332214,\"new_value\":103.29954915547}]', '{\"ip\":\"127.0.0.1\"}'),
('KUpwYKnGMDhOhRQ8', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-10 23:26:03', NULL, NULL, '__trades', '122235A5C0C77', NULL, '{\"ip\":\"127.0.0.1\"}'),
('KYYzuuSY45M1dlR1', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:24:54', NULL, NULL, '__user_group_memberships', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('L0TvY3wRAF1xmFiS', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:16', NULL, NULL, '__messages', '160400DFB3311', NULL, '{\"ip\":\"127.0.0.1\"}'),
('l11VZMWPiPHlbYW1', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'ross', '2022-09-10 23:25:57', NULL, NULL, '__trades', '1760821ED9C2C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Lbiv5kWzLcPqtVY8', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:25:49', NULL, NULL, '__offers', '1789717EBC4B1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('LCQhV8RsfUGv5gZF', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:26:34', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":204.26966292135}]', '{\"ip\":\"127.0.0.1\"}'),
('lFWstvrmGZ2YkAfg', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:20', NULL, NULL, '__messages', '1279848412134', NULL, '{\"ip\":\"127.0.0.1\"}'),
('LGTu6kdfJetzwmSR', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:24:54', NULL, '16434596DC465', '__email_addresses', 'sysadmin@ankelli.com', NULL, NULL),
('lO9VOnpxFLZBocGr', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:24:55', NULL, NULL, '__admin_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Lstv4TiPF55zpssx', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:24:56', NULL, NULL, '__user_group_memberships', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('LT1vaL9L6zm9WrGc', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:25:03', NULL, '155294B189D33', '__email_addresses', 'ross@example.com', NULL, NULL),
('lWXZwiDK0t8cWuAn', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:25:21', NULL, NULL, '__asset_wallets', '8', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('LZDaxkXoowHnqwEf', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:24:53', NULL, '107422E95BA6C', '__users', 'developer', NULL, NULL),
('M4YjNOw36i1uVimX', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:25:51', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":644.68085106383,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('M65YnM4uharesoZH', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-10 23:26:10', NULL, NULL, '__trades', '1431047100D34', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:10\"}]', '{\"ip\":\"127.0.0.1\"}'),
('mi0hevToBPL9RtyF', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:26:17', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":164.38802083333,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('mihc3wD4L6QNhmvv', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:25:31', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":107.44680851064,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('MQcZMNJlqjqslfUl', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:57', NULL, NULL, '__messages', '108832229C421', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Mqz7pbKRzwmbSKYO', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 23:25:44', NULL, NULL, '__trades', '1186403F67447', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:44\"}]', '{\"ip\":\"127.0.0.1\"}'),
('MucXzua7XZ9qQX9X', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'ross', '2022-09-10 23:25:16', NULL, NULL, '__deposit_tokens', '1031770F3F073', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:15\"}]', '{\"ip\":\"127.0.0.1\"}'),
('niAntxDvdO3epWvL', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:26:44', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":210.33027015937,\"new_value\":423.09622760618}]', '{\"ip\":\"127.0.0.1\"}'),
('NKJk840GI6eJvcRR', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:25:21', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1790,\"new_value\":1690}]', '{\"ip\":\"127.0.0.1\"}'),
('NRoco9VDeoihxlHd', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:16', NULL, NULL, '__messages', '1224560BC25FA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('nvCeTUGLeUppVck9', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:25:33', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":317.77707867,\"new_value\":211.3940999466}]', '{\"ip\":\"127.0.0.1\"}'),
('nxD1X1xQ66WaCfLj', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:44', NULL, NULL, '__messages', '128778DDC4F2C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('nXVrtFtKn6u68V7f', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:12', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":536.30459126541,\"new_value\":270.3471444569}]', '{\"ip\":\"127.0.0.1\"}'),
('nYhj7JnSnDximObJ', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:25:00', NULL, '1665088D243A7', '__users', 'guddaz', NULL, NULL),
('o7JQ0wl1uL9sU9XW', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:39', NULL, NULL, '__messages', '13925734CC62B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('odIjjdTEH2PNfQDM', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-10 23:26:08', NULL, NULL, '__buyer_extensions', 'peter', NULL, '{\"ip\":\"127.0.0.1\"}'),
('oeHkszyYuyEn0XGX', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:25:49', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":644.68085106383}]', '{\"ip\":\"127.0.0.1\"}'),
('oGkd9IVKc9QqA7LA', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:25:36', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":1074.62579,\"new_value\":968.31000052632}]', '{\"ip\":\"127.0.0.1\"}'),
('omOFErMKl4y69taZ', 'FACTORY_SESSION', 'Resetting to default value.', 'entry_update', 'system', '2022-09-10 23:24:57', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Resetting to default value.\"},{\"field_name\":\"value\",\"old_value\":\"0\",\"new_value\":true}]', '{\"ip\":\"127.0.0.1\"}'),
('ooKdJMqI6f4qzJDU', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:10', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":268.6170212766,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('oomQYvGKRMpQKZzk', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-10 23:25:37', NULL, NULL, '__trades', '14837865B6EC4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('oVaxbh89ZnFxiKn1', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:49', NULL, NULL, '__messages', '161324D477F88', NULL, '{\"ip\":\"127.0.0.1\"}'),
('OvIRgt0jBnTUBIqn', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:24:56', NULL, '1441916B15BB7', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('oYKYVX5F1qvdhde9', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'peter', '2022-09-10 23:26:12', NULL, NULL, '__asset_wallets', '12', NULL, '{\"ip\":\"127.0.0.1\"}'),
('P0kgM3ZfsAkZuaGI', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:25:24', NULL, NULL, '__seller_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('PDTOjBXJS3V4Erzz', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'flint', '2022-09-10 23:26:40', NULL, NULL, '__seller_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('phe93Qzup4aQTwUs', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:25:53', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":179.58659627098,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('pmZU63aMNUtayTZO', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:31', NULL, NULL, '__messages', '135190FA7082E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('PPdi19WutC7nBakC', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:26', NULL, NULL, '__messages', '127054D6FCCF8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('PPetXrVH8NmhZpE4', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:25:38', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":106.31578947368,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('Pq9NuOgH6FwnDwg3', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'ross', '2022-09-10 23:25:24', NULL, NULL, '__offers', '13634665D7AE9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('PS7ElmRSOeelYBjk', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:50', NULL, NULL, '__messages', '1174258C7FF0D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Putob27NA5x1DV7a', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 23:25:38', NULL, NULL, '__trades', '14837865B6EC4', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:37\"}]', '{\"ip\":\"127.0.0.1\"}'),
('pw2LFHjhyjdzaVJP', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:25:17', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":2890,\"new_value\":2290}]', '{\"ip\":\"127.0.0.1\"}'),
('pzQqIFYFFLTPAeZP', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'lodza', '2022-09-10 23:25:36', NULL, NULL, '__seller_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Q23HuCnzge89ELnl', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:25:01', NULL, NULL, '__user_group_memberships', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qd3RpVY9DZErrLo3', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:13', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":270.3471444569,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('QJhgKmefA3opFUt3', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:25:33', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":110,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('qKv82gK7GCqbXwnh', 'TEST_SESSION', 'Resetting to default value.', 'entry_update', 'peter', '2022-09-10 23:26:53', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Resetting to default value.\"},{\"field_name\":\"value\",\"old_value\":\"0\",\"new_value\":true}]', '{\"ip\":\"127.0.0.1\"}'),
('qrt6GRog1PIBxwXh', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-10 23:25:36', NULL, NULL, '__buyer_extensions', 'raymond', NULL, '{\"ip\":\"127.0.0.1\"}'),
('r7ieJRkYeD0I7ZW3', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:25:26', NULL, NULL, '__trades', '189625F7A18FC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('r9kO7YU89fxssSEM', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:05', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":173.20361754758,\"new_value\":383.72993333705}]', '{\"ip\":\"127.0.0.1\"}'),
('RbOqMYo2tKQ5eIgA', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:26:32', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":689.08734602461,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('RFIuyyrtFy0w4S6l', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:29', NULL, NULL, '__messages', '163607FD391B7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('rgitRXnORd3WjvZ1', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:26:18', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":400,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('rgpqhgVVWVtsprAG', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:26:47', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":347.86679964539,\"new_value\":139.9256231748}]', '{\"ip\":\"127.0.0.1\"}'),
('s2DfzVViiiaHjruP', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-10 23:25:36', NULL, NULL, '__offers', '195624DCB94C1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('sbypbOLz3AnDRNiU', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:25:02', NULL, NULL, '__user_group_memberships', '12', NULL, '{\"ip\":\"127.0.0.1\"}'),
('SCYMpSd8qpr8NCJS', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:25:19', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":500}]', '{\"ip\":\"127.0.0.1\"}'),
('sHdWqXecQMnrBZdi', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:25:55', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":216.3829787234,\"new_value\":1.4893617021234}]', '{\"ip\":\"127.0.0.1\"}'),
('sHosq6iGYCw3aGAc', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:26:21', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":186.05263157895}]', '{\"ip\":\"127.0.0.1\"}'),
('SvwdaLLm0sZ8ww0r', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:26:08', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":536.30459126541,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('Sw8WlJm19PyZO0za', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:25:05', NULL, '145887D6B9AFF', '__email_addresses', 'flint@example.com', NULL, NULL),
('SXOirSJYISA32sIK', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:25:25', NULL, NULL, '__asset_wallets', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('T4q47zWgYHeDjyws', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:24:54', NULL, NULL, '__user_group_memberships', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('tbBsajrMwlLZKrdG', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-10 23:25:50', NULL, NULL, '__trades', '145892D663C9F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TetRFYHKZxfWsoc5', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:25:15', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":3000,\"new_value\":2890}]', '{\"ip\":\"127.0.0.1\"}'),
('TeUDae1wZkLEC4YA', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:25:09', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":218.87587867}]', '{\"ip\":\"127.0.0.1\"}'),
('tF3yRzIBSyF2NUJF', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-10 23:26:01', NULL, NULL, '__offers', '10490640336C8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TGYQtOYdC7pQaz1n', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:25:05', NULL, '145887D6B9AFF', '__users', 'flint', NULL, NULL),
('TISvdcmt7MIEV5DE', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:25:36', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":106.31578947368}]', '{\"ip\":\"127.0.0.1\"}'),
('tkuJhQoPbZ4B0sHo', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 23:25:22', NULL, NULL, '__deposit_tokens', '175549C4C4E9B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('tmzwIefDhqKkmAXf', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:25:01', NULL, '1188202116102', '__users', 'lodza', NULL, NULL),
('TnjFdD9LTQOlt2xi', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-10 23:26:32', NULL, NULL, '__trades', '158043048EED8', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:29\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('Ts1ypvlykOE9vCVF', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:48', NULL, NULL, '__messages', '163080965B20C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Tsu9VJdijaBEzInT', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:26:36', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":482.18610415589,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('UBemU1o26ejsESMj', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:26:15', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":267.68756998881,\"new_value\":103.29954915548}]', '{\"ip\":\"127.0.0.1\"}'),
('UCouhyagQF5oJjCB', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:26:45', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":349.99445921986,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('uE0IyqlpfRYjwUpE', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:25:19', NULL, NULL, '__asset_wallets', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UeNOFg9WPV9Unj0Q', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:57', NULL, NULL, '__messages', '1717044F23572', NULL, '{\"ip\":\"127.0.0.1\"}'),
('uEzie3Tyx1EQfDhN', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'peter', '2022-09-10 23:26:47', NULL, NULL, '__offers', '119326B7173A7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UN3Q1Ds974Ve2b8G', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'clarence', '2022-09-10 23:25:55', NULL, NULL, '__offers', '16731862919A8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UP2TWNOBnTUlUkXa', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:26', NULL, NULL, '__messages', '16351357A6266', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UputcPkBfh9JhOL9', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:25:02', NULL, NULL, '__admin_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('uw85mowDgW0laAKa', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:25:02', NULL, NULL, '__user_group_memberships', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Uwcy9J0BKlEjCqQw', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:42', NULL, NULL, '__messages', '156698BA25813', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UX4waGeQDiNBJ7Oo', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:29', NULL, NULL, '__messages', '170214D6A7372', NULL, '{\"ip\":\"127.0.0.1\"}'),
('uXGH2uNivRwdb8HG', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:25:25', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":317.77707867,\"new_value\":210.33027015936}]', '{\"ip\":\"127.0.0.1\"}'),
('V5LJCm0Vyu16EEM8', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:52', NULL, NULL, '__trades', '165474C5BAFA5', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"peter\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:49\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('v6vEfMgCaY7tlyFi', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 23:25:17', NULL, NULL, '__deposit_tokens', '154549EC96131', NULL, '{\"ip\":\"127.0.0.1\"}'),
('VCtbpbpAG1I53La4', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'nassim', '2022-09-10 23:26:34', NULL, NULL, '__offers', '1342726F91750', NULL, '{\"ip\":\"127.0.0.1\"}'),
('vidSjCM9uG0XT7t1', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:25:51', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":173.20361754758,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('vJnw6KBtnlGjDfYz', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:50', NULL, NULL, '__messages', '158813FA52F54', NULL, '{\"ip\":\"127.0.0.1\"}'),
('VLEeg8dbc25EuMTG', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:24:56', NULL, '1441916B15BB7', '__email_addresses', 'busadmin@ankelli.com', NULL, NULL),
('vLHKyINSHYj6X8Fd', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:42', NULL, NULL, '__messages', '1443909DBD25C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('VOxkeUxmlGkfy2NO', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:25:01', NULL, '1188202116102', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('vpwXRoX4Hsp5uoIy', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:25:03', NULL, '1001321715339', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('vrPCbXUEhopnyjJM', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:44', NULL, NULL, '__messages', '162318BC35464', NULL, '{\"ip\":\"127.0.0.1\"}'),
('W168RsUhfcF5K6wY', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:25:20', NULL, NULL, '__deposit_tokens', '124677150B4D9', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:19\"}]', '{\"ip\":\"127.0.0.1\"}'),
('W1fAQtvheC07xTZU', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:23', NULL, NULL, '__messages', '135488F569050', NULL, '{\"ip\":\"127.0.0.1\"}'),
('w94CBYt1gjBBRXgU', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:25:58', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":216.3829787234,\"new_value\":3.61702127659}]', '{\"ip\":\"127.0.0.1\"}'),
('wCLD2NC88cP2hQzk', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:25:35', NULL, NULL, '__offers', '126494E170B6D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('WepdQt4fQqJpwv8k', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:24:55', NULL, '136416A5DA1BB', '__users', 'reserves', NULL, NULL),
('WgRlX9Jl3AqsYjss', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-10 23:26:42', NULL, NULL, '__trades', '1430769DA99F8', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:42\"}]', '{\"ip\":\"127.0.0.1\"}'),
('wioYGcOr5DNxxAnS', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:25:16', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":110}]', '{\"ip\":\"127.0.0.1\"}'),
('wiS6j5kk9TuSHecl', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:25:02', NULL, '1188202116102', '__notifications', '10162754A2D8D', NULL, NULL),
('Wncr0Lo9TQBo30Mz', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:36', NULL, NULL, '__messages', '179477B3B00FD', NULL, '{\"ip\":\"127.0.0.1\"}'),
('WP3AVI5QcvFgL2zl', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:25:52', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":817.88446861141,\"new_value\":179.58659627098}]', '{\"ip\":\"127.0.0.1\"}'),
('WqyZBlx5V8XXXYB4', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:25:29', NULL, NULL, '__messages', '146616E3E7B6C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ww6hByDvx1W1l4p7', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:25:03', NULL, '1001321715339', '__email_addresses', 'jimmy@example.com', NULL, NULL),
('WwLBjlZDbu1uWSRA', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:24:55', NULL, '136416A5DA1BB', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('WYuPRpLAeq2cAF7I', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-10 23:26:17', NULL, NULL, '__trades', '188640BA1D4C2', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:16\"}]', '{\"ip\":\"127.0.0.1\"}'),
('xapBxSvHWLC2XFvg', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:26:52', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1617.132718854,\"new_value\":1619.1915423834}]', '{\"ip\":\"127.0.0.1\"}'),
('xCbBLQPwHIfVAMyA', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:26:29', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":265.78947368421,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('XdxPqyXnYQMtqxPN', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:25:04', NULL, '13522050303B6', '__notifications', '1963766F3BEAD', NULL, NULL),
('Xf4pJr9Vxi5SY0Os', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:24:55', NULL, '136416A5DA1BB', '__email_addresses', 'reserves@ankelli.com', NULL, NULL),
('XlCLK6zL6hoaonWk', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:26:35', NULL, NULL, '__trades', '136199905D397', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XmMsSYYCsCnqmRis', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-10 23:25:31', NULL, NULL, '__messages', '1281896D4E4F4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XObuBilzKA9MH0l1', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:25', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":1138.2978723404,\"new_value\":954.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('XVeZhMRnErQQlYN4', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:25:47', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1592.1164613661,\"new_value\":1593.6058230682}]', '{\"ip\":\"127.0.0.1\"}'),
('XW8L61Bh8i7QlJ0d', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:06', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":538.4098544233,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('xxPGAOdZR9dOnD44', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:26:39', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1612.9825873694,\"new_value\":1615.0050592795}]', '{\"ip\":\"127.0.0.1\"}'),
('XxS2HnJp2KuzNZyw', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:24:55', NULL, NULL, '__buyer_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Y8xjfoEboOp9la6h', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:25:38', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":968.31000052632,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}'),
('y9HIGBPPdfcNTls3', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:25:57', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":1.4893617021234,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('Yd04M3BgvYWqcPFp', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:47', NULL, NULL, '__messages', '169051AC62102', NULL, '{\"ip\":\"127.0.0.1\"}'),
('yEfka0CsU7ShccGi', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:25', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":383.72993333705,\"new_value\":567.94045965284}]', '{\"ip\":\"127.0.0.1\"}'),
('Yh4odYWXCXdURDaS', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:13', NULL, NULL, '__messages', '191140C2413C8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('yIfPNnZAfHIWAX9i', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:26:27', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":952.24524076145,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('yIYQrPfVPDW97Sba', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:25:46', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":600,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('Yjoe0kZhmQpeVfV3', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:25:18', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":600}]', '{\"ip\":\"127.0.0.1\"}'),
('ylDg6W46icXGdxRf', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:26:43', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":347.86679964539,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('ynghhvTHGttYGTQ8', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'reserves', '2022-09-10 23:25:08', NULL, NULL, '__asset_wallets', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('yOeOb02aZefGt2Ag', 'TEST_SESSION', 'Temporarily disabling for test users.', 'entry_update', 'system', '2022-09-10 23:25:00', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for test users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('YPeU0jfKhKVDJHVL', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:25:05', NULL, '151447CA881E4', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ypv0cfCZhl4a0g6u', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:25:43', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":150.42553191489}]', '{\"ip\":\"127.0.0.1\"}'),
('YqLH4AA5hOBPD26L', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:26:32', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1610.351008422,\"new_value\":1612.9825873694}]', '{\"ip\":\"127.0.0.1\"}'),
('yR98ZeGpheTLG9ww', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:24:54', NULL, '16434596DC465', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('yXI7g29okYT4A18e', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:25:59', NULL, NULL, '__asset_wallets', '8', '[{\"field_name\":\"asset_value\",\"old_value\":100,\"new_value\":312.76595744681}]', '{\"ip\":\"127.0.0.1\"}'),
('YxmdGcxsHjr8yrE7', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 23:26:07', NULL, NULL, '__trades', '122235A5C0C77', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:03\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('yXqDMofjywhZfWlq', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:25:02', NULL, '155294B189D33', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('YyBjEZQv8UKOgCB1', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:25:13', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":218.87587867,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('YzdGotv55j4wN9h2', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:26:29', NULL, NULL, '__messages', '10844108DB890', NULL, '{\"ip\":\"127.0.0.1\"}'),
('z0UZUHKxBCPOCk7i', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:25:07', NULL, '1520351ED0C69', '__notifications', '1070049FCC897', NULL, NULL),
('Z1WpBDzsAMxh73mz', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:24:56', NULL, NULL, '__buyer_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('z2SCp0rfpMsY2aEa', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'lodza', '2022-09-10 23:25:10', NULL, NULL, '__asset_wallets', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Z4I3ct3t1mQIDDpT', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-10 23:26:16', NULL, NULL, '__trades', '188640BA1D4C2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Z5hlDBMy1hR1diwJ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:25:22', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1690,\"new_value\":1590}]', '{\"ip\":\"127.0.0.1\"}'),
('ZDH80uFk61w9oE26', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:26:36', NULL, NULL, '__trades', '136199905D397', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:26:35\"}]', '{\"ip\":\"127.0.0.1\"}'),
('zeFTiDHUAdES7dHl', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'reserves', '2022-09-10 23:25:08', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":3000}]', '{\"ip\":\"127.0.0.1\"}'),
('zeXY3w7AVVWZFd1h', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:24:54', NULL, NULL, '__admin_extensions', 'developer', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zFlIuurIBE4sD7C7', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:37', NULL, NULL, '__messages', '183439172A06A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ZiJJ1nGtWVNZejUA', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'ross', '2022-09-10 23:25:55', NULL, NULL, '__buyer_extensions', 'clarence', NULL, '{\"ip\":\"127.0.0.1\"}'),
('znlMyNOGZRNRFNAr', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:25:39', NULL, NULL, '__asset_wallets', '11', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":105.26315789474}]', '{\"ip\":\"127.0.0.1\"}'),
('zrKL6F2pQ5xyGcVY', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:25:04', NULL, '13522050303B6', '__users', 'keith', NULL, NULL),
('ZVjD7tFdafLwTS5i', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-10 23:25:41', NULL, NULL, '__trades', '14837865B6EC4', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:25:38\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('zwD5m0r8uKszATAz', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:38', NULL, NULL, '__messages', '120994EDD3911', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zWEq3ln1EMraUl1p', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'keith', '2022-09-10 23:25:17', NULL, NULL, '__asset_wallets', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ZXgEkGVAmQtnvnGm', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:25:28', NULL, NULL, '__messages', '126271E213463', NULL, '{\"ip\":\"127.0.0.1\"}');

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
('100446E0247A7', '__trades', '123840146D8A8', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:26:23', NULL),
('10313659255E2', '__trades', '1186403F67447', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:25:44', NULL),
('10844108DB890', '__trades', '158043048EED8', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:26:29', NULL),
('108832229C421', '__trades', '1760821ED9C2C', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:25:57', NULL),
('114683B341853', '__trades', '165474C5BAFA5', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:26:52', NULL),
('1174258C7FF0D', '__trades', '145892D663C9F', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:25:50', NULL),
('1208553AFDCBA', '__trades', '136199905D397', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:26:35', NULL),
('120994EDD3911', '__trades', '14837865B6EC4', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:25:37', NULL),
('1224560BC25FA', '__trades', '188640BA1D4C2', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:26:16', NULL),
('124162297600F', '__trades', '122235A5C0C77', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:26:03', NULL),
('1253277377610', '__trades', '145892D663C9F', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:25:53', NULL),
('125713BA55719', '__trades', '1760821ED9C2C', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:25:56', NULL),
('126271E213463', '__trades', '189625F7A18FC', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:25:27', NULL),
('127054D6FCCF8', '__trades', '189625F7A18FC', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:25:26', NULL),
('1279848412134', '__trades', '188640BA1D4C2', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:26:20', NULL),
('1281896D4E4F4', '__trades', '189625F7A18FC', 'Pleasure doing business with you.', 'ross', '2022-09-10 23:25:31', NULL),
('128468AF3B397', '__trades', '189625F7A18FC', 'I\'m sending the cash in a couple of minutes.', 'guddaz', '2022-09-10 23:25:26', NULL),
('128778DDC4F2C', '__trades', '1186403F67447', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:25:44', NULL),
('13145525F6711', '__trades', '189625F7A18FC', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:25:34', NULL),
('132257CB703B7', '__trades', '1430769DA99F8', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:26:42', NULL),
('133564784F08E', '__trades', '188640BA1D4C2', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:26:17', NULL),
('135190FA7082E', '__trades', '189625F7A18FC', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:25:31', NULL),
('135488F569050', '__trades', '123840146D8A8', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:26:23', NULL),
('13925734CC62B', '__trades', '136199905D397', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:26:39', NULL),
('1443909DBD25C', '__trades', '1430769DA99F8', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:26:42', NULL),
('1448359DCD14C', '__trades', '189625F7A18FC', 'I\'ve collected the money.', 'ross', '2022-09-10 23:25:30', NULL),
('146616E3E7B6C', '__trades', '189625F7A18FC', 'I\'ve sent the cash.\nPlease confirm receiving it.', 'guddaz', '2022-09-10 23:25:29', NULL),
('1474691DD4F75', '__trades', '123840146D8A8', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:26:23', NULL),
('1511710AEB4A2', '__trades', '158043048EED8', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:26:32', NULL),
('15217671E0974', '__trades', '14837865B6EC4', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:25:38', NULL),
('1553521CE508D', '__trades', '145892D663C9F', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:25:50', NULL),
('156698BA25813', '__trades', '1430769DA99F8', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:26:42', NULL),
('158813FA52F54', '__trades', '145892D663C9F', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:25:50', NULL),
('1593756E0B3BB', '__trades', '122235A5C0C77', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:26:06', NULL),
('160400DFB3311', '__trades', '188640BA1D4C2', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:26:16', NULL),
('161324D477F88', '__trades', '165474C5BAFA5', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:26:49', NULL),
('162318BC35464', '__trades', '1186403F67447', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:25:44', NULL),
('163080965B20C', '__trades', '165474C5BAFA5', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:26:48', NULL),
('16351357A6266', '__trades', '123840146D8A8', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:26:26', NULL),
('163607FD391B7', '__trades', '158043048EED8', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:26:29', NULL),
('166541274EE41', '__trades', '14837865B6EC4', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:25:41', NULL),
('169051AC62102', '__trades', '1186403F67447', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:25:47', NULL),
('169307C907D9E', '__trades', '122235A5C0C77', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:26:03', NULL),
('170214D6A7372', '__trades', '158043048EED8', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:26:29', NULL),
('1717044F23572', '__trades', '1760821ED9C2C', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:25:57', NULL),
('17434632E012E', '__trades', '1430769DA99F8', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:26:46', NULL),
('1754068A076E5', '__trades', '1431047100D34', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:26:09', NULL),
('178476203E2D2', '__trades', '1431047100D34', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:26:10', NULL),
('1788422A622BB', '__trades', '1431047100D34', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:26:10', NULL),
('179477B3B00FD', '__trades', '136199905D397', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:26:36', NULL),
('183439172A06A', '__trades', '14837865B6EC4', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:25:37', NULL),
('1870234141DEA', '__trades', '136199905D397', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:26:35', NULL),
('188173824EC3B', '__trades', '1760821ED9C2C', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:26:00', NULL),
('18844349D7D00', '__trades', '122235A5C0C77', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:26:03', NULL),
('191140C2413C8', '__trades', '1431047100D34', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:26:13', NULL),
('192796D772A89', '__trades', '165474C5BAFA5', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:26:49', NULL);

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
('10162754A2D8D', 'lodza', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:25:01', NULL),
('1070049FCC897', 'raymond', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:25:07', NULL),
('114874AB51D76', 'developer', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:24:53', NULL),
('116214F34D33C', 'busadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:24:56', NULL),
('1276983D26C34', 'clarence', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:25:06', NULL),
('1409467B98921', 'sysadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:24:54', NULL),
('142332B06DE2D', 'reserves', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:24:55', NULL),
('14545432630D0', 'guddaz', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:25:00', NULL),
('161422B995807', 'ross', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:25:03', NULL),
('1780347C5AD8E', 'flint', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:25:05', NULL),
('179902C3C3692', 'nassim', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:25:08', NULL),
('1857421A46529', 'peter', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:25:05', NULL),
('190993DED58B7', 'jimmy', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:25:03', NULL),
('1963766F3BEAD', 'keith', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:25:04', NULL);

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
('10130100574C6', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '0.94', 100, 200, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'guddaz', '2022-09-10 23:26:40', '2022-09-10 23:26:40', NULL),
('103981088CAD6', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 200, 300, NULL, NULL, 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', NULL, 'online', 'peter', '2022-09-10 23:26:08', '2022-09-10 23:26:08', NULL),
('10490640336C8', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '13.3', 2800, 14000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'lodza', '2022-09-10 23:26:01', '2022-09-10 23:26:01', NULL),
('119326B7173A7', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '170', 20000, 40000, NULL, NULL, 'algerie_poste', '{\"account_holder_name\":\"Timothy Tambo\",\"account_number\":\"22558678\",\"account_key\":\"87\"}', NULL, 'online', 'peter', '2022-09-10 23:26:47', '2022-09-10 23:26:47', NULL),
('126494E170B6D', 'Zimbabwe', 'Norton', 'sell', 'USDT', 'USD', '1.04', NULL, NULL, '50', '200', 'cash_in_person', NULL, NULL, 'online', 'guddaz', '2022-09-10 23:25:35', '2022-09-10 23:25:35', NULL),
('12728038F1971', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.2', 700, 3000, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'lodza', '2022-09-10 23:26:21', '2022-09-10 23:26:21', NULL),
('1342726F91750', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '178', 10000, 40000, NULL, NULL, 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', NULL, 'online', 'nassim', '2022-09-10 23:26:33', '2022-09-10 23:26:33', NULL),
('13634665D7AE9', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'ross', '2022-09-10 23:25:24', '2022-09-10 23:25:24', NULL),
('153580408ECCF', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.36', 1500, 2500, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'flint', '2022-09-10 23:26:15', '2022-09-10 23:26:15', NULL),
('1557647D1123B', 'Italy', NULL, 'buy', 'USDT', 'EUR', '0.76', 200, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', NULL, 'online', 'raymond', '2022-09-10 23:26:27', '2022-09-10 23:26:27', NULL),
('1670592D47DD3', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', NULL, 'online', 'keith', '2022-09-10 23:25:42', '2022-09-10 23:25:42', NULL),
('16731862919A8', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'clarence', '2022-09-10 23:25:55', '2022-09-10 23:25:55', NULL),
('1789717EBC4B1', 'Zambia', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', NULL, 'online', 'jimmy', '2022-09-10 23:25:48', '2022-09-10 23:25:48', NULL),
('195624DCB94C1', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.95', 100, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', NULL, 'online', 'raymond', '2022-09-10 23:25:35', '2022-09-10 23:25:35', NULL);

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
(1, 'Update system config params', 'update_sysconfig_params', 'Permission holder can update system config params.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(2, 'Handle feedback reports', 'handle_feedback_reports', 'Permission holder can handle feedback reports.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(3, 'Manage datalists', 'manage_datalists', 'Permission holder can manage datalists.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(4, 'Manage system tools', 'manage_systools', 'Permission holder can manage system tools.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(5, 'View all logs', 'view_all_logs', 'Permission holder can view all logs.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(6, 'View all transactions', 'view_all_transactions', 'Permission holder can view all transactions.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(7, 'Manage Deposit Tokens', 'manage_deposit_tokens', 'Permission holder can create and edit deposit tokens.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(8, 'Handle Withdrawals', 'handle_withdrawals', 'Permission holder can handle withdrawals.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(9, 'Manage Registration Tokens', 'manage_reg_tokens', 'Permission holder can create and edit registration tokens.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(10, 'Handle flagged users', 'handle_flagged_users', 'Permission holder can handle flagged Users.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(11, 'Handle customer service chats', 'handle_customer_service_chats', 'Permission holder can handle customer service chats.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(12, 'Manage update posts', 'manage_update_posts', 'Permission holder can handle posting and editing update posts.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(13, 'Handle flagged business elems', 'handle_flagged_business_elems', 'Permission holder can handle flagged business elems (Offers, Trades, etc).', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL);

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
(1, '__user_groups', 'system_administrators', 'update_sysconfig_params', 'active', 'system', '2022-09-11 01:24:51', NULL),
(2, '__user_groups', 'system_administrators', 'handle_feedback_reports', 'active', 'system', '2022-09-11 01:24:51', NULL),
(3, '__user_groups', 'system_administrators', 'manage_systools', 'active', 'system', '2022-09-11 01:24:51', NULL),
(4, '__user_groups', 'system_administrators', 'manage_datalists', 'active', 'system', '2022-09-11 01:24:51', NULL),
(5, '__user_groups', 'system_administrators', 'view_all_logs', 'active', 'system', '2022-09-11 01:24:51', NULL),
(6, '__user_groups', 'business_administrators', 'view_all_transactions', 'active', 'system', '2022-09-11 01:24:51', NULL),
(7, '__user_groups', 'business_administrators', 'manage_deposit_tokens', 'active', 'system', '2022-09-11 01:24:51', NULL),
(8, '__user_groups', 'business_administrators', 'handle_withdrawals', 'active', 'system', '2022-09-11 01:24:51', NULL),
(9, '__user_groups', 'user_administrators', 'manage_reg_tokens', 'active', 'system', '2022-09-11 01:24:51', NULL),
(10, '__user_groups', 'user_administrators', 'handle_flagged_users', 'active', 'system', '2022-09-11 01:24:51', NULL),
(11, '__user_groups', 'platform_moderators', 'handle_customer_service_chats', 'active', 'system', '2022-09-11 01:24:51', NULL),
(12, '__user_groups', 'platform_moderators', 'handle_flagged_business_elems', 'active', 'system', '2022-09-11 01:24:51', NULL),
(13, '__user_groups', 'platform_moderators', 'manage_update_posts', 'active', 'system', '2022-09-11 01:24:51', NULL);

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
(1, '__users', 'system', 'Backend rest api enabled', 'backend_rest_api_enabled', '1', 'boolean', 'system', '2022-09-11 01:24:50', NULL),
(2, '__users', 'system', 'Scaffolding app enabled', 'scaffolding_app_enabled', '1', 'boolean', 'system', '2022-09-11 01:24:50', NULL),
(3, '__users', 'system', 'Fallback Display Language', 'fallback_pref_lang', 'en', 'enum:langs', 'system', '2022-09-11 01:24:50', NULL),
(4, '__users', 'system', 'Fallback Display Theme', 'fallback_pref_theme', 'light', 'enum:themes', 'system', '2022-09-11 01:24:50', NULL),
(5, '__users', 'system', 'Image storage driver', 'image_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-11 01:24:50', NULL),
(6, '__users', 'system', 'Document storage driver', 'document_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-11 01:24:50', NULL),
(7, '__users', 'system', 'Logs database driver', 'logs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-11 01:24:50', NULL),
(8, '__users', 'system', 'Notifications database driver', 'notifs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-11 01:24:50', NULL),
(9, '__users', 'system', 'Chats database driver', 'chats_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-11 01:24:50', NULL),
(10, '__users', 'system', 'Messages database driver', 'msgs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-11 01:24:50', NULL),
(11, '__users', 'system', 'Offers database driver', 'offers_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-11 01:24:50', NULL),
(12, '__users', 'system', 'Trades database driver', 'trades_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-11 01:24:50', NULL),
(13, '__users', 'system', 'Token registration enabled', 'token_reg_enabled', '1', 'boolean', 'system', '2022-09-11 01:24:50', '2022-09-10 23:26:53'),
(14, '__users', 'system', 'Token registration max use count', 'reg_token_max_use_count', '10', 'integer', 'system', '2022-09-11 01:24:50', NULL),
(15, '__users', 'system', 'Open Registration enabled', 'open_reg_enabled', '0', 'boolean', 'system', '2022-09-11 01:24:50', NULL),
(16, '__users', 'system', 'Learn mode available', 'learn_mode_available', '1', 'boolean', 'system', '2022-09-11 01:24:50', NULL),
(17, '__users', 'system', 'Offers to buy enabled', 'offer_to_buy_enabled', '1', 'boolean', 'system', '2022-09-11 01:24:50', NULL),
(18, '__users', 'system', 'Offers to sell enabled', 'offer_to_sell_enabled', '1', 'boolean', 'system', '2022-09-11 01:24:50', NULL),
(19, '__users', 'system', 'Use development crypto asset engine', 'use_dev_crypto_asset_engine', '1', 'boolean', 'system', '2022-09-11 01:24:50', NULL),
(20, '__users', 'system', 'Use tatum crypto asset engine', 'use_tatum_crypto_asset_engine', '0', 'boolean', 'system', '2022-09-11 01:24:50', NULL),
(21, '__users', 'system', 'Value charged by platform on transactions', 'platform_charge_asset_factor', '0.01', 'float', 'system', '2022-09-11 01:24:50', NULL),
(22, '__users', 'system', 'Minimum allowed price per unit currency on offers', 'min_offer_purchase_price', '0.5', 'float', 'system', '2022-09-11 01:24:50', NULL);

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
(1, 'Cash in person', 'cash_in_person', '5e5d4b', '[\"phone_no\"]', NULL, 'active', 'system', '2022-09-11 01:24:50', NULL, NULL),
(2, 'Stanbic bank', 'stanbic_bank', '066ef3', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-11 01:24:50', NULL, NULL),
(3, 'FNB bank', 'fnb_bank', '009eaa', '[\"account_holder_name\",\"account_no\"]', '[\"ZAR\"]', 'active', 'system', '2022-09-11 01:24:50', NULL, NULL),
(4, 'Mukuru', 'mukuru', 'e77924', '[\"fullname\",\"phone_no\"]', '[\"USD\"]', 'active', 'system', '2022-09-11 01:24:50', NULL, NULL),
(5, 'Algérie Poste', 'algerie_poste', '01009a', '[\"account_holder_name\",\"account_no\",\"account_key\"]', '[\"DZD\"]', 'active', 'system', '2022-09-11 01:24:50', NULL, NULL),
(6, 'MTN Mobile Money', 'mtn_momo', 'feca05', '[\"fullname\",\"phone_no\"]', NULL, 'active', 'system', '2022-09-11 01:24:50', NULL, NULL),
(7, 'Ecocash', 'ecocash', '005ba4', '[\"fullname\",\"phone_no\"]', '[\"ZWL\"]', 'active', 'system', '2022-09-11 01:24:50', NULL, NULL),
(8, 'Paypal', 'paypal', '27346a', '[\"fullname\",\"email_address\"]', '[\"USD\",\"EUR\",\"GBP\"]', 'active', 'system', '2022-09-11 01:24:50', NULL, NULL),
(9, 'Skrill', 'skrill', '862165', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-11 01:24:50', NULL, NULL),
(10, 'World Remit', 'world_remit', '604684', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-11 01:24:50', NULL, NULL),
(11, 'Mastercard', 'mastercard', 'cc0001', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-11 01:24:50', NULL, NULL),
(12, 'Visa', 'visa', '0055a5', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-11 01:24:50', NULL, NULL),
(13, 'FBC Bank', 'fbc_bank', '0055a5', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-11 01:24:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__reg_tokens`
--

CREATE TABLE `__reg_tokens` (
  `token` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('active','deactivated','used_up') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__reg_tokens`
--

INSERT INTO `__reg_tokens` (`token`, `_status`, `creator_username`, `created_datetime`) VALUES
('1234567890', 'active', 'system', '2022-09-10 23:25:00');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-10 23:24:55', '2022-09-10 23:24:55', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-10 23:24:56', '2022-09-10 23:24:56', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-10 23:24:57', '2022-09-10 23:24:57', NULL),
(4, 'guddaz', 'active', 'guddaz', '2022-09-10 23:25:24', '2022-09-10 23:25:24', NULL),
(5, 'lodza', 'active', 'lodza', '2022-09-10 23:25:36', '2022-09-10 23:25:36', NULL),
(6, 'ross', 'active', 'ross', '2022-09-10 23:25:55', '2022-09-10 23:25:55', NULL),
(7, 'keith', 'active', 'keith', '2022-09-10 23:26:01', '2022-09-10 23:26:01', NULL),
(8, 'jimmy', 'active', 'jimmy', '2022-09-10 23:26:21', '2022-09-10 23:26:21', NULL),
(9, 'flint', 'active', 'flint', '2022-09-10 23:26:40', '2022-09-10 23:26:40', NULL);

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
('FACTORY_SESSION', 'system', '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'ended', '2022-09-11 01:24:50', NULL, NULL, NULL),
('JhBwiiR5lTJjmtxz', 'guddaz', '{\"name\":null,\"version\":null}', '{\"name\":\"Ankelli Web App\",\"version\":\"1.0.0\",\"extra\":\"Ankelli Web App\"}', 'active', '2022-09-10 23:27:18', '2022-09-10 23:27:19', '2022-09-10 23:27:19', NULL),
('TEST_SESSION', NULL, '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'active', '2022-09-11 01:24:50', NULL, NULL, NULL);

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
  `escrow_lock_transaction_ref_code` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `__trades` (`ref_code`, `country_name`, `location`, `was_offer_to`, `asset_code`, `currency_code`, `asset_value`, `asset_value_escrowed`, `platform_charge_asset_factor`, `currency_amount`, `offer_price`, `escrow_lock_transaction_ref_code`, `pymt_method_slug`, `pymt_details`, `pymt_declared_datetime`, `pymt_confirmed_datetime`, `visible_to_creator`, `visible_to_offer_creator`, `_status`, `offer_creator_username`, `creator_username`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
('1186403F67447', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '148.93617021277', '150.42553191489', '0.01', 140, '0.94', '1457882BC5CEE', 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', '2022-09-10 23:25:44', '2022-09-10 23:25:44', 1, 1, 'completed', 'keith', 'lodza', '2022-09-10 23:25:44', '2022-09-10 23:25:47', NULL),
('122235A5C0C77', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '210.52631578947', '212.63157894737', '0.01', 2800, '13.3', '134458DED8818', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-10 23:26:03', '2022-09-10 23:26:03', 1, 1, 'completed', 'lodza', 'keith', '2022-09-10 23:26:03', '2022-09-10 23:26:07', NULL),
('123840146D8A8', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '184.21052631579', '186.05263157895', '0.01', 2800, '15.2', '154787A34AC04', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-10 23:26:23', '2022-09-10 23:26:23', 1, 1, 'completed', 'lodza', 'jimmy', '2022-09-10 23:26:23', '2022-09-10 23:26:26', NULL),
('136199905D397', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '202.24719101124', '204.26966292135', '0.01', 36000, '178', '103129FCF17CC', 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', '2022-09-10 23:26:35', '2022-09-10 23:26:36', 1, 1, 'completed', 'nassim', 'jimmy', '2022-09-10 23:26:35', '2022-09-10 23:26:39', NULL),
('1430769DA99F8', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', '192695283403D', 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', '2022-09-10 23:26:42', '2022-09-10 23:26:42', 1, 1, 'completed', 'guddaz', 'flint', '2022-09-10 23:26:42', '2022-09-10 23:26:46', NULL),
('1431047100D34', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '265.95744680851', '268.6170212766', '0.01', 250, '0.94', '190506B3A8249', 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', '2022-09-10 23:26:10', '2022-09-10 23:26:10', 1, 1, 'completed', 'peter', 'keith', '2022-09-10 23:26:09', '2022-09-10 23:26:13', NULL),
('145892D663C9F', 'Zambia', NULL, 'buy', 'USDT', 'USD', '638.29787234043', '644.68085106383', '0.01', 600, '0.94', '138259634E52D', 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', '2022-09-10 23:25:50', '2022-09-10 23:25:50', 1, 1, 'completed', 'jimmy', 'lodza', '2022-09-10 23:25:50', '2022-09-10 23:25:54', NULL),
('14837865B6EC4', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '105.26315789474', '106.31578947368', '0.01', 100, '0.95', '143073CF0AFEE', 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', '2022-09-10 23:25:37', '2022-09-10 23:25:38', 1, 1, 'completed', 'raymond', 'lodza', '2022-09-10 23:25:37', '2022-09-10 23:25:41', NULL),
('158043048EED8', 'Italy', NULL, 'buy', 'USDT', 'EUR', '263.15789473684', '265.78947368421', '0.01', 200, '0.76', '1818203F0E786', 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', '2022-09-10 23:26:29', '2022-09-10 23:26:29', 1, 1, 'completed', 'raymond', 'jimmy', '2022-09-10 23:26:29', '2022-09-10 23:26:32', NULL),
('165474C5BAFA5', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '205.88235294118', '207.94117647059', '0.01', 35000, '170', '1128999536816', 'algerie_poste', '{\"account_holder_name\":\"Timothy Tambo\",\"account_number\":\"22558678\",\"account_key\":\"87\"}', '2022-09-10 23:26:49', '2022-09-10 23:26:49', 1, 1, 'completed', 'peter', 'flint', '2022-09-10 23:26:48', '2022-09-10 23:26:52', NULL),
('1760821ED9C2C', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', '1277684043E11', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-10 23:25:57', '2022-09-10 23:25:57', 1, 1, 'completed', 'clarence', 'ross', '2022-09-10 23:25:56', '2022-09-10 23:26:00', NULL),
('188640BA1D4C2', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '162.76041666667', '164.38802083333', '0.01', 2500, '15.36', '1405004EE5CB3', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-10 23:26:16', '2022-09-10 23:26:17', 1, 1, 'completed', 'flint', 'keith', '2022-09-10 23:26:16', '2022-09-10 23:26:20', NULL),
('189625F7A18FC', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '106.3829787234', '107.44680851064', '0.01', 100, '0.94', '1220804488316', 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', '2022-09-10 23:25:27', '2022-09-10 23:25:31', 1, 1, 'completed', 'ross', 'guddaz', '2022-09-10 23:25:26', '2022-09-10 23:25:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__transactions`
--

CREATE TABLE `__transactions` (
  `ref_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blockchain_txid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_token` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tr_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destination_user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_value` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_result` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_datetime` timestamp NULL DEFAULT current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__transactions`
--

INSERT INTO `__transactions` (`ref_code`, `blockchain_txid`, `session_token`, `description`, `tr_type`, `source_user_username`, `destination_user_username`, `asset_code`, `transfer_value`, `transfer_result`, `transfer_datetime`, `deleted_datetime`) VALUES
('1006655C1502B', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"1430769DA99F8\"', 'escrow_asset_unlock', 'escrow', 'flint', 'USDT', '214.89361702128', '[{\"user_username\":\"escrow\",\"old_asset_value\":214.89361702128,\"new_asset_value\":0},{\"user_username\":\"flint\",\"old_asset_value\":347.86679964539,\"new_asset_value\":562.76041666667}]', '2022-09-10 23:26:43', '2022-09-10 23:26:43'),
('1025425A6BCE5', NULL, 'TEST_SESSION', 'Asset release for trade \"1186403F67447\"', 'trade_asset_release', 'lodza', 'keith', 'USDT', '148.93617021277', '[{\"user_username\":\"lodza\",\"old_asset_value\":968.31000052631,\"new_asset_value\":819.37383031354},{\"user_username\":\"keith\",\"old_asset_value\":600,\"new_asset_value\":748.93617021277}]', '2022-09-10 23:25:46', NULL),
('103129FCF17CC', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"136199905D397\"', 'escrow_asset_lock', 'jimmy', 'escrow', 'USDT', '204.26966292135', '[{\"user_username\":\"jimmy\",\"old_asset_value\":686.45576707724,\"new_asset_value\":482.18610415589},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":204.26966292135}]', '2022-09-10 23:26:34', '2022-09-10 23:26:36'),
('1038538DEADF4', NULL, 'TEST_SESSION', 'Platform charge for transaction \"122517D1CDA1F\"', 'platform_charge', 'ross', 'reserves', 'USDT', '2.1276595744681', '[{\"user_username\":\"ross\",\"old_asset_value\":3.61702127659,\"new_asset_value\":1.4893617021219},{\"user_username\":\"reserves\",\"old_asset_value\":1599.9888017916,\"new_asset_value\":1602.1164613661}]', '2022-09-10 23:26:00', NULL),
('104151A1FBB93', NULL, 'TEST_SESSION', 'Platform charge for transaction \"17165583C815B\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.1052631578947', '[{\"user_username\":\"keith\",\"old_asset_value\":538.4098544233,\"new_asset_value\":536.30459126541},{\"user_username\":\"reserves\",\"old_asset_value\":1602.1164613661,\"new_asset_value\":1604.221724524}]', '2022-09-10 23:26:06', NULL),
('10428445536C0', NULL, 'TEST_SESSION', 'Platform charge for transaction \"13378745D4DE0\"', 'platform_charge', 'flint', 'reserves', 'USDT', '2.1276595744681', '[{\"user_username\":\"flint\",\"old_asset_value\":349.99445921986,\"new_asset_value\":347.86679964539},{\"user_username\":\"reserves\",\"old_asset_value\":1615.0050592795,\"new_asset_value\":1617.132718854}]', '2022-09-10 23:26:46', NULL),
('109291AD1C274', NULL, 'TEST_SESSION', 'Asset release for trade \"1431047100D34\"', 'trade_asset_release', 'keith', 'peter', 'USDT', '265.95744680851', '[{\"user_username\":\"keith\",\"old_asset_value\":536.30459126541,\"new_asset_value\":270.3471444569},{\"user_username\":\"peter\",\"old_asset_value\":0,\"new_asset_value\":265.95744680851}]', '2022-09-10 23:26:12', NULL),
('1128999536816', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"165474C5BAFA5\"', 'escrow_asset_lock', 'flint', 'escrow', 'USDT', '207.94117647059', '[{\"user_username\":\"flint\",\"old_asset_value\":347.86679964539,\"new_asset_value\":139.9256231748},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":207.94117647059}]', '2022-09-10 23:26:47', '2022-09-10 23:26:49'),
('11543065E61C6', NULL, 'TEST_SESSION', 'Asset release for trade \"188640BA1D4C2\"', 'trade_asset_release', 'keith', 'flint', 'USDT', '162.76041666667', '[{\"user_username\":\"keith\",\"old_asset_value\":267.68756998881,\"new_asset_value\":104.92715332214},{\"user_username\":\"flint\",\"old_asset_value\":400,\"new_asset_value\":562.76041666667}]', '2022-09-10 23:26:18', NULL),
('11585095E70A3', NULL, 'TEST_SESSION', 'Transfer from Exodus wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '98.9012', '[{\"user_username\":\"guddaz\",\"old_asset_value\":218.87587867,\"new_asset_value\":317.77707867}]', '2022-09-10 23:25:13', NULL),
('121631ADDF933', NULL, 'TEST_SESSION', 'Platform charge for transaction \"1977006622187\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '1.8421052631579', '[{\"user_username\":\"jimmy\",\"old_asset_value\":954.08734602461,\"new_asset_value\":952.24524076145},{\"user_username\":\"reserves\",\"old_asset_value\":1608.5089031588,\"new_asset_value\":1610.351008422}]', '2022-09-10 23:26:26', NULL),
('1220804488316', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"189625F7A18FC\"', 'escrow_asset_lock', 'guddaz', 'escrow', 'USDT', '107.44680851064', '[{\"user_username\":\"guddaz\",\"old_asset_value\":317.77707867,\"new_asset_value\":210.33027015936},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":107.44680851064}]', '2022-09-10 23:25:25', '2022-09-10 23:25:31'),
('122272759E167', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"189625F7A18FC\"', 'escrow_asset_unlock', 'escrow', 'guddaz', 'USDT', '107.44680851064', '[{\"user_username\":\"escrow\",\"old_asset_value\":107.44680851064,\"new_asset_value\":0},{\"user_username\":\"guddaz\",\"old_asset_value\":210.33027015936,\"new_asset_value\":317.77707867}]', '2022-09-10 23:25:31', '2022-09-10 23:25:31'),
('122517D1CDA1F', NULL, 'TEST_SESSION', 'Asset release for trade \"1760821ED9C2C\"', 'trade_asset_release', 'ross', 'clarence', 'USDT', '212.76595744681', '[{\"user_username\":\"ross\",\"old_asset_value\":216.3829787234,\"new_asset_value\":3.61702127659},{\"user_username\":\"clarence\",\"old_asset_value\":100,\"new_asset_value\":312.76595744681}]', '2022-09-10 23:25:59', NULL),
('123398DE6B926', NULL, 'TEST_SESSION', 'Asset release for trade \"189625F7A18FC\"', 'trade_asset_release', 'guddaz', 'ross', 'USDT', '106.3829787234', '[{\"user_username\":\"guddaz\",\"old_asset_value\":317.77707867,\"new_asset_value\":211.3940999466},{\"user_username\":\"ross\",\"old_asset_value\":110,\"new_asset_value\":216.3829787234}]', '2022-09-10 23:25:33', NULL),
('1249820789C96', NULL, 'TEST_SESSION', 'Platform charge for transaction \"16813700D17F2\"', 'platform_charge', 'flint', 'reserves', 'USDT', '2.0588235294118', '[{\"user_username\":\"flint\",\"old_asset_value\":141.98444670421,\"new_asset_value\":139.9256231748},{\"user_username\":\"reserves\",\"old_asset_value\":1617.132718854,\"new_asset_value\":1619.1915423834}]', '2022-09-10 23:26:52', NULL),
('127077E524E54', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"122235A5C0C77\"', 'escrow_asset_unlock', 'escrow', 'keith', 'USDT', '212.63157894737', '[{\"user_username\":\"escrow\",\"old_asset_value\":212.63157894737,\"new_asset_value\":0},{\"user_username\":\"keith\",\"old_asset_value\":536.3045912654,\"new_asset_value\":748.93617021277}]', '2022-09-10 23:26:04', '2022-09-10 23:26:04'),
('1277684043E11', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"1760821ED9C2C\"', 'escrow_asset_lock', 'ross', 'escrow', 'USDT', '214.89361702128', '[{\"user_username\":\"ross\",\"old_asset_value\":216.3829787234,\"new_asset_value\":1.4893617021234},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":214.89361702128}]', '2022-09-10 23:25:55', '2022-09-10 23:25:57'),
('127973B644216', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"158043048EED8\"', 'escrow_asset_unlock', 'escrow', 'jimmy', 'USDT', '265.78947368421', '[{\"user_username\":\"escrow\",\"old_asset_value\":265.78947368421,\"new_asset_value\":0},{\"user_username\":\"jimmy\",\"old_asset_value\":686.45576707724,\"new_asset_value\":952.24524076145}]', '2022-09-10 23:26:30', '2022-09-10 23:26:30'),
('12848978D526A', NULL, 'TEST_SESSION', 'Platform charge for transaction \"168619EF8C49D\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.0526315789474', '[{\"user_username\":\"lodza\",\"old_asset_value\":969.36263210526,\"new_asset_value\":968.31000052631},{\"user_username\":\"reserves\",\"old_asset_value\":1591.0638297872,\"new_asset_value\":1592.1164613661}]', '2022-09-10 23:25:41', NULL),
('1304801241D62', NULL, 'TEST_SESSION', 'Transfer from Ledger wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '967.86579', '[{\"user_username\":\"lodza\",\"old_asset_value\":0,\"new_asset_value\":967.86579}]', '2022-09-10 23:25:11', NULL),
('1310274BE1552', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '218.87587867', '[{\"user_username\":\"guddaz\",\"old_asset_value\":0,\"new_asset_value\":218.87587867}]', '2022-09-10 23:25:09', NULL),
('1329476CAF483', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '106.76', '[{\"user_username\":\"lodza\",\"old_asset_value\":967.86579,\"new_asset_value\":1074.62579}]', '2022-09-10 23:25:14', NULL),
('13378745D4DE0', NULL, 'TEST_SESSION', 'Asset release for trade \"1430769DA99F8\"', 'trade_asset_release', 'flint', 'guddaz', 'USDT', '212.76595744681', '[{\"user_username\":\"flint\",\"old_asset_value\":562.76041666667,\"new_asset_value\":349.99445921986},{\"user_username\":\"guddaz\",\"old_asset_value\":210.33027015937,\"new_asset_value\":423.09622760618}]', '2022-09-10 23:26:44', NULL),
('134458DED8818', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"122235A5C0C77\"', 'escrow_asset_lock', 'keith', 'escrow', 'USDT', '212.63157894737', '[{\"user_username\":\"keith\",\"old_asset_value\":748.93617021277,\"new_asset_value\":536.3045912654},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":212.63157894737}]', '2022-09-10 23:26:02', '2022-09-10 23:26:04'),
('136780113F518', NULL, 'TEST_SESSION', 'Platform charge for transaction \"1025425A6BCE5\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.4893617021277', '[{\"user_username\":\"lodza\",\"old_asset_value\":819.37383031354,\"new_asset_value\":817.88446861141},{\"user_username\":\"reserves\",\"old_asset_value\":1592.1164613661,\"new_asset_value\":1593.6058230682}]', '2022-09-10 23:25:47', NULL),
('138259634E52D', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"145892D663C9F\"', 'escrow_asset_lock', 'lodza', 'escrow', 'USDT', '644.68085106383', '[{\"user_username\":\"lodza\",\"old_asset_value\":817.88446861141,\"new_asset_value\":173.20361754758},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":644.68085106383}]', '2022-09-10 23:25:49', '2022-09-10 23:25:51'),
('138672ED28DF9', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"188640BA1D4C2\"', 'escrow_asset_unlock', 'escrow', 'keith', 'USDT', '164.38802083333', '[{\"user_username\":\"escrow\",\"old_asset_value\":164.38802083333,\"new_asset_value\":0},{\"user_username\":\"keith\",\"old_asset_value\":103.29954915548,\"new_asset_value\":267.68756998881}]', '2022-09-10 23:26:17', '2022-09-10 23:26:17'),
('1402793374BF9', NULL, 'TEST_SESSION', 'Platform charge for transaction \"16735135B066A\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.0224719101124', '[{\"user_username\":\"jimmy\",\"old_asset_value\":484.208576066,\"new_asset_value\":482.18610415589},{\"user_username\":\"reserves\",\"old_asset_value\":1612.9825873694,\"new_asset_value\":1615.0050592795}]', '2022-09-10 23:26:39', NULL),
('1405004EE5CB3', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"188640BA1D4C2\"', 'escrow_asset_lock', 'keith', 'escrow', 'USDT', '164.38802083333', '[{\"user_username\":\"keith\",\"old_asset_value\":267.68756998881,\"new_asset_value\":103.29954915548},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":164.38802083333}]', '2022-09-10 23:26:15', '2022-09-10 23:26:17'),
('14097489FCF53', NULL, 'TEST_SESSION', 'Platform charge for transaction \"123398DE6B926\"', 'platform_charge', 'guddaz', 'reserves', 'USDT', '1.063829787234', '[{\"user_username\":\"guddaz\",\"old_asset_value\":211.3940999466,\"new_asset_value\":210.33027015937},{\"user_username\":\"reserves\",\"old_asset_value\":1590,\"new_asset_value\":1591.0638297872}]', '2022-09-10 23:25:34', NULL),
('143073CF0AFEE', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"14837865B6EC4\"', 'escrow_asset_lock', 'lodza', 'escrow', 'USDT', '106.31578947368', '[{\"user_username\":\"lodza\",\"old_asset_value\":1074.62579,\"new_asset_value\":968.31000052632},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":106.31578947368}]', '2022-09-10 23:25:36', '2022-09-10 23:25:38'),
('1457882BC5CEE', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"1186403F67447\"', 'escrow_asset_lock', 'lodza', 'escrow', 'USDT', '150.42553191489', '[{\"user_username\":\"lodza\",\"old_asset_value\":968.31000052631,\"new_asset_value\":817.88446861142},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":150.42553191489}]', '2022-09-10 23:25:43', '2022-09-10 23:25:45'),
('146555D8F7E44', NULL, 'TEST_SESSION', 'Platform charge for transaction \"162898C471F3E\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.6315789473684', '[{\"user_username\":\"jimmy\",\"old_asset_value\":689.08734602461,\"new_asset_value\":686.45576707724},{\"user_username\":\"reserves\",\"old_asset_value\":1610.351008422,\"new_asset_value\":1612.9825873694}]', '2022-09-10 23:26:32', NULL),
('1472892AABBDB', NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"154549EC96131\"', 'deposit_token_topup', 'reserves', 'keith', 'USDT', '600', '[{\"user_username\":\"reserves\",\"old_asset_value\":2890,\"new_asset_value\":2290},{\"user_username\":\"keith\",\"old_asset_value\":0,\"new_asset_value\":600}]', '2022-09-10 23:25:18', NULL),
('1484237B4EA38', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli Reserves Wallet.', 'internalisation', NULL, 'reserves', 'USDT', '3000', '[{\"user_username\":\"reserves\",\"old_asset_value\":0,\"new_asset_value\":3000}]', '2022-09-10 23:25:08', NULL),
('148452DFF4DD0', NULL, 'TEST_SESSION', 'Platform charge for transaction \"11543065E61C6\"', 'platform_charge', 'keith', 'reserves', 'USDT', '1.6276041666667', '[{\"user_username\":\"keith\",\"old_asset_value\":104.92715332214,\"new_asset_value\":103.29954915547},{\"user_username\":\"reserves\",\"old_asset_value\":1606.8812989921,\"new_asset_value\":1608.5089031588}]', '2022-09-10 23:26:20', NULL),
('14892004C42AA', NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"124677150B4D9\"', 'deposit_token_topup', 'reserves', 'jimmy', 'USDT', '500', '[{\"user_username\":\"reserves\",\"old_asset_value\":2290,\"new_asset_value\":1790},{\"user_username\":\"jimmy\",\"old_asset_value\":0,\"new_asset_value\":500}]', '2022-09-10 23:25:19', NULL),
('1494268D1CC9F', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"145892D663C9F\"', 'escrow_asset_unlock', 'escrow', 'lodza', 'USDT', '644.68085106383', '[{\"user_username\":\"escrow\",\"old_asset_value\":644.68085106383,\"new_asset_value\":0},{\"user_username\":\"lodza\",\"old_asset_value\":173.20361754758,\"new_asset_value\":817.88446861141}]', '2022-09-10 23:25:51', '2022-09-10 23:25:51'),
('153714243B736', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"1431047100D34\"', 'escrow_asset_unlock', 'escrow', 'keith', 'USDT', '268.6170212766', '[{\"user_username\":\"escrow\",\"old_asset_value\":268.6170212766,\"new_asset_value\":0},{\"user_username\":\"keith\",\"old_asset_value\":267.68756998881,\"new_asset_value\":536.30459126541}]', '2022-09-10 23:26:10', '2022-09-10 23:26:10'),
('154717C8D6DEC', NULL, 'TEST_SESSION', 'Platform charge for transaction \"109291AD1C274\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.6595744680851', '[{\"user_username\":\"keith\",\"old_asset_value\":270.3471444569,\"new_asset_value\":267.68756998881},{\"user_username\":\"reserves\",\"old_asset_value\":1604.221724524,\"new_asset_value\":1606.8812989921}]', '2022-09-10 23:26:13', NULL),
('154787A34AC04', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"123840146D8A8\"', 'escrow_asset_lock', 'jimmy', 'escrow', 'USDT', '186.05263157895', '[{\"user_username\":\"jimmy\",\"old_asset_value\":1138.2978723404,\"new_asset_value\":952.24524076145},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":186.05263157895}]', '2022-09-10 23:26:22', '2022-09-10 23:26:23'),
('15622445DCCD2', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"1186403F67447\"', 'escrow_asset_unlock', 'escrow', 'lodza', 'USDT', '150.42553191489', '[{\"user_username\":\"escrow\",\"old_asset_value\":150.42553191489,\"new_asset_value\":0},{\"user_username\":\"lodza\",\"old_asset_value\":817.88446861142,\"new_asset_value\":968.31000052631}]', '2022-09-10 23:25:45', '2022-09-10 23:25:45'),
('157743FF683CA', NULL, 'TEST_SESSION', 'Asset release for trade \"145892D663C9F\"', 'trade_asset_release', 'lodza', 'jimmy', 'USDT', '638.29787234043', '[{\"user_username\":\"lodza\",\"old_asset_value\":817.88446861141,\"new_asset_value\":179.58659627098},{\"user_username\":\"jimmy\",\"old_asset_value\":500,\"new_asset_value\":1138.2978723404}]', '2022-09-10 23:25:52', NULL),
('162898C471F3E', NULL, 'TEST_SESSION', 'Asset release for trade \"158043048EED8\"', 'trade_asset_release', 'jimmy', 'raymond', 'USDT', '263.15789473684', '[{\"user_username\":\"jimmy\",\"old_asset_value\":952.24524076145,\"new_asset_value\":689.08734602461},{\"user_username\":\"raymond\",\"old_asset_value\":105.26315789474,\"new_asset_value\":368.42105263158}]', '2022-09-10 23:26:31', NULL),
('163633DE3E7B1', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"136199905D397\"', 'escrow_asset_unlock', 'escrow', 'jimmy', 'USDT', '204.26966292135', '[{\"user_username\":\"escrow\",\"old_asset_value\":204.26966292135,\"new_asset_value\":0},{\"user_username\":\"jimmy\",\"old_asset_value\":482.18610415589,\"new_asset_value\":686.45576707724}]', '2022-09-10 23:26:36', '2022-09-10 23:26:36'),
('1650618879BD4', NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"1031770F3F073\"', 'deposit_token_topup', 'reserves', 'ross', 'USDT', '110', '[{\"user_username\":\"reserves\",\"old_asset_value\":3000,\"new_asset_value\":2890},{\"user_username\":\"ross\",\"old_asset_value\":0,\"new_asset_value\":110}]', '2022-09-10 23:25:16', NULL),
('167255818F5D7', NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"137414588EF84\"', 'deposit_token_topup', 'reserves', 'clarence', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_asset_value\":1790,\"new_asset_value\":1690},{\"user_username\":\"clarence\",\"old_asset_value\":0,\"new_asset_value\":100}]', '2022-09-10 23:25:21', NULL),
('16735135B066A', NULL, 'TEST_SESSION', 'Asset release for trade \"136199905D397\"', 'trade_asset_release', 'jimmy', 'nassim', 'USDT', '202.24719101124', '[{\"user_username\":\"jimmy\",\"old_asset_value\":686.45576707724,\"new_asset_value\":484.208576066},{\"user_username\":\"nassim\",\"old_asset_value\":100,\"new_asset_value\":302.24719101124}]', '2022-09-10 23:26:38', NULL),
('16813700D17F2', NULL, 'TEST_SESSION', 'Asset release for trade \"165474C5BAFA5\"', 'trade_asset_release', 'flint', 'peter', 'USDT', '205.88235294118', '[{\"user_username\":\"flint\",\"old_asset_value\":347.86679964539,\"new_asset_value\":141.98444670421},{\"user_username\":\"peter\",\"old_asset_value\":265.95744680851,\"new_asset_value\":471.83979974969}]', '2022-09-10 23:26:51', NULL),
('168619EF8C49D', NULL, 'TEST_SESSION', 'Asset release for trade \"14837865B6EC4\"', 'trade_asset_release', 'lodza', 'raymond', 'USDT', '105.26315789474', '[{\"user_username\":\"lodza\",\"old_asset_value\":1074.62579,\"new_asset_value\":969.36263210526},{\"user_username\":\"raymond\",\"old_asset_value\":0,\"new_asset_value\":105.26315789474}]', '2022-09-10 23:25:39', NULL),
('17165583C815B', NULL, 'TEST_SESSION', 'Asset release for trade \"122235A5C0C77\"', 'trade_asset_release', 'keith', 'lodza', 'USDT', '210.52631578947', '[{\"user_username\":\"keith\",\"old_asset_value\":748.93617021277,\"new_asset_value\":538.4098544233},{\"user_username\":\"lodza\",\"old_asset_value\":173.20361754758,\"new_asset_value\":383.72993333705}]', '2022-09-10 23:26:05', NULL),
('173298862AC1F', NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"175549C4C4E9B\"', 'deposit_token_topup', 'reserves', 'nassim', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_asset_value\":1690,\"new_asset_value\":1590},{\"user_username\":\"nassim\",\"old_asset_value\":0,\"new_asset_value\":100}]', '2022-09-10 23:25:23', NULL),
('175029E9A6D31', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"123840146D8A8\"', 'escrow_asset_unlock', 'escrow', 'jimmy', 'USDT', '186.05263157895', '[{\"user_username\":\"escrow\",\"old_asset_value\":186.05263157895,\"new_asset_value\":0},{\"user_username\":\"jimmy\",\"old_asset_value\":952.24524076145,\"new_asset_value\":1138.2978723404}]', '2022-09-10 23:26:23', '2022-09-10 23:26:23'),
('175045FCEB146', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'flint', 'USDT', '400', '[{\"user_username\":\"flint\",\"old_asset_value\":0,\"new_asset_value\":400}]', '2022-09-10 23:25:12', NULL),
('177745A8938EF', NULL, 'TEST_SESSION', 'Platform charge for transaction \"157743FF683CA\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '6.3829787234043', '[{\"user_username\":\"lodza\",\"old_asset_value\":179.58659627098,\"new_asset_value\":173.20361754758},{\"user_username\":\"reserves\",\"old_asset_value\":1593.6058230682,\"new_asset_value\":1599.9888017916}]', '2022-09-10 23:25:53', NULL),
('1818203F0E786', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"158043048EED8\"', 'escrow_asset_lock', 'jimmy', 'escrow', 'USDT', '265.78947368421', '[{\"user_username\":\"jimmy\",\"old_asset_value\":952.24524076145,\"new_asset_value\":686.45576707724},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":265.78947368421}]', '2022-09-10 23:26:28', '2022-09-10 23:26:30'),
('185852C5CB03E', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"14837865B6EC4\"', 'escrow_asset_unlock', 'escrow', 'lodza', 'USDT', '106.31578947368', '[{\"user_username\":\"escrow\",\"old_asset_value\":106.31578947368,\"new_asset_value\":0},{\"user_username\":\"lodza\",\"old_asset_value\":968.31000052632,\"new_asset_value\":1074.62579}]', '2022-09-10 23:25:38', '2022-09-10 23:25:38'),
('190506B3A8249', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"1431047100D34\"', 'escrow_asset_lock', 'keith', 'escrow', 'USDT', '268.6170212766', '[{\"user_username\":\"keith\",\"old_asset_value\":536.30459126541,\"new_asset_value\":267.68756998881},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":268.6170212766}]', '2022-09-10 23:26:08', '2022-09-10 23:26:10'),
('19265139A2786', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"165474C5BAFA5\"', 'escrow_asset_unlock', 'escrow', 'flint', 'USDT', '207.94117647059', '[{\"user_username\":\"escrow\",\"old_asset_value\":207.94117647059,\"new_asset_value\":0},{\"user_username\":\"flint\",\"old_asset_value\":139.9256231748,\"new_asset_value\":347.86679964539}]', '2022-09-10 23:26:49', '2022-09-10 23:26:49'),
('192695283403D', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"1430769DA99F8\"', 'escrow_asset_lock', 'flint', 'escrow', 'USDT', '214.89361702128', '[{\"user_username\":\"flint\",\"old_asset_value\":562.76041666667,\"new_asset_value\":347.86679964539},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":214.89361702128}]', '2022-09-10 23:26:41', '2022-09-10 23:26:43'),
('194119671352A', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"1760821ED9C2C\"', 'escrow_asset_unlock', 'escrow', 'ross', 'USDT', '214.89361702128', '[{\"user_username\":\"escrow\",\"old_asset_value\":214.89361702128,\"new_asset_value\":0},{\"user_username\":\"ross\",\"old_asset_value\":1.4893617021234,\"new_asset_value\":216.3829787234}]', '2022-09-10 23:25:57', '2022-09-10 23:25:57'),
('1977006622187', NULL, 'TEST_SESSION', 'Asset release for trade \"123840146D8A8\"', 'trade_asset_release', 'jimmy', 'lodza', 'USDT', '184.21052631579', '[{\"user_username\":\"jimmy\",\"old_asset_value\":1138.2978723404,\"new_asset_value\":954.08734602461},{\"user_username\":\"lodza\",\"old_asset_value\":383.72993333705,\"new_asset_value\":567.94045965284}]', '2022-09-10 23:26:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__users`
--

CREATE TABLE `__users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blockchain_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_token` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_image_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `_status` enum('active','inactive','suspended','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__users`
--

INSERT INTO `__users` (`id`, `blockchain_id`, `username`, `email_address`, `password`, `reg_token`, `avatar_image_id`, `_status`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
(1, NULL, 'system', 'system', '', NULL, NULL, 'active', '2022-09-11 01:24:49', NULL, NULL),
(2, NULL, 'escrow', 'escrow', '', NULL, NULL, 'active', '2022-09-11 01:24:49', NULL, NULL),
(3, NULL, 'developer', 'developer.ankelli@gmail.com', '$2y$10$wlyTFLGYD.bAt50F7mXWE.yeTa0RB4XAgGr.1Vt8KFSXjgNZosJm2', NULL, NULL, 'active', '2022-09-10 23:24:53', '2022-09-10 23:24:53', NULL),
(4, NULL, 'sysadmin', 'sysadmin@ankelli.com', '$2y$10$fBH33l4fsfs91QlltLpDPer6rFK9tDta.Gm4NAnr5NoOK8g/HpkkW', NULL, NULL, 'active', '2022-09-10 23:24:54', '2022-09-10 23:24:54', NULL),
(5, NULL, 'reserves', 'reserves@ankelli.com', '$2y$10$53nA8fGh2tzJ1LNLpUd2pevVJW4MPJ.dd9WTfr/RC11ArO19Vx7JC', NULL, NULL, 'active', '2022-09-10 23:24:55', '2022-09-10 23:24:55', NULL),
(6, NULL, 'busadmin', 'busadmin@ankelli.com', '$2y$10$cLGBycP5WyqIjuol0lGOSe2Hr1ZkuyIYMqDYAVxSOTXLaSc8l9XKO', NULL, NULL, 'active', '2022-09-10 23:24:56', '2022-09-10 23:24:56', NULL),
(7, NULL, 'guddaz', 'goodhopedhliwayo@gmail.com', '$2y$10$dDYGMf5/nHO3nJEQZOJuLOL7yIKvzn8LJ1HSLC59qhrdzMvNl./6G', NULL, NULL, 'active', '2022-09-10 23:25:00', '2022-09-10 23:25:00', NULL),
(8, NULL, 'lodza', 'lodza@example.com', '$2y$10$z6lmr1Q4QL2hQRhF0Mu7te8FMC2i554FyRhOANU/mR3lXyFxKJMs6', NULL, NULL, 'active', '2022-09-10 23:25:01', '2022-09-10 23:25:01', NULL),
(9, NULL, 'ross', 'ross@example.com', '$2y$10$F45QA/Wm5Rz4XYqBxgeZzetKBSNvkVHaQ4wqbkbOC4vc2uj82OHca', NULL, NULL, 'active', '2022-09-10 23:25:02', '2022-09-10 23:25:02', NULL),
(10, NULL, 'jimmy', 'jimmy@example.com', '$2y$10$Z/wZqwAvAWNRNDzk/VfIAOI7FpovHbg0W.tVZinfFPZyraUy5xHjK', NULL, NULL, 'active', '2022-09-10 23:25:03', '2022-09-10 23:25:03', NULL),
(11, NULL, 'keith', 'keith@example.com', '$2y$10$l2350BW.NazWCohdNICy6eY/n1fncdwmf95VHtcSw/FoAukb32flm', NULL, NULL, 'active', '2022-09-10 23:25:04', '2022-09-10 23:25:04', NULL),
(12, NULL, 'peter', 'peter@example.com', '$2y$10$vbI3N//JhbtavoGkuWoTbOC/32SPAiqz03PoEIvMfH0WuQsdWYIhW', NULL, NULL, 'active', '2022-09-10 23:25:04', '2022-09-10 23:25:04', NULL),
(13, NULL, 'flint', 'flint@example.com', '$2y$10$r28HqWOre8XdhKP2lE25CeeN406fRUoKDDePp7Mi6dIA2GxEfNzIS', NULL, NULL, 'active', '2022-09-10 23:25:05', '2022-09-10 23:25:05', NULL),
(14, NULL, 'clarence', 'clarence@example.com', '$2y$10$M0XOPmcssfce.QMtLXqu8OVvWJ33rI7S3WAAoIfERt/5CiuuOOst2', NULL, NULL, 'active', '2022-09-10 23:25:06', '2022-09-10 23:25:06', NULL),
(15, NULL, 'raymond', 'raymond@example.com', '$2y$10$BbqUEXnCEX0/11s/0prQte18w.QCLwzMrUSX3Qdjx42KA2Db/A.fy', NULL, NULL, 'active', '2022-09-10 23:25:06', '2022-09-10 23:25:06', NULL),
(16, NULL, 'nassim', 'nassim@example.com', '$2y$10$SYJ8BWGcofHvZ3C1lFIYLej2DpR/fSBouiIIkucy8io3VVCMwV3BG', NULL, NULL, 'active', '2022-09-10 23:25:07', '2022-09-10 23:25:07', NULL);

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
(1, 'Default Users', 'default_users', 'Group for Default User accounts created on system initialization and factory_data loading. \nNew users cannot be added to this group.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(2, 'Administrators', 'administrators', 'Automatically joined group (Users with active Admin Extension). \nMembers can be added to other admin groups.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(3, 'Developers', 'developers', 'Admin group for unrestricted system users. \nMembers have access to all features and OTP access to account named \"developer\". \nOnly \"developer\" account can add members to this group.\nGroup used for System Development and Maintenance.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(4, 'System Administrators', 'system_administrators', 'Admin Group for System Administrators. \nMembers can manage system functions and sysconfig params. \nMembers have OTP access to account named \"sysadmin\".\nOnly \"sysadmin\" account can add members to this group.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(5, 'Business Administrators', 'business_administrators', 'Admin group for Business Administrators.\nMembers have access to business related features.\nMembers have OTP access to accounts named \"reserves\" and \"busadmin\".\nOnly \"busadmin\" account can add members to this group.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(6, 'User Administrators', 'user_administrators', 'Admin group for User Administrators. \nMembers can manage other users and user related queries.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(7, 'Platform moderators', 'platform_moderators', 'Group for Platform moderators. \nMembers can respond in the customer service chat module, handle flagged business elements, manage daily updates.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(8, 'Sellers', 'sellers', 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(9, 'Buyers', 'buyers', 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL),
(10, 'Beta Testers', 'beta_testers', 'User Group for selected individuals to test certain features before they are published.', 'active', 'system', '2022-09-11 01:24:51', NULL, NULL);

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
(1, 'developer', 'default_users', 'active', 'system', '2022-09-10 23:24:54', '2022-09-10 23:24:54'),
(2, 'developer', 'developers', 'active', 'system', '2022-09-10 23:24:54', '2022-09-10 23:24:54'),
(3, 'sysadmin', 'default_users', 'active', 'system', '2022-09-10 23:24:54', '2022-09-10 23:24:54'),
(4, 'sysadmin', 'system_administrators', 'active', 'system', '2022-09-10 23:24:55', '2022-09-10 23:24:55'),
(5, 'reserves', 'default_users', 'active', 'system', '2022-09-10 23:24:55', '2022-09-10 23:24:55'),
(6, 'reserves', 'business_administrators', 'active', 'system', '2022-09-10 23:24:56', '2022-09-10 23:24:56'),
(7, 'busadmin', 'default_users', 'active', 'system', '2022-09-10 23:24:56', '2022-09-10 23:24:56'),
(8, 'busadmin', 'business_administrators', 'active', 'system', '2022-09-10 23:24:57', '2022-09-10 23:24:57'),
(9, 'guddaz', 'developers', 'active', 'system', '2022-09-10 23:25:01', '2022-09-10 23:25:01'),
(10, 'lodza', 'system_administrators', 'active', 'system', '2022-09-10 23:25:02', '2022-09-10 23:25:02'),
(11, 'lodza', 'user_administrators', 'active', 'system', '2022-09-10 23:25:02', '2022-09-10 23:25:02'),
(12, 'lodza', 'business_administrators', 'active', 'system', '2022-09-10 23:25:02', '2022-09-10 23:25:02');

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
-- Indexes for table `__asset_wallets`
--
ALTER TABLE `__asset_wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `__asset_wallets_user_username_asset_code_unique` (`user_username`,`asset_code`),
  ADD KEY `__asset_wallets_asset_code_foreign` (`asset_code`);

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
  ADD UNIQUE KEY `__permission_instances_parent_table_uid_permission_slug_unique` (`parent_table`,`parent_uid`,`permission_slug`),
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
  ADD KEY `__trades_escrow_lock_transaction_ref_code_foreign` (`escrow_lock_transaction_ref_code`),
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=521;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  ADD CONSTRAINT `__trades_escrow_lock_transaction_ref_code_foreign` FOREIGN KEY (`escrow_lock_transaction_ref_code`) REFERENCES `__transactions` (`ref_code`) ON DELETE SET NULL ON UPDATE CASCADE,
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
