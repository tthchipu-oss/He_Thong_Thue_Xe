-- -------------------------------------------------------------
-- TablePlus 7.1.0(710)
--
-- https://tableplus.com/
--
-- Database: railway
-- Generation Time: 2026-06-03 14:39:08.2290
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `car_id` bigint unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_user_id_foreign` (`user_id`),
  KEY `bookings_car_id_foreign` (`car_id`),
  CONSTRAINT `bookings_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transmission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fuel_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seats` int NOT NULL,
  `price_per_day` decimal(12,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cars_category_id_foreign` (`category_id`),
  CONSTRAINT `cars_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `bookings` (`id`, `user_id`, `car_id`, `start_date`, `end_date`, `customer_phone`, `total_price`, `status`, `is_delivery`, `delivery_address`, `created_at`, `updated_at`) VALUES
(5, 11, 1, '2026-06-03', '2026-06-05', '02132123123', 1400000, 'completed', 1, 'T Mart, Phố Nguyễn Trác, Phường Dương Nội, Hà Nội, 10189, Việt Nam', '2026-06-03 03:12:50', '2026-06-03 03:33:22');

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-dnam7979@gmail.com|100.64.0.10', 'i:2;', 1780457494),
('laravel-cache-dnam7979@gmail.com|100.64.0.10:timer', 'i:1780457494;', 1780457494),
('laravel-cache-dnam7979@gmail.com|100.64.0.9', 'i:1;', 1780457503),
('laravel-cache-dnam7979@gmail.com|100.64.0.9:timer', 'i:1780457503;', 1780457503),
('laravel-cache-qanh0909@gmail.com|100.64.0.7', 'i:1;', 1780458284),
('laravel-cache-qanh0909@gmail.com|100.64.0.7:timer', 'i:1780458284;', 1780458284);

INSERT INTO `cars` (`id`, `category_id`, `name`, `brand`, `image`, `transmission`, `fuel_type`, `seats`, `price_per_day`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Honda City 2024', 'Honda', 'cars/qr7oFil9gcE255m3ich5sBbadfLbaUkZjv3AH0GI.jpg', 'Số tự động', 'Xăng', 4, 600000.00, 'available', '2026-05-20 07:00:38', '2026-06-03 03:10:10'),
(2, 1, 'Kia Morning 2023', 'Kia', '', 'Số sàn', 'Xăng', 4, 400000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(3, 1, 'Mazda 3 Luxury', 'Mazda', '', 'Số tự động', 'Xăng', 4, 750000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(4, 1, 'Toyota Vios 2024', 'Toyota', '', 'Số sàn', 'Xăng', 4, 500000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(5, 2, 'Mitsubishi Xpander', 'Mitsubishi', '', 'Số tự động', 'Xăng', 7, 800000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(6, 2, 'Ford Everest 2024', 'Ford', '', 'Số tự động', 'Dầu', 7, 1200000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(7, 2, 'Hyundai SantaFe', 'Hyundai', '', 'Số tự động', 'Dầu', 7, 1300000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(8, 2, 'Toyota Fortuner', 'Toyota', '', 'Số sàn', 'Dầu', 7, 1000000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(9, 3, 'Ford Transit 2023', 'Ford', '', 'Số sàn', 'Dầu', 16, 1200000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(10, 3, 'Hyundai Solati', 'Hyundai', '', 'Số sàn', 'Dầu', 16, 1500000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(11, 3, 'Mercedes Sprinter', 'Mercedes', '', 'Số sàn', 'Dầu', 16, 1300000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(12, 4, 'Hyundai County', 'Hyundai', '', 'Số sàn', 'Dầu', 29, 2200000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(13, 4, 'Samco Felix', 'Samco', '', 'Số sàn', 'Dầu', 29, 2500000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(14, 4, 'Thaco Town', 'Thaco', '', 'Số sàn', 'Dầu', 29, 2400000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(15, 5, 'Hyundai Universe', 'Hyundai', '', 'Số sàn', 'Dầu', 45, 3500000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(16, 5, 'Thaco Bluesky', 'Thaco', '', 'Số sàn', 'Dầu', 45, 3200000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(17, 6, 'Ford Transit Limousine 9 Chỗ', 'Ford', '', 'Số sàn', 'Dầu', 9, 2500000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(18, 6, 'Kia Carnival Royal', 'Kia', '', 'Số tự động', 'Dầu', 7, 2000000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(19, 6, 'Hyundai Solati Limousine 11 Chỗ', 'Hyundai', '', 'Số tự động', 'Dầu', 11, 3000000.00, 'available', '2026-05-20 07:00:38', '2026-05-20 07:00:38');

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Xe 4 chỗ', 'xe-4-cho', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(2, 'Xe 7 chỗ', 'xe-7-cho', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(3, 'Xe 16 chỗ', 'xe-16-cho', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(4, 'Xe 29 chỗ', 'xe-29-cho', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(5, 'Xe 45 chỗ', 'xe-45-cho', '2026-05-20 07:00:38', '2026-05-20 07:00:38'),
(6, 'Limousine cao cấp', 'limousine', '2026-05-20 07:00:38', '2026-05-20 07:00:38');

INSERT INTO `contacts` (`id`, `name`, `phone`, `email`, `message`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Quỳnh Anh', '0987654321', 'qanh0909@gmail.com', 'Gọi cho em ngay!', 'pending', '2026-06-03 03:39:37', '2026-06-03 03:39:37');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_05_20_022636_add_google_id_to_users_table', 1),
(5, '2026_05_20_061913_create_categories_table', 1),
(6, '2026_05_20_061914_create_cars_table', 1),
(7, '2026_05_20_094221_create_bookings_table', 1),
(8, '2026_05_20_145834_add_phone_and_address_to_users_table', 1),
(9, '2026_05_20_153759_add_customer_phone_to_bookings_table', 1),
(10, '2026_05_21_144142_add_delivery_address_to_bookings_table', 1),
(11, '2026_05_25_171737_add_is_delivery_to_bookings_table', 1),
(12, '2026_05_27_075832_create_contacts_table', 1);

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3hOa5X6rkfLrgmgsLHcUHT85YJQDxIBAhWxcHVAV', NULL, '100.64.0.13', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 facebookexternalhit/1.1 Facebot Twitterbot/1.0', 'eyJfdG9rZW4iOiJQV0VtcFdwVUswcjhFd2p2R1hubEl5QTNmSmRlWEEwem5pRkEyMnR2IiwidXJsIjp7ImludGVuZGVkIjoiaHR0cDpcL1wvY2FyZW50by51cC5yYWlsd2F5LmFwcFwvYWRtaW5cL2Rhc2hib2FyZCJ9LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvY2FyZW50by51cC5yYWlsd2F5LmFwcFwvbG9naW4iLCJyb3V0ZSI6ImxvZ2luIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1780458442),
('GolOoKjGXFUCPwTHSyikAr9RLD0qe1tjHhxfgKIv', 9, '100.64.0.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJpdDVBWlpiZG9wdE8ycEZDd25yUGJ6VHFFSGVzV0N5M1pHOEk3VEtlIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvY2FyZW50by51cC5yYWlsd2F5LmFwcFwvYWRtaW5cL21lc3NhZ2VzIiwicm91dGUiOiJhZG1pbi5tZXNzYWdlcy5pbmRleCJ9LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6OX0=', 1780458020),
('reAor2MHcbxNeA779XriQL2le4UcfcgW6P7Fs2K1', 9, '100.64.0.9', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1', 'eyJfdG9rZW4iOiJTd1ZVSjBoRzNmOEczd2R4ZUYwZWhOdTdOUVM1V0JiZmtkUE1hdzZwIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvY2FyZW50by51cC5yYWlsd2F5LmFwcFwvYWRtaW5cL2NhcnMiLCJyb3V0ZSI6ImFkbWluLmNhcnMuaW5kZXgifSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjl9', 1780462461),
('Sw9mCLtc0xkTxJyBtFpJTT44lycgvlFlWuZcNE4b', NULL, '100.64.0.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 facebookexternalhit/1.1 Facebot Twitterbot/1.0', 'eyJfdG9rZW4iOiJPdHJ2QjdOUlB5N1Y1Mm8yeGYybEJkSHBmcGdpc2JMM2swRGJhVFp2IiwidXJsIjp7ImludGVuZGVkIjoiaHR0cDpcL1wvY2FyZW50by51cC5yYWlsd2F5LmFwcFwvYWRtaW5cL2NhcnMifSwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2NhcmVudG8udXAucmFpbHdheS5hcHBcL2xvZ2luIiwicm91dGUiOiJsb2dpbiJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1780462881),
('xgdHYovSiY6X6CE4IuF5q0Lfzf4v9eWIVfnY70VK', 11, '100.64.0.12', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJwamNlOExVVmVwdkFNWVV0WWl2RlA0THU0QWREY3d1c284ajExcGs4IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2NhcmVudG8udXAucmFpbHdheS5hcHBcL2xpZW4taGUiLCJyb3V0ZSI6ImNsaWVudC5jb250YWN0In0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjExfQ==', 1780457978);

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `google_id`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'Huyền 6-Trần', 'tthchipu@gmail.com', NULL, '101777266237791871585', 'user', NULL, '$2y$12$pZzHq2olVtiFub.GzraqxObYpVjb9kNvbhIu2vLu5Ms9WunmgP1N.', NULL, '2026-06-02 14:28:57', '2026-06-02 14:28:57'),
(9, 'Bùi Thị Quỳnh Anh', 'quynhanh01172004@gmail.com', NULL, NULL, 'admin', NULL, '$2y$12$yrvbiMTnOSjUf05ULZVliOQQeYHx6xwCFecwRR.ph7/V8507MULPO', NULL, '2026-06-02 14:51:53', '2026-06-02 14:51:53'),
(10, 'Minh Tuấn Nguyễn', 'nmt4953@gmail.com', NULL, '112541076841125174087', 'user', NULL, '$2y$12$IRB5AlA6Lihfgjp.Xgh9XeEIBQk4Z9do7wMkNFKDQ9/IaFEDP62RW', NULL, '2026-06-02 15:49:23', '2026-06-02 15:49:23'),
(11, 'Quỳnh Anh', 'qanh0909@gmail.com', '0987654321', NULL, 'user', NULL, '$2y$12$Pz6oqPQwoNnnTS27wnBpQe3xMM7FdJaO0YEPmBjZBTDB9r2wvtvQG', NULL, '2026-06-03 03:09:08', '2026-06-03 03:36:45');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;