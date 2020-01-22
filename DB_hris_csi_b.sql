-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2020 at 04:51 AM
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
-- Database: `hris_csi_b`
--

-- --------------------------------------------------------

--
-- Table structure for table `applicant_achievement`
--

CREATE TABLE `applicant_achievement` (
  `ind` bigint(20) NOT NULL,
  `applicant_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `achievement` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_education`
--

CREATE TABLE `applicant_education` (
  `applicant_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hs_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hs_graduate` date DEFAULT NULL,
  `educ_attainment` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_graduated` date DEFAULT NULL,
  `school_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applicant_education`
--

INSERT INTO `applicant_education` (`applicant_id`, `hs_name`, `hs_graduate`, `educ_attainment`, `course`, `date_graduated`, `school_name`) VALUES
('AP-1', 'Compostella National High School', '1995-03-03', '', '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `applicant_emergency`
--

CREATE TABLE `applicant_emergency` (
  `ind` bigint(20) NOT NULL,
  `applicant_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relationship` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applicant_emergency`
--

INSERT INTO `applicant_emergency` (`ind`, `applicant_id`, `name`, `address`, `contact`, `relationship`) VALUES
(1, 'AP-1', 'Gilda CaÃ±ete', '', '0997456888', 'Wife');

-- --------------------------------------------------------

--
-- Table structure for table `applicant_employement`
--

CREATE TABLE `applicant_employement` (
  `ind` bigint(20) NOT NULL,
  `applicant_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employer_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applicant_employement`
--

INSERT INTO `applicant_employement` (`ind`, `applicant_id`, `employer_name`, `position`, `start_date`, `end_date`) VALUES
(1, 'AP-1', 'Kentech Elevator Service', 'Installer', '2016-11-12', '2018-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `applicant_information`
--

CREATE TABLE `applicant_information` (
  `ind` bigint(20) NOT NULL,
  `applicant_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `citizenship` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birtdate` date NOT NULL,
  `birthplace` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_add` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_add2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_city` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_prov` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_zip` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prov_add` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prov_add2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prov_city` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prov_prov` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prov_zip` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apply_position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expected_salary` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_date` date NOT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applicant_information`
--

INSERT INTO `applicant_information` (`ind`, `applicant_id`, `lname`, `fname`, `mname`, `gender`, `citizenship`, `status`, `birtdate`, `birthplace`, `contact_no`, `city_add`, `city_add2`, `city_city`, `city_prov`, `city_zip`, `personal_email`, `prov_add`, `prov_add2`, `prov_city`, `prov_prov`, `prov_zip`, `apply_position`, `expected_salary`, `apply_date`, `created_by`, `created_date`, `lu_by`, `lu_date`) VALUES
(1, 'AP-1', 'CaÃ±ete', 'Chris', '', 'Male', 'Filipino', 'Married', '1980-08-03', 'Davao', '09067367056', 'No. 70 Purok 13 South Daang Hari', '', 'Taguig Ciy', 'Manila', '', 'chriscanete@yahoo.com', 'No. 70 Purok 13 South Daang Hari', '', 'Taguig Ciy', 'Manila', '', 'Installer', '', '2019-07-31', 'admin', '2019-07-31 02:56:38', 'admin', '2019-07-31 02:56:38');

-- --------------------------------------------------------

--
-- Table structure for table `applicant_licence`
--

CREATE TABLE `applicant_licence` (
  `ind` bigint(20) NOT NULL,
  `applicant_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `licence_no` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_issue` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_training`
--

CREATE TABLE `applicant_training` (
  `ind` bigint(20) NOT NULL,
  `applicant_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificate_no` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_issue` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `approvers_group`
--

CREATE TABLE `approvers_group` (
  `id` int(11) NOT NULL,
  `approvers_level1_id` int(11) DEFAULT NULL,
  `approvers_level2_id` int(11) DEFAULT NULL,
  `approver_level1` varchar(50) DEFAULT NULL,
  `approver_level2` varchar(50) DEFAULT NULL,
  `company_id` varchar(50) NOT NULL,
  `company` varchar(191) NOT NULL,
  `department` varchar(191) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(191) NOT NULL,
  `updated_by` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `approvers_group`
--

INSERT INTO `approvers_group` (`id`, `approvers_level1_id`, `approvers_level2_id`, `approver_level1`, `approver_level2`, `company_id`, `company`, `department`, `deleted`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '2019-0500', NULL, '2018-049', '1', 'Fulfillment', 0, 'admin', 'admin', '2019-07-10 08:19:45', '2019-07-10 08:19:45'),
(2, 1, 2, '2019-0500', '2019-1111', '2018-042', '1', 'Fulfillment', 0, 'admin', 'admin', '2019-07-10 08:19:45', '2019-07-10 08:19:45'),
(3, 1, NULL, '2019-0500', NULL, '2018-003', '1', 'PMD', 0, 'admin', 'admin', '2019-07-11 02:34:40', '2019-07-11 02:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `approvers_table`
--

CREATE TABLE `approvers_table` (
  `id` bigint(20) NOT NULL,
  `company_id` varchar(11) NOT NULL,
  `company_ind` varchar(11) NOT NULL,
  `department` varchar(191) NOT NULL,
  `team` varchar(191) NOT NULL,
  `level` int(11) NOT NULL,
  `deleted` int(2) NOT NULL DEFAULT 0,
  `created_by` varchar(255) NOT NULL,
  `lu_by` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `approvers_table`
--

INSERT INTO `approvers_table` (`id`, `company_id`, `company_ind`, `department`, `team`, `level`, `deleted`, `created_by`, `lu_by`, `created_at`, `updated_at`) VALUES
(1, '2019-001', '1', 'Fulfillment', 'PROJECT MANAGEMENT', 1, 0, 'admin', 'admin', '2019-07-18 09:33:37', '2019-07-18 09:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `ind` bigint(20) NOT NULL,
  `asset_date` date NOT NULL,
  `qty` int(11) NOT NULL,
  `asset_tagno` bigint(20) NOT NULL,
  `model_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assigned_person` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferred` int(2) NOT NULL DEFAULT 0,
  `transferred_person` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`ind`, `asset_date`, `qty`, `asset_tagno`, `model_no`, `type`, `brand`, `assigned_person`, `description`, `transferred`, `transferred_person`, `created_by`, `created_date`, `lu_by`, `lu_date`, `deleted`) VALUES
(1, '0000-00-00', 1, 12345, 'A12345', 'Type1', 'brand A', '2019-0012', 'testing', 0, '', 'admin', '2019-07-17 08:42:06', 'admin', '2019-07-17 08:51:17', 0),
(2, '0000-00-00', 1, 123456, '1', 'Type1', 'brand A', '2019-001', 'testing', 0, '', 'admin', '2019-07-17 08:43:00', 'admin', '2019-07-17 08:43:00', 0),
(4, '2019-07-17', 1, 12345765, 'A123B', 'test', 'test', '2019-0012', '', 0, '', 'admin', '2019-07-17 08:55:24', 'admin', '2019-07-17 08:55:24', 0),
(5, '2019-07-17', 1, 2121123, 'A1245H', 'test', 'test', '2019-0012', '', 0, '', 'admin', '2019-07-17 09:20:20', 'admin', '2019-07-17 09:20:20', 0),
(6, '2019-07-17', 1, 14567, 'A123', 'Type 1', 'Brand 1', '2019-0012', '', 0, '', 'admin', '2019-07-17 09:21:30', 'admin', '2019-07-17 09:21:30', 0),
(7, '2019-07-17', 1, 456, 'A567', 'test', 'test', '2019-0012', '', 0, '', 'admin', '2019-07-17 09:24:56', 'admin', '2019-07-17 09:24:56', 0),
(8, '2019-07-16', 1, 1010, 'CC01', 'C', 'AOC', '2019-0012', 'Test', 0, '', 'admin', '2019-07-17 09:26:08', 'admin', '2019-07-17 09:26:08', 0),
(9, '2019-07-17', 1, 12097, 'A456', 'test', 'test', '2019-0012', '', 0, '', 'admin', '2019-07-17 09:53:52', 'admin', '2019-07-17 09:53:52', 0),
(10, '2019-07-17', 1, 1234765, 'A1245', 'test', 'test', '2019-0012', '', 0, '', 'admin', '2019-07-17 10:27:25', 'admin', '2019-07-17 10:27:25', 0),
(11, '2019-07-17', 1, 123450987, 'A167', 'test', 'test', '2019-0012', '', 0, '', 'admin', '2019-07-17 10:30:27', 'admin', '2019-07-17 10:30:27', 0),
(12, '2019-07-17', 1, 987, 'A0987', 'test', 'test', '2019-0012', '', 0, '', 'admin', '2019-07-17 10:56:35', 'admin', '2019-07-17 10:56:35', 0),
(13, '2019-07-17', 1, 98671, '1ASD', 'test', 'test', '2019-0012', '', 0, '', 'admin', '2019-07-17 11:09:22', 'admin', '2019-07-17 11:09:22', 0),
(14, '2019-08-02', 1, 1, '1', 'Tools', 'Stanley', '2019-162', 'Side Cutter', 0, '', 'admin', '2019-08-03 02:20:46', 'admin', '2019-08-03 02:22:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `assets_old`
--

CREATE TABLE `assets_old` (
  `ind` bigint(20) NOT NULL,
  `asset_date` datetime NOT NULL,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `logbook_no` int(11) DEFAULT NULL,
  `asset_tagno` bigint(20) NOT NULL,
  `assigned_person` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferred_person` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets_upload`
--

CREATE TABLE `assets_upload` (
  `id` int(11) NOT NULL,
  `assets_tagno` varchar(50) NOT NULL,
  `company_id` varchar(50) NOT NULL,
  `file` varchar(191) NOT NULL,
  `type` varchar(50) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assets_upload`
--

INSERT INTO `assets_upload` (`id`, `assets_tagno`, `company_id`, `file`, `type`, `size`) VALUES
(1, '0987', '2019-0012', '86671-42428459-1-f.jpg', 'image/jpeg', 28),
(2, '098671', '2019-0012', '18155-42428459-1-f.jpg', 'image/jpeg', 28),
(3, '1', '2019-162', '37072-svs.jpg', 'image/jpeg', 35);

-- --------------------------------------------------------

--
-- Table structure for table `certificates_trainings`
--

CREATE TABLE `certificates_trainings` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificate_no` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_issue` date NOT NULL,
  `date_valid` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certificates_trainings`
--

INSERT INTO `certificates_trainings` (`ind`, `company_id`, `title`, `certificate_no`, `date_issue`, `date_valid`) VALUES
(1, '2019-207', 'Shielded Metal Arc Welding NC2', '17045802024109', '2017-10-27', '2022-10-26');

-- --------------------------------------------------------

--
-- Table structure for table `childrens_information`
--

CREATE TABLE `childrens_information` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date DEFAULT NULL,
  `occupation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `childrens_information`
--

INSERT INTO `childrens_information` (`ind`, `company_id`, `name`, `birthdate`, `occupation`) VALUES
(1, '2019-176', 'Janella Jireh D. Tabiando', '2018-07-26', ''),
(2, '2019-162', 'Jhon Gabriel A. Pedrajas', '2018-04-26', ''),
(3, '2019-162', 'Princess Claire A. Pedrajas', '2019-05-26', '');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` bigint(20) NOT NULL,
  `company_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bir_rdo_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_bir_address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_tin_no` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phic` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sss` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hdmf` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorize_sign_bir` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `company_name`, `company_address`, `zip_code`, `contact_number`, `bir_rdo_code`, `company_bir_address`, `company_tin_no`, `phic`, `sss`, `hdmf`, `bank_name`, `bank_account`, `authorize_sign_bir`, `active`, `created_by`, `created_date`, `lu_by`, `lu_date`) VALUES
(1, 'SVS Solutions Corporation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'admin', '2018-06-18 10:30:35', 'admin', '2018-06-18 13:59:06'),
(2, 'New Company', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', 'admin', '2018-06-18 13:29:50', 'admin', '2018-06-18 13:41:09'),
(3, 'SamPLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', 'admin', '2018-06-18 13:46:49', 'admin', '2018-06-18 18:40:54'),
(4, 'Company SSS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'admin', '2018-06-18 13:46:56', 'admin', '2018-06-19 11:14:44'),
(5, 'Trial Compan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'admin', '2018-08-29 17:55:33', 'admin', '2018-08-29 18:02:45');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `ind` bigint(20) NOT NULL,
  `department_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_ind` bigint(20) NOT NULL DEFAULT 1,
  `active` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `lu_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`ind`, `department_name`, `company_ind`, `active`, `created_by`, `created_date`, `lu_by`, `lu_date`) VALUES
(8, 'PMD', 1, 'yes', 'marlon', '2017-12-07 16:37:45', 'admin', '2018-01-02 09:33:35'),
(10, 'Sales', 1, 'yes', 'marlon', '2017-12-07 16:53:19', 'admin', '2017-12-19 11:58:35'),
(11, 'Fulfillment', 1, 'yes', 'marlon', '2017-12-07 16:53:46', 'admin', '2018-01-02 09:33:46'),
(12, 'Supply Chain', 1, 'yes', 'marlon', '2017-12-07 16:54:00', 'admin', '2017-12-13 14:08:58'),
(13, 'Research and Development', 1, 'yes', 'marlon', '2017-12-07 16:54:23', 'admin', '2018-01-02 17:23:18'),
(24, 'Finance', 1, 'yes', 'admin', '2018-02-10 21:10:41', 'admin', '2019-06-14 05:27:42'),
(25, 'Modernisation', 1, 'yes', 'admin', '2019-06-14 05:28:08', 'admin', '2019-06-14 05:28:08'),
(26, 'Maintenance / Repair', 1, 'yes', 'admin', '2019-06-14 05:28:21', 'admin', '2019-06-14 05:28:21');

-- --------------------------------------------------------

--
-- Table structure for table `education_background`
--

CREATE TABLE `education_background` (
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hs_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hs_graduate` date DEFAULT NULL,
  `educ_attainment` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_graduated` date DEFAULT NULL,
  `school_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education_background`
--

INSERT INTO `education_background` (`company_id`, `hs_name`, `hs_graduate`, `educ_attainment`, `course`, `date_graduated`, `school_name`) VALUES
('2019-001', '', '0000-00-00', 'Master degree', 'BS ECE', '0000-00-00', 'DLSU'),
('2019-003', 'Father Saturnino Urios University', '2007-03-20', 'Bachelor degree', 'Bachelors of Science in Marine Engineering', '2013-05-22', 'Malayan College Laguna'),
('2019-004', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-005', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-0050', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-006', 'San Pedro National High School', '0000-00-00', 'Bachelor degree', 'Bachelor of Science in Mechanical Engineering', '2018-09-12', 'Bulacan State University'),
('2019-0180', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-0900', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-100', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-1000', 'San Jose High School', '0000-00-00', '', '', '0000-00-00', ''),
('2019-1001', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-1002', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-1003', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-1004', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-1005', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-1006', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-1007', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-1008', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-1009', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-1010', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-103', 'Andres Bonifacio Integrated School', '2007-03-24', '', '', '0000-00-00', ''),
('2019-109', 'Mataas na Paaralan Neptail A. Gonzales', '2004-03-18', 'Undergraduate', '', '0000-00-00', 'Mandaluyong Mandaluyong Devepment Center'),
('2019-11', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-110', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-111', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-112', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-113', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-114', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-115', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-116', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-117', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-118', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-134', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-135', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-136', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-137', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-138', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-139', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-140', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-143', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-144', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-145', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-147', 'Almagro Samar', '1986-03-24', '', '', '0000-00-00', ''),
('2019-151', 'San Roque National High School', '0000-00-00', '', '', '0000-00-00', ''),
('2019-152', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-153', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-154', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-155', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-156', 'Carlos ', '0000-00-00', 'Bachelor degree', 'Major in Electrical', '0000-00-00', 'University Of Rizal System'),
('2019-157', 'Francisco P. Felix High School', '0000-00-00', '', '', '0000-00-00', ''),
('2019-158', 'Antipolo National High school', '0000-00-00', 'Vocational', '', '0000-00-00', 'TECDD SMDW WELDER'),
('2019-159', 'Araullo High School', '0000-00-00', '', '', '0000-00-00', ''),
('2019-161', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-162', 'WENCELAO S. GRIO NATIONAL HIGH SCHOOL', '0000-00-00', '', '', '0000-00-00', ''),
('2019-163', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-164', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-165', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-166', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-170', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-171', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-172', 'Antipolo National High school', '0000-00-00', '', '', '0000-00-00', ''),
('2019-176', 'San Jose National High School', '0000-00-00', '', 'Seafarer Rating Course', '2012-03-25', 'Pangasinan Merchant Marine Academy'),
('2019-2', '', '0000-00-00', '', '', '0000-00-00', 'Arnel Guillermo Baraquiel'),
('2019-200', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-2000', '', '0000-00-00', 'Undergraduate', 'ELECTRICAL', '2017-04-20', 'EARIST MANILA'),
('2019-2001', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-201', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-202', 'Bagong Silang High', '0000-00-00', '', '', '0000-00-00', ''),
('2019-203', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-204', '', '0000-00-00', 'Vocational', 'EIM', '2018-07-02', 'TESDA Calumpit'),
('2019-205', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-206', 'Arellano University', '1991-03-24', 'Undergraduate', 'BS Mechanical Engineering', '0000-00-00', 'Central Colleges Of the Philippines'),
('2019-207', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-208', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-3000', 'Carlos Botong Francisco Memorial High School', '2011-03-24', '', '', '0000-00-00', ''),
('2019-8', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-8000', '', '0000-00-00', '', '', '0000-00-00', ''),
('2019-90', '', '0000-00-00', '', '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contact`
--

CREATE TABLE `emergency_contact` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relationship` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emergency_contact`
--

INSERT INTO `emergency_contact` (`ind`, `company_id`, `name`, `address`, `contact`, `relationship`) VALUES
(1, '2019-003', 'Romeo A. Laqui', '#504 B. Laqui St., Brgy. 1, Cuenca, Batangas', '09983230164', 'Father'),
(2, '2019-109', 'Jesaly A. Bulcase', '', '09085403342', ''),
(3, '2019-2', 'Maribel Mina Baraquiel', '136D. Marcelo ST. Rosario Montalban Rizal', '09206217014', 'Wife'),
(4, '2019-8', 'Arlene Mangalino', '', '023595667', ''),
(5, '2019-100', 'Rosario Gutierez', '', '09123479989', ''),
(6, '2019-110', 'Pearl De Guzman', '', '09173555349', ''),
(7, '2019-111', 'Veronica C. Merced', '', '09993016342', ''),
(8, '2019-112', 'Mariecris C. Aquino', '', '09089289913', ''),
(9, '2019-113', 'Gilberto Hernandez', '', '09283056011', ''),
(10, '2019-114', 'Melina Pore Morabe', '', '09565202142', ''),
(11, '2019-115', 'Jenne A. Balbuena', '', '09185303557', ''),
(12, '2019-116', 'Jan Padoga', '', '09457650035', ''),
(13, '2019-117', 'Eleono Palomaria', '', '09771088213', ''),
(14, '2019-118', 'Gloria Niedo', '', '09098937455', ''),
(15, '2019-201', 'Marieta Lopez', '', '09107620396', ''),
(16, '2019-203', 'Meriella V. Bisnan', '', '09683637302', ''),
(17, '2019-134', 'Lorenz Serrano', '', '', ''),
(18, '2019-135', 'Marienelle S. Salon', '', '09499136079', ''),
(19, '2019-136', 'Kris Anne Grace C. Reyes', '', '0958886536', ''),
(20, '2019-137', 'Teresita Mangalino', '', '5820261', ''),
(21, '2019-138', 'Marie Irish Cabilatazan', '', '09561058160', ''),
(22, '2019-139', 'Gibunuelyn S. Mangalino', '', '09338180660', ''),
(23, '2019-151', 'Pearl Jean Garcia', '', '09187661481', 'Wife'),
(24, '2019-004', 'Shiela May Niedo', 'Teresa Rizal', '09306314187', 'Daughter'),
(25, '2019-158', 'Angelica Garcia', 'Sitio Ibabaw Dulumbayan Teresa Rizal', '09452746626', 'sister'),
(26, '2019-159', 'Medelyn Cayanan', 'Bacoor Cavite', '09991708905', 'Wife'),
(27, '2019-161', 'Angelica Garcia', 'Sitio Ibabaw Dulumbayan Teresa Rizal', '09452746626', 'Sister'),
(28, '2019-156', 'Tessie Roaring', 'Sitio Ibabaw Dulumbayan Teresa Rizal', '09475713226', 'Mother'),
(29, '2019-2000', 'Gerardo Sta. Ana', '', '09273517014', ''),
(30, '2019-103', 'Sheila Marie Santiago', '', '09215197599', ''),
(31, '2019-202', 'Edwin Rotea', '', '09480137425', 'Brother'),
(32, '2019-157', 'Jonalyn Victorioso', 'Sitio Ibabaw Dulumbayan Teresa Rizal', '09298324929', 'sister'),
(33, '2019-157', 'Daryl Jean Victorioso', 'Sitio Ibabaw Dulumbayan Teresa Rizal', '09751446888', 'Mother'),
(34, '2019-172', 'Juvilyn Palinca', '', '09489049422', ''),
(35, '2019-204', 'Bernard Vargas', '', '09656371495', ''),
(36, '2019-206', 'Starina L. Virgo', '', '09293191301', ''),
(37, '2019-2001', 'Gobillin B. Baguion', '', '09095997351', ''),
(38, '2019-166', 'Clyd Pedrajas', '', '09093453883', ''),
(39, '2019-164', 'Joan Bato', '', '09203440244', 'Wife'),
(40, '2019-006', 'Jodisa Paguinto', '#585 San Pablo Hagonoy, Bulacan', '09097988328', 'Mother'),
(41, '2019-176', 'Jocelyn D. Tabiando', 'Dolaoan Anda Pangasinan', '09464987688', 'Wife'),
(42, '2019-162', 'Shiela Mae Pedrajas', 'Cabatuan IloIlo', '09482877812', '');

-- --------------------------------------------------------

--
-- Table structure for table `employee_achievement`
--

CREATE TABLE `employee_achievement` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `achievement` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_compensation`
--

CREATE TABLE `employee_compensation` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Daily',
  `weekly_days` int(11) NOT NULL DEFAULT 6,
  `bank_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payroll_account_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxable_allowance` decimal(11,2) NOT NULL DEFAULT 0.00,
  `taxable_allowance_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'prorated',
  `non_taxable_allowance` decimal(11,2) NOT NULL DEFAULT 0.00,
  `non_taxable_allowance_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'prorated',
  `basic_salary` decimal(11,2) NOT NULL DEFAULT 0.00,
  `daily_rate` decimal(11,2) NOT NULL DEFAULT 0.00,
  `hourly_rate` decimal(11,2) NOT NULL DEFAULT 0.00,
  `tax_shield` decimal(11,2) NOT NULL DEFAULT 0.00,
  `gross_salary` decimal(11,2) NOT NULL DEFAULT 0.00,
  `hrs_per_day` decimal(8,2) NOT NULL DEFAULT 0.00,
  `with_category_rate` int(2) NOT NULL DEFAULT 0,
  `category_rate_id` bigint(20) NOT NULL DEFAULT 0,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_compensation`
--

INSERT INTO `employee_compensation` (`ind`, `company_id`, `salary_type`, `weekly_days`, `bank_name`, `payroll_account_no`, `taxable_allowance`, `taxable_allowance_type`, `non_taxable_allowance`, `non_taxable_allowance_type`, `basic_salary`, `daily_rate`, `hourly_rate`, `tax_shield`, `gross_salary`, `hrs_per_day`, `with_category_rate`, `category_rate_id`, `created_by`, `created_date`, `lu_by`, `lu_date`, `deleted`) VALUES
(1, '2019-004', 'Semi-Monthly', 6, '', '0012345678', '0.00', 'prorated', '0.00', 'prorated', '6677.33', '512.00', '64.00', '0.00', '6677.33', '8.00', 1, 1, 'admin', '2019-06-14 02:59:57', 'admin', '2019-06-14 03:00:51', 0),
(2, '2019-001', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-06-14 05:26:16', 'admin', '2019-06-14 05:26:16', 0),
(3, '2019-003', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-06-14 05:41:14', 'admin', '2019-06-14 05:41:14', 0),
(4, '2019-006', 'Monthly', 6, 'BPI', '87916843184', '0.00', 'prorated', '0.00', 'prorated', '18000.00', '690.10', '86.26', '0.00', '18000.00', '8.00', 0, 0, 'admin', '2019-06-14 05:43:12', 'admin', '2019-07-16 04:50:32', 0),
(5, '2019-109', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-06-18 00:43:25', 'admin', '2019-06-18 00:43:25', 0),
(6, '2019-2', 'Monthly', 6, 'BPI', '2219-1447-28', '0.00', 'prorated', '0.00', 'prorated', '16954.17', '650.00', '81.25', '0.00', '16954.17', '8.00', 0, 0, 'admin', '2019-06-18 00:57:33', 'admin', '2019-07-16 03:40:33', 0),
(7, '2019-103', 'Daily', 6, 'BPI', '8849-1633-89', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-06-18 01:05:52', 'admin', '2019-06-18 01:11:44', 0),
(8, '2019-8', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-06-18 01:24:36', 'admin', '2019-06-18 01:24:36', 0),
(9, '2019-100', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-06-18 01:33:02', 'admin', '2019-06-18 01:33:02', 0),
(10, '2019-110', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-06-18 01:46:29', 'admin', '2019-06-18 01:46:29', 0),
(11, '2019-111', 'Monthly', 6, 'BPI', '8849-1629-86', '0.00', 'prorated', '0.00', 'prorated', '15200.00', '582.75', '72.84', '0.00', '15200.00', '8.00', 0, 0, 'admin', '2019-06-18 01:55:01', 'admin', '2019-07-16 04:55:06', 0),
(12, '2019-112', 'Monthly', 6, '', '8849-1631-68', '0.00', 'prorated', '0.00', 'prorated', '15200.00', '582.75', '72.84', '0.00', '15200.00', '8.00', 0, 0, 'admin', '2019-06-18 02:00:41', 'admin', '2019-07-16 03:30:25', 0),
(13, '2019-113', 'Monthly', 6, 'BPI', '1919-1686-48', '0.00', 'prorated', '0.00', 'prorated', '15200.00', '582.75', '72.84', '0.00', '15200.00', '8.00', 0, 0, 'admin', '2019-06-18 02:05:08', 'admin', '2019-07-16 04:49:34', 0),
(14, '2019-114', 'Monthly', 6, 'BPi', '8849-1627-81', '0.00', 'prorated', '0.00', 'prorated', '16954.17', '650.00', '81.25', '0.00', '16954.17', '8.00', 0, 0, 'admin', '2019-06-18 02:13:16', 'admin', '2019-07-16 04:56:53', 0),
(15, '2019-115', 'Monthly', 6, 'BPI', '8849-1631-76', '0.00', 'prorated', '0.00', 'prorated', '15500.00', '594.25', '74.28', '0.00', '15500.00', '8.00', 0, 0, 'admin', '2019-06-18 02:20:46', 'admin', '2019-07-16 03:34:50', 0),
(16, '2019-116', 'Daily', 6, 'BPI', '8849-1627-57', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-06-18 02:30:38', 'admin', '2019-06-18 02:30:52', 0),
(17, '2019-117', 'Monthly', 6, 'BPI', '8849-1629-51', '0.00', 'prorated', '0.00', 'prorated', '15500.00', '594.25', '74.28', '0.00', '15500.00', '8.00', 0, 0, 'admin', '2019-06-18 02:41:58', 'admin', '2019-07-12 09:08:50', 0),
(18, '2019-118', 'Daily', 6, 'BPI', '8849-1640-16', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-06-18 02:50:37', 'admin', '2019-06-18 02:50:50', 0),
(19, '2019-11', 'Monthly', 6, 'BPI', '4059 3364 95', '0.00', 'prorated', '1300.00', 'prorated', '13400.00', '513.74', '64.22', '0.00', '14700.00', '8.00', 0, 0, 'admin', '2019-06-18 03:40:49', 'admin', '2019-07-16 04:48:28', 0),
(20, '2019-201', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-06-28 00:17:36', 'admin', '2019-06-28 00:17:36', 0),
(21, '2019-154', 'Monthly', 6, 'BPI', '3149 2468 26', '0.00', 'prorated', '2600.00', 'prorated', '16640.00', '637.96', '79.74', '0.00', '19240.00', '8.00', 0, 0, 'admin', '2019-06-28 07:50:37', 'admin', '2019-07-16 05:00:39', 0),
(22, '2019-144', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-03 07:28:21', 'admin', '2019-07-03 07:28:21', 0),
(23, '2019-145', 'Monthly', 6, 'BPI', '4979-1366-98', '0.00', 'prorated', '0.00', 'prorated', '16954.17', '650.00', '81.25', '0.00', '16954.17', '8.00', 0, 0, 'admin', '2019-07-16 03:41:00', 'admin', '2019-07-16 03:42:03', 0),
(24, '2019-203', 'Monthly', 6, 'BPI', '3819-1312-94', '0.00', 'prorated', '0.00', 'prorated', '25000.00', '958.47', '119.81', '0.00', '25000.00', '8.00', 0, 0, 'admin', '2019-07-16 03:42:28', 'admin', '2019-07-16 03:43:37', 0),
(25, '2019-147', 'Monthly', 6, 'BPI', '0479 5882 36 ', '0.00', 'prorated', '0.00', 'prorated', '17000.00', '651.76', '81.47', '0.00', '17000.00', '8.00', 0, 0, 'admin', '2019-07-16 03:43:50', 'admin', '2019-07-16 03:44:41', 0),
(26, '2019-200', 'Monthly', 6, 'BPI', '4929 1998 85', '0.00', 'prorated', '1300.00', 'prorated', '13400.00', '0.00', '0.00', '0.00', '14700.00', '0.00', 0, 0, 'admin', '2019-07-16 03:54:00', 'admin', '2019-07-16 03:57:00', 0),
(27, '2019-153', 'Monthly', 6, 'BPI', '4279 0125 05', '0.00', 'prorated', '0.00', 'prorated', '18000.00', '690.10', '86.26', '0.00', '18000.00', '8.00', 0, 0, 'admin', '2019-07-16 03:57:22', 'admin', '2019-07-16 05:28:30', 0),
(28, '2019-151', 'Monthly', 6, 'BPI', '4059 3415 03', '0.00', 'prorated', '1300.00', 'prorated', '13400.00', '513.74', '64.22', '0.00', '14700.00', '8.00', 0, 0, 'admin', '2019-07-16 03:58:56', 'admin', '2019-07-16 04:47:08', 0),
(29, '2019-152', 'Monthly', 6, 'BPI', '9669 1373 27', '0.00', 'prorated', '2600.00', 'prorated', '15600.00', '598.08', '74.76', '0.00', '18200.00', '8.00', 0, 0, 'admin', '2019-07-16 04:57:30', 'admin', '2019-07-16 04:58:49', 0),
(30, '2019-0180', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-18 09:24:47', 'admin', '2019-07-18 09:24:47', 0),
(31, '2019-0050', 'Semi-Monthly', 6, '', '787878878787878', '0.00', 'prorated', '0.00', 'prorated', '6677.33', '512.00', '64.00', '0.00', '6677.33', '8.00', 1, 1, 'admin', '2019-07-19 03:06:43', 'admin', '2019-07-19 03:07:18', 0),
(32, '2019-90', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-23 03:21:37', 'admin', '2019-07-23 03:21:37', 0),
(33, '2019-157', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-24 02:42:42', 'admin', '2019-07-24 02:42:42', 0),
(34, '2019-158', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-24 05:31:52', 'admin', '2019-07-24 05:31:52', 0),
(35, '2019-159', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-24 05:41:28', 'admin', '2019-07-24 05:41:28', 0),
(36, '2019-161', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-24 05:50:50', 'admin', '2019-07-24 05:50:50', 0),
(37, '2019-162', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-26 05:11:56', 'admin', '2019-07-26 05:11:56', 0),
(38, '2019-163', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-26 05:20:35', 'admin', '2019-07-26 05:20:35', 0),
(39, '2019-164', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-26 05:29:08', 'admin', '2019-07-26 05:29:08', 0),
(40, '2019-165', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-26 05:35:35', 'admin', '2019-07-26 05:35:35', 0),
(41, '2019-166', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-26 05:44:11', 'admin', '2019-07-26 05:44:11', 0),
(42, '2019-143', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-27 00:27:29', 'admin', '2019-07-27 00:27:29', 0),
(43, '2019-139', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-27 03:02:33', 'admin', '2019-07-27 03:02:33', 0),
(44, '2019-170', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-27 05:47:03', 'admin', '2019-07-27 05:47:03', 0),
(45, '2019-171', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-27 05:56:00', 'admin', '2019-07-27 05:56:00', 0),
(46, '2019-0900', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-07-29 05:43:01', 'admin', '2019-07-29 05:43:01', 0),
(47, '2019-1001', 'Weekly', 6, '', '00000000000', '0.00', 'prorated', '0.00', 'prorated', '20000.00', '3333.33', '333.33', '0.00', '20000.00', '10.00', 0, 0, 'admin', '2019-08-27 17:53:24', 'admin', '2019-09-11 15:51:21', 0),
(48, '2019-1002', 'Weekly', 6, '', '0000000000', '0.00', 'prorated', '0.00', 'prorated', '20000.00', '3333.33', '333.33', '0.00', '20000.00', '10.00', 0, 0, 'admin', '2019-08-28 11:04:22', 'admin', '2019-09-11 15:51:54', 0),
(49, '2019-1003', 'Weekly', 6, '', '00000000000', '0.00', 'prorated', '0.00', 'prorated', '20000.00', '3333.33', '333.33', '0.00', '20000.00', '10.00', 0, 0, 'admin', '2019-08-28 13:24:35', 'admin', '2019-09-11 15:52:30', 0),
(50, '2019-1004', 'Weekly', 6, '', '0000000000', '0.00', 'prorated', '0.00', 'prorated', '20000.00', '3333.33', '333.33', '0.00', '20000.00', '10.00', 0, 0, 'admin', '2019-08-28 13:55:10', 'admin', '2019-09-11 15:52:47', 0),
(51, '2019-1005', 'Weekly', 6, '', '00', '0.00', 'prorated', '0.00', 'prorated', '20000.00', '3333.33', '333.33', '0.00', '20000.00', '10.00', 0, 0, 'admin', '2019-08-28 14:03:34', 'admin', '2019-09-11 15:53:15', 0),
(52, '2019-1006', 'Weekly', 6, '', '000000', '0.00', 'prorated', '0.00', 'prorated', '20000.00', '3333.33', '333.33', '0.00', '20000.00', '10.00', 0, 0, 'admin', '2019-08-28 14:07:21', 'admin', '2019-09-11 15:53:29', 0),
(53, '2019-1007', 'Weekly', 6, '', '000', '0.00', 'prorated', '0.00', 'prorated', '20000.00', '3333.33', '333.33', '0.00', '20000.00', '10.00', 0, 0, 'admin', '2019-08-28 14:25:10', 'admin', '2019-09-11 15:53:57', 0),
(54, '2019-1008', 'Weekly', 6, '', 'test', '0.00', 'prorated', '0.00', 'prorated', '20000.00', '3333.33', '333.33', '0.00', '20000.00', '10.00', 0, 0, 'admin', '2019-08-28 17:02:49', 'admin', '2019-09-11 15:54:21', 0),
(55, '2019-1009', 'Weekly', 6, '', 'test', '0.00', 'prorated', '0.00', 'prorated', '20000.00', '3333.33', '333.33', '0.00', '20000.00', '10.00', 0, 0, 'admin', '2019-08-28 17:04:44', 'admin', '2019-09-11 15:54:34', 0),
(56, '2019-1010', 'Weekly', 6, '', 'test', '0.00', 'prorated', '0.00', 'prorated', '20000.00', '3333.33', '333.33', '0.00', '20000.00', '10.00', 0, 0, 'admin', '2019-08-28 17:06:25', 'admin', '2019-09-11 15:51:39', 0),
(57, '2019-204', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-09-02 10:53:34', 'admin', '2019-09-02 10:53:34', 0),
(58, '2019-208', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-09-09 15:33:09', 'admin', '2019-09-09 15:33:09', 0),
(59, '2019-3000', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-09-20 10:51:44', 'admin', '2019-09-20 10:51:44', 0),
(60, '2019-1000', 'Daily', 6, '', '', '0.00', 'prorated', '0.00', 'prorated', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, 'admin', '2019-09-20 11:17:00', 'admin', '2019-09-20 11:17:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_information`
--

CREATE TABLE `employee_information` (
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biometrics_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `with_fpt` int(11) NOT NULL DEFAULT 0,
  `company_ind` bigint(20) NOT NULL DEFAULT 1,
  `department` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employment_status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_employed` date DEFAULT NULL,
  `contract_duration` date DEFAULT NULL,
  `healthcard` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_information`
--

INSERT INTO `employee_information` (`company_id`, `biometrics_id`, `with_fpt`, `company_ind`, `department`, `team`, `employment_status`, `position`, `date_employed`, `contract_duration`, `healthcard`, `regular_date`) VALUES
('2019-001', '1', 0, 1, 'Fulfillment', 'PROJECT MANAGEMENT', 'Regular', 'General Manager', '2019-06-01', '0000-00-00', '', '2019-06-14'),
('2019-003', '3', 2, 1, 'Fulfillment', 'PROJECT MANAGEMENT', 'Regular', 'Operations Engineer', '2019-03-28', '0000-00-00', '', '2019-03-28'),
('2019-004', '4', 0, 1, 'Fulfillment', '', 'Regular', 'Sample', '2010-01-01', '0000-00-00', '000013123', '2010-01-01'),
('2019-005', '5', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Team Leader', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-0050', '50', 9, 1, 'Research and Development', '', 'Regular', 'Sample Position', '2019-07-18', '0000-00-00', '', '2019-07-19'),
('2019-006', '6', 7, 1, 'Maintenance / Repair', '', 'Regular', 'Cadet Engineer', '2019-04-01', '0000-00-00', '', '2019-06-12'),
('2019-0180', '180', 0, 1, 'Research and Development', '', 'Regular', 'TEST', '2019-07-11', '0000-00-00', '', '2019-07-17'),
('2019-0900', '900', 1, 1, 'Fulfillment', 'PROJECT MANAGEMENT', 'Regular', 'Sample', '2019-07-26', '0000-00-00', '', '2019-07-28'),
('2019-100', '100', 7, 1, 'Fulfillment', 'PROJECT MANAGEMENT', 'Regular', 'Mechanical Installer', '2019-06-18', '0000-00-00', '', '2019-06-18'),
('2019-1000', '1000', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Helper', '2019-08-29', '0000-00-00', '', '2019-08-29'),
('2019-1001', '1001', 0, 1, 'Finance', '', 'Probationary', 'Analysis Manager', '2017-10-10', '0000-00-00', '', '0000-00-00'),
('2019-1002', '1002', 0, 1, 'Finance', '', 'Regular', 'Finance Analyst', '2000-10-15', '0000-00-00', '', '2001-10-15'),
('2019-1003', '1003', 0, 1, 'Finance', '', 'Regular', 'Position', '2009-04-05', '0000-00-00', '', '2010-04-05'),
('2019-1004', '1004', 0, 1, 'Finance', '', 'Regular', 'Position', '2018-06-05', '0000-00-00', '', '2019-06-05'),
('2019-1005', '1005', 0, 1, 'Finance', '', 'Regular', 'Position', '2016-06-05', '0000-00-00', '', '2017-06-05'),
('2019-1006', '1006', 0, 1, 'Finance', '', 'Regular', 'Test', '2017-03-22', '0000-00-00', '', '2018-03-22'),
('2019-1007', '1007', 0, 1, 'Finance', '', 'Regular', 'Test', '2017-04-05', '0000-00-00', '', '2018-04-05'),
('2019-1008', '1008', 0, 1, 'Finance', '', 'Regular', 'Position', '2012-02-06', '0000-00-00', '', '2013-08-06'),
('2019-1009', '1009', 0, 1, 'Finance', '', 'Regular', 'Test', '2000-08-09', '0000-00-00', '', '2001-08-09'),
('2019-1010', '1010', 0, 1, 'Finance', '', 'Regular', 'Test', '2014-04-12', '0000-00-00', '', '2015-04-12'),
('2019-103', '103', 5, 1, 'Fulfillment', 'PROJECT MANAGEMENT', 'Regular', 'Mechanical Installer', '2019-04-30', '0000-00-00', '', '2019-06-18'),
('2019-109', '109', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-04-01', '0000-00-00', '', '2019-04-01'),
('2019-11', '11', 0, 1, 'Fulfillment', 'PROJECT MANAGEMENT', 'Regular', 'Mechanical Installer', '2019-06-18', '0000-00-00', '', '2019-06-18'),
('2019-110', '110', 7, 1, 'Fulfillment', 'PROJECT MANAGEMENT', 'Regular', 'Mechanical Installer', '2019-06-18', '0000-00-00', '', '2019-06-18'),
('2019-111', '111', 2, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-18', '0000-00-00', '', '2019-06-18'),
('2019-112', '112', 2, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-18', '0000-00-00', '', '2019-06-18'),
('2019-113', '113', 2, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-18', '0000-00-00', '', '2019-06-18'),
('2019-114', '114', 3, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-18', '0000-00-00', '', '2019-06-18'),
('2019-115', '115', 2, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-18', '0000-00-00', '', '2019-06-18'),
('2019-116', '116', 0, 1, 'Modernisation', '', 'Regular', 'Mechanical Installer', '2019-06-18', '0000-00-00', '', '2019-06-18'),
('2019-117', '117', 2, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-18', '0000-00-00', '', '2019-06-18'),
('2019-118', '118', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-18', '0000-00-00', '', '2019-06-18'),
('2019-134', '134', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Helper', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-135', '135', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-136', '136', 5, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-137', '137', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-138', '138', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-139', '139', 6, 1, 'Maintenance / Repair', '', 'Regular', 'Team Leader', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-140', '140', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-143', '143', 7, 1, 'Maintenance / Repair', '', 'Regular', 'Team Leader', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-144', '144', 2, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-145', '145', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Foreman', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-147', '147', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-151', '151', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-152', '14', 4, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-153', '153', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Foreman', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-154', '154', 3, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-155', '155', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Team Leader', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-156', '156', 5, 1, 'Fulfillment', '', 'Regular', 'Team Leader', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-157', '157', 4, 1, 'Maintenance / Repair', '', 'Regular', 'Installer', '2018-08-13', '0000-00-00', '', '2018-08-17'),
('2019-158', '158', 2, 1, 'Fulfillment', '', 'Regular', 'Team Leader', '2019-07-24', '0000-00-00', '', '2019-07-24'),
('2019-159', '159', 3, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-07-24', '0000-00-00', '', '2019-07-24'),
('2019-161', '161', 2, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-07-24', '0000-00-00', '', '2019-07-24'),
('2019-162', '162', 3, 1, 'Maintenance / Repair', '', 'Regular', 'Team Leader', '2019-06-17', '0000-00-00', '', '2019-07-17'),
('2019-163', '163', 3, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-07-09', '0000-00-00', '', '2019-07-09'),
('2019-164', '164', 4, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-07-11', '0000-00-00', '', '2019-07-07'),
('2019-165', '165', 3, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-07-17', '0000-00-00', '', '2019-07-16'),
('2019-166', '166', 3, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-07-10', '0000-00-00', '', '2019-07-16'),
('2019-170', '170', 7, 1, 'Fulfillment', '', 'Regular', 'Mechanical Installer', '2019-07-10', '0000-00-00', '', '2019-07-17'),
('2019-171', '171', 5, 1, 'Fulfillment', '', 'Regular', 'Mechanical Installer', '2019-07-09', '0000-00-00', '', '2019-07-18'),
('2019-172', '172', 0, 1, 'Fulfillment', '', 'Regular', 'Installer', '2019-08-20', '0000-00-00', '', '2019-08-12'),
('2019-176', '176', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-07-18', '0000-00-00', '', '2019-08-07'),
('2019-2', '101', 6, 1, 'Fulfillment', 'PROJECT MANAGEMENT', 'Regular', 'Mechanical Installer', '2019-04-18', '0000-00-00', '', '2019-06-18'),
('2019-200', '200', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-2000', '2000', 0, 1, 'Maintenance / Repair', '', 'Project Based', 'Helper', '2017-01-10', '2018-06-05', '', '0000-00-00'),
('2019-2001', '2001', 0, 1, 'Maintenance / Repair', '', 'Probationary', 'Helper', '2018-07-09', '2019-03-06', '', '0000-00-00'),
('2019-201', '201', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-202', '202', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Mechanical Installer', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-203', '203', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Supervisor', '2019-06-28', '0000-00-00', '', '2019-06-28'),
('2019-204', '204', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Helper', '2019-04-16', '0000-00-00', '', '2019-09-02'),
('2019-205', '205', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Installer', '2019-09-02', '0000-00-00', '', '2019-09-02'),
('2019-206', '206', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Team Leader', '2019-07-24', '0000-00-00', '', '2019-09-02'),
('2019-207', '207', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Installer', '2019-09-02', '0000-00-00', '', '2019-09-02'),
('2019-208', '208', 0, 1, 'Fulfillment', '', 'Regular', 'general admin/ book keeping', '2019-09-09', '0000-00-00', '', '2019-09-09'),
('2019-3000', '3000', 0, 1, 'Maintenance / Repair', '', 'Regular', 'Helper', '2019-08-29', '0000-00-00', '', '2019-08-29'),
('2019-8', '8', 2, 1, 'Fulfillment', 'PROJECT MANAGEMENT', 'Regular', 'Mechanical Installer', '2019-06-18', '0000-00-00', '', '2019-06-18'),
('2019-8000', '8000', 0, 1, 'Finance', '', 'Regular', 'New', '2019-07-28', '0000-00-00', '', '2019-07-29'),
('2019-90', '90', 2, 1, 'Modernisation', '', 'Probationary', 'dev', '2019-07-23', '0000-00-00', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `employee_leave`
--

CREATE TABLE `employee_leave` (
  `id` int(11) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_id` int(11) NOT NULL,
  `used_leave` decimal(8,2) NOT NULL DEFAULT 0.00,
  `balance_leave` decimal(8,2) NOT NULL DEFAULT 0.00,
  `leave_count` decimal(8,2) NOT NULL,
  `total_increment` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `lu_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_payroll_group`
--

CREATE TABLE `employee_payroll_group` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payroll_group_ind` bigint(20) NOT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_payroll_group`
--

INSERT INTO `employee_payroll_group` (`ind`, `company_id`, `department`, `name`, `payroll_group_ind`, `created_by`, `created_date`, `lu_by`, `lu_date`, `deleted`) VALUES
(1, '2019-004', 'Fulfillment', 'Test, EmployeeTest', 1, 'admin', '2019-06-14 02:59:54', 'admin', '2019-07-18 05:53:59', 1),
(2, '2019-001', 'Fulfillment', 'Yao, Vincent', 1, 'admin', '2019-06-14 05:26:14', 'admin', '2019-07-20 00:47:09', 0),
(3, '2019-003', 'Fulfillment', 'Laqui Jr., Romeo', 1, 'admin', '2019-06-14 05:41:12', 'admin', '2019-07-24 07:51:19', 0),
(4, '2019-006', 'Fulfillment', 'Paguinto, Eugene', 1, 'admin', '2019-06-14 05:41:45', 'admin', '2019-07-12 09:39:29', 1),
(5, '2019-109', 'Maintenance / Repair', 'Viterbo, Vincent', 1, 'admin', '2019-06-18 00:43:23', 'admin', '2019-06-18 01:40:08', 0),
(6, '2019-2', 'Fulfillment', 'Baraquiel, Arnel', 1, 'admin', '2019-06-18 00:57:31', 'admin', '2019-08-29 11:56:11', 0),
(7, '2019-103', 'Fulfillment', 'Miranda Jr., Rufino', 1, 'admin', '2019-06-18 01:05:47', 'admin', '2019-09-10 09:24:50', 0),
(8, '2019-8', 'Fulfillment', 'Catapang, Fritz John', 1, 'admin', '2019-06-18 01:24:34', 'admin', '2019-06-19 10:14:25', 0),
(9, '2019-100', 'Fulfillment', 'Gutierrez, Ruben', 1, 'admin', '2019-06-18 01:33:00', 'admin', '2019-07-27 07:16:09', 0),
(10, '2019-110', 'Fulfillment', 'Gochangco, Nikko Emerson', 1, 'admin', '2019-06-18 01:46:27', 'admin', '2019-07-27 01:06:57', 0),
(11, '2019-111', 'Maintenance / Repair', 'Merced Jr., Virgilio', 1, 'admin', '2019-06-18 01:54:59', 'admin', '2019-08-01 00:56:38', 0),
(12, '2019-112', 'Maintenance / Repair', 'Aquino, Emerson', 1, 'admin', '2019-06-18 02:00:37', 'admin', '2019-09-02 10:55:40', 0),
(13, '2019-113', 'Maintenance / Repair', 'Hernandez, Gabriel', 1, 'admin', '2019-06-18 02:05:05', 'admin', '2019-09-02 10:57:55', 0),
(14, '2019-114', 'Maintenance / Repair', 'Morabe, Reynaldo', 1, 'admin', '2019-06-18 02:12:41', 'admin', '2019-08-01 01:54:29', 0),
(15, '2019-115', 'Maintenance / Repair', 'Balbuena, Roberto', 1, 'admin', '2019-06-18 02:20:44', 'admin', '2019-08-01 00:55:28', 0),
(16, '2019-116', 'Modernisation', 'Padoga, Randy', 1, 'admin', '2019-06-18 02:30:36', 'admin', '2019-09-10 09:26:36', 0),
(17, '2019-117', 'Maintenance / Repair', 'Astor, Reynaldo', 1, 'admin', '2019-06-18 02:41:12', 'admin', '2019-07-12 09:25:05', 1),
(18, '2019-118', 'Maintenance / Repair', 'Niedo, John Edric', 1, 'admin', '2019-06-18 02:50:36', 'admin', '2019-06-18 02:50:36', 0),
(19, '2019-11', 'Fulfillment', 'Guntang, Jerico', 1, 'admin', '2019-06-18 03:40:45', 'admin', '2019-09-10 09:09:19', 0),
(20, '2019-201', 'Maintenance / Repair', 'Fampolme, Richard', 1, 'admin', '2019-06-28 00:17:33', 'admin', '2019-09-02 10:24:58', 0),
(21, '2019-203', 'Maintenance / Repair', 'Bisnan, Manuel', 1, 'admin', '2019-06-28 05:50:28', 'admin', '2019-08-29 12:00:07', 0),
(22, '2019-134', 'Maintenance / Repair', 'Nepomuceno, Jhon Jhon', 1, 'admin', '2019-06-28 05:58:19', 'admin', '2019-06-28 05:58:19', 0),
(23, '2019-135', 'Maintenance / Repair', 'Montilla Jr., Hermoso', 1, 'admin', '2019-06-28 06:06:12', 'admin', '2019-06-28 06:06:12', 0),
(24, '2019-136', 'Maintenance / Repair', 'Reyes, Michael', 1, 'admin', '2019-06-28 06:18:51', 'admin', '2019-07-27 03:08:01', 0),
(25, '2019-137', 'Maintenance / Repair', 'Mangalino, John', 1, 'admin', '2019-06-28 06:30:33', 'admin', '2019-06-28 06:30:33', 0),
(26, '2019-138', 'Maintenance / Repair', 'Musca, Joseph', 1, 'admin', '2019-06-28 06:40:36', 'admin', '2019-09-10 09:03:44', 0),
(27, '2019-139', 'Maintenance / Repair', 'Mangalino, Adryan', 1, 'admin', '2019-06-28 06:46:34', 'admin', '2019-09-02 10:26:51', 0),
(28, '2019-140', 'Maintenance / Repair', 'Soler, Jayson', 1, 'admin', '2019-06-28 06:51:23', 'admin', '2019-06-28 06:51:23', 0),
(29, '2019-005', 'Maintenance / Repair', 'Morales, Arturo', 1, 'admin', '2019-06-28 06:55:08', 'admin', '2019-09-10 09:28:40', 0),
(30, '2019-143', 'Maintenance / Repair', 'Donghil Jr., Edgardo', 1, 'admin', '2019-06-28 07:00:33', 'admin', '2019-07-27 07:26:50', 0),
(31, '2019-144', 'Maintenance / Repair', 'Alda Sr., Rolando', 1, 'admin', '2019-06-28 07:04:05', 'admin', '2019-07-18 09:14:34', 0),
(32, '2019-145', 'Maintenance / Repair', 'Bernardino, Michael', 1, 'admin', '2019-06-28 07:12:59', 'admin', '2019-06-28 07:12:59', 0),
(33, '2019-147', 'Maintenance / Repair', 'Carpon, Sergio', 1, 'admin', '2019-06-28 07:23:15', 'admin', '2019-09-10 09:07:45', 0),
(34, '2019-202', 'Maintenance / Repair', 'Rotea, Rolando', 1, 'admin', '2019-06-28 07:27:17', 'admin', '2019-08-30 08:18:21', 0),
(35, '2019-200', 'Maintenance / Repair', 'Dante, Mark Jason', 1, 'admin', '2019-06-28 07:31:24', 'admin', '2019-08-31 08:43:11', 0),
(36, '2019-151', 'Maintenance / Repair', 'Garcia, Rodel', 1, 'admin', '2019-06-28 07:35:58', 'admin', '2019-09-13 08:57:37', 0),
(37, '2019-152', 'Maintenance / Repair', 'Musca, Arnel', 1, 'admin', '2019-06-28 07:40:29', 'admin', '2019-08-02 00:47:00', 0),
(38, '2019-153', 'Maintenance / Repair', 'De Guzman, Leonardo', 1, 'admin', '2019-06-28 07:45:20', 'admin', '2019-06-28 07:45:20', 0),
(39, '2019-154', 'Maintenance / Repair', 'Nepomuceno, Lorenzo', 1, 'admin', '2019-06-28 07:50:36', 'admin', '2019-08-29 11:30:43', 0),
(40, '2019-155', 'Maintenance / Repair', 'Untalan, Jhun Lionel', 1, 'admin', '2019-06-28 07:55:22', 'admin', '2019-06-28 07:55:22', 0),
(41, '2019-156', 'Fulfillment', 'Roaring, Vincent Francis', 1, 'admin', '2019-06-28 07:59:44', 'admin', '2019-08-29 11:25:21', 0),
(42, '2019-117', 'Maintenance / Repair', 'Astor,Reynaldo', 2, 'admin', '2019-07-12 09:33:52', 'admin', '2019-07-16 05:37:07', 1),
(43, '2019-006', 'Fulfillment', 'Paguinto,Eugene', 2, 'admin', '2019-07-12 09:39:56', 'admin', '2019-07-16 05:37:07', 1),
(44, '2019-117', 'Maintenance / Repair', 'Astor, Reynaldo', 1, 'admin', '2019-07-16 05:37:16', 'admin', '2019-08-01 00:58:07', 0),
(45, '2019-006', 'Maintenance / Repair', 'Paguinto, Eugene', 1, 'admin', '2019-07-16 05:37:16', 'admin', '2019-09-09 09:25:52', 0),
(46, '2019-004', 'Fulfillment', 'Niedo, Marito', 1, 'admin', '2019-07-18 05:54:34', 'admin', '2019-07-30 00:05:17', 1),
(47, '2019-0180', 'Research and Development', 'Tamad, Juan', 3, 'admin', '2019-07-18 09:24:41', 'admin', '2019-07-18 09:24:41', 0),
(48, '2019-0050', 'Research and Development', 'Anis, Cherry', 1, 'admin', '2019-07-19 03:06:21', 'admin', '2019-07-19 03:06:21', 0),
(49, '2019-004', 'Fulfillment', 'Niedo, Marito', 1, 'admin', '2019-07-20 06:57:52', 'admin', '2019-07-30 00:05:17', 0),
(50, '2019-90', 'Modernisation', 'Test, Test', 1, 'admin', '2019-07-23 03:21:36', 'admin', '2019-07-23 03:21:36', 0),
(51, '2019-157', 'Maintenance / Repair', 'Victorioso, Joseph', 3, 'admin', '2019-07-24 02:42:37', 'admin', '2019-08-29 13:34:32', 0),
(52, '2019-158', 'Fulfillment', 'Garcia, Alvin', 1, 'admin', '2019-07-24 05:31:45', 'admin', '2019-08-29 14:44:37', 0),
(53, '2019-159', 'Maintenance / Repair', 'Cayanan, Cezar', 1, 'admin', '2019-07-24 05:41:23', 'admin', '2019-08-29 14:56:49', 0),
(54, '2019-161', 'Maintenance / Repair', 'Garcia, Meynard', 1, 'admin', '2019-07-24 05:50:44', 'admin', '2019-08-02 00:51:40', 0),
(55, '2019-162', 'Maintenance / Repair', 'Pedrajas, Clyd', 3, 'admin', '2019-07-26 05:11:52', 'admin', '2019-09-10 14:58:01', 0),
(56, '2019-163', 'Maintenance / Repair', 'Polin, Eugene', 1, 'admin', '2019-07-26 05:20:32', 'admin', '2019-07-26 05:22:11', 0),
(57, '2019-164', 'Maintenance / Repair', 'Curamen, Christopher', 1, 'admin', '2019-07-26 05:29:05', 'admin', '2019-09-02 15:37:17', 0),
(58, '2019-165', 'Maintenance / Repair', 'Ranas, Neddie', 1, 'admin', '2019-07-26 05:35:32', 'admin', '2019-07-26 05:36:53', 0),
(59, '2019-166', 'Maintenance / Repair', 'Begaso, Dave', 1, 'admin', '2019-07-26 05:44:07', 'admin', '2019-09-02 15:12:09', 0),
(60, '2019-170', 'Fulfillment', 'Olorvida, Victorino', 1, 'admin', '2019-07-27 05:46:50', 'admin', '2019-07-27 05:50:16', 0),
(61, '2019-171', 'Fulfillment', 'Epino Jr., Rodolfo', 1, 'admin', '2019-07-27 05:55:56', 'admin', '2019-07-27 06:25:00', 0),
(62, '2019-8000', 'Finance', 'New, New', 1, 'admin', '2019-07-29 02:04:10', 'admin', '2019-08-28 09:42:06', 0),
(63, '2019-0900', 'Fulfillment', 'Sample, Sample', 3, 'admin', '2019-07-29 05:42:58', 'admin', '2019-07-29 05:42:58', 0),
(64, '2019-176', 'Maintenance / Repair', 'Tabiando, Joemar', 1, 'admin', '2019-07-30 06:07:28', 'admin', '2019-09-10 14:41:12', 0),
(65, '2019-1001', 'Finance', 'Employee1, Employee1', 4, 'admin', '2019-08-27 17:53:22', 'admin', '2019-08-27 17:53:22', 0),
(66, '2019-1002', 'Finance', 'Employee2, Employee2', 4, 'admin', '2019-08-28 11:04:08', 'admin', '2019-08-28 11:04:08', 0),
(67, '2019-1003', 'Finance', 'Employee3, Employee3', 4, 'admin', '2019-08-28 13:24:21', 'admin', '2019-08-28 13:24:21', 0),
(68, '2019-1004', 'Finance', 'Employee4, Employee4', 4, 'admin', '2019-08-28 13:54:50', 'admin', '2019-08-28 13:54:50', 0),
(69, '2019-1005', 'Finance', 'Employee5, Employee5', 4, 'admin', '2019-08-28 14:00:56', 'admin', '2019-08-28 14:00:56', 0),
(70, '2019-1006', 'Finance', 'Employee6, Employee6', 4, 'admin', '2019-08-28 14:05:56', 'admin', '2019-08-28 14:05:56', 0),
(71, '2019-1007', 'Finance', 'Employee7, Employee7', 4, 'admin', '2019-08-28 14:25:08', 'admin', '2019-08-28 14:25:08', 0),
(72, '2019-1008', 'Finance', 'Employee8, Employee8', 4, 'admin', '2019-08-28 17:02:47', 'admin', '2019-08-28 17:02:47', 0),
(73, '2019-1009', 'Finance', 'Employee9, Employee9', 4, 'admin', '2019-08-28 17:04:43', 'admin', '2019-08-28 17:04:43', 0),
(74, '2019-1010', 'Finance', 'Employee10, Employee10', 4, 'admin', '2019-08-28 17:06:24', 'admin', '2019-08-28 17:06:24', 0),
(75, '2019-2000', 'Maintenance / Repair', 'Sta. Ana, Christian', 1, 'admin', '2019-08-29 10:30:48', 'admin', '2019-08-29 10:30:48', 0),
(76, '2019-172', 'Fulfillment', 'Madarang, Alfredo', 1, 'admin', '2019-08-29 14:25:45', 'admin', '2019-08-29 14:25:45', 0),
(77, '2019-1000', 'Maintenance / Repair', 'Dacasin, Joshua', 1, 'admin', '2019-08-29 14:41:21', 'admin', '2019-09-09 15:22:33', 0),
(78, '2019-3000', 'Maintenance / Repair', 'Berja, Jomar', 1, 'admin', '2019-08-29 14:53:19', 'admin', '2019-09-10 09:30:35', 0),
(79, '2019-204', 'Maintenance / Repair', 'Vargas, Gerald', 1, 'admin', '2019-09-02 10:53:32', 'admin', '2019-09-02 10:53:32', 0),
(80, '2019-205', 'Maintenance / Repair', 'Ulbe, Luisito', 1, 'admin', '2019-09-02 11:03:00', 'admin', '2019-09-10 08:59:59', 0),
(81, '2019-206', 'Maintenance / Repair', 'Virgo, Benny', 1, 'admin', '2019-09-02 11:19:41', 'admin', '2019-09-10 09:05:31', 0),
(82, '2019-207', 'Maintenance / Repair', 'Valero, Noel', 1, 'admin', '2019-09-02 11:41:08', 'admin', '2019-09-02 11:41:08', 0),
(83, '2019-2001', 'Maintenance / Repair', 'Jutba Jr., Danilo', 1, 'admin', '2019-09-02 12:41:07', 'admin', '2019-09-02 12:41:07', 0),
(84, '2019-208', 'Fulfillment', 'Lim, Danica', 1, 'admin', '2019-09-09 15:33:07', 'admin', '2019-09-09 15:33:07', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_schedule`
--

CREATE TABLE `employee_schedule` (
  `id` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id` bigint(20) NOT NULL,
  `deleted` int(2) NOT NULL DEFAULT 0,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_schedule`
--

INSERT INTO `employee_schedule` (`id`, `company_id`, `template_id`, `deleted`, `created_by`, `created_date`, `lu_by`, `lu_date`) VALUES
(1, '2019-004', 6, 0, 'admin', '2019-06-14 02:59:54', 'admin', '2019-07-30 00:05:17'),
(2, '2019-001', 6, 0, 'admin', '2019-06-14 05:26:14', 'admin', '2019-07-20 00:47:09'),
(3, '2019-003', 6, 0, 'admin', '2019-06-14 05:41:12', 'admin', '2019-07-24 07:51:19'),
(4, '2019-006', 6, 0, 'admin', '2019-06-14 05:41:45', 'admin', '2019-09-09 09:25:52'),
(5, '2019-', 0, 0, '', '2019-06-15 02:40:33', '', '2019-06-15 02:40:33'),
(6, '2019-109', 6, 0, 'admin', '2019-06-18 00:43:23', 'admin', '2019-06-18 01:40:08'),
(7, '2019-2', 6, 0, 'admin', '2019-06-18 00:57:31', 'admin', '2019-08-29 11:56:11'),
(8, '2019-103', 6, 0, 'admin', '2019-06-18 01:05:47', 'admin', '2019-09-10 09:24:50'),
(9, '2019-8', 6, 0, 'admin', '2019-06-18 01:24:33', 'admin', '2019-09-11 21:00:41'),
(10, '2019-100', 6, 0, 'admin', '2019-06-18 01:33:00', 'admin', '2019-07-27 07:16:09'),
(11, '2019-110', 6, 0, 'admin', '2019-06-18 01:46:27', 'admin', '2019-07-27 01:06:57'),
(12, '2019-111', 6, 0, 'admin', '2019-06-18 01:54:59', 'admin', '2019-08-01 00:56:38'),
(13, '2019-112', 6, 0, 'admin', '2019-06-18 02:00:37', 'admin', '2019-09-02 10:55:40'),
(14, '2019-113', 6, 0, 'admin', '2019-06-18 02:05:05', 'admin', '2019-09-02 10:57:55'),
(15, '2019-114', 6, 0, 'admin', '2019-06-18 02:12:41', 'admin', '2019-08-01 01:54:29'),
(16, '2019-115', 6, 0, 'admin', '2019-06-18 02:20:44', 'admin', '2019-08-01 00:55:28'),
(17, '2019-116', 6, 0, 'admin', '2019-06-18 02:30:36', 'admin', '2019-09-10 09:26:36'),
(18, '2019-117', 6, 0, 'admin', '2019-06-18 02:41:12', 'admin', '2019-08-01 00:58:07'),
(19, '2019-118', 6, 0, 'admin', '2019-06-18 02:50:36', 'admin', '2019-06-18 02:50:36'),
(20, '2019-11', 6, 0, 'admin', '2019-06-18 03:40:45', 'admin', '2019-09-10 09:09:19'),
(21, '2019-201', 6, 0, 'admin', '2019-06-28 00:17:33', 'admin', '2019-09-02 10:24:58'),
(22, '2019-203', 6, 0, 'admin', '2019-06-28 05:50:28', 'admin', '2019-08-29 12:00:07'),
(23, '2019-134', 6, 0, 'admin', '2019-06-28 05:58:19', 'admin', '2019-06-28 05:58:19'),
(24, '2019-135', 6, 0, 'admin', '2019-06-28 06:06:12', 'admin', '2019-06-28 06:06:12'),
(25, '2019-136', 6, 0, 'admin', '2019-06-28 06:18:51', 'admin', '2019-07-27 03:08:01'),
(26, '2019-137', 6, 0, 'admin', '2019-06-28 06:30:33', 'admin', '2019-06-28 06:30:33'),
(27, '2019-138', 6, 0, 'admin', '2019-06-28 06:40:36', 'admin', '2019-09-10 09:03:44'),
(28, '2019-139', 6, 0, 'admin', '2019-06-28 06:46:34', 'admin', '2019-09-02 10:26:51'),
(29, '2019-140', 6, 0, 'admin', '2019-06-28 06:51:23', 'admin', '2019-06-28 06:51:23'),
(30, '2019-005', 6, 0, 'admin', '2019-06-28 06:55:08', 'admin', '2019-09-10 09:28:40'),
(31, '2019-143', 6, 0, 'admin', '2019-06-28 07:00:33', 'admin', '2019-07-27 07:26:50'),
(32, '2019-144', 6, 0, 'admin', '2019-06-28 07:04:05', 'admin', '2019-09-11 20:59:34'),
(33, '2019-145', 6, 0, 'admin', '2019-06-28 07:12:59', 'admin', '2019-06-28 07:12:59'),
(34, '2019-147', 6, 0, 'admin', '2019-06-28 07:23:15', 'admin', '2019-09-10 09:07:45'),
(35, '2019-202', 6, 0, 'admin', '2019-06-28 07:27:17', 'admin', '2019-08-30 08:18:21'),
(36, '2019-200', 6, 0, 'admin', '2019-06-28 07:31:24', 'admin', '2019-08-31 08:43:11'),
(37, '2019-151', 6, 0, 'admin', '2019-06-28 07:35:58', 'admin', '2019-09-13 08:57:37'),
(38, '2019-152', 6, 0, 'admin', '2019-06-28 07:40:29', 'admin', '2019-08-02 00:47:00'),
(39, '2019-153', 6, 0, 'admin', '2019-06-28 07:45:20', 'admin', '2019-06-28 07:45:20'),
(40, '2019-154', 6, 0, 'admin', '2019-06-28 07:50:36', 'admin', '2019-08-29 11:30:43'),
(41, '2019-155', 6, 0, 'admin', '2019-06-28 07:55:22', 'admin', '2019-06-28 07:55:22'),
(42, '2019-156', 6, 0, 'admin', '2019-06-28 07:59:44', 'admin', '2019-08-29 11:25:21'),
(43, '2019-0180', 6, 0, 'admin', '2019-07-18 09:24:41', 'admin', '2019-07-18 09:24:41'),
(44, '2019-0050', 6, 0, 'admin', '2019-07-19 03:06:20', 'admin', '2019-07-29 02:01:26'),
(45, '2019-004', 6, 0, 'admin', '2019-07-20 06:57:52', 'admin', '2019-07-30 00:05:17'),
(46, '2019-90', 3, 0, 'admin', '2019-07-23 03:21:36', 'admin', '2019-07-23 03:21:36'),
(47, '2019-157', 6, 0, 'admin', '2019-07-24 02:42:37', 'admin', '2019-08-29 13:34:32'),
(48, '2019-158', 6, 0, 'admin', '2019-07-24 05:31:45', 'admin', '2019-08-29 14:44:37'),
(49, '2019-159', 6, 0, 'admin', '2019-07-24 05:41:23', 'admin', '2019-08-29 14:56:49'),
(50, '2019-161', 6, 0, 'admin', '2019-07-24 05:50:44', 'admin', '2019-08-02 00:51:40'),
(51, '2019-162', 6, 0, 'admin', '2019-07-26 05:11:52', 'admin', '2019-09-10 14:58:00'),
(52, '2019-163', 6, 0, 'admin', '2019-07-26 05:20:32', 'admin', '2019-07-26 05:22:11'),
(53, '2019-164', 6, 0, 'admin', '2019-07-26 05:29:05', 'admin', '2019-09-02 15:37:17'),
(54, '2019-165', 6, 0, 'admin', '2019-07-26 05:35:32', 'admin', '2019-07-26 05:36:53'),
(55, '2019-166', 6, 0, 'admin', '2019-07-26 05:44:07', 'admin', '2019-09-02 15:12:09'),
(56, '2019-170', 6, 0, 'admin', '2019-07-27 05:46:50', 'admin', '2019-07-27 05:50:16'),
(57, '2019-171', 6, 0, 'admin', '2019-07-27 05:55:56', 'admin', '2019-07-27 06:25:00'),
(58, '2019-8000', 6, 0, 'admin', '2019-07-29 02:04:10', 'admin', '2019-08-28 09:42:06'),
(59, '2019-0900', 6, 0, 'admin', '2019-07-29 05:42:58', 'admin', '2019-07-29 05:42:58'),
(60, '2019-176', 6, 0, 'admin', '2019-07-30 06:07:28', 'admin', '2019-09-10 14:41:12'),
(61, '2019-1001', 7, 0, 'admin', '2019-08-27 17:53:22', 'admin', '2019-08-27 17:53:22'),
(62, '2019-1002', 7, 0, 'admin', '2019-08-28 11:04:08', 'admin', '2019-08-28 11:04:08'),
(63, '2019-1003', 7, 0, 'admin', '2019-08-28 13:24:21', 'admin', '2019-08-28 13:24:21'),
(64, '2019-1004', 7, 0, 'admin', '2019-08-28 13:54:50', 'admin', '2019-08-28 13:54:50'),
(65, '2019-1005', 7, 0, 'admin', '2019-08-28 14:00:56', 'admin', '2019-08-28 14:00:56'),
(66, '2019-1006', 7, 0, 'admin', '2019-08-28 14:05:56', 'admin', '2019-08-28 14:05:56'),
(67, '2019-1007', 7, 0, 'admin', '2019-08-28 14:25:08', 'admin', '2019-08-28 14:25:08'),
(68, '2019-1008', 7, 0, 'admin', '2019-08-28 17:02:47', 'admin', '2019-08-28 17:02:47'),
(69, '2019-1009', 7, 0, 'admin', '2019-08-28 17:04:43', 'admin', '2019-08-28 17:04:43'),
(70, '2019-1010', 7, 0, 'admin', '2019-08-28 17:06:24', 'admin', '2019-08-28 17:06:24'),
(71, '2019-2000', 6, 0, 'admin', '2019-08-29 10:30:48', 'admin', '2019-08-29 10:30:48'),
(72, '2019-172', 6, 0, 'admin', '2019-08-29 14:25:45', 'admin', '2019-08-29 14:25:45'),
(73, '2019-1000', 6, 0, 'admin', '2019-08-29 14:41:21', 'admin', '2019-09-09 15:22:33'),
(74, '2019-3000', 6, 0, 'admin', '2019-08-29 14:53:19', 'admin', '2019-09-10 09:30:35'),
(75, '2019-204', 6, 0, 'admin', '2019-09-02 10:53:32', 'admin', '2019-09-02 10:53:32'),
(76, '2019-205', 6, 0, 'admin', '2019-09-02 11:03:00', 'admin', '2019-09-10 08:59:59'),
(77, '2019-206', 6, 0, 'admin', '2019-09-02 11:19:41', 'admin', '2019-09-10 09:05:31'),
(78, '2019-207', 6, 0, 'admin', '2019-09-02 11:41:08', 'admin', '2019-09-02 11:41:08'),
(79, '2019-2001', 6, 0, 'admin', '2019-09-02 12:41:07', 'admin', '2019-09-02 12:41:07'),
(80, '2019-208', 6, 0, 'admin', '2019-09-09 15:33:07', 'admin', '2019-09-09 15:33:07');

-- --------------------------------------------------------

--
-- Table structure for table `employee_schedule_request`
--

CREATE TABLE `employee_schedule_request` (
  `id` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `infinit` int(2) NOT NULL DEFAULT 0,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ON',
  `request_status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `end_date` date NOT NULL,
  `deleted` int(2) NOT NULL DEFAULT 0,
  `approved_1_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'NONE',
  `approved_2_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'NONE',
  `approved_1` int(11) NOT NULL DEFAULT 0,
  `approved_2` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_schedule_request_old`
--

CREATE TABLE `employee_schedule_request_old` (
  `id` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `infinit` int(2) NOT NULL DEFAULT 0,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ON',
  `request_status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `end_date` date NOT NULL,
  `deleted` int(2) NOT NULL DEFAULT 0,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employment_history`
--

CREATE TABLE `employment_history` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employer_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employment_history`
--

INSERT INTO `employment_history` (`ind`, `company_id`, `employer_name`, `position`, `start_date`, `end_date`) VALUES
(1, '2019-109', 'J-kad Co. Ltd', 'Mecahnical Installer', '2018-03-12', '2019-01-25'),
(2, '2019-162', 'Jardine Schindler Elevator Corporation', 'Installer', '2013-02-16', '2018-12-31'),
(3, '2019-156', 'Magallanes P. D. M. I. ', 'Helper', '2013-05-05', '2015-06-06'),
(4, '2019-156', 'MVERJ', 'Wire Man', '2015-07-07', '2016-08-08'),
(5, '2019-156', 'Conception Otis Phil. Inc.', 'Skilled', '2016-09-09', '2017-05-05'),
(6, '2019-103', 'Jardine Schindler', 'installer', '2018-08-16', '2019-01-31'),
(7, '2019-2', 'Magallanes', 'Installer', '0000-00-00', '0000-00-00'),
(8, '2019-2', 'HYATT', 'Installer', '0000-00-00', '0000-00-00'),
(9, '2019-2', 'ASIA PTS Elevator', 'Installer', '0000-00-00', '0000-00-00'),
(10, '2019-147', 'Magallanes Agency', 'Foreman', '2010-03-20', '2017-02-03'),
(11, '2019-157', 'Kaakbay Tungo sa Kinabukasan ', 'Production', '2010-07-07', '2018-01-01'),
(12, '2019-157', 'M.Y SAN CORP.', 'Production', '2008-11-11', '2009-04-04'),
(13, '2019-157', 'Red Ribbon', 'Production', '2007-10-10', '2008-01-01'),
(14, '2019-172', 'Caloocan Juvilee Christian', 'Mazon Carpenter', '0000-00-00', '0000-00-00'),
(15, '2019-158', 'Nutri Asia', 'Machine Operator', '0000-00-00', '0000-00-00'),
(16, '2019-158', 'Magallanes Property', 'Installer', '0000-00-00', '0000-00-00'),
(17, '2019-159', 'Magallanes ', 'Mechanical Fitter', '0000-00-00', '0000-00-00'),
(18, '2019-159', 'MVERJ RECRUITMENT AGENCY', 'Mechanical Fitter', '0000-00-00', '0000-00-00'),
(19, '2019-206', 'Jardine Schindler Elevator Corporation', 'Mechanical Fitter', '2018-08-01', '2019-01-01'),
(20, '2019-176', 'JSEC', 'Mechanical Fitter', '2018-08-08', '2019-01-01'),
(21, '2019-176', 'Lifttech', 'Mechanical Fitter', '2016-11-11', '2017-08-08'),
(22, '2019-176', 'MVERJ', 'Mechanical Fitter', '2014-05-05', '2016-11-11'),
(23, '2019-162', 'MVERJ RECRUITMENT AGENCY', 'Mechanical Fitter', '2014-04-04', '2016-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_by` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified_by` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Block'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_background`
--

CREATE TABLE `family_background` (
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `father_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `father_birthdate` date DEFAULT NULL,
  `father_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `father_occupation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mother_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mother_birthdate` date DEFAULT NULL,
  `mother_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mother_occupation` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spouse_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spouse_birthdate` date DEFAULT NULL,
  `spouse_occupation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `family_background`
--

INSERT INTO `family_background` (`company_id`, `father_name`, `father_birthdate`, `father_status`, `father_occupation`, `mother_name`, `mother_birthdate`, `mother_status`, `mother_occupation`, `spouse_name`, `spouse_birthdate`, `spouse_occupation`) VALUES
('2019-001', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-003', 'Romeo A. Laqui', '1952-05-23', 'Married', 'Businessman', 'Erlinda Laqui', '1953-03-08', 'Married', 'Housewife', '', '0000-00-00', ''),
('2019-004', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-005', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-0050', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-006', 'Juanito Vasquez Paguinto', '1968-06-24', 'Married', 'Security Guard', 'Jodisa Caminade Paguinto', '1975-01-08', 'Married', 'Vendor', '', '0000-00-00', ''),
('2019-0180', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-0900', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-100', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-1000', 'Mario Dacasin', '0000-00-00', '', '', 'Analyn Zulueta', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-1001', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-1002', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-1003', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-1004', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-1005', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-1006', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-1007', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-1008', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-1009', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-1010', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-103', 'Rufino A. Miranda Sr.', '0000-00-00', '', '', 'Vergie Miranda', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-109', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-11', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-110', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-111', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-112', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-113', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-114', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-115', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-116', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-117', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-118', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-134', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-135', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-136', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-137', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-138', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-139', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-140', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-143', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-144', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-145', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-147', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-151', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-152', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-153', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-154', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-155', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-156', 'Jose S. Roaring', '0000-00-00', 'Married', 'JSEC Supervisor', 'Tessie T. Roaring', '0000-00-00', 'Married', 'Housewife', '', '0000-00-00', ''),
('2019-157', 'Jesus Boliche Victorioso', '0000-00-00', '', '', 'Maria Adonis', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-158', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-159', 'Oscar Villasista Cayanan', '0000-00-00', '', '', 'Helen Montiago Gayundato', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-161', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-162', 'Alfonso Pedrajas', '1959-01-26', '', 'Farmers', 'Ma. Teresa Pedrajas', '1957-04-02', '', 'Housewife', 'Shiela mae A. Pedrajas', '1990-12-01', 'Housewife'),
('2019-163', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-164', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-165', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-166', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-170', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-171', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-172', 'Alfredo Madarang ', '0000-00-00', 'Married', 'Deceased', 'Nenita San Juan', '0000-00-00', 'Married', 'Housewife', '', '0000-00-00', ''),
('2019-176', 'Jovencio C. Tabiando', '1963-09-08', 'Married', 'Farmers', 'Marrisa A. Tabiando', '1968-03-10', 'Married', 'Housewife', 'Jocelyn D. Tabiando', '1993-08-13', 'Teacher'),
('2019-2', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-200', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-2000', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-2001', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-201', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-202', 'Victor Agluba Rotea', '0000-00-00', '', '', 'Elisa Megano Rotea', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-203', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-204', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-205', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-206', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-207', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-208', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-3000', '', '0000-00-00', '', '', 'Maria B. Sarical', '0000-00-00', '', 'Massage Therapist', '', '0000-00-00', ''),
('2019-8', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-8000', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', ''),
('2019-90', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `goverment_number`
--

CREATE TABLE `goverment_number` (
  `company_id` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sss_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tin_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagibig_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `philhealth_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_status_ind` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `goverment_number`
--

INSERT INTO `goverment_number` (`company_id`, `sss_number`, `tin_number`, `pagibig_number`, `philhealth_number`, `tax_status_ind`) VALUES
('2019-001', '00303310', '351531351', '3131353231', '1351351351', 2),
('2019-003', '0818322721', '405134789', '121177512006', '180251511886', 2),
('2019-004', '001234567', '001234567', '121231500325', '001234567', 2),
('2019-005', '141', '141', '141', '141', 3),
('2019-0050', '8888888888', '888888888', '888888888888', '888888888888', 2),
('2019-006', '3482846038', '357589846', '121246474772', '210256381278', 2),
('2019-0180', '8888888888', '888888888', '888888888888', '888888888888', 2),
('2019-0900', '8888888888', '888888888', '88888888888', '88888888888', 2),
('2019-100', '100', '100', '100', '100', 2),
('2019-1000', '0000000000', '000000000', '000000000000', '000000000000', 2),
('2019-1001', '0000000000', '000000000', '00000000000', '00000000000', 2),
('2019-1002', '0000000000', '000000000', '000000000000', '000000000000', 2),
('2019-1003', '0000000000', '000000000', '00000000000', '000000000000', 2),
('2019-1004', '0000000000', '000000000', '0000000000', '0000000000', 2),
('2019-1005', '000000000', '000000000', '0000000', '0000000000', 2),
('2019-1006', '00000000', '000000000', '0000000000', '000000000', 2),
('2019-1007', '000000', '000000000', '0000000000', '00000000', 2),
('2019-1008', '00000000', '000000000', '00000000', '000000000', 2),
('2019-1009', '000000', '000000000', '000000000', '000000000', 2),
('2019-1010', '00000', '000000', '000000', '0000000', 2),
('2019-103', '3431181867', '11', '121169066455', '010254969414', 2),
('2019-109', '1234567', '1234567', '1211-2591414', '0305-1068428', 2),
('2019-11', '21', '21', '21', '21', 2),
('2019-110', '110', '110', '110', '110', 2),
('2019-111', '111', '111', '111', '111', 2),
('2019-112', '3372950555', '112', '121035580297', '112', 3),
('2019-113', '113', '113', '121140363853', '113', 2),
('2019-114', '114', '114', '114', '114', 3),
('2019-115', '03-9500158', '115', '000-33990953', '030-50335956', 3),
('2019-116', '116', '116', '116', '116', 3),
('2019-117', '3303306424', '117', '117', '19-089244665', 3),
('2019-118', '34-1483854', '118', '1211-0072-10', '030-50618603', 2),
('2019-134', '133', '1333', '133', '113', 2),
('2019-135', '135', '135', '135', '135', 2),
('2019-136', '136', '136', '136', '136', 3),
('2019-137', '137', '137', '137', '137', 2),
('2019-138', '138', '138', '138', '138', 2),
('2019-139', '139', '139', '139', '139', 3),
('2019-140', '140', '140', '140', '140', 2),
('2019-143', '143', '143', '143', '143', 3),
('2019-144', '144', '144', '1444', '144', 3),
('2019-145', '145', '145', '145', '145', 3),
('2019-147', '148', '148', '148', '148', 3),
('2019-151', '151', '151', '151', '151', 3),
('2019-152', '152', '152', '152', '152', 2),
('2019-153', '153', '153', '153', '153', 3),
('2019-154', '154', '154', '154', '154', 2),
('2019-155', '155', '155', '155', '155', 2),
('2019-156', '3435039148', '330971941', '121087821180', '220001538241', 2),
('2019-157', '11234', '11234', '11234', '11234', 2),
('2019-158', '9999999999', '999999999', '000000000000', '888888888888', 2),
('2019-159', '0219712820', '487678627', '121176854943', '230024609931', 2),
('2019-161', '3333333333', '333333333', '333333333333', '333333333333', 2),
('2019-162', '0732796624', '469362541', '121138086276', '112024911724', 3),
('2019-163', '1633333333', '163333333', '163333333333', '163333333333', 2),
('2019-164', '3395527512', '349745472', '121188566972', '020262028608', 2),
('2019-165', '1655555555', '165555555', '111655555555', '165555555555', 2),
('2019-166', '073826371', '166666666', '166666666666', '166666666666', 2),
('2019-170', '1700000000', '170000000', '170000000000', '170000000000', 2),
('2019-171', '1711111111', '171111111', '171111111111', '171111111111', 2),
('2019-172', '3327021100', '172222222', '172222222222', '172222222222', 2),
('2019-176', '3437388826', '443768051', '121150125461', '050254669064', 2),
('2019-2', '1', '1', '1', '1', 3),
('2019-200', '3441469702', '315906272', '121105146227', '102555503737', 2),
('2019-2000', '0000000000', '000000000', '000000000000', '000000000000', 2),
('2019-2001', '212144124', '12313123', '123321313', '1231323231', 2),
('2019-201', '342543328', '328387795', '121171548532', '010517904290', 2),
('2019-202', '3335832445', '149', '149', '030255760870', 2),
('2019-203', '0033041529', '738163178', '12101487778', '190508967555', 3),
('2019-204', '1112', '121211', '12121', '121211', 2),
('2019-205', '12135', '1231434', '134341', '13214314', 2),
('2019-206', '3341643327', '200528456', '290236027', '190893227133', 2),
('2019-207', '3435186800', '446541557', '121108652151', '32000953899', 2),
('2019-208', '2088888888', '200920429', '208888888888', '208888888888', 2),
('2019-3000', '1111111111', '111111111', '111111111111', '111111111111', 2),
('2019-8', '8', '8', '8', '8', 2),
('2019-8000', '8888888888', '888888888', '88888888888', '88888888888', 2),
('2019-90', '1231231231', '123123', '123123123123', '123123123123', 3);

-- --------------------------------------------------------

--
-- Table structure for table `goverment_upload`
--

CREATE TABLE `goverment_upload` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `goverment` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_schedule`
--

CREATE TABLE `group_schedule` (
  `ind` bigint(20) NOT NULL,
  `group_ind` bigint(20) NOT NULL,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Regular Shift',
  `reg_in` time DEFAULT '08:00:00',
  `reg_out` time DEFAULT '17:00:00',
  `mon_in` time DEFAULT NULL,
  `mon_out` time DEFAULT NULL,
  `mon` int(2) NOT NULL DEFAULT 1,
  `tue_in` time DEFAULT NULL,
  `tue_out` time DEFAULT NULL,
  `tue` int(2) NOT NULL DEFAULT 1,
  `wed_in` time DEFAULT NULL,
  `wed_out` time DEFAULT NULL,
  `wed` int(11) NOT NULL DEFAULT 1,
  `thu_in` time DEFAULT NULL,
  `thu_out` time DEFAULT NULL,
  `thu` int(2) NOT NULL DEFAULT 1,
  `fri_in` time DEFAULT NULL,
  `fri_out` time DEFAULT NULL,
  `fri` int(2) NOT NULL DEFAULT 1,
  `sat_in` time DEFAULT NULL,
  `sat_out` time DEFAULT NULL,
  `sat` int(2) NOT NULL DEFAULT 0,
  `sun_in` time DEFAULT NULL,
  `sun_out` time DEFAULT NULL,
  `sun` int(2) NOT NULL DEFAULT 0,
  `flexihrs` decimal(8,2) NOT NULL DEFAULT 8.00,
  `deleted` int(2) NOT NULL DEFAULT 0,
  `created_by` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_template`
--

CREATE TABLE `leave_template` (
  `id` bigint(20) NOT NULL,
  `leave_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days_leave` int(3) NOT NULL,
  `paid` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `available_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL,
  `deleted` smallint(2) NOT NULL DEFAULT 0,
  `leave_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `increment` int(11) DEFAULT 0,
  `year` int(11) DEFAULT 0,
  `max_days` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_template`
--

INSERT INTO `leave_template` (`id`, `leave_name`, `days_leave`, `paid`, `available_status`, `created_by`, `created_date`, `lu_by`, `lu_date`, `deleted`, `leave_type`, `increment`, `year`, `max_days`) VALUES
(4, 'Vacation Leave', 5, 'Yes', 'Contractual', 'admin', '2018-06-19 15:10:29', 'admin', '2018-06-20 14:35:47', 0, 'Prorated', 0, 0, 0),
(9, 'Sick Leave', 10, 'Yes', 'Regular', 'admin', '2018-06-20 11:44:21', 'admin', '2018-10-17 10:50:30', 0, 'Prorated', 0, 0, 0),
(13, 'Emergency Leave', 9, 'Yes', 'Regular', 'admin', '2018-06-20 14:52:46', 'admin', '2018-06-20 14:52:46', 0, 'Prorated', 0, 0, 0),
(14, 'Maternity Leave', 30, 'Yes', 'Regular', 'admin', '2018-06-20 14:54:52', 'admin', '2018-06-20 14:54:52', 0, 'Fixed', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `licence_information`
--

CREATE TABLE `licence_information` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `licence_no` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_issue` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `licence_information`
--

INSERT INTO `licence_information` (`ind`, `company_id`, `title`, `licence_no`, `date_issue`, `date_valid`) VALUES
(1, '2019-206', 'Construction Occupational Safety and Health', 'RBA-2018-0478', '2018-04-15', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `medical_allergies`
--

CREATE TABLE `medical_allergies` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allergies_description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_illness`
--

CREATE TABLE `medical_illness` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illness_history` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `covered_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `id` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allergie` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drugtest_result` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_tested` date NOT NULL,
  `hypertension` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `underweight` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overweight` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_reason` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason_remarks` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medical_records`
--

INSERT INTO `medical_records` (`id`, `company_id`, `class_type`, `class_description`, `allergie`, `drugtest_result`, `test_location`, `date_tested`, `hypertension`, `underweight`, `overweight`, `other_reason`, `reason_remarks`) VALUES
(2, '2019-001', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(3, '2019-003', 'Class A', 'Fit to work', '', 'Passed', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(4, '2019-006', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(5, '2019-109', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(6, '2019-2', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '2019-03-28', 'no', 'no', 'no', 'no', ''),
(7, '2019-103', 'Class A', 'Fit to work', '', '', '', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(8, '2019-8', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(9, '2019-100', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(10, '2019-110', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(11, '2019-111', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(12, '2019-112', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(13, '2019-113', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(14, '2019-114', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(15, '2019-115', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(16, '2019-116', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(17, '2019-117', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(18, '2019-118', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(19, '2019-11', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(20, '2019-201', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(21, '2019-203', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(22, '2019-134', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(23, '2019-135', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(24, '2019-136', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(25, '2019-137', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(26, '2019-138', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(27, '2019-139', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(28, '2019-140', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(29, '2019-005', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(30, '2019-143', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(31, '2019-144', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(32, '2019-145', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(33, '2019-147', 'Class A', 'Fit to work', '', 'Passed', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(34, '2019-202', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(35, '2019-200', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(36, '2019-151', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(37, '2019-152', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(38, '2019-153', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(39, '2019-154', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(40, '2019-155', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(41, '2019-156', 'Class A', 'Fit to work', '', 'Passed', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '2018-08-20', 'no', 'no', 'no', 'no', ''),
(42, '2019-0180', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(43, '2019-0050', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(44, '2019-004', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(45, '2019-90', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(46, '2019-157', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(47, '2019-158', 'Class A', 'Fit to work', '', 'Passed', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(48, '2019-159', 'Class A', 'Fit to work', '', 'Passed', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(49, '2019-161', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(50, '2019-162', 'Class A', 'Fit to work', '', 'Passed', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '2019-03-11', 'no', 'no', 'no', 'no', ''),
(51, '2019-163', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(52, '2019-164', 'Class A', 'Fit to work', '', 'Passed', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(53, '2019-165', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(54, '2019-166', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(55, '2019-170', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(56, '2019-171', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(57, '2019-8000', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(58, '2019-0900', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(59, '2019-176', 'Class B', 'Fit to work but with minor observations', '', '', '', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(60, '2019-1001', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(61, '2019-1002', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(62, '2019-1003', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(63, '2019-1004', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(64, '2019-1005', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(65, '2019-1006', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(66, '2019-1007', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(67, '2019-1008', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(68, '2019-1009', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(69, '2019-1010', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(70, '2019-2000', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(71, '2019-172', 'Class A', 'Fit to work', '', 'Passed', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(72, '2019-1000', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(73, '2019-3000', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(74, '2019-204', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(75, '2019-205', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(76, '2019-206', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(77, '2019-207', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(78, '2019-2001', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', ''),
(79, '2019-208', 'Class A', 'Fit to work', '', '', 'Sacred Heart Multispecialty Clinic And Diagnostic Center Inc.', '0000-00-00', 'no', 'no', 'no', 'no', '');

-- --------------------------------------------------------

--
-- Table structure for table `medical_upload`
--

CREATE TABLE `medical_upload` (
  `id` int(11) NOT NULL,
  `company_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `file` varchar(191) CHARACTER SET latin1 NOT NULL,
  `type` varchar(191) CHARACTER SET latin1 NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medical_upload`
--

INSERT INTO `medical_upload` (`id`, `company_id`, `file`, `type`, `size`) VALUES
(1, '2019-156', '20682-roaring-drug-test.jpg', 'image/jpeg', 23237),
(2, '2019-2', '46969-arneldrugtest.jpg', 'image/jpeg', 29529);

-- --------------------------------------------------------

--
-- Table structure for table `memo_upload`
--

CREATE TABLE `memo_upload` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_number` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `lu_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice_decision`
--

CREATE TABLE `notice_decision` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_number` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_release` date DEFAULT NULL,
  `date_return` date DEFAULT NULL,
  `sanction` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `lu_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL,
  `finalize` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notice_decision`
--

INSERT INTO `notice_decision` (`ind`, `company_id`, `memo_number`, `date_release`, `date_return`, `sanction`, `created_by`, `created_date`, `lu_by`, `lu_date`, `finalize`, `remarks`) VALUES
(1, '2019-004', 'VOE-0000', NULL, NULL, '', 'admin', '2019-06-14 06:18:55', 'admin', '2019-06-14 06:18:55', 'no', ''),
(2, '2019-004', 'VOE-0010', NULL, NULL, '', 'admin', '2019-06-14 06:21:26', 'admin', '2019-06-14 06:21:26', 'no', ''),
(3, '2019-006', '2019-0329', NULL, NULL, '', 'admin', '2019-06-14 06:47:12', 'admin', '2019-06-14 06:47:12', 'no', ''),
(4, '2019-117', 'MEMO-001', NULL, NULL, '', 'admin', '2019-07-12 09:13:28', 'admin', '2019-07-12 09:13:28', 'no', '');

-- --------------------------------------------------------

--
-- Table structure for table `notice_explain`
--

CREATE TABLE `notice_explain` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `violation_class` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `violation_desc` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_release` date DEFAULT NULL,
  `date_return` date DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `lu_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL,
  `finalize` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notice_explain`
--

INSERT INTO `notice_explain` (`ind`, `company_id`, `report_by`, `violation_class`, `violation_desc`, `memo_number`, `date_release`, `date_return`, `created_by`, `created_date`, `lu_by`, `lu_date`, `finalize`) VALUES
(1, '2019-004', 'Test', '1-Verbal Warning', 'Sample Violation', 'VOE-0000', '2019-06-12', '2019-06-14', 'admin', '2019-06-14 06:18:55', 'admin', '2019-06-14 06:18:55', 'yes'),
(2, '2019-004', 'Test', '2-Written Warning', 'Sample Violation.', 'VOE-0010', '2019-06-01', '2019-06-14', 'admin', '2019-06-14 06:21:26', 'admin', '2019-06-14 06:21:26', 'yes'),
(3, '2019-006', 'lAQUI', '1-Verbal Warning', 'SLEEPING', '2019-0329', '2019-06-12', '2019-06-15', 'admin', '2019-06-14 06:47:12', 'admin', '2019-06-14 06:47:12', 'yes'),
(4, '2019-117', 'Vincent Yao', '2-Written Warning', 'Safety Violation', 'MEMO-001', '2019-07-15', '2019-07-15', 'admin', '2019-07-12 09:13:28', 'admin', '2019-07-12 09:13:28', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_group`
--

CREATE TABLE `payroll_group` (
  `ind` bigint(20) NOT NULL,
  `company_ind` bigint(20) NOT NULL,
  `group_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_desc` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payroll_group`
--

INSERT INTO `payroll_group` (`ind`, `company_ind`, `group_name`, `group_desc`, `created_by`, `created_date`, `lu_by`, `lu_date`, `deleted`) VALUES
(1, 1, 'Sample Group', '', 'admin', '2019-06-14 02:56:13', 'admin', '2019-06-14 02:56:13', 0),
(2, 1, 'Sample', '', 'admin', '2019-07-12 09:25:38', 'admin', '2019-07-16 05:37:06', 1),
(3, 1, 'Test Group', '', 'admin', '2019-07-18 05:54:11', 'admin', '2019-07-18 05:54:11', 0),
(4, 1, 'Payroll for September', 'Payroll Test Group', 'admin', '2019-08-27 17:45:52', 'admin', '2019-08-27 17:45:52', 0),
(5, 1, 'Sample Payroll Group', 'This is for testing only', 'admin', '2019-09-20 10:23:02', 'admin', '2019-09-20 10:23:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_settings`
--

CREATE TABLE `payroll_settings` (
  `id` bigint(20) NOT NULL,
  `group_ind` bigint(20) NOT NULL,
  `overtime_app` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `late_app` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `undertime_app` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `night_diff_app` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `absent_app` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `holiday_app` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `ecola_app` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `with_sss` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `with_philhealth` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `with_pagibig` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `with_withholdingtax` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `minimum_wage` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `with_previous_emp` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `exclude_payroll` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `exclude_tar` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `lunch_out` time NOT NULL DEFAULT '12:00:00',
  `lunch_in` time NOT NULL DEFAULT '13:00:00',
  `lunch_hrs` int(11) NOT NULL DEFAULT 1,
  `late_settings_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'accumulated',
  `late_allow_min` decimal(8,2) NOT NULL DEFAULT 0.00,
  `gov_deduction` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Every Payroll',
  `tax_deduction` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Every Payroll',
  `before_holiday_absent` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `after_holiday_absent` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lu_date` datetime DEFAULT current_timestamp(),
  `deleted` smallint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payroll_settings`
--

INSERT INTO `payroll_settings` (`id`, `group_ind`, `overtime_app`, `late_app`, `undertime_app`, `night_diff_app`, `absent_app`, `holiday_app`, `ecola_app`, `with_sss`, `with_philhealth`, `with_pagibig`, `with_withholdingtax`, `minimum_wage`, `with_previous_emp`, `exclude_payroll`, `exclude_tar`, `lunch_out`, `lunch_in`, `lunch_hrs`, `late_settings_type`, `late_allow_min`, `gov_deduction`, `tax_deduction`, `before_holiday_absent`, `after_holiday_absent`, `created_by`, `created_date`, `lu_by`, `lu_date`, `deleted`) VALUES
(1, 1, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No', 'No', '12:00:00', '13:00:00', 1, 'accumulated', '0.00', 'Every Payroll', 'Every Payroll', 'Yes', 'No', 'admin', '2019-06-14 02:56:13', 'admin', '2019-06-14 02:56:40', 0),
(2, 2, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No', 'No', '12:00:00', '13:00:00', 1, 'accumulated', '0.00', 'Every Payroll', 'Every Payroll', 'Yes', 'No', 'admin', '2019-07-12 09:25:38', 'admin', '2019-07-16 05:37:06', 1),
(3, 3, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No', 'No', '12:00:00', '13:00:00', 1, 'accumulated', '0.00', 'Every Payroll', 'Every Payroll', 'Yes', 'No', 'admin', '2019-07-18 05:54:11', 'admin', '2019-07-18 05:54:15', 0),
(4, 4, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No', 'No', '12:00:00', '13:00:00', 1, 'accumulated', '0.00', 'Every Payroll', 'Every Payroll', 'Yes', 'No', 'admin', '2019-08-27 17:45:52', 'admin', '2019-08-27 17:46:08', 0),
(5, 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No', 'No', '12:00:00', '13:00:00', 1, 'accumulated', '0.00', 'Every Payroll', 'Every Payroll', 'Yes', 'No', 'admin', '2019-09-20 10:23:02', 'admin', '2019-09-20 10:24:34', 0);

-- --------------------------------------------------------

--
-- Table structure for table `personal_information`
--

CREATE TABLE `personal_information` (
  `emp_no` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `citizenship` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birtdate` date DEFAULT NULL,
  `birthplace` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `csi_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_add` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_add2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_city` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_prov` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_zip` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prov_add` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prov_add2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prov_city` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prov_prov` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prov_zip` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL,
  `basic_salary` decimal(11,2) NOT NULL,
  `allowance` decimal(11,2) NOT NULL,
  `taxable_allowance` int(2) NOT NULL DEFAULT 0,
  `gross_income` decimal(11,2) NOT NULL,
  `active` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `resigned_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_information`
--

INSERT INTO `personal_information` (`emp_no`, `company_id`, `lname`, `fname`, `mname`, `gender`, `citizenship`, `status`, `birtdate`, `birthplace`, `contact_no`, `csi_email`, `personal_email`, `city_add`, `city_add2`, `city_city`, `city_prov`, `city_zip`, `prov_add`, `prov_add2`, `prov_city`, `prov_prov`, `prov_zip`, `created_by`, `created_date`, `lu_by`, `lu_date`, `basic_salary`, `allowance`, `taxable_allowance`, `gross_income`, `active`, `resigned_date`) VALUES
(1, '2019-0012', 'Test', 'EmployeeTest', '', 'Male', 'Filipino', 'Married', '2000-09-07', 'Philippines', '0912345678', 'pcdoroyan@circuit-solutions.net', 'pcdoroyan@circuit-solutions.net', 'Test', 'Test', 'Test', 'Test', '', 'Test', 'Test', 'Test', 'Test', '', 'admin', '2019-06-14 02:59:54', 'admin', '2019-07-18 05:53:37', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(2, '2019-001', 'Yao', 'Vincent', 'Chua', 'Male', 'Filipino', 'Married', '1986-09-27', 'Sorsogon Sorsogon Bicol', '09178809080', 'vincent.yao@visher-int.com', 'vincentchuayao@gmail.com', '33 Sct Tobias Diliman Quezon City', '', 'Quezon City', 'METRO MANILA', '1103', '33 Sct Tobias Diliman Quezon City', '', 'Quezon City', 'METRO MANILA', '1103', 'admin', '2019-06-14 05:26:13', 'admin', '2019-07-20 00:47:08', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(3, '2019-003', 'Laqui Jr.', 'Romeo', 'Galleto', 'Male', 'Filipino', 'Single', '1990-04-03', 'Cuenca, Batangas', '09173747447', 'rjlaqui.svs@gmail.com', 'rjlaqui2@gmail.com', '#504 B. Laqui St. Brgy. 1', '', 'Cuenca', 'Batangas', '4222', '#504 B. Laqui St. Brgy. 1', '', 'Cuenca', 'Batangas', '4222', 'admin', '2019-06-14 05:41:11', 'admin', '2019-07-24 07:51:19', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(4, '2019-006', 'Paguinto', 'Eugene', 'Caminade', 'Male', 'Filipino', 'Single', '1996-08-19', 'Hagonoy, Bulacan', '09101885769', 'eugenepaguinto.svs@gmail.com', 'eugenepaguinto19@gmail.com', '#585 San Pablo Hagonoy, Bulacan', 'Guadalupe Bliss, Building 34 ', 'Hagonoy', 'Bulacan', '3002', '#585 San Pablo Hagonoy, Bulacan', 'Guadalupe Bliss, Building 34 ', 'Hagonoy', 'Bulacan', '3002', 'admin', '2019-06-14 05:41:45', 'admin', '2019-09-09 09:25:51', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(5, '2019-109', 'Viterbo', 'Vincent', 'Sausa', 'Male', 'Filipino', 'Single', '1988-09-23', '', '09085403342', 'NA@yahoo.com', 'NA@yahoo.com', 'Blk 41 Lot44, Zone 5 Brgy. Addition Hills', '', 'Mandaluyong City', 'Metro Manila', '', 'Blk 41 Lot44, Zone 5 Brgy. Addition Hills', '', 'Mandaluyong City', 'Metro Manila', '', 'admin', '2019-06-18 00:43:23', 'admin', '2019-06-18 01:40:07', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(6, '2019-2', 'Baraquiel', 'Arnel', 'Guillermo', 'Male', 'Filipino', 'Married', '1982-04-21', '136D. Marcelo St., Rosario Montalban Rizal', '09206217014', 'NA@yahoo.com', 'NA@yahoo.com', '136D. Marcelo St., Rosario', '', 'Montalban', 'Rizal', '1860', '136D. Marcelo St., Rosario', '', 'Montalban', 'Rizal', '1860', 'admin', '2019-06-18 00:57:30', 'admin', '2019-08-29 11:56:11', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(7, '2019-103', 'Miranda Jr.', 'Rufino', 'Borila', 'Male', 'Filipino', 'Single', '1989-05-08', 'Pasig City', '09982341433', 'mirandaryzen@yahoo.com', 'mirandaryzen@yahoo.com', 'Blk 41 Daisy St. ', '', 'Mandaluyong City', 'Metro Manila', '', 'Blk 41 Daisy St. ', '', 'Mandaluyong City', 'Metro Manila', '', 'admin', '2019-06-18 01:05:47', 'admin', '2019-09-10 09:24:49', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(8, '2019-8', 'Catapang', 'Fritz John', '', 'Male', 'Filipino', 'Single', '1992-02-20', '', '09753828903', 'NA8@yahoo.com', 'NA8@yahoo.com', '2084A Batangas Line', '', 'Paco', 'Metro Manila', '', '2084A Batangas Line', '', 'Paco', 'Metro Manila', '', 'admin', '2019-06-18 01:24:33', 'admin', '2019-09-11 21:00:40', '0.00', '0.00', 0, '0.00', 'no', '2019-07-31'),
(9, '2019-100', 'Gutierrez', 'Ruben', 'Mendoza', 'Male', 'Filipino', 'Single', '1991-08-23', '', '09095554749', 'na9@yahoo.com', 'na9@yahoo.com', '74 Pinagkrusan', '', 'Alitagtag', 'Batangas', '', '74 Pinagkrusan', '', 'Alitagtag', 'Batangas', '', 'admin', '2019-06-18 01:33:00', 'admin', '2019-07-27 07:16:09', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(10, '2019-110', 'Gochangco', 'Nikko Emerson', 'Alipio', 'Male', 'Filipino', 'Single', '1989-04-16', '', '09173555349', 'na110@yahoo.com', 'na110@yahoo.com', '#34 Ilang-Ilang St. Maricaban', '', 'Pasay City', 'Metro Manila', '', '#34 Ilang-Ilang St. Maricaban', '', 'Pasay City', 'Metro Manila', '', 'admin', '2019-06-18 01:46:26', 'admin', '2019-07-27 01:06:57', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(11, '2019-111', 'Merced Jr.', 'Virgilio', 'Castillo', 'Male', 'Filipino', 'Single', '1982-11-26', '', '09287363395', 'na111@yahoo.com', 'na111@yahoo.com', '077B Dona Aurora St.', '', 'Anguno', 'Rizal', '', '077B Dona Aurora St.', '', 'Anguno', 'Rizal', '', 'admin', '2019-06-18 01:54:59', 'admin', '2019-08-01 00:56:37', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(12, '2019-112', 'Aquino', 'Emerson', 'Mauricio', 'Male', 'Filipino', 'Married', '1984-06-15', '', '09215287683', 'emersonaquino.svs@gmail.com', 'emersonaquino.svs@gmail.com', 'Blk2 Jasmin St. San Isidro', '', 'Taytay', 'Rizal', '', 'Blk2 Jasmin St. San Isidro', '', 'Taytay', 'Rizal', '', 'admin', '2019-06-18 02:00:37', 'admin', '2019-09-02 10:55:40', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(13, '2019-113', 'Hernandez', 'Gabriel', 'Lacanaria', 'Male', 'Filipino', 'Single', '1993-02-16', '', '09997087247', 'na113@yahoo.com', 'na113@yahoo.com', '99 Capt. Rufino St. Brgy. San Isidro', '', 'Angono', 'Rizal', '', '99 Capt. Rufino St. Brgy. San Isidro', '', 'Angono', 'Rizal', '', 'admin', '2019-06-18 02:05:05', 'admin', '2019-09-02 10:57:55', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(14, '2019-114', 'Morabe', 'Reynaldo', 'Quidlat', 'Male', 'Filipino', 'Married', '1968-11-11', '', '09288643080', 'na114@yahoo.com', 'na114@yahoo.com', '1228 Int. 5 Kahilom 2', '', 'Pandacan', 'Metro Manila', '', '1228 Int. 5 Kahilom 2', '', 'Pandacan', 'Metro Manila', '', 'admin', '2019-06-18 02:12:40', 'admin', '2019-08-01 01:54:28', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(15, '2019-115', 'Balbuena', 'Roberto', 'Evardone', 'Male', 'Filipino', 'Married', '1969-01-21', '', '09185303557', 'na115@yahoo.com', 'na115@yahoo.com', 'Blk37 Lot17 Dagas Dagatan', '', 'Navotas', 'Manila', '', 'Blk37 Lot17 Dagas Dagatan', '', 'Navotas', 'Manila', '', 'admin', '2019-06-18 02:20:44', 'admin', '2019-08-01 00:55:28', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(16, '2019-116', 'Padoga', 'Randy', 'Rodrigo', 'Male', 'Filipino', 'Married', '1990-05-30', '', '09651991049', 'na116@yahoo.com', 'na116@yahoo.com', 'Blk22 Lot10., Brgy San Mateo', '', 'Dasma City', 'Cavite', '', 'Blk22 Lot10., Brgy San Mateo', '', 'Dasma City', 'Cavite', '', 'admin', '2019-06-18 02:30:36', 'admin', '2019-09-10 09:26:35', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(17, '2019-117', 'Astor', 'Reynaldo', 'Calderon', 'Male', 'Filipino', 'Single', '1971-07-18', '', '09771088213', 'na117@yahoo.com', 'na117@yahoo.com', 'Blk41 Lot10 Kaunlaran Village', '', 'Navotas City', 'Metro Manila', '', 'Blk41 Lot10 Kaunlaran Village', '', 'Navotas City', 'Metro Manila', '', 'admin', '2019-06-18 02:41:11', 'admin', '2019-08-01 00:58:07', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(18, '2019-118', 'Niedo', 'John Edric', 'Omnes', 'Male', 'Filipino', 'Single', '2019-06-18', '', '09486699102', 'na118@yahoo.com', 'na118@yahoo.com', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '', 'admin', '2019-06-18 02:50:35', 'admin', '2019-06-18 02:50:35', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(19, '2019-11', 'Guntang', 'Jerico', '', 'Male', 'Filipino', 'Single', '1990-04-04', '', '09000000000', 'na21@yahoo.com', 'na21@yahoo.com', 'Greenbelt Hamilton', '', 'Makati City', 'Manila', '', 'Greenbelt Hamilton', '', 'Makati City', 'Manila', '', 'admin', '2019-06-18 03:40:45', 'admin', '2019-09-10 09:09:19', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(20, '2019-201', 'Fampolme', 'Richard', 'Ferraro', 'Male', 'Filipino', 'Single', '1976-08-24', '', '09475579153', 'na24@yahoo.com', 'na24@yahoo.com', '#459 Rose St. East Side Service Road', '', 'Alabang', 'Muntinlupa City', '', '#459 Rose St. East Side Service Road', '', 'Alabang', 'Muntinlupa City', '', 'admin', '2019-06-28 00:17:33', 'admin', '2019-09-02 10:24:58', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(21, '2019-203', 'Bisnan', 'Manuel', 'Ampoloquio', 'Male', 'Filipino', 'Married', '1990-07-18', '', '09063341376', 'na32@yahoo.com', 'na32@yahoo.com', 'Blk142 Lot40, Purok 2, San Diego', '', 'Central Bicutan', 'Taguig City', '', 'Blk142 Lot40, Purok 2, San Diego', '', 'Central Bicutan', 'Taguig City', '', 'admin', '2019-06-28 05:50:28', 'admin', '2019-08-29 12:00:07', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(22, '2019-134', 'Nepomuceno', 'Jhon Jhon', 'Licaros', 'Male', 'Filipino', 'Single', '1990-07-01', '', '09351402782', 'na132@yahoo.com', 'na132@yahoo.com', '934', '', 'Mandaluyong City', 'Manila', '', '934', '', 'Mandaluyong City', 'Manila', '', 'admin', '2019-06-28 05:58:19', 'admin', '2019-06-28 05:58:19', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(23, '2019-135', 'Montilla Jr.', 'Hermoso', 'Delos Santos', 'Male', 'Filipino', 'Single', '1994-01-05', '', '09279681878', 'na135@yahoo.com', 'na135@yahoo.com', '48 Loreto St.', '', 'Sampaloc', 'Manila', '', '48 Loreto St.', '', 'Sampaloc', 'Manila', '', 'admin', '2019-06-28 06:06:11', 'admin', '2019-06-28 06:06:11', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(24, '2019-136', 'Reyes', 'Michael', 'Hapa', 'Male', 'Filipino', 'Married', '1985-05-22', '', '09260571812', 'na136@yahoo.com', 'na136@yahoo.com', '838 R. Almario St. Dagupan', '', 'Tondo', 'Manila', '', '838 R. Almario St. Dagupan', '', 'Tondo', 'Manila', '', 'admin', '2019-06-28 06:18:51', 'admin', '2019-07-27 03:08:00', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(25, '2019-137', 'Mangalino', 'John', 'Mallari', 'Male', 'Filipino', 'Single', '1983-08-06', '', '09321714938', 'na137@yahoo.com', 'na137@yahoo.com', '2084 A. Batangas Line', '', 'Paco', 'Manila', '', '2084 A. Batangas Line', '', 'Paco', 'Manila', '', 'admin', '2019-06-28 06:30:33', 'admin', '2019-06-28 06:30:33', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(26, '2019-138', 'Musca', 'Joseph', 'Abiertas', 'Male', 'Filipino', 'Single', '1986-03-31', '', '09094546877', 'muscajoseph16@gmail.com', 'muscajoseph16@gmail.com', '2406 Oro-A St. ', '', 'San Andres Bukid', 'Mania', '', '2406 Oro-A St. ', '', 'San Andres Bukid', 'Mania', '', 'admin', '2019-06-28 06:40:36', 'admin', '2019-09-10 09:03:43', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(27, '2019-139', 'Mangalino', 'Adryan', 'Ferrer', 'Male', 'Filipino', 'Married', '1988-07-19', '', '09289418074', 'na139@yahoo.com', 'na139@yahoo.com', 'Phase 1 Blk5 Lot116, Eastwood Homes', '', 'Rodriguez', 'Rizal', '', 'Phase 1 Blk5 Lot116, Eastwood Homes', '', 'Rodriguez', 'Rizal', '', 'admin', '2019-06-28 06:46:34', 'admin', '2019-09-02 10:26:51', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(28, '2019-140', 'Soler', 'Jayson', 'Sicad', 'Male', 'Filipino', 'Single', '1993-03-04', '', '09508204077', 'na140@yahoo.com', 'na140@yahoo.com', '219 Hernandez Catmon', '', 'Malabon', 'Manila', '', '219 Hernandez Catmon', '', 'Malabon', 'Manila', '', 'admin', '2019-06-28 06:51:23', 'admin', '2019-06-28 06:51:23', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(29, '2019-005', 'Morales', 'Arturo', 'Sarmiento', 'Male', 'Filipino', 'Widow', '1969-04-28', '', '09129578181', 'na141@yahoo.com', 'na141@yahoo.com', '400 T. Cabangis St.', '', 'Tondo', 'Manila', '', '400 T. Cabangis St.', '', 'Tondo', 'Manila', '', 'admin', '2019-06-28 06:55:08', 'admin', '2019-09-10 09:28:40', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(30, '2019-143', 'Donghil Jr.', 'Edgardo', 'Lopez', 'Male', 'Filipino', 'Married', '1982-09-18', 'Liloan Southern Leyte', '', 'na142@yahoo.com', 'na143@yahoo.com', 'Blk 36 Welfareville Cmpd. Brgy. Addition Hills', '', 'Mandaluyong City', 'Manila', '', 'Blk 36 Welfareville Cmpd. Brgy. Addition Hills', '', 'Mandaluyong City', 'Manila', '', 'admin', '2019-06-28 07:00:33', 'admin', '2019-07-27 07:26:49', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(31, '2019-144', 'Alda Sr.', 'Rolando', 'Lapurga', 'Male', 'Filipino', 'Married', '1965-12-20', 'Bacoor Cavite', '', 'na144@yahoo.com', 'na144@yahoo.com', 'B29 L7 Bagong Silang Queensrow East', '', 'Bacoor', 'Cavite', '', 'B29 L7 Bagong Silang Queensrow East', '', 'Bacoor', 'Cavite', '', 'admin', '2019-06-28 07:04:05', 'admin', '2019-09-11 20:59:34', '0.00', '0.00', 0, '0.00', 'no', '2019-07-01'),
(32, '2019-145', 'Bernardino', 'Michael', 'Escueta', 'Male', 'Filipino', 'Married', '1974-12-20', 'Makati Rizal', '09480947336', 'na145@yahoo.com', 'na145@yahoo.com', '70 Filipinas Avenue United 5 ', '', 'Paranaque', 'Manila', '', '70 Filipinas Avenue United 5 ', '', 'Paranaque', 'Manila', '', 'admin', '2019-06-28 07:12:59', 'admin', '2019-06-28 07:12:59', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(33, '2019-147', 'Carpon', 'Sergio', 'Villanueva', 'Male', 'Filipino', 'Married', '1969-11-22', 'Almagro Samar', '', 'na147@yahoo.com', 'na147@yahoo.com', 'B43 L19 Brgy. Victoria Reyes', '', 'Dasmarinas', 'Cavite', '', 'B43 L19 Brgy. Victoria Reyes', '', 'Dasmarinas', 'Cavite', '', 'admin', '2019-06-28 07:23:14', 'admin', '2019-09-10 09:07:45', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(34, '2019-202', 'Rotea', 'Rolando', 'Megano', 'Male', 'Filipino', 'Widow', '1974-10-16', 'Manila', '09453501527', 'na149@yahoo.com', 'na149@yahoo.com', 'PH8A PKG11 B131 L19 Bagong Silang', '', 'Caloocan', 'Manila', '', 'PH8A PKG11 B131 L19 Bagong Silang', '', 'Caloocan', 'Manila', '', 'admin', '2019-06-28 07:27:17', 'admin', '2019-08-30 08:18:21', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(35, '2019-200', 'Dante', 'Mark Jason', 'Malaponggit', 'Male', 'Filipino', 'Single', '1990-01-04', 'Antipolo City', '09998600782', 'coolletssr@gmail.com', 'coolletssr@gmail.com', '937 Ph4 B. Dela Paz', '', 'Antipolo City', 'Rizal', '', '937 Ph4 B. Dela Paz', '', 'Antipolo City', 'Rizal', '', 'admin', '2019-06-28 07:31:24', 'admin', '2019-08-31 08:43:11', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(36, '2019-151', 'Garcia', 'Rodel', 'Dacasin', 'Male', 'Filipino', 'Married', '1992-06-16', 'Teresa Rizal', '09504357995', 'na151@yahoo.com', 'na151@yahoo.com', 'Sitio Ibabaw 1 Brgy. Dulumbayan', '', 'Teresa', 'Rizal', '', 'Sitio Ibabaw 1 Brgy. Dulumbayan', '', 'Teresa', 'Rizal', '', 'admin', '2019-06-28 07:35:58', 'admin', '2019-09-13 08:57:37', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(37, '2019-152', 'Musca', 'Arnel', 'Abiertas', 'Male', 'Filipino', 'Single', '1988-10-09', 'Manila', '09467570010', 'na152@yahoo.com', 'na152@yahoo.com', '2406 Oro-A St. San Andres Bukid', '', 'San Andres Bukid', 'Manila', '', '2406 Oro-A St. San Andres Bukid', '', 'San Andres Bukid', 'Manila', '', 'admin', '2019-06-28 07:40:28', 'admin', '2019-08-02 00:47:00', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(38, '2019-153', 'De Guzman', 'Leonardo', 'Tulio', 'Male', 'Filipino', 'Married', '1968-04-29', 'Binalonan, Pangasinan', '09669029479', 'na153@yahoo.com', 'na153@yahoo.com', '134 Mercados Compound Hagonoy', '', 'Taguig City', 'Manila', '', '134 Mercados Compound Hagonoy', '', 'Taguig City', 'Manila', '', 'admin', '2019-06-28 07:45:20', 'admin', '2019-06-28 07:45:20', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(39, '2019-154', 'Nepomuceno', 'Lorenzo', 'Licaros', 'Male', 'Filipino', 'Single', '1991-05-15', 'Mandaluyong City', '09491270114', 'na154@yahoo.com', 'na154@yahoo.com', '934 MRR Track St. Barangka Ibaba ', '', 'Mandaluyong City', 'Manila', '', '934 MRR Track St. Barangka Ibaba ', '', 'Mandaluyong City', 'Manila', '', 'admin', '2019-06-28 07:50:36', 'admin', '2019-08-29 11:30:43', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(40, '2019-155', 'Untalan', 'Jhun Lionel', 'Morta', 'Male', 'Filipino', 'Single', '1992-03-31', 'Teresa Rizal', '09202432749', 'na155@yahoo.com', 'na155@yahoo.com', 'Sitio Ibabaw Dulum Bayan', '', 'Teresa', 'Rizal', '', 'Sitio Ibabaw Dulum Bayan', '', 'Teresa', 'Rizal', '', 'admin', '2019-06-28 07:55:21', 'admin', '2019-06-28 07:55:21', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(41, '2019-156', 'Roaring', 'Vincent Francis', 'Mateo', 'Male', 'Filipino', 'Single', '1993-04-04', '#64 A. DELA PAZ ST. ANTIPOLO RIZAL', '09061142800', 'na156@yahoo.com', 'na156@yahoo.com', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '', 'admin', '2019-06-28 07:59:44', 'admin', '2019-08-29 11:25:21', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(42, '2019-0180', 'Tamad', 'Juan', '', 'Male', 'Filipino', 'Single', '2011-07-27', '', '', 'test@gmail.com', 'test@gmail.com', 'test', 'test', 'test', 'test', '8888', 'test', 'test', 'test', 'test', '8888', 'admin', '2019-07-18 09:24:40', 'admin', '2019-07-18 09:24:40', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(43, '2019-0050', 'Anis', 'Cherry', '', 'Female', 'Filipino', 'Single', '1999-07-24', '', '', 'email@email.com', 'email@email.com', 'Sample', 'Sample', 'Sample', 'Sample', '', 'Sample', 'Sample', 'Sample', 'Sample', '', 'admin', '2019-07-19 03:06:20', 'admin', '2019-07-29 02:01:26', '0.00', '0.00', 0, '0.00', 'no', '2019-07-29'),
(44, '2019-004', 'Niedo', 'Marito', 'Bautista', 'Male', 'Filipino', 'Married', '1966-01-30', 'Pangasinan', '09202432749', 'na1240@yahoo.com', 'na1240@yahoo.com', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '', 'admin', '2019-07-20 06:57:51', 'admin', '2019-07-30 00:05:17', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(45, '2019-90', 'Test', 'Test', 'Sample ', 'Male', 'Filipino', 'Married', '2019-07-16', '', '', 'sample@gmail.com', 'sample@gmail.com', '2', 'San Miguel', 'Pasig City', 'Metro Manila Pasig', '2018', '2', 'San Miguel', 'Pasig City', 'Metro Manila Pasig', '2018', 'admin', '2019-07-23 03:21:35', 'admin', '2019-07-23 03:21:35', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(46, '2019-157', 'Victorioso', 'Joseph', 'Adonis', 'Male', 'Filipino', 'Married', '1985-10-05', 'Taytay Rizal', '09266274812', 'Josephvictorioso.svs@gmail.com', 'Josephvictorioso.svs@gmail.com', '132 Sitio victoria, Cainta rizal', '132 Sitio victoria, Cainta rizal', 'Cainta, Rizal', 'Cainta, Rizal', '', '132 Sitio victoria, Cainta rizal', '132 Sitio victoria, Cainta rizal', 'Cainta, Rizal', 'Cainta, Rizal', '', 'admin', '2019-07-24 02:42:37', 'admin', '2019-08-29 13:34:31', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(47, '2019-158', 'Garcia', 'Alvin', 'Dacasin', 'Male', 'Filipino', 'Single', '1990-05-29', 'Antipolo, Rizal', '09452746626', 'na19000@yahoo.com', 'na800000@yahoo.com', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '1880', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '1880', 'admin', '2019-07-24 05:31:45', 'admin', '2019-08-29 14:44:36', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(48, '2019-159', 'Cayanan', 'Cezar', 'Gayaondato', 'Male', 'Filipino', 'Married', '1983-12-31', 'Manila', '09956770620', 'cezarcayanan@yahoo.com', 'cezarcayanan@yahoo.com', 'Tabing Dagat Talabados ', '', 'Bacoor', 'Cavity', '4102', 'Tabing Dagat Talabados ', '', 'Bacoor', 'Cavity', '4102', 'admin', '2019-07-24 05:41:23', 'admin', '2019-08-29 14:56:49', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(49, '2019-161', 'Garcia', 'Meynard', 'Dacasin', 'Male', 'Filipino', 'Single', '1997-01-05', 'Teresa, Rizal', '09068526799', 'meynardgarcia313@yahoo.com', 'meynardgarcia313@yahoo.com', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '1880', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '1880', 'admin', '2019-07-24 05:50:44', 'admin', '2019-08-02 00:51:40', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(50, '2019-162', 'Pedrajas', 'Clyd', 'Estrellanes', 'Male', 'Filipino', 'Married', '1989-12-19', 'Cabatuan, Iloilo', '09093453883', 'clydpedrajas@yahoo.com', 'clydpedrajas@gmail.com', 'Cabatuan Ilolo', 'Cabatuan Ilolo', 'ilo ilo', 'ilo ilo', '', 'Cabatuan Ilolo', 'Cabatuan Ilolo', 'ilo ilo', 'ilo ilo', '', 'admin', '2019-07-26 05:11:52', 'admin', '2019-09-10 14:58:00', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(51, '2019-163', 'Polin', 'Eugene', '', 'Male', 'Filipino', 'Single', '1985-04-29', '', '', 'eugenepolin@gmail.com', 'eugenepolin@gmail.com', 'Muntinlupa City', 'Muntinlupa City', 'Muntinlupa City', 'Muntinlupa City', '', 'Muntinlupa City', 'Muntinlupa City', 'Muntinlupa City', 'Muntinlupa City', '', 'admin', '2019-07-26 05:20:32', 'admin', '2019-07-26 05:22:11', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(52, '2019-164', 'Curamen', 'Christopher', 'Pascua', 'Male', 'Filipino', 'Single', '1981-04-24', 'Rizal, Nueva Ecija', '09398999666', 'christophercuramen24@gmail.com', 'christophercuramen24@gmail.com', '3201 J Trinidad ST. Manuguit Manila', '3201 J Trinidad ST. Manuguit Manila', '3201 J Trinidad ST. Manuguit Manila', '3201 J Trinidad ST. Manuguit Manila', '', '3201 J Trinidad ST. Manuguit Manila', '3201 J Trinidad ST. Manuguit Manila', '3201 J Trinidad ST. Manuguit Manila', '3201 J Trinidad ST. Manuguit Manila', '', 'admin', '2019-07-26 05:29:04', 'admin', '2019-09-02 15:37:17', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(53, '2019-165', 'Ranas', 'Neddie', '', 'Male', 'Filipino', 'Single', '1990-10-09', '', '', 'Ranas@gmail.com', 'Ranas@gmail.com', 'Caloocan City', 'Caloocan City', 'Caloocan City', 'Caloocan City', '', 'Caloocan City', 'Caloocan City', 'Caloocan City', 'Caloocan City', '', 'admin', '2019-07-26 05:35:32', 'admin', '2019-07-26 05:36:53', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(54, '2019-166', 'Begaso', 'Dave', 'Caspe', 'Male', 'Filipino', 'Single', '1994-04-07', 'Cabatuan, Iloilo', '09302460716', 'begaso24@yahoo.com', 'begaso24@yahoo.com', 'iloilo', 'Iloilo City', 'Mandaluyong City', 'Manila', '', 'Iloilo City', 'Iloilo City', 'Iloilo City', 'Iloilo City', '', 'admin', '2019-07-26 05:44:07', 'admin', '2019-09-02 15:12:09', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(55, '2019-170', 'Olorvida', 'Victorino', '', 'Male', 'Filipino', 'Married', '1984-12-22', '', '', 'Victorino@gmail.com', 'Victorino@gmail.com', '301 Santa Ursula Subd. Brgy. Batingan, Binangunan Rizal', '301 Santa Ursula Subd. Brgy. Batingan, Binangunan Rizal', 'Rizal', 'Rizal', '', '301 Santa Ursula Subd. Brgy. Batingan, Binangunan Rizal', '301 Santa Ursula Subd. Brgy. Batingan, Binangunan Rizal', 'Rizal', 'Rizal', '', 'admin', '2019-07-27 05:46:49', 'admin', '2019-07-27 05:50:16', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(56, '2019-171', 'Epino Jr.', 'Rodolfo', '', 'Male', 'Filipino', 'Single', '1989-07-14', '', '', 'Epini@gmail.com', 'Epini@gmail.com', 'Sitio Ibabaw Dulumbayan Teresa Rizal', 'Sitio Ibabaw Dulumbayan Teresa Rizal', 'Teresa Rizal', 'Sitio Ibabaw Dulumbayan Teresa Rizal', '', 'Sitio Ibabaw Dulumbayan Teresa Rizal', 'Sitio Ibabaw Dulumbayan Teresa Rizal', 'Teresa Rizal', 'Sitio Ibabaw Dulumbayan Teresa Rizal', '', 'admin', '2019-07-27 05:55:56', 'admin', '2019-07-27 06:25:00', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(57, '2019-8000', 'New', 'New', '', 'Female', 'Filipino', 'Single', '2010-07-23', '', '', 'new@new.new', 'new@new.new', 'New', 'New', 'New', 'New', '', 'New', 'New', 'New', 'New', '', 'admin', '2019-07-29 02:04:09', 'admin', '2019-08-28 09:42:06', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(58, '2019-0900', 'Sample', 'Sample', '', 'Female', 'Filipino', 'Single', '1999-07-16', '', '', 'sample@sample.com', 'sample@sample.com', 'Sample', 'Sample', 'Sample', 'Sample', '', 'Sample', 'Sample', 'Sample', 'Sample', '', 'admin', '2019-07-29 05:42:58', 'admin', '2019-07-29 05:42:58', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(59, '2019-176', 'Tabiando', 'Joemar', 'Armada', 'Male', 'Filipino', 'Married', '1991-11-30', 'Dolaoan Anda Pangasin', '09463527808', 'joemar.svs@gmail.com', 'joemar.svs@gmail.com', 'Dolaoan Anda, Pangasinan ', 'Dolaoan Anda, Pangasinan ', 'Pangasinan', 'pangasinan', '', 'Dolaoan Anda, Pangasinan ', 'Dolaoan Anda, Pangasinan ', 'Pangasinan', 'pangasinan', '', 'admin', '2019-07-30 06:07:28', 'admin', '2019-09-10 14:41:11', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(60, '2019-1001', 'Employee1', 'Employee1', '', 'Female', 'Filipino', 'Single', '1990-10-10', '', '', 'cherryann_anis@yahoo.com', 'cherryann_anis@yahoo.com', 'Test', 'Test', 'Test', 'Test', '0000', 'Test', 'Test', 'Test', 'Test', '0000', 'admin', '2019-08-27 17:53:22', 'admin', '2019-08-27 17:53:22', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(61, '2019-1002', 'Employee2', 'Employee2', '', 'Male', 'Filipino', 'Single', '1980-12-01', '', '', 'cherryann_anis@yahoo.com', 'cherryann_anis@yahoo.com', 'Test', 'Test', 'Test', 'Test', '', 'Test', 'Test', 'Test', 'Test', '', 'admin', '2019-08-28 11:04:08', 'admin', '2019-08-28 11:04:08', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(62, '2019-1003', 'Employee3', 'Employee3', '', 'Male', 'Filipino', 'Single', '1980-06-05', '', '', 'cherryann_anis@yahoo.com', 'cherryann_anis@yahoo.com', 'Test', 'Test', 'Test', 'Test', '', 'Test', 'Test', 'Test', 'Test', '', 'admin', '2019-08-28 13:24:21', 'admin', '2019-08-28 13:24:21', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(63, '2019-1004', 'Employee4', 'Employee4', '', 'Female', 'Filipino', 'Single', '2010-10-05', '', '', 'cherryann_anis@yahoo.com', 'cherryann_anis@yahoo.com', 'Test', 'Test', 'Test', 'Test', '', 'Test', 'Test', 'Test', 'Test', '', 'admin', '2019-08-28 13:54:50', 'admin', '2019-08-28 13:54:50', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(64, '2019-1005', 'Employee5', 'Employee5', '', 'Male', 'Filipino', 'Single', '1989-09-06', '', '', 'cherryann_anis@yahoo.com', 'cherryann_anis@yahoo.com', 'Test', 'Test', 'Test', 'Test', '', 'Test', 'Test', 'Test', 'Test', '', 'admin', '2019-08-28 14:00:56', 'admin', '2019-08-28 14:00:56', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(65, '2019-1006', 'Employee6', 'Employee6', '', 'Female', 'Filipino', 'Single', '1990-07-08', '', '', 'cherryann_anis@yahoo.com', 'cherryann_anis@yahoo.com', 'Test', 'Test', 'Test', 'Test', '', 'Test', 'Test', 'Test', 'Test', '', 'admin', '2019-08-28 14:05:56', 'admin', '2019-08-28 14:05:56', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(66, '2019-1007', 'Employee7', 'Employee7', '', 'Male', 'Filipino', 'Single', '1996-08-09', '', '', 'cherryann_anis@yahoo.com', 'cherryann_anis@yahoo.com', 'Test', 'Test', 'Test', 'Test', '', 'Test', 'Test', 'Test', 'Test', '', 'admin', '2019-08-28 14:25:08', 'admin', '2019-08-28 14:25:08', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(67, '2019-1008', 'Employee8', 'Employee8', '', 'Male', 'Filipino', 'Single', '1986-02-08', '', '', 'cherryann_anis@yahoo.com', 'cherryann_anis@yahoo.com', 'Test', 'Test', 'Test', 'Test', '', 'Test', 'Test', 'Test', 'Test', '', 'admin', '2019-08-28 17:02:47', 'admin', '2019-08-28 17:02:47', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(68, '2019-1009', 'Employee9', 'Employee9', '', 'Female', 'Filipino', 'Single', '1997-03-06', '', '', 'cherryann_anis@yahoo.com', 'cherryann_anis@yahoo.com', 'Test', 'Test', 'Test', 'Test', '', 'Test', 'Test', 'Test', 'Test', '', 'admin', '2019-08-28 17:04:43', 'admin', '2019-08-28 17:04:43', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(69, '2019-1010', 'Employee10', 'Employee10', '', 'Male', 'Filipino', 'Single', '1993-08-07', '', '', 'cherryann_anis@yahoo.com', 'cherryann_anis@yahoo.com', 'Test', 'Test', 'Test', 'Test', '', 'Test', 'Test', 'Test', 'Test', '', 'admin', '2019-08-28 17:06:24', 'admin', '2019-08-28 17:06:24', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(70, '2019-2000', 'Sta. Ana', 'Christian', 'San Diego', 'Male', 'Filipino', 'Single', '1997-03-24', 'Taytay Rizal', '09066453013', 'nako@yahoo.com', 'nako@yahoo.com', '34 Loyola St. Brgy. Sta. Ana Taytay Rizal', '', 'Taytay', 'Rizal', '', '34 Loyola St. Brgy. Sta. Ana Taytay Rizal', '', 'Taytay', 'Rizal', '', 'admin', '2019-08-29 10:30:48', 'admin', '2019-08-29 10:30:48', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(71, '2019-172', 'Madarang', 'Alfredo', 'San Juan', 'Male', 'Filipino', 'Single', '1977-04-02', 'Sitio Ibabaw Dulumbayan Teresa Rizal', '09304058260', 'madarang@gmail.com', 'madarang@gmail.com', 'Sitio Ibabaw Dulumbayan Teresa Rizal', 'Sitio Ibabaw Dulumbayan Teresa Rizal', 'Teresa Rizal', 'Rizal', '', 'Sitio Ibabaw Dulumbayan Teresa Rizal', 'Sitio Ibabaw Dulumbayan Teresa Rizal', 'Teresa Rizal', 'Rizal', '', 'admin', '2019-08-29 14:25:45', 'admin', '2019-08-29 14:25:45', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(72, '2019-1000', 'Dacasin', 'Joshua', 'Zulueta', 'Male', 'Filipino', 'Single', '1999-11-06', 'Antipolo Rizal', '09127665868', 'josuaewan@yahoo.com', 'josuaewan@yahoo.com', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '', 'admin', '2019-08-29 14:41:21', 'admin', '2019-09-09 15:22:33', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(73, '2019-3000', 'Berja', 'Jomar', 'Aboga', 'Male', 'Filipino', 'Single', '1993-11-08', 'Teresa Rizal', '09092528157', 'berjajomar24@yahoo.com', 'berjajomar24@yahoo.com', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '', 'Sitio Ibabaw Dulumbayan', '', 'Teresa', 'Rizal', '', 'admin', '2019-08-29 14:53:19', 'admin', '2019-09-10 09:30:34', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(74, '2019-204', 'Vargas', 'Gerald', 'Paguinto', 'Male', 'Filipino', 'Single', '2000-11-22', 'Bulacan', '09163392543', 'gerald@yahoo.com', 'gerald@yahoo.com', 'San Pablo', '', 'Hagonoy', 'Bulacan', '', 'San Pablo', '', 'Hagonoy', 'Bulacan', '', 'admin', '2019-09-02 10:53:32', 'admin', '2019-09-02 10:53:32', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(75, '2019-205', 'Ulbe', 'Luisito', 'Estolatan', 'Male', 'Filipino', 'Single', '1985-11-12', '', '09305681837', 'ulbe@yahoo.com', 'ulbe@yahoo.com', 'no add', '', 'no add', 'no add', '', 'no add', '', 'no add', 'no add', '', 'admin', '2019-09-02 11:02:59', 'admin', '2019-09-10 08:59:58', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(76, '2019-206', 'Virgo', 'Benny', 'Lauresta', 'Male', 'Filipino', 'Single', '1974-02-12', '', '09166968743', 'virgo@yahoo.com', 'benny@yahoo.com', '206 Mt. Apo Eusebio Bliss Westbank Maybunga', '', 'Pasig', 'Manila', '', '206 Mt. Apo Eusebio Bliss Westbank Maybunga', '', 'Pasig', 'Manila', '', 'admin', '2019-09-02 11:19:41', 'admin', '2019-09-10 09:05:30', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(77, '2019-207', 'Valero', 'Noel', 'Lobo', 'Male', 'Filipino', 'Single', '2001-01-01', 'Rizal', '09284703630', 'noel@yahoo.com', 'noel@yaho.com', 'Sitio Ibabaw Brgy. Dulumbayan', '', 'Teresa', 'Rizal', '', 'Sitio Ibabaw Brgy. Dulumbayan', '', 'Teresa', 'Rizal', '', 'admin', '2019-09-02 11:41:08', 'admin', '2019-09-02 11:41:08', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(78, '2019-2001', 'Jutba Jr.', 'Danilo', 'Garcia', 'Male', 'Filipino', 'Married', '1982-09-16', '', '09457544031', 'dnailo@yahoo.com', 'danilo@yahoo.com', 'F.14 Kapitbahayan ', '', 'Navotas City', 'Manila', '', 'F.14 Kapitbahayan ', '', 'Navotas City', 'Manila', '', 'admin', '2019-09-02 12:41:07', 'admin', '2019-09-02 12:41:07', '0.00', '0.00', 0, '0.00', 'yes', NULL),
(79, '2019-208', 'Lim', 'Danica', 'Biaco', 'Female', 'Filipino', 'Single', '1993-02-01', 'makati city', '09158912040', 'Danica.b.lim@gmail.com', 'Danica.b.lim@gmail.com', '80-A kalayaan aveneu diliman ', '80-A kalayaan aveneu diliman ', 'quezon city', 'Manila', '1100', '80-A kalayaan aveneu diliman ', '80-A kalayaan aveneu diliman ', 'quezon city', 'Manila', '1100', 'admin', '2019-09-09 15:33:07', 'admin', '2019-09-09 15:33:07', '0.00', '0.00', 0, '0.00', 'yes', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile_picture`
--

CREATE TABLE `profile_picture` (
  `id` bigint(10) NOT NULL,
  `company_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_picture`
--

INSERT INTO `profile_picture` (`id`, `company_id`, `file`, `type`, `size`) VALUES
(1, '2019-144', '66276-steph-curry.jpg', 'image/jpeg', 17),
(2, '2019-010', '4729-67553193_701581893589483_204857609168093184_n.jpg', 'image/jpeg', 506),
(3, '2019-0004', '43799-67337159_383795542274136_4898722866117214208_n.jpg', 'image/jpeg', 473),
(4, '2019-0800', '22175-chicken.jpg', 'image/jpeg', 146),
(5, '2019-8000', '23472-2zikyh.jpg', 'image/jpeg', 83),
(6, '2019-004', '46756-67337159_383795542274136_4898722866117214208_n.jpg', 'image/jpeg', 473),
(7, '2019-115', '37881-balbuenapic.jpg', 'image/jpeg', 51),
(8, '2019-111', '52369-mercedpic.jpg', 'image/jpeg', 29),
(9, '2019-117', '70036-astorpic.jpg', 'image/jpeg', 63),
(13, '2019-006', '10456-mypic.jpg', 'image/jpeg', 23),
(11, '2019-112', '35454-emersonpic.jpg', 'image/jpeg', 39),
(12, '2019-114', '17622-morabepic.jpg', 'image/jpeg', 48),
(14, '2019-113', '3292-gabpic.jpg', 'image/jpeg', 28),
(15, '2019-158', '61846-alvin-garcia.jpg', 'image/jpeg', 494),
(16, '2019-152', '1723-arnel-musca.jpg', 'image/jpeg', 110),
(17, '2019-159', '32525-cezar-cayanan.jpg', 'image/jpeg', 200),
(18, '2019-157', '12847-josep-victorioso.jpg', 'image/jpeg', 78),
(19, '2019-132', '69646-manuel-bisnan.jpg', 'image/jpeg', 92),
(20, '2019-150', '82140-mark-dante.jpg', 'image/jpeg', 72),
(21, '2019-161', '6289-meynard-garcia.jpg', 'image/jpeg', 97),
(22, '2019-130', '4824-richard-fampolme.jpg', 'image/jpeg', 72),
(23, '2019-162', '31145-clyd-pogi.jpg', 'image/jpeg', 24),
(24, '2019-156', '20084-roaring.jpg', 'image/jpeg', 14),
(25, '2019-154', '2253-enzo.jpg', 'image/jpeg', 46),
(26, '2019-2', '67703-arnel.jpg', 'image/jpeg', 43),
(27, '2019-151', '54717-70227201_394044274630489_5531396124620881920_n.jpg', 'image/jpeg', 24),
(28, '2019-172', '79075-69580128_2880597531955575_7480652622295203840_n.jpg', 'image/jpeg', 17),
(29, '2019-176', '35311-69494286_1358320824334812_1694722394817560576_n.jpg', 'image/jpeg', 25);

-- --------------------------------------------------------

--
-- Table structure for table `rate_category`
--

CREATE TABLE `rate_category` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(11,2) NOT NULL DEFAULT 0.00,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `lu_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL,
  `deleted` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rate_category`
--

INSERT INTO `rate_category` (`id`, `category_name`, `description`, `rate`, `created_by`, `created_date`, `lu_by`, `lu_date`, `deleted`) VALUES
(1, 'Manila', 'Manila Rate', '512.00', 'admin', '0000-00-00 00:00:00', 'admin', '2019-01-18 10:12:09', 0),
(5, 'Province Rate', 'Province Rate', '415.00', 'admin', '0000-00-00 00:00:00', 'admin', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sanction_iplementation`
--

CREATE TABLE `sanction_iplementation` (
  `ind` bigint(20) NOT NULL,
  `memo_ind` bigint(20) NOT NULL,
  `company_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_number` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_date` date DEFAULT NULL,
  `actual_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_template`
--

CREATE TABLE `schedule_template` (
  `ind` bigint(20) NOT NULL,
  `template` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Regular Shift',
  `reg_in` time DEFAULT '08:00:00',
  `reg_out` time DEFAULT '17:00:00',
  `mon_in` time DEFAULT NULL,
  `mon_out` time DEFAULT NULL,
  `mon` int(2) NOT NULL DEFAULT 1,
  `tue_in` time DEFAULT NULL,
  `tue_out` time DEFAULT NULL,
  `tue` int(2) NOT NULL DEFAULT 1,
  `wed_in` time DEFAULT NULL,
  `wed_out` time DEFAULT NULL,
  `wed` int(11) NOT NULL DEFAULT 1,
  `thu_in` time DEFAULT NULL,
  `thu_out` time DEFAULT NULL,
  `thu` int(2) NOT NULL DEFAULT 1,
  `fri_in` time DEFAULT NULL,
  `fri_out` time DEFAULT NULL,
  `fri` int(2) NOT NULL DEFAULT 1,
  `sat_in` time DEFAULT NULL,
  `sat_out` time DEFAULT NULL,
  `sat` int(2) NOT NULL DEFAULT 0,
  `sun_in` time DEFAULT NULL,
  `sun_out` time DEFAULT NULL,
  `sun` int(2) NOT NULL DEFAULT 0,
  `flexihrs` decimal(8,2) NOT NULL DEFAULT 8.00,
  `lunch_out` time NOT NULL DEFAULT '12:00:00',
  `lunch_in` time NOT NULL DEFAULT '13:00:00',
  `lunch_hrs` decimal(8,2) NOT NULL DEFAULT 1.00,
  `schedule_desc` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` int(2) NOT NULL DEFAULT 0,
  `created_by` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedule_template`
--

INSERT INTO `schedule_template` (`ind`, `template`, `type`, `reg_in`, `reg_out`, `mon_in`, `mon_out`, `mon`, `tue_in`, `tue_out`, `tue`, `wed_in`, `wed_out`, `wed`, `thu_in`, `thu_out`, `thu`, `fri_in`, `fri_out`, `fri`, `sat_in`, `sat_out`, `sat`, `sun_in`, `sun_out`, `sun`, `flexihrs`, `lunch_out`, `lunch_in`, `lunch_hrs`, `schedule_desc`, `deleted`, `created_by`, `created_date`, `lu_by`, `lu_date`) VALUES
(1, 'Template trial 3', 'Irregular Shift', NULL, NULL, '08:00:00', '17:00:00', 1, '09:00:00', '18:00:00', 1, '07:00:00', '16:00:00', 1, '10:00:00', '19:00:00', 1, '11:00:00', '20:00:00', 1, '00:00:00', '00:00:00', 0, '00:00:00', '00:00:00', 0, '9.00', '12:00:00', '13:00:00', '1.00', 'my\'s', 0, 'admin', '2018-08-30 10:06:41', 'admin', '2018-09-07 14:44:04'),
(2, 'Trial Template 2', 'Regular Shift', '10:00:00', '16:00:00', NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 0, '8.00', '12:00:00', '13:00:00', '1.00', 'my\'s', 0, 'admin', '2018-08-30 10:29:08', 'admin', '2018-09-07 14:47:23'),
(3, 'Trial ', 'Regular Shift', '09:00:00', '19:00:00', NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 0, '8.00', '12:00:00', '14:00:00', '2.00', 'my\'s', 0, 'admin', '2018-08-30 18:06:01', 'admin', '2018-09-07 14:47:30'),
(4, 'Flexi Template', 'Flexi Shift', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, '8.00', '12:00:00', '13:00:00', '1.00', 'my\'s', 0, 'admin', '2018-09-05 14:27:54', 'admin', '2018-09-07 14:47:37'),
(5, 'Free Time Template', 'Free Shift', NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, '8.00', '12:00:00', '13:00:00', '1.00', 'my\'s', 0, 'admin', '2018-09-05 14:51:40', 'admin', '2018-09-07 14:47:43'),
(6, 'Regular Shift', 'Regular Shift', '08:00:00', '17:00:00', NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, '8.00', '12:00:00', '13:00:00', '1.00', '', 0, 'admin', '2019-06-07 09:21:53', 'admin', '2019-06-07 09:21:53'),
(7, 'Test Template', 'Regular Shift', '08:30:00', '18:30:00', NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, '8.00', '12:00:00', '13:00:00', '1.00', 'Regular Schedule', 0, 'admin', '2019-08-27 17:22:21', 'admin', '2019-08-28 17:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `siblings_information`
--

CREATE TABLE `siblings_information` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date DEFAULT NULL,
  `occupation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siblings_information`
--

INSERT INTO `siblings_information` (`ind`, `company_id`, `name`, `birthdate`, `occupation`) VALUES
(1, '2019-006', 'Moneth Paguinto', '1992-04-18', 'Housewife'),
(2, '2019-006', 'Marvin Paguinto', '1993-07-07', 'Leadman'),
(3, '2019-176', 'Maryven A. Tabiando', '1993-10-24', 'BDO'),
(4, '2019-162', 'Mark Anthony Pedrajas', '1985-05-03', 'Welder'),
(5, '2019-162', 'Aiza P. Poras', '1988-04-14', 'Cattering'),
(6, '2019-162', 'Joy An Pedrajas', '1992-01-07', 'Ticketing');

-- --------------------------------------------------------

--
-- Table structure for table `suspension`
--

CREATE TABLE `suspension` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_number` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_date` date DEFAULT NULL,
  `actual_date` date DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` date NOT NULL,
  `lu_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_status`
--

CREATE TABLE `tax_status` (
  `ind` int(11) NOT NULL,
  `status_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tax_status`
--

INSERT INTO `tax_status` (`ind`, `status_code`, `status_description`, `created_by`, `created_at`, `lu_by`, `updated_at`, `deleted`) VALUES
(1, 'Z', 'zero exemtion', 'marlon', '2018-06-18 13:51:44', 'marlon', '2018-06-18 13:51:44', 0),
(2, 'S', 'single', 'marlon', '2018-06-18 13:52:34', 'marlon', '2018-06-18 13:52:34', 0),
(3, 'ME', 'married', 'marlon', '2018-06-18 13:52:34', 'marlon', '2018-06-18 13:52:34', 0),
(4, 'S1', 'single with 1 qualified dependent child', 'marlon', '2018-06-18 13:53:53', 'marlon', '2018-06-18 13:53:53', 0),
(5, 'S2', 'single with 2 qualified dependent children', 'marlon', '2018-06-18 13:53:53', 'marlon', '2018-06-18 13:53:53', 0),
(6, 'S3', 'single with 3 qualified dependent children', 'marlon', '2018-06-18 13:54:33', 'marlon', '2018-06-18 13:54:33', 0),
(7, 'S4', 'single with 4 qualified dependent children', 'marlon', '2018-06-18 13:54:33', 'marlon', '2018-06-18 13:54:33', 0),
(8, 'ME1', 'married with 1 qualified dependent child', 'marlon', '2018-06-18 13:55:37', 'marlon', '2018-06-18 13:55:37', 0),
(9, 'ME2', 'married with 2 qualified dependent children', 'marlon', '2018-06-18 13:55:37', 'marlon', '2018-06-18 13:55:37', 0),
(10, 'ME3', 'married with 3 qualified dependent children', 'marlon', '2018-06-18 13:56:18', 'marlon', '2018-06-18 13:56:18', 0),
(11, 'ME4', 'married with 4 qualified dependent children', 'marlon', '2018-06-18 13:56:18', 'marlon', '2018-06-18 13:56:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `ind` bigint(20) NOT NULL,
  `department_ind` bigint(20) NOT NULL,
  `team_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `lu_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`ind`, `department_ind`, `team_name`, `active`, `created_by`, `created_date`, `lu_by`, `lu_date`) VALUES
(1, 11, 'PROJECT MANAGEMENT', 'yes', 'admin', '2019-06-06 05:24:39', 'admin', '2019-06-06 05:24:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `ind` bigint(20) NOT NULL,
  `company_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`ind`, `company_id`, `user_type_id`, `username`, `password`, `department`, `email`, `active`, `created_by`, `created_date`, `lu_by`, `lu_date`) VALUES
(10, '2017-439', 1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'People Management', 'mcbelarmino@circuit-solutions.net', 'yes', '', '2018-10-22 15:01:53', '', '2018-10-22 15:01:53'),
(11, '2019-0012', 1, 'SVSADMIN', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'yes', 'admin', '2019-06-14 04:01:28', 'admin', '2019-06-14 04:01:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_module`
--

CREATE TABLE `user_module` (
  `id` bigint(20) NOT NULL,
  `module_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Module',
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_module`
--

INSERT INTO `user_module` (`id`, `module_code`, `module_name`, `module_type`, `created_by`, `created_date`, `lu_by`, `lu_date`, `deleted`) VALUES
(1, 'employee', 'Employee Module', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(2, 'emp_upload_valid_info', 'Employee Upload/Validate Information', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(3, 'notice_explain', 'Notice to Explain', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(4, 'notice_decision', 'Notice of Decision', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(5, 'compensation', 'Compensation Details', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(6, 'schedule', 'Schedule Details', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(7, 'applicant', 'Applicant Details', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(8, 'assets', 'Assets Details', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(9, 'company', 'Company Details', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(10, 'department', 'Department Details', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(11, 'team', 'Team Details', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(12, 'payroll_group', 'Payroll Group Details', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(13, 'leaved', 'Leaved Settings', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(14, 'upload_employee', 'Upload Employee Details', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(15, 'create_user', 'Create User Module', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(16, 'user_type', 'Create/Manage User Type', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(17, 'employee_master', 'Employee Master Report', 'Report', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(18, 'assets_report', 'Assets Report', 'Report', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(19, 'rate_category', 'Rate Category Details', 'Module', 'admin', '2018-10-04 13:11:43', 'admin', '2018-10-04 13:11:43', 0),
(20, 'approver', 'Approver', 'Module', 'admin', '2019-06-13 02:35:05', 'admin', '2019-06-13 02:35:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_module_access`
--

CREATE TABLE `user_module_access` (
  `id` bigint(20) NOT NULL,
  `user_type_id` int(20) NOT NULL,
  `employee` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `emp_upload_valid_info` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `notice_explain` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `notice_decision` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `compensation` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `schedule` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `applicant` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `assets` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `company` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `department` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `team` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `payroll_group` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `leaved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `upload_employee` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `create_user` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `user_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `employee_master` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `assets_report` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `rate_category` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `approver` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_module_access`
--

INSERT INTO `user_module_access` (`id`, `user_type_id`, `employee`, `emp_upload_valid_info`, `notice_explain`, `notice_decision`, `compensation`, `schedule`, `applicant`, `assets`, `company`, `department`, `team`, `payroll_group`, `leaved`, `upload_employee`, `create_user`, `user_type`, `employee_master`, `assets_report`, `rate_category`, `approver`, `created_by`, `created_date`, `lu_by`, `lu_date`, `deleted`) VALUES
(2, 2, 'all', 'all', 'all', 'all', 'none', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'none', 'none', 'none', 'none', 'all', 'all', 'admin', '2018-10-05 18:34:10', 'admin', '2018-10-05 18:34:10', 0),
(3, 1, 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'admin', '2018-10-05 18:34:10', 'admin', '2018-10-05 18:34:10', 0),
(4, 3, 'all', 'all', 'all', 'all', 'none', 'all', 'all', 'none', 'all', 'all', 'all', 'none', 'none', 'all', 'none', 'none', 'none', 'none', 'none', 'all', 'admin', '2018-10-08 14:27:34', 'admin', '2018-10-08 14:27:34', 0),
(5, 4, 'all', 'all', 'none', 'none', 'none', 'all', 'all', 'none', 'none', 'all', 'all', 'none', 'none', 'all', 'none', 'none', 'none', 'none', 'none', 'all', 'admin', '2018-10-08 14:31:19', 'admin', '2018-10-08 14:31:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` bigint(20) NOT NULL,
  `type_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lu_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lu_date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `type_name`, `type_description`, `created_by`, `created_date`, `lu_by`, `lu_date`, `deleted`) VALUES
(1, 'Admin', 'Can Access All on the Database', 'admin', '2018-10-04 13:50:52', 'admin', '2018-10-04 13:50:52', 0),
(2, 'PMD', 'PMD', 'admin', '2018-10-05 18:34:10', 'admin', '2018-10-30 17:43:40', 0),
(3, 'People Management Department', 'PMD Users', 'admin', '2018-10-08 14:27:34', 'admin', '2018-10-30 17:44:26', 0),
(4, 'Trial', 'Trial to delete', 'admin', '2018-10-08 14:31:19', 'admin', '2018-10-08 14:31:34', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_approvers_info`
-- (See below for the actual view)
--
CREATE TABLE `view_approvers_info` (
`company_id` varchar(20)
,`empname` varchar(93)
,`company_name` varchar(100)
,`company_ind` bigint(20)
,`position` varchar(50)
,`department` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_bir_emp`
-- (See below for the actual view)
--
CREATE TABLE `view_bir_emp` (
`company_id` varchar(20)
,`lname` varchar(30)
,`fname` varchar(30)
,`mname` varchar(30)
,`fullname` varchar(93)
,`company_ind` bigint(20)
,`company_name` varchar(100)
,`department` varchar(50)
,`position` varchar(50)
,`birstatus` varchar(19)
,`address` varchar(501)
,`provaddress` varchar(501)
,`tin_number` varchar(20)
,`city_zip` varchar(4)
,`prov_zip` varchar(4)
,`bir_rdo_code` varchar(30)
,`zip_code` varchar(20)
,`company_bir_address` varchar(1000)
,`company_tin_no` varchar(30)
,`authorize_sign_bir` varchar(200)
,`birtdate` date
,`contact_no` varchar(20)
,`civilstat` varchar(10)
,`resigned_date` date
,`active` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_employee_leave`
-- (See below for the actual view)
--
CREATE TABLE `view_employee_leave` (
`id` bigint(20)
,`emp_no` bigint(20)
,`company_id` varchar(20)
,`fullname` varchar(62)
,`company_name` varchar(100)
,`department` varchar(50)
,`leave_name` varchar(100)
,`days_leave` int(3)
,`leave_count` decimal(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_employee_schedule`
-- (See below for the actual view)
--
CREATE TABLE `view_employee_schedule` (
`id` bigint(20)
,`template_id` bigint(20)
,`name` varchar(62)
,`company_id` varchar(20)
,`template` varchar(200)
,`type` varchar(200)
,`reg_in` time
,`reg_out` time
,`mon_in` time
,`mon_out` time
,`mon` int(2)
,`tue_in` time
,`tue_out` time
,`tue` int(2)
,`wed_in` time
,`wed_out` time
,`wed` int(11)
,`thu_in` time
,`thu_out` time
,`thu` int(2)
,`fri_in` time
,`fri_out` time
,`fri` int(2)
,`sat_in` time
,`sat_out` time
,`sat` int(2)
,`sun_in` time
,`sun_out` time
,`sun` int(2)
,`flexihrs` decimal(8,2)
,`lunch_out` time
,`lunch_in` time
,`lunch_hrs` decimal(8,2)
,`lu_by` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_employee_schedule_request`
-- (See below for the actual view)
--
CREATE TABLE `view_employee_schedule_request` (
`id` bigint(20)
,`template_id` bigint(20)
,`name` varchar(62)
,`company_id` varchar(20)
,`template` varchar(200)
,`type` varchar(200)
,`reg_in` time
,`reg_out` time
,`mon_in` time
,`mon_out` time
,`mon` int(2)
,`tue_in` time
,`tue_out` time
,`tue` int(2)
,`wed_in` time
,`wed_out` time
,`wed` int(11)
,`thu_in` time
,`thu_out` time
,`thu` int(2)
,`fri_in` time
,`fri_out` time
,`fri` int(2)
,`sat_in` time
,`sat_out` time
,`sat` int(2)
,`sun_in` time
,`sun_out` time
,`sun` int(2)
,`flexihrs` decimal(8,2)
,`lunch_out` time
,`lunch_in` time
,`lunch_hrs` decimal(8,2)
,`start_date` date
,`end_date` date
,`status` varchar(15)
,`lu_by` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_payrollgroup_emp`
-- (See below for the actual view)
--
CREATE TABLE `view_payrollgroup_emp` (
`empname` varchar(93)
,`company_id` varchar(20)
,`company_ind` bigint(20)
,`company_name` varchar(100)
,`payroll_group_ind` bigint(20)
,`group_name` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_schedule_emp`
-- (See below for the actual view)
--
CREATE TABLE `view_schedule_emp` (
`emp_no` bigint(20)
,`empname` varchar(93)
,`company_id` varchar(20)
,`company_ind` bigint(20)
,`company_name` varchar(100)
,`template_id` bigint(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user_list`
-- (See below for the actual view)
--
CREATE TABLE `view_user_list` (
`id` bigint(20)
,`empname` varchar(93)
,`user_type_id` int(11)
,`company_id` varchar(20)
,`type_name` varchar(200)
,`username` varchar(20)
,`password` varchar(1000)
);

-- --------------------------------------------------------

--
-- Structure for view `view_approvers_info`
--
DROP TABLE IF EXISTS `view_approvers_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_approvers_info`  AS  select `a`.`company_id` AS `company_id`,concat(`a`.`lname`,', ',`a`.`fname`,' ',`a`.`mname`) AS `empname`,`c`.`company_name` AS `company_name`,`b`.`company_ind` AS `company_ind`,`b`.`position` AS `position`,`b`.`department` AS `department` from ((`personal_information` `a` left join `employee_information` `b` on(`a`.`company_id` = `b`.`company_id`)) left join `company` `c` on(`b`.`company_ind` = `c`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_bir_emp`
--
DROP TABLE IF EXISTS `view_bir_emp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_bir_emp`  AS  select `a`.`company_id` AS `company_id`,replace(ucase(`a`.`lname`),'Ã‘','Ñ') AS `lname`,replace(ucase(`a`.`fname`),'Ã‘','Ñ') AS `fname`,replace(ucase(`a`.`mname`),'Ã±','Ñ') AS `mname`,replace(ucase(concat(`a`.`lname`,', ',`a`.`fname`,' ',`a`.`mname`)),'Ã±','Ñ') AS `fullname`,`b`.`company_ind` AS `company_ind`,`c`.`company_name` AS `company_name`,`b`.`department` AS `department`,`b`.`position` AS `position`,case when (select `emp`.`active` from `personal_information` `emp` where `emp`.`company_id` = `a`.`company_id`) = 'no' then 'Resigned' when (select `pg`.`minimum_wage` from (`employee_payroll_group` `epg` left join `payroll_settings` `pg` on(`pg`.`group_ind` = `epg`.`payroll_group_ind`)) where `epg`.`deleted` = '0' and `epg`.`company_id` = `a`.`company_id`) = 'yes' then 'Minimum Wage Earner' when (select `pg`.`with_withholdingtax` from (`employee_payroll_group` `epg` left join `payroll_settings` `pg` on(`pg`.`group_ind` = `epg`.`payroll_group_ind`)) where `epg`.`deleted` = '0' and `epg`.`company_id` = `a`.`company_id`) = 'yes' then 'Taxable' when (select `pg`.`with_withholdingtax` from (`employee_payroll_group` `epg` left join `payroll_settings` `pg` on(`pg`.`group_ind` = `epg`.`payroll_group_ind`)) where `epg`.`deleted` = '0' and `epg`.`company_id` = `a`.`company_id`) = 'no' then 'Non Taxable' else 'Check Settings' end AS `birstatus`,concat(`a`.`city_add`,' ',`a`.`city_city`) AS `address`,concat(`a`.`prov_add`,' ',`a`.`prov_city`) AS `provaddress`,`d`.`tin_number` AS `tin_number`,`a`.`city_zip` AS `city_zip`,`a`.`prov_zip` AS `prov_zip`,`c`.`bir_rdo_code` AS `bir_rdo_code`,`c`.`zip_code` AS `zip_code`,`c`.`company_bir_address` AS `company_bir_address`,`c`.`company_tin_no` AS `company_tin_no`,ucase(`c`.`authorize_sign_bir`) AS `authorize_sign_bir`,`a`.`birtdate` AS `birtdate`,`a`.`contact_no` AS `contact_no`,`a`.`status` AS `civilstat`,`a`.`resigned_date` AS `resigned_date`,`a`.`active` AS `active` from (((`personal_information` `a` left join `employee_information` `b` on(`a`.`company_id` = `b`.`company_id`)) left join `company` `c` on(`b`.`company_ind` = `c`.`id`)) left join `goverment_number` `d` on(`a`.`company_id` = `d`.`company_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_employee_leave`
--
DROP TABLE IF EXISTS `view_employee_leave`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_employee_leave`  AS  select `c`.`id` AS `id`,`b`.`emp_no` AS `emp_no`,`b`.`company_id` AS `company_id`,concat(`b`.`lname`,', ',`b`.`fname`) AS `fullname`,`e`.`company_name` AS `company_name`,`d`.`department` AS `department`,`c`.`leave_name` AS `leave_name`,`c`.`days_leave` AS `days_leave`,`a`.`leave_count` AS `leave_count` from ((((`employee_leave` `a` left join `personal_information` `b` on(`a`.`company_id` = `b`.`company_id`)) left join `leave_template` `c` on(`a`.`leave_id` = `c`.`id`)) left join `employee_information` `d` on(`a`.`company_id` = `d`.`company_id`)) left join `company` `e` on(`d`.`company_ind` = `e`.`id`)) where `a`.`deleted` = 0 ;

-- --------------------------------------------------------

--
-- Structure for view `view_employee_schedule`
--
DROP TABLE IF EXISTS `view_employee_schedule`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_employee_schedule`  AS  select `b`.`id` AS `id`,`b`.`template_id` AS `template_id`,concat(`a`.`lname`,', ',`a`.`fname`) AS `name`,`a`.`company_id` AS `company_id`,`c`.`template` AS `template`,`c`.`type` AS `type`,`c`.`reg_in` AS `reg_in`,`c`.`reg_out` AS `reg_out`,`c`.`mon_in` AS `mon_in`,`c`.`mon_out` AS `mon_out`,`c`.`mon` AS `mon`,`c`.`tue_in` AS `tue_in`,`c`.`tue_out` AS `tue_out`,`c`.`tue` AS `tue`,`c`.`wed_in` AS `wed_in`,`c`.`wed_out` AS `wed_out`,`c`.`wed` AS `wed`,`c`.`thu_in` AS `thu_in`,`c`.`thu_out` AS `thu_out`,`c`.`thu` AS `thu`,`c`.`fri_in` AS `fri_in`,`c`.`fri_out` AS `fri_out`,`c`.`fri` AS `fri`,`c`.`sat_in` AS `sat_in`,`c`.`sat_out` AS `sat_out`,`c`.`sat` AS `sat`,`c`.`sun_in` AS `sun_in`,`c`.`sun_out` AS `sun_out`,`c`.`sun` AS `sun`,`c`.`flexihrs` AS `flexihrs`,`c`.`lunch_out` AS `lunch_out`,`c`.`lunch_in` AS `lunch_in`,`c`.`lunch_hrs` AS `lunch_hrs`,`b`.`lu_by` AS `lu_by` from ((`personal_information` `a` join `employee_schedule` `b` on(`a`.`company_id` = `b`.`company_id`)) join `schedule_template` `c` on(`b`.`template_id` = `c`.`ind`)) where `a`.`active` = 'Yes' and `b`.`deleted` = 0 ;

-- --------------------------------------------------------

--
-- Structure for view `view_employee_schedule_request`
--
DROP TABLE IF EXISTS `view_employee_schedule_request`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_employee_schedule_request`  AS  select `b`.`id` AS `id`,`b`.`template_id` AS `template_id`,concat(`a`.`lname`,', ',`a`.`fname`) AS `name`,`a`.`company_id` AS `company_id`,`c`.`template` AS `template`,`c`.`type` AS `type`,`c`.`reg_in` AS `reg_in`,`c`.`reg_out` AS `reg_out`,`c`.`mon_in` AS `mon_in`,`c`.`mon_out` AS `mon_out`,`c`.`mon` AS `mon`,`c`.`tue_in` AS `tue_in`,`c`.`tue_out` AS `tue_out`,`c`.`tue` AS `tue`,`c`.`wed_in` AS `wed_in`,`c`.`wed_out` AS `wed_out`,`c`.`wed` AS `wed`,`c`.`thu_in` AS `thu_in`,`c`.`thu_out` AS `thu_out`,`c`.`thu` AS `thu`,`c`.`fri_in` AS `fri_in`,`c`.`fri_out` AS `fri_out`,`c`.`fri` AS `fri`,`c`.`sat_in` AS `sat_in`,`c`.`sat_out` AS `sat_out`,`c`.`sat` AS `sat`,`c`.`sun_in` AS `sun_in`,`c`.`sun_out` AS `sun_out`,`c`.`sun` AS `sun`,`c`.`flexihrs` AS `flexihrs`,`c`.`lunch_out` AS `lunch_out`,`c`.`lunch_in` AS `lunch_in`,`c`.`lunch_hrs` AS `lunch_hrs`,`b`.`start_date` AS `start_date`,`b`.`end_date` AS `end_date`,`b`.`status` AS `status`,`b`.`lu_by` AS `lu_by` from ((`personal_information` `a` join `employee_schedule_request` `b` on(`a`.`company_id` = `b`.`company_id`)) join `schedule_template` `c` on(`b`.`template_id` = `c`.`ind`)) where `a`.`active` = 'Yes' and `b`.`deleted` = 0 ;

-- --------------------------------------------------------

--
-- Structure for view `view_payrollgroup_emp`
--
DROP TABLE IF EXISTS `view_payrollgroup_emp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_payrollgroup_emp`  AS  select ucase(concat(`a`.`lname`,', ',`a`.`fname`,' ',`a`.`mname`)) AS `empname`,`a`.`company_id` AS `company_id`,`b`.`company_ind` AS `company_ind`,`c`.`company_name` AS `company_name`,`d`.`payroll_group_ind` AS `payroll_group_ind`,`e`.`group_name` AS `group_name` from ((((`personal_information` `a` left join `employee_information` `b` on(`a`.`company_id` = `b`.`company_id`)) join `company` `c` on(`b`.`company_ind` = `c`.`id`)) left join `employee_payroll_group` `d` on(`a`.`company_id` = `d`.`company_id`)) join `payroll_group` `e` on(`d`.`payroll_group_ind` = `e`.`ind`)) where `a`.`active` = 'yes' and `d`.`deleted` = 0 ;

-- --------------------------------------------------------

--
-- Structure for view `view_schedule_emp`
--
DROP TABLE IF EXISTS `view_schedule_emp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_schedule_emp`  AS  select `a`.`emp_no` AS `emp_no`,ucase(concat(`a`.`lname`,', ',`a`.`fname`,' ',`a`.`mname`)) AS `empname`,`a`.`company_id` AS `company_id`,`b`.`company_ind` AS `company_ind`,`c`.`company_name` AS `company_name`,`d`.`template_id` AS `template_id` from (((`personal_information` `a` left join `employee_information` `b` on(`a`.`company_id` = `b`.`company_id`)) join `company` `c` on(`b`.`company_ind` = `c`.`id`)) left join `employee_schedule` `d` on(`a`.`company_id` = `d`.`company_id`)) where `a`.`active` = 'yes' and `d`.`deleted` = 0 ;

-- --------------------------------------------------------

--
-- Structure for view `view_user_list`
--
DROP TABLE IF EXISTS `view_user_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_list`  AS  select `a`.`ind` AS `id`,concat(`b`.`lname`,', ',`b`.`fname`,' ',`b`.`mname`) AS `empname`,`a`.`user_type_id` AS `user_type_id`,`a`.`company_id` AS `company_id`,`c`.`type_name` AS `type_name`,`a`.`username` AS `username`,`a`.`password` AS `password` from ((`user_account` `a` join `personal_information` `b` on(`a`.`company_id` = `b`.`company_id`)) join `user_type` `c` on(`a`.`user_type_id` = `c`.`id`)) where `b`.`active` = 'yes' and `a`.`active` = 'yes' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applicant_achievement`
--
ALTER TABLE `applicant_achievement`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `applicant_emergency`
--
ALTER TABLE `applicant_emergency`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `applicant_employement`
--
ALTER TABLE `applicant_employement`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `applicant_information`
--
ALTER TABLE `applicant_information`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `applicant_licence`
--
ALTER TABLE `applicant_licence`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `applicant_training`
--
ALTER TABLE `applicant_training`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `approvers_group`
--
ALTER TABLE `approvers_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `approvers_table`
--
ALTER TABLE `approvers_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`ind`),
  ADD UNIQUE KEY `asset_tagno` (`asset_tagno`);

--
-- Indexes for table `assets_old`
--
ALTER TABLE `assets_old`
  ADD PRIMARY KEY (`ind`),
  ADD UNIQUE KEY `asset_tagno` (`asset_tagno`);

--
-- Indexes for table `assets_upload`
--
ALTER TABLE `assets_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates_trainings`
--
ALTER TABLE `certificates_trainings`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `childrens_information`
--
ALTER TABLE `childrens_information`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `education_background`
--
ALTER TABLE `education_background`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `employee_achievement`
--
ALTER TABLE `employee_achievement`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `employee_compensation`
--
ALTER TABLE `employee_compensation`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `employee_information`
--
ALTER TABLE `employee_information`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `employee_leave`
--
ALTER TABLE `employee_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_payroll_group`
--
ALTER TABLE `employee_payroll_group`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `employee_schedule`
--
ALTER TABLE `employee_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_schedule_request`
--
ALTER TABLE `employee_schedule_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_schedule_request_old`
--
ALTER TABLE `employee_schedule_request_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employment_history`
--
ALTER TABLE `employment_history`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `family_background`
--
ALTER TABLE `family_background`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `goverment_number`
--
ALTER TABLE `goverment_number`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `goverment_upload`
--
ALTER TABLE `goverment_upload`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `group_schedule`
--
ALTER TABLE `group_schedule`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `leave_template`
--
ALTER TABLE `leave_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licence_information`
--
ALTER TABLE `licence_information`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `medical_allergies`
--
ALTER TABLE `medical_allergies`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `medical_illness`
--
ALTER TABLE `medical_illness`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_upload`
--
ALTER TABLE `medical_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `memo_upload`
--
ALTER TABLE `memo_upload`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `notice_decision`
--
ALTER TABLE `notice_decision`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `notice_explain`
--
ALTER TABLE `notice_explain`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `payroll_group`
--
ALTER TABLE `payroll_group`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `payroll_settings`
--
ALTER TABLE `payroll_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_information`
--
ALTER TABLE `personal_information`
  ADD PRIMARY KEY (`emp_no`);

--
-- Indexes for table `profile_picture`
--
ALTER TABLE `profile_picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_category`
--
ALTER TABLE `rate_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanction_iplementation`
--
ALTER TABLE `sanction_iplementation`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `schedule_template`
--
ALTER TABLE `schedule_template`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `siblings_information`
--
ALTER TABLE `siblings_information`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `suspension`
--
ALTER TABLE `suspension`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `tax_status`
--
ALTER TABLE `tax_status`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`ind`);

--
-- Indexes for table `user_module`
--
ALTER TABLE `user_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_module_access`
--
ALTER TABLE `user_module_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applicant_achievement`
--
ALTER TABLE `applicant_achievement`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applicant_emergency`
--
ALTER TABLE `applicant_emergency`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applicant_employement`
--
ALTER TABLE `applicant_employement`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applicant_information`
--
ALTER TABLE `applicant_information`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applicant_licence`
--
ALTER TABLE `applicant_licence`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applicant_training`
--
ALTER TABLE `applicant_training`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `approvers_group`
--
ALTER TABLE `approvers_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `approvers_table`
--
ALTER TABLE `approvers_table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `assets_old`
--
ALTER TABLE `assets_old`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets_upload`
--
ALTER TABLE `assets_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `certificates_trainings`
--
ALTER TABLE `certificates_trainings`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `childrens_information`
--
ALTER TABLE `childrens_information`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `employee_achievement`
--
ALTER TABLE `employee_achievement`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_compensation`
--
ALTER TABLE `employee_compensation`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `employee_leave`
--
ALTER TABLE `employee_leave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_payroll_group`
--
ALTER TABLE `employee_payroll_group`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `employee_schedule`
--
ALTER TABLE `employee_schedule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `employee_schedule_request`
--
ALTER TABLE `employee_schedule_request`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_schedule_request_old`
--
ALTER TABLE `employee_schedule_request_old`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employment_history`
--
ALTER TABLE `employment_history`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goverment_upload`
--
ALTER TABLE `goverment_upload`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_schedule`
--
ALTER TABLE `group_schedule`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_template`
--
ALTER TABLE `leave_template`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `licence_information`
--
ALTER TABLE `licence_information`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `medical_allergies`
--
ALTER TABLE `medical_allergies`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medical_illness`
--
ALTER TABLE `medical_illness`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `medical_upload`
--
ALTER TABLE `medical_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `memo_upload`
--
ALTER TABLE `memo_upload`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice_decision`
--
ALTER TABLE `notice_decision`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notice_explain`
--
ALTER TABLE `notice_explain`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payroll_group`
--
ALTER TABLE `payroll_group`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payroll_settings`
--
ALTER TABLE `payroll_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_information`
--
ALTER TABLE `personal_information`
  MODIFY `emp_no` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `profile_picture`
--
ALTER TABLE `profile_picture`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `rate_category`
--
ALTER TABLE `rate_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sanction_iplementation`
--
ALTER TABLE `sanction_iplementation`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule_template`
--
ALTER TABLE `schedule_template`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `siblings_information`
--
ALTER TABLE `siblings_information`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `suspension`
--
ALTER TABLE `suspension`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_status`
--
ALTER TABLE `tax_status`
  MODIFY `ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `ind` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_module`
--
ALTER TABLE `user_module`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_module_access`
--
ALTER TABLE `user_module_access`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
