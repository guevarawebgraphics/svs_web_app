-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2020 at 06:22 AM
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

--
-- Dumping data for table `activity_records`
--

INSERT INTO `activity_records` (`id`, `token_id`, `by_user_id`, `for_company_id`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, '328bb22f961aff0f50e97c4f860bd99cfd6898fda54c25fe0a821f2b815c97caa935b3c0116c6798', 1, '2020-1001', 'REGISTER', NULL, '2020-01-16 02:54:18', '2020-01-16 02:54:18'),
(2, '328bb22f961aff0f50e97c4f860bd99cfd6898fda54c25fe0a821f2b815c97caa935b3c0116c6798', 1, '2020-1001', 'REGISTER', NULL, '2020-01-16 02:54:59', '2020-01-16 02:54:59'),
(3, '328bb22f961aff0f50e97c4f860bd99cfd6898fda54c25fe0a821f2b815c97caa935b3c0116c6798', 1, '2020-1001', 'REGISTER', NULL, '2020-01-16 02:56:15', '2020-01-16 02:56:15'),
(4, '7ceb4da5ba0dc637fb6a126d491127666dc375592cbc59b8997fa1c44b5bbffb871c3fb52104ac86', 1, NULL, 'SHOW_DTR_LIST', NULL, '2020-01-16 03:04:10', '2020-01-16 03:04:10'),
(5, '99948b0af1b44c86b279432d26b62161a73d6381f7fb371390863ce0bf308efbf57a5263d84ac7e5', 1, '2020-1001', 'UPDATE', NULL, '2020-01-16 03:10:15', '2020-01-16 03:10:15'),
(6, 'dc410938643022a3341692dd2032cf8a5d54afbbb94566a94099db23a724a57ee777bb5c4b3bdaf6', 83, '1996-001', 'DELETE', NULL, '2020-01-22 03:26:36', '2020-01-22 03:26:36'),
(7, 'eb93091d8392bfb0f0d2b4c334457c879e54314c380692343186945a94bef9daa7fda1de2f65d476', 54, '2019-1001', 'REGISTER', NULL, '2020-02-07 05:51:17', '2020-02-07 05:51:17'),
(8, 'eb93091d8392bfb0f0d2b4c334457c879e54314c380692343186945a94bef9daa7fda1de2f65d476', 54, '2019-1001', 'REGISTER', NULL, '2020-02-07 06:00:11', '2020-02-07 06:00:11'),
(9, 'eb93091d8392bfb0f0d2b4c334457c879e54314c380692343186945a94bef9daa7fda1de2f65d476', 54, '2019-1001', 'REGISTER', NULL, '2020-02-07 06:02:16', '2020-02-07 06:02:16'),
(10, '0b95ec62969041401da4305f98f0d693e2a1b9900030f1d684b0d67cc0e8f028694424780857f46c', 54, '2019-1001', 'REGISTER', NULL, '2020-02-07 06:28:05', '2020-02-07 06:28:05'),
(11, '0b95ec62969041401da4305f98f0d693e2a1b9900030f1d684b0d67cc0e8f028694424780857f46c', 54, '2019-1001', 'REGISTER', NULL, '2020-02-07 06:29:13', '2020-02-07 06:29:13'),
(12, '0b95ec62969041401da4305f98f0d693e2a1b9900030f1d684b0d67cc0e8f028694424780857f46c', 54, '2019-1001', 'REGISTER', NULL, '2020-02-07 06:31:06', '2020-02-07 06:31:06');

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
  `datetime_app` timestamp NULL DEFAULT NULL,
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

--
-- Dumping data for table `date_time_records`
--

INSERT INTO `date_time_records` (`id`, `user_id`, `company_id`, `ACNo`, `name`, `email`, `apiKey`, `datetime`, `datetime_app`, `address`, `longitude`, `latitude`, `report`, `state`, `deviceID`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-101', '1010', 'Employee10', 'abueva@gmail.com', NULL, '2019-08-28 17:38:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 01:10:11', '2019-08-29 01:10:11'),
(2, 1, '2018-101', '1010', 'Employee10', 'abueva@gmail.com', NULL, '2019-08-29 00:50:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 01:10:16', '2019-08-29 01:10:16'),
(3, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-06-30 09:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:51:26', '2019-08-29 23:51:26'),
(4, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-06-30 16:08:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:51:29', '2019-08-29 23:51:29'),
(5, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-06-30 16:08:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:51:32', '2019-08-29 23:51:32'),
(6, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-06-30 16:28:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:51:35', '2019-08-29 23:51:35'),
(7, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-06-30 16:28:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:51:38', '2019-08-29 23:51:38'),
(8, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-06-30 16:29:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:51:41', '2019-08-29 23:51:41'),
(9, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-06-30 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:51:44', '2019-08-29 23:51:44'),
(10, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-06-30 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:51:47', '2019-08-29 23:51:47'),
(11, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-06-30 16:38:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:51:50', '2019-08-29 23:51:50'),
(12, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-06-30 18:29:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:51:53', '2019-08-29 23:51:53'),
(13, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-06-30 18:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:51:56', '2019-08-29 23:51:56'),
(14, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-06-30 18:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:51:59', '2019-08-29 23:51:59'),
(15, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-06-30 18:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:02', '2019-08-29 23:52:02'),
(16, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-01 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:05', '2019-08-29 23:52:05'),
(17, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-01 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:08', '2019-08-29 23:52:08'),
(18, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-01 02:31:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:11', '2019-08-29 23:52:11'),
(19, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-01 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:14', '2019-08-29 23:52:14'),
(20, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-01 02:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:17', '2019-08-29 23:52:17'),
(21, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-01 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:21', '2019-08-29 23:52:21'),
(22, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-01 03:08:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:24', '2019-08-29 23:52:24'),
(23, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-01 03:08:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:26', '2019-08-29 23:52:26'),
(24, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-01 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:29', '2019-08-29 23:52:29'),
(25, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-01 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:32', '2019-08-29 23:52:32'),
(26, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-01 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:35', '2019-08-29 23:52:35'),
(27, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-01 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:38', '2019-08-29 23:52:38'),
(28, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-01 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:41', '2019-08-29 23:52:41'),
(29, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-01 15:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:44', '2019-08-29 23:52:44'),
(30, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-01 15:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:47', '2019-08-29 23:52:47'),
(31, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-01 15:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:50', '2019-08-29 23:52:50'),
(32, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-01 15:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:53', '2019-08-29 23:52:53'),
(33, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-01 15:12:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:56', '2019-08-29 23:52:56'),
(34, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-01 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:52:59', '2019-08-29 23:52:59'),
(35, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-01 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:02', '2019-08-29 23:53:02'),
(36, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-01 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:05', '2019-08-29 23:53:05'),
(37, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-01 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:08', '2019-08-29 23:53:08'),
(38, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-01 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:11', '2019-08-29 23:53:11'),
(39, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-01 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:14', '2019-08-29 23:53:14'),
(40, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-01 16:21:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:17', '2019-08-29 23:53:17'),
(41, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-01 16:21:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:20', '2019-08-29 23:53:20'),
(42, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-01 16:22:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:23', '2019-08-29 23:53:23'),
(43, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-01 16:51:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:26', '2019-08-29 23:53:26'),
(44, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-01 20:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:29', '2019-08-29 23:53:29'),
(45, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-02 01:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:32', '2019-08-29 23:53:32'),
(46, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-02 01:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:35', '2019-08-29 23:53:35'),
(47, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-02 01:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:39', '2019-08-29 23:53:39'),
(48, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-02 01:10:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:42', '2019-08-29 23:53:42'),
(49, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-02 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:45', '2019-08-29 23:53:45'),
(50, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-02 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:47', '2019-08-29 23:53:47'),
(51, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-02 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:50', '2019-08-29 23:53:50'),
(52, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-02 02:31:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:53', '2019-08-29 23:53:53'),
(53, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-02 02:31:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:56', '2019-08-29 23:53:56'),
(54, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-02 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:53:59', '2019-08-29 23:53:59'),
(55, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-02 02:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:03', '2019-08-29 23:54:03'),
(56, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-02 02:36:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:05', '2019-08-29 23:54:05'),
(57, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-02 03:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:08', '2019-08-29 23:54:08'),
(58, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-02 03:31:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:11', '2019-08-29 23:54:11'),
(59, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-02 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:14', '2019-08-29 23:54:14'),
(60, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-02 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:17', '2019-08-29 23:54:17'),
(61, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-02 16:28:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:20', '2019-08-29 23:54:20'),
(62, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-02 16:28:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:23', '2019-08-29 23:54:23'),
(63, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-02 16:28:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:26', '2019-08-29 23:54:26'),
(64, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-02 16:28:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:29', '2019-08-29 23:54:29'),
(65, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-02 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:32', '2019-08-29 23:54:32'),
(66, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-02 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:36', '2019-08-29 23:54:36'),
(67, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-02 16:32:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:38', '2019-08-29 23:54:38'),
(68, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-02 16:38:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:41', '2019-08-29 23:54:41'),
(69, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-02 16:38:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:44', '2019-08-29 23:54:44'),
(70, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-03 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:47', '2019-08-29 23:54:47'),
(71, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-03 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:50', '2019-08-29 23:54:50'),
(72, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-03 08:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:53', '2019-08-29 23:54:53'),
(73, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-03 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:56', '2019-08-29 23:54:56'),
(74, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-03 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:54:59', '2019-08-29 23:54:59'),
(75, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-03 02:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:03', '2019-08-29 23:55:03'),
(76, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-03 02:38:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:05', '2019-08-29 23:55:05'),
(77, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-03 02:38:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:08', '2019-08-29 23:55:08'),
(78, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-03 02:38:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:11', '2019-08-29 23:55:11'),
(79, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-03 02:38:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:14', '2019-08-29 23:55:14'),
(80, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-03 02:40:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:17', '2019-08-29 23:55:17'),
(81, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-03 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:20', '2019-08-29 23:55:20'),
(82, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-03 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:23', '2019-08-29 23:55:23'),
(83, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-03 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:26', '2019-08-29 23:55:26'),
(84, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-03 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:29', '2019-08-29 23:55:29'),
(85, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-03 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:32', '2019-08-29 23:55:32'),
(86, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-03 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:35', '2019-08-29 23:55:35'),
(87, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-03 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:38', '2019-08-29 23:55:38'),
(88, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-03 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:41', '2019-08-29 23:55:41'),
(89, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-03 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:45', '2019-08-29 23:55:45'),
(90, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-03 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:47', '2019-08-29 23:55:47'),
(91, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-03 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:50', '2019-08-29 23:55:50'),
(92, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-04 01:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:53', '2019-08-29 23:55:53'),
(93, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-04 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:55:56', '2019-08-29 23:55:56'),
(94, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-04 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:00', '2019-08-29 23:56:00'),
(95, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-04 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:02', '2019-08-29 23:56:02'),
(96, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-04 02:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:05', '2019-08-29 23:56:05'),
(97, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-04 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:08', '2019-08-29 23:56:08'),
(98, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-04 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:11', '2019-08-29 23:56:11'),
(99, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-04 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:14', '2019-08-29 23:56:14'),
(100, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-04 03:15:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:17', '2019-08-29 23:56:17'),
(101, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-04 05:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:20', '2019-08-29 23:56:20'),
(102, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-04 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:23', '2019-08-29 23:56:23'),
(103, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-04 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:26', '2019-08-29 23:56:26'),
(104, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-04 17:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:29', '2019-08-29 23:56:29'),
(105, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-04 17:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:32', '2019-08-29 23:56:32'),
(106, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-04 17:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:35', '2019-08-29 23:56:35'),
(107, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-04 17:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:38', '2019-08-29 23:56:38'),
(108, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-04 17:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:41', '2019-08-29 23:56:41'),
(109, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-04 18:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:44', '2019-08-29 23:56:44'),
(110, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-05 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:47', '2019-08-29 23:56:47'),
(111, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-05 02:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:50', '2019-08-29 23:56:50'),
(112, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-05 03:20:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:53', '2019-08-29 23:56:53'),
(113, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-05 03:21:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:56', '2019-08-29 23:56:56'),
(114, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-05 03:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:56:59', '2019-08-29 23:56:59'),
(115, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-05 03:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:02', '2019-08-29 23:57:02'),
(116, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-05 03:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:05', '2019-08-29 23:57:05'),
(117, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-05 03:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:08', '2019-08-29 23:57:08'),
(118, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-05 03:45:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:12', '2019-08-29 23:57:12'),
(119, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-05 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:15', '2019-08-29 23:57:15'),
(120, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-06 02:40:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:17', '2019-08-29 23:57:17'),
(121, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-07 16:21:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:20', '2019-08-29 23:57:20'),
(122, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-07 16:21:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:23', '2019-08-29 23:57:23'),
(123, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-07 16:21:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:26', '2019-08-29 23:57:26'),
(124, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-07 16:21:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:29', '2019-08-29 23:57:29'),
(125, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-07 16:22:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:32', '2019-08-29 23:57:32'),
(126, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-07 16:22:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:35', '2019-08-29 23:57:35'),
(127, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-07 16:22:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:38', '2019-08-29 23:57:38'),
(128, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-07 16:22:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:41', '2019-08-29 23:57:41'),
(129, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-07 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:44', '2019-08-29 23:57:44'),
(130, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-07 18:10:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:47', '2019-08-29 23:57:47'),
(131, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-07 18:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:50', '2019-08-29 23:57:50'),
(132, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-07 18:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:53', '2019-08-29 23:57:53'),
(133, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-07 18:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:56', '2019-08-29 23:57:56'),
(134, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-08 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:57:59', '2019-08-29 23:57:59'),
(135, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-08 02:31:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:02', '2019-08-29 23:58:02'),
(136, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-08 02:31:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:05', '2019-08-29 23:58:05'),
(137, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-08 02:31:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:08', '2019-08-29 23:58:08'),
(138, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-08 02:31:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:11', '2019-08-29 23:58:11'),
(139, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-08 02:31:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:14', '2019-08-29 23:58:14'),
(140, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-08 03:01:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:18', '2019-08-29 23:58:18'),
(141, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-08 03:01:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:21', '2019-08-29 23:58:21'),
(142, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-08 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:23', '2019-08-29 23:58:23'),
(143, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-08 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:26', '2019-08-29 23:58:26'),
(144, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-08 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:29', '2019-08-29 23:58:29'),
(145, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-08 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:32', '2019-08-29 23:58:32'),
(146, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-08 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:35', '2019-08-29 23:58:35'),
(147, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-08 15:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:38', '2019-08-29 23:58:38'),
(148, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-08 15:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:41', '2019-08-29 23:58:41'),
(149, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-08 15:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:44', '2019-08-29 23:58:44'),
(150, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-08 15:10:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:47', '2019-08-29 23:58:47'),
(151, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-08 15:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:50', '2019-08-29 23:58:50'),
(152, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-08 15:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:54', '2019-08-29 23:58:54'),
(153, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-08 16:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:56', '2019-08-29 23:58:56'),
(154, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-08 16:21:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:58:59', '2019-08-29 23:58:59'),
(155, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-08 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:02', '2019-08-29 23:59:02'),
(156, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-08 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:05', '2019-08-29 23:59:05'),
(157, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-08 20:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:08', '2019-08-29 23:59:08'),
(158, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-08 21:05:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:11', '2019-08-29 23:59:11'),
(159, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-09 01:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:14', '2019-08-29 23:59:14'),
(160, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-09 01:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:17', '2019-08-29 23:59:17'),
(161, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-09 01:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:20', '2019-08-29 23:59:20'),
(162, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-09 01:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:23', '2019-08-29 23:59:23'),
(163, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-09 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:26', '2019-08-29 23:59:26'),
(164, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-09 02:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:29', '2019-08-29 23:59:29'),
(165, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-09 03:01:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:32', '2019-08-29 23:59:32'),
(166, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-09 03:01:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:35', '2019-08-29 23:59:35'),
(167, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-09 16:18:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:38', '2019-08-29 23:59:38'),
(168, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-09 16:18:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:41', '2019-08-29 23:59:41'),
(169, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-09 16:18:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:44', '2019-08-29 23:59:44'),
(170, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-09 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:47', '2019-08-29 23:59:47'),
(171, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-09 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:50', '2019-08-29 23:59:50'),
(172, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-09 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:53', '2019-08-29 23:59:53'),
(173, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-09 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:56', '2019-08-29 23:59:56'),
(174, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-09 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-29 23:59:59', '2019-08-29 23:59:59'),
(175, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-10 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:02', '2019-08-30 00:00:02'),
(176, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-10 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:05', '2019-08-30 00:00:05'),
(177, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-10 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:08', '2019-08-30 00:00:08'),
(178, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-10 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:11', '2019-08-30 00:00:11'),
(179, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-10 02:31:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:14', '2019-08-30 00:00:14'),
(180, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-10 02:38:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:17', '2019-08-30 00:00:17'),
(181, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-10 03:01:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:20', '2019-08-30 00:00:20'),
(182, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-10 03:05:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:23', '2019-08-30 00:00:23'),
(183, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-10 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:26', '2019-08-30 00:00:26'),
(184, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-10 16:18:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:29', '2019-08-30 00:00:29'),
(185, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-10 16:18:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:32', '2019-08-30 00:00:32'),
(186, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-10 16:18:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:35', '2019-08-30 00:00:35'),
(187, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-10 16:18:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:38', '2019-08-30 00:00:38'),
(188, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-10 16:18:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:41', '2019-08-30 00:00:41'),
(189, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-10 16:18:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:44', '2019-08-30 00:00:44'),
(190, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-10 16:19:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:47', '2019-08-30 00:00:47'),
(191, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-10 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:50', '2019-08-30 00:00:50'),
(192, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-10 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:53', '2019-08-30 00:00:53'),
(193, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-10 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:56', '2019-08-30 00:00:56'),
(194, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-10 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:00:59', '2019-08-30 00:00:59'),
(195, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-10 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:02', '2019-08-30 00:01:02'),
(196, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-11 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:06', '2019-08-30 00:01:06'),
(197, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-11 02:31:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:08', '2019-08-30 00:01:08'),
(198, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-11 02:31:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:11', '2019-08-30 00:01:11'),
(199, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-11 02:38:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:14', '2019-08-30 00:01:14'),
(200, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-11 02:38:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:17', '2019-08-30 00:01:17'),
(201, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-11 02:39:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:20', '2019-08-30 00:01:20'),
(202, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-11 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:23', '2019-08-30 00:01:23'),
(203, 1, '2018-101', '12', 'TEST CHERRY', 'abueva@gmail.com', NULL, '2019-07-11 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:26', '2019-08-30 00:01:26'),
(204, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-11 03:05:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:29', '2019-08-30 00:01:29'),
(205, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-11 03:10:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:32', '2019-08-30 00:01:32'),
(206, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-11 03:18:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:35', '2019-08-30 00:01:35'),
(207, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-11 03:18:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:38', '2019-08-30 00:01:38'),
(208, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-11 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:41', '2019-08-30 00:01:41'),
(209, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-11 16:28:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:44', '2019-08-30 00:01:44'),
(210, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-11 16:28:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:47', '2019-08-30 00:01:47'),
(211, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-12 03:03:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:50', '2019-08-30 00:01:50'),
(212, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-12 03:03:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:53', '2019-08-30 00:01:53'),
(213, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-12 03:20:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:56', '2019-08-30 00:01:56'),
(214, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-12 16:18:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:01:59', '2019-08-30 00:01:59'),
(215, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-13 02:38:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:02', '2019-08-30 00:02:02'),
(216, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-14 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:05', '2019-08-30 00:02:05'),
(217, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-14 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:08', '2019-08-30 00:02:08'),
(218, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-14 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:11', '2019-08-30 00:02:11'),
(219, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-14 16:25:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:14', '2019-08-30 00:02:14'),
(220, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-14 17:18:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:17', '2019-08-30 00:02:17'),
(221, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-14 17:19:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:20', '2019-08-30 00:02:20'),
(222, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-14 18:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:23', '2019-08-30 00:02:23'),
(223, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-14 18:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:26', '2019-08-30 00:02:26'),
(224, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-14 18:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:29', '2019-08-30 00:02:29'),
(225, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-14 18:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:32', '2019-08-30 00:02:32'),
(226, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-15 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:35', '2019-08-30 00:02:35'),
(227, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-15 02:34:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:38', '2019-08-30 00:02:38'),
(228, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-15 02:34:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:41', '2019-08-30 00:02:41'),
(229, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-15 02:38:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:44', '2019-08-30 00:02:44'),
(230, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-15 02:38:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:47', '2019-08-30 00:02:47'),
(231, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-15 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:50', '2019-08-30 00:02:50'),
(232, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-15 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:53', '2019-08-30 00:02:53'),
(233, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-15 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:56', '2019-08-30 00:02:56'),
(234, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-15 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:02:59', '2019-08-30 00:02:59'),
(235, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-15 04:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:02', '2019-08-30 00:03:02'),
(236, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-15 16:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:05', '2019-08-30 00:03:05'),
(237, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-15 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:08', '2019-08-30 00:03:08'),
(238, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-15 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:11', '2019-08-30 00:03:11'),
(239, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-15 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:14', '2019-08-30 00:03:14'),
(240, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-15 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:17', '2019-08-30 00:03:17'),
(241, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-16 02:31:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:20', '2019-08-30 00:03:20'),
(242, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-16 02:34:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:23', '2019-08-30 00:03:23'),
(243, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-16 02:34:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:26', '2019-08-30 00:03:26'),
(244, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-16 03:02:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:30', '2019-08-30 00:03:30'),
(245, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-16 03:03:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:32', '2019-08-30 00:03:32'),
(246, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-16 16:15:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:35', '2019-08-30 00:03:35'),
(247, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-16 16:15:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:38', '2019-08-30 00:03:38'),
(248, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-16 16:15:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:41', '2019-08-30 00:03:41'),
(249, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-16 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:45', '2019-08-30 00:03:45'),
(250, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-16 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:47', '2019-08-30 00:03:47'),
(251, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-16 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:50', '2019-08-30 00:03:50'),
(252, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-16 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:53', '2019-08-30 00:03:53'),
(253, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-16 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:56', '2019-08-30 00:03:56'),
(254, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-16 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:03:59', '2019-08-30 00:03:59');
INSERT INTO `date_time_records` (`id`, `user_id`, `company_id`, `ACNo`, `name`, `email`, `apiKey`, `datetime`, `datetime_app`, `address`, `longitude`, `latitude`, `report`, `state`, `deviceID`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(255, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-16 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:02', '2019-08-30 00:04:02'),
(256, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-16 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:05', '2019-08-30 00:04:05'),
(257, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-17 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:08', '2019-08-30 00:04:08'),
(258, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-17 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:11', '2019-08-30 00:04:11'),
(259, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-17 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:14', '2019-08-30 00:04:14'),
(260, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-17 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:18', '2019-08-30 00:04:18'),
(261, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-17 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:20', '2019-08-30 00:04:20'),
(262, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-17 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:23', '2019-08-30 00:04:23'),
(263, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-17 02:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:26', '2019-08-30 00:04:26'),
(264, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-17 02:34:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:29', '2019-08-30 00:04:29'),
(265, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-17 02:34:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:32', '2019-08-30 00:04:32'),
(266, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-17 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:35', '2019-08-30 00:04:35'),
(267, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-17 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:39', '2019-08-30 00:04:39'),
(268, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-17 16:15:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:41', '2019-08-30 00:04:41'),
(269, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-17 16:23:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:47', '2019-08-30 00:04:47'),
(270, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-17 16:23:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:48', '2019-08-30 00:04:48'),
(271, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-17 16:23:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:51', '2019-08-30 00:04:51'),
(272, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-17 16:23:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:54', '2019-08-30 00:04:54'),
(273, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-17 16:23:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:04:57', '2019-08-30 00:04:57'),
(274, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-17 16:23:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:01', '2019-08-30 00:05:01'),
(275, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-17 16:23:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:03', '2019-08-30 00:05:03'),
(276, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-17 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:06', '2019-08-30 00:05:06'),
(277, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-17 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:10', '2019-08-30 00:05:10'),
(278, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-17 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:12', '2019-08-30 00:05:12'),
(279, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-17 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:15', '2019-08-30 00:05:15'),
(280, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-18 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:19', '2019-08-30 00:05:19'),
(281, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-18 02:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:21', '2019-08-30 00:05:21'),
(282, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-18 02:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:24', '2019-08-30 00:05:24'),
(283, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-18 02:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:27', '2019-08-30 00:05:27'),
(284, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-18 02:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:30', '2019-08-30 00:05:30'),
(285, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-18 02:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:33', '2019-08-30 00:05:33'),
(286, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-18 02:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:36', '2019-08-30 00:05:36'),
(287, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-18 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:40', '2019-08-30 00:05:40'),
(288, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-18 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:42', '2019-08-30 00:05:42'),
(289, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-18 03:05:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:45', '2019-08-30 00:05:45'),
(290, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-18 03:05:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:49', '2019-08-30 00:05:49'),
(291, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-18 03:06:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:51', '2019-08-30 00:05:51'),
(292, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-18 16:23:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:54', '2019-08-30 00:05:54'),
(293, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-18 16:23:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:05:57', '2019-08-30 00:05:57'),
(294, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-18 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:00', '2019-08-30 00:06:00'),
(295, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-18 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:03', '2019-08-30 00:06:03'),
(296, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-18 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:06', '2019-08-30 00:06:06'),
(297, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-18 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:10', '2019-08-30 00:06:10'),
(298, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-18 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:12', '2019-08-30 00:06:12'),
(299, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-18 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:15', '2019-08-30 00:06:15'),
(300, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-18 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:18', '2019-08-30 00:06:18'),
(301, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-18 16:25:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:21', '2019-08-30 00:06:21'),
(302, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-18 17:15:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:24', '2019-08-30 00:06:24'),
(303, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-18 17:20:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:27', '2019-08-30 00:06:27'),
(304, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-18 17:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:31', '2019-08-30 00:06:31'),
(305, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-19 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:33', '2019-08-30 00:06:33'),
(306, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-19 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:36', '2019-08-30 00:06:36'),
(307, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-19 02:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:39', '2019-08-30 00:06:39'),
(308, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-19 02:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:42', '2019-08-30 00:06:42'),
(309, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-19 02:34:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:45', '2019-08-30 00:06:45'),
(310, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-19 02:34:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:48', '2019-08-30 00:06:48'),
(311, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-19 02:34:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:52', '2019-08-30 00:06:52'),
(312, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-19 02:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:54', '2019-08-30 00:06:54'),
(313, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-19 02:44:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:06:57', '2019-08-30 00:06:57'),
(314, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-19 02:44:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:00', '2019-08-30 00:07:00'),
(315, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-19 03:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:03', '2019-08-30 00:07:03'),
(316, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-19 03:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:06', '2019-08-30 00:07:06'),
(317, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-19 03:40:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:09', '2019-08-30 00:07:09'),
(318, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-19 05:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:12', '2019-08-30 00:07:12'),
(319, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-19 15:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:15', '2019-08-30 00:07:15'),
(320, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-21 16:13:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:18', '2019-08-30 00:07:18'),
(321, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-21 16:13:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:21', '2019-08-30 00:07:21'),
(322, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-21 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:24', '2019-08-30 00:07:24'),
(323, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-21 16:24:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:27', '2019-08-30 00:07:27'),
(324, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-21 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:30', '2019-08-30 00:07:30'),
(325, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-21 18:12:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:33', '2019-08-30 00:07:33'),
(326, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-21 18:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:36', '2019-08-30 00:07:36'),
(327, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-21 18:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:39', '2019-08-30 00:07:39'),
(328, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-22 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:42', '2019-08-30 00:07:42'),
(329, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-22 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:45', '2019-08-30 00:07:45'),
(330, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-22 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:48', '2019-08-30 00:07:48'),
(331, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-22 02:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:51', '2019-08-30 00:07:51'),
(332, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-22 02:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:54', '2019-08-30 00:07:54'),
(333, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-22 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:07:57', '2019-08-30 00:07:57'),
(334, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-22 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:00', '2019-08-30 00:08:00'),
(335, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-22 04:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:03', '2019-08-30 00:08:03'),
(336, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-22 15:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:06', '2019-08-30 00:08:06'),
(337, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-22 15:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:09', '2019-08-30 00:08:09'),
(338, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-22 15:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:13', '2019-08-30 00:08:13'),
(339, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-22 15:25:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:15', '2019-08-30 00:08:15'),
(340, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-22 16:25:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:18', '2019-08-30 00:08:18'),
(341, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-22 16:25:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:21', '2019-08-30 00:08:21'),
(342, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-22 16:25:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:24', '2019-08-30 00:08:24'),
(343, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-22 16:25:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:27', '2019-08-30 00:08:27'),
(344, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-22 16:25:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:30', '2019-08-30 00:08:30'),
(345, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-22 16:26:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:33', '2019-08-30 00:08:33'),
(346, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-22 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:36', '2019-08-30 00:08:36'),
(347, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-22 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:39', '2019-08-30 00:08:39'),
(348, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-22 16:35:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:42', '2019-08-30 00:08:42'),
(349, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-22 16:35:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:45', '2019-08-30 00:08:45'),
(350, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-22 16:36:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:49', '2019-08-30 00:08:49'),
(351, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-23 01:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:51', '2019-08-30 00:08:51'),
(352, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-23 01:10:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:54', '2019-08-30 00:08:54'),
(353, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-23 01:10:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:08:57', '2019-08-30 00:08:57'),
(354, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-23 01:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:00', '2019-08-30 00:09:00'),
(355, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-23 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:03', '2019-08-30 00:09:03'),
(356, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-23 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:06', '2019-08-30 00:09:06'),
(357, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-23 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:09', '2019-08-30 00:09:09'),
(358, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-23 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:12', '2019-08-30 00:09:12'),
(359, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-23 02:33:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:15', '2019-08-30 00:09:15'),
(360, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-23 02:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:18', '2019-08-30 00:09:18'),
(361, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-23 02:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:21', '2019-08-30 00:09:21'),
(362, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-23 02:36:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:24', '2019-08-30 00:09:24'),
(363, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-23 03:02:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:27', '2019-08-30 00:09:27'),
(364, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-23 03:02:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:30', '2019-08-30 00:09:30'),
(365, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-23 03:02:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:33', '2019-08-30 00:09:33'),
(366, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-23 16:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:36', '2019-08-30 00:09:36'),
(367, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-23 16:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:39', '2019-08-30 00:09:39'),
(368, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-23 16:25:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:42', '2019-08-30 00:09:42'),
(369, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-23 16:25:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:45', '2019-08-30 00:09:45'),
(370, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-23 16:26:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:48', '2019-08-30 00:09:48'),
(371, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-23 16:29:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:51', '2019-08-30 00:09:51'),
(372, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-23 16:29:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:54', '2019-08-30 00:09:54'),
(373, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-24 02:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:09:57', '2019-08-30 00:09:57'),
(374, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-24 02:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:00', '2019-08-30 00:10:00'),
(375, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-24 02:36:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:03', '2019-08-30 00:10:03'),
(376, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-24 02:39:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:06', '2019-08-30 00:10:06'),
(377, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-24 02:40:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:09', '2019-08-30 00:10:09'),
(378, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-24 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:12', '2019-08-30 00:10:12'),
(379, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-24 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:15', '2019-08-30 00:10:15'),
(380, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-24 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:18', '2019-08-30 00:10:18'),
(381, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-24 16:25:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:21', '2019-08-30 00:10:21'),
(382, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-24 16:25:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:24', '2019-08-30 00:10:24'),
(383, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-24 16:26:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:27', '2019-08-30 00:10:27'),
(384, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-24 16:29:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:30', '2019-08-30 00:10:30'),
(385, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-24 16:29:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:33', '2019-08-30 00:10:33'),
(386, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-24 16:29:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:36', '2019-08-30 00:10:36'),
(387, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-24 16:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:39', '2019-08-30 00:10:39'),
(388, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-24 16:39:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:42', '2019-08-30 00:10:42'),
(389, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-24 16:39:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:45', '2019-08-30 00:10:45'),
(390, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-24 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:48', '2019-08-30 00:10:48'),
(391, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-24 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:51', '2019-08-30 00:10:51'),
(392, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-24 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:54', '2019-08-30 00:10:54'),
(393, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-24 17:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:10:57', '2019-08-30 00:10:57'),
(394, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-24 18:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:00', '2019-08-30 00:11:00'),
(395, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-24 18:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:03', '2019-08-30 00:11:03'),
(396, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-25 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:06', '2019-08-30 00:11:06'),
(397, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-25 02:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:09', '2019-08-30 00:11:09'),
(398, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-25 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:12', '2019-08-30 00:11:12'),
(399, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-25 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:15', '2019-08-30 00:11:15'),
(400, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-25 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:18', '2019-08-30 00:11:18'),
(401, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-25 02:32:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:21', '2019-08-30 00:11:21'),
(402, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-25 02:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:24', '2019-08-30 00:11:24'),
(403, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-25 02:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:27', '2019-08-30 00:11:27'),
(404, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-25 02:36:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:30', '2019-08-30 00:11:30'),
(405, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-25 02:39:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:33', '2019-08-30 00:11:33'),
(406, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-25 02:39:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:36', '2019-08-30 00:11:36'),
(407, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-25 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:39', '2019-08-30 00:11:39'),
(408, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-25 03:02:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:42', '2019-08-30 00:11:42'),
(409, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-25 03:10:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:45', '2019-08-30 00:11:45'),
(410, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-25 16:18:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:48', '2019-08-30 00:11:48'),
(411, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-25 16:18:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:51', '2019-08-30 00:11:51'),
(412, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-25 16:26:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:54', '2019-08-30 00:11:54'),
(413, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-25 16:39:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:11:57', '2019-08-30 00:11:57'),
(414, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-25 16:40:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:00', '2019-08-30 00:12:00'),
(415, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-25 17:29:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:03', '2019-08-30 00:12:03'),
(416, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-25 17:29:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:06', '2019-08-30 00:12:06'),
(417, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-25 17:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:09', '2019-08-30 00:12:09'),
(418, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-25 17:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:12', '2019-08-30 00:12:12'),
(419, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-25 17:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:15', '2019-08-30 00:12:15'),
(420, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-26 02:36:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:18', '2019-08-30 00:12:18'),
(421, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-26 02:38:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:21', '2019-08-30 00:12:21'),
(422, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-26 02:39:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:24', '2019-08-30 00:12:24'),
(423, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-26 02:39:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:27', '2019-08-30 00:12:27'),
(424, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-26 02:39:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:30', '2019-08-30 00:12:30'),
(425, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-26 02:39:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:33', '2019-08-30 00:12:33'),
(426, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-26 02:39:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:36', '2019-08-30 00:12:36'),
(427, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-26 03:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:39', '2019-08-30 00:12:39'),
(428, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-26 03:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:42', '2019-08-30 00:12:42'),
(429, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-26 03:35:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:45', '2019-08-30 00:12:45'),
(430, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-26 05:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:48', '2019-08-30 00:12:48'),
(431, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-26 15:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:54', '2019-08-30 00:12:54'),
(432, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-26 17:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:54', '2019-08-30 00:12:54'),
(433, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-27 03:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:12:57', '2019-08-30 00:12:57'),
(434, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-28 15:49:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:00', '2019-08-30 00:13:00'),
(435, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-28 16:26:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:03', '2019-08-30 00:13:03'),
(436, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-28 16:39:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:06', '2019-08-30 00:13:06'),
(437, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-28 16:39:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:09', '2019-08-30 00:13:09'),
(438, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-28 16:39:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:12', '2019-08-30 00:13:12'),
(439, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-28 16:49:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:15', '2019-08-30 00:13:15'),
(440, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-28 18:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:18', '2019-08-30 00:13:18'),
(441, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-28 18:30:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:21', '2019-08-30 00:13:21'),
(442, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-28 18:35:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:24', '2019-08-30 00:13:24'),
(443, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-29 02:36:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:27', '2019-08-30 00:13:27'),
(444, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-29 02:38:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:30', '2019-08-30 00:13:30'),
(445, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-29 02:39:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:33', '2019-08-30 00:13:33'),
(446, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-29 02:39:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:36', '2019-08-30 00:13:36'),
(447, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-29 02:39:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:39', '2019-08-30 00:13:39'),
(448, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-29 03:03:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:42', '2019-08-30 00:13:42'),
(449, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-29 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:45', '2019-08-30 00:13:45'),
(450, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-29 04:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:48', '2019-08-30 00:13:48'),
(451, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-29 04:34:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:51', '2019-08-30 00:13:51'),
(452, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-29 15:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:54', '2019-08-30 00:13:54'),
(453, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-29 15:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:13:57', '2019-08-30 00:13:57'),
(454, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-29 15:00:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:00', '2019-08-30 00:14:00'),
(455, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-29 15:12:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:03', '2019-08-30 00:14:03'),
(456, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-29 16:09:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:06', '2019-08-30 00:14:06'),
(457, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-29 16:25:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:09', '2019-08-30 00:14:09'),
(458, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-29 16:26:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:12', '2019-08-30 00:14:12'),
(459, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-29 16:39:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:15', '2019-08-30 00:14:15'),
(460, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-29 16:49:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:18', '2019-08-30 00:14:18'),
(461, 1, '2018-101', '700', 'EMPLOYEE', 'abueva@gmail.com', NULL, '2019-07-30 01:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:21', '2019-08-30 00:14:21'),
(462, 1, '2018-101', '1515', 'TEST PAUL', 'abueva@gmail.com', NULL, '2019-07-30 01:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:24', '2019-08-30 00:14:24'),
(463, 1, '2018-101', '29', 'TEST KYLE', 'abueva@gmail.com', NULL, '2019-07-30 01:10:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:27', '2019-08-30 00:14:27'),
(464, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-30 02:36:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:30', '2019-08-30 00:14:30'),
(465, 1, '2018-101', '96', 'ATOM', 'abueva@gmail.com', NULL, '2019-07-30 02:38:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:33', '2019-08-30 00:14:33'),
(466, 1, '2018-101', '98', 'DIANA', 'abueva@gmail.com', NULL, '2019-07-30 02:39:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:36', '2019-08-30 00:14:36'),
(467, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-30 03:03:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:39', '2019-08-30 00:14:39'),
(468, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-30 03:03:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:42', '2019-08-30 00:14:42'),
(469, 1, '2018-101', '27', 'TEST', 'abueva@gmail.com', NULL, '2019-07-30 03:30:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:45', '2019-08-30 00:14:45'),
(470, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-30 16:19:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:48', '2019-08-30 00:14:48'),
(471, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-30 16:26:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:51', '2019-08-30 00:14:51'),
(472, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-30 16:29:00', NULL, NULL, NULL, NULL, NULL, 'C/In', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:54', '2019-08-30 00:14:54'),
(473, 1, '2018-101', '99', 'DIANE', 'abueva@gmail.com', NULL, '2019-07-31 02:03:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:14:57', '2019-08-30 00:14:57'),
(474, 1, '2018-101', '97', 'DANTE', 'abueva@gmail.com', NULL, '2019-07-31 02:36:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:15:00', '2019-08-30 00:15:00'),
(475, 1, '2018-101', '900', 'DEMO', 'abueva@gmail.com', NULL, '2019-07-31 03:00:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', 'cs1t3st', 'saved', NULL, '2019-08-30 00:15:03', '2019-08-30 00:15:03'),
(476, 51, '0000-000', '1', 'TEST RND', 'csi.notifcation2019@gmail.com', NULL, '2019-08-22 02:05:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', '1234567910', 'saved', NULL, '2019-12-16 19:09:47', '2019-12-16 19:09:47'),
(477, 7, '1996-001', '1007', 'ABUEVA', 'pabs@gmail.com', NULL, '2019-07-24 00:28:00', NULL, NULL, NULL, NULL, NULL, 'C/In', '12345678S910', 'saved', NULL, '2020-01-08 05:36:30', '2020-01-08 05:36:30'),
(478, 7, '1996-001', '1007', 'ABUEVA', 'pabs@gmail.com', NULL, '2019-07-24 10:28:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', '12345678S910', 'saved', NULL, '2020-01-08 05:36:51', '2020-01-08 05:36:51'),
(479, 7, '1996-001', '1008', 'ABUEVA', 'pabs@gmail.com', NULL, '2019-07-24 10:28:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', '12345678S910', 'saved', NULL, '2020-01-08 05:37:03', '2020-01-08 05:37:03'),
(480, 7, '1996-001', '1008', 'ABUEVA', 'pabs@gmail.com', NULL, '2019-07-24 00:28:00', NULL, NULL, NULL, NULL, NULL, 'C/In', '12345678S910', 'saved', NULL, '2020-01-08 05:37:19', '2020-01-08 05:37:19'),
(481, 7, '1996-001', '1009', 'ABUEVA', 'pabs@gmail.com', NULL, '2019-07-24 00:28:00', NULL, NULL, NULL, NULL, NULL, 'C/In', '12345678S910', 'saved', NULL, '2020-01-09 01:41:55', '2020-01-09 01:41:55'),
(482, 7, '1996-001', '1009', 'ABUEVA', 'pabs@gmail.com', NULL, '2019-07-24 10:28:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', '12345678S910', 'saved', NULL, '2020-01-09 01:42:08', '2020-01-09 01:42:08'),
(483, 7, '1996-001', '1010', 'ABUEVA', 'pabs@gmail.com', NULL, '2019-07-24 10:28:00', NULL, NULL, NULL, NULL, NULL, 'C/Out', '12345678S910', 'saved', NULL, '2020-01-09 01:42:37', '2020-01-09 01:42:37'),
(484, 7, '1996-001', '1010', 'ABUEVA', 'pabs@gmail.com', NULL, '2019-07-24 00:28:00', NULL, NULL, NULL, NULL, NULL, 'C/In', '12345678S910', 'saved', NULL, '2020-01-09 01:42:45', '2020-01-09 01:42:45'),
(485, 1, '2018-101', '5', 'ABUEVA', 'keighdee@gmail.com', NULL, '2019-04-07 00:28:00', NULL, NULL, NULL, NULL, NULL, 'C/In', '12345678910', 'saved', NULL, '2020-01-16 03:05:02', '2020-01-16 03:05:02'),
(486, 1, '2018-101', '101', 'Kay Diaz', 'keighdee@gmail.com', NULL, '2020-01-16 03:06:02', NULL, 'ADDRESS', 'longitude', 'latitude', NULL, 'C/In', '12345678910', NULL, NULL, '2020-01-16 03:06:02', '2020-01-16 03:06:02'),
(487, 54, '2019-1008', '1008', 'Employee8, Employee8', 'cherryann_anis1@yahoo.com', NULL, '2020-01-22 02:57:52', NULL, 'Unit 7/B San Miguel Ave, Ortigas Center, Pasig, Metro Manila, Philippines', '121.0588215', '14.5796264', NULL, 'C/In', 'LGE Nexus 5', NULL, NULL, '2020-01-22 02:57:52', '2020-01-22 02:57:52'),
(488, 54, '2019-1008', '1008', 'Employee8, Employee8', 'cherryann_anis1@yahoo.com', NULL, '2020-01-27 08:57:52', NULL, 'Unit 7/B San Miguel Ave, Ortigas Center, Pasig, Metro Manila, Philippines', '121.0588281', '14.5796206', 'bdhrh', 'C/Out', 'vivo vivo 1811', NULL, NULL, '2020-01-27 08:57:52', '2020-01-27 08:57:52'),
(489, 54, '2019-1008', '1008', 'Employee8, Employee8', 'cherryann_anis1@yahoo.com', NULL, '2020-01-30 05:26:52', NULL, 'Unit 7/B San Miguel Ave, Ortigas Center, Pasig, Metro Manila, Philippines', '121.0588164', '14.5796061', 'qwerty', 'C/Out', 'LGE Nexus 5', NULL, NULL, '2020-01-30 05:26:52', '2020-01-30 05:26:52'),
(490, 54, '2019-1008', '1008', 'Employee8, Employee8', 'cherryann_anis1@yahoo.com', NULL, '2020-02-05 07:24:20', NULL, 'Belvedere Tower, San Miguel Avenue, Ortigas, Pasig, 1605, Metro Manila, San Antonio, Pasig, Metro Manila, Philippines', '121.0588142', '14.5796165', 'out', 'C/Out', 'LGE Nexus 5', NULL, NULL, '2020-02-05 07:24:20', '2020-02-05 07:24:20'),
(491, 54, '2019-1008', '1008', 'Employee8, Employee8', 'cherryann_anis1@yahoo.com', NULL, '2020-02-05 07:24:27', NULL, 'Belvedere Tower, San Miguel Avenue, Ortigas, Pasig, 1605, Metro Manila, San Antonio, Pasig, Metro Manila, Philippines', '121.0588099', '14.5796173', NULL, 'C/In', 'LGE Nexus 5', NULL, NULL, '2020-02-05 07:24:27', '2020-02-05 07:24:27');

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
('07c88259f3bb06709fe8836d9dec1029b7e031fa732280250b292e02fcbed871ece3b84151dd1d11', 45, 2, NULL, '[]', 0, '2020-01-06 08:14:41', '2020-01-06 08:14:41', '2020-01-07 16:14:41'),
('090da00c2d04b0f6480ac0876e6f03de5107f19dc277fffd81179d03e8e8b90d617e7a7ecb19c2b2', 54, 2, NULL, '[]', 1, '2020-01-31 00:33:49', '2020-01-31 00:33:49', '2020-02-01 08:33:49'),
('092505ffb6c4a1c91c72382d9318063c3780fef8be11a80da0d72c5b941074e1ebd5caa3faf38693', 1, 2, NULL, '[]', 1, '2020-01-06 06:59:50', '2020-01-06 06:59:50', '2020-01-07 14:59:50'),
('09cf151d104a5018d18b28b14caa6067ba355321e986497d287f30b0d52cd48f837fdbff35de0b22', 54, 2, NULL, '[]', 0, '2020-02-12 03:14:22', '2020-02-12 03:14:22', '2020-02-13 11:14:22'),
('0b95ec62969041401da4305f98f0d693e2a1b9900030f1d684b0d67cc0e8f028694424780857f46c', 54, 2, NULL, '[]', 1, '2020-02-07 06:25:16', '2020-02-07 06:25:16', '2020-02-08 14:25:16'),
('0bfea31c38b44106f22816938559de3246d6942544ed86a9ac62908173d53c3234364a80dfccc5e6', 54, 2, NULL, '[]', 0, '2020-02-11 09:02:33', '2020-02-11 09:02:33', '2020-02-12 17:02:33'),
('0e14480af10ac0d7e5a755eb30d9e675492515b95aa39df7a684df3ed79cbc0dcfd1f4360ecc60cc', 54, 2, NULL, '[]', 1, '2020-02-06 03:53:55', '2020-02-06 03:53:55', '2020-02-07 11:53:55'),
('10249abdc2631d924135967a01920d9b6c972c3c199ab39174186a82c168a661c079354bc2bb8702', 52, 2, NULL, '[]', 0, '2020-01-06 08:41:34', '2020-01-06 08:41:34', '2020-01-07 16:41:34'),
('1234a05ad7666d40a929c0bc2d7564a5dc661a6be9d87fc923962b66171ae4307597e759f5fe2f6d', 1, 2, NULL, '[]', 1, '2020-01-06 02:08:43', '2020-01-06 02:08:43', '2020-01-07 10:08:43'),
('14ea62a76df826db94fcc868a58b40a8cd50bf75cc65a40ec54ebe3205aaa2a265099cd936cb9ff1', 45, 2, NULL, '[]', 0, '2020-01-06 08:15:02', '2020-01-06 08:15:02', '2020-01-07 16:15:02'),
('15c84cbcf5f583ffd3f0999612cc4b9c5e980e41fb37327fc43db25f5c0da6f430862f1c450fd42a', 1, 2, NULL, '[]', 1, '2020-01-07 02:29:14', '2020-01-07 02:29:14', '2020-01-08 10:29:14'),
('1640aad7b6e19e3bfd7e50959fb7b8f100968bb5e776805219580b3c1d4b48d47354d3c7bd7c4021', 54, 2, NULL, '[]', 1, '2020-01-21 08:25:33', '2020-01-21 08:25:33', '2020-01-22 16:25:33'),
('1cd09c7499186a0a9746b4650bc5c018dcbf96371866d5e3841dc23df897801fedff676c592f61d7', 83, 2, NULL, '[]', 0, '2020-02-03 03:26:01', '2020-02-03 03:26:01', '2020-02-04 11:26:01'),
('1eab20567ff664d2608537af844bd316b464151e05468e6a2998f9cc73e9d11445375ca568229fcd', 54, 2, NULL, '[]', 1, '2020-02-05 10:24:24', '2020-02-05 10:24:24', '2020-02-06 18:24:24'),
('1ef847fe4fdc29641e8f3522fbca664930bd5938ee0f7984f6f26408848c73f20ae8c36ae45bd57a', 54, 2, NULL, '[]', 1, '2020-02-07 05:16:59', '2020-02-07 05:16:59', '2020-02-08 13:16:59'),
('1f89fedc12e045c8c70afa2064c4542e7a69cb4e1d19e6b5ba53cd9372a2bf6a3192cebb1590b14d', 54, 2, NULL, '[]', 1, '2020-01-27 06:03:32', '2020-01-27 06:03:32', '2020-01-28 14:03:32'),
('20d5a18cab59558c7fff6dd06f79f4ec8f4955c04a5c5feffb71aaf7cca7c06789c09879d650dd3d', 83, 2, NULL, '[]', 0, '2020-02-06 03:28:13', '2020-02-06 03:28:13', '2020-02-07 11:28:13'),
('22974f6cdc137ea0f55fa105575176519b79a79f707a3cfd652f22028cbb2de645708dbc73803857', 54, 2, NULL, '[]', 1, '2020-01-13 02:01:50', '2020-01-13 02:01:50', '2020-01-14 10:01:50'),
('27f4db1a3c2160bf66fcb8162fcdaea632851bd73d592a1b1767a1f292474ac0889cb299b08a1dd7', 54, 2, NULL, '[]', 1, '2020-02-03 01:23:51', '2020-02-03 01:23:51', '2020-02-04 09:23:51'),
('29c1ff53b756254a446760a2e89dffe703d27effd4d86b03d05b630c4ac541ad25bd216a750b2e2a', 54, 2, NULL, '[]', 1, '2020-02-07 06:24:05', '2020-02-07 06:24:05', '2020-02-08 14:24:05'),
('2cbbe019841a44586a783e8f2e70a3e057bc39af319f4fe45c86fe4984c8e9f31dee773e8f2cf632', 45, 2, NULL, '[]', 0, '2020-01-06 06:52:54', '2020-01-06 06:52:54', '2020-01-07 14:52:54'),
('2e174bb1bafbcaf589507e58579a1009b9ecd25d85575b6ae059bc8c8ce5b74f46d8088da9574e87', 54, 2, NULL, '[]', 1, '2020-01-30 05:24:22', '2020-01-30 05:24:22', '2020-01-31 13:24:21'),
('2e5d650ae6a528e6497e9ac7558f7fbf310d71ef52b5b0148e1da3bbb6065b3d83855a3a76dccf4a', 83, 2, NULL, '[]', 0, '2020-02-27 05:18:34', '2020-02-27 05:18:34', '2020-02-28 13:18:34'),
('328bb22f961aff0f50e97c4f860bd99cfd6898fda54c25fe0a821f2b815c97caa935b3c0116c6798', 1, 2, NULL, '[]', 1, '2020-01-16 02:52:44', '2020-01-16 02:52:44', '2020-01-17 10:52:44'),
('33efdafbecbbb34ac0a44752bc725b7d0a599105ac72b013a1f0bac99481b125d804c43e75f66ea4', 54, 2, NULL, '[]', 1, '2020-01-13 02:06:39', '2020-01-13 02:06:39', '2020-01-14 10:06:39'),
('3474ee47beee4ad27533089f2b859623e18790728e38b252c3db19297cd5d3ce14c1a3329577b0c8', 54, 2, NULL, '[]', 1, '2020-02-10 05:20:30', '2020-02-10 05:20:30', '2020-02-11 13:20:30'),
('34daf5cc96db9e44516664435ff78325f722aeba22192309dce79a9af5ac27dc70f3406d8e651178', 54, 2, NULL, '[]', 1, '2020-01-22 03:47:38', '2020-01-22 03:47:38', '2020-01-23 11:47:38'),
('3503294c2cf54d5b93fac89bf29dc3c20f9f4055f38b5bb5bf1929ad441addd2d4ef6cbbf73c06b2', 1, 2, NULL, '[]', 1, '2020-01-06 02:06:08', '2020-01-06 02:06:08', '2020-01-07 10:06:08'),
('3744a0a40d715fa352614f43143f62cdaaf70c466af864b0c6371e75f857f45cd6ac92f7b1120c63', 54, 2, NULL, '[]', 1, '2020-01-20 01:09:06', '2020-01-20 01:09:06', '2020-01-21 09:09:06'),
('386b1ca68243bcfb7ae8a2e2525d0dbfb13cb769a95f7d41a6d4e450aed24a2f16bca1d37e18fa2a', 54, 2, NULL, '[]', 1, '2020-01-22 06:31:26', '2020-01-22 06:31:26', '2020-01-23 14:31:26'),
('38eff98bbdc23df9bd116023f5a02a9dcd023ae582a28ed0a65cf4524257248ae154dd93684ee758', 1, 2, NULL, '[]', 1, '2019-10-29 09:10:11', '2019-10-29 09:10:11', '2019-10-30 17:10:11'),
('3a5324b9306ac6bb55ddd1cdb28b86b0985610d00d621c959d105b53f344eef47b4cb0317a4523bf', 46, 2, NULL, '[]', 0, '2020-01-06 08:39:33', '2020-01-06 08:39:33', '2020-01-07 16:39:33'),
('3a9149b5eb4f79a37bf45304c800e549fc65e6b956e1c103a7393b10f3b96934001b341215f2cefe', 54, 2, NULL, '[]', 1, '2020-01-15 08:35:59', '2020-01-15 08:35:59', '2020-01-16 16:35:59'),
('3ad4cd734585e3bc19184d0cf1a35bc2e96313b60f32eac6a54a65b44b279cc9a7b55705f7ab75b0', 1, 2, NULL, '[]', 1, '2020-01-10 08:56:29', '2020-01-10 08:56:29', '2020-01-11 16:56:29'),
('3bb6ec8fce9ff8e324438ee606c9b262c29a7ea702ec2256dc387c5095d953e585b1b3b98a78d30c', 54, 2, NULL, '[]', 1, '2020-01-22 05:46:47', '2020-01-22 05:46:47', '2020-01-23 13:46:47'),
('3d7eefa3d7fbf6b9485a7ebfc3b5f6b7ff8f70db1eb79f3b05a4f97f1bc1353156dacb1a64e8f427', 54, 2, NULL, '[]', 1, '2020-02-04 01:26:42', '2020-02-04 01:26:42', '2020-02-05 09:26:42'),
('3d9068d02256099296f6093e6a07228f74c212a8b363206452b87f4213a7af0a239af5104fc30dca', 1, 2, NULL, '[]', 1, '2020-01-06 08:08:27', '2020-01-06 08:08:27', '2020-01-07 16:08:27'),
('3ede9d94edde0609d3559c03feb47f73d73414cf86b922f0ddab7fd36a49e4dfd46545147345443c', 54, 2, NULL, '[]', 1, '2020-02-10 05:48:15', '2020-02-10 05:48:15', '2020-02-11 13:48:15'),
('3ee6794df90f4b3d00a927608fac24f942d1a00adbc3b13516ab192b543e14911604236174ea30a8', 1, 2, NULL, '[]', 1, '2019-11-25 02:17:33', '2019-11-25 02:17:33', '2019-11-26 10:17:32'),
('402755317925cb3af8ab5c09888b989b9ed0323ef468544dfb0dd605a14a7528890f1466278625c0', 54, 2, NULL, '[]', 1, '2020-02-05 05:32:58', '2020-02-05 05:32:58', '2020-02-06 13:32:58'),
('4054d4641a18cd398a77b2425ecec2fc0fd95858f065bdc259ebdcbca50c979590a8f0bd822cc267', 83, 2, NULL, '[]', 0, '2020-02-03 03:33:51', '2020-02-03 03:33:51', '2020-02-04 11:33:51'),
('40d4a118355f273e0419132283bcc4a6510017f20432e1c9b2ded6081686ff978d0510382ac6fcb7', 1, 2, NULL, '[]', 1, '2019-10-01 04:43:57', '2019-10-01 04:43:57', '2019-10-02 12:43:57'),
('416d1a39370961fc70be093f109f255c2589788ef4edb7c86a3e83e8fc892eaa0a053ff10c564595', 54, 2, NULL, '[]', 1, '2020-02-06 01:26:47', '2020-02-06 01:26:47', '2020-02-07 09:26:47'),
('41ac89805b7338b5afdb73bf20ed12bbc68395be0f3d69971ce19b905481e82f6b8c22e89c88e4e3', 54, 2, NULL, '[]', 0, '2020-02-19 02:43:10', '2020-02-19 02:43:10', '2020-02-20 10:43:10'),
('42e5f842a3493a0c316c52965ca81833b5cf9e506e509b9953d7cc3f3e11ea67377ebb311d1b7232', 54, 2, NULL, '[]', 1, '2020-01-21 06:28:46', '2020-01-21 06:28:46', '2020-01-22 14:28:46'),
('460a789c3260a3a8dc677f269e9b8bd9dcb01cbd20fc6a59274282ded655d14c8db42c54b557c0ec', 1, 2, NULL, '[]', 0, '2020-01-20 08:54:48', '2020-01-20 08:54:48', '2020-01-21 16:54:48'),
('46fa4f9a5d31074e410984db06f7b58ba35a4f43b26e0bb2fc73e18ad784fc28a24958908f81e332', 54, 2, NULL, '[]', 1, '2020-02-06 03:46:47', '2020-02-06 03:46:47', '2020-02-07 11:46:47'),
('4a595f91658d68c8ccf74a8510cddeb5355a5e435f55908b173970e58bb0aa235e7de57b47957e21', 1, 2, NULL, '[]', 1, '2020-01-06 01:58:51', '2020-01-06 01:58:51', '2020-01-07 09:58:51'),
('4afe3002a6a88a93da8d5285658f7479a14b874bb2833740156c9a3118b4c26504b4bc85e06f0c17', 45, 2, NULL, '[]', 0, '2020-01-06 06:46:31', '2020-01-06 06:46:31', '2020-01-07 14:46:31'),
('4b568036285cfaaef9a830d9b899db07e7eb21fe68c4b18f898a2becce15d9ed342a5ea35f423167', 54, 2, NULL, '[]', 1, '2020-01-21 06:28:27', '2020-01-21 06:28:27', '2020-01-22 14:28:27'),
('4f827ea7b2f0920f23dca85c69df53091be436a50963576c7986df1ec3eede41592333750dd9bc38', 54, 2, NULL, '[]', 1, '2020-01-23 05:54:57', '2020-01-23 05:54:57', '2020-01-24 13:54:57'),
('501752ea80673e495307125fab5adac262d91db1c4bafddea45c0b0de27fcd773521a6912df688f4', 54, 2, NULL, '[]', 1, '2020-01-17 00:01:41', '2020-01-17 00:01:41', '2020-01-18 08:01:41'),
('513f3c7e21c485e8787da5a4450b2ff902beab8934eb10abab064214059b27e51a6ee4b5c262c3d7', 54, 2, NULL, '[]', 1, '2020-01-27 07:02:08', '2020-01-27 07:02:08', '2020-01-28 15:02:08'),
('5418ff4388e2fec30f279657fa7602d9b2f881e2dd258211013c220f83c99db545b733973c524f99', 54, 2, NULL, '[]', 1, '2020-01-07 07:52:06', '2020-01-07 07:52:06', '2020-01-08 15:52:06'),
('580d0bd18c17f241fe1d2647f1c3c12d6bb604a0061b429cf96797fec5a480e7d3211dc1dfbe66fe', 1, 2, NULL, '[]', 1, '2019-10-01 05:01:50', '2019-10-01 05:01:50', '2019-10-02 13:01:50'),
('606847590fc16c545903017c9cce260d6739ceae79281f09731b2b68c2e2b79828894a37ba78964c', 83, 2, NULL, '[]', 0, '2020-02-03 03:33:49', '2020-02-03 03:33:49', '2020-02-04 11:33:49'),
('60d80c8484a190b72d68000c3e47f0ac461d3f14a93128db8a101304871bd450aa44d48e1e25ceb9', 1, 2, NULL, '[]', 1, '2020-01-06 06:22:32', '2020-01-06 06:22:32', '2020-01-07 14:22:32'),
('61d0c361b589717d2aed1fd3688682a5af0dc87be9dd41e8c9146db3f222e469469892cf389145dc', 54, 2, NULL, '[]', 1, '2020-01-10 08:53:40', '2020-01-10 08:53:40', '2020-01-11 16:53:40'),
('681dd32c6ee72ed66f08f2e51eb2a99cc0ad1c19e7120c10e4474618e5552cf5af2466fbdeae2433', 54, 2, NULL, '[]', 1, '2020-01-16 01:55:30', '2020-01-16 01:55:30', '2020-01-17 09:55:30'),
('69c73311da0f134cb52f54db9e5e870edf98bf7ae0ec7041c4c64ce0a6612970ceddccdcde96f12c', 83, 2, NULL, '[]', 0, '2020-01-28 02:18:03', '2020-01-28 02:18:03', '2020-01-29 10:18:03'),
('6a07dad26886203dd97578817b24860817f3581b6c1fa80d9a051784ef4f5c3d48ff3fc6a82d2bf9', 1, 2, NULL, '[]', 1, '2020-01-13 03:56:15', '2020-01-13 03:56:15', '2020-01-14 11:56:15'),
('6d6c409a6b40cb28dfdc044ed3e3abbd045c7fb2f3bb33acb396b6288f61f58694b5fb2784e5b24a', 54, 2, NULL, '[]', 1, '2020-01-21 06:28:31', '2020-01-21 06:28:31', '2020-01-22 14:28:31'),
('7061470337db29eb95454273d29860c57d80365ea2930d5d391ea0090299622bb60f6b2c5f30407e', 54, 2, NULL, '[]', 1, '2020-02-05 09:18:45', '2020-02-05 09:18:45', '2020-02-06 17:18:45'),
('7088ed4b237ad664130080851abbec0c9d7365a51e8a5fb45a0de0a7e4c8fbe865993e29b16407b8', 54, 2, NULL, '[]', 1, '2020-01-10 01:56:07', '2020-01-10 01:56:07', '2020-01-11 09:56:06'),
('72a9e4e225bf54df5100152280f127d24c45d7221670f30e68e2e349eb330023c54f658d6d4bde05', 54, 2, NULL, '[]', 1, '2020-01-20 01:09:08', '2020-01-20 01:09:08', '2020-01-21 09:09:08'),
('769ec743db1bfbf57d7feb16f49221a3eb0b3dc6df8f3666bba71a7149b21b444b84361ec5116526', 54, 2, NULL, '[]', 1, '2020-01-21 06:27:52', '2020-01-21 06:27:52', '2020-01-22 14:27:52'),
('775cd47d03e94d5f95da3f8837947a7a0b023c95db1f30378da6bac97a766ac2941a142040361f0d', 45, 2, NULL, '[]', 0, '2020-01-06 08:06:46', '2020-01-06 08:06:46', '2020-01-07 16:06:46'),
('775fe0d59e11bfbce51e4b4be649185b9e6026d1b22a3962269d602577091378e4ec5c03ad674894', 1, 2, NULL, '[]', 1, '2019-11-20 07:51:31', '2019-11-20 07:51:31', '2019-11-21 15:51:30'),
('77d38fbe4424eb1acf81ce06ebf4211232cba39bf0d5616e18a77fa586cf61760682848eed8c2ee6', 54, 2, NULL, '[]', 1, '2020-02-07 06:14:41', '2020-02-07 06:14:41', '2020-02-08 14:14:41'),
('7ac6cf61ddf5443b95ef006881b495cba0514d37b19d1fcb450465cabf975b0303a26964b7560af8', 54, 2, NULL, '[]', 1, '2020-01-14 03:17:13', '2020-01-14 03:17:13', '2020-01-15 11:17:13'),
('7ceb4da5ba0dc637fb6a126d491127666dc375592cbc59b8997fa1c44b5bbffb871c3fb52104ac86', 1, 2, NULL, '[]', 1, '2020-01-16 03:01:14', '2020-01-16 03:01:14', '2020-01-17 11:01:14'),
('7dbbaef3709cc361ca10cb893b2bf92605413e3f4725dfd9c4ad5f559867cee060377b5d0cab4daf', 54, 2, NULL, '[]', 1, '2020-02-04 01:41:25', '2020-02-04 01:41:25', '2020-02-05 09:41:25'),
('7fa66f972273894dfb81992968bc218bb6b9f777d4cca972e2c8868e2b256a4a1be9967716fa995b', 1, 2, NULL, '[]', 1, '2020-01-16 03:06:35', '2020-01-16 03:06:35', '2020-01-17 11:06:35'),
('818881ba8764b40aeaf7fa6ee4d20c3c52a70802fffc83ff8261300393bbf1c094991ed13706c26b', 54, 2, NULL, '[]', 1, '2020-02-10 00:17:37', '2020-02-10 00:17:37', '2020-02-11 08:17:37'),
('8975433b299018f77ba3ce17686c0d32db5c44b4b60b1ec387e2d4ec407513fd4abebc55e8565004', 54, 2, NULL, '[]', 1, '2020-01-27 05:58:21', '2020-01-27 05:58:21', '2020-01-28 13:58:21'),
('8987c8ff216e13fab967ed4cd42f32739c466b00306e9a1c0d7445fc67d7ef767f68262445057f9b', 45, 2, NULL, '[]', 0, '2020-01-06 08:33:56', '2020-01-06 08:33:56', '2020-01-07 16:33:56'),
('8acdeae57079f2a949d6ebb0dff398f925684636888d88f467cdfd867e7231a98b0974e888d64198', 45, 2, NULL, '[]', 0, '2020-01-06 08:22:34', '2020-01-06 08:22:34', '2020-01-07 16:22:34'),
('8d99dceeafdb480bb5c4a002ea355619f8bd74756929886fbac22bb6d1a71603aea6c12ab8d87887', 54, 2, NULL, '[]', 1, '2020-02-06 05:45:04', '2020-02-06 05:45:04', '2020-02-07 13:45:04'),
('8dbfda5fade4ba7cfc46b6928f1c34317683dd26f335f33addd81e0f8c0b3d987f8457bdde422f2d', 54, 2, NULL, '[]', 1, '2020-01-27 05:56:41', '2020-01-27 05:56:41', '2020-01-28 13:56:40'),
('8dcec8784e91d0158631fc04d3b498cee1f6f78113e0aa6ff74627b27f030a30debbe5da8f485d59', 54, 2, NULL, '[]', 1, '2020-02-06 05:34:05', '2020-02-06 05:34:05', '2020-02-07 13:34:05'),
('8eb64537676ca7642050f14866343424fa486c489a0ebe44b3b16deeb484ea9ace02307e13435434', 54, 2, NULL, '[]', 1, '2020-02-11 01:35:16', '2020-02-11 01:35:16', '2020-02-12 09:35:16'),
('8ed62d88b9d0b46c8386716d7b3b5a86c99dbd1a59754737f918e96a8fcb228b5fe94cc60be38205', 83, 2, NULL, '[]', 0, '2020-02-03 03:35:51', '2020-02-03 03:35:51', '2020-02-04 11:35:51'),
('9285f46604409f3a93f88620ba00c63bf067cbe281225b4f4d7ebd6f923914be2b117e33687d3419', 1, 2, NULL, '[]', 1, '2020-01-06 07:13:22', '2020-01-06 07:13:22', '2020-01-07 15:13:22'),
('986ef8438be11fde214c5bab2580986490ddd5ef9f3a7768d1a19adea2852274f72eb2eaa7b9128b', 83, 2, NULL, '[]', 0, '2020-02-05 06:27:13', '2020-02-05 06:27:13', '2020-02-06 14:27:13'),
('99948b0af1b44c86b279432d26b62161a73d6381f7fb371390863ce0bf308efbf57a5263d84ac7e5', 1, 2, NULL, '[]', 0, '2020-01-16 03:08:09', '2020-01-16 03:08:09', '2020-01-17 11:08:09'),
('9f753360c7af8857fcd5d81ca912ba810911f73a9bdae1becaf7527451cd2cfa9d2f8ba5c05f90ce', 54, 2, NULL, '[]', 1, '2020-02-03 01:25:37', '2020-02-03 01:25:37', '2020-02-04 09:25:37'),
('a0d58fca342583ed930307343a285324b01c769606d87e73dd5b7be94322e99822ba2197c31517b9', 1, 2, NULL, '[]', 1, '2019-10-01 05:02:11', '2019-10-01 05:02:11', '2019-10-02 13:02:11'),
('a3def1366969d50a7560eb9a0a4803cef77cd2936a66025cce72835631c41fdf7795eb70060deda3', 54, 2, NULL, '[]', 0, '2020-02-17 00:51:28', '2020-02-17 00:51:28', '2020-02-18 08:51:28'),
('a3f4e4f55a4a67e65637dd75e5c4556dca5c8f2497bfaac089b495c6c13f3690ebb29b332eaf05c9', 45, 2, NULL, '[]', 0, '2020-01-06 08:07:36', '2020-01-06 08:07:36', '2020-01-07 16:07:36'),
('a5bf85412c071d51529faaeb39b936479c4526689e97117f08c1e51bfa5ac8d71a5c22cfd4332362', 54, 2, NULL, '[]', 1, '2020-02-10 00:18:37', '2020-02-10 00:18:37', '2020-02-11 08:18:37'),
('ae1f23d27c3a96c5a6f9c421023cac0c7a030b2f4cc3b57d217e3de0cf76531132ad5c8f178f3470', 54, 2, NULL, '[]', 1, '2020-02-05 01:49:21', '2020-02-05 01:49:21', '2020-02-06 09:49:20'),
('b1262ad5c70641939497e3acefda24955f357a3d6730fb0d020aa9f205a5ae7ff63f43a0a5f1ac04', 1, 2, NULL, '[]', 1, '2020-01-07 00:00:45', '2020-01-07 00:00:45', '2020-01-08 08:00:45'),
('b34494e6aa4133cd09d491b2d039fa9062ab66a0fe30db7e98c457cb81408fbd6a662289800d83ca', 45, 2, NULL, '[]', 0, '2020-01-06 07:52:06', '2020-01-06 07:52:06', '2020-01-07 15:52:06'),
('b478e9ce17eee2e5d57876e6ab339f6a256e7e2915f3810881953f58496ffb1db34e90e31a381941', 54, 2, NULL, '[]', 1, '2020-02-03 08:02:19', '2020-02-03 08:02:19', '2020-02-04 16:02:19'),
('b5121afec7bf5f6ae1f4d02ce605d4f12fb3a2a88410baa5bf6d8cf929f94bc762212008dc50dd9d', 54, 2, NULL, '[]', 1, '2020-02-05 03:05:19', '2020-02-05 03:05:19', '2020-02-06 11:05:19'),
('b5819d04fc450c131a3efd991e3da4f64ad47cbc56c701ae2be1e2fa9ed7586a20e6cd51dbfeb8e3', 1, 2, NULL, '[]', 1, '2020-01-14 03:17:01', '2020-01-14 03:17:01', '2020-01-15 11:17:01'),
('b66b0653910374f2e2717a17e2689ed63d369c277f4327b99848f8543b116047c0a2f1a6279fb565', 1, 2, NULL, '[]', 1, '2020-01-13 01:57:37', '2020-01-13 01:57:37', '2020-01-14 09:57:37'),
('b84d2e4a2c53a63d8f022adc788640fa503b826c2d1298652a17417700d75b593cccf6ab6073ed9d', 1, 2, NULL, '[]', 1, '2020-01-07 00:11:36', '2020-01-07 00:11:36', '2020-01-08 08:11:36'),
('bb52925a53d038e646193ce085732caf746398b162d6b080ae9b0d222bfc487e534e55869d6a6ff1', 1, 2, NULL, '[]', 1, '2019-11-05 10:42:54', '2019-11-05 10:42:54', '2019-11-06 18:42:53'),
('bf7cfe0b978a9437009c58f65e17b996f0e90c2cfe403be3d79db557d23c4657293938379ebf22e5', 1, 2, NULL, '[]', 1, '2020-01-07 03:14:56', '2020-01-07 03:14:56', '2020-01-08 11:14:56'),
('bfd2e34834ee9b0f955bd2301d9b1f733fac5efb860debfd03e4b20ccb4ddbc880a85a322800f980', 45, 2, NULL, '[]', 0, '2020-01-06 06:51:01', '2020-01-06 06:51:01', '2020-01-07 14:51:01'),
('c10f36bcec79d7007526869e36853bf69b0b6d29da9c9ccf8768ac71c535f7e7de6562716911d470', 54, 2, NULL, '[]', 1, '2020-02-07 01:20:22', '2020-02-07 01:20:22', '2020-02-08 09:20:22'),
('c2a3b39b02d8e96e4ad8a5e568ea4553dbdbaf123c9e44a294da35bcbb74542828f2f22cf6a74818', 54, 2, NULL, '[]', 1, '2020-02-06 03:59:57', '2020-02-06 03:59:57', '2020-02-07 11:59:57'),
('c4f2a3e46fc408de1abe26c2b0ae621c529fbdc74951453ab64698a30abb1c21460d3921459e230c', 54, 2, NULL, '[]', 0, '2020-02-11 03:00:34', '2020-02-11 03:00:34', '2020-02-12 11:00:34'),
('c9055b9ee0552e1daf6d829b20d971498d95990f9e755d4bd384c2688ad22ac3247b9b6949b45aad', 45, 2, NULL, '[]', 0, '2020-01-06 08:29:05', '2020-01-06 08:29:05', '2020-01-07 16:29:05'),
('c9bb0eb6f96a09df449e72f14ab0a9f3df3e8f6a8964c367f1039cdc8aca9707aa2286aa1ac55883', 54, 2, NULL, '[]', 1, '2020-01-06 08:44:08', '2020-01-06 08:44:08', '2020-01-07 16:44:08'),
('cbabdc1ecc4acef56efbc9f55f604d2ab8862759a0cd5da5cac1a0642681823468ac34eacb345709', 1, 2, NULL, '[]', 1, '2019-11-06 05:29:29', '2019-11-06 05:29:29', '2019-11-07 13:29:29'),
('cc0ed543cab375eb4e0837ed9212ac19c9b21970de6777647dd1ffe2cfd08a94e0a6dc01d2f4556c', 1, 2, NULL, '[]', 1, '2019-11-29 02:59:59', '2019-11-29 02:59:59', '2019-11-30 10:59:59'),
('cefb7d014df16d4b2aa6bd065e6939d7d2b1b193a1568add189fbb6d9ecb841dde5352126bc65f9d', 54, 2, NULL, '[]', 1, '2020-02-06 03:54:17', '2020-02-06 03:54:17', '2020-02-07 11:54:17'),
('d39e4200b5a4272f24b3b4a0ecf30829cfd79572ab2b689fa30f6487ffeea12c09c5d0bd754e0285', 1, 2, NULL, '[]', 1, '2019-11-22 05:24:45', '2019-11-22 05:24:45', '2019-11-23 13:24:45'),
('dc410938643022a3341692dd2032cf8a5d54afbbb94566a94099db23a724a57ee777bb5c4b3bdaf6', 83, 2, NULL, '[]', 0, '2020-01-22 03:24:21', '2020-01-22 03:24:21', '2020-01-23 11:24:21'),
('dcb46fc5fb5947fcab3bcc0e59d87c5c8daeb9f57fb8b1afb9934b0255c92f4c9e6c0aafdc025e5e', 1, 2, NULL, '[]', 1, '2019-10-01 04:45:07', '2019-10-01 04:45:07', '2019-10-02 12:45:07'),
('dcc840ed9911577935b1434a7ee1c7d18e60ec9fe0b43ca0f097426ea5118e30392d9d373bf778d9', 83, 2, NULL, '[]', 0, '2020-02-03 03:35:48', '2020-02-03 03:35:48', '2020-02-04 11:35:48'),
('df877e0989b97b8a849739743b8c4054c6c68b074ae216f4f57863b59f47015e6c7fe7c4a066798a', 54, 2, NULL, '[]', 1, '2020-01-21 06:08:52', '2020-01-21 06:08:52', '2020-01-22 14:08:51'),
('e29aae218894ea847173d02eb7fe2e0f1aaacea8c6db01e716de627150fa98df34ac40b4d8064e96', 45, 2, NULL, '[]', 0, '2020-01-06 08:32:34', '2020-01-06 08:32:34', '2020-01-07 16:32:34'),
('e4aaacd6958034404714f4f0f6bd523bc85a633e32a38b46dac5a784484721589d4f0306dd2fdd01', 1, 2, NULL, '[]', 1, '2020-01-13 02:06:16', '2020-01-13 02:06:16', '2020-01-14 10:06:16'),
('e539383d375bfe4caac9b320837763eeebdb2847d46068f6a39b35903aa186fb23d1c01a7e0cfe74', 54, 2, NULL, '[]', 1, '2020-01-14 07:20:00', '2020-01-14 07:20:00', '2020-01-15 15:19:59'),
('e9ae2f2903592522400158e995e2bb2420722e0c12a5dff85725ee879522c02022b3325f00038454', 45, 2, NULL, '[]', 0, '2020-01-06 08:08:29', '2020-01-06 08:08:29', '2020-01-07 16:08:29'),
('e9d4a39dae4e239a6dc4612fd6516d57f30f40c1120708777c26ac7711dde997f8362f15cd092258', 1, 2, NULL, '[]', 1, '2019-10-30 02:29:59', '2019-10-30 02:29:59', '2019-10-31 10:29:59'),
('ea1a6e78fb0ef15c34346621a164fd6dcec1b4f6e06f145e1e6b9e356b507d82faa7ca4e477ddc31', 1, 2, NULL, '[]', 1, '2020-01-07 05:42:59', '2020-01-07 05:42:59', '2020-01-08 13:42:59'),
('eb93091d8392bfb0f0d2b4c334457c879e54314c380692343186945a94bef9daa7fda1de2f65d476', 54, 2, NULL, '[]', 1, '2020-02-07 05:49:17', '2020-02-07 05:49:17', '2020-02-08 13:49:17'),
('ec28618698f81d56f6c087cdca51647e3b042968c1c3c4e64bac0daabcdface695250fe664f914f7', 45, 2, NULL, '[]', 0, '2020-01-06 06:44:40', '2020-01-06 06:44:40', '2020-01-07 14:44:40'),
('ec5180ef6629df407756b15557baa48d0a04cc9f2c07eb1490004f8b97989e123d7eb9d37aab42c6', 83, 2, NULL, '[]', 0, '2020-01-30 05:55:28', '2020-01-30 05:55:28', '2020-01-31 13:55:28'),
('ecbd438f76ae463a30809843ec4335ba934ee346cf36cd8b31d103b98c41aeec41a4cad23bc4aab0', 54, 2, NULL, '[]', 1, '2020-01-21 09:10:38', '2020-01-21 09:10:38', '2020-01-22 17:10:38'),
('f63005172b907588ddb8ae0301031857e58f8ba4e70b5ba0055030e8a639bd3aff868ac1b3771b25', 45, 2, NULL, '[]', 0, '2020-01-06 06:51:13', '2020-01-06 06:51:13', '2020-01-07 14:51:13'),
('f7ac299dbe2b03c915c8d9baf49fabf7c018039401b6934adb93afc9421dd9e8e8fef73c705fa5bb', 1, 2, NULL, '[]', 1, '2020-01-07 02:00:42', '2020-01-07 02:00:42', '2020-01-08 10:00:42'),
('f7f5f47e3b810d897c8ea2b4b834cf227c54597f88d73fbd11893b815072b9c4afd527c4df7606d3', 1, 2, NULL, '[]', 1, '2019-11-12 11:03:10', '2019-11-12 11:03:10', '2019-11-13 19:03:09'),
('fadb745eda1af09e9fe16badf0d5b5f8b2447f149c086edde9ec9c12cfb21459d4ed8bf9bd77798d', 54, 2, NULL, '[]', 1, '2020-02-06 03:17:30', '2020-02-06 03:17:30', '2020-02-07 11:17:30'),
('fcabcabf40d60af2ac2e47dcdd19c753ce13a38d57beec1dafec5ecaea909618d6d1fa21f138ff5c', 45, 2, NULL, '[]', 0, '2020-01-06 07:04:11', '2020-01-06 07:04:11', '2020-01-07 15:04:11');

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
('00f524acf8c2e6f829c98fc07db809e4c48db8799eae4108700f2c269d5d8d310463fb5530525c76', '7dbbaef3709cc361ca10cb893b2bf92605413e3f4725dfd9c4ad5f559867cee060377b5d0cab4daf', 0, '2020-02-06 09:41:25'),
('03b21f58c0085290ec03a53a04775ab07aee4b51443c4d84d88bd785116b2a560252b9cd7845ea5f', '60d80c8484a190b72d68000c3e47f0ac461d3f14a93128db8a101304871bd450aa44d48e1e25ceb9', 0, '2020-01-08 14:22:32'),
('03f9876a14e3d9501db124992856cdaa773407cf12d6e7bf7e9a5f572e0a5d9ae54cf352a46d1ba2', '4a595f91658d68c8ccf74a8510cddeb5355a5e435f55908b173970e58bb0aa235e7de57b47957e21', 0, '2020-01-08 09:58:51'),
('04213e81dd4e5b9edb5673aa0e9300d339debcd39827c4a88fa14a6a01b7a272410eaa7f867c9786', 'cefb7d014df16d4b2aa6bd065e6939d7d2b1b193a1568add189fbb6d9ecb841dde5352126bc65f9d', 0, '2020-02-08 11:54:17'),
('081feb2c686eebd4a2e72b44585e9c8a5e296ca6a3473fa35b8dd7e8db886a86d80a2eca8112cad0', 'b5819d04fc450c131a3efd991e3da4f64ad47cbc56c701ae2be1e2fa9ed7586a20e6cd51dbfeb8e3', 0, '2020-01-16 11:17:01'),
('0d0a101a79b9ad9df50a027eca4dd85a804cc6caa1e671fc1f2cb49c8c8f7b540f1c73d562f1da78', '4f827ea7b2f0920f23dca85c69df53091be436a50963576c7986df1ec3eede41592333750dd9bc38', 0, '2020-01-25 13:54:57'),
('10a8d052ef5a3b5cd6c92806dc18b5ef0558448000fcc20f84968580a00037ce2055ba4169c272e1', '1640aad7b6e19e3bfd7e50959fb7b8f100968bb5e776805219580b3c1d4b48d47354d3c7bd7c4021', 0, '2020-01-23 16:25:33'),
('111c78e8e8b412724adb7d6579ff72c5674f37106208b684213ac8603345609bade17945faa692d1', 'df877e0989b97b8a849739743b8c4054c6c68b074ae216f4f57863b59f47015e6c7fe7c4a066798a', 0, '2020-01-23 14:08:52'),
('12856754477f2b7122d64abd79be4cda27af7568424c232adc0a059f8fec79fbe6ce3d7695a27d07', 'a0d58fca342583ed930307343a285324b01c769606d87e73dd5b7be94322e99822ba2197c31517b9', 0, '2019-10-03 13:02:11'),
('12c5a56569b8e43a5fb028673b94eb4429a07e3abd35dce2e655d38f0cc83d5ad5ff232b35b88551', '775fe0d59e11bfbce51e4b4be649185b9e6026d1b22a3962269d602577091378e4ec5c03ad674894', 0, '2019-11-22 15:51:31'),
('12cc1bcac30d809cb8f95090b39e35f276ccd00ca73aeaa12594b24bfcd9a7f572baac76ce59fe3d', '69c73311da0f134cb52f54db9e5e870edf98bf7ae0ec7041c4c64ce0a6612970ceddccdcde96f12c', 0, '2020-01-30 10:18:03'),
('13fc58a9d4724668027e736bb47b2a6bd0a431404acb1c403a15ca3e6d5c70e720d59707b8508a08', 'f7ac299dbe2b03c915c8d9baf49fabf7c018039401b6934adb93afc9421dd9e8e8fef73c705fa5bb', 0, '2020-01-09 10:00:42'),
('1780152b4d5f52599f8037a367ca404214a78324c80e2dc1ad17404bc2fba7e99c6f77f63c98df4a', 'ea1a6e78fb0ef15c34346621a164fd6dcec1b4f6e06f145e1e6b9e356b507d82faa7ca4e477ddc31', 0, '2020-01-09 13:42:59'),
('187e58c8a3436173873f99c0f3bc3c163713719842edb55eb6762a4d0fbed5fefa535ffbcf6c4a45', 'e9ae2f2903592522400158e995e2bb2420722e0c12a5dff85725ee879522c02022b3325f00038454', 0, '2020-01-08 16:08:29'),
('1c3a02436e467f3d777b8846f86620ebc6f85fa2bd8260c0e596dbcb33e9f40183208b66f2ae7aae', '416d1a39370961fc70be093f109f255c2589788ef4edb7c86a3e83e8fc892eaa0a053ff10c564595', 0, '2020-02-08 09:26:47'),
('1d9aab73ed88f094078cf8e879e3d73b30c98d5627bb7eb0bae03ac6c20f7c525c464209a2060293', 'bf7cfe0b978a9437009c58f65e17b996f0e90c2cfe403be3d79db557d23c4657293938379ebf22e5', 0, '2020-01-09 11:14:56'),
('1e91f3355ad9be4d4c388cb734ee5b4f22dbfec6c725966514608acae24446f614f163420cfbae3d', '501752ea80673e495307125fab5adac262d91db1c4bafddea45c0b0de27fcd773521a6912df688f4', 0, '2020-01-19 08:01:41'),
('26cda5c95e40dc8f586c775ee36ce7546a77d2ab487fea926f673e8620013d31811ceba85470a92b', '328bb22f961aff0f50e97c4f860bd99cfd6898fda54c25fe0a821f2b815c97caa935b3c0116c6798', 0, '2020-01-18 10:52:44'),
('26f99f103a2e5653e058a1de272acaf01f0aa23de8452fc61f5329026eeec1ba3839b2f45e51ef08', '8dbfda5fade4ba7cfc46b6928f1c34317683dd26f335f33addd81e0f8c0b3d987f8457bdde422f2d', 0, '2020-01-29 13:56:40'),
('27c67d05b55f7931b9a1c96b2e1abf70c8cb2a18add27f458cc175da21fe2f44b698736a4a5a0f87', '7ac6cf61ddf5443b95ef006881b495cba0514d37b19d1fcb450465cabf975b0303a26964b7560af8', 0, '2020-01-16 11:17:13'),
('2d9afd0d8bddc0fe9ff99cbff70081f69e9f9be8d1094dd080a04d6450c71de48079999c9b925c9d', '27f4db1a3c2160bf66fcb8162fcdaea632851bd73d592a1b1767a1f292474ac0889cb299b08a1dd7', 0, '2020-02-05 09:23:51'),
('32025a9fdcfb476c2abbfbd23c2cf1de80c01d38f4b30d7cbe76a485baf7e40ab0dfa00017b874b5', '15c84cbcf5f583ffd3f0999612cc4b9c5e980e41fb37327fc43db25f5c0da6f430862f1c450fd42a', 0, '2020-01-09 10:29:14'),
('33df702727d6c45a583432c2ef19e40622460c96568fb53ab85f988c5d2e7ca679b197dcf828776c', '72a9e4e225bf54df5100152280f127d24c45d7221670f30e68e2e349eb330023c54f658d6d4bde05', 0, '2020-01-22 09:09:08'),
('34a62ca2bd31822c3cecaa9d3ba4ee7335ee198cceb8e46e77d689217daeeae8973acef1cdd0af58', '681dd32c6ee72ed66f08f2e51eb2a99cc0ad1c19e7120c10e4474618e5552cf5af2466fbdeae2433', 0, '2020-01-18 09:55:30'),
('39fc0a2737cf35af9c121ca519f18f6eaa59544a40f009a3b56691a87a766041547e4e8d21d6093a', 'e539383d375bfe4caac9b320837763eeebdb2847d46068f6a39b35903aa186fb23d1c01a7e0cfe74', 0, '2020-01-16 15:20:00'),
('3eacd605b8fe7e3c43321e24c59b8c448f29d2b5e6b04575f059263c94eaa0ee6bfb5723052006a0', '0b95ec62969041401da4305f98f0d693e2a1b9900030f1d684b0d67cc0e8f028694424780857f46c', 0, '2020-02-09 14:25:16'),
('416d0e20fee22e2df75dcc7361b1b73678f60840766ab48e0f38a29728efa68c7bccaf0adddd94df', '4054d4641a18cd398a77b2425ecec2fc0fd95858f065bdc259ebdcbca50c979590a8f0bd822cc267', 0, '2020-02-05 11:33:51'),
('416e8434f0a94916956da8356d802405380a754a75cbcdebef5502ad9726d7120383f9611f725e54', 'b1262ad5c70641939497e3acefda24955f357a3d6730fb0d020aa9f205a5ae7ff63f43a0a5f1ac04', 0, '2020-01-09 08:00:45'),
('43d9e410283ff7db250334e9b4fc6c8dda93a2525dfea40954dbc204eee55111731f9997a20b82c0', '386b1ca68243bcfb7ae8a2e2525d0dbfb13cb769a95f7d41a6d4e450aed24a2f16bca1d37e18fa2a', 0, '2020-01-24 14:31:26'),
('448a4a87a42ddc7d57c3b5fb1977aeede180a92c40b44a17f1ac1e62d0b730542ed1b126f7853e07', 'fcabcabf40d60af2ac2e47dcdd19c753ce13a38d57beec1dafec5ecaea909618d6d1fa21f138ff5c', 0, '2020-01-08 15:04:11'),
('4724209546bb03d0006eb5c37ba34b4edf677250beb38ddf839854cd9ec523ab42c3bb359e5ab342', '14ea62a76df826db94fcc868a58b40a8cd50bf75cc65a40ec54ebe3205aaa2a265099cd936cb9ff1', 0, '2020-01-08 16:15:02'),
('4796e62235b27ae59b45a20d028ff07ca5a1edf7c16da455f4b49b56c2372770d2ad9a8af738cc9b', '6a07dad26886203dd97578817b24860817f3581b6c1fa80d9a051784ef4f5c3d48ff3fc6a82d2bf9', 0, '2020-01-15 11:56:15'),
('47da8cb912590c75c383d7f949b3958b6e25df525f492ddde7d166891fef05e3b0d217795949450c', 'a5bf85412c071d51529faaeb39b936479c4526689e97117f08c1e51bfa5ac8d71a5c22cfd4332362', 0, '2020-02-12 08:18:37'),
('49428aa64daa252f6315f10af69436d22ec55da73836eefc10e733c1339e381fa69f25e70866f9c8', '986ef8438be11fde214c5bab2580986490ddd5ef9f3a7768d1a19adea2852274f72eb2eaa7b9128b', 0, '2020-02-07 14:27:13'),
('4b908ebd4cd160bdeaade8601e23e912319ead12b1e295d6b370a3c77e26ba66b76d593f887a42a3', '460a789c3260a3a8dc677f269e9b8bd9dcb01cbd20fc6a59274282ded655d14c8db42c54b557c0ec', 0, '2020-01-22 16:54:49'),
('5020dd1cc48a0e8ed9c6fa4cdad8ff7942db4ddf46bb38a60cf3799f7aa1ecce4993fec6abd9def7', '8d99dceeafdb480bb5c4a002ea355619f8bd74756929886fbac22bb6d1a71603aea6c12ab8d87887', 0, '2020-02-08 13:45:04'),
('5086c3fc5981ce3bd35d8dc62a2793f61a9bc3f9741acd5ecd61bb0b1b74572b2f4f9d98ab570366', '0e14480af10ac0d7e5a755eb30d9e675492515b95aa39df7a684df3ed79cbc0dcfd1f4360ecc60cc', 0, '2020-02-08 11:53:55'),
('51862ff05c997a745394e90322e721ecb7b49ccafe6e03086fe65f702f1045487c449375fa84109b', 'b66b0653910374f2e2717a17e2689ed63d369c277f4327b99848f8543b116047c0a2f1a6279fb565', 0, '2020-01-15 09:57:37'),
('5237589b2270735a4f2d8e3a46b2baa4916c446af7f9b2f676598dc4d4028fd93478e7c17f295c34', '3a5324b9306ac6bb55ddd1cdb28b86b0985610d00d621c959d105b53f344eef47b4cb0317a4523bf', 0, '2020-01-08 16:39:33'),
('54a16bfa7520e7712e90525e8f1b6ebe8b93626f25ffba07fd0db727216abffea11b4035af49cf33', '38eff98bbdc23df9bd116023f5a02a9dcd023ae582a28ed0a65cf4524257248ae154dd93684ee758', 0, '2019-10-31 17:10:11'),
('5553e9eb0964a97db8c141d152780795f0dc1c84309a3d845f79cd676bf37458b07485ecc1824022', '34daf5cc96db9e44516664435ff78325f722aeba22192309dce79a9af5ac27dc70f3406d8e651178', 0, '2020-01-24 11:47:38'),
('5720532c95f8ff97c592214e15ce7cc0e4ed5a0a60305c85a0a62d869e542c3f1215618d8210ffe1', '20d5a18cab59558c7fff6dd06f79f4ec8f4955c04a5c5feffb71aaf7cca7c06789c09879d650dd3d', 0, '2020-02-08 11:28:13'),
('5e0dc0fa3110f1ed1c3fb73f25da72478273cab4fa3809d430c02c54d72943b57a1ab3359249af66', 'c9055b9ee0552e1daf6d829b20d971498d95990f9e755d4bd384c2688ad22ac3247b9b6949b45aad', 0, '2020-01-08 16:29:05'),
('610996911c67ffb548bdef3d071ba31c64c0351001beb6df8f1c0483f2d4c4aa3a4a30632579deba', 'c9bb0eb6f96a09df449e72f14ab0a9f3df3e8f6a8964c367f1039cdc8aca9707aa2286aa1ac55883', 0, '2020-01-08 16:44:08'),
('6165f31effe3be171736b8385ecb866688089ec7b56685313cff90061a9ace2f91f5690cafc313d7', '5418ff4388e2fec30f279657fa7602d9b2f881e2dd258211013c220f83c99db545b733973c524f99', 0, '2020-01-09 15:52:06'),
('616fccac7669bf5b2a95b4c0d48b19e017e1a2a78fa3aa92aa23335cd59908535292d9abf157f059', 'fadb745eda1af09e9fe16badf0d5b5f8b2447f149c086edde9ec9c12cfb21459d4ed8bf9bd77798d', 0, '2020-02-08 11:17:30'),
('63a20d436a9985ca330318cbde4a63963484541d7bedcff54542eb19794996ad8c7cf70a46ad3e96', '3744a0a40d715fa352614f43143f62cdaaf70c466af864b0c6371e75f857f45cd6ac92f7b1120c63', 0, '2020-01-22 09:09:06'),
('69ab7959045146f37a292d6fe223948d580ff3b55ac8a0f51796b622d0f815b0e718d8ab7b675516', '1f89fedc12e045c8c70afa2064c4542e7a69cb4e1d19e6b5ba53cd9372a2bf6a3192cebb1590b14d', 0, '2020-01-29 14:03:32'),
('6a09c72013cabd8fc302872ce86d342089cd296dec2a30571bf22604a030b1a949cdc405501cdc51', 'f63005172b907588ddb8ae0301031857e58f8ba4e70b5ba0055030e8a639bd3aff868ac1b3771b25', 0, '2020-01-08 14:51:13'),
('6ac07451c730cf037962dcd9a3bf6cb69f06b4700c62bb8811739f9171b8b8c6c2e70dd1ff552767', '1ef847fe4fdc29641e8f3522fbca664930bd5938ee0f7984f6f26408848c73f20ae8c36ae45bd57a', 0, '2020-02-09 13:16:59'),
('6b1fec329c15e8e198245f91ac6c7e8f03bb53347ef6c90199cbcdda8eed4baa9577dcce9c9d1320', '769ec743db1bfbf57d7feb16f49221a3eb0b3dc6df8f3666bba71a7149b21b444b84361ec5116526', 0, '2020-01-23 14:27:52'),
('6dd6edf03e274fa533c601699a13249dc8190550a654a3f8e90b5a8576c14f889db02f7db7258353', '8dcec8784e91d0158631fc04d3b498cee1f6f78113e0aa6ff74627b27f030a30debbe5da8f485d59', 0, '2020-02-08 13:34:06'),
('6ea86d48a76a9df7f277041bdb537d5d3ffbe5b976775d5ebbfed3014d2b45ee9c23d262b1538949', '3503294c2cf54d5b93fac89bf29dc3c20f9f4055f38b5bb5bf1929ad441addd2d4ef6cbbf73c06b2', 0, '2020-01-08 10:06:08'),
('73c396a2d1df2b3ef749e9876452436a6350ea3cb46ee69cea62635b72f2bbab3e23db8e8c93a753', '3d7eefa3d7fbf6b9485a7ebfc3b5f6b7ff8f70db1eb79f3b05a4f97f1bc1353156dacb1a64e8f427', 0, '2020-02-06 09:26:42'),
('74ef7de631f8ae31798e6c3d24c65f2942a71b42ddf2abea71f97501939f894e28c0bc486491ce4b', 'e9d4a39dae4e239a6dc4612fd6516d57f30f40c1120708777c26ac7711dde997f8362f15cd092258', 0, '2019-11-01 10:29:59'),
('756b3e3b45c5fc8730796d9afc7aba1309385939614fd1fdf15174cb835f38d17b7bee2132334a4c', '10249abdc2631d924135967a01920d9b6c972c3c199ab39174186a82c168a661c079354bc2bb8702', 0, '2020-01-08 16:41:34'),
('776d69169fc8a077a141978cf4639f912243ff1baf237815cd87633e30135f4a11bdcffd14edaedf', '41ac89805b7338b5afdb73bf20ed12bbc68395be0f3d69971ce19b905481e82f6b8c22e89c88e4e3', 0, '2020-02-21 10:43:10'),
('776e95525c32010c3f9bd34c8c7f17b8b497e608c85087bc6ccf9eb6fc142e850972f0b54f60b1ab', 'c2a3b39b02d8e96e4ad8a5e568ea4553dbdbaf123c9e44a294da35bcbb74542828f2f22cf6a74818', 0, '2020-02-08 11:59:57'),
('7b60dcfee6a67fb6e2e20a96f1f6867aba65458289667ed36839eb8da24934ad8453fab269b835d6', '775cd47d03e94d5f95da3f8837947a7a0b023c95db1f30378da6bac97a766ac2941a142040361f0d', 0, '2020-01-08 16:06:46'),
('7bae36c1aa73a53759bfe93d5e26bf3bf8a3f31ea996c26e3eba3f151ca80214dd07c845c4ac22f7', '3ee6794df90f4b3d00a927608fac24f942d1a00adbc3b13516ab192b543e14911604236174ea30a8', 0, '2019-11-27 10:17:33'),
('7faf8ae17ce1d69e10dfcc61e3e7933f017536b8d638956b2cc19c615616bac459e55aab9e1c34bd', '0bfea31c38b44106f22816938559de3246d6942544ed86a9ac62908173d53c3234364a80dfccc5e6', 0, '2020-02-13 17:02:33'),
('806de6db9dcf3526eb08971ed8323fc81ed900719f7173437586f2a076bc7ac878659f1795d9b663', '99948b0af1b44c86b279432d26b62161a73d6381f7fb371390863ce0bf308efbf57a5263d84ac7e5', 0, '2020-01-18 11:08:09'),
('810f7013911e78b5d1faa645176cb1d61ff339edb2e244761b084845aa64886ad7fba992c2ee4398', '22974f6cdc137ea0f55fa105575176519b79a79f707a3cfd652f22028cbb2de645708dbc73803857', 0, '2020-01-15 10:01:50'),
('81ca36a634df638d7b2b6f16142d9b5b64d35065e341395be919614fd453e976018aa2a59fcdd414', '8ed62d88b9d0b46c8386716d7b3b5a86c99dbd1a59754737f918e96a8fcb228b5fe94cc60be38205', 0, '2020-02-05 11:35:51'),
('8395a700be6ce955fe364ae5cf5342051a346b2fec2ff15c6e535252b3936b352b695d9e717eb08e', 'a3f4e4f55a4a67e65637dd75e5c4556dca5c8f2497bfaac089b495c6c13f3690ebb29b332eaf05c9', 0, '2020-01-08 16:07:36'),
('842b7bf861c04830dec402af5ba632bdd7e6b617b5699c464c265fb012faf751246bdf6df0f2b214', '4b568036285cfaaef9a830d9b899db07e7eb21fe68c4b18f898a2becce15d9ed342a5ea35f423167', 0, '2020-01-23 14:28:28'),
('857b6592d7ee34c9d3362b2a168563b44b6139e7737ddc143be4869b36beef7e7c129ca022d43330', '402755317925cb3af8ab5c09888b989b9ed0323ef468544dfb0dd605a14a7528890f1466278625c0', 0, '2020-02-07 13:32:58'),
('85d674636fce899d1656e1496cc817e81c030f83af7dec0da3941b219f1f42508d345ce773f6b4df', '46fa4f9a5d31074e410984db06f7b58ba35a4f43b26e0bb2fc73e18ad784fc28a24958908f81e332', 0, '2020-02-08 11:46:47'),
('89eb6fe07b1713a1cecd0fd241cb7db549ef42cf991a943ee3d285ee78143e03c54e7f1bc15dd718', 'a3def1366969d50a7560eb9a0a4803cef77cd2936a66025cce72835631c41fdf7795eb70060deda3', 0, '2020-02-19 08:51:28'),
('8bc49f7be2744ccc323315fff5636c3c43ae468dab96eb65519175256d6038533f45aa960ac73e80', 'bfd2e34834ee9b0f955bd2301d9b1f733fac5efb860debfd03e4b20ccb4ddbc880a85a322800f980', 0, '2020-01-08 14:51:01'),
('8c1522caeae74d29d4ed23b8de3a7b6345971b9cf2b3e0c3af1499a944aa29f5e9ebd23a3023937a', '8eb64537676ca7642050f14866343424fa486c489a0ebe44b3b16deeb484ea9ace02307e13435434', 0, '2020-02-13 09:35:16'),
('8ea370050fd494aa5fd63ec168fc3d72a01ea60d81170387d6532a508165300beecb5869bd2fe519', 'b5121afec7bf5f6ae1f4d02ce605d4f12fb3a2a88410baa5bf6d8cf929f94bc762212008dc50dd9d', 0, '2020-02-07 11:05:19'),
('8f7f6f7af99c535fc5c3705b47e48c799dfa9d78cd44daad3aac4972fbf95ca3da01d0db998275d4', '090da00c2d04b0f6480ac0876e6f03de5107f19dc277fffd81179d03e8e8b90d617e7a7ecb19c2b2', 0, '2020-02-02 08:33:49'),
('905807b09bb345956342831127414556a7513ac4476521d4ac85d8d0e739dc26ab0ae523ff259ccb', 'c10f36bcec79d7007526869e36853bf69b0b6d29da9c9ccf8768ac71c535f7e7de6562716911d470', 0, '2020-02-09 09:20:22'),
('90692da78186a491c39d70c2443b2be8afeaabdb1254aee9bfef43dc7842abb6bd7d7737e1510900', '29c1ff53b756254a446760a2e89dffe703d27effd4d86b03d05b630c4ac541ad25bd216a750b2e2a', 0, '2020-02-09 14:24:05'),
('90c44904bca76f4b06934720da258207fee8047be6080bb93da123c461bc183344c8df884f1dcfef', '7088ed4b237ad664130080851abbec0c9d7365a51e8a5fb45a0de0a7e4c8fbe865993e29b16407b8', 0, '2020-01-12 09:56:06'),
('9134a644af6e69580e94d14116fef53308799174f18d52121c7fc221b92c0e6f7e82c210a45c9e2d', 'b34494e6aa4133cd09d491b2d039fa9062ab66a0fe30db7e98c457cb81408fbd6a662289800d83ca', 0, '2020-01-08 15:52:06'),
('9235fee9af58dbf56688faad4aa56526a66ea727371fd43ba5d32041bae981d5195058c1eb71b81f', 'bb52925a53d038e646193ce085732caf746398b162d6b080ae9b0d222bfc487e534e55869d6a6ff1', 0, '2019-11-07 18:42:53'),
('9585d5e562899066652cef1c82fde3e88ef2457a52d0dec183bd6f919cd1c0dc4683bbdb9e8dc4e2', '77d38fbe4424eb1acf81ce06ebf4211232cba39bf0d5616e18a77fa586cf61760682848eed8c2ee6', 0, '2020-02-09 14:14:41'),
('96240b36d3aad0be111e6939f55cde7f4fbf547455a331d707a968af1864d644c102528f4e065c05', '8acdeae57079f2a949d6ebb0dff398f925684636888d88f467cdfd867e7231a98b0974e888d64198', 0, '2020-01-08 16:22:34'),
('96fba27e9dc8ea444e84e0bbf3e9607acb34103bccc5b4c52e4bfcde9b825e8fa66db825acb22309', 'ec28618698f81d56f6c087cdca51647e3b042968c1c3c4e64bac0daabcdface695250fe664f914f7', 0, '2020-01-08 14:44:40'),
('9bbad4ef50d6f46cddf930dcf2fef3cf9160568cdb289f7182afa8a25c82fd14951208f9a3094e7a', '1cd09c7499186a0a9746b4650bc5c018dcbf96371866d5e3841dc23df897801fedff676c592f61d7', 0, '2020-02-05 11:26:01'),
('9cdd297cc131b34d0732390ee435479b1c038141e01b1799f07508372475dc6358ba85baa358d0ed', '513f3c7e21c485e8787da5a4450b2ff902beab8934eb10abab064214059b27e51a6ee4b5c262c3d7', 0, '2020-01-29 15:02:08'),
('9cfac54e496518225fb963ffe1ab8208db8027ffa8fde86cf7fb561cb38b1407d0c9a1882bedd941', '09cf151d104a5018d18b28b14caa6067ba355321e986497d287f30b0d52cd48f837fdbff35de0b22', 0, '2020-02-14 11:14:22'),
('a15d63831b4a93f75457bdf7ca02e0f35896f46cf740e73a3172db2ab4d0c63ba6d6d2ca8ae46c3c', '6d6c409a6b40cb28dfdc044ed3e3abbd045c7fb2f3bb33acb396b6288f61f58694b5fb2784e5b24a', 0, '2020-01-23 14:28:31'),
('a1fd69d70e706bbada5fc96ed7f0f56875863b4a1b83033d0fa4c33de6137f4718add99eb2006b7c', '3a9149b5eb4f79a37bf45304c800e549fc65e6b956e1c103a7393b10f3b96934001b341215f2cefe', 0, '2020-01-17 16:35:59'),
('a3182f4e6a707c356ab02b39c6bd3a1fc3a4fd942f74c5392cec956a0f9554903019d8bfccba2305', '2e5d650ae6a528e6497e9ac7558f7fbf310d71ef52b5b0148e1da3bbb6065b3d83855a3a76dccf4a', 0, '2020-02-29 13:18:34'),
('a6ac0250f010af609f45b3dcdc5a6aed389d87f23ebf39c3058b9d092125f53145048b37c986b34c', 'b478e9ce17eee2e5d57876e6ab339f6a256e7e2915f3810881953f58496ffb1db34e90e31a381941', 0, '2020-02-05 16:02:19'),
('a77cb4e6a036c8efe89127f27a0ca6d3e84dc874bb37c033ecca8c0a081d80c0ac447595fa2f5153', '1eab20567ff664d2608537af844bd316b464151e05468e6a2998f9cc73e9d11445375ca568229fcd', 0, '2020-02-07 18:24:24'),
('ab4b298634b43438f9fbea96f740e5d44d5de8ee4d199a692b7b859d1b592e747452a24cdef26a29', 'eb93091d8392bfb0f0d2b4c334457c879e54314c380692343186945a94bef9daa7fda1de2f65d476', 0, '2020-02-09 13:49:17'),
('abef8c5ce9909f2873eec18836df43dbfc9bb9cc9a285f3e063242e484ad0376b54adb4b2b6a5c0d', 'cc0ed543cab375eb4e0837ed9212ac19c9b21970de6777647dd1ffe2cfd08a94e0a6dc01d2f4556c', 0, '2019-12-01 10:59:59'),
('ac192d1ba9db55b1397abbbf40765627673c665c1034771989cb91f9b27d5338f59b49791b67ab73', '42e5f842a3493a0c316c52965ca81833b5cf9e506e509b9953d7cc3f3e11ea67377ebb311d1b7232', 0, '2020-01-23 14:28:46'),
('b10ae9c9b2824b6d6d668d6b22ab79569723a01e9202d55ad39a9ffa171c089cd79722116f4bd53b', '7fa66f972273894dfb81992968bc218bb6b9f777d4cca972e2c8868e2b256a4a1be9967716fa995b', 0, '2020-01-18 11:06:35'),
('b3be75f9441eeea106301f7101ef20f6ff88e84aa49f92933a60290c4bd6917477a7979140b536a8', '7061470337db29eb95454273d29860c57d80365ea2930d5d391ea0090299622bb60f6b2c5f30407e', 0, '2020-02-07 17:18:45'),
('b418a518662e54841d19a10ebc59777887742892c530e58fac7ed1282d9adb2ff83097655b7e0410', '580d0bd18c17f241fe1d2647f1c3c12d6bb604a0061b429cf96797fec5a480e7d3211dc1dfbe66fe', 0, '2019-10-03 13:01:50'),
('b87cfa93312504ead7f6c1a8579e2cc0f21a135733b87f50ccdc3cb78ee5ff82cef8ab310707af9b', 'c4f2a3e46fc408de1abe26c2b0ae621c529fbdc74951453ab64698a30abb1c21460d3921459e230c', 0, '2020-02-13 11:00:34'),
('bc3612a37bf2e8b0cd7607b828fd7dcbfc1c3f4cc3464bd13447b37829f29ca8ab7451dd204b9e0c', '3bb6ec8fce9ff8e324438ee606c9b262c29a7ea702ec2256dc387c5095d953e585b1b3b98a78d30c', 0, '2020-01-24 13:46:47'),
('bda8ffb929cd2120c8dce090315e9144709bcb943bee8a4e309afebec0d37cad194c9aad7dc4f333', 'dcb46fc5fb5947fcab3bcc0e59d87c5c8daeb9f57fb8b1afb9934b0255c92f4c9e6c0aafdc025e5e', 0, '2019-10-03 12:45:07'),
('c2ba64f47215ae105a087cdb8e8f35139ee9b63208f6539994a120660e5bde0c2c19c97a88ee5472', '2cbbe019841a44586a783e8f2e70a3e057bc39af319f4fe45c86fe4984c8e9f31dee773e8f2cf632', 0, '2020-01-08 14:52:54'),
('c70071c00d713d5785c4ca88c8793e3dd0b49f2d9eb5b4c8334feb3ad0c95125ebd08a13e27fbe73', '33efdafbecbbb34ac0a44752bc725b7d0a599105ac72b013a1f0bac99481b125d804c43e75f66ea4', 0, '2020-01-15 10:06:40'),
('ca73c5f7e88b01e7afc02e5f69c2eb1380e10cbe559351eda18768ced4b4dbe63e410c3e1ea473b2', '7ceb4da5ba0dc637fb6a126d491127666dc375592cbc59b8997fa1c44b5bbffb871c3fb52104ac86', 0, '2020-01-18 11:01:14'),
('cb8b11fcf60eb7ac353d964accfd15cdbf1a9fb196286d7b28314183756f7ad8f09a1a6b2b0b086d', '092505ffb6c4a1c91c72382d9318063c3780fef8be11a80da0d72c5b941074e1ebd5caa3faf38693', 0, '2020-01-08 14:59:50'),
('cc67c1a486d50e40df6dd03f71a159ae9211d236b12a68478ab0bff82e8b5087c56b94a778480ff7', '8987c8ff216e13fab967ed4cd42f32739c466b00306e9a1c0d7445fc67d7ef767f68262445057f9b', 0, '2020-01-08 16:33:56'),
('cef0c910c3fb35ffb3b2ad29f4cc39bcda2dec215cd3b8537d76d423639f25b64c39cefc55d037e2', '606847590fc16c545903017c9cce260d6739ceae79281f09731b2b68c2e2b79828894a37ba78964c', 0, '2020-02-05 11:33:49'),
('cf464a7f3397d49d03fa59f9cfb77b66b12e6f843dfc3528727d97f0a7df3f949aa3f0d3088d1ffd', 'ec5180ef6629df407756b15557baa48d0a04cc9f2c07eb1490004f8b97989e123d7eb9d37aab42c6', 0, '2020-02-01 13:55:28'),
('d137ac5608558639cce926dec8c68fbbab9df05f6542d8caf5daf174eb7064037677408e5149783e', '9f753360c7af8857fcd5d81ca912ba810911f73a9bdae1becaf7527451cd2cfa9d2f8ba5c05f90ce', 0, '2020-02-05 09:25:37'),
('d34a32daddbffa8bdce3c89ffe169b3e69d3686f0320e440dbfa3d2d5cf737f6d44139165d9a265c', '9285f46604409f3a93f88620ba00c63bf067cbe281225b4f4d7ebd6f923914be2b117e33687d3419', 0, '2020-01-08 15:13:22'),
('d474452397e529a0f79b909618e2ee2b1b13271f31c889ed9cc0717574bc27c712d3dab6d0c4dbb4', 'dcc840ed9911577935b1434a7ee1c7d18e60ec9fe0b43ca0f097426ea5118e30392d9d373bf778d9', 0, '2020-02-05 11:35:48'),
('d4f3a4920d9fb4e20fda0bfadd16b2e7e517e6bd6d7761fdba71b4e1a206881170e87ceb80d0c0de', '1234a05ad7666d40a929c0bc2d7564a5dc661a6be9d87fc923962b66171ae4307597e759f5fe2f6d', 0, '2020-01-08 10:08:43'),
('d8c36d4f847419c1653f46c351e2ae5d2615ab4fbede486ac9cec1e8ecc9ed69385a8393225ae665', 'f7f5f47e3b810d897c8ea2b4b834cf227c54597f88d73fbd11893b815072b9c4afd527c4df7606d3', 0, '2019-11-14 19:03:09'),
('d9644871fd67c02f76edf2c21170ea4dce7a427a92b0f645a3b5ec047b88e0c90014d59d6ef34ec1', '4afe3002a6a88a93da8d5285658f7479a14b874bb2833740156c9a3118b4c26504b4bc85e06f0c17', 0, '2020-01-08 14:46:31'),
('d9efc80bcc24b5d7ddc4064d2c397e8ecac463219c2cdf8789edcbd58fcc380b7ab6df4f09857b5b', 'dc410938643022a3341692dd2032cf8a5d54afbbb94566a94099db23a724a57ee777bb5c4b3bdaf6', 0, '2020-01-24 11:24:21'),
('db219cf67d72d27f21e6ab07d355af0b52543d2ae81370062d47aed556ea5d599e7e60ffc337435a', '3d9068d02256099296f6093e6a07228f74c212a8b363206452b87f4213a7af0a239af5104fc30dca', 0, '2020-01-08 16:08:27'),
('dec2f88e352944eefa21c0c1de150d3d94d02d6b48a294d666be8975b9c810f1375379cbfefd2679', '3ede9d94edde0609d3559c03feb47f73d73414cf86b922f0ddab7fd36a49e4dfd46545147345443c', 0, '2020-02-12 13:48:15'),
('e4c59a26d94a8a4969b50932e630f692bcc8feb8f91e26cca41487ff03ee5c17eac14effe87ad78d', 'e29aae218894ea847173d02eb7fe2e0f1aaacea8c6db01e716de627150fa98df34ac40b4d8064e96', 0, '2020-01-08 16:32:34'),
('e522866110d586141b17426cbae00c233f2b496efbf6adabef32d51a8466c36a9b0e823548fa7c4d', 'd39e4200b5a4272f24b3b4a0ecf30829cfd79572ab2b689fa30f6487ffeea12c09c5d0bd754e0285', 0, '2019-11-24 13:24:45'),
('e79b7a22814deb3cfe317d395b168e2cba1e8d0db46416ad493edf45456a96befe6c483ef8b0987f', 'b84d2e4a2c53a63d8f022adc788640fa503b826c2d1298652a17417700d75b593cccf6ab6073ed9d', 0, '2020-01-09 08:11:36'),
('e91b795bfe763fd961ca8838375d3da619f98dc75b860b8ced542bdf7fdedceb6d613a22794c252d', '818881ba8764b40aeaf7fa6ee4d20c3c52a70802fffc83ff8261300393bbf1c094991ed13706c26b', 0, '2020-02-12 08:17:37'),
('e97078ebcca066ff671f9cffce5a48ffc246879eea783b5b46ea60767e5870803606c566c0815c43', '3ad4cd734585e3bc19184d0cf1a35bc2e96313b60f32eac6a54a65b44b279cc9a7b55705f7ab75b0', 0, '2020-01-12 16:56:29'),
('e9dd674679f9c6fe3ca0f82f76f5aa212d97de14e89f589343c72a5391bba5b035bd6a0bfbf0e1aa', '40d4a118355f273e0419132283bcc4a6510017f20432e1c9b2ded6081686ff978d0510382ac6fcb7', 0, '2019-10-03 12:43:57'),
('eb6d234555bcbeeb56940770120c70149c1fd1aa7d59086269245087b922f1b0656ed11012048921', 'ecbd438f76ae463a30809843ec4335ba934ee346cf36cd8b31d103b98c41aeec41a4cad23bc4aab0', 0, '2020-01-23 17:10:38'),
('eefd526b36daf4efae0cc8fb03746e0fc278ceb18bcd591aa0b883fb7e7c0647c4796b80d951f483', '2e174bb1bafbcaf589507e58579a1009b9ecd25d85575b6ae059bc8c8ce5b74f46d8088da9574e87', 0, '2020-02-01 13:24:21'),
('efd16dc4a8626175f9dab76de7562b89c566eef6f4756df19fb417f61adcbcfb1d91ff7f0b573be2', 'cbabdc1ecc4acef56efbc9f55f604d2ab8862759a0cd5da5cac1a0642681823468ac34eacb345709', 0, '2019-11-08 13:29:29'),
('f2c9f6ab7d2142a3d65b8e0f1587e0f97a385ce96927a0baf08925c6f98456439a25c3f06d70b0e5', 'e4aaacd6958034404714f4f0f6bd523bc85a633e32a38b46dac5a784484721589d4f0306dd2fdd01', 0, '2020-01-15 10:06:16'),
('f2f2917a19c3f3d9f1e9d073f4ca0dda6ee399240de943dca0277f61a49f8ed4768f242247d06a2f', '07c88259f3bb06709fe8836d9dec1029b7e031fa732280250b292e02fcbed871ece3b84151dd1d11', 0, '2020-01-08 16:14:41'),
('f6ea469c3774e5bdeaaac72967c45094d27af9be7cfbd33f6d2f5765a501a08c463f2cac746094fc', '61d0c361b589717d2aed1fd3688682a5af0dc87be9dd41e8c9146db3f222e469469892cf389145dc', 0, '2020-01-12 16:53:40'),
('f922508d134088b25d20ea7bde3f994be284767fc8158010b075f0bd1cbf02ec3b1bb86b1526b86f', '8975433b299018f77ba3ce17686c0d32db5c44b4b60b1ec387e2d4ec407513fd4abebc55e8565004', 0, '2020-01-29 13:58:21'),
('fd7d02065b2a01b4253d6c5571528332a20ec921c647529d88f710ee55f8b9bd3ad5dd280c489048', '3474ee47beee4ad27533089f2b859623e18790728e38b252c3db19297cd5d3ce14c1a3329577b0c8', 0, '2020-02-12 13:20:30'),
('fea54e6918a0503a1922e9f249036ab3c9cbcacaae338775380093f4c31f0c71125561773724cfbe', 'ae1f23d27c3a96c5a6f9c421023cac0c7a030b2f4cc3b57d217e3de0cf76531132ad5c8f178f3470', 0, '2020-02-07 09:49:21');

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
-- Table structure for table `tbl_activity_log`
--

CREATE TABLE `tbl_activity_log` (
  `id` bigint(8) NOT NULL,
  `actCode` varchar(191) DEFAULT NULL,
  `projCode` varchar(191) NOT NULL,
  `activity_desc` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `deleted` int(2) DEFAULT 0,
  `created_by_id` varchar(191) NOT NULL,
  `created_by_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_activity_log`
--

INSERT INTO `tbl_activity_log` (`id`, `actCode`, `projCode`, `activity_desc`, `type`, `attachment`, `deleted`, `created_by_id`, `created_by_name`, `created_at`, `updated_at`) VALUES
(8, 'F7KHNNOEUCG1', 'IWVTT0PVDF2L', 'My Description for this report!!!', 'REPORT', '1', 0, '2019-1008', 'Employee8, Employee8', '2020-02-06 05:50:10', '2020-02-06 05:50:10'),
(9, 'KZJYMCKJNEXH', 'IWVTT0PVDF2L', 'My Description for this report!!!', 'ISSUE', '1', 0, '2019-1008', 'Employee8, Employee8', '2020-02-06 05:50:19', '2020-02-06 05:50:19'),
(10, 'I10ZKBUHBO2Y', 'IWVTT0PVDF2L', 'My Description for this report!!!', 'ISSUE', '0', 0, '2019-1008', 'Employee8, Employee8', '2020-02-06 05:52:18', '2020-02-06 05:52:18');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_activity_log_img`
--

CREATE TABLE `tbl_activity_log_img` (
  `id` bigint(11) NOT NULL,
  `actCode` varchar(191) DEFAULT NULL,
  `projCode` varchar(191) NOT NULL,
  `attachment` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_by_id` varchar(191) NOT NULL,
  `created_by_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_activity_log_img`
--

INSERT INTO `tbl_activity_log_img` (`id`, `actCode`, `projCode`, `attachment`, `type`, `deleted`, `created_by_id`, `created_by_name`, `created_at`, `updated_at`) VALUES
(8, 'F7KHNNOEUCG1', 'IWVTT0PVDF2L', '/upload/img/20200206_135010-capture.PNG', 'IMAGE', 0, '2019-1008', 'Employee8, Employee8', '2020-02-06 05:50:10', '2020-02-06 05:50:10'),
(9, 'F7KHNNOEUCG1', 'IWVTT0PVDF2L', '/upload/img/20200206_135010-asdfasdfsadfasdfasd.PNG', 'IMAGE', 0, '2019-1008', 'Employee8, Employee8', '2020-02-06 05:50:10', '2020-02-06 05:50:10'),
(10, 'KZJYMCKJNEXH', 'IWVTT0PVDF2L', '/upload/img/20200206_135019-capture.PNG', 'IMAGE', 0, '2019-1008', 'Employee8, Employee8', '2020-02-06 05:50:19', '2020-02-06 05:50:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_emp_proj`
--

CREATE TABLE `tbl_emp_proj` (
  `id` bigint(11) NOT NULL,
  `projCode` varchar(191) NOT NULL,
  `emp_id` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `deleted` int(2) NOT NULL,
  `by_id` bigint(11) NOT NULL,
  `updated_by` varchar(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_emp_proj`
--

INSERT INTO `tbl_emp_proj` (`id`, `projCode`, `emp_id`, `type`, `deleted`, `by_id`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'J2EV3TDCEQ6E', '2019-1001', 'PM', 0, 79, 'Super Admin', '2020-02-06 03:55:15', '2020-02-06 03:55:15'),
(2, 'J2EV3TDCEQ6E', '2019-1004', 'EMP', 0, 79, 'Super Admin', '2020-02-06 03:55:15', '2020-02-06 03:55:15'),
(3, 'J2EV3TDCEQ6E', '2019-1003', 'EMP', 0, 79, 'Super Admin', '2020-02-06 03:55:15', '2020-02-06 03:55:15'),
(4, 'J2EV3TDCEQ6E', '2019-1008', 'EMP', 0, 79, 'Super Admin', '2020-02-06 03:55:16', '2020-02-06 03:55:16'),
(5, 'J2EV3TDCEQ6E', '2020-C7DVWDZ7', 'STAKEHOLDER', 0, 79, 'Super Admin', '2020-02-06 03:55:16', '2020-02-06 03:55:16'),
(6, 'J2EV3TDCEQ6E', '2020-A7HVS58E', 'STAKEHOLDER', 0, 79, 'Super Admin', '2020-02-06 03:55:16', '2020-02-06 03:55:16'),
(7, 'J2EV3TDCEQ6E', '2019-UIDMS', 'CUSTOMER', 0, 79, 'Super Admin', '2020-02-06 03:55:16', '2020-02-06 03:55:16'),
(8, 'J2EV3TDCEQ6E', '2019-DSACM', 'CUSTOMER', 0, 79, 'Super Admin', '2020-02-06 03:55:16', '2020-02-06 03:55:16'),
(9, 'IWVTT0PVDF2L', '2019-1004', 'PM', 1, 79, 'Super Admin', '2020-02-06 03:56:22', '2020-02-10 08:54:21'),
(10, 'IWVTT0PVDF2L', '2019-1003', 'PM', 1, 79, 'Super Admin', '2020-02-06 03:56:23', '2020-02-10 08:54:21'),
(11, 'IWVTT0PVDF2L', '2019-1003', 'EMP', 1, 79, 'Super Admin', '2020-02-06 03:56:23', '2020-02-10 08:54:21'),
(12, 'IWVTT0PVDF2L', '2019-1010', 'EMP', 1, 79, 'Super Admin', '2020-02-06 03:56:23', '2020-02-10 08:54:21'),
(13, 'IWVTT0PVDF2L', '2019-1008', 'EMP', 1, 79, 'Super Admin', '2020-02-06 03:56:23', '2020-02-10 08:54:21'),
(14, 'IWVTT0PVDF2L', '2020-C7DVWDZ7', 'STAKEHOLDER', 1, 79, 'Super Admin', '2020-02-06 03:56:23', '2020-02-10 08:54:22'),
(15, 'IWVTT0PVDF2L', '2020-JH9UHG26', 'CUSTOMER', 1, 79, 'Super Admin', '2020-02-06 03:56:23', '2020-02-10 08:54:22'),
(16, 'SO6MTVA3KHE8', '2019-1001', 'PM', 0, 79, 'Super Admin', '2020-02-07 07:05:20', '2020-02-07 07:05:20'),
(17, 'SO6MTVA3KHE8', '2019-1005', 'EMP', 0, 79, 'Super Admin', '2020-02-07 07:05:20', '2020-02-07 07:05:20'),
(18, 'SO6MTVA3KHE8', '2019-1004', 'EMP', 0, 79, 'Super Admin', '2020-02-07 07:05:20', '2020-02-07 07:05:20'),
(19, 'SO6MTVA3KHE8', '2020-C7DVWDZ7', 'STAKEHOLDER', 0, 79, 'Super Admin', '2020-02-07 07:05:20', '2020-02-07 07:05:20'),
(20, 'SO6MTVA3KHE8', '2019-UIDMS', 'CUSTOMER', 0, 79, 'Super Admin', '2020-02-07 07:05:20', '2020-02-07 07:05:20'),
(21, 'IWVTT0PVDF2L', '2019-1003', 'PM', 0, 79, 'Super Admin', '2020-02-10 08:54:21', '2020-02-10 08:54:21'),
(22, 'IWVTT0PVDF2L', '2019-1004', 'PM', 0, 79, 'Super Admin', '2020-02-10 08:54:21', '2020-02-10 08:54:21'),
(23, 'IWVTT0PVDF2L', '2019-1003', 'EMP', 0, 79, 'Super Admin', '2020-02-10 08:54:21', '2020-02-10 08:54:21'),
(24, 'IWVTT0PVDF2L', '2019-1008', 'EMP', 0, 79, 'Super Admin', '2020-02-10 08:54:21', '2020-02-10 08:54:21'),
(25, 'IWVTT0PVDF2L', '2019-1010', 'EMP', 0, 79, 'Super Admin', '2020-02-10 08:54:22', '2020-02-10 08:54:22'),
(26, 'IWVTT0PVDF2L', '2020-C7DVWDZ7', 'STAKEHOLDER', 0, 79, 'Super Admin', '2020-02-10 08:54:22', '2020-02-10 08:54:22'),
(27, 'IWVTT0PVDF2L', '2020-JH9UHG26', 'CUSTOMER', 0, 79, 'Super Admin', '2020-02-10 08:54:22', '2020-02-10 08:54:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manage_access_right`
--

CREATE TABLE `tbl_manage_access_right` (
  `id` bigint(11) NOT NULL,
  `access_desc` varchar(191) DEFAULT NULL,
  `deleted` int(2) DEFAULT NULL,
  `by_id` varchar(191) DEFAULT NULL,
  `updated_by` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_manage_access_right`
--

INSERT INTO `tbl_manage_access_right` (`id`, `access_desc`, `deleted`, `by_id`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 'Task List', 0, '7', 'Keigh Dee', '2020-01-21 16:00:00', '2020-01-21 16:00:00'),
(3, 'Project List', 0, '7', 'Keigh Dee', '2020-01-21 16:00:00', '2020-01-21 16:00:00'),
(4, 'Member Records', 0, '7', 'Keigh Dee', '2020-01-21 16:00:00', '2020-01-21 16:00:00'),
(5, 'User Management', 0, '7', 'Keigh Dee', '2020-01-14 16:00:00', '2020-01-14 16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manage_access_right_per_user`
--

CREATE TABLE `tbl_manage_access_right_per_user` (
  `id` bigint(11) NOT NULL,
  `access_id` bigint(11) DEFAULT NULL,
  `company_id` varchar(191) DEFAULT NULL,
  `read_data` int(2) DEFAULT 0,
  `full_access_data` int(2) DEFAULT 0,
  `no_access_data` int(2) DEFAULT 0,
  `custom_data` int(2) DEFAULT 0,
  `add_data` int(2) DEFAULT 0,
  `edit_data` int(2) DEFAULT 0,
  `delete_data` int(2) DEFAULT 0,
  `retrack_data` int(2) DEFAULT 0,
  `deleted` int(2) DEFAULT 0,
  `by_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_manage_access_right_per_user`
--

INSERT INTO `tbl_manage_access_right_per_user` (`id`, `access_id`, `company_id`, `read_data`, `full_access_data`, `no_access_data`, `custom_data`, `add_data`, `edit_data`, `delete_data`, `retrack_data`, `deleted`, `by_id`, `created_at`, `updated_at`) VALUES
(46, 2, '2020-SUPADM', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-19 16:00:00', '2020-02-13 16:00:00'),
(47, 3, '2020-SUPADM', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-07 16:00:00', '2020-02-18 16:00:00'),
(48, 4, '2020-SUPADM', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-07 16:00:00', '2020-02-07 16:00:00'),
(49, 5, '2020-SUPADM', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-07 16:00:00', '2020-02-07 16:00:00'),
(50, 2, '2020-OWEMZYNJ', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-19 08:00:00', '2020-02-13 08:00:00'),
(51, 3, '2020-OWEMZYNJ', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-07 08:00:00', '2020-02-18 08:00:00'),
(52, 4, '2020-OWEMZYNJ', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-07 08:00:00', '2020-02-07 08:00:00'),
(53, 5, '2020-OWEMZYNJ', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-07 08:00:00', '2020-02-07 08:00:00'),
(54, 2, '2020-PUG12TLP', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-19 08:00:00', '2020-02-13 08:00:00'),
(55, 3, '2020-PUG12TLP', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-07 08:00:00', '2020-02-18 08:00:00'),
(56, 4, '2020-PUG12TLP', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-07 08:00:00', '2020-02-07 08:00:00'),
(57, 5, '2020-PUG12TLP', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-07 08:00:00', '2020-02-07 08:00:00'),
(59, 2, '2019-1001', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2019-1008', '2020-02-07 06:31:07', '2020-02-07 06:31:07'),
(60, 3, '2019-1001', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2019-1008', '2020-02-07 06:31:07', '2020-02-07 06:31:07'),
(61, 4, '2019-1001', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2019-1008', '2020-02-07 06:31:07', '2020-02-07 06:31:07'),
(62, 5, '2019-1001', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2019-1008', '2020-02-07 06:31:07', '2020-02-07 06:31:07'),
(63, 2, '2020-3LVQTNJ4', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-07 06:50:41', '2020-02-07 06:50:41'),
(64, 3, '2020-3LVQTNJ4', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-07 06:50:41', '2020-02-07 06:50:41'),
(65, 4, '2020-3LVQTNJ4', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-07 06:50:41', '2020-02-07 06:50:41'),
(66, 5, '2020-3LVQTNJ4', 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-SUPADM', '2020-02-07 06:50:41', '2020-02-07 06:50:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_member`
--

CREATE TABLE `tbl_member` (
  `id` bigint(11) NOT NULL,
  `memberCode` varchar(191) NOT NULL,
  `member_name` varchar(191) NOT NULL,
  `member_email` varchar(191) NOT NULL,
  `member_contact_no` varchar(191) NOT NULL,
  `member_address` varchar(191) NOT NULL,
  `member_position` varchar(191) DEFAULT NULL,
  `member_type` varchar(191) NOT NULL,
  `deleted` int(2) NOT NULL DEFAULT 0,
  `by_id` varchar(191) NOT NULL,
  `updated_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_member`
--

INSERT INTO `tbl_member` (`id`, `memberCode`, `member_name`, `member_email`, `member_contact_no`, `member_address`, `member_position`, `member_type`, `deleted`, `by_id`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '2019-UIDMS', 'Customer Lastname1, First Name1', 'cus1@gmail.com', '09776927838', 'Bogota Colombia', 'ANDROID DEVELOPER', 'CUSTOMER', 0, '7', 'Keigh Dee', '2019-11-26 19:00:00', '2020-01-14 09:29:12'),
(2, '2019-DSACM', 'wowers', 'wowerz', '123', 'wowerx', 'WEB DEVELOPER', 'CUSTOMER', 0, '7', 'Keigh Dee', '2019-11-26 21:00:00', '2020-01-15 03:54:26'),
(17, '2020-C7DVWDZ7', 'Richard Guevara', 'guevara.richard17@gmail.com', '09776927838', 'Stratford', 'PRESIDENT', 'STAKEHOLDER', 0, '7', 'Keigh Dee', '2020-01-14 05:57:43', '2020-01-14 05:57:43'),
(18, '2020-JH9UHG26', 'Manila Grey', 'mg@gmail.com', '09787887888', 'Singapore', 'WEB DEVELOPER', 'CUSTOMER', 0, '7', 'Keigh Dee', '2020-01-14 05:59:15', '2020-01-14 05:59:15'),
(19, '2020-UIBFRLS1', 'Justin Bieber', 'jb@gmail.com', '090909', 'pasig city', 'PRESIDENT', 'CUSTOMER', 0, '7', 'Keigh Dee', '2020-01-14 09:25:44', '2020-01-15 03:44:36'),
(20, '2020-A7HVS58E', 'Angelo', 'angelo@gmail.com', '09999999', 'belvedere', 'programmer', 'STAKEHOLDER', 0, '79', 'Super Admin', '2020-02-06 03:22:06', '2020-02-06 03:22:06'),
(21, '2020-T2DVFIUS', 'migos', 'quavo@gmail.com', '911', 'belvedere', 'webdev', 'STAKEHOLDER', 0, '79', 'Super Admin', '2020-02-06 03:22:25', '2020-02-06 03:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projectlist`
--

CREATE TABLE `tbl_projectlist` (
  `id` bigint(11) NOT NULL,
  `proj_code` varchar(191) NOT NULL,
  `proj_title` varchar(191) NOT NULL,
  `proj_desc` varchar(191) NOT NULL,
  `target_man_days` bigint(50) DEFAULT 0,
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

INSERT INTO `tbl_projectlist` (`id`, `proj_code`, `proj_title`, `proj_desc`, `target_man_days`, `est_start_date`, `est_end_date`, `act_start_date`, `act_end_date`, `longitude`, `latitude`, `location`, `status`, `deleted`, `by_id`, `updated_by`, `created_at`, `updated_at`) VALUES
(12, 'J2EV3TDCEQ6E', 'SVS Proj', 'SVS Proj', 1000000, '2020-02-06 11:54:00', '2020-02-06 23:54:00', '2020-02-06 11:54:00', '2020-02-06 23:54:00', '121.07642460', '14.56055010', 'Pasig, Metro Manila, Philippinae', NULL, 0, 79, 'Super Admin', '2020-02-06 03:55:15', '2020-02-06 03:55:15'),
(13, 'IWVTT0PVDF2L', 'CSI Proj', 'CSI Proj', 20000, '2020-02-06 11:56:00', '2020-02-06 23:56:00', '2020-02-06 11:56:00', '2020-02-06 23:56:00', '121.07642460', '14.56055010', 'Pasig, Metro Manila, Philippinae', NULL, 0, 79, 'Super Admin', '2020-02-06 03:56:22', '2020-02-10 08:54:21'),
(14, 'SO6MTVA3KHE8', 'Hacienda Napoles', 'Pablo Escobar', 10000, '2020-02-07 03:05:00', '2020-02-07 15:05:00', '2020-02-07 03:05:00', '2020-02-07 15:05:00', '-75.60281325', '6.27162785', 'Medellín, Valle de Aburrá, Antioquia, 0500, Colombia', NULL, 0, 79, 'Super Admin', '2020-02-07 07:05:20', '2020-02-07 07:05:20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projtask`
--

CREATE TABLE `tbl_projtask` (
  `id` bigint(11) NOT NULL,
  `projCode` varchar(191) NOT NULL,
  `taskCode` varchar(191) NOT NULL,
  `taskWeight` decimal(13,2) DEFAULT NULL,
  `plan_days` varchar(191) DEFAULT NULL,
  `actual_days` varchar(191) DEFAULT NULL,
  `deleted` int(2) NOT NULL DEFAULT 0,
  `by_id` bigint(11) NOT NULL,
  `updated_by` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_projtask`
--

INSERT INTO `tbl_projtask` (`id`, `projCode`, `taskCode`, `taskWeight`, `plan_days`, `actual_days`, `deleted`, `by_id`, `updated_by`, `created_at`, `updated_at`) VALUES
(4, 'J2EV3TDCEQ6E', 'FOVUFKF3MFAD', '50.00', '5', '5', 0, 79, 'Super Admin', '2020-02-06 03:55:15', '2020-02-06 03:55:16'),
(5, 'J2EV3TDCEQ6E', 'AJIQEVV2ERGQ', '50.00', '5', '5', 0, 79, 'Super Admin', '2020-02-06 03:55:15', '2020-02-06 03:55:16'),
(6, 'IWVTT0PVDF2L', 'FOVUFKF3MFAD', '30.00', '5', '5', 1, 79, 'Super Admin', '2020-02-06 03:56:22', '2020-02-10 08:54:21'),
(7, 'IWVTT0PVDF2L', 'AJIQEVV2ERGQ', '50.00', '5', '5', 1, 79, 'Super Admin', '2020-02-06 03:56:22', '2020-02-10 08:54:21'),
(8, 'SO6MTVA3KHE8', 'FOVUFKF3MFAD', '100.00', '5', '5', 0, 79, 'Super Admin', '2020-02-07 07:05:20', '2020-02-07 07:05:20'),
(9, 'IWVTT0PVDF2L', 'AJIQEVV2ERGQ', '50.00', '5', '5', 0, 79, 'Super Admin', '2020-02-10 08:54:21', '2020-02-10 08:54:21'),
(10, 'IWVTT0PVDF2L', 'FOVUFKF3MFAD', '30.00', '5', '5', 0, 79, 'Super Admin', '2020-02-10 08:54:21', '2020-02-10 08:54:21'),
(11, 'IWVTT0PVDF2L', 'IWWBYLVPWZ1C', '20.00', NULL, NULL, 0, 79, 'Super Admin', '2020-02-10 08:54:21', '2020-02-10 08:54:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proj_progress`
--

CREATE TABLE `tbl_proj_progress` (
  `id` bigint(11) NOT NULL,
  `ProjProgressCode` varchar(191) DEFAULT NULL,
  `projCode` varchar(191) NOT NULL,
  `taskCode` varchar(191) NOT NULL,
  `weight_progress` decimal(13,2) NOT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `report` varchar(191) DEFAULT NULL,
  `reported_by_id` bigint(11) DEFAULT NULL,
  `pick_date` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `by_id` varchar(191) NOT NULL,
  `updated_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_proj_progress`
--

INSERT INTO `tbl_proj_progress` (`id`, `ProjProgressCode`, `projCode`, `taskCode`, `weight_progress`, `attachment`, `report`, `reported_by_id`, `pick_date`, `deleted`, `by_id`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'YBP2DV7W', 'IWVTT0PVDF2L', 'AJIQEVV2ERGQ', '1.00', '1', 'Description', 54, '2020-01-28 00:00:00', 0, '54', 'Employee8, Employee8', '2020-02-06 05:46:12', '2020-02-06 05:46:12'),
(2, 'BPVSDZWW', 'IWVTT0PVDF2L', 'AJIQEVV2ERGQ', '1.00', '0', 'Description', 54, '2020-01-28 00:00:00', 0, '54', 'Employee8, Employee8', '2020-02-06 05:52:38', '2020-02-06 05:52:38');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proj_progress_img`
--

CREATE TABLE `tbl_proj_progress_img` (
  `id` bigint(11) NOT NULL,
  `ProjProgressCode` varchar(191) DEFAULT NULL,
  `projCode` varchar(191) NOT NULL,
  `taskCode` varchar(191) NOT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `deleted` int(2) DEFAULT NULL,
  `by_id` varchar(191) DEFAULT NULL,
  `updated_by` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_proj_progress_img`
--

INSERT INTO `tbl_proj_progress_img` (`id`, `ProjProgressCode`, `projCode`, `taskCode`, `attachment`, `deleted`, `by_id`, `updated_by`, `created_at`, `updated_at`) VALUES
(13, 'YBP2DV7W', 'IWVTT0PVDF2L', 'AJIQEVV2ERGQ', '/upload/img/20200206_134612-asdadssdsd.PNG', 0, '54', 'Employee8, Employee8', '2020-02-06 05:46:12', '2020-02-06 05:46:12'),
(14, 'YBP2DV7W', 'IWVTT0PVDF2L', 'AJIQEVV2ERGQ', '/upload/img/20200206_134612-asdasdasdasdas.PNG', 0, '54', 'Employee8, Employee8', '2020-02-06 05:46:12', '2020-02-06 05:46:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_task`
--

CREATE TABLE `tbl_task` (
  `id` bigint(11) NOT NULL,
  `taskCode` varchar(191) NOT NULL,
  `task_title` varchar(191) NOT NULL,
  `task_desc` varchar(191) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `by_id` bigint(11) NOT NULL,
  `updated_by` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_task`
--

INSERT INTO `tbl_task` (`id`, `taskCode`, `task_title`, `task_desc`, `deleted`, `by_id`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'AJIQEVV2ERGQ', 'Task 1', 'Task 1', 0, 79, 'Super Admin', '2020-02-06 03:50:12', '2020-02-06 03:50:12'),
(2, 'FOVUFKF3MFAD', 'Task 2', 'Task 2', 0, 79, 'Super Admin', '2020-02-06 03:50:22', '2020-02-06 03:50:22'),
(3, 'IWWBYLVPWZ1C', 'Task 3', 'Task 3', 0, 79, 'Super Admin', '2020-02-10 08:53:45', '2020-02-10 08:53:45');

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
  `is_admin` int(2) DEFAULT 0,
  `account_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `apiKey`, `ACNo`, `name`, `email`, `email_verified_at`, `password`, `deleted`, `is_admin`, `account_type`, `updated_by`, `created_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(46, '2019-1006', NULL, '1006', 'Employee6, Employee6', 'cherryann_anis3@yahoo.com', NULL, '$2y$10$MP4BPAbSSwE1gZEarp8qlu7mFZruGkiOy7J1IjH.LFe0r4m0.Cno2', 0, 0, 'APP', NULL, '2018-101', NULL, '2020-01-05 21:00:00', '2020-01-05 19:00:00'),
(47, '2019-1005', NULL, '1005', 'Employee5, Employee5', 'cherryann_anis5@yahoo.com', NULL, '$2y$10$MP4BPAbSSwE1gZEarp8qlu7mFZruGkiOy7J1IjH.LFe0r4m0.Cno2', 0, 0, 'APP', NULL, '2018-101', NULL, '2020-01-05 22:00:00', '2020-01-05 19:00:00'),
(48, '2019-1004', NULL, '1004', 'Employee4, Employee4', 'cherryann_anis8@yahoo.com', NULL, '$2y$10$MP4BPAbSSwE1gZEarp8qlu7mFZruGkiOy7J1IjH.LFe0r4m0.Cno2', 0, 0, 'APP', NULL, '2018-101', NULL, '2020-01-06 00:00:00', '2020-01-06 01:00:00'),
(49, '2019-1003', NULL, '1003', 'Employee3, Employee3', 'cherryann_anis2@yahoo.com', NULL, '$2y$10$MP4BPAbSSwE1gZEarp8qlu7mFZruGkiOy7J1IjH.LFe0r4m0.Cno2', 0, 0, 'APP', NULL, '2018-101', NULL, '2020-01-05 19:00:00', '2020-01-05 21:00:00'),
(50, '2019-1002', NULL, '1002', 'Employee2, Employee2', 'cherryann_anis9@yahoo.com', NULL, '$2y$10$MP4BPAbSSwE1gZEarp8qlu7mFZruGkiOy7J1IjH.LFe0r4m0.Cno2', 0, 0, 'APP', NULL, '2018-101', NULL, '2020-01-06 00:00:00', '2020-01-05 18:00:00'),
(52, '2019-1010', NULL, '1010', 'Employee10, Employee10', 'cherryann_anis4@yahoo.com', NULL, '$2y$10$MP4BPAbSSwE1gZEarp8qlu7mFZruGkiOy7J1IjH.LFe0r4m0.Cno2', 0, 0, 'APP', NULL, '2018-101', NULL, '2020-01-05 21:06:00', '2020-01-05 22:13:00'),
(53, '2019-1009', NULL, '1009', 'Employee9, Employee9', 'cherryann_anis7@yahoo.com', NULL, '$2y$10$MP4BPAbSSwE1gZEarp8qlu7mFZruGkiOy7J1IjH.LFe0r4m0.Cno2', 0, 0, 'APP', NULL, '2018-101', NULL, '2020-01-05 23:00:00', '2020-01-05 20:00:00'),
(54, '2019-1008', NULL, '1008', 'Employee8, Employee8', 'cherryann_anis1@yahoo.com', NULL, '$2y$10$MP4BPAbSSwE1gZEarp8qlu7mFZruGkiOy7J1IjH.LFe0r4m0.Cno2', 0, 0, 'APP', NULL, '2018-101', NULL, '2020-01-05 18:00:00', '2020-01-17 03:25:18'),
(79, '2020-SUPADM', NULL, NULL, 'Super Admin', 'superadmin@svs-web-console.com', NULL, '$2y$10$bOXbGJyyYZPHCfDQSmJk7.mxAwRTQ7N6TV4LwgvswBtzm5JmIsQjK', 0, 2, 'SYS-DEF', NULL, '1996-001', NULL, '2020-01-22 02:46:23', '2020-01-22 02:46:23'),
(83, '2018-101', NULL, NULL, 'ABUEVA', 'abueva@gmail.com', NULL, '$2y$10$BUjHqVBGV14GuX/HlQHhweRVN0.nKWnZ7eFr/hl5nhJW71YiP.orW', 0, 0, 'APP', NULL, '2020-SUPADM', NULL, '2020-01-22 02:57:20', '2020-01-22 02:57:20'),
(84, '1996-001', NULL, NULL, 'ABUEVA ADMIN', 'abueva.admin@gmail.com', NULL, '$2y$10$4xhf5yLiXaGGfEtLIE.kQupBB.VqBreO3MnpG7yTnA0qY6H6IZjky', 0, 0, 'APP', NULL, '2020-SUPADM', NULL, '2020-01-22 02:58:20', '2020-01-22 02:58:20'),
(85, '2020-PUG12TLP', NULL, NULL, 'Admin', 'admin@svs-web-console.com', NULL, '$2y$10$5vI/XZrenHnHSKflSEB.gO0bSp4hALJIkXHUstROUD/TIAmgrg8Hu', 0, 1, 'SYS-DEF', NULL, '2020-SUPADM', NULL, '2020-01-22 03:06:28', '2020-01-22 03:06:28'),
(86, '2020-OWEMZYNJ', NULL, NULL, 'Pablo Emilio Escobar  Gaviria', 'pablo.e@gmail.com', NULL, '$2y$10$ORE0ZqqrxNnEQi9gfOZPpeiW010cQBpuWuw68M1IzIklZ5OrG4lIa', 0, 2, 'SYS-DEF', NULL, '2020-SUPADM', NULL, '2020-01-22 05:34:28', '2020-01-22 05:34:28'),
(92, '2019-1001', NULL, '1001', 'Employee1, Employee1', 'cherryann_anis6@yahoo.com', NULL, '$2y$10$Ist4O0gcUCHwGBr6QO66mO95SvMwQTq.JuZyZ6n4IgD8ON2QKKEk6', 0, 1, 'WEB', NULL, '2019-1008', NULL, '2020-02-07 06:31:06', '2020-02-07 06:31:06'),
(93, '2020-3LVQTNJ4', NULL, NULL, 'Admin2', 'admin2@svs-web-console.com', NULL, '$2y$10$oxmEQXu1EuNs2x4PJzvJae5VVMp7ULZat0TpLYSS0SgJhWansCVNa', 0, 1, 'SYS-DEF', NULL, '2020-SUPADM', NULL, '2020-02-07 06:50:41', '2020-02-07 06:50:41');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_activity_log`
-- (See below for the actual view)
--
CREATE TABLE `view_activity_log` (
`id` bigint(8)
,`actCode` varchar(191)
,`projCode` varchar(191)
,`activity_desc` varchar(191)
,`type` varchar(191)
,`attachment` varchar(191)
,`created_by_id` varchar(191)
,`created_by_name` varchar(191)
,`created_at` timestamp
,`ACNo` varchar(191)
,`name` varchar(191)
,`email` varchar(191)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_date_time_records`
-- (See below for the actual view)
--
CREATE TABLE `view_date_time_records` (
`ACNo` varchar(191)
,`name` varchar(191)
,`time_in` mediumtext
,`time_out` mediumtext
,`hours` bigint(21)
,`recDate` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_employee_info`
-- (See below for the actual view)
--
CREATE TABLE `view_employee_info` (
`emp_no` bigint(20)
,`company_id` varchar(20)
,`fullname` varchar(93)
,`lname` varchar(30)
,`fname` varchar(30)
,`csi_email` varchar(50)
,`company_ind` bigint(20)
,`company_name` varchar(100)
,`department` varchar(50)
,`position` varchar(50)
,`team` varchar(50)
,`employment_status` varchar(16)
,`active` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_project_percentage`
-- (See below for the actual view)
--
CREATE TABLE `view_project_percentage` (
`id` bigint(11)
,`proj_code` varchar(191)
,`proj_title` varchar(191)
,`proj_desc` varchar(191)
,`target_man_days` bigint(50)
,`issue` bigint(21)
,`report` bigint(21)
,`total_employee` bigint(21)
,`hours_8` decimal(22,0)
,`hours_6` decimal(24,1)
,`hours_3` decimal(22,0)
,`total_weight_progress` decimal(35,2)
,`est_start_date` datetime
,`est_end_date` datetime
,`act_start_date` datetime
,`act_end_date` datetime
,`longitude` varchar(191)
,`latitude` varchar(191)
,`location` varchar(191)
,`status` varchar(191)
,`deleted` int(11)
,`by_id` bigint(11)
,`updated_by` varchar(191)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_projtask`
-- (See below for the actual view)
--
CREATE TABLE `view_projtask` (
`id` bigint(11)
,`projCode` varchar(191)
,`taskCode` varchar(191)
,`total_task_weight` decimal(35,2)
,`taskWeight` decimal(13,2)
,`plan_days` varchar(191)
,`actual_days` varchar(191)
,`task_title` varchar(191)
,`task_desc` varchar(191)
,`taskDeleted` int(11)
,`deleted` int(2)
,`by_id` bigint(11)
,`updated_by` varchar(191)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_proj_progress`
-- (See below for the actual view)
--
CREATE TABLE `view_proj_progress` (
`id` bigint(11)
,`ProjProgressCode` varchar(191)
,`projCode` varchar(191)
,`taskCode` varchar(191)
,`weight_progress` decimal(13,2)
,`attachment` varchar(191)
,`report` varchar(191)
,`reported_by_id` bigint(11)
,`pick_date` datetime
,`by_id` varchar(191)
,`updated_by` varchar(191)
,`created_at` timestamp
,`updated_at` timestamp
,`taskDeleted` int(11)
,`deleted` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_users`
-- (See below for the actual view)
--
CREATE TABLE `view_users` (
`id` bigint(20) unsigned
,`company_id` varchar(191)
,`apiKey` varchar(191)
,`ACNo` varchar(191)
,`name` varchar(191)
,`email` varchar(191)
,`email_verified_at` timestamp
,`password` varchar(191)
,`deleted` int(191)
,`is_admin` int(2)
,`account_type` varchar(191)
,`updated_by` varchar(191)
,`created_by` varchar(191)
,`remember_token` varchar(100)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Structure for view `view_activity_log`
--
DROP TABLE IF EXISTS `view_activity_log`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_activity_log`  AS  select `a`.`id` AS `id`,`a`.`actCode` AS `actCode`,`a`.`projCode` AS `projCode`,`a`.`activity_desc` AS `activity_desc`,`a`.`type` AS `type`,`a`.`attachment` AS `attachment`,`a`.`created_by_id` AS `created_by_id`,`a`.`created_by_name` AS `created_by_name`,`a`.`created_at` AS `created_at`,(select `u`.`ACNo` from `users` `u` where `u`.`company_id` = `a`.`created_by_id`) AS `ACNo`,(select `u`.`name` from `users` `u` where `u`.`company_id` = `a`.`created_by_id`) AS `name`,(select `u`.`email` from `users` `u` where `u`.`company_id` = `a`.`created_by_id`) AS `email` from `tbl_activity_log` `a` ;

-- --------------------------------------------------------

--
-- Structure for view `view_date_time_records`
--
DROP TABLE IF EXISTS `view_date_time_records`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_date_time_records`  AS  select `date_time_records`.`ACNo` AS `ACNo`,`date_time_records`.`name` AS `name`,substring_index(group_concat(case when `date_time_records`.`state` = 'C/In' then `date_time_records`.`datetime` end order by `date_time_records`.`datetime` ASC separator ','),',',1) AS `time_in`,substring_index(group_concat(case when `date_time_records`.`state` = 'C/Out' then `date_time_records`.`datetime` end order by `date_time_records`.`datetime` ASC separator ','),',',-1) AS `time_out`,timestampdiff(HOUR,substring_index(group_concat(case when `date_time_records`.`state` = 'C/In' then `date_time_records`.`datetime` end order by `date_time_records`.`datetime` ASC separator ','),',',1),substring_index(group_concat(case when `date_time_records`.`state` = 'C/Out' then `date_time_records`.`datetime` end order by `date_time_records`.`datetime` ASC separator ','),',',-1)) AS `hours`,cast(`date_time_records`.`datetime` as date) AS `recDate` from `date_time_records` group by `date_time_records`.`ACNo`,`date_time_records`.`name`,cast(`date_time_records`.`datetime` as date) order by `date_time_records`.`ACNo` ;

-- --------------------------------------------------------

--
-- Structure for view `view_employee_info`
--
DROP TABLE IF EXISTS `view_employee_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_employee_info`  AS  select `a`.`emp_no` AS `emp_no`,`a`.`company_id` AS `company_id`,concat(`a`.`lname`,', ',`a`.`fname`,' ',`a`.`mname`) AS `fullname`,`a`.`lname` AS `lname`,`a`.`fname` AS `fname`,`a`.`csi_email` AS `csi_email`,`b`.`company_ind` AS `company_ind`,`d`.`company_name` AS `company_name`,`b`.`department` AS `department`,`b`.`position` AS `position`,`b`.`team` AS `team`,`b`.`employment_status` AS `employment_status`,`a`.`active` AS `active` from (((`hris_csi_b`.`personal_information` `a` left join `hris_csi_b`.`employee_information` `b` on(`a`.`company_id` = `b`.`company_id`)) left join `users` `e` on(`a`.`company_id` = `e`.`company_id`)) left join `hris_csi_b`.`company` `d` on(`b`.`company_ind` = `d`.`id`)) where `a`.`active` = 'yes' group by `e`.`company_id` order by `b`.`department` ;

-- --------------------------------------------------------

--
-- Structure for view `view_project_percentage`
--
DROP TABLE IF EXISTS `view_project_percentage`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_project_percentage`  AS  select `a`.`id` AS `id`,`a`.`proj_code` AS `proj_code`,`a`.`proj_title` AS `proj_title`,`a`.`proj_desc` AS `proj_desc`,`a`.`target_man_days` AS `target_man_days`,(select count(0) from `tbl_activity_log` `tal` where `tal`.`projCode` = `a`.`proj_code` and `tal`.`type` = 'ISSUE') AS `issue`,(select count(0) from `tbl_activity_log` `tal` where `tal`.`projCode` = `a`.`proj_code` and `tal`.`type` = 'REPORT') AS `report`,(select count(distinct `xx`.`emp_id`) from `tbl_emp_proj` `xx` where `xx`.`type` in ('EMP','PM') and `xx`.`projCode` = `a`.`proj_code`) AS `total_employee`,(select sum(case when `dtr`.`hours` >= 8 then 1 else 0 end) from (`view_date_time_records` `dtr` left join `tbl_emp_proj` `temp` on(substring_index(`temp`.`emp_id`,'-',-1) = `dtr`.`ACNo`)) where `temp`.`projCode` = `a`.`proj_code`) AS `hours_8`,(select sum(case when `dtr`.`hours` <= 6 then 0.5 else 0 end) from (`view_date_time_records` `dtr` left join `tbl_emp_proj` `temp` on(substring_index(`temp`.`emp_id`,'-',-1) = `dtr`.`ACNo`)) where `temp`.`projCode` = `a`.`proj_code`) AS `hours_6`,(select sum(case when `dtr`.`hours` <= 3 then 0 else 0 end) from (`view_date_time_records` `dtr` left join `tbl_emp_proj` `temp` on(substring_index(`temp`.`emp_id`,'-',-1) = `dtr`.`ACNo`)) where `temp`.`projCode` = `a`.`proj_code`) AS `hours_3`,(select sum(`tpp`.`weight_progress`) from (`tbl_proj_progress` `tpp` left join `tbl_task` `tt` on(`tpp`.`taskCode` = `tt`.`taskCode`)) where `tpp`.`projCode` = `a`.`proj_code` and `tpp`.`deleted` = 0 and `tt`.`deleted` = 0) AS `total_weight_progress`,`a`.`est_start_date` AS `est_start_date`,`a`.`est_end_date` AS `est_end_date`,`a`.`act_start_date` AS `act_start_date`,`a`.`act_end_date` AS `act_end_date`,`a`.`longitude` AS `longitude`,`a`.`latitude` AS `latitude`,`a`.`location` AS `location`,`a`.`status` AS `status`,`a`.`deleted` AS `deleted`,`a`.`by_id` AS `by_id`,`a`.`updated_by` AS `updated_by`,`a`.`created_at` AS `created_at`,`a`.`updated_at` AS `updated_at` from `tbl_projectlist` `a` order by `a`.`created_at` desc ;

-- --------------------------------------------------------

--
-- Structure for view `view_projtask`
--
DROP TABLE IF EXISTS `view_projtask`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_projtask`  AS  select `a`.`id` AS `id`,`a`.`projCode` AS `projCode`,`a`.`taskCode` AS `taskCode`,(select sum(`tpp`.`weight_progress`) from `tbl_proj_progress` `tpp` where `tpp`.`projCode` = `a`.`projCode` and `tpp`.`taskCode` = `a`.`taskCode` and `tpp`.`deleted` = 0) AS `total_task_weight`,`a`.`taskWeight` AS `taskWeight`,`a`.`plan_days` AS `plan_days`,`a`.`actual_days` AS `actual_days`,`b`.`task_title` AS `task_title`,`b`.`task_desc` AS `task_desc`,`b`.`deleted` AS `taskDeleted`,`a`.`deleted` AS `deleted`,`a`.`by_id` AS `by_id`,`a`.`updated_by` AS `updated_by`,`a`.`created_at` AS `created_at`,`a`.`updated_at` AS `updated_at` from (`tbl_projtask` `a` left join `tbl_task` `b` on(`a`.`taskCode` = `b`.`taskCode`)) order by `a`.`created_at` desc ;

-- --------------------------------------------------------

--
-- Structure for view `view_proj_progress`
--
DROP TABLE IF EXISTS `view_proj_progress`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_proj_progress`  AS  select `a`.`id` AS `id`,`a`.`ProjProgressCode` AS `ProjProgressCode`,`a`.`projCode` AS `projCode`,`a`.`taskCode` AS `taskCode`,`a`.`weight_progress` AS `weight_progress`,`a`.`attachment` AS `attachment`,`a`.`report` AS `report`,`a`.`reported_by_id` AS `reported_by_id`,`a`.`pick_date` AS `pick_date`,`a`.`by_id` AS `by_id`,`a`.`updated_by` AS `updated_by`,`a`.`created_at` AS `created_at`,`a`.`updated_at` AS `updated_at`,`b`.`deleted` AS `taskDeleted`,`a`.`deleted` AS `deleted` from (`tbl_proj_progress` `a` left join `tbl_task` `b` on(`a`.`taskCode` = `b`.`taskCode`)) order by `a`.`created_at` desc ;

-- --------------------------------------------------------

--
-- Structure for view `view_users`
--
DROP TABLE IF EXISTS `view_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_users`  AS  select `a`.`id` AS `id`,`a`.`company_id` AS `company_id`,`a`.`apiKey` AS `apiKey`,`a`.`ACNo` AS `ACNo`,`a`.`name` AS `name`,`a`.`email` AS `email`,`a`.`email_verified_at` AS `email_verified_at`,`a`.`password` AS `password`,`a`.`deleted` AS `deleted`,`a`.`is_admin` AS `is_admin`,`a`.`account_type` AS `account_type`,(select `u`.`name` from `users` `u` where `u`.`company_id` = `a`.`updated_by`) AS `updated_by`,(select `u`.`name` from `users` `u` where `u`.`company_id` = `a`.`created_by`) AS `created_by`,`a`.`remember_token` AS `remember_token`,`a`.`created_at` AS `created_at`,`a`.`updated_at` AS `updated_at` from `users` `a` order by `a`.`created_at` desc ;

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
-- Indexes for table `tbl_activity_log`
--
ALTER TABLE `tbl_activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_activity_log_img`
--
ALTER TABLE `tbl_activity_log_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_emp_proj`
--
ALTER TABLE `tbl_emp_proj`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_manage_access_right`
--
ALTER TABLE `tbl_manage_access_right`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_manage_access_right_per_user`
--
ALTER TABLE `tbl_manage_access_right_per_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_member`
--
ALTER TABLE `tbl_member`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `tbl_proj_progress`
--
ALTER TABLE `tbl_proj_progress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_proj_progress_img`
--
ALTER TABLE `tbl_proj_progress_img`
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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `date_time_records`
--
ALTER TABLE `date_time_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=494;

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
-- AUTO_INCREMENT for table `tbl_activity_log`
--
ALTER TABLE `tbl_activity_log`
  MODIFY `id` bigint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_activity_log_img`
--
ALTER TABLE `tbl_activity_log_img`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_emp_proj`
--
ALTER TABLE `tbl_emp_proj`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_manage_access_right`
--
ALTER TABLE `tbl_manage_access_right`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_manage_access_right_per_user`
--
ALTER TABLE `tbl_manage_access_right_per_user`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `tbl_member`
--
ALTER TABLE `tbl_member`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_projectlist`
--
ALTER TABLE `tbl_projectlist`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_projtask`
--
ALTER TABLE `tbl_projtask`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_proj_progress`
--
ALTER TABLE `tbl_proj_progress`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_proj_progress_img`
--
ALTER TABLE `tbl_proj_progress_img`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_task`
--
ALTER TABLE `tbl_task`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
