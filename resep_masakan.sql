 -- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Mar 2025 pada 08.07
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
(1, 'Western Food', '2025-03-04 21:19:20', '2025-03-04 21:19:20'),
(2, 'Dessert', '2025-03-04 21:19:48', '2025-03-04 21:19:48');

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
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cooking_events`
--

INSERT INTO `cooking_events` (`id`, `chef_id`, `title`, `description`, `date`, `location`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ulang Tahun Royco', 'Ramaikan acara yang akan segera kami selenggarakan, nikmati berbagai bazar makanan, royco gratis, dan performa dari beberapa artis terkenal.', '2025-05-25 00:00:00', 'Jl. Aditama Perwira No.13 Blok C', NULL, '2025-03-04 23:30:19', '2025-03-04 23:30:19'),
(2, 1, 'Ulang Tahun Royco', 'Ramaikan acara yang akan segera kami selenggarakan, nikmati berbagai bazar makanan, royco gratis, dan performa dari beberapa artis terkenal.', '2025-05-25 08:30:00', 'Jl. Aditama Perwira No.13 Blok C', NULL, '2025-03-04 23:41:55', '2025-03-05 06:02:09'),
(3, 1, 'Ulang Tahun Royco', 'Ramaikan acara yang akan segera kami selenggarakan, nikmati berbagai bazar makanan, royco gratis, dan performa dari beberapa artis terkenal.', '2025-05-25 00:00:00', 'Jl. Aditama Perwira No.13 Blok C', NULL, '2025-03-05 03:45:05', '2025-03-05 03:45:05');

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
(1, 'App\\Models\\User', 1, 'auth_token', 'b03c55f8f8c0a0751e9ba8c0ed3ddfd778158a5e39fa87d5c45a40e645431feb', '[\"*\"]', NULL, NULL, '2025-03-04 21:10:54', '2025-03-04 21:10:54'),
(2, 'App\\Models\\User', 2, 'auth_token', '7c2c9b8e187e776f0cc9c7d5855a7292bf94081f9e4030409b9633d63aac4ef0', '[\"*\"]', NULL, NULL, '2025-03-04 21:14:29', '2025-03-04 21:14:29'),
(3, 'App\\Models\\User', 2, 'auth_token', 'aabeab340ed56d6a8e0b8293f1ffe37697b05c073abec93063dc19fa2861c8cc', '[\"admin\"]', '2025-03-04 21:19:47', NULL, '2025-03-04 21:15:00', '2025-03-04 21:19:47'),
(4, 'App\\Models\\User', 1, 'auth_token', '5011ff82eb69219dd57f924289fee4bf103174095248324ab5c2ebc99a3db0a5', '[\"chef\"]', '2025-03-05 18:51:47', NULL, '2025-03-04 21:25:25', '2025-03-05 18:51:47'),
(5, 'App\\Models\\User', 1, 'auth_token', '435d29b2b8b8dc749d0d96bf36bef60bf1fec20b4ccae709703acbabb0022122', '[\"chef\"]', '2025-03-05 06:02:28', NULL, '2025-03-05 05:43:14', '2025-03-05 06:02:28');

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
(1, 1, 'Cheese Cake', 'Kali ini saya akan berbagi resep cheese cake yang simpel dan mudah di buat', 2, 'recipes/u2oEh1s8NKOWWWlkJOz9ryznRe9Cb86kDvKN3Aa3.jpg', '2025-03-04 21:26:48', '2025-03-04 21:30:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `ingredient` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`id`, `recipe_id`, `ingredient`, `created_at`, `updated_at`) VALUES
(1, 1, 'tepung terigu 120gr', '2025-03-04 23:15:51', '2025-03-04 23:15:51'),
(2, 1, 'gula pasir 120gr', '2025-03-04 23:15:51', '2025-03-04 23:15:51'),
(3, 1, 'margarin 100gr', '2025-03-04 23:15:51', '2025-03-04 23:15:51'),
(4, 1, '3 butir telur', '2025-03-04 23:15:51', '2025-03-04 23:15:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `recipe_reviews`
--

CREATE TABLE `recipe_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `recipe_reviews`
--

INSERT INTO `recipe_reviews` (`id`, `user_id`, `recipe_id`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'wiihh resepnya sangat bermanfaat ya bund ini saya sudah recook', 'recipe-reviews/ZpuZDJU7809JfwQk8uyx2N4z7O34tyML8ZxlwMky.png', '2025-03-04 23:18:56', '2025-03-04 23:18:56'),
(2, 1, 1, 'wiihh resepnya sangat bermanfaat ya bund ini saya sudah recook', 'recipe-reviews/tvkRru9gfbx6Bao1Y598PNOjl6YAlxw0FBfLQxGf.png', '2025-03-04 23:23:22', '2025-03-04 23:23:22'),
(3, 1, 1, 'wiihh resepnya sangat bermanfaat ya bund ini saya sudah recook', NULL, '2025-03-05 06:11:04', '2025-03-05 06:11:04'),
(4, 1, 1, 'wiihh resepnya sangat bermanfaat ya bund ini saya sudah recook', NULL, '2025-03-05 06:18:31', '2025-03-05 06:18:31'),
(5, 1, 1, 'wiihh resepnya sangat bermanfaat ya bund ini saya sudah recook', NULL, '2025-03-05 18:24:12', '2025-03-05 18:24:12'),
(6, 1, 1, 'wiihh resepnya sangat bermanfaat ya bund ini saya sudah recook', NULL, '2025-03-05 18:24:15', '2025-03-05 18:24:15'),
(7, 1, 1, 'wiihh resepnya sangat bermanfaat ya bund ini saya sudah recook', NULL, '2025-03-05 18:24:15', '2025-03-05 18:24:15'),
(8, 1, 1, 'wiihh resepnya sangat bermanfaat ya bund ini saya sudah recook', NULL, '2025-03-05 18:48:56', '2025-03-05 18:48:56'),
(9, 1, 1, 'wiihh resepnya sangat bermanfaat ya bund ini saya sudah recook', NULL, '2025-03-05 18:49:00', '2025-03-05 18:49:00'),
(10, 1, 1, 'wiihh resepnya sangat bermanfaat ya bund ini saya sudah recook', NULL, '2025-03-05 18:49:56', '2025-03-05 18:49:56'),
(11, 1, 1, 'wiihh resepnya sangat bermanfaat ya bund ini saya sudah recook', NULL, '2025-03-05 18:51:47', '2025-03-05 18:51:47');

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
(1, 1, 1, 'Pertama buat scramble egg (orak arik) dulu. Bikin setengah matang aja, sisihkan', 'http://127.0.0.1:8000/storage/recipe-steps/IzuG78xvuTTsuqpMrC2kEvMfcu8l4YKJ7Bs8GzHR.jpg', '2025-03-04 21:31:40', '2025-03-04 21:34:15'),
(2, 1, 2, 'Campur potongan Timun bersama Mayonaise wijen, garam dan merica. Aduk hingga rata. Koreksi rasa', 'http://127.0.0.1:8000/storage/recipe-steps/1llFU8KWRWjLlN4fmR2phNCdk2O2zXtOyh58vhAV.jpg', '2025-03-04 21:31:40', '2025-03-04 23:12:57'),
(3, 1, 3, 'Ambil Roti, beri olesan Timun Mayo, lalu scramble egg. Tambahkan Keju slice, dan tangkupkan Roti. Potong diagonal', NULL, '2025-03-04 21:31:40', '2025-03-04 21:31:40'),
(4, 1, 4, 'Sajikan saat sarapan, atau dibawa sebagai bekal ke sekolah dan ke kantor', NULL, '2025-03-04 21:31:40', '2025-03-04 21:31:40');

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
(1, 'chef', 'chef@gmail.com', NULL, '$2y$12$05VYPG9MovxW5KxhIunyRe2.O8rzsOYt0liB3qUCi7a0Y/GwqZETO', 'chef', 'profiles/XOj8NzWUr0V0EilmNmzgtagbADDBTMFmdhjYZWA1.jpg', NULL, '2025-03-04 21:10:54', '2025-03-04 21:10:54'),
(2, 'admin', 'admin@gmail.com', NULL, '$2y$12$JHiK09uII7PEc62UtJVOruhFpPyEN817U8tUIG7UvY9iDPv1oWe5u', 'admin', 'profiles/gmECOi56HXjdrt51RiiswTxfTz3Rgq5UyKQQi2zw.jpg', NULL, '2025-03-04 21:14:28', '2025-03-04 21:14:28');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `recipe_reviews`
--
ALTER TABLE `recipe_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `recipe_steps`
--
ALTER TABLE `recipe_steps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
