-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2021 at 10:36 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trip_api`
--
CREATE DATABASE IF NOT EXISTS `trip_api` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `trip_api`;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(34, '2014_10_12_000000_create_users_table', 1),
(35, '2014_10_12_100000_create_password_resets_table', 1),
(36, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(37, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(38, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(39, '2016_06_01_000004_create_oauth_clients_table', 1),
(40, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(41, '2019_08_19_000000_create_failed_jobs_table', 1),
(42, '2021_10_21_063358_create_trips_table', 1),
(43, '2021_10_21_140423_create_user_trips_table', 1),
(44, '2021_10_21_153155_create_user_bookings', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('5ebee351af27d979bc70b76e7eeac994bd22fd48777aa62a008d7219a419790942126b3e7da4084e', 1, 1, 'TripApi', '[]', 0, '2021-10-22 05:09:13', '2021-10-22 05:09:13', '2022-10-22 08:09:13'),
('61be912a6ecfff6f83981542f7e33418e1dd846961ecf4ed15a76dd1d0d3f1268df8fade1d359ec1', 1, 1, 'TripApi', '[]', 0, '2021-10-22 05:08:23', '2021-10-22 05:08:23', '2022-10-22 08:08:23'),
('96ee4ab368ca664176180984bf45b276034743b6f11106f731ff48df176417aedc16dd4630d292d2', 2, 1, 'TripApi', '[]', 0, '2021-10-22 05:12:30', '2021-10-22 05:12:30', '2022-10-22 08:12:30'),
('e93dac861badc054394dd7ec5f3c6535ef2d78b7c939b9d1321b6e9d2ab2863d377f5469d8bc2b4d', 1, 1, 'TripApi', '[]', 0, '2021-10-22 05:08:50', '2021-10-22 05:08:50', '2022-10-22 08:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Personal Access Client', 'IuY5PFWHEUJGQZfQX7aiEOytVavxiBmJ6DUOiqYX', NULL, 'http://localhost', 1, 0, 0, '2021-10-22 05:04:13', '2021-10-22 05:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-10-22 05:04:13', '2021-10-22 05:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `title`, `slug`, `description`, `location`, `price`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 'Last minute trip to Rome', 'last-minute-trip-to-rome', 'You can visit many places.', 'Rome', '50.00', '2022-04-25', '2022-04-30', '2021-10-22 05:16:24', '2021-10-22 05:16:24'),
(2, 'Last minute trip to Rome1', 'last-minute-trip-to-rome1', 'You can visit many places.', 'Rome', '100.00', '2022-04-25', '2022-04-30', '2021-10-22 05:16:34', '2021-10-22 05:16:34'),
(3, 'Last minute trip to Rome2', 'last-minute-trip-to-rome2', 'You can visit many places.', 'Rome', '200.00', '2022-04-25', '2022-04-30', '2021-10-22 05:18:09', '2021-10-22 05:18:09'),
(4, 'Last minute trip to Rome3', 'last-minute-trip-to-rome3', 'You can visit many places.', 'Rome', '300.00', '2022-04-25', '2022-04-30', '2021-10-22 05:18:33', '2021-10-22 05:18:33'),
(5, 'Last minute trip to Rome4', 'last-minute-trip-to-rome4', 'You can visit many places.', 'Rome', '400.00', '2022-04-25', '2022-04-30', '2021-10-22 05:18:41', '2021-10-22 05:18:41'),
(6, 'Last minute trip to Rome5', 'last-minute-trip-to-rome5', 'You can visit many places.', 'Rome', '500.00', '2022-04-25', '2022-04-30', '2021-10-22 05:18:50', '2021-10-22 05:18:50'),
(7, 'Last minute trip to Rome6', 'last-minute-trip-to-rome6', 'You can visit many places.', 'Rome', '600.00', '2022-04-25', '2022-04-30', '2021-10-22 05:18:56', '2021-10-22 05:18:56'),
(8, 'Last minute trip to Rome7', 'last-minute-trip-to-rome7', 'You can visit many places.', 'Rome', '700.00', '2022-04-25', '2022-04-30', '2021-10-22 05:19:07', '2021-10-22 05:19:07'),
(9, 'Last minute trip to Rome8', 'last-minute-trip-to-rome8', 'You can visit many places.', 'Rome', '800.00', '2022-04-25', '2022-04-30', '2021-10-22 05:19:17', '2021-10-22 05:19:17'),
(10, 'Last minute trip to Berlin', 'last-minute-trip-to-berlin', 'You can visit many places.', 'Berlin', '50.00', '2022-04-25', '2022-04-30', '2021-10-22 05:20:19', '2021-10-22 05:20:19'),
(11, 'Last minute trip to Berlin1', 'last-minute-trip-to-berlin1', 'You can visit many places.', 'Berlin', '100.00', '2022-04-25', '2022-04-30', '2021-10-22 05:20:25', '2021-10-22 05:20:25'),
(12, 'Last minute trip to Berlin2', 'last-minute-trip-to-berlin2', 'You can visit many places.', 'Berlin', '200.00', '2022-04-25', '2022-04-30', '2021-10-22 05:20:31', '2021-10-22 05:20:31'),
(13, 'Last minute trip to Berlin3', 'last-minute-trip-to-berlin3', 'You can visit many places.', 'Berlin', '300.00', '2022-04-25', '2022-04-30', '2021-10-22 05:20:36', '2021-10-22 05:20:36'),
(14, 'Last minute trip to Berlin4', 'last-minute-trip-to-berlin4', 'You can visit many places.', 'Berlin', '400.00', '2022-04-25', '2022-04-30', '2021-10-22 05:20:41', '2021-10-22 05:20:41'),
(15, 'Last minute trip to Berlin5', 'last-minute-trip-to-berlin5', 'You can visit many places.', 'Berlin', '500.00', '2022-04-25', '2022-04-30', '2021-10-22 05:20:46', '2021-10-22 05:20:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John', 'Doe', 'john.doe@mail.com', '$2y$10$s4RSo/OrJVATqo1nvLaoROUSIt1ooefhkwSA59uU1hjXDme4StQtq', NULL, '2021-10-22 05:08:23', '2021-10-22 05:08:23'),
(2, 'Victor', 'Brown', 'victor.brown@mail.com', '$2y$10$1wb2I/U4wHj7ufTnA1uGHOJw9NrlpGopDlR/yh4afpD5qaSrGC0d2', NULL, '2021-10-22 05:12:30', '2021-10-22 05:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_bookings`
--

CREATE TABLE `user_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_bookings`
--

INSERT INTO `user_bookings` (`id`, `user_id`, `trip_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-10-22 05:28:05', '2021-10-22 05:28:05'),
(2, 1, 3, '2021-10-22 05:28:14', '2021-10-22 05:28:14'),
(3, 1, 5, '2021-10-22 05:28:22', '2021-10-22 05:28:22'),
(4, 1, 8, '2021-10-22 05:28:26', '2021-10-22 05:28:26'),
(5, 1, 11, '2021-10-22 05:28:30', '2021-10-22 05:28:30'),
(6, 2, 1, '2021-10-22 05:28:43', '2021-10-22 05:28:43'),
(7, 2, 2, '2021-10-22 05:28:47', '2021-10-22 05:28:47'),
(8, 2, 4, '2021-10-22 05:28:51', '2021-10-22 05:28:51'),
(9, 2, 6, '2021-10-22 05:28:54', '2021-10-22 05:28:54'),
(10, 2, 14, '2021-10-22 05:28:59', '2021-10-22 05:28:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
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
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_bookings`
--
ALTER TABLE `user_bookings`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_bookings`
--
ALTER TABLE `user_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
