-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 11, 2022 at 03:53 AM
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
(521, '2014_10_12_000000_create_users_table', 1),
(522, '2014_10_12_100000_create_password_resets_table', 1),
(523, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(524, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(525, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(526, '2016_06_01_000004_create_oauth_clients_table', 1),
(527, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(528, '2019_08_19_000000_create_failed_jobs_table', 1),
(529, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(530, '2022_07_26_072130_create___sessions_table', 1),
(531, '2022_07_26_072137_create___email_addresses_table', 1),
(532, '2022_07_26_072141_create___pref_items_table', 1),
(533, '2022_07_26_072144_create___notifications_table', 1),
(534, '2022_07_26_072147_create___verif_tokens_table', 1),
(535, '2022_07_26_072151_create___reg_tokens_table', 1),
(536, '2022_07_26_072323_create___phone_nos_table', 1),
(537, '2022_07_26_072326_create___files_table', 1),
(538, '2022_07_26_072330_create___logs_table', 1),
(539, '2022_07_26_072334_create___messages_table', 1),
(540, '2022_07_26_072335_create___assets_table', 1),
(541, '2022_07_26_072336_create___currencies_table', 1),
(542, '2022_07_26_072337_create___pymt_methods_table', 1),
(543, '2022_07_26_072341_create___exportables_table', 1),
(544, '2022_07_26_072345_create___countries_table', 1),
(545, '2022_07_26_072349_create___user_groups_table', 1),
(546, '2022_07_26_072353_create___user_group_memberships_table', 1),
(547, '2022_07_26_072356_create___permissions_table', 1),
(548, '2022_07_26_072400_create___permission_instances_table', 1),
(549, '2022_07_26_072403_create___asset_wallets_table', 1),
(550, '2022_07_26_072406_create___chats_table', 1),
(551, '2022_07_26_072410_create___deposit_tokens_table', 1),
(552, '2022_07_26_072413_create___feedback_reports_table', 1),
(553, '2022_07_26_072416_create___offers_table', 1),
(554, '2022_07_26_072421_create___pinnings_table', 1),
(555, '2022_07_26_072424_create___posts_table', 1),
(556, '2022_07_26_072427_create___transactions_table', 1),
(557, '2022_07_26_072428_create___trades_table', 1),
(558, '2022_07_26_072435_create___admin_extensions_table', 1),
(559, '2022_07_26_072438_create___buyer_extensions_table', 1),
(560, '2022_07_26_072442_create___seller_extensions_table', 1);

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
(1, NULL, 'Ankelli Personal Access Client', 'vTRoH4iLLg6vYx5fwWK9DM9cIf3QQA8BoN7eF2Xx', NULL, 'http://localhost', 1, 0, 0, '2022-09-10 23:51:28', '2022-09-10 23:51:28'),
(2, NULL, 'Ankelli Password Grant Client', 'M721y6O5RaWCrJQzdc9wxsDVpHSv3aXhvwZgTo1O', 'users', 'http://localhost', 0, 1, 0, '2022-09-10 23:51:28', '2022-09-10 23:51:28');

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
(1, 1, '2022-09-10 23:51:28', '2022-09-10 23:51:28');

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
(1, 'system', 'System', 'active', 'system', '2022-09-11 01:51:23', NULL, NULL),
(2, 'developer', 'Default Developer', 'active', 'system', '2022-09-10 23:51:25', '2022-09-10 23:51:25', NULL),
(3, 'sysadmin', 'Default System Administrator', 'active', 'system', '2022-09-10 23:51:25', '2022-09-10 23:51:25', NULL),
(4, 'reserves', 'Ankelli Asset Reserves', 'active', 'system', '2022-09-10 23:51:26', '2022-09-10 23:51:26', NULL),
(5, 'busadmin', 'Default Business Administrator', 'active', 'system', '2022-09-10 23:51:27', '2022-09-10 23:51:27', NULL),
(6, 'guddaz', 'Head System Developer', 'active', 'system', '2022-09-10 23:51:31', '2022-09-10 23:51:31', NULL),
(7, 'lodza', 'Head Business Administrator', 'active', 'system', '2022-09-10 23:51:32', '2022-09-10 23:51:32', NULL);

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
(1, NULL, NULL, 'Tether USD', 'USDT', '0.0001', 'active', 'system', '2022-09-10 23:51:24', '2022-09-10 23:51:24');

-- --------------------------------------------------------

--
-- Table structure for table `__asset_wallets`
--

CREATE TABLE `__asset_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blockchain_account_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blockchain_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blockchain_private_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tatum_derivation_key` bigint(20) UNSIGNED DEFAULT NULL,
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

INSERT INTO `__asset_wallets` (`id`, `blockchain_account_id`, `blockchain_address`, `blockchain_private_key`, `tatum_customer_id`, `tatum_derivation_key`, `user_username`, `asset_code`, `asset_value`, `_status`, `created_datetime`, `updated_datetime`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 'reserves', 'USDT', '1619.1915423834', 'active', '2022-09-10 23:51:38', '2022-09-10 23:53:21'),
(2, NULL, NULL, NULL, NULL, NULL, 'guddaz', 'USDT', '423.09622760618', 'active', '2022-09-10 23:51:39', '2022-09-10 23:53:13'),
(3, NULL, NULL, NULL, NULL, NULL, 'lodza', 'USDT', '567.94045965284', 'active', '2022-09-10 23:51:40', '2022-09-10 23:52:54'),
(4, NULL, NULL, NULL, NULL, NULL, 'flint', 'USDT', '139.9256231748', 'active', '2022-09-10 23:51:42', '2022-09-10 23:53:20'),
(5, NULL, NULL, NULL, NULL, NULL, 'ross', 'USDT', '1.4893617021219', 'active', '2022-09-10 23:51:45', '2022-09-10 23:52:30'),
(6, NULL, NULL, NULL, NULL, NULL, 'keith', 'USDT', '103.29954915547', 'active', '2022-09-10 23:51:47', '2022-09-10 23:52:49'),
(7, NULL, NULL, NULL, NULL, NULL, 'jimmy', 'USDT', '482.18610415589', 'active', '2022-09-10 23:51:49', '2022-09-10 23:53:08'),
(8, NULL, NULL, NULL, NULL, NULL, 'clarence', 'USDT', '312.76595744681', 'active', '2022-09-10 23:51:51', '2022-09-10 23:52:28'),
(9, NULL, NULL, NULL, NULL, NULL, 'nassim', 'USDT', '302.24719101124', 'active', '2022-09-10 23:51:52', '2022-09-10 23:53:07'),
(10, NULL, NULL, NULL, NULL, NULL, 'escrow', 'USDT', '0', 'active', '2022-09-10 23:51:54', '2022-09-10 23:53:18'),
(11, NULL, NULL, NULL, NULL, NULL, 'raymond', 'USDT', '368.42105263158', 'active', '2022-09-10 23:52:09', '2022-09-10 23:53:00'),
(12, NULL, NULL, NULL, NULL, NULL, 'peter', 'USDT', '471.83979974969', 'active', '2022-09-10 23:52:41', '2022-09-10 23:53:19');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-10 23:51:25', '2022-09-10 23:51:25', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-10 23:51:26', '2022-09-10 23:51:26', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-10 23:51:27', '2022-09-10 23:51:27', NULL),
(4, 'ross', 'active', 'guddaz', '2022-09-10 23:51:54', '2022-09-10 23:51:54', NULL),
(5, 'raymond', 'active', 'lodza', '2022-09-10 23:52:05', '2022-09-10 23:52:05', NULL),
(6, 'keith', 'active', 'lodza', '2022-09-10 23:52:12', '2022-09-10 23:52:12', NULL),
(7, 'jimmy', 'active', 'lodza', '2022-09-10 23:52:18', '2022-09-10 23:52:18', NULL),
(8, 'clarence', 'active', 'ross', '2022-09-10 23:52:25', '2022-09-10 23:52:25', NULL),
(9, 'lodza', 'active', 'keith', '2022-09-10 23:52:31', '2022-09-10 23:52:31', NULL),
(10, 'peter', 'active', 'keith', '2022-09-10 23:52:38', '2022-09-10 23:52:38', NULL),
(11, 'flint', 'active', 'keith', '2022-09-10 23:52:44', '2022-09-10 23:52:44', NULL),
(12, 'nassim', 'active', 'jimmy', '2022-09-10 23:53:03', '2022-09-10 23:53:03', NULL),
(13, 'guddaz', 'active', 'flint', '2022-09-10 23:53:10', '2022-09-10 23:53:10', NULL);

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
(1, 'Zimbabwe', 'ZIM', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:51:21', NULL),
(2, 'South Africa', 'RSA', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:51:21', NULL),
(3, 'United Kingdom', 'UK', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:51:21', NULL),
(4, 'United States of America', 'USA', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:51:21', NULL),
(5, 'Russia', 'RUS', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:51:21', NULL),
(6, 'China', 'CHN', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:51:21', NULL),
(7, 'Ghana', 'GHA', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:51:21', NULL),
(8, 'Botswana', 'BOT', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:51:21', NULL),
(9, 'Zambia', 'ZAM', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:51:21', NULL),
(10, 'Algeria', 'ALG', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:51:21', NULL),
(11, 'Italy', 'ITA', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:51:21', NULL),
(12, 'Nigeria', 'NIG', NULL, NULL, NULL, 'active', 'system', '2022-09-11 01:51:21', NULL);

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
(1, 'US Dollar', 'USD', '$', 1, '1', '10', '5', 'active', 'system', '2022-09-11 01:51:21', NULL),
(2, 'Euro', 'EUR', '€', 1, '0.87', '10', '5', 'active', 'system', '2022-09-11 01:51:21', NULL),
(3, 'Pound Sterling', 'GBP', '£', 1, '0.77', '10', '5', 'active', 'system', '2022-09-11 01:51:21', NULL),
(4, 'South African Rand', 'ZAR', 'R', 0, '16', '100', '100', 'active', 'system', '2022-09-11 01:51:21', NULL),
(5, 'Zambian Kwacha', 'ZMW', 'K', 0, '15', '100', '100', 'active', 'system', '2022-09-11 01:51:21', NULL),
(6, 'Algerian Dinar', 'DZD', 'DA', 0, '180', '100', '100', 'active', 'system', '2022-09-11 01:51:21', NULL),
(7, 'Zimbabwean Dollar', 'ZWL', '$', 1, '10000', '500', '5000', 'active', 'system', '2022-09-11 01:51:21', NULL);

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
('103459C439AEB', 'USDT', '500', 'USD', 501, 'lodza', '2022-09-10 23:51:49', 'jimmy', '2022-09-10 23:51:49'),
('106153E1679CE', 'USDT', '100', 'DZD', 18000, 'lodza', '2022-09-10 23:51:52', 'nassim', '2022-09-10 23:51:52'),
('1428739A7B783', 'USDT', '100', 'EUR', 93, 'lodza', '2022-09-10 23:51:50', 'clarence', '2022-09-10 23:51:51'),
('1756476A491C8', 'USDT', '110', 'USD', 111, 'lodza', '2022-09-10 23:51:45', 'ross', '2022-09-10 23:51:45'),
('180824879479F', 'USDT', '600', 'USD', 601, 'lodza', '2022-09-10 23:51:47', 'keith', '2022-09-10 23:51:47');

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
(1, 'developer.ankelli@gmail.com', 'developer', '2022-09-10 23:51:24', NULL),
(2, 'sysadmin@ankelli.com', 'sysadmin', '2022-09-10 23:51:25', NULL),
(3, 'reserves@ankelli.com', 'reserves', '2022-09-10 23:51:26', NULL),
(4, 'busadmin@ankelli.com', 'busadmin', '2022-09-10 23:51:27', NULL),
(5, 'goodhopedhliwayo@gmail.com', 'guddaz', '2022-09-10 23:51:31', NULL),
(6, 'lodza@example.com', 'lodza', '2022-09-10 23:51:32', NULL),
(7, 'ross@example.com', 'ross', '2022-09-10 23:51:33', NULL),
(8, 'jimmy@example.com', 'jimmy', '2022-09-10 23:51:33', NULL),
(9, 'keith@example.com', 'keith', '2022-09-10 23:51:34', NULL),
(10, 'peter@example.com', 'peter', '2022-09-10 23:51:35', NULL),
(11, 'flint@example.com', 'flint', '2022-09-10 23:51:35', NULL),
(12, 'clarence@example.com', 'clarence', '2022-09-10 23:51:36', NULL),
(13, 'raymond@example.com', 'raymond', '2022-09-10 23:51:37', NULL),
(14, 'nassim@example.com', 'nassim', '2022-09-10 23:51:37', NULL);

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
(1, '__pymt_methods', 'cash_in_person', 'images', 'pymt_method_icon', 'Cash in person', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Cash in person.jpg', 'image/jpg', NULL, 'Cash in person.jpg', NULL, 'system', '2022-09-10 23:51:21', NULL),
(2, '__pymt_methods', 'stanbic_bank', 'images', 'pymt_method_icon', 'Stanbic Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Stanbic bank.jpg', 'image/jpg', NULL, 'Stanbic Bank Icon.jpg', NULL, 'system', '2022-09-10 23:51:21', NULL),
(3, '__pymt_methods', 'fnb_bank', 'images', 'pymt_method_icon', 'FNB Bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FNB bank.png', 'image/png', NULL, 'FNB Bank Icon.png', NULL, 'system', '2022-09-10 23:51:21', NULL),
(4, '__pymt_methods', 'mukuru', 'images', 'pymt_method_icon', 'Mukuru Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mukuru.jpg', 'image/jpg', NULL, 'Mukuru Icon.jpg', NULL, 'system', '2022-09-10 23:51:21', NULL),
(5, '__pymt_methods', 'algerie_poste', 'images', 'pymt_method_icon', 'Algerie poste Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Algerie poste.jpg', 'image/jpg', NULL, 'Algerie poste Icon.jpg', NULL, 'system', '2022-09-10 23:51:21', NULL),
(6, '__pymt_methods', 'mtn_momo', 'images', 'pymt_method_icon', 'MTN MOMO Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/MTN MOMO.png', 'image/png', NULL, 'MTN MOMO Icon.png', NULL, 'system', '2022-09-10 23:51:21', NULL),
(7, '__pymt_methods', 'ecocash', 'images', 'pymt_method_icon', 'Ecocash Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Ecocash.png', 'image/png', NULL, 'Ecocash Icon.png', NULL, 'system', '2022-09-10 23:51:21', NULL),
(8, '__pymt_methods', 'paypal', 'images', 'pymt_method_icon', 'Paypal Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Paypal.png', 'image/png', NULL, 'Paypal Icon.png', NULL, 'system', '2022-09-10 23:51:21', NULL),
(9, '__pymt_methods', 'skrill', 'images', 'pymt_method_icon', 'Skrill Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Skrill.jpg', 'image/jpg', NULL, 'Skrill Icon.jpg', NULL, 'system', '2022-09-10 23:51:21', NULL),
(10, '__pymt_methods', 'world_remit', 'images', 'pymt_method_icon', 'World Remit Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/World Remit.png', 'image/png', NULL, 'World Remit Icon.png', NULL, 'system', '2022-09-10 23:51:21', NULL),
(11, '__pymt_methods', 'mastercard', 'images', 'pymt_method_icon', 'Mastercard Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Mastercard.jpeg', 'image/jpeg', NULL, 'Mastercard Icon.jpeg', NULL, 'system', '2022-09-10 23:51:21', NULL),
(12, '__pymt_methods', 'visa', 'images', 'pymt_method_icon', 'Visa Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/Visa.jpg', 'image/jpg', NULL, 'Visa Icon.jpg', NULL, 'system', '2022-09-10 23:51:21', NULL),
(13, '__pymt_methods', 'fbc_bank', 'images', 'pymt_method_icon', 'FBC bank Icon', NULL, NULL, 'https://ankelli.test//storage/images/pymt_methods/FBC bank.jpg', 'image/jpg', NULL, 'FBC bank Icon.jpg', NULL, 'system', '2022-09-10 23:51:21', NULL);

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
('0HjDTkAMWNI6qkXX', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:46', NULL, NULL, '__messages', '199762E4BE1E6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('0N1mSZwT698F7PkF', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 23:51:47', NULL, NULL, '__deposit_tokens', '180824879479F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('0PRVUBZH0QNNjlZM', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:52', NULL, NULL, '__messages', '19658108972DA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('0RewAg0JqXhhoBCJ', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:51:27', NULL, NULL, '__buyer_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('0WxOQWeYEJRElzMQ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:53:13', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":210.33027015937,\"new_value\":423.09622760618}]', '{\"ip\":\"127.0.0.1\"}'),
('0XrzIm1lPchMFEg7', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:51:39', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":218.87587867}]', '{\"ip\":\"127.0.0.1\"}'),
('11v094qoQxDbvwsN', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:51:53', NULL, NULL, '__asset_wallets', '9', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('1CCAygGqSEP0YgcQ', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'ross', '2022-09-10 23:51:46', NULL, NULL, '__deposit_tokens', '1756476A491C8', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:51:45\"}]', '{\"ip\":\"127.0.0.1\"}'),
('1Cegx5msbCRevXWG', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:52:30', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1599.9888017916,\"new_value\":1602.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('1IPPPK1G6JvdZFaT', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'raymond', '2022-09-10 23:52:09', NULL, NULL, '__asset_wallets', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('1KFAjJdB2ggQ0Skr', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:52:21', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":173.20361754758,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('1mN65K29AbRCfTZN', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'clarence', '2022-09-10 23:52:30', NULL, NULL, '__trades', '190093E8C5834', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:27\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('1PppHum1XKBVt4A0', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:53:05', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":204.26966292135,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('1ScXb2B4rM6S2igp', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 23:51:45', NULL, NULL, '__deposit_tokens', '1756476A491C8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('1y9LUnJqHiKzGSTg', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'flint', '2022-09-10 23:53:10', NULL, NULL, '__seller_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('23RUA0ABgFkJaKaO', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:52:59', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":686.45576707724,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('27tf1e5hBKspxPDM', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:23', NULL, NULL, '__messages', '1849102C4A47F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('29Ky2lOsWqjRMQeT', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:34', NULL, '104011F5D693E', '__notifications', '101136CAD38F2', NULL, NULL),
('2FrLcYQxMEMVzIvi', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:31', NULL, '1069722DC1FB6', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('2mzI1b3f5h7DrLCP', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:53:02', NULL, NULL, '__messages', '1188774C09C2D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('2rErIhItsFZctotM', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:25', NULL, '135795688096F', '__users', 'sysadmin', NULL, NULL),
('3BxbqKh4uSk1u3d2', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:51:43', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":218.87587867,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('3EDV0qM8xhJfQww8', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-10 23:52:00', NULL, NULL, '__messages', '11926952D58F7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('3kYfpLADQLknsBAJ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:53:18', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":207.94117647059,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('3Oat8WdLeeyvl7vg', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-10 23:52:38', NULL, NULL, '__buyer_extensions', 'peter', NULL, '{\"ip\":\"127.0.0.1\"}'),
('3q5tyM1TMT5ZPhOU', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:33', NULL, NULL, '__messages', '155607B18C9CB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('3VfFgWtcTFB7CiXK', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:37', NULL, '169722E654D45', '__users', 'raymond', NULL, NULL),
('3wJ7Upnc7OpeKF9M', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:58', NULL, NULL, '__messages', '1630816A9500A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('44doRJhjk3PKAc0w', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:20', NULL, NULL, '__messages', '1024698504367', NULL, '{\"ip\":\"127.0.0.1\"}'),
('45tOrlADATptwR1L', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:27', NULL, '1851195EF4771', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('4dAdzVHW7tU6WLp8', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:33', NULL, NULL, '__trades', '159801AF97645', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:33\"}]', '{\"ip\":\"127.0.0.1\"}'),
('4FIrx74I833sr0GJ', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:51:28', NULL, NULL, '__seller_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('4hw5U4Ew3RCdlxZT', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:31', NULL, '1069722DC1FB6', '__notifications', '1290855D29AA1', NULL, NULL),
('4Ii9nloh6nGrnI0Y', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:53:21', NULL, NULL, '__messages', '17149959FAE03', NULL, '{\"ip\":\"127.0.0.1\"}'),
('54igrib1N24ygkEU', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'peter', '2022-09-10 23:52:43', NULL, NULL, '__trades', '194032D384C42', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"peter\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:40\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('59yR1WGF2wnObLJ1', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:52:05', NULL, NULL, '__offers', '1130194567AFC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('5Eq1mpqRkBEmzfGW', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:26', NULL, '19600065996DA', '__email_addresses', 'reserves@ankelli.com', NULL, NULL),
('5FKIOzHYPxihDe80', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:17', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1592.1164613661,\"new_value\":1593.6058230682}]', '{\"ip\":\"127.0.0.1\"}'),
('5FnmEN6OQsWgEjb3', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'ross', '2022-09-10 23:51:54', NULL, NULL, '__offers', '17364922B6B1A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('5JW8b9mHQIN9QbFQ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:14', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":150.42553191489,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('5JzdxGYmeUPxbvV7', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:46', NULL, NULL, '__messages', '131021161A64D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('624AgM4ZC9exfLBL', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:38', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":268.6170212766}]', '{\"ip\":\"127.0.0.1\"}'),
('62KUPCIIGIlSBTbJ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:16', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":600,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('64CWSgWQsEk98r5Q', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-10 23:52:39', NULL, NULL, '__trades', '194032D384C42', NULL, '{\"ip\":\"127.0.0.1\"}'),
('64OGzu8pUsDevK82', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:31', NULL, '1069722DC1FB6', '__users', 'guddaz', NULL, NULL),
('6gPNcDegOsjcnbEG', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:53:00', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":952.24524076145,\"new_value\":689.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('6l2TNMbnUL0uvMcw', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:51:49', NULL, NULL, '__deposit_tokens', '103459C439AEB', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:51:49\"}]', '{\"ip\":\"127.0.0.1\"}'),
('6OhcrOYeQVeUNr9Z', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:43', NULL, NULL, '__messages', '107424363B712', NULL, '{\"ip\":\"127.0.0.1\"}'),
('6OYGlm3FhK5xRHuA', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:52:04', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":211.3940999466,\"new_value\":210.33027015937}]', '{\"ip\":\"127.0.0.1\"}'),
('6uUJELwNduEmxOxE', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:39', NULL, NULL, '__messages', '14391962F9BFC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('70hYkINa6ssGb2YM', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:52:48', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":267.68756998881,\"new_value\":104.92715332214}]', '{\"ip\":\"127.0.0.1\"}'),
('741g81TOcUMXovjD', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:34', NULL, '104011F5D693E', '__users', 'keith', NULL, NULL),
('7BVzdToyJaJTkv7N', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:51:56', NULL, NULL, '__messages', '165082979D337', NULL, '{\"ip\":\"127.0.0.1\"}'),
('7H1BwBhHdgJO3Slg', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:51:55', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":107.44680851064}]', '{\"ip\":\"127.0.0.1\"}'),
('7reGYByDuUVB7Amy', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:52:22', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":817.88446861141,\"new_value\":179.58659627098}]', '{\"ip\":\"127.0.0.1\"}'),
('7U0TPMfyFUrzvbWO', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:51:27', NULL, NULL, '__user_group_memberships', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('82a13XCfGE1vnmgq', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'ross', '2022-09-10 23:52:25', NULL, NULL, '__seller_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('8H2eEQzNUwAtrxIz', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:52:51', NULL, NULL, '__seller_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('8mX1QDHkLQD6aIZb', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:52:59', NULL, NULL, '__trades', '168315C0AED97', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:58\"}]', '{\"ip\":\"127.0.0.1\"}'),
('8nFd3SFLTMo5Uf2k', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:14', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":817.88446861142,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('8oiDPudgy9P39fS9', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:52', NULL, NULL, '__messages', '18711363E22E8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('8u3cPLeQ5TZ00moK', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:51:56', NULL, NULL, '__trades', '158114D8EB87D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('90j7KJGGwlvzdvaV', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:26', NULL, '19600065996DA', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('91qNXAxWiCxfIuR7', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:14', NULL, NULL, '__messages', '1554010ACFF03', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9ALMMoFnOQRAgggY', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'clarence', '2022-09-10 23:52:25', NULL, NULL, '__offers', '11823433D6AA3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('9CZGac0NDydCel5c', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:36', NULL, '16039131A62E8', '__email_addresses', 'clarence@example.com', NULL, NULL),
('9FtAGXQv8pqjhMi2', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-10 23:53:18', NULL, NULL, '__trades', '106908FB3BEF5', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:53:17\"}]', '{\"ip\":\"127.0.0.1\"}'),
('9kyEDNYR0X0c5o3K', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-10 23:53:11', NULL, NULL, '__trades', '133656C006547', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:53:11\"}]', '{\"ip\":\"127.0.0.1\"}'),
('ACQBGX9lnLNbLYs6', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'flint', '2022-09-10 23:52:44', NULL, NULL, '__offers', '18794414487A7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('AdJpbV4LDftvfhsl', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:06', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":1074.62579,\"new_value\":968.31000052632}]', '{\"ip\":\"127.0.0.1\"}'),
('adk3uToJqkZMMGFX', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:53:19', NULL, NULL, '__asset_wallets', '12', '[{\"field_name\":\"asset_value\",\"old_value\":265.95744680851,\"new_value\":471.83979974969}]', '{\"ip\":\"127.0.0.1\"}'),
('aEjG6uAbzEcC5Inq', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-10 23:52:20', NULL, NULL, '__trades', '1110529CCFB75', NULL, '{\"ip\":\"127.0.0.1\"}'),
('AFxPsilfJyN6EyQP', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:51:49', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":500}]', '{\"ip\":\"127.0.0.1\"}'),
('AlKZovRP8ES92MSL', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:33', NULL, '144866EBA4051', '__email_addresses', 'ross@example.com', NULL, NULL),
('AOLOBnOawzTsEdCI', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:53:01', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":689.08734602461,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('AtiJiz9ZbuTo0xpN', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-10 23:52:06', NULL, NULL, '__buyer_extensions', 'raymond', NULL, '{\"ip\":\"127.0.0.1\"}'),
('aZSQKNwaxcwWKO9y', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'reserves', '2022-09-10 23:51:38', NULL, NULL, '__asset_wallets', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('b2mJt1YCUiWvcdCb', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:51:44', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":967.86579,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}'),
('BD83QF3PemSQNp3t', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:36', NULL, '127615E91870F', '__notifications', '133261591704F', NULL, NULL),
('bg9mMGi9tAqAZB0Q', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:27', NULL, '1851195EF4771', '__users', 'busadmin', NULL, NULL),
('bHaOEwdsYH73qx8i', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:33', NULL, NULL, '__messages', '189813904657E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('BiuoNmFSeWzHufwV', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:36', NULL, '127615E91870F', '__email_addresses', 'flint@example.com', NULL, NULL),
('bk3qY9SGpjGaEGAl', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:51:51', NULL, NULL, '__asset_wallets', '8', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":100}]', '{\"ip\":\"127.0.0.1\"}'),
('bKB7Hkk8wwXLnIYp', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:34', NULL, '151449C5DED6C', '__notifications', '1632075263874', NULL, NULL),
('BqMbx2r9S4xv5Kpd', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:52:25', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":214.89361702128}]', '{\"ip\":\"127.0.0.1\"}'),
('bvz5ga67XPriZrI3', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:53:15', NULL, NULL, '__trades', '133656C006547', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"guddaz\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:53:11\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('Bxq4UUNj0KNZ5CWE', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 23:51:51', NULL, NULL, '__deposit_tokens', '1428739A7B783', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ByEBGuVsoL2sksvu', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:07', NULL, NULL, '__messages', '1111243925F75', NULL, '{\"ip\":\"127.0.0.1\"}'),
('bzA0JiOtljtNhu4w', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:54', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":1138.2978723404,\"new_value\":954.08734602461}]', '{\"ip\":\"127.0.0.1\"}'),
('C057iT3L7bdeLAfG', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:51:56', NULL, NULL, '__messages', '12359937B3AF5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('c3H3DsbYSHV6nOow', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:53:16', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":207.94117647059}]', '{\"ip\":\"127.0.0.1\"}'),
('CCHN7wisAJX3kKll', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:33', NULL, '144866EBA4051', '__notifications', '188672D67403E', NULL, NULL),
('cDcUGV1vBwxuVpCG', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:53:18', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":139.9256231748,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('CdDMzn4rm7wFH1tZ', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:56', NULL, NULL, '__trades', '195557539EDF6', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:52\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('Ce0CAQX0ce01yBgD', 'TEST_SESSION', 'Resetting to default value.', 'entry_update', 'peter', '2022-09-10 23:53:22', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Resetting to default value.\"},{\"field_name\":\"value\",\"old_value\":\"0\",\"new_value\":true}]', '{\"ip\":\"127.0.0.1\"}'),
('CEphGqn87ypXPCG6', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:52:43', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":270.3471444569,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('CEZ8DNpl7k0HI4Pr', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'ross', '2022-09-10 23:51:46', NULL, NULL, '__asset_wallets', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Cf50UMrELZu9cUKo', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:53:03', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":204.26966292135}]', '{\"ip\":\"127.0.0.1\"}'),
('Cr6OyeTveH7gAA04', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:52:57', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":952.24524076145,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('cSjl2a2CBvHmf1Sr', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:52:01', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":107.44680851064,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('D9nmoMpSXXvA5wnU', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:53:02', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1610.351008422,\"new_value\":1612.9825873694}]', '{\"ip\":\"127.0.0.1\"}'),
('ddpr7N2Rnv0FNqjn', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:52:11', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1591.0638297872,\"new_value\":1592.1164613661}]', '{\"ip\":\"127.0.0.1\"}'),
('dEDDxN7kxtdZnvbn', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:51:32', NULL, NULL, '__user_group_memberships', '11', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dhzLTwwVzrHuK3bt', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:20', NULL, NULL, '__trades', '1110529CCFB75', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:20\"}]', '{\"ip\":\"127.0.0.1\"}'),
('Dp5fIFyWMWf1OhGx', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:52:04', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1590,\"new_value\":1591.0638297872}]', '{\"ip\":\"127.0.0.1\"}'),
('dqemWk1OE6tpdGRS', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'flint', '2022-09-10 23:53:10', NULL, NULL, '__buyer_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('DTHIQ2birUcAFYxR', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-10 23:52:31', NULL, NULL, '__buyer_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('DTs5e5fnwB7sPqpd', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:51:25', NULL, NULL, '__user_group_memberships', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dVav2GVj8pLeWM8A', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:34', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":536.3045912654,\"new_value\":748.93617021277}]', '{\"ip\":\"127.0.0.1\"}'),
('Dvpw5lbdIn0IncFp', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-10 23:52:07', NULL, NULL, '__trades', '188043A16BD39', NULL, '{\"ip\":\"127.0.0.1\"}'),
('dvr0ETRD3IFmHzaE', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:38', NULL, '126092D1E6525', '__notifications', '1710226CA94F7', NULL, NULL),
('E0wKO9m5CJL0ld4s', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'lodza', '2022-09-10 23:51:40', NULL, NULL, '__asset_wallets', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('E4YWzgPLB57Vcmuv', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:51:25', NULL, NULL, '__user_group_memberships', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('eAs3QyzevXJCnvjF', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:51:42', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":400}]', '{\"ip\":\"127.0.0.1\"}'),
('EdsbsduviQ7E3uxi', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:14', NULL, NULL, '__trades', '106468989069E', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:14\"}]', '{\"ip\":\"127.0.0.1\"}'),
('EF0ACdWjiRBnew0t', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:33', NULL, '144866EBA4051', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('eM0scLMMSBMuLnJT', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:52:08', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":106.31578947368,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('eOTHsI6icPfWgIFI', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:52:43', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1604.221724524,\"new_value\":1606.8812989921}]', '{\"ip\":\"127.0.0.1\"}'),
('eqSgIurFXAW1Sf5f', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:25', NULL, '135795688096F', '__notifications', '162315BB38ABC', NULL, NULL),
('eUMvtYFfRuaW1Mvf', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:52:01', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":210.33027015936,\"new_value\":317.77707867}]', '{\"ip\":\"127.0.0.1\"}'),
('eVVpldSq3szkcSJZ', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:36', NULL, '16039131A62E8', '__users', 'clarence', NULL, NULL),
('ex8853v8jvO9ALSn', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:45', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":164.38802083333}]', '{\"ip\":\"127.0.0.1\"}'),
('EXOQExzP7cHqaYi6', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:53:05', NULL, NULL, '__trades', '138601EB0FDA3', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:53:05\"}]', '{\"ip\":\"127.0.0.1\"}'),
('f7NLvajIBPP4ZRC1', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:14', NULL, NULL, '__messages', '14489942329B3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('f7qgf3pfIrhLhLo8', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:53:05', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":482.18610415589,\"new_value\":686.45576707724}]', '{\"ip\":\"127.0.0.1\"}'),
('F9DMBQc3SaORIGwQ', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:51:32', NULL, NULL, '__admin_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fBQlapiZYSNzI3Kn', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:32', NULL, '146027061263E', '__email_addresses', 'lodza@example.com', NULL, NULL),
('FChzWQGNoTRKBjzz', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:34', NULL, '151449C5DED6C', '__email_addresses', 'jimmy@example.com', NULL, NULL),
('fGQY3A4xwZ6afK34', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:19', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":817.88446861141,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('fiXqlXa0Yfv1EBWe', 'FACTORY_SESSION', 'Resetting to default value.', 'entry_update', 'system', '2022-09-10 23:51:28', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Resetting to default value.\"},{\"field_name\":\"value\",\"old_value\":\"0\",\"new_value\":true}]', '{\"ip\":\"127.0.0.1\"}'),
('fKDpYu5lHyAnuOtB', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'keith', '2022-09-10 23:51:47', NULL, NULL, '__asset_wallets', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fLHA07JGEYBxW8HC', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:52:09', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":1074.62579,\"new_value\":969.36263210526}]', '{\"ip\":\"127.0.0.1\"}'),
('FnWrO8qfBZHZaZuD', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-10 23:52:33', NULL, NULL, '__trades', '159801AF97645', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fokMVqHpwYkGQJTt', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:53', NULL, NULL, '__messages', '1767452E584A0', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fPtE0DwZVycEeR2Y', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:36', NULL, '16039131A62E8', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('FQ2SI7ly8fIR4dJh', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:55', NULL, NULL, '__messages', '19350826F3F10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('fr14u5Ogjt5Y6yyY', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:52:58', NULL, NULL, '__trades', '168315C0AED97', NULL, '{\"ip\":\"127.0.0.1\"}'),
('FRqWjgMv52AQYA9C', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:36', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1602.1164613661,\"new_value\":1604.221724524}]', '{\"ip\":\"127.0.0.1\"}'),
('fV1X83e9pFg1Lyyf', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:52:08', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":968.31000052632,\"new_value\":1074.62579}]', '{\"ip\":\"127.0.0.1\"}'),
('FvbXJTizSohFbT5f', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:06', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":106.31578947368}]', '{\"ip\":\"127.0.0.1\"}'),
('g1NJmYbBCj3W4d7K', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:32', NULL, '146027061263E', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('g2w1uUXKVAkZpIdf', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:51:26', NULL, NULL, '__seller_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('g4vS1feCMPAtM97T', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:51:54', NULL, NULL, '__buyer_extensions', 'ross', NULL, '{\"ip\":\"127.0.0.1\"}'),
('G8e2AAmlBnOxlj0w', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:53:10', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":562.76041666667,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('Ga3lUOzI1D8xd22x', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:07', NULL, NULL, '__trades', '188043A16BD39', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:07\"}]', '{\"ip\":\"127.0.0.1\"}'),
('GdY3WXsxKb9TQtP6', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:25', NULL, '135795688096F', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('gmsQuf9yNDa9GNZ0', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-10 23:52:04', NULL, NULL, '__trades', '158114D8EB87D', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:01\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('GncYdO9w54oG0DRw', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:53:05', NULL, NULL, '__messages', '1224788CA144F', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GqfEPVQaMa2WsYFI', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:51:49', NULL, NULL, '__asset_wallets', '7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('GQV08RRnor3uwR6G', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:52:27', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":214.89361702128,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('GxYabdt09HlRpGtJ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:53', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":186.05263157895,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('HAmgBTyPvvPEUXPd', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:51:51', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1790,\"new_value\":1690}]', '{\"ip\":\"127.0.0.1\"}'),
('hB9xUsviajxOqnWM', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:40', NULL, NULL, '__trades', '194032D384C42', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:39\"}]', '{\"ip\":\"127.0.0.1\"}'),
('HC7Fu9LytGLeqRST', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:31', NULL, '1069722DC1FB6', '__email_addresses', 'goodhopedhliwayo@gmail.com', NULL, NULL),
('HddMKpMHYw39zsGu', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:52:22', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":500,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('HK34K2sD278Rbm44', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:51:39', NULL, NULL, '__asset_wallets', '2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('HkvDGj3afGSU25PR', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'flint', '2022-09-10 23:51:42', NULL, NULL, '__asset_wallets', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hnhjB1qIjl0WBG6o', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:34', NULL, '104011F5D693E', '__email_addresses', 'keith@example.com', NULL, NULL),
('hoMcRBSzYY0UJbNd', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:53:20', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":141.98444670421,\"new_value\":139.9256231748}]', '{\"ip\":\"127.0.0.1\"}'),
('HROcLAudiGC48umK', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:46', NULL, NULL, '__trades', '1974446B1DF16', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:46\"}]', '{\"ip\":\"127.0.0.1\"}'),
('HSb1LvYNfvqGEsAK', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'keith', '2022-09-10 23:52:44', NULL, NULL, '__buyer_extensions', 'flint', NULL, '{\"ip\":\"127.0.0.1\"}'),
('hvqIiDr6xtyMzDqj', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'keith', '2022-09-10 23:51:48', NULL, NULL, '__deposit_tokens', '180824879479F', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:51:47\"}]', '{\"ip\":\"127.0.0.1\"}'),
('i7GQZgdRh8X82PjG', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:51:57', NULL, NULL, '__messages', '194047DD07BDD', NULL, '{\"ip\":\"127.0.0.1\"}'),
('i7RcS3CyJ0wDJH8E', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:32', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":212.63157894737}]', '{\"ip\":\"127.0.0.1\"}'),
('iCiBtJfllpOPhHPO', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:37', NULL, '169722E654D45', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('iCtUk7q89aKSsLsy', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:51:47', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":2890,\"new_value\":2290}]', '{\"ip\":\"127.0.0.1\"}'),
('ii3CmVNsoWP6FnQN', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:51:57', NULL, NULL, '__trades', '158114D8EB87D', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"guddaz\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:51:57\"}]', '{\"ip\":\"127.0.0.1\"}'),
('ILVJNonTRdcxki4a', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:59', NULL, NULL, '__messages', '17572503815BC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('io8SJkPvpubKToqt', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:53:05', NULL, NULL, '__messages', '1335319A15EED', NULL, '{\"ip\":\"127.0.0.1\"}'),
('IQkcXXohAga8AIL7', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'lodza', '2022-09-10 23:52:05', NULL, NULL, '__seller_extensions', 'lodza', NULL, '{\"ip\":\"127.0.0.1\"}'),
('iwUXd8mbcaXVjOQq', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:35', NULL, '127615E91870F', '__users', 'flint', NULL, NULL),
('IxmIhOEPqe4zJNYZ', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:37', NULL, '126092D1E6525', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('iYqz3VmQ1ATGxIDq', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:52:41', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":536.30459126541,\"new_value\":270.3471444569}]', '{\"ip\":\"127.0.0.1\"}'),
('IzfjwVOFEJvHAniH', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:26', NULL, '19600065996DA', '__notifications', '1022677003E9A', NULL, NULL),
('j4m20s1dT9CEjxLc', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:20', NULL, NULL, '__messages', '1281843045D57', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Jcvmm5iG1KqeKbsk', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:35', NULL, '132216776605A', '__notifications', '15683205E8B88', NULL, NULL),
('JfoBSffcPqKMJPAW', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:24', NULL, '129687673AE5E', '__email_addresses', 'developer.ankelli@gmail.com', NULL, NULL),
('jg6Db4ix28evbkQt', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:52:48', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":400,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('JHZHb4kjw9T95RUE', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'flint', '2022-09-10 23:53:17', NULL, NULL, '__trades', '106908FB3BEF5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('jIm7vUjYrKPecXVu', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'peter', '2022-09-10 23:52:38', NULL, NULL, '__offers', '1817960CBA7D4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('JJ79nPopsknGEW5v', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'peter', '2022-09-10 23:53:21', NULL, NULL, '__trades', '106908FB3BEF5', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"peter\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:53:18\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('jj8s1A6vF8VxYon9', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-10 23:52:31', NULL, NULL, '__offers', '105619D21D045', NULL, '{\"ip\":\"127.0.0.1\"}'),
('JszJltXPEBja7Zvl', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:54', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":383.72993333705,\"new_value\":567.94045965284}]', '{\"ip\":\"127.0.0.1\"}'),
('Jxq1yaAlmIhSfe0Y', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:34', NULL, '104011F5D693E', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('JXZODpDDCa7olbqS', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:52:49', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1606.8812989921,\"new_value\":1608.5089031588}]', '{\"ip\":\"127.0.0.1\"}'),
('kguF2oGvgdoZ66Aw', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:51:25', NULL, NULL, '__admin_extensions', 'developer', NULL, '{\"ip\":\"127.0.0.1\"}'),
('kHXY7bCuVBrjYgmG', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'peter', '2022-09-10 23:53:16', NULL, NULL, '__offers', '18581765B9E3D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('knHkl7J8j1lSqPpy', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'nassim', '2022-09-10 23:51:53', NULL, NULL, '__asset_wallets', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('KUdmVnHlUkc9YP4v', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'ross', '2022-09-10 23:52:27', NULL, NULL, '__trades', '190093E8C5834', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"ross\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:26\"}]', '{\"ip\":\"127.0.0.1\"}'),
('kveKMk18EccMUra3', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:27', NULL, '1851195EF4771', '__notifications', '165426777CC1E', NULL, NULL);
INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('kYKHWacM9wrmbHYl', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:52:46', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":164.38802083333,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('lBmUYQmLesf6PWbW', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'ross', '2022-09-10 23:52:26', NULL, NULL, '__trades', '190093E8C5834', NULL, '{\"ip\":\"127.0.0.1\"}'),
('lCMeFuwHTbKgDjOR', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:51:25', NULL, NULL, '__admin_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('LCwE8maCZWixOyGc', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:33', NULL, NULL, '__messages', '183468E1F7407', NULL, '{\"ip\":\"127.0.0.1\"}'),
('lCzewOhoH3VLqVxk', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'ross', '2022-09-10 23:52:01', NULL, NULL, '__messages', '198573FD9117C', NULL, '{\"ip\":\"127.0.0.1\"}'),
('LD1FZ9ekwIp3DQ5Q', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'keith', '2022-09-10 23:52:12', NULL, NULL, '__offers', '109086BABECD4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('le5K5tor0cQ9QC6O', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'nassim', '2022-09-10 23:53:03', NULL, NULL, '__offers', '18231470B0174', NULL, '{\"ip\":\"127.0.0.1\"}'),
('lfZsNMcgY1aFNPjd', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:53:08', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1612.9825873694,\"new_value\":1615.0050592795}]', '{\"ip\":\"127.0.0.1\"}'),
('lGU8HYrwGvyBJkz4', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:51:52', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1690,\"new_value\":1590}]', '{\"ip\":\"127.0.0.1\"}'),
('lkpkzmZwoRw2hqeg', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:08', NULL, NULL, '__messages', '137063A3369EC', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ll6iXISZZ7GItJKM', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:40', NULL, NULL, '__messages', '17533078F1799', NULL, '{\"ip\":\"127.0.0.1\"}'),
('lLiXLdLzmLNbnlwJ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:53:10', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":214.89361702128}]', '{\"ip\":\"127.0.0.1\"}'),
('LpIkLfFQpWizONvy', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:20', NULL, NULL, '__messages', '149268F3955D8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('LTeZ0yldFGSpr8b8', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:19', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":644.68085106383}]', '{\"ip\":\"127.0.0.1\"}'),
('lTIOA0AsU0fi1srA', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:52:41', NULL, NULL, '__asset_wallets', '12', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":265.95744680851}]', '{\"ip\":\"127.0.0.1\"}'),
('LUQfXhutR8LNBCu6', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:38', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":536.30459126541,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('LyN4512ZalWbOo3l', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:26', NULL, NULL, '__messages', '185985C8EE6AB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('m1oof078huzbVB5E', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:26', NULL, '19600065996DA', '__users', 'reserves', NULL, NULL),
('MCRX1KHE6eFbfiY0', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:52:09', NULL, NULL, '__asset_wallets', '11', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":105.26315789474}]', '{\"ip\":\"127.0.0.1\"}'),
('mgCJFKRWJ2IUYnDr', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:53:14', NULL, NULL, '__messages', '124054110A9AA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('mGe15v6RXg4nB3ui', 'FACTORY_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:24', NULL, '129687673AE5E', '__notifications', '1881082A2C410', NULL, NULL),
('mgFdOSe7QKtcgKat', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'peter', '2022-09-10 23:52:41', NULL, NULL, '__asset_wallets', '12', NULL, '{\"ip\":\"127.0.0.1\"}'),
('MI7yFTH6v3ybJlLK', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:52:02', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":110,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('mI8E9kSdpiYLeJ5Z', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-10 23:53:02', NULL, NULL, '__trades', '168315C0AED97', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:59\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('MpWdlkOlRSUvFWBC', 'FACTORY_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:24', NULL, '129687673AE5E', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('MRpkV0NU4CJvsbAt', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:51:54', NULL, NULL, '__seller_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('mwntDalG67LtQnvL', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:52:11', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":969.36263210526,\"new_value\":968.31000052631}]', '{\"ip\":\"127.0.0.1\"}'),
('mY4UhBiJmWnDqINa', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:51:27', NULL, NULL, '__admin_extensions', 'busadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('mz4kDLYs77dtgVdz', 'TEST_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:51:31', NULL, NULL, '__admin_extensions', 'guddaz', NULL, '{\"ip\":\"127.0.0.1\"}'),
('N1r91cvHHfFXaGeI', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:38', NULL, '126092D1E6525', '__email_addresses', 'nassim@example.com', NULL, NULL),
('N3evhMuCvroYEbOR', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:52:30', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":3.61702127659,\"new_value\":1.4893617021219}]', '{\"ip\":\"127.0.0.1\"}'),
('N687FkNW1tjUUDie', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:33', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":212.63157894737,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('N89UyiGzEcD8HzUN', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:52:40', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":268.6170212766,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('neMHbF2gntIC5KsA', 'FACTORY_SESSION', 'Addition of _Asset entry to database.', 'entry_create', 'system', '2022-09-10 23:51:24', NULL, NULL, '__assets', '1', NULL, '{\"ip\":\"127.0.0.1\"}'),
('NishpUg8tXiuF8BQ', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:51:27', NULL, NULL, '__user_group_memberships', '6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('nKOgFhfvzIXAeqeX', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:52:28', NULL, NULL, '__asset_wallets', '8', '[{\"field_name\":\"asset_value\",\"old_value\":100,\"new_value\":312.76595744681}]', '{\"ip\":\"127.0.0.1\"}'),
('NKrHEotFArJ6TtXh', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:36', NULL, NULL, '__messages', '189677A3072A7', NULL, '{\"ip\":\"127.0.0.1\"}'),
('NlLmZ5I2b7OqTxLf', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:17', NULL, NULL, '__trades', '106468989069E', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"keith\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:14\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('NlpA8GzpHLPVIhk7', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:37', NULL, '169722E654D45', '__notifications', '18603387EF661', NULL, NULL),
('Np7NpEPfykaL32MG', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:51:45', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":3000,\"new_value\":2890}]', '{\"ip\":\"127.0.0.1\"}'),
('nSCv2tW2DLCjcTmo', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:52:25', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":216.3829787234,\"new_value\":1.4893617021234}]', '{\"ip\":\"127.0.0.1\"}'),
('NtFIes3at7T1dFhY', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:49', NULL, NULL, '__messages', '10457657D9E25', NULL, '{\"ip\":\"127.0.0.1\"}'),
('NTIoDoDs9UgqDq6O', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'flint', '2022-09-10 23:53:11', NULL, NULL, '__trades', '133656C006547', NULL, '{\"ip\":\"127.0.0.1\"}'),
('O72pyvyII7rvBIv9', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-10 23:52:12', NULL, NULL, '__buyer_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('oEdIb5rRGBp0M3Qp', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:52:51', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":186.05263157895}]', '{\"ip\":\"127.0.0.1\"}'),
('OhgFNLvCJwTa1Tvc', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:53:19', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":347.86679964539,\"new_value\":141.98444670421}]', '{\"ip\":\"127.0.0.1\"}'),
('ohpMWYaey4x82h8r', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:53:17', NULL, NULL, '__messages', '171787840C964', NULL, '{\"ip\":\"127.0.0.1\"}'),
('OjAEHIvno50EwWSO', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:51:26', NULL, NULL, '__buyer_extensions', 'sysadmin', NULL, '{\"ip\":\"127.0.0.1\"}'),
('OROjqMo2PY8X1BSY', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:51:58', NULL, NULL, '__messages', '152274C2B0216', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Ov91AkgNfhNn78Q3', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:53:09', NULL, NULL, '__offers', '1051730AFE6D8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('owkVTp0zJzBPf7Ya', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'flint', '2022-09-10 23:52:49', NULL, NULL, '__trades', '1974446B1DF16', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"flint\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:46\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('P9KAdvZW7dFKCETF', 'TEST_SESSION', 'Temporarily disabling for test users.', 'entry_update', 'system', '2022-09-10 23:51:30', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for test users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('pCfXsdzycr0LztuH', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:51:28', NULL, NULL, '__user_group_memberships', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('pCZNwQLzjdDjS515', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:52:27', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":1.4893617021234,\"new_value\":216.3829787234}]', '{\"ip\":\"127.0.0.1\"}'),
('pHoP3YYx5iuy0NnX', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:16', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":968.31000052631,\"new_value\":819.37383031354}]', '{\"ip\":\"127.0.0.1\"}'),
('pkcPUAoHrtXwWoCU', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:51:32', NULL, NULL, '__user_group_memberships', '9', NULL, '{\"ip\":\"127.0.0.1\"}'),
('PNymIh8ZwjXACabe', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'guddaz', '2022-09-10 23:51:54', NULL, NULL, '__asset_wallets', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('pPSWKK0iEco0IKck', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:35', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":748.93617021277,\"new_value\":538.4098544233}]', '{\"ip\":\"127.0.0.1\"}'),
('pUdAjcpnI7GVwEso', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:53:11', NULL, NULL, '__messages', '170887E7C9FC2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('pUn4HsF1zWIATJg2', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:52:23', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":179.58659627098,\"new_value\":173.20361754758}]', '{\"ip\":\"127.0.0.1\"}'),
('pxEuhazOTaklP7X9', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:53:21', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1617.132718854,\"new_value\":1619.1915423834}]', '{\"ip\":\"127.0.0.1\"}'),
('q2dZ99IdFoecWrIz', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:53:00', NULL, NULL, '__asset_wallets', '11', '[{\"field_name\":\"asset_value\",\"old_value\":105.26315789474,\"new_value\":368.42105263158}]', '{\"ip\":\"127.0.0.1\"}'),
('QDlzqO9AUkJGMTYb', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'keith', '2022-09-10 23:52:46', NULL, NULL, '__trades', '1974446B1DF16', NULL, '{\"ip\":\"127.0.0.1\"}'),
('QfnMY4962wyDTsPD', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:51:49', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":2290,\"new_value\":1790}]', '{\"ip\":\"127.0.0.1\"}'),
('qh8j1YBx86smDRBv', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:53:12', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":347.86679964539,\"new_value\":562.76041666667}]', '{\"ip\":\"127.0.0.1\"}'),
('QOuDxPwtKh0lgbvl', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'reserves', '2022-09-10 23:51:38', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":3000}]', '{\"ip\":\"127.0.0.1\"}'),
('qTvWXaEl2NSanNX3', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:55', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1608.5089031588,\"new_value\":1610.351008422}]', '{\"ip\":\"127.0.0.1\"}'),
('qZFTc6n0vibvmJfQ', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:35', NULL, '132216776605A', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('reJ6HdrOerkuKVIX', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'lodza', '2022-09-10 23:52:14', NULL, NULL, '__trades', '106468989069E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('RGfsaiv9C4stLDdm', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:52:51', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":1138.2978723404,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('rk3GDIkZuCcTnJUt', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:17', NULL, NULL, '__messages', '189906B45D926', NULL, '{\"ip\":\"127.0.0.1\"}'),
('rN8kRG52DwozcCHb', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:53:17', NULL, NULL, '__messages', '135070E6CAE6D', NULL, '{\"ip\":\"127.0.0.1\"}'),
('RNW7QVFYQrYEijqZ', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-10 23:52:57', NULL, NULL, '__offers', '1907355E5F3A0', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ro4ffemaSPeqfuzx', 'FACTORY_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:24', NULL, '129687673AE5E', '__users', 'developer', NULL, NULL),
('RP0uSuNdwoSBEytz', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'clarence', '2022-09-10 23:52:28', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":216.3829787234,\"new_value\":3.61702127659}]', '{\"ip\":\"127.0.0.1\"}'),
('rQC8HE6wTjEOqWhA', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:36', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":538.4098544233,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('RrKIrN4MToTOWYp3', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:37', NULL, '126092D1E6525', '__users', 'nassim', NULL, NULL),
('rsggddpk1IgbocXj', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:53:11', NULL, NULL, '__messages', '166187C4A12A2', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Rx7Vt3dGQQ5uqwKJ', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:27', NULL, NULL, '__messages', '165435342FC72', NULL, '{\"ip\":\"127.0.0.1\"}'),
('s3pTzKLdtWVraTrE', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:35', NULL, '132216776605A', '__users', 'peter', NULL, NULL),
('S4cvkTTB4FA0h8NM', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:04', NULL, NULL, '__messages', '144090236E182', NULL, '{\"ip\":\"127.0.0.1\"}'),
('s5Ppe92uWH4o5qWJ', 'FACTORY_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:51:27', NULL, NULL, '__seller_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('SakJsWLiLIpgEbXk', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'nassim', '2022-09-10 23:51:53', NULL, NULL, '__deposit_tokens', '106153E1679CE', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:51:52\"}]', '{\"ip\":\"127.0.0.1\"}'),
('SiLiX4AsoiW5LGus', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:53:05', NULL, NULL, '__trades', '138601EB0FDA3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('skhoZekFzGwPfazF', 'FACTORY_SESSION', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:51:26', NULL, NULL, '__admin_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('sqEoCxn3iythqIjp', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:17', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":819.37383031354,\"new_value\":817.88446861141}]', '{\"ip\":\"127.0.0.1\"}'),
('sUhYbOvw35Ny7ltw', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:51:25', NULL, NULL, '__user_group_memberships', '3', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Sv30B3yAOtCNP16O', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:52:23', NULL, NULL, '__trades', '1110529CCFB75', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:20\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('sXvtjwqORlEv4x7m', 'FACTORY_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-09-10 23:51:26', NULL, NULL, '__buyer_extensions', 'reserves', NULL, '{\"ip\":\"127.0.0.1\"}'),
('SytLOG3YdK5YWBki', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:53:16', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":347.86679964539,\"new_value\":139.9256231748}]', '{\"ip\":\"127.0.0.1\"}'),
('tbyoz6zhuFtbS2af', 'TEST_SESSION', 'Addition of _Trade entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:52:52', NULL, NULL, '__trades', '195557539EDF6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TD3BVxeAt033fIqX', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'raymond', '2022-09-10 23:52:11', NULL, NULL, '__trades', '188043A16BD39', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"raymond\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:07\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('tEyarIM54LLpqeh1', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:51:41', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":967.86579}]', '{\"ip\":\"127.0.0.1\"}'),
('TGBe6KPIlgq45JaY', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:33', NULL, '151449C5DED6C', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('THnyGjcJ9Q2Osgq8', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'raymond', '2022-09-10 23:52:05', NULL, NULL, '__offers', '1030046562F85', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TiuIxM4qCYETlqYN', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:36', NULL, '16039131A62E8', '__notifications', '149372AC24C84', NULL, NULL),
('TK7j0BsGNnevSEn4', 'TEST_SESSION', 'Addition of _RegToken entry to database.', 'entry_create', 'system', '2022-09-10 23:51:31', NULL, NULL, '__reg_tokens', '1234567890', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TPdJAOI6yVXAGBYv', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 23:51:49', NULL, NULL, '__deposit_tokens', '103459C439AEB', NULL, '{\"ip\":\"127.0.0.1\"}'),
('tpmMtiHGLBMUxxFG', 'FACTORY_SESSION', 'Temporarily disabling for factory users.', 'entry_update', 'system', '2022-09-10 23:51:24', NULL, NULL, '__pref_items', '13', '[{\"field_name\":\"update_note\",\"old_value\":null,\"new_value\":\"Temporarily disabling for factory users.\"},{\"field_name\":\"value\",\"old_value\":\"1\",\"new_value\":false}]', '{\"ip\":\"127.0.0.1\"}'),
('tTcgq5wTQgazaC0y', 'TEST_SESSION', 'Addition of _SellerExtension entry to database.', 'entry_create', 'keith', '2022-09-10 23:52:31', NULL, NULL, '__seller_extensions', 'keith', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Tto23ZakLXfxAcFC', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:58', NULL, NULL, '__messages', '195481252D9DF', NULL, '{\"ip\":\"127.0.0.1\"}'),
('TxVW1e1pwaZtYWAH', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:53:12', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":214.89361702128,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('u01ThJIKbm9QSgda', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:01', NULL, NULL, '__messages', '13610109EFA74', NULL, '{\"ip\":\"127.0.0.1\"}'),
('U4fW5d7tUa3VWvds', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:52:57', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":265.78947368421}]', '{\"ip\":\"127.0.0.1\"}'),
('u4tz7oGwhuKnkc59', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:51:32', NULL, NULL, '__user_group_memberships', '10', NULL, '{\"ip\":\"127.0.0.1\"}'),
('UF3nGke3hrLCtnoJ', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:55', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":954.08734602461,\"new_value\":952.24524076145}]', '{\"ip\":\"127.0.0.1\"}'),
('UKAVWM112HrjZLww', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:35', NULL, '132216776605A', '__email_addresses', 'peter@example.com', NULL, NULL),
('uLiqfE31ZK0OswNs', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:53:03', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":686.45576707724,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('Ux8hmBReeWnwsbaT', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:35', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":173.20361754758,\"new_value\":383.72993333705}]', '{\"ip\":\"127.0.0.1\"}'),
('UZYJZ4IJnjK7Gdhr', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:31', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":748.93617021277,\"new_value\":536.3045912654}]', '{\"ip\":\"127.0.0.1\"}'),
('v7C4eqsyj2vPa4gr', 'TEST_SESSION', 'Addition of _AssetWallet entry to database.', 'entry_create', 'clarence', '2022-09-10 23:51:51', NULL, NULL, '__asset_wallets', '8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('v9SkoIQRAPUshltS', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'nassim', '2022-09-10 23:53:08', NULL, NULL, '__trades', '138601EB0FDA3', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"nassim\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:53:05\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('VG52D4VVfTUYEui9', 'TEST_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:51:33', NULL, NULL, '__user_group_memberships', '12', NULL, '{\"ip\":\"127.0.0.1\"}'),
('VgQ7Tfep4p1LQ14X', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'raymond', '2022-09-10 23:52:59', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":265.78947368421,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('vnccLsmsjAkbxwYb', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:52:47', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":103.29954915548,\"new_value\":267.68756998881}]', '{\"ip\":\"127.0.0.1\"}'),
('vpEWqmgjTzSDAfUj', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:12', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":150.42553191489}]', '{\"ip\":\"127.0.0.1\"}'),
('vqPJI66Fik0dth2g', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:53:18', NULL, NULL, '__messages', '168250D98806A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Vr8fYhcZYRzNDfim', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:52:21', NULL, NULL, '__asset_wallets', '10', '[{\"field_name\":\"asset_value\",\"old_value\":644.68085106383,\"new_value\":0}]', '{\"ip\":\"127.0.0.1\"}'),
('VrrXGjQS6qrvPCOm', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:52:18', NULL, NULL, '__offers', '139652B4A284E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('vUtTIipuslkXcKB3', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:07', NULL, NULL, '__messages', '133933701F97E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('vVFbSvbgDsFbQILO', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'ross', '2022-09-10 23:52:25', NULL, NULL, '__buyer_extensions', 'clarence', NULL, '{\"ip\":\"127.0.0.1\"}'),
('VzXGRD7m4TtbVaQK', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:51:47', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":600}]', '{\"ip\":\"127.0.0.1\"}'),
('w5SmAbFFtWq4rEzq', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:51:54', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":317.77707867,\"new_value\":210.33027015936}]', '{\"ip\":\"127.0.0.1\"}'),
('Wd4f1vqyDRF1E59E', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:33', NULL, '151449C5DED6C', '__users', 'jimmy', NULL, NULL),
('WTG7FYQQfI239fLL', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:25', NULL, '135795688096F', '__email_addresses', 'sysadmin@ankelli.com', NULL, NULL),
('wTNWrgjZCQhD2TQB', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:53', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":952.24524076145,\"new_value\":1138.2978723404}]', '{\"ip\":\"127.0.0.1\"}'),
('WvdXYuWWz917oQYS', 'TEST_SESSION', 'User signup.', 'batch_init', 'system', '2022-09-10 23:51:35', NULL, '127615E91870F', NULL, NULL, NULL, '{\"ip\":\"127.0.0.1\"}'),
('X478WAhnvPPlJZoE', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:52:02', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"asset_value\",\"old_value\":317.77707867,\"new_value\":211.3940999466}]', '{\"ip\":\"127.0.0.1\"}'),
('x6XXjU5O5yiwGmJb', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'lodza', '2022-09-10 23:52:19', NULL, NULL, '__buyer_extensions', 'jimmy', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XaVIT8NflL10PO1z', 'TEST_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:37', NULL, '169722E654D45', '__email_addresses', 'raymond@example.com', NULL, NULL),
('XB0Rov6v5NIub0JY', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:32', NULL, '146027061263E', '__users', 'lodza', NULL, NULL),
('Xbcay6qIZQSNUf7c', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'flint', '2022-09-10 23:52:49', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":104.92715332214,\"new_value\":103.29954915547}]', '{\"ip\":\"127.0.0.1\"}'),
('Xgo3xCzPrqNYR383', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:12', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"asset_value\",\"old_value\":968.31000052631,\"new_value\":817.88446861142}]', '{\"ip\":\"127.0.0.1\"}'),
('XGQfaKewimnzVhwV', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'keith', '2022-09-10 23:52:44', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":267.68756998881,\"new_value\":103.29954915548}]', '{\"ip\":\"127.0.0.1\"}'),
('XGukZA4eFvRCEZ8y', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:52:52', NULL, NULL, '__trades', '195557539EDF6', '[{\"field_name\":\"pymt_declared\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"jimmy\"},{\"field_name\":\"pymt_declared_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:52\"}]', '{\"ip\":\"127.0.0.1\"}'),
('xJgWahHpo7lVikX3', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'peter', '2022-09-10 23:52:40', NULL, NULL, '__asset_wallets', '6', '[{\"field_name\":\"asset_value\",\"old_value\":267.68756998881,\"new_value\":536.30459126541}]', '{\"ip\":\"127.0.0.1\"}'),
('XSyJTnH5cpzxCrfH', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:30', NULL, NULL, '__messages', '131156CE608CA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('xz2tsYB4OcjChvjm', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:46', NULL, NULL, '__messages', '1044839337939', NULL, '{\"ip\":\"127.0.0.1\"}'),
('XZ3DzK9d8GRrRntO', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:51:26', NULL, NULL, '__user_group_memberships', '4', NULL, '{\"ip\":\"127.0.0.1\"}'),
('yFszwcoQkt17hJDi', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:53:13', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":562.76041666667,\"new_value\":349.99445921986}]', '{\"ip\":\"127.0.0.1\"}'),
('ygtTloaPK0lAXdK2', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:53:08', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":484.208576066,\"new_value\":482.18610415589}]', '{\"ip\":\"127.0.0.1\"}'),
('yLQ05SGBVxIAM8bS', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:14', NULL, NULL, '__messages', '1146557A16F75', NULL, '{\"ip\":\"127.0.0.1\"}'),
('YMZ44VXNIX4xmKHr', 'TEST_SESSION', 'Updating of _Trade entry in database.', 'entry_update', 'lodza', '2022-09-10 23:52:36', NULL, NULL, '__trades', '159801AF97645', '[{\"field_name\":\"pymt_confirmed\",\"old_value\":null,\"new_value\":true},{\"field_name\":\"source_user_password\",\"old_value\":null,\"new_value\":\"Def-Pass#123\"},{\"field_name\":\"updater_username\",\"old_value\":null,\"new_value\":\"lodza\"},{\"field_name\":\"pymt_confirmed_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:52:33\"},{\"field_name\":\"_status\",\"old_value\":\"active\",\"new_value\":\"completed\"}]', '{\"ip\":\"127.0.0.1\"}'),
('YOu8BnrSrYViNlkY', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:53:14', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1615.0050592795,\"new_value\":1617.132718854}]', '{\"ip\":\"127.0.0.1\"}'),
('yTW5WGGzT1v1nG0g', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:27', NULL, NULL, '__messages', '17166138589AA', NULL, '{\"ip\":\"127.0.0.1\"}'),
('yuYuY6IsCtmHn7X8', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:53:07', NULL, NULL, '__asset_wallets', '7', '[{\"field_name\":\"asset_value\",\"old_value\":686.45576707724,\"new_value\":484.208576066}]', '{\"ip\":\"127.0.0.1\"}'),
('YvTwQsGeuFoy74rn', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:53:12', NULL, NULL, '__messages', '1648501C0753A', NULL, '{\"ip\":\"127.0.0.1\"}'),
('Z13PRk6m6ArgTt7n', 'TEST_SESSION', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-09-10 23:51:33', NULL, '144866EBA4051', '__users', 'ross', NULL, NULL),
('z6Z4nFSOAcgOUSO0', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:39', NULL, NULL, '__messages', '10746370F09A8', NULL, '{\"ip\":\"127.0.0.1\"}'),
('z7U5J2ICG0khc7Ld', 'TEST_SESSION', 'Addition of _DepositToken entry to database.', 'entry_create', 'lodza', '2022-09-10 23:51:52', NULL, NULL, '__deposit_tokens', '106153E1679CE', NULL, '{\"ip\":\"127.0.0.1\"}'),
('ZBIj76F7UvxFYYqi', 'FACTORY_SESSION', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-09-10 23:51:27', NULL, '1851195EF4771', '__email_addresses', 'busadmin@ankelli.com', NULL, NULL),
('ZgzsbmKNFSlOEHYk', 'TEST_SESSION', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-09-10 23:51:32', NULL, '146027061263E', '__notifications', '12121940293F5', NULL, NULL),
('ZhFBh3MxmRyjafkX', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'nassim', '2022-09-10 23:53:07', NULL, NULL, '__asset_wallets', '9', '[{\"field_name\":\"asset_value\",\"old_value\":100,\"new_value\":302.24719101124}]', '{\"ip\":\"127.0.0.1\"}'),
('Zj6UWAFOCwp90bnb', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'guddaz', '2022-09-10 23:53:14', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"asset_value\",\"old_value\":349.99445921986,\"new_value\":347.86679964539}]', '{\"ip\":\"127.0.0.1\"}'),
('zl3ghyPce7lb5SUO', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:53:08', NULL, NULL, '__messages', '1536834D14C50', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zoR2ZpqaQFNPl7Ks', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'jimmy', '2022-09-10 23:52:23', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"asset_value\",\"old_value\":1593.6058230682,\"new_value\":1599.9888017916}]', '{\"ip\":\"127.0.0.1\"}'),
('zowXLzcQhVXMedxI', 'FACTORY_SESSION', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-09-10 23:51:26', NULL, NULL, '__user_group_memberships', '5', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zpDH0m0ppddYC8Vz', 'TEST_SESSION', 'Updating of _AssetWallet entry in database.', 'entry_update', 'ross', '2022-09-10 23:51:46', NULL, NULL, '__asset_wallets', '5', '[{\"field_name\":\"asset_value\",\"old_value\":0,\"new_value\":110}]', '{\"ip\":\"127.0.0.1\"}'),
('ZSKyCp7KmAs7F0bW', 'TEST_SESSION', 'Updating of _DepositToken entry in database.', 'entry_update', 'clarence', '2022-09-10 23:51:51', NULL, NULL, '__deposit_tokens', '1428739A7B783', '[{\"field_name\":\"user_username\",\"old_value\":null,\"new_value\":\"clarence\"},{\"field_name\":\"used_datetime\",\"old_value\":null,\"new_value\":\"2022-09-11 01:51:51\"}]', '{\"ip\":\"127.0.0.1\"}'),
('ZTOJqkLiGrmBrP76', 'TEST_SESSION', 'Addition of _Offer entry to database.', 'entry_create', 'lodza', '2022-09-10 23:52:50', NULL, NULL, '__offers', '12860265CC76E', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zu4YRDIQwWrKez2e', 'TEST_SESSION', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'jimmy', '2022-09-10 23:53:03', NULL, NULL, '__buyer_extensions', 'nassim', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zxDWj7nHIRG3YH3f', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:53:05', NULL, NULL, '__messages', '140491F790FD6', NULL, '{\"ip\":\"127.0.0.1\"}'),
('zXiSHZsc3tceGle3', 'TEST_SESSION', 'Addition of _Message entry to database.', 'entry_create', 'system', '2022-09-10 23:52:11', NULL, NULL, '__messages', '1511041AE47B4', NULL, '{\"ip\":\"127.0.0.1\"}');

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
('1024698504367', '__trades', '1110529CCFB75', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:52:20', NULL),
('1044839337939', '__trades', '1974446B1DF16', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:52:46', NULL),
('10457657D9E25', '__trades', '1974446B1DF16', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:52:49', NULL),
('107424363B712', '__trades', '194032D384C42', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:52:43', NULL),
('10746370F09A8', '__trades', '194032D384C42', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:52:39', NULL),
('1111243925F75', '__trades', '188043A16BD39', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:52:07', NULL),
('1146557A16F75', '__trades', '106468989069E', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:52:14', NULL),
('1188774C09C2D', '__trades', '168315C0AED97', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:53:02', NULL),
('11926952D58F7', '__trades', '158114D8EB87D', 'I\'ve collected the money.', 'ross', '2022-09-10 23:51:59', NULL),
('1224788CA144F', '__trades', '138601EB0FDA3', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:53:05', NULL),
('12359937B3AF5', '__trades', '158114D8EB87D', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:51:56', NULL),
('124054110A9AA', '__trades', '133656C006547', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:53:14', NULL),
('1281843045D57', '__trades', '1110529CCFB75', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:52:20', NULL),
('131021161A64D', '__trades', '1974446B1DF16', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:52:46', NULL),
('131156CE608CA', '__trades', '190093E8C5834', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:52:30', NULL),
('1335319A15EED', '__trades', '138601EB0FDA3', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:53:05', NULL),
('133933701F97E', '__trades', '188043A16BD39', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:52:07', NULL),
('135070E6CAE6D', '__trades', '106908FB3BEF5', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:53:17', NULL),
('13610109EFA74', '__trades', '158114D8EB87D', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:52:01', NULL),
('137063A3369EC', '__trades', '188043A16BD39', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:52:07', NULL),
('140491F790FD6', '__trades', '138601EB0FDA3', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:53:04', NULL),
('14391962F9BFC', '__trades', '194032D384C42', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:52:39', NULL),
('144090236E182', '__trades', '158114D8EB87D', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:52:04', NULL),
('14489942329B3', '__trades', '106468989069E', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:52:14', NULL),
('149268F3955D8', '__trades', '1110529CCFB75', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:52:20', NULL),
('1511041AE47B4', '__trades', '188043A16BD39', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:52:11', NULL),
('152274C2B0216', '__trades', '158114D8EB87D', 'I\'ve sent the cash.\nPlease confirm receiving it.', 'guddaz', '2022-09-10 23:51:58', NULL),
('1536834D14C50', '__trades', '138601EB0FDA3', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:53:08', NULL),
('1554010ACFF03', '__trades', '106468989069E', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:52:14', NULL),
('155607B18C9CB', '__trades', '159801AF97645', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:52:33', NULL),
('1630816A9500A', '__trades', '168315C0AED97', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:52:58', NULL),
('1648501C0753A', '__trades', '133656C006547', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:53:11', NULL),
('165082979D337', '__trades', '158114D8EB87D', 'I\'m sending the cash in a couple of minutes.', 'guddaz', '2022-09-10 23:51:56', NULL),
('165435342FC72', '__trades', '190093E8C5834', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:52:26', NULL),
('166187C4A12A2', '__trades', '133656C006547', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:53:11', NULL),
('168250D98806A', '__trades', '106908FB3BEF5', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:53:18', NULL),
('170887E7C9FC2', '__trades', '133656C006547', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:53:11', NULL),
('17149959FAE03', '__trades', '106908FB3BEF5', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:53:21', NULL),
('17166138589AA', '__trades', '190093E8C5834', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:52:27', NULL),
('171787840C964', '__trades', '106908FB3BEF5', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:53:17', NULL),
('17533078F1799', '__trades', '194032D384C42', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:52:40', NULL),
('17572503815BC', '__trades', '168315C0AED97', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:52:59', NULL),
('1767452E584A0', '__trades', '195557539EDF6', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:52:52', NULL),
('183468E1F7407', '__trades', '159801AF97645', 'Asset seller just confirmed receiving payment.', 'system', '2022-09-10 23:52:33', NULL),
('1849102C4A47F', '__trades', '1110529CCFB75', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:52:23', NULL),
('185985C8EE6AB', '__trades', '190093E8C5834', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:52:26', NULL),
('18711363E22E8', '__trades', '195557539EDF6', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:52:52', NULL),
('189677A3072A7', '__trades', '159801AF97645', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:52:36', NULL),
('189813904657E', '__trades', '159801AF97645', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:52:33', NULL),
('189906B45D926', '__trades', '106468989069E', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:52:17', NULL),
('19350826F3F10', '__trades', '195557539EDF6', 'Trade has been marked as completed. Thank you for using our service.', 'system', '2022-09-10 23:52:55', NULL),
('194047DD07BDD', '__trades', '158114D8EB87D', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:51:57', NULL),
('195481252D9DF', '__trades', '168315C0AED97', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:52:58', NULL),
('19658108972DA', '__trades', '195557539EDF6', 'Asset buyer just declared their payment.', 'system', '2022-09-10 23:52:52', NULL),
('198573FD9117C', '__trades', '158114D8EB87D', 'Pleasure doing business with you.', 'ross', '2022-09-10 23:52:01', NULL),
('199762E4BE1E6', '__trades', '1974446B1DF16', 'Trade has been initialized. Use this chat space to communicate with trade peer.', 'system', '2022-09-10 23:52:46', NULL);

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
('101136CAD38F2', 'keith', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:34', NULL),
('1022677003E9A', 'reserves', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:26', NULL),
('12121940293F5', 'lodza', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:32', NULL),
('1290855D29AA1', 'guddaz', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:31', NULL),
('133261591704F', 'flint', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:36', NULL),
('149372AC24C84', 'clarence', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:36', NULL),
('15683205E8B88', 'peter', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:35', NULL),
('162315BB38ABC', 'sysadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:25', NULL),
('1632075263874', 'jimmy', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:34', NULL),
('165426777CC1E', 'busadmin', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:27', NULL),
('1710226CA94F7', 'nassim', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:38', NULL),
('18603387EF661', 'raymond', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:37', NULL),
('1881082A2C410', 'developer', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:24', NULL),
('188672D67403E', 'ross', '{\"title\":\"Welcome Note.\",\"subtitle\":\"Welcome to the Ankelli E-commerce Platform\",\"body\":\"We as the Ankelli Team welcome you to our E-commerce platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-09-10 23:51:33', NULL);

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
('1030046562F85', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.95', 100, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', NULL, 'online', 'raymond', '2022-09-10 23:52:05', '2022-09-10 23:52:05', NULL),
('1051730AFE6D8', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '0.94', 100, 200, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'guddaz', '2022-09-10 23:53:09', '2022-09-10 23:53:09', NULL),
('105619D21D045', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '13.3', 2800, 14000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'lodza', '2022-09-10 23:52:31', '2022-09-10 23:52:31', NULL),
('109086BABECD4', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', NULL, 'online', 'keith', '2022-09-10 23:52:12', '2022-09-10 23:52:12', NULL),
('1130194567AFC', 'Zimbabwe', 'Norton', 'sell', 'USDT', 'USD', '1.04', NULL, NULL, '50', '200', 'cash_in_person', NULL, NULL, 'online', 'guddaz', '2022-09-10 23:52:05', '2022-09-10 23:52:05', NULL),
('11823433D6AA3', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', NULL, 'online', 'clarence', '2022-09-10 23:52:24', '2022-09-10 23:52:24', NULL),
('12860265CC76E', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.2', 700, 3000, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'lodza', '2022-09-10 23:52:50', '2022-09-10 23:52:50', NULL),
('139652B4A284E', 'Zambia', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 1000, NULL, NULL, 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', NULL, 'online', 'jimmy', '2022-09-10 23:52:18', '2022-09-10 23:52:18', NULL),
('17364922B6B1A', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 100, 500, NULL, NULL, 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', NULL, 'online', 'ross', '2022-09-10 23:51:54', '2022-09-10 23:51:54', NULL),
('1817960CBA7D4', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '0.94', 200, 300, NULL, NULL, 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', NULL, 'online', 'peter', '2022-09-10 23:52:37', '2022-09-10 23:52:37', NULL),
('18231470B0174', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '178', 10000, 40000, NULL, NULL, 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', NULL, 'online', 'nassim', '2022-09-10 23:53:03', '2022-09-10 23:53:03', NULL),
('18581765B9E3D', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '170', 20000, 40000, NULL, NULL, 'algerie_poste', '{\"account_holder_name\":\"Timothy Tambo\",\"account_number\":\"22558678\",\"account_key\":\"87\"}', NULL, 'online', 'peter', '2022-09-10 23:53:16', '2022-09-10 23:53:16', NULL),
('18794414487A7', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '15.36', 1500, 2500, NULL, NULL, 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', NULL, 'online', 'flint', '2022-09-10 23:52:44', '2022-09-10 23:52:44', NULL),
('1907355E5F3A0', 'Italy', NULL, 'buy', 'USDT', 'EUR', '0.76', 200, 500, NULL, NULL, 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', NULL, 'online', 'raymond', '2022-09-10 23:52:57', '2022-09-10 23:52:57', NULL);

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
(1, 'Update system config params', 'update_sysconfig_params', 'Permission holder can update system config params.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(2, 'Handle feedback reports', 'handle_feedback_reports', 'Permission holder can handle feedback reports.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(3, 'Manage datalists', 'manage_datalists', 'Permission holder can manage datalists.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(4, 'Manage system tools', 'manage_systools', 'Permission holder can manage system tools.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(5, 'View all logs', 'view_all_logs', 'Permission holder can view all logs.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(6, 'View all transactions', 'view_all_transactions', 'Permission holder can view all transactions.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(7, 'Manage Deposit Tokens', 'manage_deposit_tokens', 'Permission holder can create and edit deposit tokens.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(8, 'Handle Withdrawals', 'handle_withdrawals', 'Permission holder can handle withdrawals.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(9, 'Manage Registration Tokens', 'manage_reg_tokens', 'Permission holder can create and edit registration tokens.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(10, 'Handle flagged users', 'handle_flagged_users', 'Permission holder can handle flagged Users.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(11, 'Handle customer service chats', 'handle_customer_service_chats', 'Permission holder can handle customer service chats.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(12, 'Manage update posts', 'manage_update_posts', 'Permission holder can handle posting and editing update posts.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(13, 'Handle flagged business elems', 'handle_flagged_business_elems', 'Permission holder can handle flagged business elems (Offers, Trades, etc).', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL);

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
(1, '__user_groups', 'system_administrators', 'update_sysconfig_params', 'active', 'system', '2022-09-11 01:51:22', NULL),
(2, '__user_groups', 'system_administrators', 'handle_feedback_reports', 'active', 'system', '2022-09-11 01:51:22', NULL),
(3, '__user_groups', 'system_administrators', 'manage_systools', 'active', 'system', '2022-09-11 01:51:22', NULL),
(4, '__user_groups', 'system_administrators', 'manage_datalists', 'active', 'system', '2022-09-11 01:51:22', NULL),
(5, '__user_groups', 'system_administrators', 'view_all_logs', 'active', 'system', '2022-09-11 01:51:22', NULL),
(6, '__user_groups', 'business_administrators', 'view_all_transactions', 'active', 'system', '2022-09-11 01:51:22', NULL),
(7, '__user_groups', 'business_administrators', 'manage_deposit_tokens', 'active', 'system', '2022-09-11 01:51:22', NULL),
(8, '__user_groups', 'business_administrators', 'handle_withdrawals', 'active', 'system', '2022-09-11 01:51:22', NULL),
(9, '__user_groups', 'user_administrators', 'manage_reg_tokens', 'active', 'system', '2022-09-11 01:51:22', NULL),
(10, '__user_groups', 'user_administrators', 'handle_flagged_users', 'active', 'system', '2022-09-11 01:51:22', NULL),
(11, '__user_groups', 'platform_moderators', 'handle_customer_service_chats', 'active', 'system', '2022-09-11 01:51:22', NULL),
(12, '__user_groups', 'platform_moderators', 'handle_flagged_business_elems', 'active', 'system', '2022-09-11 01:51:22', NULL),
(13, '__user_groups', 'platform_moderators', 'manage_update_posts', 'active', 'system', '2022-09-11 01:51:22', NULL);

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
(1, '__users', 'system', 'Backend rest api enabled', 'backend_rest_api_enabled', '1', 'boolean', 'system', '2022-09-11 01:51:21', NULL),
(2, '__users', 'system', 'Scaffolding app enabled', 'scaffolding_app_enabled', '1', 'boolean', 'system', '2022-09-11 01:51:21', NULL),
(3, '__users', 'system', 'Fallback Display Language', 'fallback_pref_lang', 'en', 'enum:langs', 'system', '2022-09-11 01:51:21', NULL),
(4, '__users', 'system', 'Fallback Display Theme', 'fallback_pref_theme', 'light', 'enum:themes', 'system', '2022-09-11 01:51:21', NULL),
(5, '__users', 'system', 'Image storage driver', 'image_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-11 01:51:21', NULL),
(6, '__users', 'system', 'Document storage driver', 'document_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-09-11 01:51:21', NULL),
(7, '__users', 'system', 'Logs database driver', 'logs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-11 01:51:21', NULL),
(8, '__users', 'system', 'Notifications database driver', 'notifs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-11 01:51:21', NULL),
(9, '__users', 'system', 'Chats database driver', 'chats_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-11 01:51:21', NULL),
(10, '__users', 'system', 'Messages database driver', 'msgs_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-11 01:51:21', NULL),
(11, '__users', 'system', 'Offers database driver', 'offers_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-11 01:51:21', NULL),
(12, '__users', 'system', 'Trades database driver', 'trades_db_driver', 'lavarel_mysql_db', 'enum:db_drivers', 'system', '2022-09-11 01:51:21', NULL),
(13, '__users', 'system', 'Token registration enabled', 'token_reg_enabled', '1', 'boolean', 'system', '2022-09-11 01:51:21', '2022-09-10 23:53:22'),
(14, '__users', 'system', 'Token registration max use count', 'reg_token_max_use_count', '10', 'integer', 'system', '2022-09-11 01:51:21', NULL),
(15, '__users', 'system', 'Open Registration enabled', 'open_reg_enabled', '0', 'boolean', 'system', '2022-09-11 01:51:21', NULL),
(16, '__users', 'system', 'Learn mode available', 'learn_mode_available', '1', 'boolean', 'system', '2022-09-11 01:51:21', NULL),
(17, '__users', 'system', 'Offers to buy enabled', 'offer_to_buy_enabled', '1', 'boolean', 'system', '2022-09-11 01:51:21', NULL),
(18, '__users', 'system', 'Offers to sell enabled', 'offer_to_sell_enabled', '1', 'boolean', 'system', '2022-09-11 01:51:21', NULL),
(19, '__users', 'system', 'Use development crypto asset engine', 'use_dev_crypto_asset_engine', '1', 'boolean', 'system', '2022-09-11 01:51:21', NULL),
(20, '__users', 'system', 'Use tatum crypto asset engine', 'use_tatum_crypto_asset_engine', '0', 'boolean', 'system', '2022-09-11 01:51:21', NULL),
(21, '__users', 'system', 'Value charged by platform on transactions', 'platform_charge_asset_factor', '0.01', 'float', 'system', '2022-09-11 01:51:21', NULL),
(22, '__users', 'system', 'Minimum allowed price per unit currency on offers', 'min_offer_purchase_price', '0.5', 'float', 'system', '2022-09-11 01:51:21', NULL);

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
(1, 'Cash in person', 'cash_in_person', '5e5d4b', '[\"phone_no\"]', NULL, 'active', 'system', '2022-09-11 01:51:21', NULL, NULL),
(2, 'Stanbic bank', 'stanbic_bank', '066ef3', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-11 01:51:21', NULL, NULL),
(3, 'FNB bank', 'fnb_bank', '009eaa', '[\"account_holder_name\",\"account_no\"]', '[\"ZAR\"]', 'active', 'system', '2022-09-11 01:51:21', NULL, NULL),
(4, 'Mukuru', 'mukuru', 'e77924', '[\"fullname\",\"phone_no\"]', '[\"USD\"]', 'active', 'system', '2022-09-11 01:51:21', NULL, NULL),
(5, 'Algérie Poste', 'algerie_poste', '01009a', '[\"account_holder_name\",\"account_no\",\"account_key\"]', '[\"DZD\"]', 'active', 'system', '2022-09-11 01:51:21', NULL, NULL),
(6, 'MTN Mobile Money', 'mtn_momo', 'feca05', '[\"fullname\",\"phone_no\"]', NULL, 'active', 'system', '2022-09-11 01:51:21', NULL, NULL),
(7, 'Ecocash', 'ecocash', '005ba4', '[\"fullname\",\"phone_no\"]', '[\"ZWL\"]', 'active', 'system', '2022-09-11 01:51:21', NULL, NULL),
(8, 'Paypal', 'paypal', '27346a', '[\"fullname\",\"email_address\"]', '[\"USD\",\"EUR\",\"GBP\"]', 'active', 'system', '2022-09-11 01:51:21', NULL, NULL),
(9, 'Skrill', 'skrill', '862165', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-11 01:51:21', NULL, NULL),
(10, 'World Remit', 'world_remit', '604684', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-09-11 01:51:21', NULL, NULL),
(11, 'Mastercard', 'mastercard', 'cc0001', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-11 01:51:21', NULL, NULL),
(12, 'Visa', 'visa', '0055a5', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-09-11 01:51:21', NULL, NULL),
(13, 'FBC Bank', 'fbc_bank', '0055a5', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-09-11 01:51:21', NULL, NULL);

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
('1234567890', 'active', 'system', '2022-09-10 23:51:30');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-09-10 23:51:26', '2022-09-10 23:51:26', NULL),
(2, 'reserves', 'deactivated', 'system', '2022-09-10 23:51:26', '2022-09-10 23:51:26', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-09-10 23:51:27', '2022-09-10 23:51:27', NULL),
(4, 'guddaz', 'active', 'guddaz', '2022-09-10 23:51:54', '2022-09-10 23:51:54', NULL),
(5, 'lodza', 'active', 'lodza', '2022-09-10 23:52:05', '2022-09-10 23:52:05', NULL),
(6, 'ross', 'active', 'ross', '2022-09-10 23:52:25', '2022-09-10 23:52:25', NULL),
(7, 'keith', 'active', 'keith', '2022-09-10 23:52:31', '2022-09-10 23:52:31', NULL),
(8, 'jimmy', 'active', 'jimmy', '2022-09-10 23:52:50', '2022-09-10 23:52:50', NULL),
(9, 'flint', 'active', 'flint', '2022-09-10 23:53:09', '2022-09-10 23:53:09', NULL);

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
('FACTORY_SESSION', 'system', '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'ended', '2022-09-11 01:51:20', NULL, NULL, NULL),
('TEST_SESSION', NULL, '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'active', '2022-09-11 01:51:20', NULL, NULL, NULL);

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
('106468989069E', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '148.93617021277', '150.42553191489', '0.01', 140, '0.94', '1722259ED4D8D', 'paypal', '{\"fullname\":\"Tawanda Chakatsva\",\"email_address\":\"tawanda@example.com\"}', '2022-09-10 23:52:14', '2022-09-10 23:52:14', 1, 1, 'completed', 'keith', 'lodza', '2022-09-10 23:52:14', '2022-09-10 23:52:17', NULL),
('106908FB3BEF5', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '205.88235294118', '207.94117647059', '0.01', 35000, '170', '127414F0E75B6', 'algerie_poste', '{\"account_holder_name\":\"Timothy Tambo\",\"account_number\":\"22558678\",\"account_key\":\"87\"}', '2022-09-10 23:53:17', '2022-09-10 23:53:18', 1, 1, 'completed', 'peter', 'flint', '2022-09-10 23:53:17', '2022-09-10 23:53:21', NULL),
('1110529CCFB75', 'Zambia', NULL, 'buy', 'USDT', 'USD', '638.29787234043', '644.68085106383', '0.01', 600, '0.94', '170985BA8CB2B', 'skrill', '{\"fullname\":\"Mulenga Mwamba\",\"email_address\":\"mulenga@example.com\"}', '2022-09-10 23:52:20', '2022-09-10 23:52:20', 1, 1, 'completed', 'jimmy', 'lodza', '2022-09-10 23:52:20', '2022-09-10 23:52:23', NULL),
('133656C006547', 'Zimbabwe', 'Marondera', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', '159751BB7BDCF', 'cash_in_person', '{\"fullname\":\"Tamari Karongo\",\"address\":\"Opposite OK Marondera\",\"phone_no\":\"+263 7658 357\"}', '2022-09-10 23:53:11', '2022-09-10 23:53:11', 1, 1, 'completed', 'guddaz', 'flint', '2022-09-10 23:53:11', '2022-09-10 23:53:15', NULL),
('138601EB0FDA3', 'Algeria', NULL, 'buy', 'USDT', 'DZD', '202.24719101124', '204.26966292135', '0.01', 36000, '178', '178019C7CD55D', 'algerie_poste', '{\"account_holder_name\":\"Djenna Moulad\",\"account_no\":\"22657899\",\"account_key\":\"67\"}', '2022-09-10 23:53:05', '2022-09-10 23:53:05', 1, 1, 'completed', 'nassim', 'jimmy', '2022-09-10 23:53:04', '2022-09-10 23:53:08', NULL),
('158114D8EB87D', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '106.3829787234', '107.44680851064', '0.01', 100, '0.94', '1565590881197', 'mukuru', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 7658 357\"}', '2022-09-10 23:51:57', '2022-09-10 23:52:01', 1, 1, 'completed', 'ross', 'guddaz', '2022-09-10 23:51:56', '2022-09-10 23:52:04', NULL),
('159801AF97645', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '210.52631578947', '212.63157894737', '0.01', 2800, '13.3', '191699BD8C563', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-10 23:52:33', '2022-09-10 23:52:33', 1, 1, 'completed', 'lodza', 'keith', '2022-09-10 23:52:33', '2022-09-10 23:52:36', NULL),
('168315C0AED97', 'Italy', NULL, 'buy', 'USDT', 'EUR', '263.15789473684', '265.78947368421', '0.01', 200, '0.76', '1065029AF0256', 'world_remit', '{\"fullname\":\"Panashe Gabvu\",\"phone_no\":\"+78 568 6553\"}', '2022-09-10 23:52:58', '2022-09-10 23:52:59', 1, 1, 'completed', 'raymond', 'jimmy', '2022-09-10 23:52:58', '2022-09-10 23:53:02', NULL),
('188043A16BD39', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '105.26315789474', '106.31578947368', '0.01', 100, '0.95', '119865696CF40', 'world_remit', '{\"fullname\":\"Kudakwashe Magadze\",\"phone_no\":\"+263 765 357\"}', '2022-09-10 23:52:07', '2022-09-10 23:52:07', 1, 1, 'completed', 'raymond', 'lodza', '2022-09-10 23:52:07', '2022-09-10 23:52:11', NULL),
('190093E8C5834', 'Zambia', 'Lusaka CBD', 'buy', 'USDT', 'USD', '212.76595744681', '214.89361702128', '0.01', 200, '0.94', '1825337F0C903', 'cash_in_person', '{\"fullname\":\"Mulenga Mwamba\",\"phone_no\":\"mulenga@example.com\"}', '2022-09-10 23:52:26', '2022-09-10 23:52:27', 1, 1, 'completed', 'clarence', 'ross', '2022-09-10 23:52:26', '2022-09-10 23:52:30', NULL),
('194032D384C42', 'Zimbabwe', NULL, 'buy', 'USDT', 'USD', '265.95744680851', '268.6170212766', '0.01', 250, '0.94', '13044043BE598', 'fbc_bank', '{\"fullname\":\"Tadiwa Magodi\",\"account_no\":\"556788965445\"}', '2022-09-10 23:52:39', '2022-09-10 23:52:40', 1, 1, 'completed', 'peter', 'keith', '2022-09-10 23:52:39', '2022-09-10 23:52:43', NULL),
('195557539EDF6', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '184.21052631579', '186.05263157895', '0.01', 2800, '15.2', '197398EF109B6', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-10 23:52:52', '2022-09-10 23:52:52', 1, 1, 'completed', 'lodza', 'jimmy', '2022-09-10 23:52:52', '2022-09-10 23:52:56', NULL),
('1974446B1DF16', 'South Africa', NULL, 'buy', 'USDT', 'ZAR', '162.76041666667', '164.38802083333', '0.01', 2500, '15.36', '1470179A565E0', 'fnb_bank', '{\"fullname\":\"William Mbeki\",\"account_no\":\"6557890898\"}', '2022-09-10 23:52:46', '2022-09-10 23:52:46', 1, 1, 'completed', 'flint', 'keith', '2022-09-10 23:52:46', '2022-09-10 23:52:49', NULL);

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
('1029652C45362', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"194032D384C42\"', 'escrow_asset_unlock', 'escrow', 'keith', 'USDT', '268.6170212766', '[{\"user_username\":\"escrow\",\"old_asset_value\":268.6170212766,\"new_asset_value\":0},{\"user_username\":\"keith\",\"old_asset_value\":267.68756998881,\"new_asset_value\":536.30459126541}]', '2022-09-10 23:52:40', '2022-09-10 23:52:40'),
('106061711C86C', NULL, 'TEST_SESSION', 'Platform charge for transaction \"15782454EB980\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.1052631578947', '[{\"user_username\":\"keith\",\"old_asset_value\":538.4098544233,\"new_asset_value\":536.30459126541},{\"user_username\":\"reserves\",\"old_asset_value\":1602.1164613661,\"new_asset_value\":1604.221724524}]', '2022-09-10 23:52:36', NULL),
('1065029AF0256', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"168315C0AED97\"', 'escrow_asset_lock', 'jimmy', 'escrow', 'USDT', '265.78947368421', '[{\"user_username\":\"jimmy\",\"old_asset_value\":952.24524076145,\"new_asset_value\":686.45576707724},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":265.78947368421}]', '2022-09-10 23:52:57', '2022-09-10 23:52:59'),
('1070998E43D6E', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"1110529CCFB75\"', 'escrow_asset_unlock', 'escrow', 'lodza', 'USDT', '644.68085106383', '[{\"user_username\":\"escrow\",\"old_asset_value\":644.68085106383,\"new_asset_value\":0},{\"user_username\":\"lodza\",\"old_asset_value\":173.20361754758,\"new_asset_value\":817.88446861141}]', '2022-09-10 23:52:21', '2022-09-10 23:52:21'),
('109740469164D', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '106.76', '[{\"user_username\":\"lodza\",\"old_asset_value\":967.86579,\"new_asset_value\":1074.62579}]', '2022-09-10 23:51:44', NULL),
('10984689E4A3D', NULL, 'TEST_SESSION', 'Asset release for trade \"194032D384C42\"', 'trade_asset_release', 'keith', 'peter', 'USDT', '265.95744680851', '[{\"user_username\":\"keith\",\"old_asset_value\":536.30459126541,\"new_asset_value\":270.3471444569},{\"user_username\":\"peter\",\"old_asset_value\":0,\"new_asset_value\":265.95744680851}]', '2022-09-10 23:52:41', NULL),
('11018872D89E8', NULL, 'TEST_SESSION', 'Platform charge for transaction \"1616306C08140\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '1.8421052631579', '[{\"user_username\":\"jimmy\",\"old_asset_value\":954.08734602461,\"new_asset_value\":952.24524076145},{\"user_username\":\"reserves\",\"old_asset_value\":1608.5089031588,\"new_asset_value\":1610.351008422}]', '2022-09-10 23:52:55', NULL),
('11107589C5147', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"1974446B1DF16\"', 'escrow_asset_unlock', 'escrow', 'keith', 'USDT', '164.38802083333', '[{\"user_username\":\"escrow\",\"old_asset_value\":164.38802083333,\"new_asset_value\":0},{\"user_username\":\"keith\",\"old_asset_value\":103.29954915548,\"new_asset_value\":267.68756998881}]', '2022-09-10 23:52:47', '2022-09-10 23:52:47'),
('116557C59D915', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"106468989069E\"', 'escrow_asset_unlock', 'escrow', 'lodza', 'USDT', '150.42553191489', '[{\"user_username\":\"escrow\",\"old_asset_value\":150.42553191489,\"new_asset_value\":0},{\"user_username\":\"lodza\",\"old_asset_value\":817.88446861142,\"new_asset_value\":968.31000052631}]', '2022-09-10 23:52:14', '2022-09-10 23:52:14'),
('116937E4F19FA', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'flint', 'USDT', '400', '[{\"user_username\":\"flint\",\"old_asset_value\":0,\"new_asset_value\":400}]', '2022-09-10 23:51:42', NULL),
('118610104F286', NULL, 'TEST_SESSION', 'Asset release for trade \"138601EB0FDA3\"', 'trade_asset_release', 'jimmy', 'nassim', 'USDT', '202.24719101124', '[{\"user_username\":\"jimmy\",\"old_asset_value\":686.45576707724,\"new_asset_value\":484.208576066},{\"user_username\":\"nassim\",\"old_asset_value\":100,\"new_asset_value\":302.24719101124}]', '2022-09-10 23:53:07', NULL),
('1198006DDE349', NULL, 'TEST_SESSION', 'Platform charge for transaction \"136227BE1567D\"', 'platform_charge', 'ross', 'reserves', 'USDT', '2.1276595744681', '[{\"user_username\":\"ross\",\"old_asset_value\":3.61702127659,\"new_asset_value\":1.4893617021219},{\"user_username\":\"reserves\",\"old_asset_value\":1599.9888017916,\"new_asset_value\":1602.1164613661}]', '2022-09-10 23:52:30', NULL),
('119865696CF40', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"188043A16BD39\"', 'escrow_asset_lock', 'lodza', 'escrow', 'USDT', '106.31578947368', '[{\"user_username\":\"lodza\",\"old_asset_value\":1074.62579,\"new_asset_value\":968.31000052632},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":106.31578947368}]', '2022-09-10 23:52:06', '2022-09-10 23:52:08'),
('125420D876698', NULL, 'TEST_SESSION', 'Platform charge for transaction \"127168E7B020D\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.4893617021277', '[{\"user_username\":\"lodza\",\"old_asset_value\":819.37383031354,\"new_asset_value\":817.88446861141},{\"user_username\":\"reserves\",\"old_asset_value\":1592.1164613661,\"new_asset_value\":1593.6058230682}]', '2022-09-10 23:52:17', NULL),
('127168E7B020D', NULL, 'TEST_SESSION', 'Asset release for trade \"106468989069E\"', 'trade_asset_release', 'lodza', 'keith', 'USDT', '148.93617021277', '[{\"user_username\":\"lodza\",\"old_asset_value\":968.31000052631,\"new_asset_value\":819.37383031354},{\"user_username\":\"keith\",\"old_asset_value\":600,\"new_asset_value\":748.93617021277}]', '2022-09-10 23:52:16', NULL),
('127414F0E75B6', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"106908FB3BEF5\"', 'escrow_asset_lock', 'flint', 'escrow', 'USDT', '207.94117647059', '[{\"user_username\":\"flint\",\"old_asset_value\":347.86679964539,\"new_asset_value\":139.9256231748},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":207.94117647059}]', '2022-09-10 23:53:16', '2022-09-10 23:53:18'),
('128153A83535E', NULL, 'TEST_SESSION', 'Asset release for trade \"168315C0AED97\"', 'trade_asset_release', 'jimmy', 'raymond', 'USDT', '263.15789473684', '[{\"user_username\":\"jimmy\",\"old_asset_value\":952.24524076145,\"new_asset_value\":689.08734602461},{\"user_username\":\"raymond\",\"old_asset_value\":105.26315789474,\"new_asset_value\":368.42105263158}]', '2022-09-10 23:53:00', NULL),
('128532D07E342', NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"103459C439AEB\"', 'deposit_token_topup', 'reserves', 'jimmy', 'USDT', '500', '[{\"user_username\":\"reserves\",\"old_asset_value\":2290,\"new_asset_value\":1790},{\"user_username\":\"jimmy\",\"old_asset_value\":0,\"new_asset_value\":500}]', '2022-09-10 23:51:49', NULL),
('13044043BE598', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"194032D384C42\"', 'escrow_asset_lock', 'keith', 'escrow', 'USDT', '268.6170212766', '[{\"user_username\":\"keith\",\"old_asset_value\":536.30459126541,\"new_asset_value\":267.68756998881},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":268.6170212766}]', '2022-09-10 23:52:38', '2022-09-10 23:52:40'),
('132457B8014E4', NULL, 'TEST_SESSION', 'Asset release for trade \"1974446B1DF16\"', 'trade_asset_release', 'keith', 'flint', 'USDT', '162.76041666667', '[{\"user_username\":\"keith\",\"old_asset_value\":267.68756998881,\"new_asset_value\":104.92715332214},{\"user_username\":\"flint\",\"old_asset_value\":400,\"new_asset_value\":562.76041666667}]', '2022-09-10 23:52:48', NULL),
('136227BE1567D', NULL, 'TEST_SESSION', 'Asset release for trade \"190093E8C5834\"', 'trade_asset_release', 'ross', 'clarence', 'USDT', '212.76595744681', '[{\"user_username\":\"ross\",\"old_asset_value\":216.3829787234,\"new_asset_value\":3.61702127659},{\"user_username\":\"clarence\",\"old_asset_value\":100,\"new_asset_value\":312.76595744681}]', '2022-09-10 23:52:28', NULL),
('1385352EF237B', NULL, 'TEST_SESSION', 'Asset release for trade \"133656C006547\"', 'trade_asset_release', 'flint', 'guddaz', 'USDT', '212.76595744681', '[{\"user_username\":\"flint\",\"old_asset_value\":562.76041666667,\"new_asset_value\":349.99445921986},{\"user_username\":\"guddaz\",\"old_asset_value\":210.33027015937,\"new_asset_value\":423.09622760618}]', '2022-09-10 23:53:13', NULL),
('1397976D0D7A2', NULL, 'TEST_SESSION', 'Platform charge for transaction \"118610104F286\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.0224719101124', '[{\"user_username\":\"jimmy\",\"old_asset_value\":484.208576066,\"new_asset_value\":482.18610415589},{\"user_username\":\"reserves\",\"old_asset_value\":1612.9825873694,\"new_asset_value\":1615.0050592795}]', '2022-09-10 23:53:08', NULL),
('139937CEEF5A7', NULL, 'TEST_SESSION', 'Platform charge for transaction \"1444599969ECB\"', 'platform_charge', 'guddaz', 'reserves', 'USDT', '1.063829787234', '[{\"user_username\":\"guddaz\",\"old_asset_value\":211.3940999466,\"new_asset_value\":210.33027015937},{\"user_username\":\"reserves\",\"old_asset_value\":1590,\"new_asset_value\":1591.0638297872}]', '2022-09-10 23:52:04', NULL),
('142216C6C5798', NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"106153E1679CE\"', 'deposit_token_topup', 'reserves', 'nassim', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_asset_value\":1690,\"new_asset_value\":1590},{\"user_username\":\"nassim\",\"old_asset_value\":0,\"new_asset_value\":100}]', '2022-09-10 23:51:53', NULL),
('1430905CB7709', NULL, 'TEST_SESSION', 'Transfer from Ledger wallet to Ankelli wallet.', 'internalisation', NULL, 'lodza', 'USDT', '967.86579', '[{\"user_username\":\"lodza\",\"old_asset_value\":0,\"new_asset_value\":967.86579}]', '2022-09-10 23:51:41', NULL),
('1444599969ECB', NULL, 'TEST_SESSION', 'Asset release for trade \"158114D8EB87D\"', 'trade_asset_release', 'guddaz', 'ross', 'USDT', '106.3829787234', '[{\"user_username\":\"guddaz\",\"old_asset_value\":317.77707867,\"new_asset_value\":211.3940999466},{\"user_username\":\"ross\",\"old_asset_value\":110,\"new_asset_value\":216.3829787234}]', '2022-09-10 23:52:02', NULL),
('1465503BF8E3E', NULL, 'TEST_SESSION', 'Asset release for trade \"1110529CCFB75\"', 'trade_asset_release', 'lodza', 'jimmy', 'USDT', '638.29787234043', '[{\"user_username\":\"lodza\",\"old_asset_value\":817.88446861141,\"new_asset_value\":179.58659627098},{\"user_username\":\"jimmy\",\"old_asset_value\":500,\"new_asset_value\":1138.2978723404}]', '2022-09-10 23:52:22', NULL),
('1470179A565E0', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"1974446B1DF16\"', 'escrow_asset_lock', 'keith', 'escrow', 'USDT', '164.38802083333', '[{\"user_username\":\"keith\",\"old_asset_value\":267.68756998881,\"new_asset_value\":103.29954915548},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":164.38802083333}]', '2022-09-10 23:52:45', '2022-09-10 23:52:47'),
('150007FCF356C', NULL, 'TEST_SESSION', 'Platform charge for transaction \"132457B8014E4\"', 'platform_charge', 'keith', 'reserves', 'USDT', '1.6276041666667', '[{\"user_username\":\"keith\",\"old_asset_value\":104.92715332214,\"new_asset_value\":103.29954915547},{\"user_username\":\"reserves\",\"old_asset_value\":1606.8812989921,\"new_asset_value\":1608.5089031588}]', '2022-09-10 23:52:49', NULL),
('1536153730B17', NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"180824879479F\"', 'deposit_token_topup', 'reserves', 'keith', 'USDT', '600', '[{\"user_username\":\"reserves\",\"old_asset_value\":2890,\"new_asset_value\":2290},{\"user_username\":\"keith\",\"old_asset_value\":0,\"new_asset_value\":600}]', '2022-09-10 23:51:47', NULL),
('153686FEA082B', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"158114D8EB87D\"', 'escrow_asset_unlock', 'escrow', 'guddaz', 'USDT', '107.44680851064', '[{\"user_username\":\"escrow\",\"old_asset_value\":107.44680851064,\"new_asset_value\":0},{\"user_username\":\"guddaz\",\"old_asset_value\":210.33027015936,\"new_asset_value\":317.77707867}]', '2022-09-10 23:52:01', '2022-09-10 23:52:01'),
('1539431BA3D81', NULL, 'TEST_SESSION', 'Platform charge for transaction \"1465503BF8E3E\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '6.3829787234043', '[{\"user_username\":\"lodza\",\"old_asset_value\":179.58659627098,\"new_asset_value\":173.20361754758},{\"user_username\":\"reserves\",\"old_asset_value\":1593.6058230682,\"new_asset_value\":1599.9888017916}]', '2022-09-10 23:52:23', NULL),
('1562359CD3145', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"106908FB3BEF5\"', 'escrow_asset_unlock', 'escrow', 'flint', 'USDT', '207.94117647059', '[{\"user_username\":\"escrow\",\"old_asset_value\":207.94117647059,\"new_asset_value\":0},{\"user_username\":\"flint\",\"old_asset_value\":139.9256231748,\"new_asset_value\":347.86679964539}]', '2022-09-10 23:53:18', '2022-09-10 23:53:18'),
('1565590881197', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"158114D8EB87D\"', 'escrow_asset_lock', 'guddaz', 'escrow', 'USDT', '107.44680851064', '[{\"user_username\":\"guddaz\",\"old_asset_value\":317.77707867,\"new_asset_value\":210.33027015936},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":107.44680851064}]', '2022-09-10 23:51:55', '2022-09-10 23:52:01'),
('15782454EB980', NULL, 'TEST_SESSION', 'Asset release for trade \"159801AF97645\"', 'trade_asset_release', 'keith', 'lodza', 'USDT', '210.52631578947', '[{\"user_username\":\"keith\",\"old_asset_value\":748.93617021277,\"new_asset_value\":538.4098544233},{\"user_username\":\"lodza\",\"old_asset_value\":173.20361754758,\"new_asset_value\":383.72993333705}]', '2022-09-10 23:52:35', NULL),
('159435A076DC0', NULL, 'TEST_SESSION', 'Transfer from Exodus wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '98.9012', '[{\"user_username\":\"guddaz\",\"old_asset_value\":218.87587867,\"new_asset_value\":317.77707867}]', '2022-09-10 23:51:43', NULL),
('159751BB7BDCF', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"133656C006547\"', 'escrow_asset_lock', 'flint', 'escrow', 'USDT', '214.89361702128', '[{\"user_username\":\"flint\",\"old_asset_value\":562.76041666667,\"new_asset_value\":347.86679964539},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":214.89361702128}]', '2022-09-10 23:53:10', '2022-09-10 23:53:12'),
('1616306C08140', NULL, 'TEST_SESSION', 'Asset release for trade \"195557539EDF6\"', 'trade_asset_release', 'jimmy', 'lodza', 'USDT', '184.21052631579', '[{\"user_username\":\"jimmy\",\"old_asset_value\":1138.2978723404,\"new_asset_value\":954.08734602461},{\"user_username\":\"lodza\",\"old_asset_value\":383.72993333705,\"new_asset_value\":567.94045965284}]', '2022-09-10 23:52:54', NULL),
('1616396D8024F', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"195557539EDF6\"', 'escrow_asset_unlock', 'escrow', 'jimmy', 'USDT', '186.05263157895', '[{\"user_username\":\"escrow\",\"old_asset_value\":186.05263157895,\"new_asset_value\":0},{\"user_username\":\"jimmy\",\"old_asset_value\":952.24524076145,\"new_asset_value\":1138.2978723404}]', '2022-09-10 23:52:53', '2022-09-10 23:52:53'),
('16272930651AD', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli wallet.', 'internalisation', NULL, 'guddaz', 'USDT', '218.87587867', '[{\"user_username\":\"guddaz\",\"old_asset_value\":0,\"new_asset_value\":218.87587867}]', '2022-09-10 23:51:39', NULL),
('163334E7AAC54', NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"1428739A7B783\"', 'deposit_token_topup', 'reserves', 'clarence', 'USDT', '100', '[{\"user_username\":\"reserves\",\"old_asset_value\":1790,\"new_asset_value\":1690},{\"user_username\":\"clarence\",\"old_asset_value\":0,\"new_asset_value\":100}]', '2022-09-10 23:51:51', NULL),
('166966CCEDFAA', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"138601EB0FDA3\"', 'escrow_asset_unlock', 'escrow', 'jimmy', 'USDT', '204.26966292135', '[{\"user_username\":\"escrow\",\"old_asset_value\":204.26966292135,\"new_asset_value\":0},{\"user_username\":\"jimmy\",\"old_asset_value\":482.18610415589,\"new_asset_value\":686.45576707724}]', '2022-09-10 23:53:05', '2022-09-10 23:53:05'),
('16819275009E8', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"188043A16BD39\"', 'escrow_asset_unlock', 'escrow', 'lodza', 'USDT', '106.31578947368', '[{\"user_username\":\"escrow\",\"old_asset_value\":106.31578947368,\"new_asset_value\":0},{\"user_username\":\"lodza\",\"old_asset_value\":968.31000052632,\"new_asset_value\":1074.62579}]', '2022-09-10 23:52:08', '2022-09-10 23:52:08'),
('170985BA8CB2B', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"1110529CCFB75\"', 'escrow_asset_lock', 'lodza', 'escrow', 'USDT', '644.68085106383', '[{\"user_username\":\"lodza\",\"old_asset_value\":817.88446861141,\"new_asset_value\":173.20361754758},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":644.68085106383}]', '2022-09-10 23:52:19', '2022-09-10 23:52:21'),
('1722259ED4D8D', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"106468989069E\"', 'escrow_asset_lock', 'lodza', 'escrow', 'USDT', '150.42553191489', '[{\"user_username\":\"lodza\",\"old_asset_value\":968.31000052631,\"new_asset_value\":817.88446861142},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":150.42553191489}]', '2022-09-10 23:52:13', '2022-09-10 23:52:14'),
('1734960101764', NULL, 'TEST_SESSION', 'Platform charge for transaction \"10984689E4A3D\"', 'platform_charge', 'keith', 'reserves', 'USDT', '2.6595744680851', '[{\"user_username\":\"keith\",\"old_asset_value\":270.3471444569,\"new_asset_value\":267.68756998881},{\"user_username\":\"reserves\",\"old_asset_value\":1604.221724524,\"new_asset_value\":1606.8812989921}]', '2022-09-10 23:52:43', NULL),
('178019C7CD55D', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"138601EB0FDA3\"', 'escrow_asset_lock', 'jimmy', 'escrow', 'USDT', '204.26966292135', '[{\"user_username\":\"jimmy\",\"old_asset_value\":686.45576707724,\"new_asset_value\":482.18610415589},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":204.26966292135}]', '2022-09-10 23:53:03', '2022-09-10 23:53:05'),
('179601767D656', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"168315C0AED97\"', 'escrow_asset_unlock', 'escrow', 'jimmy', 'USDT', '265.78947368421', '[{\"user_username\":\"escrow\",\"old_asset_value\":265.78947368421,\"new_asset_value\":0},{\"user_username\":\"jimmy\",\"old_asset_value\":686.45576707724,\"new_asset_value\":952.24524076145}]', '2022-09-10 23:52:59', '2022-09-10 23:52:59'),
('18031076C831A', NULL, 'TEST_SESSION', 'Platform charge for transaction \"19779539AB461\"', 'platform_charge', 'lodza', 'reserves', 'USDT', '1.0526315789474', '[{\"user_username\":\"lodza\",\"old_asset_value\":969.36263210526,\"new_asset_value\":968.31000052631},{\"user_username\":\"reserves\",\"old_asset_value\":1591.0638297872,\"new_asset_value\":1592.1164613661}]', '2022-09-10 23:52:11', NULL),
('1821276ABF394', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"159801AF97645\"', 'escrow_asset_unlock', 'escrow', 'keith', 'USDT', '212.63157894737', '[{\"user_username\":\"escrow\",\"old_asset_value\":212.63157894737,\"new_asset_value\":0},{\"user_username\":\"keith\",\"old_asset_value\":536.3045912654,\"new_asset_value\":748.93617021277}]', '2022-09-10 23:52:34', '2022-09-10 23:52:34'),
('1825337F0C903', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"190093E8C5834\"', 'escrow_asset_lock', 'ross', 'escrow', 'USDT', '214.89361702128', '[{\"user_username\":\"ross\",\"old_asset_value\":216.3829787234,\"new_asset_value\":1.4893617021234},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":214.89361702128}]', '2022-09-10 23:52:25', '2022-09-10 23:52:27'),
('183596C445801', NULL, 'TEST_SESSION', 'Platform charge for transaction \"198545DFBB69B\"', 'platform_charge', 'flint', 'reserves', 'USDT', '2.0588235294118', '[{\"user_username\":\"flint\",\"old_asset_value\":141.98444670421,\"new_asset_value\":139.9256231748},{\"user_username\":\"reserves\",\"old_asset_value\":1617.132718854,\"new_asset_value\":1619.1915423834}]', '2022-09-10 23:53:21', NULL),
('18375886F8B4D', NULL, 'TEST_SESSION', 'Transfer from Coinbase wallet to Ankelli Reserves Wallet.', 'internalisation', NULL, 'reserves', 'USDT', '3000', '[{\"user_username\":\"reserves\",\"old_asset_value\":0,\"new_asset_value\":3000}]', '2022-09-10 23:51:38', NULL),
('188086195755E', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"190093E8C5834\"', 'escrow_asset_unlock', 'escrow', 'ross', 'USDT', '214.89361702128', '[{\"user_username\":\"escrow\",\"old_asset_value\":214.89361702128,\"new_asset_value\":0},{\"user_username\":\"ross\",\"old_asset_value\":1.4893617021234,\"new_asset_value\":216.3829787234}]', '2022-09-10 23:52:27', '2022-09-10 23:52:27'),
('191699BD8C563', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"159801AF97645\"', 'escrow_asset_lock', 'keith', 'escrow', 'USDT', '212.63157894737', '[{\"user_username\":\"keith\",\"old_asset_value\":748.93617021277,\"new_asset_value\":536.3045912654},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":212.63157894737}]', '2022-09-10 23:52:32', '2022-09-10 23:52:34'),
('192028BD8A82F', NULL, 'TEST_SESSION', 'Wallet topup using deposit token \"1756476A491C8\"', 'deposit_token_topup', 'reserves', 'ross', 'USDT', '110', '[{\"user_username\":\"reserves\",\"old_asset_value\":3000,\"new_asset_value\":2890},{\"user_username\":\"ross\",\"old_asset_value\":0,\"new_asset_value\":110}]', '2022-09-10 23:51:46', NULL),
('1953190D2BA2C', NULL, 'TEST_SESSION', 'Unlock asset from escrow for trade \"133656C006547\"', 'escrow_asset_unlock', 'escrow', 'flint', 'USDT', '214.89361702128', '[{\"user_username\":\"escrow\",\"old_asset_value\":214.89361702128,\"new_asset_value\":0},{\"user_username\":\"flint\",\"old_asset_value\":347.86679964539,\"new_asset_value\":562.76041666667}]', '2022-09-10 23:53:12', '2022-09-10 23:53:12'),
('196600467B6DA', NULL, 'TEST_SESSION', 'Platform charge for transaction \"128153A83535E\"', 'platform_charge', 'jimmy', 'reserves', 'USDT', '2.6315789473684', '[{\"user_username\":\"jimmy\",\"old_asset_value\":689.08734602461,\"new_asset_value\":686.45576707724},{\"user_username\":\"reserves\",\"old_asset_value\":1610.351008422,\"new_asset_value\":1612.9825873694}]', '2022-09-10 23:53:02', NULL),
('1967397120F20', NULL, 'TEST_SESSION', 'Platform charge for transaction \"1385352EF237B\"', 'platform_charge', 'flint', 'reserves', 'USDT', '2.1276595744681', '[{\"user_username\":\"flint\",\"old_asset_value\":349.99445921986,\"new_asset_value\":347.86679964539},{\"user_username\":\"reserves\",\"old_asset_value\":1615.0050592795,\"new_asset_value\":1617.132718854}]', '2022-09-10 23:53:14', NULL),
('197398EF109B6', NULL, 'TEST_SESSION', 'Lock asset in escrow for trade \"195557539EDF6\"', 'escrow_asset_lock', 'jimmy', 'escrow', 'USDT', '186.05263157895', '[{\"user_username\":\"jimmy\",\"old_asset_value\":1138.2978723404,\"new_asset_value\":952.24524076145},{\"user_username\":\"escrow\",\"old_asset_value\":0,\"new_asset_value\":186.05263157895}]', '2022-09-10 23:52:51', '2022-09-10 23:52:53'),
('19779539AB461', NULL, 'TEST_SESSION', 'Asset release for trade \"188043A16BD39\"', 'trade_asset_release', 'lodza', 'raymond', 'USDT', '105.26315789474', '[{\"user_username\":\"lodza\",\"old_asset_value\":1074.62579,\"new_asset_value\":969.36263210526},{\"user_username\":\"raymond\",\"old_asset_value\":0,\"new_asset_value\":105.26315789474}]', '2022-09-10 23:52:09', NULL),
('198545DFBB69B', NULL, 'TEST_SESSION', 'Asset release for trade \"106908FB3BEF5\"', 'trade_asset_release', 'flint', 'peter', 'USDT', '205.88235294118', '[{\"user_username\":\"flint\",\"old_asset_value\":347.86679964539,\"new_asset_value\":141.98444670421},{\"user_username\":\"peter\",\"old_asset_value\":265.95744680851,\"new_asset_value\":471.83979974969}]', '2022-09-10 23:53:19', NULL);

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
(1, 'system', 'system', '', NULL, NULL, 'active', '2022-09-11 01:51:20', NULL, NULL),
(2, 'escrow', 'escrow', '', NULL, NULL, 'active', '2022-09-11 01:51:20', NULL, NULL),
(3, 'developer', 'developer.ankelli@gmail.com', '$2y$10$Busdvl2TFfP0B4CVE3FgeOo8QZVZKt1.AFulN0emYHAMJklFeiE5e', NULL, NULL, 'active', '2022-09-10 23:51:24', '2022-09-10 23:51:24', NULL),
(4, 'sysadmin', 'sysadmin@ankelli.com', '$2y$10$aK/AmbK9ocRPUht6iZdokunTX1heZKUFs490qIsS49eXFLxu26dOW', NULL, NULL, 'active', '2022-09-10 23:51:25', '2022-09-10 23:51:25', NULL),
(5, 'reserves', 'reserves@ankelli.com', '$2y$10$3inAsVn3Ylt88AsoGPS/kulPPEwPhLHA2kcwY6oZ6wzH5M0faW5d6', NULL, NULL, 'active', '2022-09-10 23:51:26', '2022-09-10 23:51:26', NULL),
(6, 'busadmin', 'busadmin@ankelli.com', '$2y$10$1/YxKlfWvbCzQrKsN8AfQeAirH3jSG3SQEXS3XeWAXhhMhjsFVqqu', NULL, NULL, 'active', '2022-09-10 23:51:27', '2022-09-10 23:51:27', NULL),
(7, 'guddaz', 'goodhopedhliwayo@gmail.com', '$2y$10$e2ju2d0V5/svAJmh78bhCe9Ox.HdIvpLwxYj07JbViVC8gznQdzMi', NULL, NULL, 'active', '2022-09-10 23:51:31', '2022-09-10 23:51:31', NULL),
(8, 'lodza', 'lodza@example.com', '$2y$10$xhB5xcGrKfkwhNrm37I6R.HyQv3DOEIu1Z4AmXKIXpbh.ek6yxLgm', NULL, NULL, 'active', '2022-09-10 23:51:32', '2022-09-10 23:51:32', NULL),
(9, 'ross', 'ross@example.com', '$2y$10$OSkMoVOE0MoH0xOZnQLwdeynqqp.ezxJYNWXcFn52JmgxIsKDSUnS', NULL, NULL, 'active', '2022-09-10 23:51:33', '2022-09-10 23:51:33', NULL),
(10, 'jimmy', 'jimmy@example.com', '$2y$10$R.D3F1get.Lzzr32k9xhfOZMaKnBHq2M7jkbpW1AwdPXtbsrcSO4O', NULL, NULL, 'active', '2022-09-10 23:51:33', '2022-09-10 23:51:33', NULL),
(11, 'keith', 'keith@example.com', '$2y$10$qxNpbgpnZ9EAu4IyZ947wu8rYvkXZWtJWPg6xL.uvMCLmw7xdUzMy', NULL, NULL, 'active', '2022-09-10 23:51:34', '2022-09-10 23:51:34', NULL),
(12, 'peter', 'peter@example.com', '$2y$10$C0xFOk0RdhoBWmjSnT.LF.rEpiw83P7BySmVVNz8E8Vj.Jsp/xfbu', NULL, NULL, 'active', '2022-09-10 23:51:34', '2022-09-10 23:51:34', NULL),
(13, 'flint', 'flint@example.com', '$2y$10$1vg1Q76tPn2VbHmuk5suFO4RREJBgHVETr6qN64WBWdqUjbT61OTG', NULL, NULL, 'active', '2022-09-10 23:51:35', '2022-09-10 23:51:35', NULL),
(14, 'clarence', 'clarence@example.com', '$2y$10$ZzigjPtC4hdUVPgsw6s7IeYo2IkwrO83A2xK9L725.SY2eUOFyt7m', NULL, NULL, 'active', '2022-09-10 23:51:36', '2022-09-10 23:51:36', NULL),
(15, 'raymond', 'raymond@example.com', '$2y$10$n1rUMVvsruRgVymIPEWHwunK4cdxcYffKOjw/GOSpLJRTmFsWtFPm', NULL, NULL, 'active', '2022-09-10 23:51:37', '2022-09-10 23:51:37', NULL),
(16, 'nassim', 'nassim@example.com', '$2y$10$9d7kNlMqNC33JmgSPFLBu.UJygqh20JyMSxlzV.kbFxy7UWh4vRwG', NULL, NULL, 'active', '2022-09-10 23:51:37', '2022-09-10 23:51:37', NULL);

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
(1, 'Default Users', 'default_users', 'Group for Default User accounts created on system initialization and factory_data loading. \nNew users cannot be added to this group.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(2, 'Administrators', 'administrators', 'Automatically joined group (Users with active Admin Extension). \nMembers can be added to other admin groups.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(3, 'Developers', 'developers', 'Admin group for unrestricted system users. \nMembers have access to all features and OTP access to account named \"developer\". \nOnly \"developer\" account can add members to this group.\nGroup used for System Development and Maintenance.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(4, 'System Administrators', 'system_administrators', 'Admin Group for System Administrators. \nMembers can manage system functions and sysconfig params. \nMembers have OTP access to account named \"sysadmin\".\nOnly \"sysadmin\" account can add members to this group.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(5, 'Business Administrators', 'business_administrators', 'Admin group for Business Administrators.\nMembers have access to business related features.\nMembers have OTP access to accounts named \"reserves\" and \"busadmin\".\nOnly \"busadmin\" account can add members to this group.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(6, 'User Administrators', 'user_administrators', 'Admin group for User Administrators. \nMembers can manage other users and user related queries.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(7, 'Platform moderators', 'platform_moderators', 'Group for Platform moderators. \nMembers can respond in the customer service chat module, handle flagged business elements, manage daily updates.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(8, 'Sellers', 'sellers', 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(9, 'Buyers', 'buyers', 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL),
(10, 'Beta Testers', 'beta_testers', 'User Group for selected individuals to test certain features before they are published.', 'active', 'system', '2022-09-11 01:51:22', NULL, NULL);

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
(1, 'developer', 'default_users', 'active', 'system', '2022-09-10 23:51:24', '2022-09-10 23:51:24'),
(2, 'developer', 'developers', 'active', 'system', '2022-09-10 23:51:25', '2022-09-10 23:51:25'),
(3, 'sysadmin', 'default_users', 'active', 'system', '2022-09-10 23:51:25', '2022-09-10 23:51:25'),
(4, 'sysadmin', 'system_administrators', 'active', 'system', '2022-09-10 23:51:26', '2022-09-10 23:51:26'),
(5, 'reserves', 'default_users', 'active', 'system', '2022-09-10 23:51:26', '2022-09-10 23:51:26'),
(6, 'reserves', 'business_administrators', 'active', 'system', '2022-09-10 23:51:27', '2022-09-10 23:51:27'),
(7, 'busadmin', 'default_users', 'active', 'system', '2022-09-10 23:51:27', '2022-09-10 23:51:27'),
(8, 'busadmin', 'business_administrators', 'active', 'system', '2022-09-10 23:51:28', '2022-09-10 23:51:28'),
(9, 'guddaz', 'developers', 'active', 'system', '2022-09-10 23:51:31', '2022-09-10 23:51:31'),
(10, 'lodza', 'system_administrators', 'active', 'system', '2022-09-10 23:51:32', '2022-09-10 23:51:32'),
(11, 'lodza', 'user_administrators', 'active', 'system', '2022-09-10 23:51:32', '2022-09-10 23:51:32'),
(12, 'lodza', 'business_administrators', 'active', 'system', '2022-09-10 23:51:32', '2022-09-10 23:51:32');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=561;

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
