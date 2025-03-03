-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Mar 2025 pada 08.04
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resep_masakan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Japanese Food', '2025-02-25 09:29:43', '2025-02-25 09:29:43'),
(2, 'Sea Food', '2025-02-25 18:43:11', '2025-02-25 18:43:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cooking_events`
--

CREATE TABLE `cooking_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chef_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` datetime NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_02_24_011801_create_categories_table', 1),
(5, '2025_02_24_013152_create_recipes_table', 1),
(6, '2025_02_24_013808_create_recipe_steps_table', 1),
(7, '2025_02_24_013844_create_recipe_ingredients_table', 1),
(8, '2025_02_24_013902_create_recipe_reviews_table', 1),
(9, '2025_02_24_013934_create_cooking_events_table', 1),
(10, '2025_02_24_021119_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '9139fa3736cb4bea55e5924877e2ff8ac2bc4f4f104279fa0e799741f30ca227', '[\"*\"]', NULL, NULL, '2025-02-25 08:27:10', '2025-02-25 08:27:10'),
(2, 'App\\Models\\User', 1, 'auth_token', '2625762e02b476403dcfbf29fbd646c06068b503b70dd689dc773ad0cd1fa3c4', '[\"admin\"]', '2025-02-25 08:28:57', NULL, '2025-02-25 08:27:21', '2025-02-25 08:28:57'),
(3, 'App\\Models\\User', 1, 'auth_token', '7b038f4f264d94bfacec70577d27e35ca7e9756352d5f364373a71e4f04fe4a4', '[\"admin\"]', NULL, NULL, '2025-02-25 08:43:00', '2025-02-25 08:43:00'),
(7, 'App\\Models\\User', 1, 'auth_token', '81e823760946558acdc257cca434a78e30c47630438f12eada3f2f137836a3f2', '[\"admin\"]', '2025-02-25 18:43:11', NULL, '2025-02-25 09:13:15', '2025-02-25 18:43:11'),
(8, 'App\\Models\\User', 2, 'auth_token', '443e24e0be030642ec926e1d14dcb58b5596afb7a6595cb8365a9372c0c33819', '[\"chef\"]', '2025-02-25 20:30:59', NULL, '2025-02-25 09:49:59', '2025-02-25 20:30:59'),
(9, 'App\\Models\\User', 3, 'auth_token', 'ecbe6993281ec717f7531280e7c0cc1e77e5103e41370250611318b3fadf1700', '[\"*\"]', NULL, NULL, '2025-02-26 18:07:45', '2025-02-26 18:07:45'),
(10, 'App\\Models\\User', 3, 'auth_token', 'e99ada09f8e657ae2c1948fe4cc8cf5915edd29f51b3b35ef7378538ddd4cd7f', '[\"user\"]', '2025-02-26 19:38:16', NULL, '2025-02-26 18:08:19', '2025-02-26 19:38:16'),
(11, 'App\\Models\\User', 1, 'auth_token', '0f7b832378f7062bb230d5ceeeaaf9c17094eef1ade2ea1b1b27d240c94ea0e2', '[\"admin\"]', '2025-02-27 17:16:22', NULL, '2025-02-26 20:00:20', '2025-02-27 17:16:22'),
(12, 'App\\Models\\User', 2, 'auth_token', '35eb95ea8bcdc8e34aa2a6904125d055005dbe5a46afdde7f48750ad7aff924b', '[\"chef\"]', '2025-03-02 23:44:43', NULL, '2025-02-27 17:17:37', '2025-03-02 23:44:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `recipes`
--

CREATE TABLE `recipes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chef_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `recipes`
--

INSERT INTO `recipes` (`id`, `chef_id`, `title`, `description`, `category_id`, `image`, `created_at`, `updated_at`) VALUES
(2, 2, 'Membuat nasi goreng', 'Kali ini saya membuat nasi goreng spesial seafood dengan cita rasa yang waw.', 1, 'C:\\xampp\\tmp\\php22B4.tmp', '2025-02-25 18:41:49', '2025-02-25 18:41:49'),
(5, 2, 'Membuat tumis kadal', 'Resep baru kali ini adalah tumis kadal dengan cita rasa yang khas.', 2, 'recipes/WdJUrbXaxv7Gv7H8pqG54j9TrIbnBxCG426n6vxm.jpg', '2025-02-25 19:01:05', '2025-02-25 19:01:05'),
(6, 2, 'tumis hiu', 'Tumis hiu dengan cita rasa yang khas', 1, 'recipes/KSA2QAhqLzAGIAtDLnu6nqOacCsUol1tzal8eEW6.jpg', '2025-02-26 20:12:47', '2025-02-26 21:24:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `ingredient` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`id`, `recipe_id`, `ingredient`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 6, 'daging hiu', '200gr', '2025-03-02 22:21:11', '2025-03-02 22:21:11'),
(2, 6, 'saus tiram', '20ml', '2025-03-02 22:21:11', '2025-03-02 22:21:11'),
(3, 6, 'garam', '1kg', '2025-03-02 22:21:11', '2025-03-02 22:21:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `recipe_reviews`
--

CREATE TABLE `recipe_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `recipe_steps`
--

CREATE TABLE `recipe_steps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `step_no` int(11) NOT NULL,
  `instruction` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `recipe_steps`
--

INSERT INTO `recipe_steps` (`id`, `recipe_id`, `step_no`, `instruction`, `image`, `created_at`, `updated_at`) VALUES
(6, 6, 1, 'Dapatkan ikan  hiu di laut terdekat', 'http://127.0.0.1:8000/storage/recipe-steps/e9u59jOdJnjimbN8BVzNrf3ss2scyhLxmLXgcZzG.jpg', '2025-02-27 20:26:34', '2025-02-27 20:26:34'),
(7, 6, 2, 'Belah ikan hiu menjadi beberapa bagian', 'http://127.0.0.1:8000/storage/recipe-steps/xQ2ILmdKSEorN30nHDi7GTn1LdLngr48puomqkzJ.jpg', '2025-02-27 20:26:34', '2025-02-27 20:26:34'),
(8, 6, 3, 'Potong dadu daging ikan hiu menjadi 8 bagian dengan ukuran 5x5cm', 'http://127.0.0.1:8000/storage/recipe-steps/MTiombwlDQmKY7mV7PxzXM0GPqyWvlteP98a6oFU.jpg', '2025-02-27 20:26:34', '2025-02-27 20:26:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7gLrKt7OfjrYqhPYd9YBPkZBDbdwFtKAgVBGJlA0', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1dZeGdTNzRzTmFOb1dibG8wM3h2YjNXVTRNdU9OWnh1Z3g2amw3NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740540311),
('deqn68YNTGH9iCw8c6HJ6iFR3uclz5Fyw3cCVmps', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTFSb0ZQdXdKSVVISUMwajZYSEdEZWRnYWpPWWxuQWJvSWF0TTdkRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740629808),
('mcElz6Nhr5sLnZ2IXgHHXRjCgMYmJr8393LR9Y8O', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUd6cW5WaXdTZWpsY2wxMmNZd3k1cElwR3BTeFFPRFRRMjNRbzdiaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740711873),
('Xr56pcbV9BiokRIqFe30iwGlpHXNhG1PAx8PBO1G', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUU3d0lKUzNkMmhhREJJS2YxUW5ZUWV0VGVQdEpTVjAxR21WbGd5QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740984283);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','chef','user') NOT NULL DEFAULT 'user',
  `profile_picture` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `profile_picture`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$P1FsJ5ZSy4b/k0ssb8LGouJB2reVtnz.oS9vDaLyFNu20PpHYJ/xi', 'admin', 'profiles/FsIaIWKbQJUZeySsGQy3Bxp8gmWgLI1MqAYIsDx5.jpg', NULL, '2025-02-25 08:27:10', '2025-02-25 08:27:10'),
(2, 'chef', 'chef@gmail.com', NULL, '$2y$12$P7fctH9/aLqJM2XW.HpA8uo9sbPaaSP1oDP/J.ipu6YSaO9ozR342', 'chef', 'profiles/l7Mk2jZvzky0WjNU2mOYj01FJcCzpLg5K7uGgqAi.jpg', NULL, '2025-02-25 08:51:51', '2025-02-25 08:51:51'),
(3, 'user', 'user@gmail.com', NULL, '$2y$12$q6gApNgU1rPimmjPQ/m3qeN0BNDVWd6Zy.yMo7TdfwwtwaJPab2Ly', 'user', 'profiles/QTFfcuwZyPY7f0gLxi6U6lUFlTCmxmHpz2aC8glF.jpg', NULL, '2025-02-26 18:07:44', '2025-02-26 18:07:44');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indeks untuk tabel `cooking_events`
--
ALTER TABLE `cooking_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cooking_events_chef_id_foreign` (`chef_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipes_chef_id_foreign` (`chef_id`),
  ADD KEY `recipes_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_ingredients_recipe_id_foreign` (`recipe_id`);

--
-- Indeks untuk tabel `recipe_reviews`
--
ALTER TABLE `recipe_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_reviews_user_id_foreign` (`user_id`),
  ADD KEY `recipe_reviews_recipe_id_foreign` (`recipe_id`);

--
-- Indeks untuk tabel `recipe_steps`
--
ALTER TABLE `recipe_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_steps_recipe_id_foreign` (`recipe_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `cooking_events`
--
ALTER TABLE `cooking_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `recipe_reviews`
--
ALTER TABLE `recipe_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `recipe_steps`
--
ALTER TABLE `recipe_steps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cooking_events`
--
ALTER TABLE `cooking_events`
  ADD CONSTRAINT `cooking_events_chef_id_foreign` FOREIGN KEY (`chef_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipes_chef_id_foreign` FOREIGN KEY (`chef_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `recipe_ingredients_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `recipe_reviews`
--
ALTER TABLE `recipe_reviews`
  ADD CONSTRAINT `recipe_reviews_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `recipe_steps`
--
ALTER TABLE `recipe_steps`
  ADD CONSTRAINT `recipe_steps_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
