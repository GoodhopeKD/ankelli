-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 10, 2022 at 05:09 PM
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
(345, '2014_10_12_000000_create_users_table', 1),
(346, '2014_10_12_100000_create_password_resets_table', 1),
(347, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(348, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(349, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(350, '2016_06_01_000004_create_oauth_clients_table', 1),
(351, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(352, '2019_08_19_000000_create_failed_jobs_table', 1),
(353, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(354, '2022_07_26_072110_create___admin_extensions_table', 1),
(355, '2022_07_26_072112_create___buyer_extensions_table', 1),
(356, '2022_07_26_072114_create___seller_extensions_table', 1),
(357, '2022_07_26_072120_create___user_groups_table', 1),
(358, '2022_07_26_072122_create___user_group_memberships_table', 1),
(359, '2022_07_26_072124_create___permissions_table', 1),
(360, '2022_07_26_072126_create___permission_instances_table', 1),
(361, '2022_07_26_072130_create___sessions_table', 1),
(362, '2022_07_26_072131_create___notifications_table', 1),
(363, '2022_07_26_072132_create___pref_items_table', 1),
(364, '2022_07_26_072135_create___reg_tokens_table', 1),
(365, '2022_07_26_072136_create___verif_tokens_table', 1),
(366, '2022_07_26_072137_create___email_addresses_table', 1),
(367, '2022_07_26_072140_create___phone_nos_table', 1),
(368, '2022_07_26_072324_create___files_table', 1),
(369, '2022_07_26_072326_create___feedback_reports_table', 1),
(370, '2022_07_26_072327_create___posts_table', 1),
(371, '2022_07_26_072332_create___assets_table', 1),
(372, '2022_07_26_072333_create___asset_wallets_table', 1),
(373, '2022_07_26_072334_create___asset_wallet_addresses_table', 1),
(374, '2022_07_26_072335_create___asset_custodial_wallet_addresses_table', 1),
(375, '2022_07_26_072336_create___currencies_table', 1),
(376, '2022_07_26_072337_create___pymt_methods_table', 1),
(377, '2022_07_26_072345_create___countries_table', 1),
(378, '2022_07_26_072347_create___exportables_table', 1),
(379, '2022_07_26_072410_create___deposit_tokens_table', 1),
(380, '2022_07_26_072416_create___offers_table', 1),
(381, '2022_07_26_072417_create___trades_table', 1),
(382, '2022_07_26_072419_create___chats_table', 1),
(383, '2022_07_26_072420_create___messages_table', 1),
(384, '2022_07_26_072421_create___pinnings_table', 1),
(385, '2022_07_26_072424_create___reviews_table', 1),
(386, '2022_07_26_072443_create___transactions_table', 1),
(387, '2022_07_26_072444_create___logs_table', 1);

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
(1, NULL, 'Ankelli Personal Access Client', '31KVj4NG665bIOEzJEYmUapAzL1O8MwV0EYZLOHK', NULL, 'http://localhost', 1, 0, 0, '2022-10-10 11:20:52', '2022-10-10 11:20:52'),
(2, NULL, 'Ankelli Password Grant Client', 'QVS1pfPpHLmnE3YPjAVREJop6Vd5RBLRX5r3vgsQ', 'users', 'http://localhost', 0, 1, 0, '2022-10-10 11:20:52', '2022-10-10 11:20:52');

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
(1, 1, '2022-10-10 11:20:52', '2022-10-10 11:20:52');

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
(1, 'system', 'System', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(2, 'developer', 'Default Developer', 'active', 'system', '2022-10-10 11:21:08', '2022-10-10 11:21:08', NULL),
(3, 'sysadmin', 'Default System Administrator', 'active', 'system', '2022-10-10 11:21:12', '2022-10-10 11:21:12', NULL),
(4, 'busops', 'Ankelli Asset Reserves', 'active', 'system', '2022-10-10 11:21:34', '2022-10-10 11:21:34', NULL),
(5, 'busadmin', 'Default Business Administrator', 'active', 'system', '2022-10-10 11:22:03', '2022-10-10 11:22:03', NULL),
(6, 'guddaz', 'Head System Developer', 'active', 'system', '2022-10-10 11:22:12', '2022-10-10 11:22:12', NULL),
(7, 'paywyze', 'Head Business Administrator', 'active', 'system', '2022-10-10 11:22:39', '2022-10-10 11:22:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__assets`
--

CREATE TABLE `__assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chain` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xpub` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smallest_display_unit` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdrawal_txn_fee_usd_fctr` decimal(8,4) UNSIGNED NOT NULL,
  `payment_txn_fee_usd_fctr` decimal(8,4) UNSIGNED NOT NULL,
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

INSERT INTO `__assets` (`id`, `name`, `code`, `chain`, `xpub`, `smallest_display_unit`, `withdrawal_txn_fee_usd_fctr`, `payment_txn_fee_usd_fctr`, `usd_asset_exchange_rate`, `onchain_disclaimer`, `_status`, `creator_username`, `created_datetime`, `updated_datetime`) VALUES
(1, 'Ethereum', 'ETH', 'ETH', NULL, '0.0000000001', '1.0000', '1.0000', '0.0007591002099449766', 'This platform is still in test mode on the sepolia testnet chain.\nOnchain transactions should be handled accordingly.', 'active', 'system', '2022-10-10 11:21:02', '2022-10-10 11:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `__asset_custodial_wallet_addresses`
--

CREATE TABLE `__asset_custodial_wallet_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_chain` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blockchain_address` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ttm_wallet_id` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttm_subscription_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttm_activated_unused_gp_addresses` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttm_activated_unused_gp_addresses_offset_index` int(10) UNSIGNED DEFAULT NULL,
  `ttm_last_gp_addresses_activation_txn_signature_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `__asset_custodial_wallet_addresses`
--

INSERT INTO `__asset_custodial_wallet_addresses` (`id`, `asset_chain`, `blockchain_address`, `ttm_wallet_id`, `ttm_subscription_id`, `ttm_activated_unused_gp_addresses`, `ttm_activated_unused_gp_addresses_offset_index`, `ttm_last_gp_addresses_activation_txn_signature_id`, `creator_username`, `created_datetime`, `updated_datetime`, `deleted_datetime`) VALUES
(1, 'ETH', '0x4e9470217400b27ccdb64237e6776abcda535956', '7dc19c98-a3f5-44f6-8ca1-10ae57af6832', '63441c40e203aff5c3abc170', '[\"0xA4B06AA3a826D475dC0c248fDC003537d17F8334\",\"0x010b6ab0aBeEB921964161cd2e23C50250E546bF\",\"0x8BE7b1390B9a2CEE3A4f3491abEB6218Dde3d577\",\"0x06859Ae60D6379FC9A25f1ABE28F1B9e6d26142A\",\"0x4956AB779a7603AB723B7752a93A0437017E7Ecb\",\"0xc4D164399c5554b6D30A4dB7C1Fd4f58A6Eb981c\",\"0x6b80A49f1E738410931d9310be0005D638520b3d\",\"0x06cF2b846F457fDe38cB8d642fBC7E436740E6A4\",\"0xF7eA9143f95bdbAcED129E46381b488b2229ceE0\",\"0x6072Daa8c68E363662B94ee60Cd80993B6049Ef5\",\"0x0B83A51BF37144EBd564aF39fC1eF0AaA986eD58\",\"0xE48adD68fAA0fD84fee867B4CeCE17c58C220dB3\",\"0x5Dfb9d9861dE78A55b268C312360eC39e35390a8\",\"0x845eCA8C2F1e06d811255ef539d3975Cdd739c18\",\"0x91c02653DDE2742536BC4493ACaE568C48E54889\",\"0x02A2e5E52755Cc77Da42658bC55686494F051155\"]', 15, NULL, 'system', '2022-10-10 11:21:04', '2022-10-10 11:21:04', NULL);

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
(1, '63296ef838931796fa9e5aed', '63441c4f0dec606a0fc9808c', 'busops', 'ETH', 'ETH', '1.59090505050505', '1.59090505050505', 'active', '2022-10-10 11:21:19', '2022-10-10 11:34:00'),
(2, '632970417b09c5d6322bc225', '63441c82aa0bd2fa3f961d7f', 'guddaz', 'ETH', 'ETH', '1.14600505050505', '1.14600505050505', 'active', '2022-10-10 11:22:10', '2022-10-10 11:29:38'),
(3, '63298faa64858e37282c6266', '63441c95ffb81644829493a6', 'paywyze', 'ETH', 'ETH', '0.45', '0.45', 'active', '2022-10-10 11:22:29', '2022-10-10 11:29:00'),
(4, '632c29781bfeea9fefca383d', '63441cb96fe657be6d6f664d', 'john_doe', 'ETH', 'ETH', '0.1206593989901935', '0.1206593989901935', 'active', '2022-10-10 11:23:05', '2022-10-10 11:34:01'),
(5, '6343de9567b043ee14be9970', '63441cbfba756391c5c12edb', 'mark', 'ETH', 'ETH', '0', '0', 'active', '2022-10-10 11:23:12', '2022-10-10 11:23:12');

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
(1, 1, 'busops', '0xaaada23b6b5705e23e12f78d064a1f1e62fb6126', 26, 0, NULL, '2022-10-10 11:21:19', NULL),
(2, 2, 'guddaz', '0xf9c4a2455e7c3eaccf97a20415100c35270e983f', 27, 0, NULL, '2022-10-10 11:22:10', NULL),
(3, 3, 'paywyze', '0xaf8ccb7b6a5c5020e422225779340ac0f971ef36', 28, 0, NULL, '2022-10-10 11:22:29', NULL),
(4, 4, 'john_doe', '0x49c537e0e9cfb74091c022ecf0090addc27ad6d8', 29, 0, NULL, '2022-10-10 11:23:06', NULL),
(5, 5, 'mark', '0x010b6ab0abeeb921964161cd2e23c50250e546bf', 0, 0, NULL, '2022-10-10 11:23:12', NULL);

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
(1, 'sysadmin', 'deactivated', 'system', '2022-10-10 11:21:13', '2022-10-10 11:21:13', NULL),
(2, 'busops', 'deactivated', 'system', '2022-10-10 11:21:39', '2022-10-10 11:21:39', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-10-10 11:22:04', '2022-10-10 11:22:04', NULL);

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
(1, 'Zimbabwe', 'ZIM', NULL, NULL, NULL, 'active', 'system', '2022-10-10 13:20:51', NULL),
(2, 'South Africa', 'RSA', NULL, NULL, NULL, 'active', 'system', '2022-10-10 13:20:51', NULL),
(3, 'United Kingdom', 'UK', NULL, NULL, NULL, 'active', 'system', '2022-10-10 13:20:51', NULL),
(4, 'United States of America', 'USA', NULL, NULL, NULL, 'active', 'system', '2022-10-10 13:20:51', NULL),
(5, 'Russia', 'RUS', NULL, NULL, NULL, 'active', 'system', '2022-10-10 13:20:51', NULL),
(6, 'China', 'CHN', NULL, NULL, NULL, 'active', 'system', '2022-10-10 13:20:51', NULL),
(7, 'Ghana', 'GHA', NULL, NULL, NULL, 'active', 'system', '2022-10-10 13:20:51', NULL),
(8, 'Botswana', 'BOT', NULL, NULL, NULL, 'active', 'system', '2022-10-10 13:20:51', NULL),
(9, 'Zambia', 'ZAM', NULL, NULL, NULL, 'active', 'system', '2022-10-10 13:20:51', NULL),
(10, 'Algeria', 'ALG', NULL, NULL, NULL, 'active', 'system', '2022-10-10 13:20:51', NULL),
(11, 'Italy', 'ITA', NULL, NULL, NULL, 'active', 'system', '2022-10-10 13:20:51', NULL),
(12, 'Nigeria', 'NIG', NULL, NULL, NULL, 'active', 'system', '2022-10-10 13:20:51', NULL);

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
(1, 'US Dollar', 'USD', '$', 1, '1', '10', '1', 'active', 'system', '2022-10-10 13:20:50', NULL),
(2, 'Euro', 'EUR', '€', 1, '1.02', '10', '1', 'active', 'system', '2022-10-10 13:20:50', NULL),
(3, 'Pound Sterling', 'GBP', '£', 1, '0.89', '10', '1', 'active', 'system', '2022-10-10 13:20:50', NULL),
(4, 'South African Rand', 'ZAR', 'R', 0, '18', '100', '10', 'active', 'system', '2022-10-10 13:20:50', NULL),
(5, 'Zambian Kwacha', 'ZMW', 'K', 0, '14', '100', '10', 'active', 'system', '2022-10-10 13:20:50', NULL),
(6, 'Algerian Dinar', 'DZD', 'DA', 0, '210', '100', '100', 'active', 'system', '2022-10-10 13:20:50', NULL),
(7, 'Zimbabwean Dollar', 'ZWL', '$', 1, '800', '500', '50', 'active', 'system', '2022-10-10 13:20:50', NULL);

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
(1, 'developer.ankelli@gmail.com', 'developer', '2022-10-10 11:21:07', NULL),
(2, 'sysadmin@ankelli.com', 'sysadmin', '2022-10-10 11:21:11', NULL),
(3, 'busops@ankelli.com', 'busops', '2022-10-10 11:21:17', NULL),
(4, 'busadmin@ankelli.com', 'busadmin', '2022-10-10 11:21:58', NULL),
(5, 'goodhopedhliwayo@gmail.com', 'guddaz', '2022-10-10 11:22:07', NULL),
(6, 'paywyze@ankelli.com', 'paywyze', '2022-10-10 11:22:23', NULL),
(7, 'john_doe@ankelli.com', 'john_doe', '2022-10-10 11:23:03', NULL),
(8, 'mark@ankelli.com', 'mark', '2022-10-10 11:23:08', NULL);

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
(1, '__pymt_methods', 'cash_in_person', 'images', 'pymt_method_icon', 'Cash in person', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Cash in person.jpg', 'image/jpg', NULL, 'Cash in person.jpg', NULL, 'system', '2022-10-10 11:20:50', NULL),
(2, '__pymt_methods', 'stanbic_bank', 'images', 'pymt_method_icon', 'Stanbic Bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Stanbic bank.jpg', 'image/jpg', NULL, 'Stanbic Bank Icon.jpg', NULL, 'system', '2022-10-10 11:20:50', NULL),
(3, '__pymt_methods', 'fnb_bank', 'images', 'pymt_method_icon', 'FNB Bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/FNB bank.png', 'image/png', NULL, 'FNB Bank Icon.png', NULL, 'system', '2022-10-10 11:20:50', NULL),
(4, '__pymt_methods', 'mukuru', 'images', 'pymt_method_icon', 'Mukuru Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Mukuru.jpg', 'image/jpg', NULL, 'Mukuru Icon.jpg', NULL, 'system', '2022-10-10 11:20:50', NULL),
(5, '__pymt_methods', 'algerie_poste', 'images', 'pymt_method_icon', 'Algerie poste Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Algerie poste.jpg', 'image/jpg', NULL, 'Algerie poste Icon.jpg', NULL, 'system', '2022-10-10 11:20:50', NULL),
(6, '__pymt_methods', 'mtn_momo', 'images', 'pymt_method_icon', 'MTN MOMO Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/MTN MOMO.png', 'image/png', NULL, 'MTN MOMO Icon.png', NULL, 'system', '2022-10-10 11:20:50', NULL),
(7, '__pymt_methods', 'ecocash', 'images', 'pymt_method_icon', 'Ecocash Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Ecocash.png', 'image/png', NULL, 'Ecocash Icon.png', NULL, 'system', '2022-10-10 11:20:50', NULL),
(8, '__pymt_methods', 'paypal', 'images', 'pymt_method_icon', 'Paypal Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Paypal.png', 'image/png', NULL, 'Paypal Icon.png', NULL, 'system', '2022-10-10 11:20:50', NULL),
(9, '__pymt_methods', 'skrill', 'images', 'pymt_method_icon', 'Skrill Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Skrill.jpg', 'image/jpg', NULL, 'Skrill Icon.jpg', NULL, 'system', '2022-10-10 11:20:50', NULL),
(10, '__pymt_methods', 'world_remit', 'images', 'pymt_method_icon', 'World Remit Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/World Remit.png', 'image/png', NULL, 'World Remit Icon.png', NULL, 'system', '2022-10-10 11:20:50', NULL),
(11, '__pymt_methods', 'mastercard', 'images', 'pymt_method_icon', 'Mastercard Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Mastercard.jpeg', 'image/jpeg', NULL, 'Mastercard Icon.jpeg', NULL, 'system', '2022-10-10 11:20:50', NULL),
(12, '__pymt_methods', 'visa', 'images', 'pymt_method_icon', 'Visa Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/Visa.jpg', 'image/jpg', NULL, 'Visa Icon.jpg', NULL, 'system', '2022-10-10 11:20:50', NULL),
(13, '__pymt_methods', 'fbc_bank', 'images', 'pymt_method_icon', 'FBC bank Icon', NULL, NULL, 'https://ankelli.com//storage/images/pymt_methods/FBC bank.jpg', 'image/jpg', NULL, 'FBC bank Icon.jpg', NULL, 'system', '2022-10-10 11:20:50', NULL);

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
('01uwucTMUaVyTDJ9', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:23:13', NULL, NULL, '__asset_wallet_addresses', '5', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('0aTsHxAhCFWmHryS', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:29:00', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.4\",\"new_value\":0.45},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.4\",\"new_value\":0.45}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('0ljBT0b51NJ8FEeV', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:30:13', NULL, NULL, '__notifications', '13017364E17E6', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('1dFVR3gI0Q04xPuT', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:29:09', NULL, NULL, '__notifications', '1846777353E19', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('1H1c7YIfUSOkSgQx', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:33:16', NULL, NULL, '__notifications', '19249995DE817', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('21NamOorOJjxCeyX', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:26:55', NULL, NULL, '__notifications', '18029138B6223', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('23RpWdz0WFjZyzXw', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-10 11:22:23', NULL, '187366BBB3AF7', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('25jQ2ISIWbGwYOPp', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:32:57', NULL, NULL, '__notifications', '1848727923304', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('29cNOjy0T50HkI5m', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-10 11:21:08', NULL, '18574378A8B5A', '__notifications', '1032394A182A1', NULL, NULL),
('2acwZdBkmSlIKpxC', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:34:06', NULL, NULL, '__notifications', '105048CCCE32F', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('2tOIstpPFscghKMv', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:32:56', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1341298989898995\",\"new_value\":0.1236993989901935},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1341298989898995\",\"new_value\":0.1236993989901935}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('2u1EQKQ5GKUID4DG', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:32:15', NULL, NULL, '__notifications', '192626C711806', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('2WPdls9XcjvdrsxZ', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:32:05', NULL, NULL, '__notifications', '1440049C4F845', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('37GIGyarfexKuKTe', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:22:34', NULL, NULL, '__asset_wallet_addresses', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('3FZZDT6WW7g9hXxs', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-10 11:23:03', NULL, '112578AAD22CF', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('3gYExa5D8D3SGrPd', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:30:56', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1246063989898995\",\"new_value\":0.1348898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1246063989898995\",\"new_value\":0.1348898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('3oZ5EJK7zPJrARSW', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:27:09', NULL, NULL, '__notifications', '138571F3749B3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('40sangTDCWXwwLPM', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:33:44', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.58938505050505\",\"new_value\":1.59014505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.58938505050505\",\"new_value\":1.59014505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('5325PZGC5JbovLPO', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:00', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.3325\",\"new_value\":1.3825},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.3325\",\"new_value\":1.3825}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('5dcuDtt1ItAgwq5o', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:51', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.99\",\"new_value\":1.04},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.99\",\"new_value\":1.04}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('5MFDyIa57244pWes', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:32:43', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.58710505050505\",\"new_value\":1.58786505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.58710505050505\",\"new_value\":1.58786505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('5qN4RBhtdG0JqnwM', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:31:09', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1035983989907815\",\"new_value\":0.09316789899107551},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1035983989907815\",\"new_value\":0.09316789899107551}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('6I9xeX8gArrCOqU9', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-10 11:23:09', NULL, '16072452694E6', '__notifications', '197757C103E9C', NULL, NULL),
('6injuTLqflLPu4NZ', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:56', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.04\",\"new_value\":1.1025},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.04\",\"new_value\":1.1025}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('6vDjFBpYBVDpTGhe', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:33:25', NULL, NULL, '__notifications', '1468207999B60', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('6wL5u3Zdom2EOV8c', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:33:00', NULL, NULL, '__notifications', '149735665FCBC', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('7aHoqDRYV9hoOG3J', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-10 11:21:13', NULL, NULL, '__admin_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('7BZQr7pAwXqbd2bQ', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:20', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.05\",\"new_value\":0.1},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.05\",\"new_value\":0.1}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('7KvA6SG3J9ofa6ti', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-10-10 11:22:05', NULL, NULL, '__buyer_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('82mGLaFHktKZ38YD', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:28:55', NULL, NULL, '__notifications', '10943341BF305', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('8Mx5XPw6HsxmfZx2', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:31:47', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.06209689899136951\",\"new_value\":0.07252739899107551},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.06209689899136951\",\"new_value\":0.07252739899107551}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('8OiQhLHExBBfz7x1', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-10 11:21:07', NULL, '18574378A8B5A', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('93vuQ4CdKHu5MiHn', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-10-10 11:21:43', NULL, NULL, '__buyer_extensions', 'busops', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('99Ej5OXdxMfIG780', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:33:49', NULL, NULL, '__notifications', '1360638D6247A', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('9H1updgj0L7BC2bG', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-10 11:23:10', NULL, NULL, '__users', 'mark', '[{\"field_name\":\"ttm_customer_id\",\"old_value\":null,\"new_value\":\"6342fdad79aa24dc88b58633\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('A1G41ZFd0R5XPG80', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:21:58', NULL, '131811952B4C6', '__email_addresses', 'busadmin@ankelli.com', NULL, NULL),
('a3tcFGBFovoCCViy', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:29:48', NULL, NULL, '__notifications', '150445DC457AB', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('aDctdEiXWTKz8p8y', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:31:24', NULL, NULL, '__notifications', '10284841E7741', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('aKlARTxUuM4yOIEd', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:29:04', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.0855\",\"new_value\":1.13600505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.0855\",\"new_value\":1.13600505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('AMoNqn8It2qc2hRC', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:31:52', NULL, NULL, '__notifications', '1719363937707', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('Amq8EWDSjQQyuw4x', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:02', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.55\",\"new_value\":0.3},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.55\",\"new_value\":0.3}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('B65wPVpnczdAKcjv', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-10 11:22:07', NULL, '197984F88EF5F', '__users', 'guddaz', NULL, NULL),
('B9hVeQO1ExzJcgGw', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:27:00', NULL, NULL, '__notifications', '128559F683D1D', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('baE8AR0meMqkSiNn', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:46', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.2475\",\"new_value\":0.1975},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.2475\",\"new_value\":0.1975}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('bfpUzO07VAQ4OKGp', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-10 11:21:16', NULL, NULL, '__user_group_memberships', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('bnBkuQn2FBYasen5', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:03', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.15\",\"new_value\":0.4},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.15\",\"new_value\":0.4}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('bNFtRvrr93btN27a', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-10 11:21:39', NULL, NULL, '__admin_extensions', 'busops', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('bQvTm4V7Nf0Z62yV', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:29:58', NULL, NULL, '__notifications', '12682940AE70A', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('brShdQoCfiQpHe1F', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:30:55', NULL, NULL, '__notifications', '10586990E847C', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('BvGhzH3qFasDAFpy', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:51', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.0355\",\"new_value\":1.0855},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.0355\",\"new_value\":1.0855}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('c0SOQhCTOhlPQyX7', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:30:17', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1358898989898995\",\"new_value\":0.1196298989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1358898989898995\",\"new_value\":0.1196298989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('C7b8InvejMLUVA9Z', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:33:54', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1092248989940155\",\"new_value\":0.1214193989901935},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1092248989940155\",\"new_value\":0.1214193989901935}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('CnvKkvrujC29cYnC', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:08', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.8855000000000001\",\"new_value\":0.9355000000000001},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.8855000000000001\",\"new_value\":0.9355000000000001}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('CsRLTs4u5Z5puu33', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:28:13', NULL, NULL, '__notifications', '133228A7BE7AB', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('cuR8pdcImWr4FVEY', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:59', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.5355\",\"new_value\":1.5855},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.5355\",\"new_value\":1.5855}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('d209BXUUTrqVCaZ4', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:30:59', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1244593989901935\",\"new_value\":0.1140288989904875},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1244593989901935\",\"new_value\":0.1140288989904875}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('d3vNNKt7tSMIjRSe', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:26:59', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.7855},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.7855}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('D6YuyFqbQKbCpOhE', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:33:21', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1080003989978585\",\"new_value\":0.1221793989901935},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1080003989978585\",\"new_value\":0.1221793989901935}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('dhIw5OnO2ZXAR2Hw', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:30:00', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1358898989898995\",\"new_value\":0.1252598989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1358898989898995\",\"new_value\":0.1252598989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('djigvEU12zySO3Pj', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:32:58', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1236993989901935\",\"new_value\":0.1229393989901935},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1236993989901935\",\"new_value\":0.1229393989901935}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Ds28cICG0Xfw4HSu', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:30:36', NULL, NULL, '__notifications', '15571540DE97E', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('dyboUtCk1m1u61Hg', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:33:02', NULL, NULL, '__notifications', '105103E38BBF1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('E2U9xjfVvvGXLUup', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:06', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.8355\",\"new_value\":0.8855000000000001},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.8355\",\"new_value\":0.8855000000000001}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('E4v78uIMPYKnfW69', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:27:03', NULL, NULL, '__notifications', '18482000A260B', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('E9KNc3c8cPJSrlHN', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:29:38', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.13600505050505\",\"new_value\":1.14600505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.13600505050505\",\"new_value\":1.14600505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('eC6aB85IFzQoYSU9', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-10 11:22:23', NULL, '187366BBB3AF7', '__notifications', '108973DD0A5F7', NULL, NULL),
('EG1p4QCzS1DwyMBQ', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-10-10 11:21:15', NULL, NULL, '__seller_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('eNNkaawH1atliolN', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:28:27', NULL, NULL, '__notifications', '1707494D65D08', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('eoJg9vjdkZuHhtMQ', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:29:55', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.58600505050505\",\"new_value\":1.58610505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.58600505050505\",\"new_value\":1.58610505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('EuydSxP0nsM7TwFD', 'FACTORY_SSN', 'Addition of _AssetCustodialWalletAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:21:05', NULL, NULL, '__asset_custodial_wallet_addresses', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('eX8MvN8AOK4WungT', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-10 11:21:07', NULL, '18574378A8B5A', '__users', 'developer', NULL, NULL),
('F1saB2ZAw24vlOjB', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:21:11', NULL, '1957994A4D7B0', '__email_addresses', 'sysadmin@ankelli.com', NULL, NULL),
('faTty1CwNJ7EICqG', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-10 11:23:14', NULL, NULL, '__asset_wallets', '5', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('fcIbhKWzaDRiQBri', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-10 11:22:23', NULL, '187366BBB3AF7', '__users', 'paywyze', NULL, NULL),
('fCW5N6As4RtJhCBo', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:27:07', NULL, NULL, '__notifications', '12548519CA905', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('fjZ8b2oevupIUaKx', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:21:17', NULL, '161905017751D', '__email_addresses', 'busops@ankelli.com', NULL, NULL),
('fV72v2aEFMJaUJnb', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-10 11:22:12', NULL, NULL, '__asset_wallets', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('fv7bLQDqFZfPezJR', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-10 11:21:10', NULL, NULL, '__user_group_memberships', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('fWXSUSAzFE4WMaIV', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:29:14', NULL, NULL, '__notifications', '144732C62995A', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('g0TMFKLXykm6jr1N', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:33:35', NULL, NULL, '__notifications', '197063BAB3886', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}');
INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('G5lkEqpfdxiYHPap', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:28:54', NULL, NULL, '__notifications', '128380F26A938', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('g8XvmcSFXZ6mFtpX', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-10 11:21:11', NULL, '1957994A4D7B0', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('gaorNtbMixiyi9Pq', 'FACTORY_SSN', 'Addition of _BuyerExtension entry to database.', 'entry_create', 'system', '2022-10-10 11:21:14', NULL, NULL, '__buyer_extensions', 'sysadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('GCQxaeH7v6qHmmtD', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-10 11:21:11', NULL, '1957994A4D7B0', '__users', 'sysadmin', NULL, NULL),
('GCR3cptsFzaVtjij', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:33:01', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1229393989901935\",\"new_value\":0.1087603989978585},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1229393989901935\",\"new_value\":0.1087603989978585}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('gN49LgYO38NqySnA', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:37', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.485\",\"new_value\":1.535},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.485\",\"new_value\":1.535}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('GNkGJ0lj2063zZmI', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:54', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.5\",\"new_value\":0.55},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.5\",\"new_value\":0.55}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('gvpR74jMttopd8Wz', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:31:33', NULL, NULL, '__notifications', '131818E6EEF06', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('hcwxx0PCD9R42uhC', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:31:59', NULL, NULL, '__notifications', '198988136260F', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('HE3uayWE6DQpWw0e', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:32:48', NULL, NULL, '__notifications', '180498D0C14AE', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('heADMcaHj580CzrG', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-10 11:22:48', NULL, NULL, '__user_group_memberships', '10', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('hf9NBfVqQZTs8CAh', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:30:58', NULL, NULL, '__notifications', '1969728B7FA19', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('hjVeVklzf4JYy7KK', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:27:25', NULL, NULL, '__notifications', '100628CAE05E0', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('HTrxyTlhePLA8CVf', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:34:00', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.59014505050505\",\"new_value\":1.59090505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.59014505050505\",\"new_value\":1.59090505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('I4jfnhqsWY717QOT', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:29:52', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1359898989898995\",\"new_value\":0.1358898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1359898989898995\",\"new_value\":0.1358898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('iBl67hQcDwOY4ja2', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:29:02', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.197\",\"new_value\":0.14649494949495},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.197\",\"new_value\":0.14649494949495}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('icbX0aeE1yFpUpGv', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:29:33', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1459898989898995\",\"new_value\":0.1359898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1459898989898995\",\"new_value\":0.1359898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('ImbfDHNaYYxbxKDo', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:17', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.3\",\"new_value\":0.2975},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.3\",\"new_value\":0.2975}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('iuaprRzFuhcf4EDk', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:32:55', NULL, NULL, '__notifications', '186593AD34D1C', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('IUHiadUMh76GXbSJ', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-10 11:21:58', NULL, '131811952B4C6', '__users', 'busadmin', NULL, NULL),
('IWKU48x4ztVOz2kp', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:30:22', NULL, NULL, '__notifications', '1820078275BC0', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('j4OqMrM6MzbzkuA9', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:30:32', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.58610505050505\",\"new_value\":1.58710505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.58610505050505\",\"new_value\":1.58710505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('jDwUaf3BZnRvwsgp', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:31:42', NULL, NULL, '__notifications', '1443516D881B1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('jlBAKoO8f0vBuBEb', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:28:08', NULL, NULL, '__notifications', '195706B083EF2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('jMzolfYN2AysYd2F', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:30:41', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1186298989898995\",\"new_value\":0.1348898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1186298989898995\",\"new_value\":0.1348898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('jNTj2devQBwJ5WSX', 'FACTORY_SSN', 'Addition of _Asset entry to database.', 'entry_create', 'system', '2022-10-10 11:21:03', NULL, NULL, '__assets', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('jOzokjjyjU7yZ3Xm', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:32', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.9355000000000001\",\"new_value\":0.9855000000000002},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.9355000000000001\",\"new_value\":0.9855000000000002}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"\",\"regionName\":\"\",\"cityName\":\"\",\"zipCode\":null,\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.751\",\"longitude\":\"-97.822\",\"metroCode\":null,\"areaCode\":\"\",\"timezone\":\"America\\/Chicago\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\GeoPlugin\"}'),
('Jp7guKgvtjXdEmnK', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:32:29', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1348898989898995\",\"new_value\":0.1235668989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1348898989898995\",\"new_value\":0.1235668989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('jQZUANMHAkJH7WdX', 'FACTORY_SSN', 'Updating of _Asset entry in database.', 'entry_update', 'system', '2022-10-10 11:21:06', NULL, NULL, '__assets', '1', '[{\"field_name\":\"usd_asset_exchange_rate\",\"old_value\":\"0.00076\",\"new_value\":0.0007591002099449766}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('jvMZQ3rXZe6Systh', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:27:15', NULL, NULL, '__notifications', '121478B309C1F', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('JVRjPUrevyTRk82h', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-10 11:21:53', NULL, NULL, '__user_group_memberships', '6', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('K2tlFd9CWiPssFgH', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:27:58', NULL, NULL, '__notifications', '104050D23D196', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('K9670WQnbx8Faa5A', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-10 11:22:28', NULL, NULL, '__users', 'paywyze', '[{\"field_name\":\"ttm_customer_id\",\"old_value\":null,\"new_value\":\"63298faa64858e37282c6267\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('KaNxoRX14MTwwugu', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:05', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.185\",\"new_value\":0.99},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.185\",\"new_value\":0.99}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('KBcmAiw8ibuoZoTL', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:59', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.1025\",\"new_value\":1.3325},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.1025\",\"new_value\":1.3325}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('kCtLQsmUnfFovBo8', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-10 11:21:34', NULL, NULL, '__user_group_memberships', '5', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('ke9ZO9PEphaG9M7Y', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:27:55', NULL, NULL, '__notifications', '197255772315B', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('kg08K9Cy2KUXrCrc', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:31:38', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.07238039899136951\",\"new_value\":0.06209689899136951},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.07238039899136951\",\"new_value\":0.06209689899136951}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('KPav68RYbdXENHgp', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:29:28', NULL, NULL, '__notifications', '141704381E264', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('KQFMZyjFknVup7gJ', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-10 11:21:58', NULL, '131811952B4C6', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('KzmYLNkwNpAjDeND', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:02', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.135\",\"new_value\":0.185},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.135\",\"new_value\":0.185}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('l1PVIiY47PDrqMgC', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:32:38', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1235668989898995\",\"new_value\":0.1228068989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1235668989898995\",\"new_value\":0.1228068989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('lLtf4GcQiIEWWXve', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:26:56', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.08500000000000001},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.08500000000000001}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('lVS4D0pwaCpvUr3d', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:01', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.4325\",\"new_value\":1.4825},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.4325\",\"new_value\":1.4825}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('lW0lGMRvjRGQiYl1', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-10 11:21:19', NULL, NULL, '__users', 'busops', '[{\"field_name\":\"ttm_customer_id\",\"old_value\":null,\"new_value\":\"6321ec61d5f2885b44f1bda0\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('lXb29FqBbioQVoz1', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:57', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1\",\"new_value\":0.15},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1\",\"new_value\":0.15}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('MamJeg51rD5GFfsy', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:33:11', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.58862505050505\",\"new_value\":1.58938505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.58862505050505\",\"new_value\":1.58938505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('MKnLbrocXRGHrDqW', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:32:53', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1228068989898995\",\"new_value\":0.1341298989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1228068989898995\",\"new_value\":0.1341298989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('mlQDldzL1RE2OLER', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-10 11:22:39', NULL, NULL, '__asset_wallets', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('mLtf1dAQxiwOfgcL', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:32:34', NULL, NULL, '__notifications', '124816AF43376', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('mPypfdnTWaC4vUmx', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:32:59', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.58786505050505\",\"new_value\":1.58862505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.58786505050505\",\"new_value\":1.58862505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('mTB5vJzspxXHtuL9', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:21:07', NULL, '18574378A8B5A', '__email_addresses', 'developer.ankelli@gmail.com', NULL, NULL),
('mTmqDiWAJIsZtNqY', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-10 11:22:07', NULL, '197984F88EF5F', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('MuZefFPNx7pFaPxi', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:22:23', NULL, '187366BBB3AF7', '__email_addresses', 'paywyze@ankelli.com', NULL, NULL),
('NbJN4nF8tPeeMxbe', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:30:46', NULL, NULL, '__notifications', '137134A026A87', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('nfLSiUAxog6IVxcF', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:30:00', NULL, NULL, '__notifications', '169378724965E', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ngPnMFzYojz5SmbW', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:22:11', NULL, NULL, '__asset_wallet_addresses', '2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('NoYuE4pZisGCKLRb', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-10 11:21:29', NULL, NULL, '__asset_wallets', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('NSG09bHTf5MU1uBZ', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:31:04', NULL, NULL, '__notifications', '12288364CDA77', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('Nvg94aOO9fV4qk9c', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:23:09', NULL, '16072452694E6', '__email_addresses', 'mark@ankelli.com', NULL, NULL),
('NZZxHqNgNmFX0mt4', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:31:56', NULL, NULL, '__notifications', '140292A11E284', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('o0Irc8Vgz9SET0tS', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:22', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.4825\",\"new_value\":1.485},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.4825\",\"new_value\":1.485}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('O3cKJM2WK0kWd2no', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:32:10', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1142493989898995\",\"new_value\":0.1246063989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1142493989898995\",\"new_value\":0.1246063989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('o4S50KhG2189XdMP', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:27:47', NULL, NULL, '__notifications', '155268989E2D5', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('O81D1Ao1OdSQ5gcE', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:56', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1975\",\"new_value\":0.197},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1975\",\"new_value\":0.197}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('OHqT6u3qJ0mrdk6h', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:31:14', NULL, NULL, '__notifications', '1812059B8DAA0', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('OjbfUBwGD1CNKmTF', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:29:57', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1358898989898995\",\"new_value\":0.1256063989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1358898989898995\",\"new_value\":0.1256063989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Os7kRfBo02D9dViA', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:34:01', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1084648989940155\",\"new_value\":0.1206593989901935},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1084648989940155\",\"new_value\":0.1206593989901935}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('OVLuweFDDUkE1Xam', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:23:07', NULL, NULL, '__asset_wallet_addresses', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('P73vHuHxQimXCUfa', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:29:59', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1256063989898995\",\"new_value\":0.1358898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1256063989898995\",\"new_value\":0.1358898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('pksNLFJMNbIcjMWp', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:32:19', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1246063989898995\",\"new_value\":0.1348898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1246063989898995\",\"new_value\":0.1348898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('ppLRn8AOvBHI3uxF', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-10 11:22:08', NULL, '197984F88EF5F', '__notifications', '148526F0BD0CF', NULL, NULL),
('ppsbKBiKfu4MNSgH', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:33:56', NULL, NULL, '__notifications', '12498591177F9', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('PtZATCSBph2uk0LO', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:30:08', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1252598989898995\",\"new_value\":0.1358898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1252598989898995\",\"new_value\":0.1358898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('q6lqT7gXeDbMNe6b', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-10 11:21:11', NULL, '1957994A4D7B0', '__notifications', '16807487876B4', NULL, NULL),
('q9ot5CYjAnC17EIZ', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:29:19', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.14649494949495\",\"new_value\":0.1459898989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.14649494949495\",\"new_value\":0.1459898989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('qdul6SDYsCjnQqzw', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:23:03', NULL, '112578AAD22CF', '__email_addresses', 'john_doe@ankelli.com', NULL, NULL),
('QFCKYwu9HDd3L4MU', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:42', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.9855000000000002\",\"new_value\":1.0355},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.9855000000000002\",\"new_value\":1.0355}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}');
INSERT INTO `__logs` (`id`, `session_token`, `action_note`, `action_type`, `action_user_username`, `action_datetime`, `utc_offset`, `batch_code`, `entry_table`, `entry_uid`, `entry_update_result`, `request_location`) VALUES
('qGheMDYNPCF7New7', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:29:24', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.5855\",\"new_value\":1.58600505050505},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.5855\",\"new_value\":1.58600505050505}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('QHmvWDT1XOhRjW87', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:33:59', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1092248989940155\",\"new_value\":0.1084648989940155},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1092248989940155\",\"new_value\":0.1084648989940155}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('qkeDh4dj1e52ikzJ', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-10 11:22:03', NULL, NULL, '__user_group_memberships', '7', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('qP6oH8jhNs3TG5OZ', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-10 11:22:58', NULL, NULL, '__user_group_memberships', '12', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('Qpgg4OgPpBLu1rV3', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:30:57', NULL, NULL, '__notifications', '138859E559CE2', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('qRXlIIyR7KOAcF87', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:33:06', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1087603989978585\",\"new_value\":0.1080003989978585},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1087603989978585\",\"new_value\":0.1080003989978585}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('qs7NGcDzW94lr0zI', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-10 11:23:08', NULL, '16072452694E6', '__users', 'mark', NULL, NULL),
('qvCje9r2ikOZYAv3', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-10 11:21:12', NULL, NULL, '__user_group_memberships', '3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('qWvm005PfCTNvqIN', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:32', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.2975\",\"new_value\":0.2475},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.2975\",\"new_value\":0.2475}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('R3risZvVQK9WjQcz', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-10 11:21:58', NULL, '131811952B4C6', '__notifications', '138581B2599DA', NULL, NULL),
('RrI4fxAAWqUrQLBN', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-10-10 11:22:06', NULL, NULL, '__seller_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ryWeQYaxY5hGng6r', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:29:43', NULL, NULL, '__notifications', '12465502039F4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('Sb6ptuqPdLC5iMHG', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-10 11:22:53', NULL, NULL, '__user_group_memberships', '11', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('sFGDB8bZ5u9l30Uk', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:33:57', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1214193989901935\",\"new_value\":0.1092248989940155},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1214193989901935\",\"new_value\":0.1092248989940155}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('t6e8ZoedCTdXYwle', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:33:30', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1221793989901935\",\"new_value\":0.1099848989940155},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1221793989901935\",\"new_value\":0.1099848989940155}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('T702FmAULAwRBrDC', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-10 11:23:03', NULL, '112578AAD22CF', '__users', 'john_doe', NULL, NULL),
('TccCSwiiiUuXrjOp', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:29:56', NULL, NULL, '__notifications', '145723784B114', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('TcZjKYZMy0p8kSpb', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:28:41', NULL, NULL, '__notifications', '1587265D514EB', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('TGih6FAJghfxH2n3', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:31:58', NULL, NULL, '__notifications', '133862EB650F3', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('tGWA6cJnQEDPYkE6', 'FACTORY_SSN', 'Addition of _AssetWallet entry to database.', 'entry_create', 'system', '2022-10-10 11:23:07', NULL, NULL, '__asset_wallets', '4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ThNyMNWdNkxujxfg', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:30:03', NULL, NULL, '__notifications', '1706304DBA70C', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('tKs4PwDBthAeznOc', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:31:57', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.0829578989907815\",\"new_value\":0.0933883989904875},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.0829578989907815\",\"new_value\":0.0933883989904875}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('tLhQMDrjmfbSk5Uk', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:31:01', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1140288989904875\",\"new_value\":0.1035983989907815},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1140288989904875\",\"new_value\":0.1035983989907815}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('tmOBSLw9qMDUb1nG', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-10 11:22:09', NULL, NULL, '__users', 'guddaz', '[{\"field_name\":\"ttm_customer_id\",\"old_value\":null,\"new_value\":\"632970417b09c5d6322bc226\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('tQ1Xmp1NwjPxNpKn', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:30:27', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1196298989898995\",\"new_value\":0.1186298989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1196298989898995\",\"new_value\":0.1186298989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('Tt59NB11o6gtHgeG', 'FACTORY_SSN', 'Addition of _EmailAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:22:07', NULL, '197984F88EF5F', '__email_addresses', 'goodhopedhliwayo@gmail.com', NULL, NULL),
('UfOAZDJNGPMsARJX', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:30:57', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1348898989898995\",\"new_value\":0.1244593989901935},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1348898989898995\",\"new_value\":0.1244593989901935}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('ulKdx38Ai2AVSPfV', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:32:24', NULL, NULL, '__notifications', '167039FC3C155', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('UPy61opfxyOx9rjI', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-10 11:22:04', NULL, NULL, '__admin_extensions', 'busadmin', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('uVDY0GIPjLv8hgdi', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-10 11:21:17', NULL, '161905017751D', '__notifications', '156242467D1D6', NULL, NULL),
('UWgAHBo6N0ByKNaV', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:31:58', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.0933883989904875\",\"new_value\":0.1038188989901935},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.0933883989904875\",\"new_value\":0.1038188989901935}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('UYpYMkmOeueiAcys', 'FACTORY_SSN', 'Addition of _AssetWalletAddress entry to database.', 'entry_create', 'system', '2022-10-10 11:21:24', NULL, NULL, '__asset_wallet_addresses', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('uzK87D884QSpAd2E', 'FACTORY_SSN', 'Updating of _User entry in database.', 'entry_update', 'system', '2022-10-10 11:23:05', NULL, NULL, '__users', 'john_doe', '[{\"field_name\":\"ttm_customer_id\",\"old_value\":null,\"new_value\":\"63207c7291626c6cd5860a21\"}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Vd2xY2ZqAhPkI47o', 'FACTORY_SSN', 'Addition of _User entry to database.', 'entry_create', 'system', '2022-10-10 11:21:17', NULL, '161905017751D', '__users', 'busops', NULL, NULL),
('VHuKZjfDU01glpj5', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:26:55', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.5},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.5}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('VPZgWPtZoroVdUka', 'FACTORY_SSN', 'Addition of _RegToken entry to database.', 'entry_create', 'system', '2022-10-10 11:23:15', NULL, NULL, '__reg_tokens', '1234567890', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('VtBffmIptZBdy5Bp', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-10 11:23:08', NULL, '16072452694E6', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('VtDSGAJciTn1Fc3q', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-10 11:21:09', NULL, NULL, '__admin_extensions', 'developer', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('w4AdBx0ZfsWrgS6q', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:31:18', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.09316789899107551\",\"new_value\":0.08273739899136952},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.09316789899107551\",\"new_value\":0.08273739899136952}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('WAjTRG76sj7tZ3rY', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:33:58', NULL, NULL, '__notifications', '1351940D8F57D', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('WJuBNwcPpN2qOTpi', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-10 11:21:08', NULL, NULL, '__user_group_memberships', '1', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('wlO6NtHkaRGypV5b', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-10 11:22:18', NULL, NULL, '__user_group_memberships', '9', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('wRL8WTQ9j57mIipt', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:29:01', NULL, NULL, '__notifications', '174907C7A277C', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('wU5u56D9uQSySWQ4', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:57', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.535\",\"new_value\":1.5355},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.535\",\"new_value\":1.5355}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('WV56LHhuHPzscU3p', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:30:51', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1348898989898995\",\"new_value\":0.1246063989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1348898989898995\",\"new_value\":0.1246063989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('XCb9aGttnTOMtYAB', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:32:00', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1038188989901935\",\"new_value\":0.1142493989898995},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1038188989901935\",\"new_value\":0.1142493989898995}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('xd77QHkXN865neBI', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-10 11:22:13', NULL, NULL, '__admin_extensions', 'guddaz', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('xHo9mMW3RjWJnJyU', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:26:57', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.08500000000000001\",\"new_value\":0.135},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.08500000000000001\",\"new_value\":0.135}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('XiFCf03BLOFiBLKa', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:11', NULL, NULL, '__asset_wallets', '3', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.05},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0\",\"new_value\":0.05}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('XjB2mn34sEc1kSvw', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:28:58', NULL, NULL, '__notifications', '105098371D92D', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('XjVFi47GUyk6fkQu', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:27:02', NULL, NULL, '__asset_wallets', '2', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.7855\",\"new_value\":0.8355},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.7855\",\"new_value\":0.8355}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('XKTadEiTu0fh4t8v', 'FACTORY_SSN', 'Addition of _AdminExtension entry to database.', 'entry_create', 'system', '2022-10-10 11:22:43', NULL, NULL, '__admin_extensions', 'paywyze', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('xqU4ILq84mi4FA8a', 'FACTORY_SSN', 'Addition of _UserGroupMembership entry to database.', 'entry_create', 'system', '2022-10-10 11:22:06', NULL, NULL, '__user_group_memberships', '8', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('Y9sRbUezO3ffCOrq', 'FACTORY_SSN', 'User signup.', 'batch_init', 'system', '2022-10-10 11:21:17', NULL, '161905017751D', NULL, NULL, NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('yB8mptYjEqzdxUFr', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:31:00', NULL, NULL, '__notifications', '19370448BE8A4', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('yRWRoAzZJuwGDHNp', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:28:00', NULL, NULL, '__asset_wallets', '1', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"1.3825\",\"new_value\":1.4325},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"1.3825\",\"new_value\":1.4325}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('YSQb9F23U2hk5rtU', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:34:00', NULL, NULL, '__notifications', '1673477EDBB3C', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('YVhe1PHvZODQ3rn8', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:31:55', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.07252739899107551\",\"new_value\":0.0829578989907815},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.07252739899107551\",\"new_value\":0.0829578989907815}]', '{\"ip\":\"66.102.0.0\",\"countryName\":\"United States\",\"countryCode\":\"US\",\"regionCode\":\"CA\",\"regionName\":\"California\",\"cityName\":\"Mountain View\",\"zipCode\":\"94043\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"37.422\",\"longitude\":\"-122.084\",\"metroCode\":null,\"areaCode\":\"CA\",\"timezone\":\"America\\/Los_Angeles\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpApi\"}'),
('YwCf0oCH0RQZz1CS', 'TEST_SSN', 'Addition of _Notification entry to database.', 'entry_create', NULL, '2022-10-10 11:27:37', NULL, NULL, '__notifications', '13791342211BF', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('ZFsbE6NhzYnfUHde', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:31:28', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.08273739899136952\",\"new_value\":0.07238039899136951},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.08273739899136952\",\"new_value\":0.07238039899136951}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('ZJMPSwmKo5jnth58', 'FACTORY_SSN', 'Addition of _SellerExtension entry to database.', 'entry_create', 'system', '2022-10-10 11:21:48', NULL, NULL, '__seller_extensions', 'busops', NULL, '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('zKMkYFIjEbrm8Ce1', 'TEST_SSN', 'Updating of _AssetWallet entry in database.', 'entry_update', NULL, '2022-10-10 11:33:40', NULL, NULL, '__asset_wallets', '4', '[{\"field_name\":\"usable_balance_asset_value\",\"old_value\":\"0.1099848989940155\",\"new_value\":0.1092248989940155},{\"field_name\":\"total_balance_asset_value\",\"old_value\":\"0.1099848989940155\",\"new_value\":0.1092248989940155}]', '{\"ip\":\"66.102.0.0\",\"countryName\":null,\"countryCode\":\"BR\",\"regionCode\":null,\"regionName\":\"S\\u00e3o Paulo\",\"cityName\":\"S\\u00e3o Paulo\",\"zipCode\":\"01000-000\",\"isoCode\":null,\"postalCode\":null,\"latitude\":\"-23.5475\",\"longitude\":\"-46.6361\",\"metroCode\":null,\"areaCode\":null,\"timezone\":\"America\\/Sao_Paulo\",\"driver\":\"Stevebauman\\\\Location\\\\Drivers\\\\IpInfo\"}'),
('znWa9Izot6Oi0dsH', 'FACTORY_SSN', 'Addition of _Notification entry to database.', 'entry_create', 'system', '2022-10-10 11:23:03', NULL, '112578AAD22CF', '__notifications', '119651268418B', NULL, NULL);

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
('100628CAE05E0', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 176634F724E7A.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.1 ETH, Total : 0.1 ETH\"}', '2022-10-10 11:27:20', NULL),
('10284841E7741', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been debited from your account.\",\"body\":\"0.010430499999706 ETH has been debited from your account.\\nTxn ref: 1565956497C3B.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.08273739899136952 ETH, Total : 0.08273739899136952 ETH\"}', '2022-10-10 11:31:18', NULL),
('1032394A182A1', 'developer', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-10 11:21:07', NULL),
('104050D23D196', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 144159CFC225F.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.15 ETH, Total : 0.15 ETH\"}', '2022-10-10 11:27:57', NULL),
('105048CCCE32F', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.012194499996178 ETH has been credited into your account.\",\"body\":\"0.012194499996178 ETH has been credited into your account.\\nTxn ref: 1908746BE4AFD.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1206593989901935 ETH, Total : 0.1206593989901935 ETH\"}', '2022-10-10 11:34:01', NULL),
('105098371D92D', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0005 ETH has been debited from your account.\",\"body\":\"0.0005 ETH has been debited from your account.\\nTxn ref: 1376943755217.\\nDescription: Outbound platform charge fee for transaction 1105790DA4D87\\nNew balances: Usable : 0.197 ETH, Total : 0.197 ETH\"}', '2022-10-10 11:28:57', NULL),
('105103E38BBF1', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.014178999992335 ETH has been debited from your account.\",\"body\":\"0.014178999992335 ETH has been debited from your account.\\nTxn ref: 1431713E9FDDF.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1087603989978585 ETH, Total : 0.1087603989978585 ETH\"}', '2022-10-10 11:33:01', NULL),
('10586990E847C', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0102835 ETH has been debited from your account.\",\"body\":\"0.0102835 ETH has been debited from your account.\\nTxn ref: 159994D5B5191.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1246063989898995 ETH, Total : 0.1246063989898995 ETH\"}', '2022-10-10 11:30:51', NULL),
('108973DD0A5F7', 'paywyze', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-10 11:22:23', NULL),
('10943341BF305', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 1365491EF7C2F.\\nDescription: Inbound asset release for trade 198388B36A31C\\nNew balances: Usable : 1.0855 ETH, Total : 1.0855 ETH\"}', '2022-10-10 11:28:54', NULL),
('119651268418B', 'john_doe', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-10 11:23:03', NULL),
('121478B309C1F', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 18494585563CF.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.05 ETH, Total : 0.05 ETH\"}', '2022-10-10 11:27:11', NULL),
('12288364CDA77', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been debited from your account.\",\"body\":\"0.010430499999706 ETH has been debited from your account.\\nTxn ref: 18313704857A4.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1035983989907815 ETH, Total : 0.1035983989907815 ETH\"}', '2022-10-10 11:31:01', NULL),
('12465502039F4', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.01 ETH has been debited from your account.\",\"body\":\"0.01 ETH has been debited from your account.\\nTxn ref: 18715658B61E8.\\nDescription: Test send via email\\nNew balances: Usable : 0.1359898989898995 ETH, Total : 0.1359898989898995 ETH\"}', '2022-10-10 11:29:38', NULL),
('124816AF43376', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.011323 ETH has been debited from your account.\",\"body\":\"0.011323 ETH has been debited from your account.\\nTxn ref: 128663DADEB1C.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1235668989898995 ETH, Total : 0.1235668989898995 ETH\"}', '2022-10-10 11:32:29', NULL),
('12498591177F9', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.012194499996178 ETH has been credited into your account.\",\"body\":\"0.012194499996178 ETH has been credited into your account.\\nTxn ref: 150996325E53F.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1214193989901935 ETH, Total : 0.1214193989901935 ETH\"}', '2022-10-10 11:33:54', NULL),
('12548519CA905', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 197857C2851E2.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.8855000000000001 ETH, Total : 0.8855000000000001 ETH\"}', '2022-10-10 11:27:06', NULL),
('12682940AE70A', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0102835 ETH has been debited from your account.\",\"body\":\"0.0102835 ETH has been debited from your account.\\nTxn ref: 197855027B86D.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1256063989898995 ETH, Total : 0.1256063989898995 ETH\"}', '2022-10-10 11:29:57', NULL),
('128380F26A938', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.05 ETH has been debited from your account.\",\"body\":\"0.05 ETH has been debited from your account.\\nTxn ref: 1365491EF7C2F.\\nDescription: Outbound asset release for trade 198388B36A31C\\nNew balances: Usable : 0.1975 ETH, Total : 0.1975 ETH\"}', '2022-10-10 11:28:51', NULL),
('128559F683D1D', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.7855 ETH has been credited into your account.\",\"body\":\"0.7855 ETH has been credited into your account.\\nTxn ref: 1272600673E21.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.7855 ETH, Total : 0.7855 ETH\"}', '2022-10-10 11:26:59', NULL),
('13017364E17E6', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.01063 ETH has been credited into your account.\",\"body\":\"0.01063 ETH has been credited into your account.\\nTxn ref: 1751791907EC9.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1358898989898995 ETH, Total : 0.1358898989898995 ETH\"}', '2022-10-10 11:30:08', NULL),
('131818E6EEF06', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010357 ETH has been debited from your account.\",\"body\":\"0.010357 ETH has been debited from your account.\\nTxn ref: 1626790C9F922.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.07238039899136951 ETH, Total : 0.07238039899136951 ETH\"}', '2022-10-10 11:31:28', NULL),
('133228A7BE7AB', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.25 ETH has been credited into your account.\",\"body\":\"0.25 ETH has been credited into your account.\\nTxn ref: 11033823C3BA7.\\nDescription: Reconciled payment\\nNew balances: Usable : 0.4 ETH, Total : 0.4 ETH\"}', '2022-10-10 11:28:08', NULL),
('133862EB650F3', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been credited into your account.\",\"body\":\"0.010430499999706 ETH has been credited into your account.\\nTxn ref: 11264715A92B8.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.0933883989904875 ETH, Total : 0.0933883989904875 ETH\"}', '2022-10-10 11:31:57', NULL),
('1351940D8F57D', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.012194499996178 ETH has been debited from your account.\",\"body\":\"0.012194499996178 ETH has been debited from your account.\\nTxn ref: 143569386B382.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1092248989940155 ETH, Total : 0.1092248989940155 ETH\"}', '2022-10-10 11:33:57', NULL),
('1360638D6247A', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.00076 ETH has been debited from your account.\",\"body\":\"0.00076 ETH has been debited from your account.\\nTxn ref: 14263508C42DA.\\nDescription: Outbound platform charge fee for transaction 10515514D1ED7\\nNew balances: Usable : 0.1092248989940155 ETH, Total : 0.1092248989940155 ETH\"}', '2022-10-10 11:33:45', NULL),
('137134A026A87', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.01626 ETH has been credited into your account.\",\"body\":\"0.01626 ETH has been credited into your account.\\nTxn ref: 11415158FF078.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1348898989898995 ETH, Total : 0.1348898989898995 ETH\"}', '2022-10-10 11:30:41', NULL),
('13791342211BF', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 148473EAD31A9.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.9855000000000002 ETH, Total : 0.9855000000000002 ETH\"}', '2022-10-10 11:27:32', NULL),
('138571F3749B3', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 1804754914B35.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.9355000000000001 ETH, Total : 0.9355000000000001 ETH\"}', '2022-10-10 11:27:08', NULL),
('138581B2599DA', 'busadmin', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-10 11:21:58', NULL),
('138859E559CE2', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.0102835 ETH has been credited into your account.\",\"body\":\"0.0102835 ETH has been credited into your account.\\nTxn ref: 18626518C695E.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1348898989898995 ETH, Total : 0.1348898989898995 ETH\"}', '2022-10-10 11:30:56', NULL),
('140292A11E284', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been credited into your account.\",\"body\":\"0.010430499999706 ETH has been credited into your account.\\nTxn ref: 192434228F0AE.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.0829578989907815 ETH, Total : 0.0829578989907815 ETH\"}', '2022-10-10 11:31:55', NULL),
('141704381E264', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0005050505050505 ETH has been debited from your account.\",\"body\":\"0.0005050505050505 ETH has been debited from your account.\\nTxn ref: 1450604CC44B2.\\nDescription: Outbound platform charge fee for transaction 148377AB4E3EB\\nNew balances: Usable : 0.1459898989898995 ETH, Total : 0.1459898989898995 ETH\"}', '2022-10-10 11:29:24', NULL),
('1440049C4F845', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been credited into your account.\",\"body\":\"0.010430499999706 ETH has been credited into your account.\\nTxn ref: 1310818106304.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1142493989898995 ETH, Total : 0.1142493989898995 ETH\"}', '2022-10-10 11:32:00', NULL),
('1443516D881B1', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0102835 ETH has been debited from your account.\",\"body\":\"0.0102835 ETH has been debited from your account.\\nTxn ref: 198178DD17F0F.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.06209689899136951 ETH, Total : 0.06209689899136951 ETH\"}', '2022-10-10 11:31:38', NULL),
('144732C62995A', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05050505050505 ETH has been credited into your account.\",\"body\":\"0.05050505050505 ETH has been credited into your account.\\nTxn ref: 104261950C69B.\\nDescription: Inbound asset release for trade 181964B45B4FD\\nNew balances: Usable : 1.13600505050505 ETH, Total : 1.13600505050505 ETH\"}', '2022-10-10 11:29:09', NULL),
('145723784B114', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0001 ETH has been debited from your account.\",\"body\":\"0.0001 ETH has been debited from your account.\\nTxn ref: 13556949159DD.\\nDescription: Outbound platform charge fee for transaction 186678F719852\\nNew balances: Usable : 0.1358898989898995 ETH, Total : 0.1358898989898995 ETH\"}', '2022-10-10 11:29:55', NULL),
('1468207999B60', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.014178999992335 ETH has been credited into your account.\",\"body\":\"0.014178999992335 ETH has been credited into your account.\\nTxn ref: 150411D87B4C4.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1221793989901935 ETH, Total : 0.1221793989901935 ETH\"}', '2022-10-10 11:33:21', NULL),
('148526F0BD0CF', 'guddaz', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-10 11:22:07', NULL),
('149735665FCBC', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.00076 ETH has been debited from your account.\",\"body\":\"0.00076 ETH has been debited from your account.\\nTxn ref: 13651438863C2.\\nDescription: Outbound platform charge fee for transaction 140870C02D892\\nNew balances: Usable : 0.1229393989901935 ETH, Total : 0.1229393989901935 ETH\"}', '2022-10-10 11:32:59', NULL),
('150445DC457AB', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.01 ETH has been credited into your account.\",\"body\":\"0.01 ETH has been credited into your account.\\nTxn ref: 18715658B61E8.\\nDescription: Test send via email\\nNew balances: Usable : 1.14600505050505 ETH, Total : 1.14600505050505 ETH\"}', '2022-10-10 11:29:43', NULL),
('155268989E2D5', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 127646BE74FB7.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 1.0355 ETH, Total : 1.0355 ETH\"}', '2022-10-10 11:27:42', NULL),
('15571540DE97E', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.001 ETH has been debited from your account.\",\"body\":\"0.001 ETH has been debited from your account.\\nTxn ref: 122360D3D7D1D.\\nDescription: Outbound platform charge fee for transaction 154888FE1206C\\nNew balances: Usable : 0.1186298989898995 ETH, Total : 0.1186298989898995 ETH\"}', '2022-10-10 11:30:32', NULL),
('156242467D1D6', 'busops', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-10 11:21:17', NULL),
('1587265D514EB', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.05 ETH has been debited from your account.\",\"body\":\"0.05 ETH has been debited from your account.\\nTxn ref: 137695D973673.\\nDescription: Test sending offchain\\nNew balances: Usable : 0.2475 ETH, Total : 0.2475 ETH\"}', '2022-10-10 11:28:37', NULL),
('167039FC3C155', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.0102835 ETH has been credited into your account.\",\"body\":\"0.0102835 ETH has been credited into your account.\\nTxn ref: 154763D340CA5.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1348898989898995 ETH, Total : 0.1348898989898995 ETH\"}', '2022-10-10 11:32:19', NULL),
('1673477EDBB3C', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.00076 ETH has been debited from your account.\",\"body\":\"0.00076 ETH has been debited from your account.\\nTxn ref: 1291741E8515E.\\nDescription: Outbound platform charge fee for transaction 159322B16E604\\nNew balances: Usable : 0.1084648989940155 ETH, Total : 0.1084648989940155 ETH\"}', '2022-10-10 11:34:00', NULL),
('16807487876B4', 'sysadmin', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-10 11:21:11', NULL),
('169378724965E', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.0102835 ETH has been credited into your account.\",\"body\":\"0.0102835 ETH has been credited into your account.\\nTxn ref: 156290257849E.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1358898989898995 ETH, Total : 0.1358898989898995 ETH\"}', '2022-10-10 11:29:59', NULL),
('1706304DBA70C', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.01063 ETH has been debited from your account.\",\"body\":\"0.01063 ETH has been debited from your account.\\nTxn ref: 124724BA9009B.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1252598989898995 ETH, Total : 0.1252598989898995 ETH\"}', '2022-10-10 11:30:00', NULL),
('1707494D65D08', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.0025 ETH has been debited from your account.\",\"body\":\"0.0025 ETH has been debited from your account.\\nTxn ref: 115045D3A746E.\\nDescription: Reconciled payment\\nNew balances: Usable : 0.2975 ETH, Total : 0.2975 ETH\"}', '2022-10-10 11:28:22', NULL),
('1719363937707', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been credited into your account.\",\"body\":\"0.010430499999706 ETH has been credited into your account.\\nTxn ref: 100900E583555.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.07252739899107551 ETH, Total : 0.07252739899107551 ETH\"}', '2022-10-10 11:31:47', NULL),
('174907C7A277C', 'paywyze', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 19695092F998E.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.45 ETH, Total : 0.45 ETH\"}', '2022-10-10 11:29:00', NULL),
('18029138B6223', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.5 ETH has been credited into your account.\",\"body\":\"0.5 ETH has been credited into your account.\\nTxn ref: 197128C819989.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.5 ETH, Total : 0.5 ETH\"}', '2022-10-10 11:26:55', NULL),
('180498D0C14AE', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.00076 ETH has been debited from your account.\",\"body\":\"0.00076 ETH has been debited from your account.\\nTxn ref: 103344D67F4D0.\\nDescription: Outbound platform charge fee for transaction 1137866E2C98F\\nNew balances: Usable : 0.1228068989898995 ETH, Total : 0.1228068989898995 ETH\"}', '2022-10-10 11:32:43', NULL),
('1812059B8DAA0', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been debited from your account.\",\"body\":\"0.010430499999706 ETH has been debited from your account.\\nTxn ref: 179682D13789D.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.09316789899107551 ETH, Total : 0.09316789899107551 ETH\"}', '2022-10-10 11:31:09', NULL),
('1820078275BC0', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.01626 ETH has been debited from your account.\",\"body\":\"0.01626 ETH has been debited from your account.\\nTxn ref: 1988623783BFC.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1196298989898995 ETH, Total : 0.1196298989898995 ETH\"}', '2022-10-10 11:30:17', NULL),
('1846777353E19', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.05050505050505 ETH has been debited from your account.\",\"body\":\"0.05050505050505 ETH has been debited from your account.\\nTxn ref: 104261950C69B.\\nDescription: Outbound asset release for trade 181964B45B4FD\\nNew balances: Usable : 0.14649494949495 ETH, Total : 0.14649494949495 ETH\"}', '2022-10-10 11:29:04', NULL),
('18482000A260B', 'guddaz', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 109954492AF02.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.8355 ETH, Total : 0.8355 ETH\"}', '2022-10-10 11:27:02', NULL),
('1848727923304', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been debited from your account.\",\"body\":\"0.010430499999706 ETH has been debited from your account.\\nTxn ref: 1338325E58AD5.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1236993989901935 ETH, Total : 0.1236993989901935 ETH\"}', '2022-10-10 11:32:56', NULL),
('186593AD34D1C', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.011323 ETH has been credited into your account.\",\"body\":\"0.011323 ETH has been credited into your account.\\nTxn ref: 170312A48FA60.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1341298989898995 ETH, Total : 0.1341298989898995 ETH\"}', '2022-10-10 11:32:53', NULL),
('19249995DE817', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.00076 ETH has been debited from your account.\",\"body\":\"0.00076 ETH has been debited from your account.\\nTxn ref: 1366477009792.\\nDescription: Outbound platform charge fee for transaction 1791281F36FB8\\nNew balances: Usable : 0.1080003989978585 ETH, Total : 0.1080003989978585 ETH\"}', '2022-10-10 11:33:11', NULL),
('192626C711806', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.010357 ETH has been credited into your account.\",\"body\":\"0.010357 ETH has been credited into your account.\\nTxn ref: 162842C77CBD5.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1246063989898995 ETH, Total : 0.1246063989898995 ETH\"}', '2022-10-10 11:32:10', NULL),
('19370448BE8A4', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been debited from your account.\",\"body\":\"0.010430499999706 ETH has been debited from your account.\\nTxn ref: 178862512C3BB.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1140288989904875 ETH, Total : 0.1140288989904875 ETH\"}', '2022-10-10 11:30:59', NULL),
('195706B083EF2', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.25 ETH has been debited from your account.\",\"body\":\"0.25 ETH has been debited from your account.\\nTxn ref: 11033823C3BA7.\\nDescription: Reconciled payment\\nNew balances: Usable : 0.3 ETH, Total : 0.3 ETH\"}', '2022-10-10 11:28:03', NULL),
('1969728B7FA19', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been debited from your account.\",\"body\":\"0.010430499999706 ETH has been debited from your account.\\nTxn ref: 1255749550807.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1244593989901935 ETH, Total : 0.1244593989901935 ETH\"}', '2022-10-10 11:30:57', NULL),
('197063BAB3886', 'john_doe', '{\"title\":\"Debit Transaction\",\"subtitle\":\"0.012194499996178 ETH has been debited from your account.\",\"body\":\"0.012194499996178 ETH has been debited from your account.\\nTxn ref: 162902D68B9EA.\\nDescription: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1099848989940155 ETH, Total : 0.1099848989940155 ETH\"}', '2022-10-10 11:33:30', NULL),
('197255772315B', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.05 ETH has been credited into your account.\",\"body\":\"0.05 ETH has been credited into your account.\\nTxn ref: 1558398DB2FE4.\\nDescription: Transfer from CoinGecko wallet to Ankelli wallet\\nNew balances: Usable : 0.55 ETH, Total : 0.55 ETH\"}', '2022-10-10 11:27:54', NULL),
('197757C103E9C', 'mark', '{\"title\":\"Welcome Note\",\"subtitle\":\"Welcome to the Ankelli Crypto trading Platform.\",\"body\":\"We as the Ankelli Team welcome you to our Crypto trading platform.\\nPlease, enjoy the services we have prepared for you.\\nTo get the most out of your experience here, start by verifying your email address.\"}', '2022-10-10 11:23:09', NULL),
('198988136260F', 'john_doe', '{\"title\":\"Credit Transaction\",\"subtitle\":\"0.010430499999706 ETH has been credited into your account.\",\"body\":\"0.010430499999706 ETH has been credited into your account.\\nTxn ref: 150356EAA4D73.\\nDescription: Rollback for: Transfer from Ankelli wallet to CoinGecko\\nNew balances: Usable : 0.1038188989901935 ETH, Total : 0.1038188989901935 ETH\"}', '2022-10-10 11:31:58', NULL);

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
(1, 'Update system config params', 'update_sysconfig_params', 'Permission holder can update system config params.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(2, 'Handle feedback reports', 'handle_feedback_reports', 'Permission holder can handle feedback reports.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(3, 'Manage datalists', 'manage_datalists', 'Permission holder can manage datalists.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(4, 'Manage system tools', 'manage_systools', 'Permission holder can manage system tools.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(5, 'View all logs', 'view_all_logs', 'Permission holder can view all logs.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(6, 'View all transactions', 'view_all_transactions', 'Permission holder can view all transactions.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(7, 'Manage Deposit Tokens', 'manage_deposit_tokens', 'Permission holder can create and edit deposit tokens.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(8, 'Handle Withdrawals', 'handle_withdrawals', 'Permission holder can handle withdrawals.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(9, 'Manage Registration Tokens', 'manage_reg_tokens', 'Permission holder can create and edit registration tokens.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(10, 'Handle flagged users', 'handle_flagged_users', 'Permission holder can handle flagged Users.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(11, 'Handle customer service chats', 'handle_customer_service_chats', 'Permission holder can handle customer service chats.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(12, 'Manage update posts', 'manage_update_posts', 'Permission holder can handle posting and editing update posts.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(13, 'Handle flagged business elems', 'handle_flagged_business_elems', 'Permission holder can handle flagged business elems (Offers, Trades, etc).', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL);

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
(1, '__user_groups', 'system_administrators', 'update_sysconfig_params', 'active', 'system', '2022-10-10 13:20:49', NULL),
(2, '__user_groups', 'system_administrators', 'handle_feedback_reports', 'active', 'system', '2022-10-10 13:20:49', NULL),
(3, '__user_groups', 'system_administrators', 'manage_systools', 'active', 'system', '2022-10-10 13:20:49', NULL),
(4, '__user_groups', 'system_administrators', 'manage_datalists', 'active', 'system', '2022-10-10 13:20:49', NULL),
(5, '__user_groups', 'system_administrators', 'view_all_logs', 'active', 'system', '2022-10-10 13:20:49', NULL),
(6, '__user_groups', 'business_administrators', 'view_all_transactions', 'active', 'system', '2022-10-10 13:20:49', NULL),
(7, '__user_groups', 'business_administrators', 'manage_deposit_tokens', 'active', 'system', '2022-10-10 13:20:49', NULL),
(8, '__user_groups', 'business_administrators', 'handle_withdrawals', 'active', 'system', '2022-10-10 13:20:49', NULL),
(9, '__user_groups', 'user_administrators', 'manage_reg_tokens', 'active', 'system', '2022-10-10 13:20:49', NULL),
(10, '__user_groups', 'user_administrators', 'handle_flagged_users', 'active', 'system', '2022-10-10 13:20:49', NULL),
(11, '__user_groups', 'moderators', 'handle_customer_service_chats', 'active', 'system', '2022-10-10 13:20:49', NULL),
(12, '__user_groups', 'moderators', 'handle_flagged_business_elems', 'active', 'system', '2022-10-10 13:20:49', NULL),
(13, '__user_groups', 'moderators', 'manage_update_posts', 'active', 'system', '2022-10-10 13:20:49', NULL);

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
(1, '__users', 'system', 'Backend rest api enabled', 'backend_rest_api_enabled', '1', 'boolean', 'system', '2022-10-10 13:20:49', NULL),
(2, '__users', 'system', 'Scaffolding app enabled', 'scaffolding_app_enabled', '1', 'boolean', 'system', '2022-10-10 13:20:49', NULL),
(3, '__users', 'system', 'Fallback Display Language', 'fallback_pref_lang', 'en', 'enum:langs', 'system', '2022-10-10 13:20:49', NULL),
(4, '__users', 'system', 'Fallback Display Theme', 'fallback_pref_theme', 'light', 'enum:themes', 'system', '2022-10-10 13:20:49', NULL),
(5, '__users', 'system', 'Image storage driver', 'image_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-10-10 13:20:49', NULL),
(6, '__users', 'system', 'Document storage driver', 'document_storage_driver', 'lavarel_file_storage', 'enum:file_storage_drivers', 'system', '2022-10-10 13:20:49', NULL),
(7, '__users', 'system', 'Open Registration enabled', 'open_reg_enabled', '0', 'boolean', 'system', '2022-10-10 13:20:49', NULL),
(8, '__users', 'system', 'Token registration enabled', 'token_reg_enabled', '0', 'boolean', 'system', '2022-10-10 13:20:49', NULL),
(9, '__users', 'system', 'Registration token max use count', 'reg_token_max_use_count', '10', 'integer', 'system', '2022-10-10 13:20:49', NULL),
(10, '__users', 'system', 'Offers to sell enabled', 'offer_to_sell_enabled', '0', 'boolean', 'system', '2022-10-10 13:20:49', NULL),
(11, '__users', 'system', 'Offers to buy enabled', 'offer_to_buy_enabled', '1', 'boolean', 'system', '2022-10-10 13:20:49', NULL),
(12, '__users', 'system', 'Min timeout (minutes) for buyer to open trade', 'buyer_open_trade_min_mins_tmt', '10', 'integer', 'system', '2022-10-10 13:20:49', NULL),
(13, '__users', 'system', 'Max timeout (minutes) for buyer to complete trade (auto flags)', 'buyer_cmplt_trade_max_mins_tmt', '240', 'integer', 'system', '2022-10-10 13:20:49', NULL),
(14, '__users', 'system', 'Use tatum crypto asset engine API', 'use_ttm_api', '1', 'boolean', 'system', '2022-10-10 13:20:49', NULL),
(15, '__users', 'system', 'Platform fee factor on trade transactions', 'trade_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-10 13:20:49', NULL),
(16, '__users', 'system', 'Platform fee factor on direct onchain transfers', 'withdrawal_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-10 13:20:49', NULL),
(17, '__users', 'system', 'Platform fee factor on direct offchain transfers', 'pymt_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-10 13:20:49', NULL),
(18, '__users', 'system', 'Platform fee factor on ankelli pay payments', 'pay_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-10 13:20:49', NULL),
(19, '__users', 'system', 'Platform fee factor on crypto conversions', 'crypto_conv_txn_fee_fctr', '0.01', 'float', 'system', '2022-10-10 13:20:49', NULL);

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
(1, 'Cash in person', 'cash_in_person', '5e5d4b', '[\"phone_no\"]', NULL, 'active', 'system', '2022-10-10 13:20:50', NULL, NULL),
(2, 'Stanbic bank', 'stanbic_bank', '066ef3', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-10-10 13:20:50', NULL, NULL),
(3, 'FNB bank', 'fnb_bank', '009eaa', '[\"account_holder_name\",\"account_no\"]', '[\"ZAR\"]', 'active', 'system', '2022-10-10 13:20:50', NULL, NULL),
(4, 'Mukuru', 'mukuru', 'e77924', '[\"fullname\",\"phone_no\"]', '[\"USD\"]', 'active', 'system', '2022-10-10 13:20:50', NULL, NULL),
(5, 'Algérie Poste', 'algerie_poste', '01009a', '[\"account_holder_name\",\"account_holder_address\",\"account_no\",\"account_key\"]', '[\"DZD\"]', 'active', 'system', '2022-10-10 13:20:50', NULL, NULL),
(6, 'MTN Mobile Money', 'mtn_momo', 'feca05', '[\"fullname\",\"phone_no\"]', NULL, 'active', 'system', '2022-10-10 13:20:50', NULL, NULL),
(7, 'Ecocash', 'ecocash', '005ba4', '[\"fullname\",\"phone_no\"]', '[\"ZWL\"]', 'active', 'system', '2022-10-10 13:20:50', NULL, NULL),
(8, 'Paypal', 'paypal', '27346a', '[\"fullname\",\"email_address\"]', '[\"USD\",\"EUR\",\"GBP\"]', 'active', 'system', '2022-10-10 13:20:50', NULL, NULL),
(9, 'Skrill', 'skrill', '862165', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-10-10 13:20:50', NULL, NULL),
(10, 'World Remit', 'world_remit', '604684', '[\"fullname\",\"email_address\"]', NULL, 'active', 'system', '2022-10-10 13:20:50', NULL, NULL),
(11, 'Mastercard', 'mastercard', 'cc0001', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-10-10 13:20:50', NULL, NULL),
(12, 'Visa', 'visa', '0055a5', '[\"account_holder_name\",\"account_no\"]', NULL, 'active', 'system', '2022-10-10 13:20:50', NULL, NULL),
(13, 'FBC Bank', 'fbc_bank', '0055a5', '[\"account_holder_name\",\"account_no\"]', '[\"USD\",\"ZWL\"]', 'active', 'system', '2022-10-10 13:20:50', NULL, NULL);

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
('1234567890', 'usable', 'system', '2022-10-10 11:23:14');

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
(1, 'sysadmin', 'deactivated', 'system', '2022-10-10 11:21:14', '2022-10-10 11:21:14', NULL),
(2, 'busops', 'deactivated', 'system', '2022-10-10 11:21:43', '2022-10-10 11:21:43', NULL),
(3, 'busadmin', 'deactivated', 'system', '2022-10-10 11:22:05', '2022-10-10 11:22:05', NULL);

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
('FACTORY_SSN', 'system', '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'ended', '2022-10-10 13:20:49', NULL, NULL, NULL),
('TATUM_NOTIFS_SSN', 'system', '{\"name\":\"Tatum Notification Station device\",\"version\":1}', '{\"name\":\"Tatum Notification Station agent app\",\"version\":1}', 'active', '2022-10-10 13:20:49', NULL, NULL, NULL),
('TEST_SSN', NULL, '{\"name\":\"Factory device\",\"version\":1}', '{\"name\":\"Factory agent app\",\"version\":1}', 'active', '2022-10-10 13:20:49', NULL, NULL, NULL);

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
('100900E583555', 'onchain', NULL, NULL, '63a0b897-331d-47e2-8a91-c7032863d9ee', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.06209689899136951\",\"new_usable_balance_asset_value\":0.07252739899107551,\"old_total_balance_asset_value\":\"0.06209689899136951\",\"new_total_balance_asset_value\":0.07252739899107551}]', '2022-10-08 17:08:23', NULL),
('103344D67F4D0', 'offchain', NULL, NULL, '12a6937c-d173-487a-9db1-eaa7ffa3448d', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 1137866E2C98F', NULL, 'busops', 'Platform charge fee for transaction 1137866E2C98F', NULL, 'ETH', '0.00076', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1235668989898995\",\"new_usable_balance_asset_value\":0.1228068989898995,\"old_total_balance_asset_value\":\"0.1235668989898995\",\"new_total_balance_asset_value\":0.1228068989898995},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.58710505050505\",\"new_usable_balance_asset_value\":1.58786505050505,\"old_total_balance_asset_value\":\"1.58710505050505\",\"new_total_balance_asset_value\":1.58786505050505}]', '2022-10-08 17:18:44', NULL),
('104261950C69B', 'offchain', NULL, NULL, '3272759e-8f68-4517-b49b-02f3862c0e70', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound asset release for trade 181964B45B4FD', NULL, 'guddaz', 'Inbound asset release for trade 181964B45B4FD', NULL, 'ETH', '0.05050505050505', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.197\",\"new_usable_balance_asset_value\":0.14649494949495,\"old_total_balance_asset_value\":\"0.197\",\"new_total_balance_asset_value\":0.14649494949495},{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"1.0855\",\"new_usable_balance_asset_value\":1.13600505050505,\"old_total_balance_asset_value\":\"1.0855\",\"new_total_balance_asset_value\":1.13600505050505}]', '2022-10-05 14:07:13', NULL),
('109954492AF02', 'onchain', '0x1f32121d65b6564d8c0bf7b3db0707fbe9898486160f6096ca0c366bf8daae0e', NULL, '58ccea92-1eaf-412d-84cc-3334c8e0f38c', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 'ETH', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"0.7855\",\"new_usable_balance_asset_value\":0.8355,\"old_total_balance_asset_value\":\"0.7855\",\"new_total_balance_asset_value\":0.8355}]', '2022-09-22 17:22:12', NULL),
('11033823C3BA7', 'offchain', NULL, NULL, '916d3ee4-faee-4db0-b703-8f4341622305', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Reconciled payment', NULL, 'paywyze', 'Reconciled payment', NULL, 'ETH', '0.25', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.55\",\"new_usable_balance_asset_value\":0.3,\"old_total_balance_asset_value\":\"0.55\",\"new_total_balance_asset_value\":0.3},{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":\"0.15\",\"new_usable_balance_asset_value\":0.4,\"old_total_balance_asset_value\":\"0.15\",\"new_total_balance_asset_value\":0.4}]', '2022-10-04 09:14:35', NULL),
('11264715A92B8', 'onchain', NULL, NULL, '7369fad5-05e1-4d81-b124-c902016fc7e8', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.0829578989907815\",\"new_usable_balance_asset_value\":0.0933883989904875,\"old_total_balance_asset_value\":\"0.0829578989907815\",\"new_total_balance_asset_value\":0.0933883989904875}]', '2022-10-08 17:08:25', NULL),
('11415158FF078', 'onchain', NULL, NULL, '7de7f765-9496-49c0-bf3d-6ea530744fa7', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.01626', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1186298989898995\",\"new_usable_balance_asset_value\":0.1348898989898995,\"old_total_balance_asset_value\":\"0.1186298989898995\",\"new_total_balance_asset_value\":0.1348898989898995}]', '2022-10-08 16:11:09', NULL),
('115045D3A746E', 'offchain', NULL, NULL, 'c363c123-5f67-4228-a0d8-c9ee029c9615', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Reconciled payment', NULL, 'busops', 'Reconciled payment', NULL, 'ETH', '0.0025', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.3\",\"new_usable_balance_asset_value\":0.2975,\"old_total_balance_asset_value\":\"0.3\",\"new_total_balance_asset_value\":0.2975},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.4825\",\"new_usable_balance_asset_value\":1.485,\"old_total_balance_asset_value\":\"1.4825\",\"new_total_balance_asset_value\":1.485}]', '2022-10-04 09:14:40', NULL),
('119284D932DC3', 'onchain', '0x3814d1d3c488aae7ec6f3e0d38e44273df12375770fbd45af1fdfadf117cb454', NULL, '600816e0-d753-4c13-a5ed-6411549150ee', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"0.135\",\"new_usable_balance_asset_value\":0.185,\"old_total_balance_asset_value\":\"0.135\",\"new_total_balance_asset_value\":0.185}]', '2022-09-22 16:32:43', NULL),
('121668B18693E', 'onchain', '0x443bcefcd7d4e3c818217686f8e6a7e8fa4a90a2cb88e52f76aa8abf365b0149', NULL, '144a6741-b3d2-46ce-891d-e1e2dd4382b2', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x9210f311eae66d5ebed753842e6ba9ae03dd3637', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.4325\",\"new_usable_balance_asset_value\":1.4825,\"old_total_balance_asset_value\":\"1.4325\",\"new_total_balance_asset_value\":1.4825}]', '2022-09-25 04:45:12', NULL),
('122360D3D7D1D', 'offchain', NULL, NULL, '205f9017-0601-4979-8469-63e6c943a0b0', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 154888FE1206C', NULL, 'busops', 'Platform charge fee for transaction 154888FE1206C', NULL, 'ETH', '0.001', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1196298989898995\",\"new_usable_balance_asset_value\":0.1186298989898995,\"old_total_balance_asset_value\":\"0.1196298989898995\",\"new_total_balance_asset_value\":0.1186298989898995},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.58610505050505\",\"new_usable_balance_asset_value\":1.58710505050505,\"old_total_balance_asset_value\":\"1.58610505050505\",\"new_total_balance_asset_value\":1.58710505050505}]', '2022-10-08 15:29:08', NULL),
('124724BA9009B', 'onchain', NULL, NULL, '68cd2840-5de9-4d81-b4cc-6d08a16a6850', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.01063', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1358898989898995\",\"new_usable_balance_asset_value\":0.1252598989898995,\"old_total_balance_asset_value\":\"0.1358898989898995\",\"new_total_balance_asset_value\":0.1252598989898995}]', '2022-10-08 13:43:26', NULL),
('1255749550807', 'onchain', NULL, NULL, '63a0b897-331d-47e2-8a91-c7032863d9ee', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1348898989898995\",\"new_usable_balance_asset_value\":0.1244593989901935,\"old_total_balance_asset_value\":\"0.1348898989898995\",\"new_total_balance_asset_value\":0.1244593989901935}]', '2022-10-08 16:52:04', NULL),
('1272600673E21', 'onchain', '0xafd28520c21f6b505ec126bd0ddb198837c8702dba634a655074a07c6c027545', NULL, 'b9f1fa14-6d94-47f5-afb4-63f5eb6dc749', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 'ETH', '0.7855', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"0\",\"new_usable_balance_asset_value\":0.7855,\"old_total_balance_asset_value\":\"0\",\"new_total_balance_asset_value\":0.7855}]', '2022-09-22 16:30:57', NULL),
('127646BE74FB7', 'onchain', '0x8deeae1f13c3bf1080e6b92246fbf63518455f4958c252b971ae650771755847', NULL, '9f60b02a-a83c-46be-a1d8-973c5503fa03', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 'ETH', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"0.9855000000000002\",\"new_usable_balance_asset_value\":1.0355,\"old_total_balance_asset_value\":\"0.9855000000000002\",\"new_total_balance_asset_value\":1.0355}]', '2022-09-23 05:14:12', NULL),
('128663DADEB1C', 'onchain', NULL, NULL, 'f7d26835-32c3-49ad-9ba4-a854658f60c2', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.011323', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1348898989898995\",\"new_usable_balance_asset_value\":0.1235668989898995,\"old_total_balance_asset_value\":\"0.1348898989898995\",\"new_total_balance_asset_value\":0.1235668989898995}]', '2022-10-08 17:18:40', NULL),
('1291741E8515E', 'offchain', NULL, NULL, 'c3419bc0-78f3-4f87-895c-fa4260692a8b', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 159322B16E604', NULL, 'busops', 'Platform charge fee for transaction 159322B16E604', NULL, 'ETH', '0.00076', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1092248989940155\",\"new_usable_balance_asset_value\":0.1084648989940155,\"old_total_balance_asset_value\":\"0.1092248989940155\",\"new_total_balance_asset_value\":0.1084648989940155},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.59014505050505\",\"new_usable_balance_asset_value\":1.59090505050505,\"old_total_balance_asset_value\":\"1.59014505050505\",\"new_total_balance_asset_value\":1.59090505050505}]', '2022-10-09 07:38:34', NULL),
('1310818106304', 'onchain', NULL, NULL, '1f50ffa6-401b-4113-a13c-206abea8dbdc', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1038188989901935\",\"new_usable_balance_asset_value\":0.1142493989898995,\"old_total_balance_asset_value\":\"0.1038188989901935\",\"new_total_balance_asset_value\":0.1142493989898995}]', '2022-10-08 17:08:27', NULL),
('1338325E58AD5', 'onchain', '0x3074702685d0b8c9342ab7b498292ac475e9a21fab7b74c043d5bfec5eb510de', NULL, 'b0b5aed0-3019-4d6d-8b37-1f6e3cef7ac2', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1341298989898995\",\"new_usable_balance_asset_value\":0.1236993989901935,\"old_total_balance_asset_value\":\"0.1341298989898995\",\"new_total_balance_asset_value\":0.1236993989901935}]', '2022-10-08 17:23:31', NULL),
('134255AE233EB', 'onchain', '0x01dc63a1138eb09bb62ff0f5728b437b7b5da39ec842f86baa86b3f7153ca2d9', NULL, 'a41e6250-0499-44a3-95be-b3f45b2742e9', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x9210f311eae66d5ebed753842e6ba9ae03dd3637', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.3825\",\"new_usable_balance_asset_value\":1.4325,\"old_total_balance_asset_value\":\"1.3825\",\"new_total_balance_asset_value\":1.4325}]', '2022-09-24 07:18:27', NULL),
('13556949159DD', 'offchain', NULL, NULL, '2ef329bd-af1b-4e1f-bfa9-7354ff8f5213', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 186678F719852', NULL, 'busops', 'Platform charge fee for transaction 186678F719852', NULL, 'ETH', '0.0001', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1359898989898995\",\"new_usable_balance_asset_value\":0.1358898989898995,\"old_total_balance_asset_value\":\"0.1359898989898995\",\"new_total_balance_asset_value\":0.1358898989898995},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.58600505050505\",\"new_usable_balance_asset_value\":1.58610505050505,\"old_total_balance_asset_value\":\"1.58600505050505\",\"new_total_balance_asset_value\":1.58610505050505}]', '2022-10-08 13:04:51', NULL),
('13651438863C2', 'offchain', NULL, NULL, '01c34a77-a1a6-4f2b-9f2c-d924e84ce476', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 140870C02D892', NULL, 'busops', 'Platform charge fee for transaction 140870C02D892', NULL, 'ETH', '0.00076', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1236993989901935\",\"new_usable_balance_asset_value\":0.1229393989901935,\"old_total_balance_asset_value\":\"0.1236993989901935\",\"new_total_balance_asset_value\":0.1229393989901935},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.58786505050505\",\"new_usable_balance_asset_value\":1.58862505050505,\"old_total_balance_asset_value\":\"1.58786505050505\",\"new_total_balance_asset_value\":1.58862505050505}]', '2022-10-08 17:23:34', NULL),
('1365491EF7C2F', 'offchain', NULL, NULL, '83c91649-3d41-4110-8ebd-9c6ffd9da299', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound asset release for trade 198388B36A31C', NULL, 'guddaz', 'Inbound asset release for trade 198388B36A31C', NULL, 'ETH', '0.05', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.2475\",\"new_usable_balance_asset_value\":0.1975,\"old_total_balance_asset_value\":\"0.2475\",\"new_total_balance_asset_value\":0.1975},{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"1.0355\",\"new_usable_balance_asset_value\":1.0855,\"old_total_balance_asset_value\":\"1.0355\",\"new_total_balance_asset_value\":1.0855}]', '2022-10-04 17:13:35', NULL),
('1366477009792', 'offchain', NULL, NULL, '806e98b8-6a4d-4a61-82ac-7d2dc09a54c6', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 1791281F36FB8', NULL, 'busops', 'Platform charge fee for transaction 1791281F36FB8', NULL, 'ETH', '0.00076', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1087603989978585\",\"new_usable_balance_asset_value\":0.1080003989978585,\"old_total_balance_asset_value\":\"0.1087603989978585\",\"new_total_balance_asset_value\":0.1080003989978585},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.58862505050505\",\"new_usable_balance_asset_value\":1.58938505050505,\"old_total_balance_asset_value\":\"1.58862505050505\",\"new_total_balance_asset_value\":1.58938505050505}]', '2022-10-09 06:00:22', NULL),
('137609BF97E24', 'onchain', '0x16a1d7e1a6d948dc64406ddabfef44af9b1128d9d03ae78f8a331a422e0dd423', NULL, '0035d3b9-66ae-40b5-b424-a4dbb5ffdbe8', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"0.99\",\"new_usable_balance_asset_value\":1.04,\"old_total_balance_asset_value\":\"0.99\",\"new_total_balance_asset_value\":1.04}]', '2022-09-23 05:17:27', NULL),
('1376943755217', 'offchain', NULL, NULL, '252194ba-9748-4110-9e02-ed2e3b3bc918', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 1105790DA4D87', NULL, 'busops', 'Inbound platform charge fee for transaction 1105790DA4D87', NULL, 'ETH', '0.0005', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1975\",\"new_usable_balance_asset_value\":0.197,\"old_total_balance_asset_value\":\"0.1975\",\"new_total_balance_asset_value\":0.197},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.535\",\"new_usable_balance_asset_value\":1.5355,\"old_total_balance_asset_value\":\"1.535\",\"new_total_balance_asset_value\":1.5355}]', '2022-10-04 17:13:43', NULL),
('137695D973673', 'offchain', NULL, NULL, 'bec599f3-c526-4680-b0c0-38260e0223ab', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Test sending offchain', NULL, 'busops', 'Test receiving offchain', NULL, 'ETH', '0.05', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.2975\",\"new_usable_balance_asset_value\":0.2475,\"old_total_balance_asset_value\":\"0.2975\",\"new_total_balance_asset_value\":0.2475},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.485\",\"new_usable_balance_asset_value\":1.535,\"old_total_balance_asset_value\":\"1.485\",\"new_total_balance_asset_value\":1.535}]', '2022-10-04 15:24:31', NULL),
('14263508C42DA', 'offchain', NULL, NULL, '9911a5d2-560b-4fb4-b8da-d920506a3fca', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 10515514D1ED7', NULL, 'busops', 'Platform charge fee for transaction 10515514D1ED7', NULL, 'ETH', '0.00076', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1099848989940155\",\"new_usable_balance_asset_value\":0.1092248989940155,\"old_total_balance_asset_value\":\"0.1099848989940155\",\"new_total_balance_asset_value\":0.1092248989940155},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.58938505050505\",\"new_usable_balance_asset_value\":1.59014505050505,\"old_total_balance_asset_value\":\"1.58938505050505\",\"new_total_balance_asset_value\":1.59014505050505}]', '2022-10-09 06:03:52', NULL),
('1431713E9FDDF', 'onchain', NULL, NULL, 'c49d2237-8ddb-4885-a6b5-6e3da741a8e9', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.014178999992335', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1229393989901935\",\"new_usable_balance_asset_value\":0.1087603989978585,\"old_total_balance_asset_value\":\"0.1229393989901935\",\"new_total_balance_asset_value\":0.1087603989978585}]', '2022-10-09 06:00:18', NULL),
('143569386B382', 'onchain', NULL, NULL, '01d6b490-fe3d-4c10-88a8-378d1a89ab98', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.012194499996178', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1214193989901935\",\"new_usable_balance_asset_value\":0.1092248989940155,\"old_total_balance_asset_value\":\"0.1214193989901935\",\"new_total_balance_asset_value\":0.1092248989940155}]', '2022-10-09 07:38:33', NULL),
('144159CFC225F', 'onchain', '0x37565f0833d8a65355f80136429a246311d6394af2f2670ab405915f0df3eef5', NULL, 'e465fa91-d750-4377-8679-f5643b73aca8', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'paywyze', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'ETH', '0.05', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":\"0.1\",\"new_usable_balance_asset_value\":0.15,\"old_total_balance_asset_value\":\"0.1\",\"new_total_balance_asset_value\":0.15}]', '2022-09-23 08:47:42', NULL),
('1450604CC44B2', 'offchain', NULL, NULL, '8601798b-b072-4eb1-9cf4-f64f0d19ecf7', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Outbound platform charge fee for transaction 148377AB4E3EB', NULL, 'busops', 'Inbound platform charge fee for transaction 148377AB4E3EB', NULL, 'ETH', '0.0005050505050505', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.14649494949495\",\"new_usable_balance_asset_value\":0.1459898989898995,\"old_total_balance_asset_value\":\"0.14649494949495\",\"new_total_balance_asset_value\":0.1459898989898995},{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.5855\",\"new_usable_balance_asset_value\":1.58600505050505,\"old_total_balance_asset_value\":\"1.5855\",\"new_total_balance_asset_value\":1.58600505050505}]', '2022-10-05 14:07:14', NULL),
('148473EAD31A9', 'onchain', '0x70de60f70bb4930f4d2711d3dbe0f87154f0405ce7a8d7e7c08dd5a634ce59b1', NULL, '9bd28cc6-9635-4abb-8dfe-618c66f991d9', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 'ETH', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"0.9355000000000001\",\"new_usable_balance_asset_value\":0.9855000000000002,\"old_total_balance_asset_value\":\"0.9355000000000001\",\"new_total_balance_asset_value\":0.9855000000000002}]', '2022-09-23 05:12:42', NULL),
('149446CBAE44C', 'onchain', '0xec4d69d07b5912932bfa0bbe087c79847b550f78ce5f3bc48858822caad6ade3', NULL, '630d71b4-bc46-4947-b4c5-7f39646f2e1f', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"0.08500000000000001\",\"new_usable_balance_asset_value\":0.135,\"old_total_balance_asset_value\":\"0.08500000000000001\",\"new_total_balance_asset_value\":0.135}]', '2022-09-22 14:44:27', NULL),
('150356EAA4D73', 'onchain', NULL, NULL, 'd0ddeda2-5399-4883-9be4-8dde748f861f', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.0933883989904875\",\"new_usable_balance_asset_value\":0.1038188989901935,\"old_total_balance_asset_value\":\"0.0933883989904875\",\"new_total_balance_asset_value\":0.1038188989901935}]', '2022-10-08 17:08:26', NULL),
('150411D87B4C4', 'onchain', NULL, NULL, 'c49d2237-8ddb-4885-a6b5-6e3da741a8e9', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.014178999992335', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1080003989978585\",\"new_usable_balance_asset_value\":0.1221793989901935,\"old_total_balance_asset_value\":\"0.1080003989978585\",\"new_total_balance_asset_value\":0.1221793989901935}]', '2022-10-09 06:02:20', NULL),
('150996325E53F', 'onchain', NULL, NULL, 'e9a65f19-49ec-4eae-bf31-7ff1b7792571', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.012194499996178', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1092248989940155\",\"new_usable_balance_asset_value\":0.1214193989901935,\"old_total_balance_asset_value\":\"0.1092248989940155\",\"new_total_balance_asset_value\":0.1214193989901935}]', '2022-10-09 06:59:10', NULL),
('15109788DFFCF', 'onchain', '0xc2f701e71bed4ebee047b3a1d9c728e6bdd4c64a4bfd83bc0fb57f9435ec85ad', NULL, '8d699d15-14dc-44b8-a1ac-f72b570ef285', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x9210f311eae66d5ebed753842e6ba9ae03dd3637', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.5355\",\"new_usable_balance_asset_value\":1.5855,\"old_total_balance_asset_value\":\"1.5355\",\"new_total_balance_asset_value\":1.5855}]', '2022-10-04 23:25:22', NULL),
('154763D340CA5', 'onchain', NULL, NULL, '5e448202-ecf8-4a52-b08d-18442800658b', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.0102835', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1246063989898995\",\"new_usable_balance_asset_value\":0.1348898989898995,\"old_total_balance_asset_value\":\"0.1246063989898995\",\"new_total_balance_asset_value\":0.1348898989898995}]', '2022-10-08 17:08:32', NULL),
('1558398DB2FE4', 'onchain', '0x653654a901061ea2c09da6bc94c3e7b0c0cb63e4ba04101e81e0f84bb1381430', NULL, '03ba56b7-2354-480b-9611-3412f1d282f6', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'john_doe', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x6483545db0f4aeb80d52d67bd5a9ae73f57a14aa', 'ETH', '0.05', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.5\",\"new_usable_balance_asset_value\":0.55,\"old_total_balance_asset_value\":\"0.5\",\"new_total_balance_asset_value\":0.55}]', '2022-09-23 05:28:12', NULL),
('156290257849E', 'onchain', NULL, NULL, 'f957fc35-a988-4fcb-b0fa-f488278bd51f', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.0102835', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1256063989898995\",\"new_usable_balance_asset_value\":0.1358898989898995,\"old_total_balance_asset_value\":\"0.1256063989898995\",\"new_total_balance_asset_value\":0.1358898989898995}]', '2022-10-08 13:33:20', NULL),
('1565956497C3B', 'onchain', NULL, NULL, '1f50ffa6-401b-4113-a13c-206abea8dbdc', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.09316789899107551\",\"new_usable_balance_asset_value\":0.08273739899136952,\"old_total_balance_asset_value\":\"0.09316789899107551\",\"new_total_balance_asset_value\":0.08273739899136952}]', '2022-10-08 16:57:34', NULL),
('159994D5B5191', 'onchain', NULL, NULL, 'aee57543-8bbc-4ad6-b2e7-1d3c24cc77c7', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.0102835', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1348898989898995\",\"new_usable_balance_asset_value\":0.1246063989898995,\"old_total_balance_asset_value\":\"0.1348898989898995\",\"new_total_balance_asset_value\":0.1246063989898995}]', '2022-10-08 16:11:27', NULL),
('1608236D6E568', 'onchain', '0x0d517112324571b63b159117c4eec22f61299254e3c4b2816b28a74fd18b85a7', NULL, '3a17f454-92a3-4dae-b445-13607f51bda7', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.805', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"0.185\",\"new_usable_balance_asset_value\":0.99,\"old_total_balance_asset_value\":\"0.185\",\"new_total_balance_asset_value\":0.99}]', '2022-09-22 19:35:42', NULL),
('1626790C9F922', 'onchain', NULL, NULL, '571b13ab-82cc-48fa-8370-b2104a2dcdb6', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.010357', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.08273739899136952\",\"new_usable_balance_asset_value\":0.07238039899136951,\"old_total_balance_asset_value\":\"0.08273739899136952\",\"new_total_balance_asset_value\":0.07238039899136951}]', '2022-10-08 17:00:15', NULL),
('162842C77CBD5', 'onchain', NULL, NULL, '571b13ab-82cc-48fa-8370-b2104a2dcdb6', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.010357', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1142493989898995\",\"new_usable_balance_asset_value\":0.1246063989898995,\"old_total_balance_asset_value\":\"0.1142493989898995\",\"new_total_balance_asset_value\":0.1246063989898995}]', '2022-10-08 17:08:30', NULL),
('162902D68B9EA', 'onchain', NULL, NULL, 'e9a65f19-49ec-4eae-bf31-7ff1b7792571', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.012194499996178', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1221793989901935\",\"new_usable_balance_asset_value\":0.1099848989940155,\"old_total_balance_asset_value\":\"0.1221793989901935\",\"new_total_balance_asset_value\":0.1099848989940155}]', '2022-10-09 06:03:48', NULL),
('17025511DDEC8', 'onchain', '0xb394cca0ae08d34f068563799b8b6f82b88d5d42a9a80061a67f75982b2cfc5d', NULL, '61f71d83-b816-4a86-ab9b-82bd4efafc99', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.05', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.3325\",\"new_usable_balance_asset_value\":1.3825,\"old_total_balance_asset_value\":\"1.3325\",\"new_total_balance_asset_value\":1.3825}]', '2022-09-24 07:04:12', NULL),
('170312A48FA60', 'onchain', NULL, NULL, 'f7d26835-32c3-49ad-9ba4-a854658f60c2', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.011323', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1228068989898995\",\"new_usable_balance_asset_value\":0.1341298989898995,\"old_total_balance_asset_value\":\"0.1228068989898995\",\"new_total_balance_asset_value\":0.1341298989898995}]', '2022-10-08 17:23:11', NULL),
('173621911DEE9', 'onchain', '0xac43f07a966f85c2f148105da58218522ea3577d6bfb192c29904607bb960e79', NULL, 'd75a2c60-096b-457d-809e-004a2eb8a362', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.0625', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.04\",\"new_usable_balance_asset_value\":1.1025,\"old_total_balance_asset_value\":\"1.04\",\"new_total_balance_asset_value\":1.1025}]', '2022-09-23 05:43:42', NULL),
('1743790B86E13', 'onchain', '0x57128993c347bcdbf13c3dda8ccf82cf8f8baa5622b4ec39a68878dd9cdcf9e4', NULL, '98c76796-a6e4-4724-909e-08df1d407e91', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.23', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"1.1025\",\"new_usable_balance_asset_value\":1.3325,\"old_total_balance_asset_value\":\"1.1025\",\"new_total_balance_asset_value\":1.3325}]', '2022-09-24 04:58:57', NULL),
('1751791907EC9', 'onchain', NULL, NULL, '68cd2840-5de9-4d81-b4cc-6d08a16a6850', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.01063', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1252598989898995\",\"new_usable_balance_asset_value\":0.1358898989898995,\"old_total_balance_asset_value\":\"0.1252598989898995\",\"new_total_balance_asset_value\":0.1358898989898995}]', '2022-10-08 15:26:53', NULL),
('176634F724E7A', 'onchain', '0xc997855772123270b396ac8b9cc4143f60a9a57aa93b40fc962210e1c11dbc8b', NULL, 'bb6492ad-49f1-4226-ae2b-c4056e6066d6', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'paywyze', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'ETH', '0.05', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":\"0.05\",\"new_usable_balance_asset_value\":0.1,\"old_total_balance_asset_value\":\"0.05\",\"new_total_balance_asset_value\":0.1}]', '2022-09-23 04:17:42', NULL),
('178862512C3BB', 'onchain', NULL, NULL, '7369fad5-05e1-4d81-b124-c902016fc7e8', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1244593989901935\",\"new_usable_balance_asset_value\":0.1140288989904875,\"old_total_balance_asset_value\":\"0.1244593989901935\",\"new_total_balance_asset_value\":0.1140288989904875}]', '2022-10-08 16:53:19', NULL),
('179682D13789D', 'onchain', NULL, NULL, 'd0ddeda2-5399-4883-9be4-8dde748f861f', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1035983989907815\",\"new_usable_balance_asset_value\":0.09316789899107551,\"old_total_balance_asset_value\":\"0.1035983989907815\",\"new_total_balance_asset_value\":0.09316789899107551}]', '2022-10-08 16:57:04', NULL),
('1804754914B35', 'onchain', '0x7314a046630710fda5032d86af2b98d3dd5f21fa3c2b81839120417b2f31f468', NULL, '86840ae6-58da-47b5-84da-ef8517f2d1e6', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x5b055fadddbd185e34b4eda54dc9d31de30e2625', 'ETH', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"0.8855000000000001\",\"new_usable_balance_asset_value\":0.9355000000000001,\"old_total_balance_asset_value\":\"0.8855000000000001\",\"new_total_balance_asset_value\":0.9355000000000001}]', '2022-09-23 01:19:12', NULL),
('18313704857A4', 'onchain', NULL, NULL, 'd70ae82e-c26a-4ca3-be81-3f30245ff125', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1140288989904875\",\"new_usable_balance_asset_value\":0.1035983989907815,\"old_total_balance_asset_value\":\"0.1140288989904875\",\"new_total_balance_asset_value\":0.1035983989907815}]', '2022-10-08 16:55:47', NULL),
('18494585563CF', 'onchain', '0x8c2e8bbf031aa14db91d2b2485c4960b544184a48fc018ea81c5dcceaa26be44', NULL, '97699c1c-a3b2-434b-b9eb-e2fd29fc5e8d', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'paywyze', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'ETH', '0.05', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":\"0\",\"new_usable_balance_asset_value\":0.05,\"old_total_balance_asset_value\":\"0\",\"new_total_balance_asset_value\":0.05}]', '2022-09-23 01:24:12', NULL),
('18626518C695E', 'onchain', NULL, NULL, 'aee57543-8bbc-4ad6-b2e7-1d3c24cc77c7', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.0102835', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1246063989898995\",\"new_usable_balance_asset_value\":0.1348898989898995,\"old_total_balance_asset_value\":\"0.1246063989898995\",\"new_total_balance_asset_value\":0.1348898989898995}]', '2022-10-08 16:47:22', NULL),
('18715658B61E8', 'offchain', NULL, NULL, 'dd01fe23-14a3-4c6a-807c-3b9c2290039e', 'TEST_SSN', 'PAYMENT_RECONCILIATION', 'john_doe', 'Test send via email', NULL, 'guddaz', 'Test send via email', NULL, 'ETH', '0.01', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1459898989898995\",\"new_usable_balance_asset_value\":0.1359898989898995,\"old_total_balance_asset_value\":\"0.1459898989898995\",\"new_total_balance_asset_value\":0.1359898989898995},{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"1.13600505050505\",\"new_usable_balance_asset_value\":1.14600505050505,\"old_total_balance_asset_value\":\"1.13600505050505\",\"new_total_balance_asset_value\":1.14600505050505}]', '2022-10-08 13:04:45', NULL),
('18735255D9092', 'onchain', '0xb62d8880a8f5cd9e2e10f8a60d73ca4f5568758506b67939f9a989a62f3cbcba', NULL, '5af4daab-2298-418a-b7a9-8d2341046c26', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'busops', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x3ba5d6a27a8d6a3002f76799c89e33bd379b536a', 'ETH', '0.08500000000000001', '[{\"user_username\":\"busops\",\"old_usable_balance_asset_value\":\"0\",\"new_usable_balance_asset_value\":0.08500000000000001,\"old_total_balance_asset_value\":\"0\",\"new_total_balance_asset_value\":0.08500000000000001}]', '2022-09-22 13:26:42', NULL),
('1908746BE4AFD', 'onchain', NULL, NULL, '01d6b490-fe3d-4c10-88a8-378d1a89ab98', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.012194499996178', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1084648989940155\",\"new_usable_balance_asset_value\":0.1206593989901935,\"old_total_balance_asset_value\":\"0.1084648989940155\",\"new_total_balance_asset_value\":0.1206593989901935}]', '2022-10-09 07:54:25', NULL),
('192434228F0AE', 'onchain', NULL, NULL, 'd70ae82e-c26a-4ca3-be81-3f30245ff125', 'TEST_SSN', 'WITHDRAWAL_ROLLBACK', NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'john_doe', 'Rollback for: Transfer from Ankelli wallet to CoinGecko', NULL, 'ETH', '0.010430499999706', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.07252739899107551\",\"new_usable_balance_asset_value\":0.0829578989907815,\"old_total_balance_asset_value\":\"0.07252739899107551\",\"new_total_balance_asset_value\":0.0829578989907815}]', '2022-10-08 17:08:25', NULL),
('19695092F998E', 'onchain', '0x1b65e0f3e35a061e00874b7cdc5a37cf57972a51c07e55be0b469c493d382fef', NULL, 'a1cabdba-fd9b-4fee-a3c8-2c9ea2b2f1ef', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'paywyze', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x06d64d1d5eb807e10eb59f38a448830d9888d7da', 'ETH', '0.05', '[{\"user_username\":\"paywyze\",\"old_usable_balance_asset_value\":\"0.4\",\"new_usable_balance_asset_value\":0.45,\"old_total_balance_asset_value\":\"0.4\",\"new_total_balance_asset_value\":0.45}]', '2022-10-05 07:10:13', NULL),
('197128C819989', 'onchain', '0x1dc621ba6a1a797ba3bcc82d6487fa9611d68057105d3938276f80b620e19fc1', NULL, '55b36f0b-f4c1-49b5-8d31-1a2bc81e006b', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'john_doe', 'Transfer from CoinGecko wallet to Ankelli wallet', '0x6483545db0f4aeb80d52d67bd5a9ae73f57a14aa', 'ETH', '0.5', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0\",\"new_usable_balance_asset_value\":0.5,\"old_total_balance_asset_value\":\"0\",\"new_total_balance_asset_value\":0.5}]', '2022-09-22 07:37:41', NULL),
('197855027B86D', 'onchain', NULL, NULL, 'f957fc35-a988-4fcb-b0fa-f488278bd51f', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.0102835', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1358898989898995\",\"new_usable_balance_asset_value\":0.1256063989898995,\"old_total_balance_asset_value\":\"0.1358898989898995\",\"new_total_balance_asset_value\":0.1256063989898995}]', '2022-10-08 13:18:44', NULL),
('197857C2851E2', 'onchain', '0x2884c784ce31f809476e48b28c67a9695d0a1303ca085b61517a0ac71fdffe44', NULL, '1297c197-0a96-4cad-9302-8d50736d84a0', 'TEST_SSN', 'DEPOSIT', NULL, NULL, NULL, 'guddaz', 'Transfer from CoinGecko wallet to Ankelli wallet', '0xd5763fb9000af5e36e4ae85d578d1531721dab20', 'ETH', '0.05', '[{\"user_username\":\"guddaz\",\"old_usable_balance_asset_value\":\"0.8355\",\"new_usable_balance_asset_value\":0.8855000000000001,\"old_total_balance_asset_value\":\"0.8355\",\"new_total_balance_asset_value\":0.8855000000000001}]', '2022-09-23 01:07:42', NULL),
('198178DD17F0F', 'onchain', NULL, NULL, '5e448202-ecf8-4a52-b08d-18442800658b', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.0102835', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.07238039899136951\",\"new_usable_balance_asset_value\":0.06209689899136951,\"old_total_balance_asset_value\":\"0.07238039899136951\",\"new_total_balance_asset_value\":0.06209689899136951}]', '2022-10-08 17:02:33', NULL),
('1988623783BFC', 'onchain', NULL, NULL, '7de7f765-9496-49c0-bf3d-6ea530744fa7', 'TEST_SSN', 'WITHDRAWAL', 'john_doe', 'Transfer from Ankelli wallet to CoinGecko', NULL, NULL, NULL, '0xb2a8e24a90e5b5f7f4cbd26d350b83674652d65e', 'ETH', '0.01626', '[{\"user_username\":\"john_doe\",\"old_usable_balance_asset_value\":\"0.1358898989898995\",\"new_usable_balance_asset_value\":0.1196298989898995,\"old_total_balance_asset_value\":\"0.1358898989898995\",\"new_total_balance_asset_value\":0.1196298989898995}]', '2022-10-08 15:29:05', NULL);

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
(1, 'system', 'system', '', NULL, NULL, NULL, 'active', '2022-10-10 13:20:48', NULL, NULL),
(2, 'developer', 'developer.ankelli@gmail.com', '$2y$10$bJePAkue1c3OWU0FLDrzruL7ZMLuN2EV96IZrZoYbzV7J3vo0d7a.', NULL, NULL, NULL, 'active', '2022-10-10 11:21:06', '2022-10-10 11:21:06', NULL),
(3, 'sysadmin', 'sysadmin@ankelli.com', '$2y$10$uEjTbwJTY1BfbagsmcQhZOoL3N3YXqkbkXxVuzQ9kSpdP0FMdtVyS', NULL, NULL, NULL, 'active', '2022-10-10 11:21:10', '2022-10-10 11:21:10', NULL),
(4, 'busops', 'busops@ankelli.com', '$2y$10$hXMpa6Y6wcMMuzPheYtbl.GeMyqPPcACN/UDehSsLbSIhf3E9k7am', NULL, NULL, '6321ec61d5f2885b44f1bda0', 'active', '2022-10-10 11:21:16', '2022-10-10 11:21:19', NULL),
(5, 'busadmin', 'busadmin@ankelli.com', '$2y$10$gBZsAmU0vIboGGAUFPxtZekW7LzahidYWPO2uPMWbLjUS698Gjfe2', NULL, NULL, NULL, 'active', '2022-10-10 11:21:53', '2022-10-10 11:21:53', NULL),
(6, 'guddaz', 'goodhopedhliwayo@gmail.com', '$2y$10$Krq4sb50UhuEylfqydG8geUTZkUnWoR7NgYIMOB6ry3LksNwl4fRS', NULL, NULL, '632970417b09c5d6322bc226', 'active', '2022-10-10 11:22:06', '2022-10-10 11:22:09', NULL),
(7, 'paywyze', 'paywyze@ankelli.com', '$2y$10$x5j4dtnqqNQq7Fc1ZTOwvelLBztPf4/0Zo0S.1aE8p.GvyFeJ3VA.', NULL, NULL, '63298faa64858e37282c6267', 'active', '2022-10-10 11:22:18', '2022-10-10 11:22:28', NULL),
(8, 'john_doe', 'john_doe@ankelli.com', '$2y$10$sRTzesocwGz.XMeZIVQ6luCGT5u2vwd7xntrsrmJ8juDFSciTG4D2', NULL, NULL, '63207c7291626c6cd5860a21', 'active', '2022-10-10 11:22:58', '2022-10-10 11:23:05', NULL),
(9, 'mark', 'mark@ankelli.com', '$2y$10$iFSSA6m51moMZUJxGfhaquLZ8DeBt0/Pz9pRh0CLV1HJbCIb3Sdh.', NULL, NULL, '6342fdad79aa24dc88b58633', 'active', '2022-10-10 11:23:07', '2022-10-10 11:23:10', NULL);

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
(1, 'Default Users', 'default_users', 'Group for Default User accounts created on system initialization and factory_data loading. \nNew users cannot be added to this group.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(2, 'Administrators', 'administrators', 'Automatically joined group (Users with active Admin Extension). \nMembers can be added to other admin groups.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(3, 'Developers', 'developers', 'Admin group for unrestricted system users. \nMembers have access to all features and OTP access to account named \"developer\". \nOnly \"developer\" account can add members to this group.\nGroup used for System Development and Maintenance.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(4, 'System Administrators', 'system_administrators', 'Admin Group for System Administrators. \nMembers can manage system functions and sysconfig params. \nMembers have OTP access to account named \"sysadmin\".\nOnly \"sysadmin\" account can add members to this group.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(5, 'Business Administrators', 'business_administrators', 'Admin group for Business Administrators.\nMembers have access to business related features.\nMembers have OTP access to accounts named \"busops\" and \"busadmin\".\nOnly \"busadmin\" account can add members to this group.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(6, 'User Administrators', 'user_administrators', 'Admin group for User Administrators. \nMembers can manage other users and user related queries.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(7, 'Platform moderators', 'moderators', 'Group for Platform moderators. \nMembers can respond in the customer service chat module, handle flagged business elements, manage daily updates.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(8, 'Sellers', 'sellers', 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(9, 'Buyers', 'buyers', 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL),
(10, 'Beta Testers', 'beta_testers', 'User Group for selected individuals to test certain features before they are published.', 'active', 'system', '2022-10-10 13:20:49', NULL, NULL);

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
(1, 'developer', 'default_users', 'active', 'system', '2022-10-10 11:21:08', '2022-10-10 11:21:08'),
(2, 'developer', 'developers', 'active', 'system', '2022-10-10 11:21:09', '2022-10-10 11:21:09'),
(3, 'sysadmin', 'default_users', 'active', 'system', '2022-10-10 11:21:11', '2022-10-10 11:21:11'),
(4, 'sysadmin', 'system_administrators', 'active', 'system', '2022-10-10 11:21:15', '2022-10-10 11:21:15'),
(5, 'busops', 'default_users', 'active', 'system', '2022-10-10 11:21:29', '2022-10-10 11:21:29'),
(6, 'busops', 'business_administrators', 'active', 'system', '2022-10-10 11:21:48', '2022-10-10 11:21:48'),
(7, 'busadmin', 'default_users', 'active', 'system', '2022-10-10 11:21:58', '2022-10-10 11:21:58'),
(8, 'busadmin', 'business_administrators', 'active', 'system', '2022-10-10 11:22:06', '2022-10-10 11:22:06'),
(9, 'guddaz', 'developers', 'active', 'system', '2022-10-10 11:22:13', '2022-10-10 11:22:13'),
(10, 'paywyze', 'system_administrators', 'active', 'system', '2022-10-10 11:22:43', '2022-10-10 11:22:43'),
(11, 'paywyze', 'user_administrators', 'active', 'system', '2022-10-10 11:22:48', '2022-10-10 11:22:48'),
(12, 'paywyze', 'business_administrators', 'active', 'system', '2022-10-10 11:22:53', '2022-10-10 11:22:53');

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
  ADD UNIQUE KEY `signature_id_unique` (`ttm_last_gp_addresses_activation_txn_signature_id`),
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=388;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `__asset_wallet_addresses`
--
ALTER TABLE `__asset_wallet_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
