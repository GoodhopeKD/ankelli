-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 15, 2022 at 11:08 AM
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
(463, '2014_10_12_000000_create_users_table', 1),
(464, '2014_10_12_100000_create_password_resets_table', 1),
(465, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(466, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(467, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(468, '2016_06_01_000004_create_oauth_clients_table', 1),
(469, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(470, '2019_08_19_000000_create_failed_jobs_table', 1),
(471, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(472, '2022_07_26_072110_create___admin_extensions_table', 1),
(473, '2022_07_26_072112_create___buyer_extensions_table', 1),
(474, '2022_07_26_072114_create___seller_extensions_table', 1),
(475, '2022_07_26_072120_create___user_groups_table', 1),
(476, '2022_07_26_072122_create___user_group_memberships_table', 1),
(477, '2022_07_26_072124_create___permissions_table', 1),
(478, '2022_07_26_072126_create___permission_instances_table', 1),
(479, '2022_07_26_072130_create___sessions_table', 1),
(480, '2022_07_26_072131_create___notifications_table', 1),
(481, '2022_07_26_072132_create___pref_items_table', 1),
(482, '2022_07_26_072135_create___reg_tokens_table', 1),
(483, '2022_07_26_072136_create___verif_tokens_table', 1),
(484, '2022_07_26_072137_create___email_addresses_table', 1),
(485, '2022_07_26_072140_create___phone_nos_table', 1),
(486, '2022_07_26_072324_create___files_table', 1),
(487, '2022_07_26_072326_create___feedback_reports_table', 1),
(488, '2022_07_26_072327_create___posts_table', 1),
(489, '2022_07_26_072332_create___assets_table', 1),
(490, '2022_07_26_072333_create___asset_wallets_table', 1),
(491, '2022_07_26_072334_create___asset_wallet_addresses_table', 1),
(492, '2022_07_26_072336_create___currencies_table', 1),
(493, '2022_07_26_072337_create___pymt_methods_table', 1),
(494, '2022_07_26_072345_create___countries_table', 1),
(495, '2022_07_26_072347_create___exportables_table', 1),
(496, '2022_07_26_072410_create___deposit_tokens_table', 1),
(497, '2022_07_26_072416_create___offers_table', 1),
(498, '2022_07_26_072417_create___trades_table', 1),
(499, '2022_07_26_072419_create___chats_table', 1),
(500, '2022_07_26_072420_create___messages_table', 1),
(501, '2022_07_26_072421_create___pinnings_table', 1),
(502, '2022_07_26_072424_create___reviews_table', 1),
(503, '2022_07_26_072443_create___transactions_table', 1),
(504, '2022_07_26_072444_create___logs_table', 1);

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
(1, NULL, 'Ankelli Personal Access Client', 'eYF8OVktVkSXiU6FssxOJhGb4lYxlivsjEJ31C4K', NULL, 'http://localhost', 1, 0, 0, '2022-10-15 07:01:48', '2022-10-15 07:01:48'),
(2, NULL, 'Ankelli Password Grant Client', 'ZQ2nIHBAcbCjpOo2DCwNuhLvyJwL13zL01WOyNR4', 'users', 'http://localhost', 0, 1, 0, '2022-10-15 07:01:48', '2022-10-15 07:01:48');

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
(1, 1, '2022-10-15 07:01:48', '2022-10-15 07:01:48');

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
(1, 'system', 'System', 'active', 'system', '2022-10-15 09:01:24', NULL, NULL),
(2, 'developer', 'Default Developer', 'active', 'system', '2022-10-15 07:02:04', '2022-10-15 07:02:04', NULL),
(3, 'sysadmin', 'Default System Administrator', 'active', 'system', '2022-10-15 07:02:08', '2022-10-15 07:02:08', NULL),
(4, 'busadmin', 'Default Business Administrator', 'active', 'system', '2022-10-15 07:02:13', '2022-10-15 07:02:13', NULL),
(5, 'reserves', 'Ankelli Asset Reserves', 'active', 'system', '2022-10-15 07:02:43', '2022-10-15 07:02:43', NULL),
(6, 'busops', 'Ankelli Business Operations', 'active', 'system', '2022-10-15 07:03:10', '2022-10-15 07:03:10', NULL),
(7, 'guddaz', 'Head System Developer', 'active', 'system', '2022-10-15 07:03:35', '2022-10-15 07:03:35', NULL),
(8, 'paywyze', 'Head Business Administrator', 'active', 'system', '2022-10-15 07:04:08', '2022-10-15 07:04:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__assets`
--

CREATE TABLE `__assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fe_asset_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chain` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xpub` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smallest_display_unit` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdrawal_txn_fee_usd_fctr` decimal(8,4) UNSIGNED NOT NULL,
  `withdrawal_min_limit_usd_fctr` tinyint(3) UNSIGNED NOT NULL,
  `withdrawal_max_limit_usd_fctr` int(10) UNSIGNED NOT NULL,
  `usd_asset_exchange_rate` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `onchain_disclaimer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `_status` enum('active','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__assets`
--

INSERT INTO `__assets` (`id`, `name`, `code`, `fe_asset_code`, `chain`, `xpub`, `smallest_display_unit`, `withdrawal_txn_fee_usd_fctr`, `withdrawal_min_limit_usd_fctr`, `withdrawal_max_limit_usd_fctr`, `usd_asset_exchange_rate`, `onchain_disclaimer`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`) VALUES
(1, 'Tether USD', 'ETH', 'USDT', 'ETH', 'xpub6ERKWaEy6mLBzYWoo5P19QTexUufpijY5qod5xaH2ksiYtekeFYAoT3JoK87XKULgG7g3yvvxKwsGEVdkTqcC3BFjthMtJendsN1WH9nHoX', '0.00001', '1.0000', 1, 1000, '0.0007784152501883559', 'This platform is still in test mode using the testnet chain.\nUSDT doesn\'t exist on testnet so we\'re using ETH but referring to it here as USDT.\nThe system does an internal conversion such that 1 ETH = 1000 USDT.\nHandle all internal transactions normally but know that these values will be reflected differently outside this platform.', 'active', 'system', '2022-10-15 07:01:59', '2022-10-15 07:02:02');

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
  `asset_chain` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usable_balance_asset_value` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_balance_asset_value` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `_status` enum('active','frozen') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__asset_wallets`
--

INSERT INTO `__asset_wallets` (`id`, `ttm_virtual_account_id`, `ttm_subscription_id`, `user_username`, `asset_code`, `asset_chain`, `usable_balance_asset_value`, `total_balance_asset_value`, `_status`, `created_datetime`, `updated_datetime`) VALUES
(1, '632c29781bfeea9fefca383d', '634a77243d4fb23d4ace2795', 'reserves', 'ETH', 'ETH', '0.631138622206596744', '0.631138622206596744', 'active', '2022-10-15 07:02:28', '2022-10-15 07:02:28'),
(2, '63296ef838931796fa9e5aed', '634a774b73928730293df1df', 'busops', 'ETH', 'ETH', '1.682414838945668159', '1.682414838945668159', 'active', '2022-10-15 07:03:07', '2022-10-15 07:03:07'),
(3, '632970417b09c5d6322bc225', '634a775de8834116dfc0791f', 'guddaz', 'ETH', 'ETH', '1.15700505050505', '1.15700505050505', 'active', '2022-10-15 07:03:25', '2022-10-15 07:03:25'),
(4, '63298faa64858e37282c6266', '634a778435fda235c41ad398', 'paywyze', 'ETH', 'ETH', '0.45', '0.45', 'active', '2022-10-15 07:04:05', '2022-10-15 07:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `__asset_wallet_addresses`
--

CREATE TABLE `__asset_wallet_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ttm_derivation_key` int(10) UNSIGNED DEFAULT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bc_address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__asset_wallet_addresses`
--

INSERT INTO `__asset_wallet_addresses` (`id`, `ttm_derivation_key`, `user_username`, `bc_address`, `asset_code`) VALUES
(1, 29, 'reserves', '0x49c537e0e9cfb74091c022ecf0090addc27ad6d8', 'ETH'),
(2, 26, 'busops', '0xaaada23b6b5705e23e12f78d064a1f1e62fb6126', 'ETH'),
(3, 27, 'guddaz', '0xf9c4a2455e7c3eaccf97a20415100c35270e983f', 'ETH'),
(4, 28, 'paywyze', '0xaf8ccb7b6a5c5020e422225779340ac0f971ef36', 'ETH');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-10-15 07:02:08', '2022-10-15 07:02:08', NULL),
(2, 'busadmin', 'deactivated', 'system', '2022-10-15 07:02:14', '2022-10-15 07:02:14', NULL),
(3, 'reserves', 'deactivated', 'system', '2022-10-15 07:02:48', '2022-10-15 07:02:48', NULL),
(4, 'busops', 'deactivated', 'system', '2022-10-15 07:03:11', '2022-10-15 07:03:11', NULL);

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
(1, 'Zimbabwe', 'ZIM', NULL, NULL, NULL, 'active', 'system', '2022-10-15 09:01:37', NULL),
(2, 'South Africa', 'RSA', NULL, NULL, NULL, 'active', 'system', '2022-10-15 09:01:37', NULL),
(3, 'United Kingdom', 'UK', NULL, NULL, NULL, 'active', 'system', '2022-10-15 09:01:37', NULL),
(4, 'United States of America', 'USA', NULL, NULL, NULL, 'active', 'system', '2022-10-15 09:01:37', NULL),
(5, 'Russia', 'RUS', NULL, NULL, NULL, 'active', 'system', '2022-10-15 09:01:37', NULL),
(6, 'China', 'CHN', NULL, NULL, NULL, 'active', 'system', '2022-10-15 09:01:37', NULL),
(7, 'Ghana', 'GHA', NULL, NULL, NULL, 'active', 'system', '2022-10-15 09:01:37', NULL),
(8, 'Botswana', 'BOT', NULL, NULL, NULL, 'active', 'system', '2022-10-15 09:01:37', NULL),
(9, 'Zambia', 'ZAM', NULL, NULL, NULL, 'active', 'system', '2022-10-15 09:01:37', NULL),
(10, 'Algeria', 'ALG', NULL, NULL, NULL, 'active', 'system', '2022-10-15 09:01:37', NULL),
(11, 'Italy', 'ITA', NULL, NULL, NULL, 'active', 'system', '2022-10-15 09:01:37', NULL),
(12, 'Nigeria', 'NIG', NULL, NULL, NULL, 'active', 'system', '2022-10-15 09:01:37', NULL);

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
(1, 'US Dollar', 'USD', '$', 1, '1', '10', '1', 'active', 'system', '2022-10-15 09:01:36', NULL),
(2, 'Euro', 'EUR', '€', 1, '1.02', '10', '1', 'active', 'system', '2022-10-15 09:01:36', NULL),
(3, 'Pound Sterling', 'GBP', '£', 1, '0.89', '10', '1', 'active', 'system', '2022-10-15 09:01:36', NULL),
(4, 'South African Rand', 'ZAR', 'R', 0, '18', '100', '10', 'active', 'system', '2022-10-15 09:01:36', NULL),
(5, 'Zambian Kwacha', 'ZMW', 'K', 0, '14', '100', '10', 'active', 'system', '2022-10-15 09:01:36', NULL),
(6, 'Algerian Dinar', 'DZD', 'DA', 0, '210', '100', '100', 'active', 'system', '2022-10-15 09:01:36', NULL),
(7, 'Zimbabwean Dollar', 'ZWL', '$', 1, '800', '500', '50', 'active', 'system', '2022-10-15 09:01:36', NULL);

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
(1, 'developer.ankelli@gmail.com', 'developer', '2022-10-15 07:02:03', NULL),
(2, 'sysadmin@ankelli.com', 'sysadmin', '2022-10-15 07:02:07', NULL),
(3, 'busadmin@ankelli.com', 'busadmin', '2022-10-15 07:02:12', NULL),
(4, 'reserves@ankelli.com', 'reserves', '2022-10-15 07:02:21', NULL),
(5, 'busops@ankelli.com', 'busops', '2022-10-15 07:03:05', NULL),
(6, 'goodhopedhliwayo@gmail.com', 'guddaz', '2022-10-15 07:03:18', NULL),
(7, 'paywyze@ankelli.com', 'paywyze', '2022-10-15 07:03:51', NULL);

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
(1, '__pymt_methods', 'cash_in_person', 'images', 'pymt_method_icon', 'Cash in person', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Cash in person.jpg', 'image/jpg', NULL, 'Cash in person.jpg', NULL, 'system', '2022-10-15 07:01:32', NULL),
(2, '__pymt_methods', 'stanbic_bank', 'images', 'pymt_method_icon', 'Stanbic Bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Stanbic bank.jpg', 'image/jpg', NULL, 'Stanbic Bank Icon.jpg', NULL, 'system', '2022-10-15 07:01:32', NULL),
(3, '__pymt_methods', 'fnb_bank', 'images', 'pymt_method_icon', 'FNB Bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/FNB bank.png', 'image/png', NULL, 'FNB Bank Icon.png', NULL, 'system', '2022-10-15 07:01:32', NULL),
(4, '__pymt_methods', 'mukuru', 'images', 'pymt_method_icon', 'Mukuru Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Mukuru.jpg', 'image/jpg', NULL, 'Mukuru Icon.jpg', NULL, 'system', '2022-10-15 07:01:32', NULL),
(5, '__pymt_methods', 'algerie_poste', 'images', 'pymt_method_icon', 'Algerie poste Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Algerie poste.jpg', 'image/jpg', NULL, 'Algerie poste Icon.jpg', NULL, 'system', '2022-10-15 07:01:32', NULL),
(6, '__pymt_methods', 'mtn_momo', 'images', 'pymt_method_icon', 'MTN MOMO Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/MTN MOMO.png', 'image/png', NULL, 'MTN MOMO Icon.png', NULL, 'system', '2022-10-15 07:01:32', NULL),
(7, '__pymt_methods', 'ecocash', 'images', 'pymt_method_icon', 'Ecocash Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Ecocash.png', 'image/png', NULL, 'Ecocash Icon.png', NULL, 'system', '2022-10-15 07:01:32', NULL),
(8, '__pymt_methods', 'paypal', 'images', 'pymt_method_icon', 'Paypal Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Paypal.png', 'image/png', NULL, 'Paypal Icon.png', NULL, 'system', '2022-10-15 07:01:32', NULL),
(9, '__pymt_methods', 'skrill', 'images', 'pymt_method_icon', 'Skrill Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Skrill.jpg', 'image/jpg', NULL, 'Skrill Icon.jpg', NULL, 'system', '2022-10-15 07:01:32', NULL),
(10, '__pymt_methods', 'world_remit', 'images', 'pymt_method_icon', 'World Remit Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/World Remit.png', 'image/png', NULL, 'World Remit Icon.png', NULL, 'system', '2022-10-15 07:01:32', NULL),
(11, '__pymt_methods', 'mastercard', 'images', 'pymt_method_icon', 'Mastercard Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Mastercard.jpeg', 'image/jpeg', NULL, 'Mastercard Icon.jpeg', NULL, 'system', '2022-10-15 07:01:32', NULL),
(12, '__pymt_methods', 'visa', 'images', 'pymt_method_icon', 'Visa Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Visa.jpg', 'image/jpg', NULL, 'Visa Icon.jpg', NULL, 'system', '2022-10-15 07:01:32', NULL),
(13, '__pymt_methods', 'fbc_bank', 'images', 'pymt_method_icon', 'FBC bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/FBC bank.jpg', 'image/jpg', NULL, 'FBC bank Icon.jpg', NULL, 'system', '2022-10-15 07:01:32', NULL);

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
('07WPJoDdEyaOe4Ap', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-15 07:02:07', NULL, '138188DBAF93B', '__notifications', '1867754BC14B7', NULL, NULL),
('2qCxG4rappUXoX38', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-15 07:03:19', NULL, '109189DA87FCA', '__notifications', '191515F489022', NULL, NULL),
('2yZZRBE7oPTDLGvL', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-15 07:02:07', NULL, '138188DBAF93B', '__email_addresses', 'sysadmin@ankelli.com', NULL, NULL),
('47bl5z3DHDQWxigN', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-15 07:02:12', NULL, '108674B74056A', '__notifications', '109081798B3FE', NULL, NULL),
('484rujf9aSdLM78h', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-15 07:03:31', NULL, NULL, '__asset_wallet_addresses', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('6QqRqhntYU0HUKem', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:02:48', NULL, NULL, '__admin_extensions', 'reserves', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('8nlKCbZQUMHB0G6m', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-15 07:03:05', NULL, '16349151E973E', '__notifications', '187700730B4B5', NULL, NULL),
('bOZbBEcz3w5m4boR', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-15 07:02:12', NULL, '108674B74056A', '__users', 'busadmin', NULL, NULL),
('BqkLOtCADJ4Mf3dJ', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-15 07:03:08', NULL, NULL, '__asset_wallet_addresses', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('BZWaTl5N9npBwyVs', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:02:43', NULL, NULL, '__user_group_memberships', '7', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('dogGMdcWnM5b7BS8', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-15 07:03:51', NULL, '199660E9253BC', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('DptccBFbqkOlYxKh', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:03:02', NULL, NULL, '__user_group_memberships', '8', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('dqkswg3LBlKKCeLt', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:03:40', NULL, NULL, '__admin_extensions', 'guddaz', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('DxSKNs5uFZgP4GOO', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:02:16', NULL, NULL, '__user_group_memberships', '6', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('eHiuTvUSJp5oTlc4', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-15 07:03:05', NULL, '16349151E973E', '__users', 'busops', NULL, NULL),
('eJDbEDpep9kNX1ss', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-15 07:04:08', NULL, NULL, '__asset_wallets', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('EjhfUHZ1zJTyIRvk', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:02:58', NULL, NULL, '__seller_extensions', 'reserves', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('EtKSP3fFRoEYKKa0', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:02:10', NULL, NULL, '__seller_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('EvAzDIdaBeJvntjx', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:03:13', NULL, NULL, '__user_group_memberships', '10', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('FDA5Ek7ovn5qoMdn', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:02:04', NULL, NULL, '__user_group_memberships', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('fjfkAQCVUuhfcePG', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:03:10', NULL, NULL, '__user_group_memberships', '9', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('fXGhIdzMfBn1FaBk', 'FACTORY_SSN', 'Addition of _RegToken entry to database.', 'entry_create', 'system', '2022-10-15 07:04:14', NULL, NULL, '__reg_tokens', '1234567890', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('GAx3CrDyFFO17ZFi', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:03:45', NULL, NULL, '__user_group_memberships', '11', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('geJFzZ94YgoNpFMn', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:03:12', NULL, NULL, '__seller_extensions', 'busops', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('GeO3Hr9QNWKdtiRS', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-15 07:03:05', NULL, '16349151E973E', '__email_addresses', 'busops@ankelli.com', NULL, NULL),
('GEpAhSlOK9eIcm3f', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-15 07:03:35', NULL, NULL, '__asset_wallets', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('hlJaV2IEmpM0ASti', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-15 07:02:12', NULL, '108674B74056A', '__email_addresses', 'busadmin@ankelli.com', NULL, NULL),
('iF6z7ls4lwhFvSQh', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-15 07:03:51', NULL, '199660E9253BC', '__users', 'paywyze', NULL, NULL),
('IgWCQDGSR7w0WIgr', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:02:09', NULL, NULL, '__buyer_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('iUJYDtsnDEgdFhd4', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-15 07:02:21', NULL, '120305A2EE0AC', '__notifications', '1531342C47015', NULL, NULL),
('j3r3ilxx5lWEgkW6', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-15 07:03:04', NULL, '16349151E973E', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('jFNFvr4wncjPxEIi', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-15 07:03:18', NULL, '109189DA87FCA', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('kCvFyTeef0VO9HTZ', 'ICS8SvKwGuTFfV1Z', 'Addition of _Session entry to database.', 'entry_create', NULL, '2022-10-15 07:05:13', '+02:00', NULL, '__sessions', 'ICS8SvKwGuTFfV1Z', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('klNmturJ0sBNeVyj', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:04:09', NULL, NULL, '__admin_extensions', 'paywyze', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('MFXbL6otU3wFeij7', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:02:08', NULL, NULL, '__user_group_memberships', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('mJirQ3l5qch0fisc', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-15 07:03:09', NULL, NULL, '__asset_wallets', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('mQI5HZjHm5mGQc6z', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-15 07:02:38', NULL, NULL, '__asset_wallets', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('MrhQvlVCkc41qqI1', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:02:13', NULL, NULL, '__user_group_memberships', '5', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('nEDBXpGYeqrRXlM3', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-15 07:02:21', NULL, '120305A2EE0AC', '__users', 'reserves', NULL, NULL),
('NtQwbaAHEUIbp7CM', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-15 07:02:27', NULL, NULL, '__users', 'reserves', '[{\"field_name\":\"ttm_customer_id\",\"old_value\":null,\"new_value\":\"63207c7291626c6cd5860a21\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('nY3YHPxpBsXtpb5Q', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-15 07:03:51', NULL, '199660E9253BC', '__email_addresses', 'paywyze@ankelli.com', NULL, NULL),
('o0jhkck8vgAUaBkc', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:02:08', NULL, NULL, '__admin_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('oBW3wj0RuLyMlJnO', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-15 07:02:21', NULL, '120305A2EE0AC', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('OIdgxjMjulFHFRSO', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:02:11', NULL, NULL, '__user_group_memberships', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ovfVtOKFiHDc54Bq', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:03:12', NULL, NULL, '__buyer_extensions', 'busops', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('pJDgTuKHM1T3ybMg', 'guGvQvJpsJWxYNSf', 'Addition of _Session entry to database.', 'entry_create', NULL, '2022-10-15 07:05:13', '+02:00', NULL, '__sessions', 'guGvQvJpsJWxYNSf', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('pjN6sKKs4aUJNwdD', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-15 07:03:07', NULL, NULL, '__users', 'busops', '[{\"field_name\":\"ttm_customer_id\",\"old_value\":null,\"new_value\":\"6321ec61d5f2885b44f1bda0\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('QBY5NEScnP4he4aV', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-15 07:04:04', NULL, NULL, '__users', 'paywyze', '[{\"field_name\":\"ttm_customer_id\",\"old_value\":null,\"new_value\":\"63298faa64858e37282c6267\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('qJuYdKGnhkGdvKzQ', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-15 07:02:03', NULL, '150051B389A14', '__notifications', '196523D4AA654', NULL, NULL),
('QqIMwX6LpCQYx1fy', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:02:14', NULL, NULL, '__buyer_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('R3wgHZ0WqCMglcnd', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-15 07:02:07', NULL, '138188DBAF93B', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('R8zYo0pm0NyrcLRn', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:02:53', NULL, NULL, '__buyer_extensions', 'reserves', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('rdKLn0IxIWngDKjZ', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:02:15', NULL, NULL, '__seller_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('RgRcnzlRfTGduRJK', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:04:12', NULL, NULL, '__user_group_memberships', '13', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('RIhYHzEWZgktwvZm', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:03:11', NULL, NULL, '__admin_extensions', 'busops', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('RtI2we3BxPxXOCPe', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-15 07:02:34', NULL, NULL, '__asset_wallet_addresses', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('RTJPQ2skiK28v8E5', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-15 07:03:18', NULL, '109189DA87FCA', '__users', 'guddaz', NULL, NULL),
('sDVThR79puhsMXSS', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-15 07:02:03', NULL, '150051B389A14', '__email_addresses', 'developer.ankelli@gmail.com', NULL, NULL),
('SImBqtzyf2uJh9HZ', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-15 07:03:18', NULL, '109189DA87FCA', '__email_addresses', 'goodhopedhliwayo@gmail.com', NULL, NULL),
('to3MsbtHUxowIGfe', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-15 07:03:51', NULL, '199660E9253BC', '__notifications', '19976190B0C49', NULL, NULL),
('ttIFFcarSxmW1p1b', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-15 07:02:12', NULL, '108674B74056A', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('u2mcQxRKlrZquJpk', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:02:06', NULL, NULL, '__user_group_memberships', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('VEQWOteWT283WNqY', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:04:13', NULL, NULL, '__user_group_memberships', '14', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('VErRnKBt8DYm6UlS', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:02:05', NULL, NULL, '__admin_extensions', 'developer', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Wb4yRGRHdkXqXD4J', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-15 07:04:11', NULL, NULL, '__user_group_memberships', '12', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('wZXa6pjrNfUqsgtY', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-15 07:02:03', NULL, '150051B389A14', '__users', 'developer', NULL, NULL),
('XKWwRtDc1VkYMk9s', 'FACTORY_SSN', 'Addition of _Asset entry to database.', 'entry_create', 'system', '2022-10-15 07:02:01', NULL, NULL, '__assets', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('y3vhlqlJEbdwU0Yp', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-15 07:02:03', NULL, '150051B389A14', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Yqab0tX9je1UOxQH', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-15 07:03:24', NULL, NULL, '__users', 'guddaz', '[{\"field_name\":\"ttm_customer_id\",\"old_value\":null,\"new_value\":\"632970417b09c5d6322bc226\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('yqLeUSXsYuNID95u', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-15 07:02:07', NULL, '138188DBAF93B', '__users', 'sysadmin', NULL, NULL),
('zfDvn308JbUtNdkv', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-15 07:04:07', NULL, NULL, '__asset_wallet_addresses', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ZQYBcnRD7Kjjwllc', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-15 07:02:21', NULL, '120305A2EE0AC', '__email_addresses', 'reserves@ankelli.com', NULL, NULL),
('ZrN5gGDM8j6G44c7', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-15 07:02:14', NULL, NULL, '__admin_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('zTTrugV6xQ9UCOHH', 'FACTORY_SSN', 'Updating of _Asset entry in database.', 'entry_update', 'system', '2022-10-15 07:02:02', NULL, NULL, '__assets', '1', '[{\"field_name\":\"usd_asset_exchange_rate\",\"old_value\":\"1\",\"new_value\":0.0007784152501883559}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}');

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
('109081798B3FE', 'busadmin', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-15 07:02:12', NULL),
('1531342C47015', 'reserves', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-15 07:02:21', NULL),
('1867754BC14B7', 'sysadmin', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-15 07:02:07', NULL),
('187700730B4B5', 'busops', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-15 07:03:05', NULL),
('191515F489022', 'guddaz', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-15 07:03:18', NULL),
('196523D4AA654', 'developer', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-15 07:02:03', NULL),
('19976190B0C49', 'paywyze', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-15 07:03:51', NULL);

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
(1, 'Update system config params', 'update_sysconfig_params', 'Permission holder can update system config params.', 'active', 'system', '2022-10-15 09:01:28', NULL, NULL),
(2, 'Handle feedback reports', 'handle_feedback_reports', 'Permission holder can handle feedback reports.', 'active', 'system', '2022-10-15 09:01:28', NULL, NULL),
(3, 'Manage datalists', 'manage_datalists', 'Permission holder can manage datalists.', 'active', 'system', '2022-10-15 09:01:28', NULL, NULL),
(4, 'Manage system tools', 'manage_systools', 'Permission holder can manage system tools.', 'active', 'system', '2022-10-15 09:01:28', NULL, NULL),
(5, 'View all logs', 'view_all_logs', 'Permission holder can view all logs.', 'active', 'system', '2022-10-15 09:01:28', NULL, NULL),
(6, 'View all transactions', 'view_all_transactions', 'Permission holder can view all transactions.', 'active', 'system', '2022-10-15 09:01:28', NULL, NULL),
(7, 'Manage Deposit Tokens', 'manage_deposit_tokens', 'Permission holder can create and edit deposit tokens.', 'active', 'system', '2022-10-15 09:01:28', NULL, NULL),
(8, 'Handle Withdrawals', 'handle_withdrawals', 'Permission holder can handle withdrawals.', 'active', 'system', '2022-10-15 09:01:28', NULL, NULL),
(9, 'Manage Registration Tokens', 'manage_reg_tokens', 'Permission holder can create and edit registration tokens.', 'active', 'system', '2022-10-15 09:01:28', NULL, NULL),
(10, 'Handle flagged users', 'handle_flagged_users', 'Permission holder can handle flagged Users.', 'active', 'system', '2022-10-15 09:01:28', NULL, NULL),
(11, 'Handle customer service chats', 'handle_customer_service_chats', 'Permission holder can handle customer service chats.', 'active', 'system', '2022-10-15 09:01:28', NULL, NULL),
(12, 'Manage update posts', 'manage_update_posts', 'Permission holder can handle posting and editing update posts.', 'active', 'system', '2022-10-15 09:01:28', NULL, NULL),
(13, 'Handle flagged business elems', 'handle_flagged_business_elems', 'Permission holder can handle flagged business elems (Offers, Trades, etc).', 'active', 'system', '2022-10-15 09:01:28', NULL, NULL);

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
(1, '__user_groups', 'system_administrators', 'update_sysconfig_params', 'active', 'system', '2022-10-15 09:01:28', NULL),
(2, '__user_groups', 'system_administrators', 'handle_feedback_reports', 'active', 'system', '2022-10-15 09:01:28', NULL),
(3, '__user_groups', 'system_administrators', 'manage_systools', 'active', 'system', '2022-10-15 09:01:28', NULL),
(4, '__user_groups', 'system_administrators', 'manage_datalists', 'active', 'system', '2022-10-15 09:01:28', NULL),
(5, '__user_groups', 'system_administrators', 'view_all_logs', 'active', 'system', '2022-10-15 09:01:28', NULL),
(6, '__user_groups', 'business_administrators', 'view_all_transactions', 'active', 'system', '2022-10-15 09:01:28', NULL),
(7, '__user_groups', 'business_administrators', 'manage_deposit_tokens', 'active', 'system', '2022-10-15 09:01:28', NULL),
(8, '__user_groups', 'business_administrators', 'handle_withdrawals', 'active', 'system', '2022-10-15 09:01:28', NULL),
(9, '__user_groups', 'user_administrators', 'manage_reg_tokens', 'active', 'system', '2022-10-15 09:01:28', NULL),
(10, '__user_groups', 'user_administrators', 'handle_flagged_users', 'active', 'system', '2022-10-15 09:01:28', NULL),
(11, '__user_groups', 'moderators', 'handle_customer_service_chats', 'active', 'system', '2022-10-15 09:01:28', NULL),
(12, '__user_groups', 'moderators', 'handle_flagged_business_elems', 'active', 'system', '2022-10-15 09:01:28', NULL),
(13, '__user_groups', 'moderators', 'manage_update_posts', 'active', 'system', '2022-10-15 09:01:28', NULL);

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
(1, '__users', 'system', 'Backend rest api enabled', 'backend_rest_api_enabled', '1', 'boolean', 'system', '2022-10-15 09:01:30', NULL),
(2, '__users', 'system', 'Scaffolding app enabled', 'scaffolding_app_enabled', '1', 'boolean', 'system', '2022-10-15 09:01:30', NULL),
(3, '__users', 'system', 'Fallback Display Language', 'fallback_pref_lang', 'en', 'enum:langs', 'system', '2022-10-15 09:01:30', NULL),
(4, '__users', 'system', 'Fallback Display Theme', 'fallback_pref_theme', 'light', 'enum:themes', 'system', '2022-10-15 09:01:30', NULL),
(5, '__users', 'system', 'Image storage driver', 'image_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-10-15 09:01:30', NULL),
(6, '__users', 'system', 'Document storage driver', 'document_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-10-15 09:01:30', NULL),
(7, '__users', 'system', 'Open Registration enabled', 'open_reg_enabled', '0', 'boolean', 'system', '2022-10-15 09:01:30', NULL),
(8, '__users', 'system', 'Token registration enabled', 'token_reg_enabled', '0', 'boolean', 'system', '2022-10-15 09:01:30', NULL),
(9, '__users', 'system', 'Registration token max use count', 'reg_token_max_use_count', '10', 'integer', 'system', '2022-10-15 09:01:30', NULL),
(10, '__users', 'system', 'Offers to sell enabled', 'offer_to_sell_enabled', '0', 'boolean', 'system', '2022-10-15 09:01:30', NULL),
(11, '__users', 'system', 'Offers to buy enabled', 'offer_to_buy_enabled', '1', 'boolean', 'system', '2022-10-15 09:01:30', NULL),
(12, '__users', 'system', 'Min timeout (minutes) for buyer to open trade', 'buyer_open_trade_min_mins_tmt', '10', 'integer', 'system', '2022-10-15 09:01:30', NULL),
(13, '__users', 'system', 'Max timeout (minutes) for buyer to complete trade (auto flags)', 'buyer_cmplt_trade_max_mins_tmt', '240', 'integer', 'system', '2022-10-15 09:01:30', NULL),
(14, '__users', 'system', 'Default Selected Crypto Asset', 'default_crypto_asset_code', 'ETH', 'enum:crypto_asset_codes', 'system', '2022-10-15 09:01:30', NULL),
(15, '__users', 'system', 'Default Selected Fiat Currency', 'default_fiat_currency_code', 'USD', 'enum:fiat_currency_codes', 'system', '2022-10-15 09:01:30', NULL),
(16, '__users', 'system', 'Use tatum crypto asset engine API', 'use_ttm_api', '1', 'boolean', 'system', '2022-10-15 09:01:30', NULL),
(17, '__users', 'system', 'Platform fee factor on trade transactions', 'trade_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-15 09:01:30', NULL),
(18, '__users', 'system', 'Platform fee factor on payment transfers', 'pymt_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-15 09:01:30', NULL),
(19, '__users', 'system', 'Platform fee factor on ankelli pay payments', 'ankelli_pay_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-15 09:01:30', NULL),
(20, '__users', 'system', 'Platform fee factor on crypto conversions', 'crypto_conv_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-15 09:01:30', NULL);

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
(1, 'Cash in person', 'cash_in_person', '5e5d4b', '[\"phone_no\"]', NULL, 'active', 'system', '2022-10-15 09:01:37', NULL, NULL),
(2, 'Stanbic bank', 'stanbic_bank', '066ef3', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-10-15 09:01:37', NULL, NULL),
(3, 'FNB bank', 'fnb_bank', '009eaa', '[\"account_holder_name\",\"account_no\"]', '[\"ZAR\"]', 'active', 'system', '2022-10-15 09:01:37', NULL, NULL),
(4, 'Mukuru', 'mukuru', 'e77924', '[\"fullname\",\"phone_no\"]', '[\"USD\"]', 'active', 'system', '2022-10-15 09:01:37', NULL, NULL),
(5, 'Algérie Poste', 'algerie_poste', '01009a', '[\"account_holder_name\",\"account_holder_address\",\"account_no\",\"account_key\"]', '[\"DZD\"]', 'active', 'system', '2022-10-15 09:01:37', NULL, NULL),
(6, 'MTN Mobile Money', 'mtn_momo', 'feca05', '[\"fullname\",\"phone_no\"]', NULL, 'active', 'system', '2022-10-15 09:01:37', NULL, NULL),
(7, 'Ecocash', 'ecocash', '005ba4', '[\"fullname\",\"phone_no\"]', '[\"ZWL\"]', 'active', 'system', '2022-10-15 09:01:37', NULL, NULL),
(8, 'Paypal', 'paypal', '27346a', '[\"fullname\",\"email_address\"]', '[\"USD\",\"EUR\",\"GBP\"]', 'active', 'system', '2022-10-15 09:01:37', NULL, NULL),
(9, 'Skrill', 'skrill', '862165', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-10-15 09:01:37', NULL, NULL),
(10, 'World Remit', 'world_remit', '604684', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-10-15 09:01:37', NULL, NULL),
(11, 'Mastercard', 'mastercard', 'cc0001', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-10-15 09:01:37', NULL, NULL),
(12, 'Visa', 'visa', '0055a5', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-10-15 09:01:37', NULL, NULL),
(13, 'FBC Bank', 'fbc_bank', '0055a5', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-10-15 09:01:37', NULL, NULL);

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
('1234567890', 'usable', 'system', '2022-10-15 07:04:13');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-10-15 07:02:09', '2022-10-15 07:02:09', NULL),
(2, 'busadmin', 'deactivated', 'system', '2022-10-15 07:02:14', '2022-10-15 07:02:14', NULL),
(3, 'reserves', 'deactivated', 'system', '2022-10-15 07:02:53', '2022-10-15 07:02:53', NULL),
(4, 'busops', 'deactivated', 'system', '2022-10-15 07:03:12', '2022-10-15 07:03:12', NULL);

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
('FACTORY_SSN', 'system', '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'ended', '2022-10-15 09:01:30', NULL, NULL, NULL),
('guGvQvJpsJWxYNSf', NULL, '{\"name\":null,\"version\":null}', '{\"name\":\"Ankelli Web App\",\"version\":\"1.0.0\",\"extra\":\"Ankelli Web App\"}', 'empty', '2022-10-15 07:05:12', '2022-10-15 07:05:12', NULL, NULL),
('ICS8SvKwGuTFfV1Z', NULL, '{\"name\":null,\"version\":null}', '{\"name\":\"Ankelli Web App\",\"version\":\"1.0.0\",\"extra\":\"Ankelli Web App\"}', 'empty', '2022-10-15 07:05:12', '2022-10-15 07:05:12', NULL, NULL),
('TATUM_NOTIFS_SSN', 'system', '{\"name\":\"Tatum Notification Station device\",\"version\":1}', '{\"name\":\"Tatum Notification Station agent app\",\"version\":1}', 'active', '2022-10-15 09:01:30', NULL, NULL, NULL),
('TEST_SSN', NULL, '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'active', '2022-10-15 09:01:30', NULL, NULL, NULL);

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
  `offer_price` varchar(38) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `ttm_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttm_bc_txn_signature_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttm_centralization_factor` decimal(3,2) UNSIGNED DEFAULT NULL,
  `ttm_amount_blockage_id` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_value_escrowed` varchar(38) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bc_txn_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_token` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_slug` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `failure_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_status` enum('pending','failed','completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_bc_address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_bc_address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_value` varchar(38) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_result` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'system', 'system', '', NULL, NULL, NULL, 'active', '2022-10-15 09:01:22', NULL, NULL),
(2, 'developer', 'developer.ankelli@gmail.com', '$2y$10$1GuohhUjlAaIQVVbuGZsyea0wBuM.hTbFlEM2fik2Zv8FStMkotpS', NULL, NULL, NULL, 'active', '2022-10-15 07:02:02', '2022-10-15 07:02:02', NULL),
(3, 'sysadmin', 'sysadmin@ankelli.com', '$2y$10$.PUN8q3yLBzr4VHUwkUdZeNIUwjybr9VcmGJH9JlDZbr1uey3tJtu', NULL, NULL, NULL, 'active', '2022-10-15 07:02:06', '2022-10-15 07:02:06', NULL),
(4, 'busadmin', 'busadmin@ankelli.com', '$2y$10$mzgkRRHhn7uftXV3NcHHKuVTDk6W54g3sel6Ug/9v3IRh.sEyNAPC', NULL, NULL, NULL, 'active', '2022-10-15 07:02:11', '2022-10-15 07:02:11', NULL),
(5, 'reserves', 'reserves@ankelli.com', '$2y$10$ACtFaxEmOsSEOGhapRmrruvpVX5oYERFcse1frczDqeOejmOR2b/i', NULL, NULL, '63207c7291626c6cd5860a21', 'active', '2022-10-15 07:02:16', '2022-10-15 07:02:27', NULL),
(6, 'busops', 'busops@ankelli.com', '$2y$10$feW.sJxrvxoqtClSHlqd7utWH0vfcX5vvALBaReRsL6JvHSNBEGtO', NULL, NULL, '6321ec61d5f2885b44f1bda0', 'active', '2022-10-15 07:03:03', '2022-10-15 07:03:07', NULL),
(7, 'guddaz', 'goodhopedhliwayo@gmail.com', '$2y$10$fm.Lkl/O3q3n/t9r7SkCAeU7xixUF6zioEHqaTc2qWQ80/sDwCONq', NULL, NULL, '632970417b09c5d6322bc226', 'active', '2022-10-15 07:03:13', '2022-10-15 07:03:24', NULL),
(8, 'paywyze', 'paywyze@ankelli.com', '$2y$10$3Nbyw83rTo8uh5RzcuLE0uP135YDVyIKOI6eI9/6Sfkl26FnRl6XC', NULL, NULL, '63298faa64858e37282c6267', 'active', '2022-10-15 07:03:45', '2022-10-15 07:04:04', NULL);

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
(1, 'Default Users', 'default_users', 'Group for Default User accounts created on system initialization and factory_data loading. \nNew users cannot be added to this group.', 'active', 'system', '2022-10-15 09:01:27', NULL, NULL),
(2, 'Administrators', 'administrators', 'Automatically joined group (Users with active Admin Extension). \nMembers can be added to other admin groups.', 'active', 'system', '2022-10-15 09:01:27', NULL, NULL),
(3, 'Developers', 'developers', 'Admin group for unrestricted system users. \nMembers have access to all features and OTP access to account named \"developer\". \nOnly \"developer\" account can add members to this group.\nGroup used for System Development and Maintenance.', 'active', 'system', '2022-10-15 09:01:27', NULL, NULL),
(4, 'System Administrators', 'system_administrators', 'Admin Group for System Administrators. \nMembers can manage system functions and sysconfig params. \nMembers have OTP access to account named \"sysadmin\".\nOnly \"sysadmin\" account can add members to this group.', 'active', 'system', '2022-10-15 09:01:27', NULL, NULL),
(5, 'Business Administrators', 'business_administrators', 'Admin group for Business Administrators.\nMembers have access to business related features.\nMembers have OTP access to accounts named \"busops\" and \"busadmin\".\nOnly \"busadmin\" account can add members to this group.', 'active', 'system', '2022-10-15 09:01:27', NULL, NULL),
(6, 'User Administrators', 'user_administrators', 'Admin group for User Administrators. \nMembers can manage other users and user related queries.', 'active', 'system', '2022-10-15 09:01:27', NULL, NULL),
(7, 'Platform moderators', 'moderators', 'Group for Platform moderators. \nMembers can respond in the customer service chat module, handle flagged business elements, manage daily updates.', 'active', 'system', '2022-10-15 09:01:27', NULL, NULL),
(8, 'Sellers', 'sellers', 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.', 'active', 'system', '2022-10-15 09:01:27', NULL, NULL),
(9, 'Buyers', 'buyers', 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.', 'active', 'system', '2022-10-15 09:01:27', NULL, NULL),
(10, 'Beta Testers', 'beta_testers', 'User Group for selected individuals to test certain features before they are published.', 'active', 'system', '2022-10-15 09:01:27', NULL, NULL);

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
(1, 'developer', 'default_users', 'active', 'system', '2022-10-15 07:02:03', '2022-10-15 07:02:03'),
(2, 'developer', 'developers', 'active', 'system', '2022-10-15 07:02:05', '2022-10-15 07:02:05'),
(3, 'sysadmin', 'default_users', 'active', 'system', '2022-10-15 07:02:07', '2022-10-15 07:02:07'),
(4, 'sysadmin', 'system_administrators', 'active', 'system', '2022-10-15 07:02:10', '2022-10-15 07:02:10'),
(5, 'busadmin', 'default_users', 'active', 'system', '2022-10-15 07:02:12', '2022-10-15 07:02:12'),
(6, 'busadmin', 'business_administrators', 'active', 'system', '2022-10-15 07:02:15', '2022-10-15 07:02:15'),
(7, 'reserves', 'default_users', 'active', 'system', '2022-10-15 07:02:38', '2022-10-15 07:02:38'),
(8, 'reserves', 'business_administrators', 'active', 'system', '2022-10-15 07:02:58', '2022-10-15 07:02:58'),
(9, 'busops', 'default_users', 'active', 'system', '2022-10-15 07:03:09', '2022-10-15 07:03:09'),
(10, 'busops', 'business_administrators', 'active', 'system', '2022-10-15 07:03:12', '2022-10-15 07:03:12'),
(11, 'guddaz', 'developers', 'active', 'system', '2022-10-15 07:03:40', '2022-10-15 07:03:40'),
(12, 'paywyze', 'system_administrators', 'active', 'system', '2022-10-15 07:04:09', '2022-10-15 07:04:09'),
(13, 'paywyze', 'user_administrators', 'active', 'system', '2022-10-15 07:04:11', '2022-10-15 07:04:11'),
(14, 'paywyze', 'business_administrators', 'active', 'system', '2022-10-15 07:04:12', '2022-10-15 07:04:12');

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
  ADD UNIQUE KEY `__assets_xpub_unique` (`xpub`),
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
  ADD UNIQUE KEY `__asset_wallet_addresses_ttm_derivation_key_unique` (`ttm_derivation_key`),
  ADD UNIQUE KEY `__asset_wallet_addresses_bc_address_unique` (`bc_address`),
  ADD KEY `__asset_wallet_addresses_user_username_foreign` (`user_username`),
  ADD KEY `__asset_wallet_addresses_asset_code_foreign` (`asset_code`);

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
  ADD UNIQUE KEY `__transactions_ttm_bc_txn_signature_id_unique` (`ttm_bc_txn_signature_id`),
  ADD UNIQUE KEY `__transactions_bc_txn_id_unique` (`bc_txn_id`),
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `__buyer_extensions`
--
ALTER TABLE `__buyer_extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  ADD CONSTRAINT `__asset_wallet_addresses_asset_code_foreign` FOREIGN KEY (`asset_code`) REFERENCES `__assets` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
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
