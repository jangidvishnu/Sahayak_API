-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2021 at 09:40 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sahayak`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admin_log`
--

CREATE TABLE `admin_log` (
  `id` int(11) NOT NULL,
  `token` text NOT NULL,
  `admin_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_log`
--

INSERT INTO `admin_log` (`id`, `token`, `admin_id`, `time`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE2MDc0NDkwMjh9.hyoxnhOu4I8QR2OblzsNa_AsIb9LOkektZI2UTXCp7k', 1, '2020-12-08 17:37:08'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE2MDc0NDkxNDZ9.eZAVH_O_IsE7x8keQtQPHWbgEmCAfue4rBFBq4M8QRM', 1, '2020-12-08 17:39:06'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE2MDc0NDkyMjN9.iM3vr0es5zR1U3bYWcIDhdgYaTpcyFWrr5tgsM8STbg', 1, '2020-12-08 17:40:23'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE2MDc0NDk0Mzl9.R1eq7EWT2-WTcaTVa7zNzTPY1rn7gF-2OxzqcHIeKzw', 1, '2020-12-08 17:43:59'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE2MDc0NTE4Njh9.ICCieltitrvq6M8_zu0oW26UgXRrnUs6_alPtCGDzQ4', 1, '2020-12-08 18:24:28'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE2MDc0NTUwNjJ9.z659BxoHVtewClIxda8sXGHNYNH6A0kmvPG1jKSd_CY', 1, '2020-12-08 19:17:42'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE2MDc1MzA1Mjl9.h6QKmyDZZgJuydxH1n7CO6on_SJ5x3O6Btw9lMUsx2g', 1, '2020-12-09 16:15:29'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE2MDc1MzA2MjN9.7IO3k95y4RqBFDyLXGUUN3_67Z2AcOepUdcd4btpRNU', 1, '2020-12-09 16:17:03'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE2MDc2NjY1MTZ9.kwHMMiCltz0hFOPYguthKrnKOKNw0PszpfAJvP-6Dyk', 1, '2020-12-11 06:01:56'),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE2MDc2Njc5NzB9.IVVx0K0WqOoKqYaVHVd7tyA4xfzXocegu7YGmIyMmtk', 1, '2020-12-11 06:26:10'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE2MTUxNDI4NTB9.SeXF9sP6yoGC6eAe9ac1m6W5TiuhRtnkAGy7n35CwJE', 1, '2021-03-07 18:47:30');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `to_mail` varchar(50) NOT NULL,
  `subj` varchar(100) NOT NULL,
  `htmlBody` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `family_head` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `aadhar_number` varchar(12) NOT NULL,
  `dob` date NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `family_head`, `first_name`, `middle_name`, `last_name`, `aadhar_number`, `dob`, `mobile`, `email`, `time`, `update_time`) VALUES
(1, 2, 'BHIKKY', '', 'J', '2147483647', '2020-06-09', '+917014018814', 'aa@gmail.com', '2020-12-07 08:26:50', '2020-12-11 06:26:38');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sent_to` varchar(50) NOT NULL,
  `through` varchar(10) NOT NULL,
  `otp` text NOT NULL,
  `otp_status` int(11) NOT NULL,
  `msg` text NOT NULL,
  `action_type` varchar(30) NOT NULL,
  `tx_id` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `user_id`, `sent_to`, `through`, `otp`, `otp_status`, `msg`, `action_type`, `tx_id`, `time`) VALUES
(39, 2, '+917014018814', 'sms', 'cb46cf928f8527e2c433c2ce8b0a4a400fad8e136904a54aa2d7bc4d891ed4b1', 0, 'OTP For login to Sahayak', 'Login_OTP', '', '2021-03-07 18:48:29');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `members` text NOT NULL,
  `members_field` text NOT NULL,
  `members_files` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `members`, `members_field`, `members_files`, `time`, `update_time`, `status`) VALUES
(7, '1', 'email', '1607457503247fig 3.png', '2020-12-08 19:58:23', '2020-12-08 19:58:44', 'done'),
(8, '1', 'first_name', '1607530612201Why-AngularJS-A1.jpg', '2020-12-09 16:16:52', '2020-12-11 06:26:38', 'done'),
(9, '1', 'dob', '1607667956423fig 3.png', '2020-12-11 06:25:56', '2020-12-11 06:25:56', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `schemes`
--

CREATE TABLE `schemes` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schemes`
--

INSERT INTO `schemes` (`id`, `name`, `link`, `description`, `time`) VALUES
(1, 'Pradhan Mantri Garib Kalyan Yojana', 'https://en.wikipedia.org/wiki/Pradhan_Mantri_Garib_Kalyan_Yojana', 'Pradhan Mantri Garib Kalyan Yojana, 2016 (PMGKY) (English, Prime Minister\'s Poor welfare scheme) is a scheme launched by the Narendra Modi led Government of India in December 2016 on the lines of the Income declaration scheme, 2016 (IDS) launched earlier in the year.A part of the Taxation Laws (Second Amendment) Act, 2016, the scheme provides an opportunity to declare unaccounted wealth and black money ....', '2020-12-07 08:01:06');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id` int(11) NOT NULL,
  `to_mobile` varchar(20) NOT NULL,
  `body` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `subj` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sms`
--

INSERT INTO `sms` (`id`, `to_mobile`, `body`, `status`, `subj`, `time`) VALUES
(3, '+917014018814', 'Hii vishnu\n.This message is send to you regarding that its you which is doing this activity\nOTP For login to Sahayak2729', 'send successfully', 'OTP For login to Sahayak', '2020-10-14 08:21:18'),
(4, '+917014018814', 'Hii vishnu,This email is sent you for the perpose to notify you that an OTP is verifyed\nOTP For login to Sahayak\n Please contect us if not you.\nRegards,Sahayak Team \nSahayak Admin', 'send successfully', 'OTP For login to Sahayak', '2020-10-14 08:22:16'),
(5, '+917014018814', 'Hii vishnu\n\nOTP For login to Sahayak\n1031', 'send successfully', 'OTP For login to Sahayak', '2020-10-14 08:25:25'),
(6, '+917014018814', 'Hii vishnu,This sms is sent you for the perpose to notify you that an OTP is verifyed\n\n Please contect us if not you.\nRegards,Sahayak Team \nSahayak Admin', 'send successfully', '', '2020-10-14 08:25:50'),
(7, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n5579', 'send successfully', 'OTP For login to Sahayak', '2020-10-14 08:29:00'),
(8, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n3884', 'send successfully', 'OTP For login to Sahayak', '2020-10-14 08:29:37'),
(9, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-10-14 08:29:50'),
(10, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n5721', 'send successfully', 'OTP For login to Sahayak', '2020-10-14 09:50:36'),
(11, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-10-14 09:51:00'),
(12, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n3531', 'send successfully', 'OTP For login to Sahayak', '2020-10-14 09:52:24'),
(13, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-10-14 09:52:35'),
(14, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n8257', 'send successfully', 'OTP For login to Sahayak', '2020-10-14 16:28:38'),
(15, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n8891', 'send successfully', 'OTP For login to Sahayak', '2020-10-14 16:29:57'),
(16, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n2643', 'send successfully', 'OTP For login to Sahayak', '2020-10-14 16:33:55'),
(17, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n8369', 'send successfully', 'OTP For login to Sahayak', '2020-10-14 16:34:22'),
(18, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n2077', 'send successfully', 'OTP For login to Sahayak', '2020-10-14 16:34:46'),
(19, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-10-14 16:35:24'),
(20, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n6586', 'send successfully', 'OTP For login to Sahayak', '2020-10-14 17:14:18'),
(21, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-10-14 17:15:14'),
(22, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n1551', 'send successfully', 'OTP For login to Sahayak', '2020-10-16 04:54:48'),
(23, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-10-16 04:55:01'),
(24, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n8627', 'send successfully', 'OTP For login to Sahayak', '2020-10-16 05:00:15'),
(25, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-10-16 05:00:27'),
(26, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n6240', 'send successfully', 'OTP For login to Sahayak', '2020-12-07 07:33:17'),
(27, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-07 07:34:00'),
(28, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n1584', 'send successfully', 'OTP For login to Sahayak', '2020-12-07 07:47:52'),
(29, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-07 07:48:09'),
(30, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n4027', 'send successfully', 'OTP For login to Sahayak', '2020-12-07 08:53:54'),
(31, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-07 08:54:07'),
(32, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n8892', 'send successfully', 'OTP For login to Sahayak', '2020-12-07 09:00:37'),
(33, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-07 09:00:50'),
(34, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n9017', 'send successfully', 'OTP For login to Sahayak', '2020-12-07 11:20:30'),
(35, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-07 11:20:49'),
(36, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n4660', 'send successfully', 'OTP For login to Sahayak', '2020-12-07 11:25:21'),
(37, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-07 11:25:36'),
(38, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n8440', 'send successfully', 'OTP For login to Sahayak', '2020-12-07 11:25:50'),
(39, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-07 11:26:03'),
(40, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n1599', 'send successfully', 'OTP For login to Sahayak', '2020-12-08 04:44:20'),
(41, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-08 04:44:33'),
(42, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n6316', 'send successfully', 'OTP For login to Sahayak', '2020-12-08 04:44:46'),
(43, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-08 04:45:00'),
(44, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n1095', 'send successfully', 'OTP For login to Sahayak', '2020-12-08 18:13:45'),
(45, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-08 18:13:59'),
(46, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n5991', 'send successfully', 'OTP For login to Sahayak', '2020-12-08 19:17:02'),
(47, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-08 19:17:16'),
(48, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n7796', 'send successfully', 'OTP For login to Sahayak', '2020-12-08 19:18:51'),
(49, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-08 19:19:04'),
(50, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n5506', 'send successfully', 'OTP For login to Sahayak', '2020-12-09 16:14:37'),
(51, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-09 16:14:56'),
(52, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n5996', 'send successfully', 'OTP For login to Sahayak', '2020-12-09 16:15:47'),
(53, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-09 16:15:56'),
(54, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n5103', 'send successfully', 'OTP For login to Sahayak', '2020-12-11 05:56:30'),
(55, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-11 05:57:51'),
(56, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n2990', 'send successfully', 'OTP For login to Sahayak', '2020-12-11 06:24:51'),
(57, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-11 06:25:13'),
(58, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n5112', 'send successfully', 'OTP For login to Sahayak', '2020-12-11 06:26:57'),
(59, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2020-12-11 06:27:13'),
(60, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n2131', 'send successfully', 'OTP For login to Sahayak', '2021-03-07 18:47:40'),
(61, '+917014018814', '\n\nHii vishnu,\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n\nPlease contect us if not you.\nRegards,\nSahayak Team \nSahayak Admin', 'send successfully', '', '2021-03-07 18:48:02'),
(62, '+917014018814', '\n\nHi vishnu,\n\nOTP For login to Sahayak\n2313', 'send successfully', 'OTP For login to Sahayak', '2021-03-07 18:48:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `aadhar_number` bigint(12) NOT NULL,
  `dob` date NOT NULL,
  `can_edit_details` tinyint(1) NOT NULL DEFAULT 0,
  `edit_detail_private_key` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zipcode` int(8) NOT NULL,
  `join_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `aadhar_number`, `dob`, `can_edit_details`, `edit_detail_private_key`, `email`, `mobile`, `address`, `city`, `state`, `zipcode`, `join_time`, `update_time`) VALUES
(2, 'vishnu', 'jangid', 123456789123, '2000-11-05', 1, 'qbjbxa', 'vis18814@gmail.com', '+917014018814', 'Malviya NAgar', 'Jaipur', 'Rajasthan', 302011, '2020-10-14 08:18:34', '2020-12-07 08:27:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` text NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `sys_info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`id`, `user_id`, `token`, `login_time`, `sys_info`) VALUES
(6, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJhYWRoYXJfbnVtYmVyIjoxMjM0NTY3ODkxMjMsImlhdCI6MTYwMjY2OTA2MH0.WutvPNJzmIJ_1sFhUwDbHS7_HG8srF01tFAlbphqi0I', '2020-10-14 09:51:00', ''),
(7, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJhYWRoYXJfbnVtYmVyIjoxMjM0NTY3ODkxMjMsInByaXZhdGVfa2V5IjoicWJqYnhhIiwiaWF0IjoxNjAyNjY5MTU1fQ.L4rNWOyaaisFE0sV6O6al5cGGN534dqllIro3npuSGM', '2020-10-14 09:52:35', ''),
(8, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJhYWRoYXJfbnVtYmVyIjoxMjM0NTY3ODkxMjMsImlhdCI6MTYwMjY5MzMyNH0.d0Cumi2zgiD4ndzWu72yXvDuu_7DFAXM77lrmt_AV-k', '2020-10-14 16:35:24', ''),
(9, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJhYWRoYXJfbnVtYmVyIjoxMjM0NTY3ODkxMjMsImlhdCI6MTYwMjY5NTcxNH0.vjt-OKxsBodHaGoQNqqns6EgYw-PeIIgoj_KRiMtUcU', '2020-10-14 17:15:14', ''),
(10, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJhYWRoYXJfbnVtYmVyIjoxMjM0NTY3ODkxMjMsImlhdCI6MTYwMjgyNDEwMX0.vk94Vio4eo3SJhbY4JDe0T5NqwEb-VuRxwr332TiPkY', '2020-10-16 04:55:01', ''),
(11, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJhYWRoYXJfbnVtYmVyIjoxMjM0NTY3ODkxMjMsImlhdCI6MTYwMjgyNDQyOH0.joXXhBGzqOcShD3xrEsFvOXBz5Gvp4BNoUjliFBCrL4', '2020-10-16 05:00:28', ''),
(12, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJhYWRoYXJfbnVtYmVyIjoxMjM0NTY3ODkxMjMsImlhdCI6MTYwNzMyNjQ0MH0.XvDgId2A-KLqQUo4JgOUpbsQl0O_aJErbZkx8QCLD6Q', '2020-12-07 07:34:00', ''),
(23, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJhYWRoYXJfbnVtYmVyIjoxMjM0NTY3ODkxMjMsInByaXZhdGVfa2V5IjoicWJqYnhhIiwiaWF0IjoxNjA3NDU1MTQ0fQ.qvWCtdPMd9-9RXRSEoYqouxst50AjRzCV_hW1vU9oVs', '2020-12-08 19:19:04', ''),
(28, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJhYWRoYXJfbnVtYmVyIjoxMjM0NTY3ODkxMjMsImlhdCI6MTYwNzY2ODAzM30.t9vvUGgTqFyowQjQMF_j0yB808VDyvZCShAqcEtSm0s', '2020-12-11 06:27:13', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_log`
--
ALTER TABLE `admin_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `family_head` (`family_head`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schemes`
--
ALTER TABLE `schemes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_log`
--
ALTER TABLE `admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `schemes`
--
ALTER TABLE `schemes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`family_head`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
