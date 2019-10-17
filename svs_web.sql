-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2019 at 04:09 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `svs_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_records`
--

CREATE TABLE `activity_records` (
  `id` bigint(20) NOT NULL,
  `token_id` varchar(255) NOT NULL,
  `by_user_id` int(10) NOT NULL,
  `for_company_id` varchar(191) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `date_time_records`
--

CREATE TABLE `date_time_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(8) DEFAULT NULL,
  `company_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACNo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apiKey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datetime` timestamp NULL DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deviceID` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(8, '2019_04_26_093122_date_time_api', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
('40d4a118355f273e0419132283bcc4a6510017f20432e1c9b2ded6081686ff978d0510382ac6fcb7', 1, 2, NULL, '[]', 0, '2019-10-01 04:43:57', '2019-10-01 04:43:57', '2019-10-02 12:43:57'),
('580d0bd18c17f241fe1d2647f1c3c12d6bb604a0061b429cf96797fec5a480e7d3211dc1dfbe66fe', 1, 2, NULL, '[]', 0, '2019-10-01 05:01:50', '2019-10-01 05:01:50', '2019-10-02 13:01:50'),
('a0d58fca342583ed930307343a285324b01c769606d87e73dd5b7be94322e99822ba2197c31517b9', 1, 2, NULL, '[]', 0, '2019-10-01 05:02:11', '2019-10-01 05:02:11', '2019-10-02 13:02:11'),
('dcb46fc5fb5947fcab3bcc0e59d87c5c8daeb9f57fb8b1afb9934b0255c92f4c9e6c0aafdc025e5e', 1, 2, NULL, '[]', 0, '2019-10-01 04:45:07', '2019-10-01 04:45:07', '2019-10-02 12:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'nFljDugSeXq4Eq2GoSL0L5xarEpOt6qVD23xGCee', 'http://localhost', 1, 0, 0, '2019-05-06 22:01:35', '2019-05-06 22:01:35'),
(2, NULL, 'Laravel Password Grant Client', 'gsPZSYc8by6zXNiq1wMcgKmlC7WxUenn1CdhtRxm', 'http://localhost', 0, 1, 0, '2019-05-06 22:01:35', '2019-05-06 22:01:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('12856754477f2b7122d64abd79be4cda27af7568424c232adc0a059f8fec79fbe6ce3d7695a27d07', 'a0d58fca342583ed930307343a285324b01c769606d87e73dd5b7be94322e99822ba2197c31517b9', 0, '2019-10-03 13:02:11'),
('b418a518662e54841d19a10ebc59777887742892c530e58fac7ed1282d9adb2ff83097655b7e0410', '580d0bd18c17f241fe1d2647f1c3c12d6bb604a0061b429cf96797fec5a480e7d3211dc1dfbe66fe', 0, '2019-10-03 13:01:50'),
('bda8ffb929cd2120c8dce090315e9144709bcb943bee8a4e309afebec0d37cad194c9aad7dc4f333', 'dcb46fc5fb5947fcab3bcc0e59d87c5c8daeb9f57fb8b1afb9934b0255c92f4c9e6c0aafdc025e5e', 0, '2019-10-03 12:45:07'),
('e9dd674679f9c6fe3ca0f82f76f5aa212d97de14e89f589343c72a5391bba5b035bd6a0bfbf0e1aa', '40d4a118355f273e0419132283bcc4a6510017f20432e1c9b2ded6081686ff978d0510382ac6fcb7', 0, '2019-10-03 12:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projectlist`
--

CREATE TABLE `tbl_projectlist` (
  `id` bigint(11) NOT NULL,
  `proj_code` varchar(191) NOT NULL,
  `proj_title` varchar(191) NOT NULL,
  `proj_desc` varchar(191) NOT NULL,
  `est_start_date` datetime NOT NULL,
  `est_end_date` datetime NOT NULL,
  `act_start_date` datetime NOT NULL,
  `act_end_date` datetime NOT NULL,
  `longitude` varchar(191) NOT NULL,
  `latitude` varchar(191) NOT NULL,
  `location` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `by_id` bigint(11) NOT NULL,
  `updated_by` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_projectlist`
--

INSERT INTO `tbl_projectlist` (`id`, `proj_code`, `proj_title`, `proj_desc`, `est_start_date`, `est_end_date`, `act_start_date`, `act_end_date`, `longitude`, `latitude`, `location`, `status`, `deleted`, `by_id`, `updated_by`, `created_at`, `updated_at`) VALUES
(5, 'XRQBINE3DI4W', 'Project 1', 'Description', '2019-10-17 09:58:00', '2019-10-17 21:58:00', '2019-10-17 09:58:00', '2019-10-17 21:58:00', '120.984222', '14.599512', 'Pasig, Metro Manila, Philippines', NULL, 0, 7, 'Keigh Dee', '2019-10-16 17:58:51', '2019-10-16 17:58:51'),
(6, 'KEDATTINIX4P', 'Project 2', 'Description', '2019-10-17 09:59:00', '2019-10-17 21:59:00', '2019-10-17 09:59:00', '2019-10-17 21:59:00', '120.984222', '14.599512', 'Quezon, Calabarzon, Philippines', NULL, 0, 7, 'Keigh Dee', '2019-10-16 17:59:28', '2019-10-16 17:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projtask`
--

CREATE TABLE `tbl_projtask` (
  `id` bigint(11) NOT NULL,
  `projCode` varchar(191) NOT NULL,
  `taskCode` varchar(191) NOT NULL,
  `deleted` int(2) NOT NULL DEFAULT 0,
  `by_id` bigint(11) NOT NULL,
  `updated_by` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_projtask`
--

INSERT INTO `tbl_projtask` (`id`, `projCode`, `taskCode`, `deleted`, `by_id`, `updated_by`, `created_at`, `updated_at`) VALUES
(17, 'XRQBINE3DI4W', 'UKAKWM9JOZQ9', 0, 7, 'Keigh Dee', '2019-10-16 17:58:51', '2019-10-16 17:58:51'),
(18, 'XRQBINE3DI4W', 'PVVATUZKHLRP', 0, 7, 'Keigh Dee', '2019-10-16 17:58:51', '2019-10-16 17:58:51'),
(19, 'XRQBINE3DI4W', 'MEDOIUQYGGE6', 0, 7, 'Keigh Dee', '2019-10-16 17:58:51', '2019-10-16 17:58:51'),
(20, 'KEDATTINIX4P', 'UKAKWM9JOZQ9', 0, 7, 'Keigh Dee', '2019-10-16 17:59:28', '2019-10-16 17:59:28'),
(21, 'KEDATTINIX4P', 'PVVATUZKHLRP', 0, 7, 'Keigh Dee', '2019-10-16 17:59:28', '2019-10-16 17:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_task`
--

CREATE TABLE `tbl_task` (
  `id` bigint(11) NOT NULL,
  `taskCode` varchar(191) NOT NULL,
  `task_title` varchar(191) NOT NULL,
  `task_desc` varchar(191) NOT NULL,
  `weight` decimal(13,2) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `by_id` bigint(11) NOT NULL,
  `updated_by` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_task`
--

INSERT INTO `tbl_task` (`id`, `taskCode`, `task_title`, `task_desc`, `weight`, `deleted`, `by_id`, `updated_by`, `created_at`, `updated_at`) VALUES
(13, 'MEDOIUQYGGE6', 'Task 1', 'Task Description', '44.40', 0, 7, 'Keigh Dee', '2019-10-16 17:57:39', '2019-10-16 17:57:39'),
(14, 'PVVATUZKHLRP', 'Task 2', 'Task Description', '6.60', 0, 7, 'Keigh Dee', '2019-10-16 17:57:47', '2019-10-16 17:57:47'),
(15, 'UKAKWM9JOZQ9', 'Task 3', 'Task Description', '20.30', 0, 7, 'Keigh Dee', '2019-10-16 17:58:00', '2019-10-16 17:58:00'),
(16, 'YWIRVWAXQS9K', 'Task 3', 'Task Description', '20.30', 1, 7, 'Keigh Dee', '2019-10-16 17:58:00', '2019-10-16 17:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiKey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACNo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` int(191) DEFAULT 0,
  `is_admin` int(2) NOT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `apiKey`, `ACNo`, `name`, `email`, `email_verified_at`, `password`, `deleted`, `is_admin`, `updated_by`, `created_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '2018-101', NULL, '101', 'Kay Diaz', 'keighdee@gmail.com', NULL, '$2y$10$MP4BPAbSSwE1gZEarp8qlu7mFZruGkiOy7J1IjH.LFe0r4m0.Cno2', 0, 0, '2018-103', '2018-101', 'W7ZPGS9mumQfhJ7ZOcmeSnL16Nu3x38J97ULnXJDADJkJuNhfcFczmjcB7kJ', '2019-05-06 02:48:49', '2019-10-08 03:03:30'),
(7, '1996-001', NULL, '001', 'Keigh Dee', 'pabs@gmail.com', NULL, '$2y$10$MP4BPAbSSwE1gZEarp8qlu7mFZruGkiOy7J1IjH.LFe0r4m0.Cno2', 0, 1, NULL, '2018-101', NULL, '2019-05-10 01:03:23', '2019-05-10 01:03:23'),
(26, '2019-6', NULL, '6', 'Paguinto, Eugene', 'paguintoeugene@test.com', NULL, '$2y$10$KJbCp/6JsPkuHsmRhxggGOvAUsRnCqEkWbuBfWamgPDjKWMa2Ab0W', 0, 0, NULL, '2018-004', NULL, '2019-06-13 21:49:56', '2019-06-13 21:49:56'),
(27, '2019-001', NULL, '01', 'Yao, Vincent', 'yaovincent@test.com', NULL, '$2y$10$snnRIF1vjlQ5ooEEH.SjfeHcTjSKbHyAJCdFxgRtOZi2yQSmF1lm6', 0, 0, NULL, '2018-004', NULL, '2019-06-13 21:50:14', '2019-06-13 21:50:14'),
(28, '2019-112', NULL, '112', 'Aquino, Emerson Mauricio', 'ae.mauricio@gmail.com', NULL, '$2y$10$MYVgybYadD1LvBBqlrOiKuI66YzORGLrgTwgQxt1lOh/ualu4MaAK', 0, 0, NULL, '2018-101', NULL, '2019-06-19 17:48:41', '2019-06-19 17:48:41'),
(29, '2019-117', NULL, '117', 'Astor, Reynaldo Calderon', 'ar.calderon@gmail.com', NULL, '$2y$10$IaiAxrg/wpK9C46QEuUj6eqXdCKz.faSszj1vmjCglaMHE7/0jKVq', 0, 0, NULL, '2018-101', NULL, '2019-06-19 17:48:49', '2019-06-19 17:48:49'),
(30, '2019-115', NULL, '115', 'Balbuena, Roberto Evardone', 'br.evardone@gmail.com', NULL, '$2y$10$mF4X.h2beUTgUhzL2CSYluvm4AtvoE7EcSugUcTJiklj1MgYadgC.', 0, 0, NULL, '2018-101', NULL, '2019-06-19 17:48:57', '2019-06-19 17:48:57'),
(31, '2019-2', NULL, '2', 'Baraquiel, Arnel Guillermo', 'ba.guillermo@gmail.com', NULL, '$2y$10$P//dhNUpOyGmzZgL0ujHx.OcO8Zvfu5pcbniF8AVVRH1IuFg.Mlaq', 0, 0, NULL, '2018-101', NULL, '2019-06-19 17:49:29', '2019-06-19 17:49:29'),
(32, '2019-8', NULL, '8', 'Catapang, Fritz John', 'fj.catapang@gmail.com', NULL, '$2y$10$k.bIoG4O5yMWda5CeQP2SepxZFytfBzf0tZYs7GA7CUUwhxhyHDBK', 0, 0, NULL, '2018-101', NULL, '2019-06-19 17:49:38', '2019-06-19 17:49:38'),
(33, '2019-110', NULL, '110', 'Gochangco, Nikko Emerson Alipio', 'nma.gochangco@gmail.com', NULL, '$2y$10$g5BzAr05fBJ9bJbBy8H/Bu6ljwPMIzNfxbSJO50KOpJO7KhG0lXe2', 0, 0, NULL, '2018-101', NULL, '2019-06-19 17:49:46', '2019-06-19 17:49:46'),
(34, '2019-100', NULL, '100', 'Guitierrez, Ruben', 'g.ruben@gmail.com', NULL, '$2y$10$I1o3FWDNEQoiaI8/HSaAieQD8ExxHZdjgNwv6qkDlXxC.Roax5HMC', 0, 0, NULL, '2018-101', NULL, '2019-06-19 17:50:21', '2019-06-19 17:50:21'),
(35, '2019-113', NULL, '113', 'Hernandez, Gabriel Lacanaria', 'hg.lacanaria@gmail.com', NULL, '$2y$10$5ZLTFhp4LkWOxc/812AW6OB68NLgntEnv.kK.h2bTSdiXGHAEhRt2', 0, 0, NULL, '2018-101', NULL, '2019-06-19 17:50:29', '2019-06-19 17:50:29'),
(36, '2019-11', NULL, '11', 'Guntang, Jerico', 'g.jericho@gmail.com', NULL, '$2y$10$xsNgu5lrS5f7sJwwVH9zEOTcFEGPh.KWi1zZyOgSv5L2uHKzSJtuq', 0, 0, NULL, '2018-101', NULL, '2019-06-19 17:57:57', '2019-06-19 17:57:57'),
(37, '2019-003', NULL, '3', 'Laqui Jr., Romeo Galleto', 'rg.laquijr@gmail.com', NULL, '$2y$10$snnRIF1vjlQ5ooEEH.SjfeHcTjSKbHyAJCdFxgRtOZi2yQSmF1lm6', 0, 0, '2018-004', '2018-101', NULL, '2019-06-19 18:06:51', '2019-06-19 18:06:51'),
(38, '2019-0180', NULL, '180', 'Tamad, Juan', 'juan.tamad@test.com', NULL, '$2y$10$8CXfWgeKBXWw7894srO/AuAifW2nyaJP2MKOxRxsSITi1uSifRSNG', 0, 0, NULL, '2018-004', NULL, '2019-08-15 18:12:58', '2019-08-15 18:12:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_records`
--
ALTER TABLE `activity_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `date_time_records`
--
ALTER TABLE `date_time_records`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

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
-- Indexes for table `tbl_projectlist`
--
ALTER TABLE `tbl_projectlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_projtask`
--
ALTER TABLE `tbl_projtask`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_task`
--
ALTER TABLE `tbl_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_records`
--
ALTER TABLE `activity_records`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `date_time_records`
--
ALTER TABLE `date_time_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_projectlist`
--
ALTER TABLE `tbl_projectlist`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_projtask`
--
ALTER TABLE `tbl_projtask`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_task`
--
ALTER TABLE `tbl_task`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
