-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 10, 2022 at 07:08 AM
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
(281, '2014_10_12_000000_create_users_table', 1),
(282, '2014_10_12_100000_create_password_resets_table', 1),
(283, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(284, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(285, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(286, '2016_06_01_000004_create_oauth_clients_table', 1),
(287, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(288, '2019_08_19_000000_create_failed_jobs_table', 1),
(289, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(290, '2022_07_26_072130_create___sessions_table', 1),
(291, '2022_07_26_072137_create___email_addresses_table', 1),
(292, '2022_07_26_072141_create___pref_items_table', 1),
(293, '2022_07_26_072144_create___notifications_table', 1),
(294, '2022_07_26_072147_create___verif_tokens_table', 1),
(295, '2022_07_26_072151_create___reg_tokens_table', 1),
(296, '2022_07_26_072323_create___phone_nos_table', 1),
(297, '2022_07_26_072326_create___files_table', 1),
(298, '2022_07_26_072330_create___logs_table', 1),
(299, '2022_07_26_072334_create___messages_table', 1),
(300, '2022_07_26_072335_create___assets_table', 1),
(301, '2022_07_26_072336_create___currencies_table', 1),
(302, '2022_07_26_072337_create___pymt_methods_table', 1),
(303, '2022_07_26_072341_create___exportables_table', 1),
(304, '2022_07_26_072345_create___countries_table', 1),
(305, '2022_07_26_072349_create___user_groups_table', 1),
(306, '2022_07_26_072353_create___user_group_memberships_table', 1),
(307, '2022_07_26_072356_create___permissions_table', 1),
(308, '2022_07_26_072400_create___permission_instances_table', 1),
(309, '2022_07_26_072403_create___asset_wallets_table', 1),
(310, '2022_07_26_072406_create___chats_table', 1),
(311, '2022_07_26_072410_create___deposit_tokens_table', 1),
(312, '2022_07_26_072413_create___feedback_reports_table', 1),
(313, '2022_07_26_072416_create___offers_table', 1),
(314, '2022_07_26_072421_create___pinnings_table', 1),
(315, '2022_07_26_072424_create___posts_table', 1),
(316, '2022_07_26_072427_create___transactions_table', 1),
(317, '2022_07_26_072428_create___trades_table', 1),
(318, '2022_07_26_072435_create___admin_extensions_table', 1),
(319, '2022_07_26_072438_create___buyer_extensions_table', 1),
(320, '2022_07_26_072442_create___seller_extensions_table', 1);

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
(1, NULL, 'Ankelli Personal Access Client', 'CYrBjL5FGV5Kcmh6j8r2ZoPBmEgFwV9bCg0QANpr', NULL, 'http://localhost', 1, 0, 0, '2022-09-10 03:06:14', '2022-09-10 03:06:14'),
(2, NULL, 'Ankelli Password Grant Client', 'UPAVxf0yJ6thCf8ezS2XV6tRmasRMdb7eEI5fR95', 'users', 'http://localhost', 0, 1, 0, '2022-09-10 03:06:14', '2022-09-10 03:06:14');

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
(1, 1, '2022-09-10 03:06:14', '2022-09-10 03:06:14');

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
(1, 'system', 'System', 'active', 'system', '2022-09-10 05:06:10', NULL, NULL),
(2, 'developer', 'Default Developer', 'active', 'system', '2022-09-10 03:06:11', '2022-09-10 03:06:11', NULL),
(3, 'sysadmin', 'Default System Administrator', 'active', 'system', '2022-09-10 03:06:11', '2022-09-10 03:06:11', NULL),
(4, 'reserves', 'Ankelli Asset Reserves', 'active', 'system', '2022-09-10 03:06:12', '2022-09-10 03:06:12', NULL),
(5, 'busadmin', 'Default Business Administrator', 'active', 'system', '2022-09-10 03:06:13', '2022-09-10 03:06:13', NULL),
(6, 'guddaz', 'Head System Developer', 'active', 'system', '2022-09-10 03:06:46', '2022-09-10 03:06:46', NULL),
(7, 'lodza', 'Head Business Administrator', 'active', 'system', '2022-09-10 03:06:46', '2022-09-10 03:06:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__assets`
--

CREATE TABLE `__assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `__assets` (`id`, `name`, `code`, `smallest_display_unit`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`) VALUES
(1, 'Tether USD', 'USDT', '0.0001', 'active', 'system', '2022-09-10 05:06:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__asset_wallets`
--

CREATE TABLE `__asset_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `__asset_wallets` (`id`, `user_username`, `asset_code`, `asset_value`, `_status`, `created_datetime`, `updated_datetime`) VALUES
(1, 'reserves', 'USDT', '1619.1915423834', 'active', '2022-09-10 03:06:52', '2022-09-10 03:08:30'),
(2, 'guddaz', 'USDT', '423.09622760618', 'active', '2022-09-10 03:06:53', '2022-09-10 03:08:23'),
(3, 'lodza', 'USDT', '567.94045965284', 'active', '2022-09-10 03:06:54', '2022-09-10 03:08:04'),
(4, 'flint', 'USDT', '139.9256231748', 'active', '2022-09-10 03:06:56', '2022-09-10 03:08:30'),
(5, 'ross', 'USDT', '1.4893617021219', 'active', '2022-09-10 03:06:59', '2022-09-10 03:07:41'),
(6, 'keith', 'USDT', '103.29954915547', 'active', '2022-09-10 03:07:01', '2022-09-10 03:07:59'),
(7, 'jimmy', 'USDT', '482.18610415589', 'active', '2022-09-10 03:07:03', '2022-09-10 03:08:18'),
(8, 'clarence', 'USDT', '312.76595744681', 'active', '2022-09-10 03:07:04', '2022-09-10 03:07:39'),
(9, 'nassim', 'USDT', '302.24719101124', 'active', '2022-09-10 03:07:06', '2022-09-10 03:08:16'),
(10, 'escrow', 'USDT', '0', 'active', '2022-09-10 03:07:08', '2022-09-10 03:08:27'),
(11, 'raymond', 'USDT', '368.42105263158', 'active', '2022-09-10 03:07:21', '2022-09-10 03:08:10'),
(12, 'peter', 'USDT', '471.83979974969', 'active', '2022-09-10 03:07:52', '2022-09-10 03:08:29');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-10 03:06:11', '2022-09-10 03:06:11', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-10 03:06:12', '2022-09-10 03:06:12', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-10 03:06:13', '2022-09-10 03:06:13', NULL),
(4, 'ross', 'active', 'guddaz', '2022-09-10 03:07:07', '2022-09-10 03:07:07', NULL),
(5, 'raymond', 'active', 'lodza', '2022-09-10 03:07:18', '2022-09-10 03:07:18', NULL),
(6, 'keith', 'active', 'lodza', '2022-09-10 03:07:24', '2022-09-10 03:07:24', NULL),
(7, 'jimmy', 'active', 'lodza', '2022-09-10 03:07:30', '2022-09-10 03:07:30', NULL),
(8, 'clarence', 'active', 'ross', '2022-09-10 03:07:36', '2022-09-10 03:07:36', NULL),
(9, 'lodza', 'active', 'keith', '2022-09-10 03:07:42', '2022-09-10 03:07:42', NULL),
(10, 'peter', 'active', 'keith', '2022-09-10 03:07:48', '2022-09-10 03:07:48', NULL),
(11, 'flint', 'active', 'keith', '2022-09-10 03:07:55', '2022-09-10 03:07:55', NULL),
(12, 'nassim', 'active', 'jimmy', '2022-09-10 03:08:13', '2022-09-10 03:08:13', NULL),
(13, 'guddaz', 'active', 'flint', '2022-09-10 03:08:19', '2022-09-10 03:08:19', NULL);

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
(1, 'Zimbabwe', 'ZIM', NULL, NULL, NULL, 'active', 'system', '2022-09-10 05:06:07', NULL),
(2, 'South Africa', 'RSA', NULL, NULL, NULL, 'active', 'system', '2022-09-10 05:06:07', NULL),
(3, 'United Kingdom', 'UK', NULL, NULL, NULL, 'active', 'system', '2022-09-10 05:06:07', NULL),
(4, 'United States of America', 'USA', NULL, NULL, NULL, 'active', 'system', '2022-09-10 05:06:07', NULL),
(5, 'Russia', 'RUS', NULL, NULL, NULL, 'active', 'system', '2022-09-10 05:06:07', NULL),
(6, 'China', 'CHN', NULL, NULL, NULL, 'active', 'system', '2022-09-10 05:06:07', NULL),
(7, 'Ghana', 'GHA', NULL, NULL, NULL, 'active', 'system', '2022-09-10 05:06:07', NULL),
(8, 'Botswana', 'BOT', NULL, NULL, NULL, 'active', 'system', '2022-09-10 05:06:07', NULL),
(9, 'Zambia', 'ZAM', NULL, NULL, NULL, 'active', 'system', '2022-09-10 05:06:07', NULL),
(10, 'Algeria', 'ALG', NULL, NULL, NULL, 'active', 'system', '2022-09-10 05:06:07', NULL),
(11, 'Italy', 'ITA', NULL, NULL, NULL, 'active', 'system', '2022-09-10 05:06:07', NULL),
(12, 'Nigeria', 'NIG', NULL, NULL, NULL, 'active', 'system', '2022-09-10 05:06:07', NULL);

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
(1, 'US Dollar', 'USD', '$', 1, '1', '10', '5', 'active', 'system', '2022-09-10 05:06:07', NULL),
(2, 'Euro', 'EUR', '€', 1, '0.87', '10', '5', 'active', 'system', '2022-09-10 05:06:07', NULL),
(3, 'Pound Sterling', 'GBP', '£', 1, '0.77', '10', '5', 'active', 'system', '2022-09-10 05:06:07', NULL),
(4, 'South African Rand', 'ZAR', 'R', 0, '16', '100', '100', 'active', 'system', '2022-09-10 05:06:07', NULL),
(5, 'Zambian Kwacha', 'ZMW', 'K', 0, '15', '100', '100', 'active', 'system', '2022-09-10 05:06:07', NULL),
(6, 'Algerian Dinar', 'DZD', 'DA', 0, '180', '100', '100', 'active', 'system', '2022-09-10 05:06:07', NULL),
(7, 'Zimbabwean Dollar', 'ZWL', '$', 1, '10000', '500', '5000', 'active', 'system', '2022-09-10 05:06:07', NULL);

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
('112677327A9EE', 'USDT', '110', 'USD', 111, 'lodza', '2022-09-10 03:06:59', 'ross', '2022-09-10 03:06:59'),
('1289760D4AC69', 'USDT', '500', 'USD', 501, 'lodza', '2022-09-10 03:07:02', 'jimmy', '2022-09-10 03:07:02'),
('167974E7E72B0', 'USDT', '100', 'EUR', 93, 'lodza', '2022-09-10 03:07:04', 'clarence', '2022-09-10 03:07:04'),
('1794831FBC189', 'USDT', '600', 'USD', 601, 'lodza', '2022-09-10 03:07:01', 'keith', '2022-09-10 03:07:01'),
('186122D14F6F7', 'USDT', '100', 'DZD', 18000, 'lodza', '2022-09-10 03:07:06', 'nassim', '2022-09-10 03:07:06');

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
(1, 'developer.ankelli@gmail.com', 'developer', '2022-09-10 03:06:10', NULL),
(2, 'sysadmin@ankelli.com', 'sysadmin', '2022-09-10 03:06:11', NULL),
(3, 'reserves@ankelli.com', 'reserves', '2022-09-10 03:06:12', NULL),
(4, 'busadmin@ankelli.com', 'busadmin', '2022-09-10 03:06:13', NULL),
(5, 'goodhopedhliwayo@gmail.com', 'guddaz', '2022-09-10 03:06:45', NULL),
(6, 'lodza@example.com', 'lodza', '2022-09-10 03:06:46', NULL),
(7, 'ross@example.com', 'ross', '2022-09-10 03:06:47', NULL),
(8, 'jimmy@example.com', 'jimmy', '2022-09-10 03:06:48', NULL),
(9, 'keith@example.com', 'keith', '2022-09-10 03:06:49', NULL),
(10, 'peter@example.com', 'peter', '2022-09-10 03:06:49', NULL),
(11, 'flint@example.com', 'flint', '2022-09-10 03:06:50', NULL),
(12, 'clarence@example.com', 'clarence', '2022-09-10 03:06:50', NULL),
(13, 'raymond@example.com', 'raymond', '2022-09-10 03:06:51', NULL),
(14, 'nassim@example.com', 'nassim', '2022-09-10 03:06:51', NULL);

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
(1, '__pymt_methods', 'cash_in_person', 'images', 'pymt_method_icon', 'Cash in person', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Cash in person.jpg', 'image/jpg', NULL, 'Cash in person.jpg', NULL, 'system', '2022-09-10 03:06:07', NULL),
(2, '__pymt_methods', 'stanbic_bank', 'images', 'pymt_method_icon', 'Stanbic Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Stanbic bank.jpg', 'image/jpg', NULL, 'Stanbic Bank Icon.jpg', NULL, 'system', '2022-09-10 03:06:07', NULL),
(3, '__pymt_methods', 'fnb_bank', 'images', 'pymt_method_icon', 'FNB Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FNB bank.png', 'image/png', NULL, 'FNB Bank Icon.png', NULL, 'system', '2022-09-10 03:06:07', NULL),
(4, '__pymt_methods', 'mukuru', 'images', 'pymt_method_icon', 'Mukuru Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mukuru.jpg', 'image/jpg', NULL, 'Mukuru Icon.jpg', NULL, 'system', '2022-09-10 03:06:07', NULL),
(5, '__pymt_methods', 'algerie_poste', 'images', 'pymt_method_icon', 'Algerie poste Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Algerie poste.jpg', 'image/jpg', NULL, 'Algerie poste Icon.jpg', NULL, 'system', '2022-09-10 03:06:07', NULL),
(6, '__pymt_methods', 'mtn_momo', 'images', 'pymt_method_icon', 'MTN MOMO Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/MTN MOMO.png', 'image/png', NULL, 'MTN MOMO Icon.png', NULL, 'system', '2022-09-10 03:06:07', NULL),
(7, '__pymt_methods', 'ecocash', 'images', 'pymt_method_icon', 'Ecocash Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Ecocash.png', 'image/png', NULL, 'Ecocash Icon.png', NULL, 'system', '2022-09-10 03:06:07', NULL),
(8, '__pymt_methods', 'paypal', 'images', 'pymt_method_icon', 'Paypal Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Paypal.png', 'image/png', NULL, 'Paypal Icon.png', NULL, 'system', '2022-09-10 03:06:07', NULL),
(9, '__pymt_methods', 'skrill', 'images', 'pymt_method_icon', 'Skrill Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Skrill.jpg', 'image/jpg', NULL, 'Skrill Icon.jpg', NULL, 'system', '2022-09-10 03:06:07', NULL),
(10, '__pymt_methods', 'world_remit', 'images', 'pymt_method_icon', 'World Remit Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/World Remit.png', 'image/png', NULL, 'World Remit Icon.png', NULL, 'system', '2022-09-10 03:06:07', NULL),
(11, '__pymt_methods', 'mastercard', 'images', 'pymt_method_icon', 'Mastercard Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mastercard.jpeg', 'image/jpeg', NULL, 'Mastercard Icon.jpeg', NULL, 'system', '2022-09-10 03:06:07', NULL),
(12, '__pymt_methods', 'visa', 'images', 'pymt_method_icon', 'Visa Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Visa.jpg', 'image/jpg', NULL, 'Visa Icon.jpg', NULL, 'system', '2022-09-10 03:06:07', NULL),
(13, '__pymt_methods', 'fbc_bank', 'images', 'pymt_method_icon', 'FBC bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FBC bank.jpg', 'image/jpg', NULL, 'FBC bank Icon.jpg', NULL, 'system', '2022-09-10 03:06:07', NULL);

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
('08ig9NBwUITpuQe4', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-10 03:06:12', NULL, NULL, '__buyer_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('0buWSVBrfDne3e36', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 03:07:51', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":268.6170212766,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('0CrPy9AS98C6FqyD', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:08:15', NULL, NULL, '__trades', '134070CC6381A', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:08:15\"}]', '{\"ip\":\"127.0.0.1\"}'),
('1bc5Z69yAYJYQmAF', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:48', NULL, '186515137F658', '__notifications', '1438347A182D5', NULL, NULL),
('1hSzDbEnqg1fHu9V', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:53', NULL, NULL, '__messages', '11723471AA07D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('1KIcWjykFnahoThN', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:11', NULL, '142760C39CD41', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('1pvz0ud3MFwnc6wn', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:37', NULL, NULL, '__messages', '13761124902A4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('1SQZjJAEm5zOtfmu', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:27', NULL, NULL, '__messages', '1066177828BF5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('2AcyrTRqBLFWGkLu', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'ross', '2022-09-10 03:07:00', NULL, NULL, '__deposit_tokens', '112677327A9EE', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:06:59\"}]', '{\"ip\":\"127.0.0.1\"}'),
('2Hz3JSxtEfUYugYX', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'ross', '2022-09-10 03:07:38', NULL, NULL, '__trades', '170051B4D8683', NULL, '{\"ip\":\"127.0.0.1\"}'),
('2rzbA9mpqxkLZlFC', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'guddaz', '2022-09-10 03:07:09', NULL, NULL, '__trades', '132497AEC255D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('2znNQLFoWUuwEZWp', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 03:06:47', NULL, NULL, '__admin_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('30Ddpb6WTjKQHDP6', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:55', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":267.68756998881,\"new_value\":103.29954915548}]', '{\"ip\":\"127.0.0.1\"}'),
('36IZV7xPcR05KRfg', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:11', NULL, '142760C39CD41', '__users', 'sysadmin', NULL, NULL),
('3dYriN8uqfVANy7P', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 03:06:13', NULL, NULL, '__admin_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('3fFC3sYtMAo7QSJG', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:50', NULL, '1854651307151', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('3IidKtvmaJUmztgj', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 03:07:01', NULL, NULL, '__deposit_tokens', '1794831FBC189', NULL, '{\"ip\":\"127.0.0.1\"}'),
('3uUHQ8acfXxQw4DG', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:27', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":968.31000052631,\"new_value\":819.37383031354}]', '{\"ip\":\"127.0.0.1\"}'),
('44XdOhT4souLA3vF', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-10 03:08:07', NULL, NULL, '__offers', '1798533F2A30C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('46H55HMkMmTa3bQu', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 03:08:16', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":686.45576707724,\"new_value\":484.208576066}]', '{\"ip\":\"127.0.0.1\"}'),
('4AMlnTpczMw0t11l', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:55', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":164.38802083333}]', '{\"ip\":\"127.0.0.1\"}'),
('4Cea94phQnjsqHvN', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 03:08:29', NULL, NULL, '__asset_wallets', '12', '[{\"field_name\":\"asset_value\",\"old_value\":265.95744680851,\"new_value\":471.83979974969}]', '{\"ip\":\"127.0.0.1\"}'),
('4g6h1tuMbZMC3Isy', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 03:08:24', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":349.99445921986,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('4XMRIUoJnLutUpzG', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 03:07:58', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":400,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('59W9hPPgfuwjRcRk', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-10 03:08:19', NULL, NULL, '__offers', '1145621818521', NULL, '{\"ip\":\"127.0.0.1\"}'),
('5gvjZBMpXjVZ4Og7', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:02', NULL, NULL, '__messages', '137582C9F3EA7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('5qpfAoVU6MNXD45u', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:10', NULL, '120732338B6C7', '__users', 'developer', NULL, NULL),
('5T9klQsjgtKu9y7W', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 03:08:30', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1617.132718854,\"new_value\":1619.1915423834}]', '{\"ip\":\"127.0.0.1\"}'),
('5Wo7hZWGQfxCx0UZ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 03:08:10', NULL, NULL, '__asset_wallets', '11', '[{\"field_name\":\"asset_value\",\"old_value\":105.26315789474,\"new_value\":368.42105263158}]', '{\"ip\":\"127.0.0.1\"}'),
('6DzZmQoi4FcbL4kH', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:51', NULL, '196196542400A', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('6MTvivmcSnxuNPmz', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:26', NULL, NULL, '__messages', '1533864E86AE0', NULL, '{\"ip\":\"127.0.0.1\"}'),
('7dp9fS9pz7Nw7oDP', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 03:07:04', NULL, NULL, '__deposit_tokens', '167974E7E72B0', NULL, '{\"ip\":\"127.0.0.1\"}'),
('7jHa4m3ZlsWBXWd8', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 03:08:28', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":347.86679964539,\"new_value\":141.98444670421}]', '{\"ip\":\"127.0.0.1\"}'),
('7sW5Px8zYCHidwdD', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'keith', '2022-09-10 03:07:01', NULL, NULL, '__asset_wallets', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('7z2QhSmu8PwkFkZJ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 03:06:57', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":218.87587867,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('8436VyQCo29ovOda', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:27', NULL, NULL, '__messages', '15751651BB440', NULL, '{\"ip\":\"127.0.0.1\"}'),
('85Rzt1MPPtp8tM1b', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'flint', '2022-09-10 03:06:56', NULL, NULL, '__asset_wallets', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('8b8eL90gVghj78k4', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:50', NULL, '186157FE5D98D', '__users', 'clarence', NULL, NULL),
('8CNRLv7PmwAfZF43', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:21', NULL, NULL, '__messages', '1987396911DD1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('8pztE9y08ygNgipE', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:30', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":817.88446861141,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('8u9u5bY9WcqhOaJa', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 03:08:27', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":207.94117647059,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('8V6F0O8ZXTH2GG2d', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:51', NULL, '196196542400A', '__email_addresses', 'raymond@example.com', NULL, NULL),
('9iVyMnupLXCpARDR', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'clarence', '2022-09-10 03:07:36', NULL, NULL, '__offers', '1431532DF7E23', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9r6wvEN4r5JgTCwz', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 03:07:04', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1790,\"new_value\":1690}]', '{\"ip\":\"127.0.0.1\"}'),
('9reRiyX1BKsdiwKZ', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-10 03:07:44', NULL, NULL, '__trades', '14314789E5A65', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9uEB8Q5zmHIWUxVs', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 03:07:23', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":969.36263210526,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('9wTkuRRaVoyWDGCC', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 03:08:15', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":482.18610415589,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('9Wz2TIh5pjk2yh5e', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:57', NULL, NULL, '__messages', '1143686EBA765', NULL, '{\"ip\":\"127.0.0.1\"}'),
('A22wKGLn10G898gT', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-10 03:07:09', NULL, NULL, '__messages', '166078A1D611F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('A3HNHuBU76Zy97Nh', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 03:08:09', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":686.45576707724,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('A6xmThSUhp8GvHFk', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 03:06:53', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":218.87587867}]', '{\"ip\":\"127.0.0.1\"}'),
('a6y6oJMAooojp6Jy', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 03:07:36', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":214.89361702128}]', '{\"ip\":\"127.0.0.1\"}'),
('Ab3XmEzUeoHPdINY', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:46', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":748.93617021277,\"new_value\":538.4098544233}]', '{\"ip\":\"127.0.0.1\"}'),
('ac3bgQj4mWPkkAhq', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 03:08:30', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":141.98444670421,\"new_value\":139.9256231748}]', '{\"ip\":\"127.0.0.1\"}'),
('af8UpsSTHzSxjAks', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-10 03:07:18', NULL, NULL, '__offers', '11958074C70B7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('aKKikVy6nPNLimLo', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:08:09', NULL, NULL, '__trades', '163574E57720C', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:08:08\"}]', '{\"ip\":\"127.0.0.1\"}'),
('Ap34kqLBgI1YvOxk', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:47', NULL, '140380CAD8882', '__users', 'ross', NULL, NULL),
('aQfMfDagkM9cuiIK', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:07:35', NULL, NULL, '__trades', '106736EF8C832', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:32\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('aTqTlbOv2gT57Nnm', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'flint', '2022-09-10 03:07:55', NULL, NULL, '__offers', '17277175EE899', NULL, '{\"ip\":\"127.0.0.1\"}'),
('AWbLjKGRpJBWNOm9', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'clarence', '2022-09-10 03:07:41', NULL, NULL, '__trades', '170051B4D8683', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:38\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('Ay4izW00NiwSgSZ9', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 03:06:11', NULL, NULL, '__admin_extensions', 'developer', NULL, '{\"ip\":\"127.0.0.1\"}'),
('B3f7wCKJfPONUiU5', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:44', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":536.3045912654,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('b44QQMb9bH57DJ1u', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-10 03:07:17', NULL, NULL, '__trades', '132497AEC255D', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:14\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('b8zi85dffwSBnr2f', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-10 03:08:13', NULL, NULL, '__buyer_extensions', 'nassim', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ba3w5O5ruVD6NJ7s', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:50', NULL, NULL, '__messages', '176871C6DB506', NULL, '{\"ip\":\"127.0.0.1\"}'),
('bdfyVLkROx2ZoXzn', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:19', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":1074.62579,\"new_value\":968.31000052632}]', '{\"ip\":\"127.0.0.1\"}'),
('BHDJcBEqp79rkylH', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:29', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1592.1164613661,\"new_value\":1593.6058230682}]', '{\"ip\":\"127.0.0.1\"}'),
('BiTWU0rplX64lALM', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:09', NULL, NULL, '__messages', '13514258F4E11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('bjrCyTb8dYh4Io4q', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 03:06:47', NULL, NULL, '__user_group_memberships', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('bKw31W7PhKoGux3s', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:47', NULL, NULL, '__messages', '139753D5A17FC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('bluXZBiYnXQLk3EL', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:10', NULL, '120732338B6C7', '__email_addresses', 'developer.ankelli@gmail.com', NULL, NULL),
('BuFj0CCojOJHhYt8', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 03:07:39', NULL, NULL, '__asset_wallets', '8', '[{\"field_name\":\"asset_value\",\"old_value\":100,\"new_value\":312.76595744681}]', '{\"ip\":\"127.0.0.1\"}'),
('BuN9Ab7Uc1PeX9fh', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:12', NULL, '1096740BD3AFC', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('BZNLstDCl8jpOeiV', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:44', NULL, NULL, '__messages', '1348716AE15A4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('bZQOtzPYmZNeW9Ni', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'guddaz', '2022-09-10 03:06:53', NULL, NULL, '__asset_wallets', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('c7ScT5fbDWyzW9sl', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 03:08:19', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":214.89361702128}]', '{\"ip\":\"127.0.0.1\"}'),
('CcA6QVdn7O9fOKpe', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 03:08:24', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1615.0050592795,\"new_value\":1617.132718854}]', '{\"ip\":\"127.0.0.1\"}'),
('cE36HFXhu2DJfJ7E', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-10 03:07:14', NULL, NULL, '__messages', '142721361683B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Cg6bBC2VpY8WvnCd', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-10 03:06:13', NULL, NULL, '__buyer_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('CGLn2ZQF7XyAEFZH', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:30', NULL, NULL, '__messages', '144744D28709E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('cpRjAcAjmf6EXFff', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:47', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1602.1164613661,\"new_value\":1604.221724524}]', '{\"ip\":\"127.0.0.1\"}'),
('D0RGU8pyqfLW1zZk', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:08', NULL, NULL, '__messages', '11723386E394A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('d85La9tz3hc6o8Ya', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:07:03', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":2290,\"new_value\":1790}]', '{\"ip\":\"127.0.0.1\"}'),
('DaoevWroumMNlfMD', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 03:06:14', NULL, NULL, '__user_group_memberships', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('De1MUTngzTI0aZNl', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'peter', '2022-09-10 03:08:30', NULL, NULL, '__trades', '183183D242A84', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"peter\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:08:27\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('DEwV64YvzY75I5Ar', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-10 03:07:08', NULL, NULL, '__buyer_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dgDXv1I1iVmEXN17', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:46', NULL, '106532661845B', '__email_addresses', 'lodza@example.com', NULL, NULL),
('dGpjMzeNXfRqxJSk', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-10 03:08:01', NULL, NULL, '__offers', '1146386A514BD', NULL, '{\"ip\":\"127.0.0.1\"}'),
('DgSretN45nkhLYWI', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:49', NULL, '188961A5FFE0B', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('DLFBVVNdJyGCo3zs', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:56', NULL, NULL, '__messages', '113737445E620', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dMW8dCG1WxHXXI1o', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 03:06:13', NULL, NULL, '__user_group_memberships', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('DVLzxb14GbTrl61S', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:44', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":212.63157894737,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('DVrugdZe8Xt2qZ2e', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-10 03:06:12', NULL, NULL, '__buyer_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dx5sV0lABp3fmRFK', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'lodza', '2022-09-10 03:07:18', NULL, NULL, '__seller_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('e8rUizZ1klKJYEzS', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:01', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":2890,\"new_value\":2290}]', '{\"ip\":\"127.0.0.1\"}'),
('EBYFKjekJVsbBSVM', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:23', NULL, NULL, '__messages', '183236CBBB3F1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('eD5vTApMCt78ZBjr', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:07:03', NULL, NULL, '__deposit_tokens', '1289760D4AC69', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:02\"}]', '{\"ip\":\"127.0.0.1\"}'),
('EdGBAJr4qq31TZzR', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:49', NULL, '188961A5FFE0B', '__users', 'peter', NULL, NULL),
('EdgSIdbFcuEKoBYW', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:49', NULL, '188961A5FFE0B', '__notifications', '1472231A4DC25', NULL, NULL),
('egM1VT0JO0zLWD2N', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:11', NULL, '142760C39CD41', '__notifications', '1087238E4174C', NULL, NULL),
('EhuSDzvbXparc0ah', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-10 03:06:14', NULL, NULL, '__seller_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('EIr1xxnk97QnmszD', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'keith', '2022-09-10 03:07:42', NULL, NULL, '__seller_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Em7M4AyLrXutVC44', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:50', NULL, '1854651307151', '__email_addresses', 'flint@example.com', NULL, NULL),
('EOksQpusXbiCjcNm', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 03:08:22', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":562.76041666667,\"new_value\":349.99445921986}]', '{\"ip\":\"127.0.0.1\"}'),
('ETejvDSTUygNtZCh', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'keith', '2022-09-10 03:07:24', NULL, NULL, '__offers', '193020E3DD56C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('eteRRP5MPkM07IRY', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:07:32', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":173.20361754758,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('eXnoqfkieX4cztzc', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:08:07', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":952.24524076145,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('EXWwtyeU2FoTb2xW', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:08:04', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":383.72993333705,\"new_value\":567.94045965284}]', '{\"ip\":\"127.0.0.1\"}'),
('Ez7TohndrX3COcXC', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'clarence', '2022-09-10 03:07:05', NULL, NULL, '__deposit_tokens', '167974E7E72B0', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:04\"}]', '{\"ip\":\"127.0.0.1\"}'),
('F10dZkgSIqumesai', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:26', NULL, NULL, '__messages', '1561597028E4B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('f2zYneTzPdH2D8DW', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:25', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":150.42553191489}]', '{\"ip\":\"127.0.0.1\"}'),
('F7pGUXWn6aLzzBjk', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:38', NULL, NULL, '__messages', '1269741FC9835', NULL, '{\"ip\":\"127.0.0.1\"}'),
('FbDzjjcNyuNs55Lo', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 03:07:16', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":110,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('fBFlzPWz2MdudyUS', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:32', NULL, NULL, '__messages', '15344577B87C6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fCQKezBwASkl1P6f', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 03:07:41', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":3.61702127659,\"new_value\":1.4893617021219}]', '{\"ip\":\"127.0.0.1\"}'),
('ffiSKx94r7H0L00Y', 'TEST_SESSION', 'Addition of _RegToken entry to database.', 'entry_create', 'system', '2022-09-10 03:06:45', NULL, NULL, '__reg_tokens', '1234567890', NULL, '{\"ip\":\"127.0.0.1\"}'),
('FfrZVllpbtmBdlwO', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-10 03:07:07', NULL, NULL, '__seller_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fJc7mLwaPPNqdhfg', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'peter', '2022-09-10 03:07:54', NULL, NULL, '__trades', '145282104E344', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"peter\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:50\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('fjMTwXZS8L6n7Z32', 'FACTORY_SESSION', 'Temporarily disabling for factory users.', 'entry_update', 'system', '2022-09-10 03:06:10', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for factory users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('fM7bMmgrr4gftiwB', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:57', NULL, NULL, '__trades', '130026FB798D7', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:56\"}]', '{\"ip\":\"127.0.0.1\"}'),
('fo5oiz4EPgUWXAR6', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 03:07:15', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":317.77707867,\"new_value\":211.3940999466}]', '{\"ip\":\"127.0.0.1\"}'),
('FqZQ22mF3QN8UPDS', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:08:07', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":265.78947368421}]', '{\"ip\":\"127.0.0.1\"}'),
('fVn7E8c0yJKL90rF', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 03:06:13', NULL, NULL, '__user_group_memberships', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fwPcAhNkPnLs5hyd', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-10 03:07:50', NULL, NULL, '__trades', '145282104E344', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GBPBRn7FZiROWR1U', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 03:08:18', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1612.9825873694,\"new_value\":1615.0050592795}]', '{\"ip\":\"127.0.0.1\"}'),
('GCFNuQSF0fHyfGvs', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 03:07:21', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":1074.62579,\"new_value\":969.36263210526}]', '{\"ip\":\"127.0.0.1\"}'),
('GcFNW5QTxLw2vLHI', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'peter', '2022-09-10 03:08:25', NULL, NULL, '__offers', '13676078247DC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GG5OjyyV12htgx20', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 03:07:58', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":267.68756998881,\"new_value\":104.92715332214}]', '{\"ip\":\"127.0.0.1\"}'),
('GHabDU56qck4X2FU', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'nassim', '2022-09-10 03:07:06', NULL, NULL, '__asset_wallets', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GtqWNhcqVIg6ip7n', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:47', NULL, NULL, '__trades', '14314789E5A65', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:44\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('GxGYXnPc4Ue8WAAJ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 03:08:27', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":139.9256231748,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('GzG8YX2NBuxNTbOf', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:21', NULL, NULL, '__messages', '1983436DAEDFD', NULL, '{\"ip\":\"127.0.0.1\"}'),
('gZTgSURGquRMRd4G', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:50', NULL, '1854651307151', '__notifications', '165864B519610', NULL, NULL),
('h55L3LbiTJ1KbQZd', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 03:06:46', NULL, NULL, '__user_group_memberships', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hDajloeuVbQ06Vuu', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:24', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":968.31000052631,\"new_value\":817.88446861142}]', '{\"ip\":\"127.0.0.1\"}'),
('HGy9mZa2s7maW4Hw', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:44', NULL, NULL, '__messages', '171815E72BD59', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hHQwUfTdxBC98auo', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-10 03:07:12', NULL, NULL, '__messages', '173796F97BFDD', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HjUlSdcioWFB6Png', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:07:32', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":644.68085106383,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('HkbSoBeFe7QEqVlj', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:10', NULL, '120732338B6C7', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('HMmI3v7jOV4PkOKg', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:00', NULL, NULL, '__messages', '169036AAC2A4F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hN5MWVYDtQtfFemx', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 03:07:08', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":107.44680851064}]', '{\"ip\":\"127.0.0.1\"}'),
('hnO33ijI5QhZiFh9', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:14', NULL, NULL, '__messages', '111370AAB0455', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hns0CjKjxYIDOrTU', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:08:04', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":1138.2978723404,\"new_value\":954.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('hsKhArQInK4LSGLo', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:17', NULL, NULL, '__messages', '114797616E225', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hz7pcUt51XZNn6bS', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:03', NULL, NULL, '__messages', '12735758723AF', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hZW0rh1hdMBKukyL', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:50', NULL, NULL, '__messages', '1227044FB3CB5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('IACSahZ7NNDXW1Ei', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 03:06:56', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":400}]', '{\"ip\":\"127.0.0.1\"}'),
('iApuPzjqZtEndYwp', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 03:06:47', NULL, NULL, '__user_group_memberships', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('IHU4YOphAonGngRd', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-10 03:07:55', NULL, NULL, '__buyer_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('iHVvsHCaBfKhhtuA', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 03:07:23', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1591.0638297872,\"new_value\":1592.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('ikfe9h4SyjexsU4m', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:52', NULL, '1145112F23C95', '__email_addresses', 'nassim@example.com', NULL, NULL),
('iP0HJh9x7baOwGIi', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:48', NULL, '186515137F658', '__users', 'jimmy', NULL, NULL),
('IW7tqZcIe0lcVy4k', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 03:07:39', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":216.3829787234,\"new_value\":3.61702127659}]', '{\"ip\":\"127.0.0.1\"}'),
('iWDESxdBq8Xn3JkT', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-10 03:07:38', NULL, NULL, '__trades', '170051B4D8683', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:38\"}]', '{\"ip\":\"127.0.0.1\"}'),
('IWdYPE1NmeAaGLrF', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:26', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":150.42553191489,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('J5ypJiYU4nX6S7Wm', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:46', NULL, '106532661845B', '__users', 'lodza', NULL, NULL),
('JA1dJg0N64q1NlN9', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:43', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":212.63157894737}]', '{\"ip\":\"127.0.0.1\"}'),
('JISFXg6LWYMQ4Znl', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:51', NULL, '1145112F23C95', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('jJg2zUkX78YJMDxg', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:51', NULL, '196196542400A', '__users', 'raymond', NULL, NULL),
('JLzuOyeNA1hK0SUC', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:26', NULL, NULL, '__messages', '157942279E9C1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('jq2l5EKWX0JJjrNE', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:07:33', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":500,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('jVVx0sPxQeZhhUGG', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:45', NULL, '126307BB3AD0C', '__users', 'guddaz', NULL, NULL),
('K2bf1UorwZlqUnWb', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-10 03:07:48', NULL, NULL, '__buyer_extensions', 'peter', NULL, '{\"ip\":\"127.0.0.1\"}'),
('k2Iz6P0euGGfSMPP', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:07:34', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":179.58659627098,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('K9PybK4ggQBkHFLx', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:29', NULL, NULL, '__messages', '159440082D792', NULL, '{\"ip\":\"127.0.0.1\"}'),
('kAyC4WOqb4LyaSrp', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'lodza', '2022-09-10 03:06:54', NULL, NULL, '__asset_wallets', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('kemdzNAy9fSMEpIo', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'guddaz', '2022-09-10 03:07:08', NULL, NULL, '__asset_wallets', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('KfWRtNqLhaSlCYEZ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:35', NULL, NULL, '__messages', '1034059E17497', NULL, '{\"ip\":\"127.0.0.1\"}'),
('khXhoQBYNURuZrz0', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-10 03:07:13', NULL, NULL, '__messages', '114116F5E7CFC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('KjwY2s8KVi5SYJpB', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:49', NULL, '1480328C8EB9C', '__users', 'keith', NULL, NULL),
('KkjSHPBcsydT5w58', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'raymond', '2022-09-10 03:07:22', NULL, NULL, '__asset_wallets', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('kLQxcGrdH2262qnz', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 03:07:06', NULL, NULL, '__deposit_tokens', '186122D14F6F7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('kpdVg7ybrXzz4irH', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'flint', '2022-09-10 03:08:27', NULL, NULL, '__trades', '183183D242A84', NULL, '{\"ip\":\"127.0.0.1\"}'),
('KQIf0dCCh9SLipV7', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:48', NULL, '1480328C8EB9C', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('KrdTPrFgaGWBBY6g', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:06:55', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":967.86579}]', '{\"ip\":\"127.0.0.1\"}'),
('KRPOvxRw0aRBhGW5', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 03:06:59', NULL, NULL, '__deposit_tokens', '112677327A9EE', NULL, '{\"ip\":\"127.0.0.1\"}'),
('KSETvubIGQxB3YKb', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 03:07:02', NULL, NULL, '__deposit_tokens', '1289760D4AC69', NULL, '{\"ip\":\"127.0.0.1\"}'),
('kwFRAHZrHfxi0wrd', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:38', NULL, NULL, '__messages', '10764918F96FA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('kxIJ5KQRPYf1Fvma', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 03:07:17', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":211.3940999466,\"new_value\":210.33027015937}]', '{\"ip\":\"127.0.0.1\"}'),
('laxuQeQ05xS0SwOp', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:20', NULL, NULL, '__trades', '1544903FBFE45', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:20\"}]', '{\"ip\":\"127.0.0.1\"}'),
('lfLTk9jYqHR2zM7V', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-10 03:07:26', NULL, NULL, '__trades', '136920DB01011', NULL, '{\"ip\":\"127.0.0.1\"}'),
('LFOFb0WH0TQpzovd', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 03:08:06', NULL, NULL, '__trades', '106705164BB48', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:08:03\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('LgNYMNa23cG7i60w', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 03:08:12', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1610.351008422,\"new_value\":1612.9825873694}]', '{\"ip\":\"127.0.0.1\"}'),
('Lk6rdkPDoF4lO32Z', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 03:07:06', NULL, NULL, '__asset_wallets', '9', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('LPqlYmBgqMdXK9gF', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 03:08:21', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":347.86679964539,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('LSBAZBrNTNhnh5ck', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'ross', '2022-09-10 03:07:07', NULL, NULL, '__offers', '184684CC25DD3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('LYEvnoOpHgQLtBAp', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:47', NULL, '140380CAD8882', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('mh8IaxwvZEjYtqQ8', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:46', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":173.20361754758,\"new_value\":383.72993333705}]', '{\"ip\":\"127.0.0.1\"}'),
('MI7MSLKkMUwQLQ8o', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:13', NULL, '1690078616AD9', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('MqpoWiVvOxQFCDdR', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:51', NULL, '1145112F23C95', '__users', 'nassim', NULL, NULL),
('MRvjU6p8LYXvVBud', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-10 03:08:21', NULL, NULL, '__trades', '131289A4D4CCB', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:08:21\"}]', '{\"ip\":\"127.0.0.1\"}'),
('MuZnvoFVyL2VmUFS', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:08:13', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":686.45576707724,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('mxswmKPJrfRXiPxg', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:07:35', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1593.6058230682,\"new_value\":1599.9888017916}]', '{\"ip\":\"127.0.0.1\"}'),
('MyLIU6Q7H0AaWyGr', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:19', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":106.31578947368}]', '{\"ip\":\"127.0.0.1\"}'),
('MZ1gaqo6gukuuE9X', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:52', NULL, '1145112F23C95', '__notifications', '1687158D9F232', NULL, NULL),
('mZanQmzRmlTJNVPw', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-10 03:07:20', NULL, NULL, '__trades', '1544903FBFE45', NULL, '{\"ip\":\"127.0.0.1\"}'),
('NdnwDp73zZbkI3Zj', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 03:07:20', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":968.31000052632,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}');
INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('nGKLl9KK7XZywhg6', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:46', NULL, '106532661845B', '__notifications', '132637AB76287', NULL, NULL),
('NNN7DnVEyH1rMooF', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 03:07:52', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":536.30459126541,\"new_value\":270.3471444569}]', '{\"ip\":\"127.0.0.1\"}'),
('nqdb2SXVOR79QVbt', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:13', NULL, '1690078616AD9', '__email_addresses', 'busadmin@ankelli.com', NULL, NULL),
('Ns40PQJmEsHOZZ7Q', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'reserves', '2022-09-10 03:06:52', NULL, NULL, '__asset_wallets', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('NWoyx93tgeRHciYy', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 03:07:14', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":107.44680851064,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('nxHPUzZCAwp5PTHv', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 03:06:11', NULL, NULL, '__admin_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('nyq53k3qa4UXyLmw', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:49', NULL, '1480328C8EB9C', '__notifications', '15013218780B5', NULL, NULL),
('nzPiAXa2V5cqejS8', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 03:07:06', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1690,\"new_value\":1590}]', '{\"ip\":\"127.0.0.1\"}'),
('O1JwnZJMyWqwegW3', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:26', NULL, NULL, '__trades', '136920DB01011', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:26\"}]', '{\"ip\":\"127.0.0.1\"}'),
('O7r52jRPhauqRX9T', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 03:07:20', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":106.31578947368,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('o7Xg2CDOu2nd0lR8', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:45', NULL, '126307BB3AD0C', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('OBJ2mRI8f1u8eV2t', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 03:08:23', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":210.33027015937,\"new_value\":423.09622760618}]', '{\"ip\":\"127.0.0.1\"}'),
('oMS019rcUhfmCpz6', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:43', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":748.93617021277,\"new_value\":536.3045912654}]', '{\"ip\":\"127.0.0.1\"}'),
('on8WJkajBtGHkBMm', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 03:06:12', NULL, NULL, '__user_group_memberships', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('oSHXmDQgvv9tDhR6', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:44', NULL, NULL, '__messages', '107812A7DF716', NULL, '{\"ip\":\"127.0.0.1\"}'),
('OU4TAVoe7DCuGPBv', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:56', NULL, NULL, '__messages', '154473E663449', NULL, '{\"ip\":\"127.0.0.1\"}'),
('oyoCggDaXkd1SSoL', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:46', NULL, '126307BB3AD0C', '__notifications', '12898743700CE', NULL, NULL),
('oZmDOjfL3uGn9O3C', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:48', NULL, '186515137F658', '__email_addresses', 'jimmy@example.com', NULL, NULL),
('paquJD8VBPGPYbVO', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 03:08:19', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":562.76041666667,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('PMNl4tYWcmDdr0R6', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-10 03:08:00', NULL, NULL, '__trades', '130026FB798D7', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:57\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('pMuqzbDiCdP5wV3c', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 03:07:08', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":317.77707867,\"new_value\":210.33027015936}]', '{\"ip\":\"127.0.0.1\"}'),
('poaQTHltuSsv1BPg', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 03:08:25', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":207.94117647059}]', '{\"ip\":\"127.0.0.1\"}'),
('Poe9qZyZmRSa8aTM', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:09', NULL, NULL, '__messages', '12339609A6929', NULL, '{\"ip\":\"127.0.0.1\"}'),
('PrTYMaEq9SKmcDzx', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:50', NULL, NULL, '__messages', '1951834C473DA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('PsOp6P6zBwx5l51D', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 03:07:53', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1604.221724524,\"new_value\":1606.8812989921}]', '{\"ip\":\"127.0.0.1\"}'),
('pUXaaZZVtak9BYVx', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-10 03:08:01', NULL, NULL, '__seller_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('PV8cAVgCTJGgybP6', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-10 03:08:15', NULL, NULL, '__trades', '134070CC6381A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('py2nkFaGNqMtH122', 'TEST_SESSION', 'Resetting to default value.', 'entry_update', 'peter', '2022-09-10 03:08:31', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Resetting to default value.\"},{\"field_name\":\"value\",\"old_value\":\"0\",\"new_value\":true}]', '{\"ip\":\"127.0.0.1\"}'),
('PYTIsqulSFaKTp3P', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:24', NULL, NULL, '__messages', '157496C4BD4AE', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Pz8ypAexTkgXOENq', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:28', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":600,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('Q2jnIlTznpmJ3oAD', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 03:08:10', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":952.24524076145,\"new_value\":689.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('q7ca0UFnYAdZ4Bn3', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 03:07:51', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":267.68756998881,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('q8OGkTBGECK6VTmm', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 03:06:11', NULL, NULL, '__user_group_memberships', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('q9A8zgYKKBOTU2Ug', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 03:07:38', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":214.89361702128,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('qBjA9NPcouEuJkul', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-10 03:08:02', NULL, NULL, '__trades', '106705164BB48', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qET2clhmqu1xvwWO', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'ross', '2022-09-10 03:06:59', NULL, NULL, '__asset_wallets', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Qg3mKyYKcusWeyqD', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 03:07:59', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1606.8812989921,\"new_value\":1608.5089031588}]', '{\"ip\":\"127.0.0.1\"}'),
('QGqwanXKnqldoM1R', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-10 03:07:32', NULL, NULL, '__trades', '106736EF8C832', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qJrxWFlhAxbvFJW3', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:48', NULL, '140380CAD8882', '__notifications', '153610E469310', NULL, NULL),
('qnFwId1kS3MAvNwl', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'flint', '2022-09-10 03:08:19', NULL, NULL, '__buyer_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qOjvQfQv27Ls7DZr', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'peter', '2022-09-10 03:07:48', NULL, NULL, '__offers', '11482213FB74E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('qpyrIhrjNjd93PZu', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 03:07:14', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":210.33027015936,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('qrqFhtfioFyzElYk', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:48', NULL, '186515137F658', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('QSYvmuwLl8ygGB4l', 'FACTORY_SESSION', 'Resetting to default value.', 'entry_update', 'system', '2022-09-10 03:06:14', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Resetting to default value.\"},{\"field_name\":\"value\",\"old_value\":\"0\",\"new_value\":true}]', '{\"ip\":\"127.0.0.1\"}'),
('qWTfmDKA1sYI6RRn', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 03:07:57', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":103.29954915548,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('qwTL6slcHBgZDws3', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 03:06:12', NULL, NULL, '__user_group_memberships', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('rKfXJNuk3wQuqOYh', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:03', NULL, NULL, '__messages', '18423044EFB3A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('rNTz5SacJ8V7ejRC', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:12', NULL, '1096740BD3AFC', '__notifications', '106816E57D1F3', NULL, NULL),
('ROHrTUgVJQ5lN94G', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-10 03:07:18', NULL, NULL, '__offers', '155253365254C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('rSVeLxr1KF8jbMJ8', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:11', NULL, NULL, '__messages', '198452A408B7D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('RVakb5PrJCxTCKLv', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:41', NULL, NULL, '__messages', '140317A73A83F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('RVdgV2oE2EUly806', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:49', NULL, '1480328C8EB9C', '__email_addresses', 'keith@example.com', NULL, NULL),
('rXu07J5t94SBTdoS', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 03:06:47', NULL, NULL, '__user_group_memberships', '12', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ryAlKuTB4ti9R42X', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:10', NULL, '120732338B6C7', '__notifications', '198577A98750E', NULL, NULL),
('RZMb9q7d8qI3NrMF', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:09', NULL, NULL, '__messages', '192590F2C96A4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('S04Olaq5wX7YimFw', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:08:03', NULL, NULL, '__trades', '106705164BB48', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:08:02\"}]', '{\"ip\":\"127.0.0.1\"}'),
('S0wdFRYLarE2gvE1', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-10 03:07:30', NULL, NULL, '__buyer_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('S1Z6VUSc0yytEcUw', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:18', NULL, NULL, '__messages', '145549D441B0D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('S2u9HFZBBEWwGA5p', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:32', NULL, NULL, '__trades', '106736EF8C832', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:32\"}]', '{\"ip\":\"127.0.0.1\"}'),
('SCAduumAWK2IiyDe', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:50', NULL, '186157FE5D98D', '__email_addresses', 'clarence@example.com', NULL, NULL),
('scn9KjiE6LKplxOo', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:15', NULL, NULL, '__messages', '13385815EAB0A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('sDdad0hd6ozfjCUC', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:08:06', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1608.5089031588,\"new_value\":1610.351008422}]', '{\"ip\":\"127.0.0.1\"}'),
('sDF4rR6BuLfZk3kY', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 03:06:46', NULL, NULL, '__admin_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('sDjxVjGfisDu1MEE', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'jimmy', '2022-09-10 03:07:30', NULL, NULL, '__offers', '1122502032D41', NULL, '{\"ip\":\"127.0.0.1\"}'),
('sG3lO32Ta73t3Ndt', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:50', NULL, '186157FE5D98D', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('sl5dPeIkCiDCIE5j', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:01', NULL, NULL, '__deposit_tokens', '1794831FBC189', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:01\"}]', '{\"ip\":\"127.0.0.1\"}'),
('SLvGjMRB2exfIy3s', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 03:07:36', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":216.3829787234,\"new_value\":1.4893617021234}]', '{\"ip\":\"127.0.0.1\"}'),
('sMVcTnLnKsMvX1NJ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 03:07:41', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1599.9888017916,\"new_value\":1602.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('srIfAOYX6QeeWDPQ', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 03:06:46', NULL, '106532661845B', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('sTKOggsiWFx9tgIU', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-10 03:07:42', NULL, NULL, '__offers', '107373D53DD6C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('SxPqBS6sKtTFoOo6', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'nassim', '2022-09-10 03:07:06', NULL, NULL, '__deposit_tokens', '186122D14F6F7', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:06\"}]', '{\"ip\":\"127.0.0.1\"}'),
('SY9HGWLHInd9uLx2', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-10 03:06:12', NULL, NULL, '__seller_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TevUBcqW9kqTHz17', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-10 03:06:13', NULL, NULL, '__seller_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TfjiRhamgXcZanzC', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:26', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":817.88446861142,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('TIpZWCWJeVjBiwvx', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:08:01', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":186.05263157895}]', '{\"ip\":\"127.0.0.1\"}'),
('tiTyjKmCTNtduV0N', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 03:07:04', NULL, NULL, '__asset_wallets', '8', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('TmsD88h4vgKCbqAi', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-10 03:07:42', NULL, NULL, '__buyer_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TqZSskJt5u3E9fCY', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'peter', '2022-09-10 03:07:52', NULL, NULL, '__asset_wallets', '12', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TSPjboJGbj1m4aGZ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 03:08:15', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":204.26966292135,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('tvt2xLu5rR5II8fK', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:20', NULL, NULL, '__messages', '1031196E9A05F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TY9t68Uqm75WqIl1', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 03:07:52', NULL, NULL, '__asset_wallets', '12', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":265.95744680851}]', '{\"ip\":\"127.0.0.1\"}'),
('tyU4scHRzPR0WJn9', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 03:06:11', NULL, NULL, '__user_group_memberships', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('U4LJCM8HRkrkHW8F', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'nassim', '2022-09-10 03:08:18', NULL, NULL, '__trades', '134070CC6381A', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:08:15\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('U5sHZEEGoooccAqO', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:12', NULL, NULL, '__messages', '15658377DD1BC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('u8YVpmgz5FYYjEE2', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:49', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":268.6170212766}]', '{\"ip\":\"127.0.0.1\"}'),
('uhmDmHOqy3CUs8A0', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 03:07:38', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":1.4893617021234,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('Uj5zcjwS6ixW2yvk', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:32', NULL, NULL, '__messages', '1720436A937D3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UOMnkythEXyvQ76N', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:07:33', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":817.88446861141,\"new_value\":179.58659627098}]', '{\"ip\":\"127.0.0.1\"}'),
('uSVCBj9yzuh40QgH', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:20', NULL, NULL, '__messages', '135592BF3E2A7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('utmmmg0ucq1McexA', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 03:06:11', NULL, NULL, '__user_group_memberships', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('V6fLXEufamCOa5Hb', 'TEST_SESSION', 'Temporarily disabling for test users.', 'entry_update', 'system', '2022-09-10 03:06:45', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for test users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('VDt8r79YDqvI6wsH', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:14', NULL, NULL, '__messages', '19597832EDA7B', NULL, '{\"ip\":\"127.0.0.1\"}'),
('VIQIVBNKLtAVy2gi', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:08:03', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":952.24524076145,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('vIzuhh9k2bAK9OQJ', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:45', NULL, '126307BB3AD0C', '__email_addresses', 'goodhopedhliwayo@gmail.com', NULL, NULL),
('VjYNIGW5LrM4c0yv', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'nassim', '2022-09-10 03:08:13', NULL, NULL, '__offers', '196121D755A07', NULL, '{\"ip\":\"127.0.0.1\"}'),
('vkh1XMRGWUYPYQdm', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 03:08:21', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":214.89361702128,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('VWGRkAS5vyGulIXW', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:08:03', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":186.05263157895,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('vYhKEnMC6KeiH37M', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'jimmy', '2022-09-10 03:07:03', NULL, NULL, '__asset_wallets', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('W3f9h5p85eDcGg0N', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:01', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":600}]', '{\"ip\":\"127.0.0.1\"}'),
('W5qh7ZllAnR8VnPp', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 03:07:59', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":104.92715332214,\"new_value\":103.29954915547}]', '{\"ip\":\"127.0.0.1\"}'),
('W6ra9tx4yUTkB27g', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:12', NULL, '1096740BD3AFC', '__users', 'reserves', NULL, NULL),
('WIY9CHJR0h1hsYCv', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 03:06:59', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":3000,\"new_value\":2890}]', '{\"ip\":\"127.0.0.1\"}'),
('WOKPnFhyQfEoCGyf', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:20', NULL, NULL, '__messages', '197800C0AE06D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('WOV36OyC1DzjJwnm', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:06:58', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":967.86579,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}'),
('wP3nkMLDXmOsbFzS', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'ross', '2022-09-10 03:07:36', NULL, NULL, '__seller_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('WTPOE7i2ATZgNnaf', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:27', NULL, NULL, '__messages', '147155F5088B5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('WVrx4Si3uymvr4nZ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 03:07:00', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":110}]', '{\"ip\":\"127.0.0.1\"}'),
('WxC7Sy4OdSDzJtby', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:13', NULL, '1690078616AD9', '__notifications', '173457BAFA5D4', NULL, NULL),
('Wyn0LhM1wDOvy13H', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 03:08:25', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":347.86679964539,\"new_value\":139.9256231748}]', '{\"ip\":\"127.0.0.1\"}'),
('wZxta3XiMFCuHH67', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 03:07:17', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1590,\"new_value\":1591.0638297872}]', '{\"ip\":\"127.0.0.1\"}'),
('x1q4CE7T073LdMM6', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:07:03', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":500}]', '{\"ip\":\"127.0.0.1\"}'),
('x9G4XcP1DkiY0WlO', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 03:08:11', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":689.08734602461,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('XAdEqO55VqKgWAd4', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:08:01', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":1138.2978723404,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('XaPZQpdjSBp6UkHF', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:51', NULL, '196196542400A', '__notifications', '133044DAD719A', NULL, NULL),
('XDl7gZ2W2N7YfgnX', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 03:06:51', NULL, '186157FE5D98D', '__notifications', '178370FF305D1', NULL, NULL),
('Xe40lxiIwseg8uQP', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'flint', '2022-09-10 03:08:21', NULL, NULL, '__trades', '131289A4D4CCB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XfqFrDpJlci4gTSj', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:50', NULL, '1854651307151', '__users', 'flint', NULL, NULL),
('Xi81RqEZAnF1B6Ym', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:21', NULL, NULL, '__messages', '142574A72C023', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XiMTn5gpOsatDvyU', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:29', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":819.37383031354,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('XIPREjH1YKoyTy2s', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 03:07:57', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":164.38802083333,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('XixItMdkvdafKIA6', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:11', NULL, '142760C39CD41', '__email_addresses', 'sysadmin@ankelli.com', NULL, NULL),
('xJSKbOATZ16gsli1', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:49', NULL, '188961A5FFE0B', '__email_addresses', 'peter@example.com', NULL, NULL),
('xolgp67MbNiOyCsN', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:30', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":644.68085106383}]', '{\"ip\":\"127.0.0.1\"}'),
('xOSFzHqnAu6xJPSn', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 03:06:12', NULL, NULL, '__admin_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XvxjeGzXYbKU13oY', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 03:08:09', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":265.78947368421,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('Y0euf8L3Xj21dT4k', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:07:32', NULL, NULL, '__messages', '123330925DE28', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Y0qDUpwOsWO1QSvv', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:12', NULL, '1096740BD3AFC', '__email_addresses', 'reserves@ankelli.com', NULL, NULL),
('ycOspojDh0eC32yy', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:29', NULL, NULL, '__trades', '136920DB01011', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:26\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('YDxgGamzoOaRtD0Q', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-10 03:08:12', NULL, NULL, '__trades', '163574E57720C', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:08:09\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('yE2uvzoEhrkxOmjI', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 03:08:16', NULL, NULL, '__asset_wallets', '9', '[{\"field_name\":\"asset_value\",\"old_value\":100,\"new_value\":302.24719101124}]', '{\"ip\":\"127.0.0.1\"}'),
('yG9hbkWTt19Y6cm3', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-10 03:08:27', NULL, NULL, '__trades', '183183D242A84', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:08:27\"}]', '{\"ip\":\"127.0.0.1\"}'),
('yGp2vJ93JZQQYeHo', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'clarence', '2022-09-10 03:07:04', NULL, NULL, '__asset_wallets', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ygvoIzzOXTFCxCtS', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:06', NULL, NULL, '__messages', '171527267A8E3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ygwdby34Ft43bQ2o', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-10 03:07:24', NULL, NULL, '__buyer_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('YMkYwUW1MafTk2kZ', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'guddaz', '2022-09-10 03:08:24', NULL, NULL, '__trades', '131289A4D4CCB', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"guddaz\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:08:21\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('yPzg6e0q96IGlCyH', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:44', NULL, NULL, '__trades', '14314789E5A65', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:44\"}]', '{\"ip\":\"127.0.0.1\"}'),
('ySZlXCJEXkRFXvLh', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:50', NULL, NULL, '__trades', '145282104E344', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:50\"}]', '{\"ip\":\"127.0.0.1\"}'),
('YV02OEUrbuwVghri', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 03:07:22', NULL, NULL, '__asset_wallets', '11', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":105.26315789474}]', '{\"ip\":\"127.0.0.1\"}'),
('ywAXBAGVsIZPrUJV', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 03:07:49', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":536.30459126541,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('ywNsgG3xhYZLsMQ8', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-10 03:07:18', NULL, NULL, '__buyer_extensions', 'raymond', NULL, '{\"ip\":\"127.0.0.1\"}'),
('YYds7BPbaj7toIAZ', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-10 03:08:08', NULL, NULL, '__trades', '163574E57720C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('z42Yz9iJZebzXXoA', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'guddaz', '2022-09-10 03:07:11', NULL, NULL, '__trades', '132497AEC255D', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"guddaz\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:10\"}]', '{\"ip\":\"127.0.0.1\"}'),
('ZClosZzFS82pIe5Q', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-10 03:07:56', NULL, NULL, '__trades', '130026FB798D7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zjfiZ648esuuqkSF', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'reserves', '2022-09-10 03:06:52', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":3000}]', '{\"ip\":\"127.0.0.1\"}'),
('ZkeIbF5krngcfCBW', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-10 03:07:23', NULL, NULL, '__trades', '1544903FBFE45', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-10 05:07:20\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('ZKJYUoxGVDbCg21e', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'ross', '2022-09-10 03:07:36', NULL, NULL, '__buyer_extensions', 'clarence', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zM7L7qdSZxQp85h1', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 03:08:15', NULL, NULL, '__messages', '1161554D4A0D2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ZqJPc7fqRJLXxbO3', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 03:08:18', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":484.208576066,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('Zru6TSq8H86b3BwR', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 03:08:13', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":204.26966292135}]', '{\"ip\":\"127.0.0.1\"}'),
('zWz38sDuu5SoI1pL', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:08:05', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":954.08734602461,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('ZxNCapbB5NexdTA2', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 03:07:47', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":538.4098544233,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('zxpJxSqnVVho4Dij', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 03:06:13', NULL, '1690078616AD9', '__users', 'busadmin', NULL, NULL),
('ZxYKWahdkYpYZZ5B', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 03:07:53', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":270.3471444569,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('Zy92DcQsRykDptp7', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'flint', '2022-09-10 03:08:19', NULL, NULL, '__seller_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zYCj1faksJwQ2y3u', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 03:06:47', NULL, '140380CAD8882', '__email_addresses', 'ross@example.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__messages`
--

CREATE TABLE `__messages` (
  `id` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_table` enum('__chats','__trades') COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_uid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__messages`
--

INSERT INTO `__messages` (`id`, `parent_table`, `parent_uid`, `body`, `creator_username`, `created_datetime`, `read_datetime`) VALUES
('1031196E9A05F', '__trades', '1544903FBFE45', 'Asset buyer just declared their payment.', 'system', '2022-09-10 03:07:20', NULL),
('1034059E17497', '__trades', '106736EF8C832', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 03:07:35', NULL),
('1066177828BF5', '__trades', '183183D242A84', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 03:08:26', NULL),
('10764918F96FA', '__trades', '170051B4D8683', 'Asset buyer just declared their payment.', 'system', '2022-09-10 03:07:38', NULL),
('107812A7DF716', '__trades', '14314789E5A65', 'Asset buyer just declared their payment.', 'system', '2022-09-10 03:07:44', NULL),
('111370AAB0455', '__trades', '132497AEC255D', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 03:07:14', NULL),
('113737445E620', '__trades', '130026FB798D7', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 03:07:56', NULL),
('114116F5E7CFC', '__trades', '132497AEC255D', 'I\'ve collected the money.', 'ross', '2022-09-10 03:07:13', NULL),
('1143686EBA765', '__trades', '130026FB798D7', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 03:07:57', NULL),
('114797616E225', '__trades', '132497AEC255D', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 03:07:17', NULL),
('1161554D4A0D2', '__trades', '134070CC6381A', 'Asset buyer just declared their payment.', 'system', '2022-09-10 03:08:15', NULL),
('11723386E394A', '__trades', '163574E57720C', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 03:08:08', NULL),
('11723471AA07D', '__trades', '145282104E344', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 03:07:53', NULL),
('1227044FB3CB5', '__trades', '145282104E344', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 03:07:50', NULL),
('123330925DE28', '__trades', '106736EF8C832', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 03:07:31', NULL),
('12339609A6929', '__trades', '163574E57720C', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 03:08:09', NULL),
('1269741FC9835', '__trades', '170051B4D8683', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 03:07:38', NULL),
('12735758723AF', '__trades', '106705164BB48', 'Asset buyer just declared their payment.', 'system', '2022-09-10 03:08:02', NULL),
('13385815EAB0A', '__trades', '134070CC6381A', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 03:08:15', NULL),
('1348716AE15A4', '__trades', '14314789E5A65', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 03:07:44', NULL),
('13514258F4E11', '__trades', '132497AEC255D', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 03:07:09', NULL),
('135592BF3E2A7', '__trades', '1544903FBFE45', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 03:07:20', NULL),
('137582C9F3EA7', '__trades', '106705164BB48', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 03:08:02', NULL),
('13761124902A4', '__trades', '170051B4D8683', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 03:07:37', NULL),
('139753D5A17FC', '__trades', '14314789E5A65', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 03:07:47', NULL),
('140317A73A83F', '__trades', '170051B4D8683', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 03:07:41', NULL),
('142574A72C023', '__trades', '131289A4D4CCB', 'Asset buyer just declared their payment.', 'system', '2022-09-10 03:08:21', NULL),
('142721361683B', '__trades', '132497AEC255D', 'Pleasure doing business with you.', 'ross', '2022-09-10 03:07:14', NULL),
('144744D28709E', '__trades', '183183D242A84', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 03:08:30', NULL),
('145549D441B0D', '__trades', '134070CC6381A', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 03:08:18', NULL),
('147155F5088B5', '__trades', '183183D242A84', 'Asset buyer just declared their payment.', 'system', '2022-09-10 03:08:27', NULL),
('1533864E86AE0', '__trades', '136920DB01011', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 03:07:26', NULL),
('15344577B87C6', '__trades', '106736EF8C832', 'Asset buyer just declared their payment.', 'system', '2022-09-10 03:07:32', NULL),
('154473E663449', '__trades', '130026FB798D7', 'Asset buyer just declared their payment.', 'system', '2022-09-10 03:07:56', NULL),
('1561597028E4B', '__trades', '136920DB01011', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 03:07:26', NULL),
('15658377DD1BC', '__trades', '163574E57720C', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 03:08:12', NULL),
('157496C4BD4AE', '__trades', '131289A4D4CCB', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 03:08:24', NULL),
('15751651BB440', '__trades', '183183D242A84', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 03:08:27', NULL),
('157942279E9C1', '__trades', '136920DB01011', 'Asset buyer just declared their payment.', 'system', '2022-09-10 03:07:26', NULL),
('159440082D792', '__trades', '136920DB01011', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 03:07:29', NULL),
('166078A1D611F', '__trades', '132497AEC255D', 'I\'m sending the cash in a couple of minutes.', 'guddaz', '2022-09-10 03:07:09', NULL),
('169036AAC2A4F', '__trades', '130026FB798D7', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 03:07:59', NULL),
('171527267A8E3', '__trades', '106705164BB48', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 03:08:06', NULL),
('171815E72BD59', '__trades', '14314789E5A65', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 03:07:44', NULL),
('1720436A937D3', '__trades', '106736EF8C832', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 03:07:32', NULL),
('173796F97BFDD', '__trades', '132497AEC255D', 'I\'ve sent the cash.\nPlease confirm receiving it.', 'guddaz', '2022-09-10 03:07:12', NULL),
('176871C6DB506', '__trades', '145282104E344', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 03:07:50', NULL),
('183236CBBB3F1', '__trades', '1544903FBFE45', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 03:07:23', NULL),
('18423044EFB3A', '__trades', '106705164BB48', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 03:08:03', NULL),
('192590F2C96A4', '__trades', '163574E57720C', 'Asset buyer just declared their payment.', 'system', '2022-09-10 03:08:08', NULL),
('1951834C473DA', '__trades', '145282104E344', 'Asset buyer just declared their payment.', 'system', '2022-09-10 03:07:50', NULL),
('19597832EDA7B', '__trades', '134070CC6381A', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 03:08:14', NULL),
('197800C0AE06D', '__trades', '1544903FBFE45', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 03:07:20', NULL),
('1983436DAEDFD', '__trades', '131289A4D4CCB', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 03:08:20', NULL),
('198452A408B7D', '__trades', '132497AEC255D', 'Asset buyer just declared their payment.', 'system', '2022-09-10 03:07:10', NULL),
('1987396911DD1', '__trades', '131289A4D4CCB', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 03:08:21', NULL);

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
('106816E57D1F3', 'reserves', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:12', NULL),
('1087238E4174C', 'sysadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:11', NULL),
('12898743700CE', 'guddaz', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:45', NULL),
('132637AB76287', 'lodza', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:46', NULL),
('133044DAD719A', 'raymond', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:51', NULL),
('1438347A182D5', 'jimmy', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:48', NULL),
('1472231A4DC25', 'peter', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:49', NULL),
('15013218780B5', 'keith', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:49', NULL),
('153610E469310', 'ross', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:47', NULL),
('165864B519610', 'flint', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:50', NULL),
('1687158D9F232', 'nassim', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:52', NULL),
('173457BAFA5D4', 'busadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:13', NULL),
('178370FF305D1', 'clarence', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:50', NULL),
('198577A98750E', 'developer', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 03:06:10', NULL);

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
('107373D53DD6C', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '13.3', 2800, 14000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'lodza', '2022-09-10 03:07:42', '2022-09-10 03:07:42', NULL),
('1122502032D41', 'Zambia', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', NULL, 'online', 'jimmy', '2022-09-10 03:07:30', '2022-09-10 03:07:30', NULL),
('1145621818521', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '0.94', 100, 200, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'guddaz', '2022-09-10 03:08:19', '2022-09-10 03:08:19', NULL),
('1146386A514BD', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.2', 700, 3000, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'lodza', '2022-09-10 03:08:01', '2022-09-10 03:08:01', NULL),
('11482213FB74E', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 200, 300, NULL, NULL, 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', NULL, 'online', 'peter', '2022-09-10 03:07:48', '2022-09-10 03:07:48', NULL),
('11958074C70B7', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.95', 100, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', NULL, 'online', 'raymond', '2022-09-10 03:07:18', '2022-09-10 03:07:18', NULL),
('13676078247DC', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '170', 20000, 40000, NULL, NULL, 'algerie_poste', '{\"account_holder_name\":\"Timothy Tambo\",\"account_number\":\"22558678\",\"account_key\":\"87\"}', NULL, 'online', 'peter', '2022-09-10 03:08:25', '2022-09-10 03:08:25', NULL),
('1431532DF7E23', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'clarence', '2022-09-10 03:07:36', '2022-09-10 03:07:36', NULL),
('155253365254C', 'Zimbabwe', 'Norton', 'sell', 'USDT', 'USD', '1.04', NULL, NULL, '50', '200', 'cash_in_person', NULL, NULL, 'online', 'guddaz', '2022-09-10 03:07:18', '2022-09-10 03:07:18', NULL),
('17277175EE899', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.36', 1500, 2500, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'flint', '2022-09-10 03:07:55', '2022-09-10 03:07:55', NULL),
('1798533F2A30C', 'Italy', NULL, 'buy', 'USDT', 'EUR', '0.76', 200, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', NULL, 'online', 'raymond', '2022-09-10 03:08:07', '2022-09-10 03:08:07', NULL),
('184684CC25DD3', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'ross', '2022-09-10 03:07:07', '2022-09-10 03:07:07', NULL),
('193020E3DD56C', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', NULL, 'online', 'keith', '2022-09-10 03:07:24', '2022-09-10 03:07:24', NULL),
('196121D755A07', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '178', 10000, 40000, NULL, NULL, 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', NULL, 'online', 'nassim', '2022-09-10 03:08:13', '2022-09-10 03:08:13', NULL);

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
(1, 'Update system config params', 'update_sysconfig_params', 'Permission holder can update system config params.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(2, 'Handle feedback reports', 'handle_feedback_reports', 'Permission holder can handle feedback reports.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(3, 'Manage datalists', 'manage_datalists', 'Permission holder can manage datalists.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(4, 'Manage system tools', 'manage_systools', 'Permission holder can manage system tools.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(5, 'View all logs', 'view_all_logs', 'Permission holder can view all logs.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(6, 'View all transactions', 'view_all_transactions', 'Permission holder can view all transactions.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(7, 'Manage Deposit Tokens', 'manage_deposit_tokens', 'Permission holder can create and edit deposit tokens.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(8, 'Handle Withdrawals', 'handle_withdrawals', 'Permission holder can handle withdrawals.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(9, 'Manage Registration Tokens', 'manage_reg_tokens', 'Permission holder can create and edit registration tokens.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(10, 'Handle flagged users', 'handle_flagged_users', 'Permission holder can handle flagged Users.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(11, 'Handle customer service chats', 'handle_customer_service_chats', 'Permission holder can handle customer service chats.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(12, 'Manage update posts', 'manage_update_posts', 'Permission holder can handle posting and editing update posts.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(13, 'Handle flagged business elems', 'handle_flagged_business_elems', 'Permission holder can handle flagged business elems (Offers, Trades, etc).', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL);

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
(1, '__user_groups', 'system_administrators', 'update_sysconfig_params', 'active', 'system', '2022-09-10 05:06:08', NULL),
(2, '__user_groups', 'system_administrators', 'handle_feedback_reports', 'active', 'system', '2022-09-10 05:06:08', NULL),
(3, '__user_groups', 'system_administrators', 'manage_systools', 'active', 'system', '2022-09-10 05:06:08', NULL),
(4, '__user_groups', 'system_administrators', 'manage_datalists', 'active', 'system', '2022-09-10 05:06:08', NULL),
(5, '__user_groups', 'system_administrators', 'view_all_logs', 'active', 'system', '2022-09-10 05:06:08', NULL),
(6, '__user_groups', 'business_administrators', 'view_all_transactions', 'active', 'system', '2022-09-10 05:06:08', NULL),
(7, '__user_groups', 'business_administrators', 'manage_deposit_tokens', 'active', 'system', '2022-09-10 05:06:08', NULL),
(8, '__user_groups', 'business_administrators', 'handle_withdrawals', 'active', 'system', '2022-09-10 05:06:08', NULL),
(9, '__user_groups', 'user_administrators', 'manage_reg_tokens', 'active', 'system', '2022-09-10 05:06:08', NULL),
(10, '__user_groups', 'user_administrators', 'handle_flagged_users', 'active', 'system', '2022-09-10 05:06:08', NULL),
(11, '__user_groups', 'platform_moderators', 'handle_customer_service_chats', 'active', 'system', '2022-09-10 05:06:08', NULL),
(12, '__user_groups', 'platform_moderators', 'handle_flagged_business_elems', 'active', 'system', '2022-09-10 05:06:08', NULL),
(13, '__user_groups', 'platform_moderators', 'manage_update_posts', 'active', 'system', '2022-09-10 05:06:08', NULL);

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
(1, '__users', 'system', 'Backend rest api enabled', 'backend_rest_api_enabled', '1', 'boolean', 'system', '2022-09-10 05:06:07', NULL),
(2, '__users', 'system', 'Scaffolding app enabled', 'scaffolding_app_enabled', '1', 'boolean', 'system', '2022-09-10 05:06:07', NULL),
(3, '__users', 'system', 'Fallback Display Language', 'fallback_pref_lang', 'en', 'enum:langs', 'system', '2022-09-10 05:06:07', NULL),
(4, '__users', 'system', 'Fallback Display Theme', 'fallback_pref_theme', 'light', 'enum:themes', 'system', '2022-09-10 05:06:07', NULL),
(5, '__users', 'system', 'Image storage driver', 'image_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-10 05:06:07', NULL),
(6, '__users', 'system', 'Document storage driver', 'document_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-10 05:06:07', NULL),
(7, '__users', 'system', 'Logs database driver', 'logs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-10 05:06:07', NULL),
(8, '__users', 'system', 'Notifications database driver', 'notifs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-10 05:06:07', NULL),
(9, '__users', 'system', 'Chats database driver', 'chats_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-10 05:06:07', NULL),
(10, '__users', 'system', 'Messages database driver', 'msgs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-10 05:06:07', NULL),
(11, '__users', 'system', 'Offers database driver', 'offers_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-10 05:06:07', NULL),
(12, '__users', 'system', 'Trades database driver', 'trades_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-10 05:06:07', NULL),
(13, '__users', 'system', 'Token registration enabled', 'token_reg_enabled', '1', 'boolean', 'system', '2022-09-10 05:06:07', '2022-09-10 03:08:31'),
(14, '__users', 'system', 'Token registration max use count', 'reg_token_max_use_count', '10', 'integer', 'system', '2022-09-10 05:06:07', NULL),
(15, '__users', 'system', 'Open Registration enabled', 'open_reg_enabled', '0', 'boolean', 'system', '2022-09-10 05:06:07', NULL),
(16, '__users', 'system', 'Learn mode available', 'learn_mode_available', '1', 'boolean', 'system', '2022-09-10 05:06:07', NULL),
(17, '__users', 'system', 'Offers to buy enabled', 'offer_to_buy_enabled', '1', 'boolean', 'system', '2022-09-10 05:06:07', NULL),
(18, '__users', 'system', 'Offers to sell enabled', 'offer_to_sell_enabled', '1', 'boolean', 'system', '2022-09-10 05:06:07', NULL),
(19, '__users', 'system', 'Use development crypto asset engine', 'use_dev_crypto_asset_engine', '1', 'boolean', 'system', '2022-09-10 05:06:07', NULL),
(20, '__users', 'system', 'Use tatum crypto asset engine', 'use_tatum_crypto_asset_engine', '0', 'boolean', 'system', '2022-09-10 05:06:07', NULL),
(21, '__users', 'system', 'Value charged by platform on transactions', 'platform_charge_asset_factor', '0.01', 'float', 'system', '2022-09-10 05:06:07', NULL),
(22, '__users', 'system', 'Minimum allowed price per unit currency on offers', 'min_offer_purchase_price', '0.5', 'float', 'system', '2022-09-10 05:06:07', NULL);

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
(1, 'Cash in person', 'cash_in_person', '5e5d4b', '[\"phone_no\"]', NULL, 'active', 'system', '2022-09-10 05:06:07', NULL, NULL),
(2, 'Stanbic bank', 'stanbic_bank', '066ef3', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-10 05:06:07', NULL, NULL),
(3, 'FNB bank', 'fnb_bank', '009eaa', '[\"account_holder_name\",\"account_no\"]', '[\"ZAR\"]', 'active', 'system', '2022-09-10 05:06:07', NULL, NULL),
(4, 'Mukuru', 'mukuru', 'e77924', '[\"fullname\",\"phone_no\"]', '[\"USD\"]', 'active', 'system', '2022-09-10 05:06:07', NULL, NULL),
(5, 'Algérie Poste', 'algerie_poste', '01009a', '[\"account_holder_name\",\"account_no\",\"account_key\"]', '[\"DZD\"]', 'active', 'system', '2022-09-10 05:06:07', NULL, NULL),
(6, 'MTN Mobile Money', 'mtn_momo', 'feca05', '[\"fullname\",\"phone_no\"]', NULL, 'active', 'system', '2022-09-10 05:06:07', NULL, NULL),
(7, 'Ecocash', 'ecocash', '005ba4', '[\"fullname\",\"phone_no\"]', '[\"ZWL\"]', 'active', 'system', '2022-09-10 05:06:07', NULL, NULL),
(8, 'Paypal', 'paypal', '27346a', '[\"fullname\",\"email_address\"]', '[\"USD\",\"EUR\",\"GBP\"]', 'active', 'system', '2022-09-10 05:06:07', NULL, NULL),
(9, 'Skrill', 'skrill', '862165', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-10 05:06:07', NULL, NULL),
(10, 'World Remit', 'world_remit', '604684', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-10 05:06:07', NULL, NULL),
(11, 'Mastercard', 'mastercard', 'cc0001', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-10 05:06:07', NULL, NULL),
(12, 'Visa', 'visa', '0055a5', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-10 05:06:07', NULL, NULL),
(13, 'FBC Bank', 'fbc_bank', '0055a5', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-10 05:06:07', NULL, NULL);

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
('1234567890', 'active', 'system', '2022-09-10 03:06:45');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-10 03:06:12', '2022-09-10 03:06:12', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-10 03:06:12', '2022-09-10 03:06:12', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-10 03:06:14', '2022-09-10 03:06:14', NULL),
(4, 'guddaz', 'active', 'guddaz', '2022-09-10 03:07:07', '2022-09-10 03:07:07', NULL),
(5, 'lodza', 'active', 'lodza', '2022-09-10 03:07:18', '2022-09-10 03:07:18', NULL),
(6, 'ross', 'active', 'ross', '2022-09-10 03:07:36', '2022-09-10 03:07:36', NULL),
(7, 'keith', 'active', 'keith', '2022-09-10 03:07:42', '2022-09-10 03:07:42', NULL),
(8, 'jimmy', 'active', 'jimmy', '2022-09-10 03:08:01', '2022-09-10 03:08:01', NULL),
(9, 'flint', 'active', 'flint', '2022-09-10 03:08:19', '2022-09-10 03:08:19', NULL);

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
('FACTORY_SESSION', 'system', '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'ended', '2022-09-10 05:06:06', NULL, NULL, NULL),
('TEST_SESSION', NULL, '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'active', '2022-09-10 05:06:06', NULL, NULL, NULL);

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
('106705164BB48', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '184.21052631579', '186.05263157895', '0.01', 2800, '15.2', '137990492ABF9', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-10 03:08:02', '2022-09-10 03:08:03', 1, 1, 'completed', 'lodza', 'jimmy', '2022-09-10 03:08:02', '2022-09-10 03:08:06', NULL),
('106736EF8C832', 'Zambia', NULL, 'buy', 'USDT', 'USD', '638.29787234043', '644.68085106383', '0.01', 600, '0.94', '188783C2E135B', 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', '2022-09-10 03:07:32', '2022-09-10 03:07:32', 1, 1, 'completed', 'jimmy', 'lodza', '2022-09-10 03:07:31', '2022-09-10 03:07:35', NULL),
('130026FB798D7', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '162.76041666667', '164.38802083333', '0.01', 2500, '15.36', '138401A2AE6B9', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-10 03:07:56', '2022-09-10 03:07:57', 1, 1, 'completed', 'flint', 'keith', '2022-09-10 03:07:56', '2022-09-10 03:08:00', NULL),
('131289A4D4CCB', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', '16769229B3674', 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', '2022-09-10 03:08:21', '2022-09-10 03:08:21', 1, 1, 'completed', 'guddaz', 'flint', '2022-09-10 03:08:20', '2022-09-10 03:08:24', NULL),
('132497AEC255D', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '106.3829787234', '107.44680851064', '0.01', 100, '0.94', '129247324D29F', 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', '2022-09-10 03:07:10', '2022-09-10 03:07:14', 1, 1, 'completed', 'ross', 'guddaz', '2022-09-10 03:07:09', '2022-09-10 03:07:17', NULL),
('134070CC6381A', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '202.24719101124', '204.26966292135', '0.01', 36000, '178', '11880379A64E8', 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', '2022-09-10 03:08:15', '2022-09-10 03:08:15', 1, 1, 'completed', 'nassim', 'jimmy', '2022-09-10 03:08:14', '2022-09-10 03:08:18', NULL),
('136920DB01011', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '148.93617021277', '150.42553191489', '0.01', 140, '0.94', '1902440F1845F', 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', '2022-09-10 03:07:26', '2022-09-10 03:07:26', 1, 1, 'completed', 'keith', 'lodza', '2022-09-10 03:07:26', '2022-09-10 03:07:29', NULL),
('14314789E5A65', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '210.52631578947', '212.63157894737', '0.01', 2800, '13.3', '1856156F01DE4', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-10 03:07:44', '2022-09-10 03:07:44', 1, 1, 'completed', 'lodza', 'keith', '2022-09-10 03:07:44', '2022-09-10 03:07:47', NULL),
('145282104E344', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '265.95744680851', '268.6170212766', '0.01', 250, '0.94', '140946F17B0F8', 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', '2022-09-10 03:07:50', '2022-09-10 03:07:50', 1, 1, 'completed', 'peter', 'keith', '2022-09-10 03:07:50', '2022-09-10 03:07:54', NULL),
('1544903FBFE45', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '105.26315789474', '106.31578947368', '0.01', 100, '0.95', '15879040DF0C9', 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', '2022-09-10 03:07:20', '2022-09-10 03:07:20', 1, 1, 'completed', 'raymond', 'lodza', '2022-09-10 03:07:20', '2022-09-10 03:07:23', NULL),
('163574E57720C', 'Italy', NULL, 'buy', 'USDT', 'EUR', '263.15789473684', '265.78947368421', '0.01', 200, '0.76', '1197102F9BA6B', 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', '2022-09-10 03:08:08', '2022-09-10 03:08:09', 1, 1, 'completed', 'raymond', 'jimmy', '2022-09-10 03:08:08', '2022-09-10 03:08:12', NULL),
('170051B4D8683', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', '1769785BBB5D9', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-10 03:07:38', '2022-09-10 03:07:38', 1, 1, 'completed', 'clarence', 'ross', '2022-09-10 03:07:37', '2022-09-10 03:07:41', NULL),
('183183D242A84', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '205.88235294118', '207.94117647059', '0.01', 35000, '170', '1879782B17EDC', 'algerie_poste', '{\"account_holder_name\":\"Timothy Tambo\",\"account_number\":\"22558678\",\"account_key\":\"87\"}', '2022-09-10 03:08:27', '2022-09-10 03:08:27', 1, 1, 'completed', 'peter', 'flint', '2022-09-10 03:08:26', '2022-09-10 03:08:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__transactions`
--

CREATE TABLE `__transactions` (
  `ref_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `__transactions` (`ref_code`, `session_token`, `description`, `tr_type`, `source_user_username`, `destination_user_username`, `asset_code`, `transfer_value`, `transfer_result`, `transfer_datetime`, `deleted_datetime`) VALUES
('102844D8225AE', 'TEST_SESSION', 'Asset release for trade \"183183D242A84\"', 'trade_asset_release', 'flint', 'peter', 'USDT', '205.88235294118', '[{\"user_username\":\"flint\",\"old_asset_value\":347.86679964539,\"new_asset_value\":141.98444670421},{\"user_username\":\"peter\",\"old_asset_value\":265.95744680851,\"new_asset_value\":471.83979974969}]', '2022-09-10 03:08:29', NULL),
('104286720EEBA', 'TEST_SESSION', 'Unlock asset from escrow for trade \"170051B4D8683\"', 'escrow_asset_unlock', 'escrow', 'ross', 'USDT', '214.89361702128', '[{\"user_username\":\"escrow\",\"old_asset_value\":214.89361702128,\"new_asset_value\":0},{\"user_username\":\"ross\",\"old_asset_value\":1.4893617021234,\"new_asset_value\":216.3829787234}]', '2022-09-10 03:07:38', '2022-09-10 03:07:38'),
('10647537C74BC', 'TEST_SESSION', 'Unlock asset from escrow for trade \"106736EF8C832\"', 'escrow_asset_unlock', 'escrow', 'lodza', 'USDT', '644.68085106383', '[{\"user_username\":\"escrow\",\"old_asset_value\":644.68085106383,\"new_asset_value\":0},{\"user_username\":\"lodza\",\"old_asset_value\":173.20361754758,\"new_asset_value\":817.88446861141}]', '2022-09-10 03:07:32', '2022-09-10 03:07:32'),
('1115786CE7142', 'TEST_SESSION', 'Platform charge for transaction \"190793FCA674D\"', 'platform_charge', 'keith', 'reserves', 'USDT', '1.6276041666667', '[{\"user_username\":\"keith\",\"old_asset_value\":104.92715332214,\"new_asset_value\":103.29954915547},{\"user_username\":\"reserves\",\"old_asset_value\":1606.8812989921,\"new_asset_value\":1608.5089031588}]', '2022-09-10 03:07:59', NULL),
('1126301E018C2', 'TEST_SESSION', 'Platform charge for transaction \"114744262A747\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.0526315789474', '[{\"user_username\":\"lodza\",\"old_asset_value\":969.36263210526,\"new_asset_value\":968.31000052631},{\"user_username\":\"reserves\",\"old_asset_value\":1591.0638297872,\"new_asset_value\":1592.1164613661}]', '2022-09-10 03:07:23', NULL),
('112697793B0FB', 'TEST_SESSION', 'Platform charge for transaction \"1708681DC36B9\"', 'platform_charge', 'guddaz', 'reserves', 'USDT', '1.063829787234', '[{\"user_username\":\"guddaz\",\"old_asset_value\":211.3940999466,\"new_asset_value\":210.33027015937},{\"user_username\":\"reserves\",\"old_asset_value\":1590,\"new_asset_value\":1591.0638297872}]', '2022-09-10 03:07:17', NULL),
('114744262A747', 'TEST_SESSION', 'Asset release for trade \"1544903FBFE45\"', 'trade_asset_release', 'lodza', 'raymond', 'USDT', '105.26315789474', '[{\"user_username\":\"lodza\",\"old_asset_value\":1074.62579,\"new_asset_value\":969.36263210526},{\"user_username\":\"raymond\",\"old_asset_value\":0,\"new_asset_value\":105.26315789474}]', '2022-09-10 03:07:22', NULL),
('1171768658F0F', 'TEST_SESSION', 'Platform charge for transaction \"102844D8225AE\"', 'platform_charge', 'flint', 'reserves', 'USDT', '2.0588235294118', '[{\"user_username\":\"flint\",\"old_asset_value\":141.98444670421,\"new_asset_value\":139.9256231748},{\"user_username\":\"reserves\",\"old_asset_value\":1617.132718854,\"new_asset_value\":1619.1915423834}]', '2022-09-10 03:08:30', NULL),
('117398DC0497B', 'TEST_SESSION', 'Platform charge for transaction \"147135BD5F297\"', 'platform_charge', 'ross', 'reserves', 'USDT', '2.1276595744681', '[{\"user_username\":\"ross\",\"old_asset_value\":3.61702127659,\"new_asset_value\":1.4893617021219},{\"user_username\":\"reserves\",\"old_asset_value\":1599.9888017916,\"new_asset_value\":1602.1164613661}]', '2022-09-10 03:07:41', NULL),
('118493AA3F846', 'TEST_SESSION', 'Asset release for trade \"145282104E344\"', 'trade_asset_release', 'keith', 'peter', 'USDT', '265.95744680851', '[{\"user_username\":\"keith\",\"old_asset_value\":536.30459126541,\"new_asset_value\":270.3471444569},{\"user_username\":\"peter\",\"old_asset_value\":0,\"new_asset_value\":265.95744680851}]', '2022-09-10 03:07:52', NULL),
('11880379A64E8', 'TEST_SESSION', 'Lock asset in escrow for trade \"134070CC6381A\"', 'escrow_asset_lock', 'jimmy', 'escrow', 'USDT', '204.26966292135', '[{\"user_username\":\"jimmy\",\"old_asset_value\":686.45576707724,\"new_asset_value\":482.18610415589},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":204.26966292135}]', '2022-09-10 03:08:13', '2022-09-10 03:08:15'),
('1197102F9BA6B', 'TEST_SESSION', 'Lock asset in escrow for trade \"163574E57720C\"', 'escrow_asset_lock', 'jimmy', 'escrow', 'USDT', '265.78947368421', '[{\"user_username\":\"jimmy\",\"old_asset_value\":952.24524076145,\"new_asset_value\":686.45576707724},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":265.78947368421}]', '2022-09-10 03:08:07', '2022-09-10 03:08:09'),
('122722917DC25', 'TEST_SESSION', 'Platform charge for transaction \"18373467F25F6\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '1.8421052631579', '[{\"user_username\":\"jimmy\",\"old_asset_value\":954.08734602461,\"new_asset_value\":952.24524076145},{\"user_username\":\"reserves\",\"old_asset_value\":1608.5089031588,\"new_asset_value\":1610.351008422}]', '2022-09-10 03:08:06', NULL),
('129247324D29F', 'TEST_SESSION', 'Lock asset in escrow for trade \"132497AEC255D\"', 'escrow_asset_lock', 'guddaz', 'escrow', 'USDT', '107.44680851064', '[{\"user_username\":\"guddaz\",\"old_asset_value\":317.77707867,\"new_asset_value\":210.33027015936},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":107.44680851064}]', '2022-09-10 03:07:08', '2022-09-10 03:07:14'),
('12948025373C3', 'TEST_SESSION', 'Platform charge for transaction \"1364461A25AF6\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.6315789473684', '[{\"user_username\":\"jimmy\",\"old_asset_value\":689.08734602461,\"new_asset_value\":686.45576707724},{\"user_username\":\"reserves\",\"old_asset_value\":1610.351008422,\"new_asset_value\":1612.9825873694}]', '2022-09-10 03:08:12', NULL),
('129575936DE23', 'TEST_SESSION', 'Asset release for trade \"134070CC6381A\"', 'trade_asset_release', 'jimmy', 'nassim', 'USDT', '202.24719101124', '[{\"user_username\":\"jimmy\",\"old_asset_value\":686.45576707724,\"new_asset_value\":484.208576066},{\"user_username\":\"nassim\",\"old_asset_value\":100,\"new_asset_value\":302.24719101124}]', '2022-09-10 03:08:16', NULL),
('134867C964F8D', 'TEST_SESSION', 'Unlock asset from escrow for trade \"106705164BB48\"', 'escrow_asset_unlock', 'escrow', 'jimmy', 'USDT', '186.05263157895', '[{\"user_username\":\"escrow\",\"old_asset_value\":186.05263157895,\"new_asset_value\":0},{\"user_username\":\"jimmy\",\"old_asset_value\":952.24524076145,\"new_asset_value\":1138.2978723404}]', '2022-09-10 03:08:03', '2022-09-10 03:08:03'),
('135698AEF1609', 'TEST_SESSION', 'Wallet topup using deposit token \"1794831FBC189\"', 'deposit_token_topup', 'reserves', 'keith', 'USDT', '600', '[{\"user_username\":\"reserves\",\"old_asset_value\":2890,\"new_asset_value\":2290},{\"user_username\":\"keith\",\"old_asset_value\":0,\"new_asset_value\":600}]', '2022-09-10 03:07:01', NULL),
('136260A8CB60B', 'TEST_SESSION', 'Platform charge for transaction \"192304DDDE2C1\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.4893617021277', '[{\"user_username\":\"lodza\",\"old_asset_value\":819.37383031354,\"new_asset_value\":817.88446861141},{\"user_username\":\"reserves\",\"old_asset_value\":1592.1164613661,\"new_asset_value\":1593.6058230682}]', '2022-09-10 03:07:29', NULL),
('1364461A25AF6', 'TEST_SESSION', 'Asset release for trade \"163574E57720C\"', 'trade_asset_release', 'jimmy', 'raymond', 'USDT', '263.15789473684', '[{\"user_username\":\"jimmy\",\"old_asset_value\":952.24524076145,\"new_asset_value\":689.08734602461},{\"user_username\":\"raymond\",\"old_asset_value\":105.26315789474,\"new_asset_value\":368.42105263158}]', '2022-09-10 03:08:10', NULL),
('137990492ABF9', 'TEST_SESSION', 'Lock asset in escrow for trade \"106705164BB48\"', 'escrow_asset_lock', 'jimmy', 'escrow', 'USDT', '186.05263157895', '[{\"user_username\":\"jimmy\",\"old_asset_value\":1138.2978723404,\"new_asset_value\":952.24524076145},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":186.05263157895}]', '2022-09-10 03:08:01', '2022-09-10 03:08:03'),
('138401A2AE6B9', 'TEST_SESSION', 'Lock asset in escrow for trade \"130026FB798D7\"', 'escrow_asset_lock', 'keith', 'escrow', 'USDT', '164.38802083333', '[{\"user_username\":\"keith\",\"old_asset_value\":267.68756998881,\"new_asset_value\":103.29954915548},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":164.38802083333}]', '2022-09-10 03:07:55', '2022-09-10 03:07:57'),
('1394945B53081', 'TEST_SESSION', 'Unlock asset from escrow for trade \"145282104E344\"', 'escrow_asset_unlock', 'escrow', 'keith', 'USDT', '268.6170212766', '[{\"user_username\":\"escrow\",\"old_asset_value\":268.6170212766,\"new_asset_value\":0},{\"user_username\":\"keith\",\"old_asset_value\":267.68756998881,\"new_asset_value\":536.30459126541}]', '2022-09-10 03:07:51', '2022-09-10 03:07:51'),
('140946F17B0F8', 'TEST_SESSION', 'Lock asset in escrow for trade \"145282104E344\"', 'escrow_asset_lock', 'keith', 'escrow', 'USDT', '268.6170212766', '[{\"user_username\":\"keith\",\"old_asset_value\":536.30459126541,\"new_asset_value\":267.68756998881},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":268.6170212766}]', '2022-09-10 03:07:49', '2022-09-10 03:07:51'),
('143233751DE80', 'TEST_SESSION', 'Unlock asset from escrow for trade \"130026FB798D7\"', 'escrow_asset_unlock', 'escrow', 'keith', 'USDT', '164.38802083333', '[{\"user_username\":\"escrow\",\"old_asset_value\":164.38802083333,\"new_asset_value\":0},{\"user_username\":\"keith\",\"old_asset_value\":103.29954915548,\"new_asset_value\":267.68756998881}]', '2022-09-10 03:07:57', '2022-09-10 03:07:57'),
('143854B6EDD91', 'TEST_SESSION', 'Platform charge for transaction \"168692503515C\"', 'platform_charge', 'flint', 'reserves', 'USDT', '2.1276595744681', '[{\"user_username\":\"flint\",\"old_asset_value\":349.99445921986,\"new_asset_value\":347.86679964539},{\"user_username\":\"reserves\",\"old_asset_value\":1615.0050592795,\"new_asset_value\":1617.132718854}]', '2022-09-10 03:08:24', NULL),
('146180021AD9C', 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '218.87587867', '[{\"user_username\":\"guddaz\",\"old_asset_value\":0,\"new_asset_value\":218.87587867}]', '2022-09-10 03:06:53', NULL),
('147135BD5F297', 'TEST_SESSION', 'Asset release for trade \"170051B4D8683\"', 'trade_asset_release', 'ross', 'clarence', 'USDT', '212.76595744681', '[{\"user_username\":\"ross\",\"old_asset_value\":216.3829787234,\"new_asset_value\":3.61702127659},{\"user_username\":\"clarence\",\"old_asset_value\":100,\"new_asset_value\":312.76595744681}]', '2022-09-10 03:07:39', NULL),
('1471760C5B49E', 'TEST_SESSION', 'Asset release for trade \"106736EF8C832\"', 'trade_asset_release', 'lodza', 'jimmy', 'USDT', '638.29787234043', '[{\"user_username\":\"lodza\",\"old_asset_value\":817.88446861141,\"new_asset_value\":179.58659627098},{\"user_username\":\"jimmy\",\"old_asset_value\":500,\"new_asset_value\":1138.2978723404}]', '2022-09-10 03:07:33', NULL),
('150060EA82B50', 'TEST_SESSION', 'Unlock asset from escrow for trade \"183183D242A84\"', 'escrow_asset_unlock', 'escrow', 'flint', 'USDT', '207.94117647059', '[{\"user_username\":\"escrow\",\"old_asset_value\":207.94117647059,\"new_asset_value\":0},{\"user_username\":\"flint\",\"old_asset_value\":139.9256231748,\"new_asset_value\":347.86679964539}]', '2022-09-10 03:08:27', '2022-09-10 03:08:27'),
('1517426D69492', 'TEST_SESSION', 'Wallet topup using deposit token \"112677327A9EE\"', 'deposit_token_topup', 'reserves', 'ross', 'USDT', '110', '[{\"user_username\":\"reserves\",\"old_asset_value\":3000,\"new_asset_value\":2890},{\"user_username\":\"ross\",\"old_asset_value\":0,\"new_asset_value\":110}]', '2022-09-10 03:07:00', NULL),
('15270613D281D', 'TEST_SESSION', 'Unlock asset from escrow for trade \"131289A4D4CCB\"', 'escrow_asset_unlock', 'escrow', 'flint', 'USDT', '214.89361702128', '[{\"user_username\":\"escrow\",\"old_asset_value\":214.89361702128,\"new_asset_value\":0},{\"user_username\":\"flint\",\"old_asset_value\":347.86679964539,\"new_asset_value\":562.76041666667}]', '2022-09-10 03:08:21', '2022-09-10 03:08:21'),
('153608A9CDD50', 'TEST_SESSION', 'Asset release for trade \"14314789E5A65\"', 'trade_asset_release', 'keith', 'lodza', 'USDT', '210.52631578947', '[{\"user_username\":\"keith\",\"old_asset_value\":748.93617021277,\"new_asset_value\":538.4098544233},{\"user_username\":\"lodza\",\"old_asset_value\":173.20361754758,\"new_asset_value\":383.72993333705}]', '2022-09-10 03:07:46', NULL),
('1554816D9ED62', 'TEST_SESSION', 'Unlock asset from escrow for trade \"134070CC6381A\"', 'escrow_asset_unlock', 'escrow', 'jimmy', 'USDT', '204.26966292135', '[{\"user_username\":\"escrow\",\"old_asset_value\":204.26966292135,\"new_asset_value\":0},{\"user_username\":\"jimmy\",\"old_asset_value\":482.18610415589,\"new_asset_value\":686.45576707724}]', '2022-09-10 03:08:15', '2022-09-10 03:08:15'),
('15879040DF0C9', 'TEST_SESSION', 'Lock asset in escrow for trade \"1544903FBFE45\"', 'escrow_asset_lock', 'lodza', 'escrow', 'USDT', '106.31578947368', '[{\"user_username\":\"lodza\",\"old_asset_value\":1074.62579,\"new_asset_value\":968.31000052632},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":106.31578947368}]', '2022-09-10 03:07:19', '2022-09-10 03:07:20'),
('15986323C0122', 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli Reserves Wallet.', 'internalisation', NULL, 'reserves', 'USDT', '3000', '[{\"user_username\":\"reserves\",\"old_asset_value\":0,\"new_asset_value\":3000}]', '2022-09-10 03:06:52', NULL),
('16091490865E7', 'TEST_SESSION', 'Wallet topup using deposit token \"186122D14F6F7\"', 'deposit_token_topup', 'reserves', 'nassim', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_asset_value\":1690,\"new_asset_value\":1590},{\"user_username\":\"nassim\",\"old_asset_value\":0,\"new_asset_value\":100}]', '2022-09-10 03:07:06', NULL),
('16185400D1F5F', 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'flint', 'USDT', '400', '[{\"user_username\":\"flint\",\"old_asset_value\":0,\"new_asset_value\":400}]', '2022-09-10 03:06:56', NULL),
('16461370DF285', 'TEST_SESSION', 'Platform charge for transaction \"129575936DE23\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.0224719101124', '[{\"user_username\":\"jimmy\",\"old_asset_value\":484.208576066,\"new_asset_value\":482.18610415589},{\"user_username\":\"reserves\",\"old_asset_value\":1612.9825873694,\"new_asset_value\":1615.0050592795}]', '2022-09-10 03:08:18', NULL),
('16769229B3674', 'TEST_SESSION', 'Lock asset in escrow for trade \"131289A4D4CCB\"', 'escrow_asset_lock', 'flint', 'escrow', 'USDT', '214.89361702128', '[{\"user_username\":\"flint\",\"old_asset_value\":562.76041666667,\"new_asset_value\":347.86679964539},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":214.89361702128}]', '2022-09-10 03:08:19', '2022-09-10 03:08:21'),
('168692503515C', 'TEST_SESSION', 'Asset release for trade \"131289A4D4CCB\"', 'trade_asset_release', 'flint', 'guddaz', 'USDT', '212.76595744681', '[{\"user_username\":\"flint\",\"old_asset_value\":562.76041666667,\"new_asset_value\":349.99445921986},{\"user_username\":\"guddaz\",\"old_asset_value\":210.33027015937,\"new_asset_value\":423.09622760618}]', '2022-09-10 03:08:23', NULL),
('168828297975D', 'TEST_SESSION', 'Unlock asset from escrow for trade \"136920DB01011\"', 'escrow_asset_unlock', 'escrow', 'lodza', 'USDT', '150.42553191489', '[{\"user_username\":\"escrow\",\"old_asset_value\":150.42553191489,\"new_asset_value\":0},{\"user_username\":\"lodza\",\"old_asset_value\":817.88446861142,\"new_asset_value\":968.31000052631}]', '2022-09-10 03:07:26', '2022-09-10 03:07:26'),
('169291A6D0C37', 'TEST_SESSION', 'Transfer from Ledger wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '967.86579', '[{\"user_username\":\"lodza\",\"old_asset_value\":0,\"new_asset_value\":967.86579}]', '2022-09-10 03:06:55', NULL),
('1708681DC36B9', 'TEST_SESSION', 'Asset release for trade \"132497AEC255D\"', 'trade_asset_release', 'guddaz', 'ross', 'USDT', '106.3829787234', '[{\"user_username\":\"guddaz\",\"old_asset_value\":317.77707867,\"new_asset_value\":211.3940999466},{\"user_username\":\"ross\",\"old_asset_value\":110,\"new_asset_value\":216.3829787234}]', '2022-09-10 03:07:16', NULL),
('17633425A3D7B', 'TEST_SESSION', 'Platform charge for transaction \"118493AA3F846\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.6595744680851', '[{\"user_username\":\"keith\",\"old_asset_value\":270.3471444569,\"new_asset_value\":267.68756998881},{\"user_username\":\"reserves\",\"old_asset_value\":1604.221724524,\"new_asset_value\":1606.8812989921}]', '2022-09-10 03:07:53', NULL),
('176833F0995EC', 'TEST_SESSION', 'Platform charge for transaction \"1471760C5B49E\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '6.3829787234043', '[{\"user_username\":\"lodza\",\"old_asset_value\":179.58659627098,\"new_asset_value\":173.20361754758},{\"user_username\":\"reserves\",\"old_asset_value\":1593.6058230682,\"new_asset_value\":1599.9888017916}]', '2022-09-10 03:07:35', NULL),
('1769785BBB5D9', 'TEST_SESSION', 'Lock asset in escrow for trade \"170051B4D8683\"', 'escrow_asset_lock', 'ross', 'escrow', 'USDT', '214.89361702128', '[{\"user_username\":\"ross\",\"old_asset_value\":216.3829787234,\"new_asset_value\":1.4893617021234},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":214.89361702128}]', '2022-09-10 03:07:36', '2022-09-10 03:07:38'),
('17748931858ED', 'TEST_SESSION', 'Wallet topup using deposit token \"167974E7E72B0\"', 'deposit_token_topup', 'reserves', 'clarence', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_asset_value\":1790,\"new_asset_value\":1690},{\"user_username\":\"clarence\",\"old_asset_value\":0,\"new_asset_value\":100}]', '2022-09-10 03:07:04', NULL),
('1795845A0822A', 'TEST_SESSION', 'Wallet topup using deposit token \"1289760D4AC69\"', 'deposit_token_topup', 'reserves', 'jimmy', 'USDT', '500', '[{\"user_username\":\"reserves\",\"old_asset_value\":2290,\"new_asset_value\":1790},{\"user_username\":\"jimmy\",\"old_asset_value\":0,\"new_asset_value\":500}]', '2022-09-10 03:07:03', NULL),
('181880EDBB6FF', 'TEST_SESSION', 'Transfer from Exodus wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '98.9012', '[{\"user_username\":\"guddaz\",\"old_asset_value\":218.87587867,\"new_asset_value\":317.77707867}]', '2022-09-10 03:06:57', NULL),
('182508F38EA5B', 'TEST_SESSION', 'Unlock asset from escrow for trade \"14314789E5A65\"', 'escrow_asset_unlock', 'escrow', 'keith', 'USDT', '212.63157894737', '[{\"user_username\":\"escrow\",\"old_asset_value\":212.63157894737,\"new_asset_value\":0},{\"user_username\":\"keith\",\"old_asset_value\":536.3045912654,\"new_asset_value\":748.93617021277}]', '2022-09-10 03:07:44', '2022-09-10 03:07:44'),
('18373467F25F6', 'TEST_SESSION', 'Asset release for trade \"106705164BB48\"', 'trade_asset_release', 'jimmy', 'lodza', 'USDT', '184.21052631579', '[{\"user_username\":\"jimmy\",\"old_asset_value\":1138.2978723404,\"new_asset_value\":954.08734602461},{\"user_username\":\"lodza\",\"old_asset_value\":383.72993333705,\"new_asset_value\":567.94045965284}]', '2022-09-10 03:08:04', NULL),
('1856156F01DE4', 'TEST_SESSION', 'Lock asset in escrow for trade \"14314789E5A65\"', 'escrow_asset_lock', 'keith', 'escrow', 'USDT', '212.63157894737', '[{\"user_username\":\"keith\",\"old_asset_value\":748.93617021277,\"new_asset_value\":536.3045912654},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":212.63157894737}]', '2022-09-10 03:07:43', '2022-09-10 03:07:44'),
('1860714500767', 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '106.76', '[{\"user_username\":\"lodza\",\"old_asset_value\":967.86579,\"new_asset_value\":1074.62579}]', '2022-09-10 03:06:58', NULL),
('186993515A1E1', 'TEST_SESSION', 'Unlock asset from escrow for trade \"1544903FBFE45\"', 'escrow_asset_unlock', 'escrow', 'lodza', 'USDT', '106.31578947368', '[{\"user_username\":\"escrow\",\"old_asset_value\":106.31578947368,\"new_asset_value\":0},{\"user_username\":\"lodza\",\"old_asset_value\":968.31000052632,\"new_asset_value\":1074.62579}]', '2022-09-10 03:07:20', '2022-09-10 03:07:20'),
('1879782B17EDC', 'TEST_SESSION', 'Lock asset in escrow for trade \"183183D242A84\"', 'escrow_asset_lock', 'flint', 'escrow', 'USDT', '207.94117647059', '[{\"user_username\":\"flint\",\"old_asset_value\":347.86679964539,\"new_asset_value\":139.9256231748},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":207.94117647059}]', '2022-09-10 03:08:25', '2022-09-10 03:08:27'),
('1880240DF3E67', 'TEST_SESSION', 'Platform charge for transaction \"153608A9CDD50\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.1052631578947', '[{\"user_username\":\"keith\",\"old_asset_value\":538.4098544233,\"new_asset_value\":536.30459126541},{\"user_username\":\"reserves\",\"old_asset_value\":1602.1164613661,\"new_asset_value\":1604.221724524}]', '2022-09-10 03:07:47', NULL),
('188783C2E135B', 'TEST_SESSION', 'Lock asset in escrow for trade \"106736EF8C832\"', 'escrow_asset_lock', 'lodza', 'escrow', 'USDT', '644.68085106383', '[{\"user_username\":\"lodza\",\"old_asset_value\":817.88446861141,\"new_asset_value\":173.20361754758},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":644.68085106383}]', '2022-09-10 03:07:30', '2022-09-10 03:07:32'),
('1901121188677', 'TEST_SESSION', 'Unlock asset from escrow for trade \"163574E57720C\"', 'escrow_asset_unlock', 'escrow', 'jimmy', 'USDT', '265.78947368421', '[{\"user_username\":\"escrow\",\"old_asset_value\":265.78947368421,\"new_asset_value\":0},{\"user_username\":\"jimmy\",\"old_asset_value\":686.45576707724,\"new_asset_value\":952.24524076145}]', '2022-09-10 03:08:09', '2022-09-10 03:08:09'),
('1902440F1845F', 'TEST_SESSION', 'Lock asset in escrow for trade \"136920DB01011\"', 'escrow_asset_lock', 'lodza', 'escrow', 'USDT', '150.42553191489', '[{\"user_username\":\"lodza\",\"old_asset_value\":968.31000052631,\"new_asset_value\":817.88446861142},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":150.42553191489}]', '2022-09-10 03:07:25', '2022-09-10 03:07:26'),
('1903215CD23EA', 'TEST_SESSION', 'Unlock asset from escrow for trade \"132497AEC255D\"', 'escrow_asset_unlock', 'escrow', 'guddaz', 'USDT', '107.44680851064', '[{\"user_username\":\"escrow\",\"old_asset_value\":107.44680851064,\"new_asset_value\":0},{\"user_username\":\"guddaz\",\"old_asset_value\":210.33027015936,\"new_asset_value\":317.77707867}]', '2022-09-10 03:07:14', '2022-09-10 03:07:14'),
('190793FCA674D', 'TEST_SESSION', 'Asset release for trade \"130026FB798D7\"', 'trade_asset_release', 'keith', 'flint', 'USDT', '162.76041666667', '[{\"user_username\":\"keith\",\"old_asset_value\":267.68756998881,\"new_asset_value\":104.92715332214},{\"user_username\":\"flint\",\"old_asset_value\":400,\"new_asset_value\":562.76041666667}]', '2022-09-10 03:07:58', NULL),
('192304DDDE2C1', 'TEST_SESSION', 'Asset release for trade \"136920DB01011\"', 'trade_asset_release', 'lodza', 'keith', 'USDT', '148.93617021277', '[{\"user_username\":\"lodza\",\"old_asset_value\":968.31000052631,\"new_asset_value\":819.37383031354},{\"user_username\":\"keith\",\"old_asset_value\":600,\"new_asset_value\":748.93617021277}]', '2022-09-10 03:07:28', NULL);

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
  `_status` enum('active','inactive','suspended','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__users`
--

INSERT INTO `__users` (`id`, `username`, `email_address`, `password`, `reg_token`, `avatar_image_id`, `_status`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
(1, 'system', 'system', '', NULL, NULL, 'active', '2022-09-10 05:06:06', NULL, NULL),
(2, 'escrow', 'escrow', '', NULL, NULL, 'active', '2022-09-10 05:06:06', NULL, NULL),
(3, 'developer', 'developer.ankelli@gmail.com', '$2y$10$J2aumVtOlrSu32Q0rGZGrOKmIEcR3a6Nn9PyIW27/xrHOvmvSBlKe', NULL, NULL, 'active', '2022-09-10 03:06:10', '2022-09-10 03:06:10', NULL),
(4, 'sysadmin', 'sysadmin@ankelli.com', '$2y$10$HOjtqfXRbM8sSxpr7buO1u8GuaWDTZd.fn2soRM1iOGFDKqgt/emS', NULL, NULL, 'active', '2022-09-10 03:06:11', '2022-09-10 03:06:11', NULL),
(5, 'reserves', 'reserves@ankelli.com', '$2y$10$plxD0mBGx79eN3uT3F1IIOtNN7fTWz6iPC8IbNDusJ0qNqQwCwyEm', NULL, NULL, 'active', '2022-09-10 03:06:12', '2022-09-10 03:06:12', NULL),
(6, 'busadmin', 'busadmin@ankelli.com', '$2y$10$lG9jAqFtl6oH4Isbe4WNO.dSa.s6uhN9Phzgs2ZcikC/EQJ29BPRm', NULL, NULL, 'active', '2022-09-10 03:06:13', '2022-09-10 03:06:13', NULL),
(7, 'guddaz', 'goodhopedhliwayo@gmail.com', '$2y$10$rBZlGpmXhE4BimPjQWnH9eOpSVV2siQma4XQCP.AAmFOm82y9QpI.', NULL, NULL, 'active', '2022-09-10 03:06:45', '2022-09-10 03:06:45', NULL),
(8, 'lodza', 'lodza@example.com', '$2y$10$4euuOwff1QPY7a6EIsj1m.OJ251IxvsH4QT9tZd2/Taco5ECZZdJC', NULL, NULL, 'active', '2022-09-10 03:06:46', '2022-09-10 03:06:46', NULL),
(9, 'ross', 'ross@example.com', '$2y$10$2W363PLqZY3xnRymKO5g5uBdxaYCRp5yDd.1kj0BLmX6kffizbtx2', NULL, NULL, 'active', '2022-09-10 03:06:47', '2022-09-10 03:06:47', NULL),
(10, 'jimmy', 'jimmy@example.com', '$2y$10$CL/ejZ7jqHF3p2YoFLweGu6yjeNBszxepECgJr3DYq1ctjFarGbKW', NULL, NULL, 'active', '2022-09-10 03:06:48', '2022-09-10 03:06:48', NULL),
(11, 'keith', 'keith@example.com', '$2y$10$JbLxH.lHmHpXw.Tp1/IGPeuc9SXHgmP/TOdS9RMpqVGoxjkhrCyO.', NULL, NULL, 'active', '2022-09-10 03:06:48', '2022-09-10 03:06:48', NULL),
(12, 'peter', 'peter@example.com', '$2y$10$E/iJ2E3iD26AOIK7w9qGOuW9CQkICKtN.cObJn24FZ2zxQ97lAFaS', NULL, NULL, 'active', '2022-09-10 03:06:49', '2022-09-10 03:06:49', NULL),
(13, 'flint', 'flint@example.com', '$2y$10$zdbIExrbA1vTvyDcQa6RhuSOCaZtCvBEjo2xvBAors56togfQ3/G6', NULL, NULL, 'active', '2022-09-10 03:06:49', '2022-09-10 03:06:49', NULL),
(14, 'clarence', 'clarence@example.com', '$2y$10$YhJR1r0mh9kanPQFf1LqquYbSMkbRkGl/S8bqekOKL4P5j/Byleim', NULL, NULL, 'active', '2022-09-10 03:06:50', '2022-09-10 03:06:50', NULL),
(15, 'raymond', 'raymond@example.com', '$2y$10$a07EhoTruzebTZh/PFuC9.7qWYhgfalA6DWNyrancEduKf7RM2bau', NULL, NULL, 'active', '2022-09-10 03:06:51', '2022-09-10 03:06:51', NULL),
(16, 'nassim', 'nassim@example.com', '$2y$10$2yR6rzY.MNT4eI3SVuQFuOz2JLM8qGx0/rfACjcAm.g0ffzSkTZMy', NULL, NULL, 'active', '2022-09-10 03:06:51', '2022-09-10 03:06:51', NULL);

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
(1, 'Default Users', 'default_users', 'Group for Default User accounts created on system initialization and factory_data loading. \nNew users cannot be added to this group.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(2, 'Administrators', 'administrators', 'Automatically joined group (Users with active Admin Extension). \nMembers can be added to other admin groups.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(3, 'Developers', 'developers', 'Admin group for unrestricted system users. \nMembers have access to all features and OTP access to account named \"developer\". \nOnly \"developer\" account can add members to this group.\nGroup used for System Development and Maintenance.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(4, 'System Administrators', 'system_administrators', 'Admin Group for System Administrators. \nMembers can manage system functions and sysconfig params. \nMembers have OTP access to account named \"sysadmin\".\nOnly \"sysadmin\" account can add members to this group.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(5, 'Business Administrators', 'business_administrators', 'Admin group for Business Administrators.\nMembers have access to business related features.\nMembers have OTP access to accounts named \"reserves\" and \"busadmin\".\nOnly \"busadmin\" account can add members to this group.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(6, 'User Administrators', 'user_administrators', 'Admin group for User Administrators. \nMembers can manage other users and user related queries.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(7, 'Platform moderators', 'platform_moderators', 'Group for Platform moderators. \nMembers can respond in the customer service chat module, handle flagged business elements, manage daily updates.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(8, 'Sellers', 'sellers', 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(9, 'Buyers', 'buyers', 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL),
(10, 'Beta Testers', 'beta_testers', 'User Group for selected individuals to test certain features before they are published.', 'active', 'system', '2022-09-10 05:06:08', NULL, NULL);

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
(1, 'developer', 'default_users', 'active', 'system', '2022-09-10 03:06:10', '2022-09-10 03:06:10'),
(2, 'developer', 'developers', 'active', 'system', '2022-09-10 03:06:11', '2022-09-10 03:06:11'),
(3, 'sysadmin', 'default_users', 'active', 'system', '2022-09-10 03:06:11', '2022-09-10 03:06:11'),
(4, 'sysadmin', 'system_administrators', 'active', 'system', '2022-09-10 03:06:12', '2022-09-10 03:06:12'),
(5, 'reserves', 'default_users', 'active', 'system', '2022-09-10 03:06:12', '2022-09-10 03:06:12'),
(6, 'reserves', 'business_administrators', 'active', 'system', '2022-09-10 03:06:13', '2022-09-10 03:06:13'),
(7, 'busadmin', 'default_users', 'active', 'system', '2022-09-10 03:06:13', '2022-09-10 03:06:13'),
(8, 'busadmin', 'business_administrators', 'active', 'system', '2022-09-10 03:06:14', '2022-09-10 03:06:14'),
(9, 'guddaz', 'developers', 'active', 'system', '2022-09-10 03:06:46', '2022-09-10 03:06:46'),
(10, 'lodza', 'system_administrators', 'active', 'system', '2022-09-10 03:06:47', '2022-09-10 03:06:47'),
(11, 'lodza', 'user_administrators', 'active', 'system', '2022-09-10 03:06:47', '2022-09-10 03:06:47'),
(12, 'lodza', 'business_administrators', 'active', 'system', '2022-09-10 03:06:47', '2022-09-10 03:06:47');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;

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
