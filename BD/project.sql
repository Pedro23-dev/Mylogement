-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 03 mars 2025 à 20:17
-- Version du serveur : 8.0.30
-- Version de PHP : 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `project`
--

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

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
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `logements`
--

CREATE TABLE `logements` (
  `id` int NOT NULL,
  `libelle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` int NOT NULL,
  `location` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `nbre_chambre` int NOT NULL,
  `image` varchar(600) NOT NULL,
  `status` int NOT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int NOT NULL,
  `date_updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `logements`
--

INSERT INTO `logements` (`id`, `libelle`, `price`, `location`, `ville`, `nbre_chambre`, `image`, `status`, `date_created`, `created_by`, `date_updated`, `updated_by`) VALUES
(10, 'Appartement luxieux', 150000, 'Aného', 'Lomé', 3, 'logements/images/1740945085.png', 0, '2025-03-02 19:51:25', 1, NULL, NULL),
(11, 'Appartement à moindre cout', 90000, 'Baguida', 'Lomé', 2, 'logements/images/1740945445.png', 0, '2025-03-02 19:57:25', 1, NULL, NULL),
(12, 'Appartement en famille', 500000, 'Avépozo', 'Lomé', 8, 'logements/images/1740945649.png', 0, '2025-03-02 20:00:49', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_19_191805_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'BIGPEDRO_23', '41f5dfb95bd176db1dfaf469df2bfffc3c54c3707f67e19e0f97bb5bc5616f06', '[\"*\"]', NULL, NULL, '2024-11-19 19:44:56', '2024-11-19 19:44:56'),
(2, 'App\\Models\\User', 1, 'BIGPEDRO_23', '50710d3873bb03c50b67c93479399a6126ffb1a41fa0a88b87e6682aefc085e8', '[\"*\"]', NULL, NULL, '2024-11-19 19:45:57', '2024-11-19 19:45:57'),
(3, 'App\\Models\\User', 1, 'BIGPEDRO_23', 'b4d13004479da5c00533de4571bfbf75f578b4db5ae309efe7c660bf366ac967', '[\"*\"]', NULL, NULL, '2024-11-19 20:35:33', '2024-11-19 20:35:33'),
(4, 'App\\Models\\User', 1, 'BIGPEDRO_23', '296d88524fce8ed920258d3c9c1d642df837a20e21f4c8a6b2b002057403f786', '[\"*\"]', NULL, NULL, '2024-11-19 20:40:22', '2024-11-19 20:40:22'),
(5, 'App\\Models\\User', 1, 'BIGPEDRO_23', 'a42462985d798b86e6e704349978b31a1c15524f0ee149e676d0e5b0db3c6f2f', '[\"*\"]', NULL, NULL, '2024-11-19 20:40:25', '2024-11-19 20:40:25'),
(6, 'App\\Models\\User', 1, 'BIGPEDRO_23', '91d6763bfb0b1d0daa584c20b3945789d835f41dbb89f05cfdfc778395f43938', '[\"*\"]', NULL, NULL, '2024-11-19 20:40:28', '2024-11-19 20:40:28'),
(7, 'App\\Models\\User', 1, 'BIGPEDRO_23', 'ebb70e5dd2199bb4c459f1e85d57b727dd70bf113360f7865132b72afc84ccf9', '[\"*\"]', NULL, NULL, '2024-11-19 21:30:42', '2024-11-19 21:30:42'),
(8, 'App\\Models\\User', 6, 'BIGPEDRO_23', '33a3a67a132cd13c522cd16384fd222eb032aa8888162080d4d76698db8b194b', '[\"*\"]', NULL, NULL, '2024-11-20 18:55:18', '2024-11-20 18:55:18'),
(9, 'App\\Models\\User', 6, 'BIGPEDRO_23', 'c11a233fe91760477ccacc31e94874ce3f14122931312f7f91ff8693e75a0c75', '[\"*\"]', NULL, NULL, '2024-11-20 19:03:07', '2024-11-20 19:03:07'),
(10, 'App\\Models\\User', 6, 'BIGPEDRO_23', '929b8542a1a0805d6d1da124197c04eec6e12c9b610dbc3935bc82dddf4c471c', '[\"*\"]', '2024-11-20 19:08:05', NULL, '2024-11-20 19:03:12', '2024-11-20 19:08:05'),
(11, 'App\\Models\\User', 6, 'BIGPEDRO_23', '458311587c2e3dcb99eb895e3e719a1837adaeba7e5b73504dd5e3cc50e4bbfe', '[\"*\"]', NULL, NULL, '2024-11-20 19:03:38', '2024-11-20 19:03:38'),
(12, 'App\\Models\\User', 7, 'BIGPEDRO_23', 'ac6545616facab66b4ce775d3b9cef30ce6f5a0e46235f6a22c5b5a4d7d41adc', '[\"*\"]', NULL, NULL, '2025-03-01 15:44:45', '2025-03-01 15:44:45'),
(13, 'App\\Models\\User', 7, 'BIGPEDRO_23', '6d0cefb0b7a22384b2a742738f2603b9dc472d702a05858c8057175cdb61e545', '[\"*\"]', NULL, NULL, '2025-03-01 15:46:55', '2025-03-01 15:46:55'),
(15, 'App\\Models\\User', 7, 'BIGPEDRO_23', 'c9ac6c8fa5944d33e01075e7af3dd53ac74343d122149f643f57d9e4d9327988', '[\"*\"]', '2025-03-01 16:33:47', NULL, '2025-03-01 16:28:52', '2025-03-01 16:33:47'),
(16, 'App\\Models\\User', 7, 'BIGPEDRO_23', '09d68ab912b2ea3527194e56f2f0a5ae1a80afd31b4421cdb042ab57b3dca201', '[\"*\"]', '2025-03-01 16:41:56', NULL, '2025-03-01 16:39:32', '2025-03-01 16:41:56'),
(17, 'App\\Models\\User', 11, 'BIGPEDRO_23', 'dfa4ebd319842a792016dd3239424a1d9263e4bbe33847f988d22e84ef69e04c', '[\"*\"]', NULL, NULL, '2025-03-03 08:47:53', '2025-03-03 08:47:53'),
(18, 'App\\Models\\User', 11, 'BIGPEDRO_23', '4fc6e3d1518dd2007317c268fea34535a53fabc5b2cac9353032e65d186223b9', '[\"*\"]', NULL, NULL, '2025-03-03 08:48:16', '2025-03-03 08:48:16'),
(19, 'App\\Models\\User', 11, 'BIGPEDRO_23', '1ffa05eaf1526b9373b92cbdbe14a033612d04b84272ce94a0da7c6b53370730', '[\"*\"]', NULL, NULL, '2025-03-03 08:48:19', '2025-03-03 08:48:19'),
(20, 'App\\Models\\User', 11, 'BIGPEDRO_23', 'fe2c8e1808d5a294a2b82075cef5b089a3e508760d9d55078060ae3b19b023e3', '[\"*\"]', NULL, NULL, '2025-03-03 08:48:29', '2025-03-03 08:48:29'),
(21, 'App\\Models\\User', 11, 'BIGPEDRO_23', '588167b60dbf37375f50e3793196368d7963953d82ee45062908263565828b9f', '[\"*\"]', NULL, NULL, '2025-03-03 08:50:01', '2025-03-03 08:50:01');

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `id` int NOT NULL,
  `status` int NOT NULL,
  `date_reservation` datetime NOT NULL,
  `user_id` int NOT NULL,
  `logement_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id`, `status`, `date_reservation`, `user_id`, `logement_id`) VALUES
(1, 0, '2025-03-02 22:48:21', 1, 11),
(2, 0, '2025-03-02 22:48:37', 1, 10),
(3, 0, '2025-03-02 22:49:01', 1, 12),
(4, 0, '2025-03-02 23:42:03', 1, 11);

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2eazKZfMh7g6FtFuJCYmXrfc8NhnnzJOOnKl7Nc3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2VaYTlKS2xGWkdXVEhwU0s2ZFRBMElETEVCckNkbmRJNnNKRUxZWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740991523),
('2pRmMcp2YDCrPQkxgwJsiy4qoFvrej1Af3oRVy1N', NULL, '172.20.10.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUpzUXdYMGwyd3hSZW43UEtPeG1jZzB2MUpMME8wOUZEbnpwZlJQUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly8xNzIuMjAuMTAuNjo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732047401),
('3SzuZhv1plctej6PhSguvAvTtuNXke8idR3Z1aoK', NULL, '127.0.0.1', 'PostmanRuntime/7.39.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFBuVU1GR3RXNUxNYUZKZDU2SHZaTkJnMzZma1lyMWFmVEd3cDJ6VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740944999),
('QVkHTrWQhkWBESK2J9hEHT1DcY2TgBCdEY5wHUo2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1I1cDJBU1N6aFI1VDVwV1NUbDBoWE8zNVNmR3hueGNkM1U4NDJLbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732118099),
('tTG463HKBymk4O0pD2C3ff0Jyv1N3rYiHosfBu6b', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1NBeUU0c1dxdnhBaEpOeVU5R3Y3TVNqQmV5czhjVkU0RW1ZTWtRMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732051827),
('WUxE4FVMGapWCx3qRjiwFau00etG3DZm9pESXsGo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWdMTXM0VGs4cEYyeWdxNTI2bmNheVJxTUFrMElidnA3Vm5TcGRJZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1741031151),
('zyParAWSz8z5eGy4MoLzwpV1JaHnFv15EUC1kmhC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFBadURGdWd6Z1RqY0RoSUExQU0yUjdRZ05WQng1VUZiSzlkTVI0NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740843705);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Silas', 'Silas', 2, NULL, '$2y$12$/FMIY1Dx2Th0bqLQcJn5/.qFajbDB6iDfaf56p4kJJkHVpkOPDtVS', NULL, '2024-11-19 19:35:41', '2024-11-19 21:42:48'),
(2, 'pedro', 'Carlos01@gmail.com', 0, NULL, '$2y$12$rMjW2JpQJV7KI0SVuv774.emwEfhj9v4Bdm28oAVH7LMRvQcaHhO.', NULL, '2024-11-19 20:17:32', '2024-11-19 20:17:32'),
(3, 'carlos', 'carlos', 0, NULL, '$2y$12$zF5yf6ysr5Phb6C4o9EDd.E/I37xteYa6/m0CkSz2zPT7ttKghHwW', NULL, '2024-11-20 10:20:08', '2024-11-20 10:20:08'),
(4, 'carlos', '0', 0, NULL, '$2y$12$cHYJLB.dKqTiiLy0gy6E9.a9JjiV4sFOfHkGHzUFYKpinGLyVaBnG', NULL, '2024-11-20 10:23:37', '2024-11-20 10:23:37'),
(5, 'carlos', 'ricky@gmail.com', 0, NULL, '$2y$12$XfHWqwKEUM1eWp7tqo3Tc./LhDlHeuKsqg1Dz8.oFjZDe4dqUAOgG', NULL, '2024-11-20 10:31:13', '2024-11-20 10:31:13'),
(6, 'Pedro', 'ricky23@gmail.com', 0, NULL, '$2y$12$inHbQ3n7Uv183zgfoP5F1uMtQejofa1C3gWX.GwP55cHHvUZzLOm.', NULL, '2024-11-20 18:54:59', '2024-11-20 18:54:59'),
(7, 'Pedro silas', 'silas@gmail.com', 0, NULL, '$2y$12$JkjG18o9Ubs58npwLpCyne8L38gqFkoTgzlp3ez9er52K4dma5Ify', NULL, '2025-03-01 15:44:13', '2025-03-01 15:44:13'),
(8, 'Silas', 'test@gmail.com', 0, NULL, '$2y$12$gtyy5eBSe7eeTY2N8AcXjuo68N1AsCjc4orRPaypRKxsnSyFE5GUC', NULL, '2025-03-01 18:00:45', '2025-03-01 18:00:45'),
(9, 'grr', 'grr@gmail.com', 0, NULL, '$2y$12$HS94AwR8Cnbn5EHB.pnm3e3vk.9D8p1nz4wB1aZ89L9CoSphaz0CC', NULL, '2025-03-01 18:04:09', '2025-03-01 18:04:09'),
(10, 'kjbv', 'bb@gmail.com', 0, NULL, '$2y$12$y7WYZTvmDrfQN8r9OO4FoOsbaXpGtv8kDWq1Pivi4zA4WECsfgKWy', NULL, '2025-03-01 18:09:23', '2025-03-01 18:09:23'),
(11, 'D\'ALMEIDA', 'pedrodalmeida@gmail.com', 0, NULL, '$2y$12$MZBzdlvpnD2E.4jODYIXguJw8g6ird9rPyvB1kuCcHq0gVdI.dfam', NULL, '2025-03-03 08:47:36', '2025-03-03 08:47:36');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `logements`
--
ALTER TABLE `logements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logement_id` (`logement_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `logements`
--
ALTER TABLE `logements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`logement_id`) REFERENCES `logements` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
