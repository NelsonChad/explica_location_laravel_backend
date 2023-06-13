-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2023 at 08:42 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `explica`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact` varchar(11) NOT NULL,
  `explainer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `contact`, `explainer_id`, `created_at`, `updated_at`) VALUES
(1, '844517557', 14, '2020-04-29 18:16:43', '2020-04-29 18:16:43'),
(2, '845215224', 14, '2020-04-29 18:17:26', '2020-04-29 18:17:26'),
(3, '842532115', 16, '2020-04-29 18:43:44', '2020-04-29 18:43:44'),
(4, '845213668', 21, '2020-04-29 19:48:39', '2020-04-29 19:48:39'),
(5, '21256844', 16, '2020-04-29 19:48:56', '2020-04-29 19:48:56'),
(6, '45454545455', 22, '2020-05-01 12:37:27', '2020-05-01 12:37:27'),
(7, '844512458', 28, '2020-05-07 08:46:05', '2020-05-07 08:46:05');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accepted` varchar(5) NOT NULL DEFAULT 'false',
  `active` varchar(5) NOT NULL DEFAULT 'true',
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `explainer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `accepted`, `active`, `student_id`, `explainer_id`, `created_at`, `updated_at`) VALUES
(8, 'false', 'true', 2, 28, '2020-05-07 10:34:27', '2020-05-07 10:34:27'),
(9, 'false', 'true', 4, 14, '2020-05-07 11:15:08', '2020-05-07 11:15:08'),
(10, 'false', 'true', 2, 14, '2020-05-07 11:51:52', '2020-05-07 11:51:52');

-- --------------------------------------------------------

--
-- Table structure for table `enroll_subjets`
--

CREATE TABLE `enroll_subjets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enroll_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `explainers`
--

CREATE TABLE `explainers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'default.png',
  `min_price` double UNSIGNED NOT NULL,
  `max_price` double UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `slogan` varchar(100) DEFAULT NULL,
  `description` varchar(1200) DEFAULT NULL,
  `open_time` varchar(10) DEFAULT NULL,
  `close_time` varchar(10) DEFAULT NULL,
  `grade_range` varchar(20) DEFAULT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `lng` decimal(11,8) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `active` varchar(5) NOT NULL DEFAULT 'true',
  `confirmed` varchar(5) NOT NULL DEFAULT 'false',
  `type` int(11) NOT NULL,
  `province_id` bigint(20) UNSIGNED NOT NULL,
  `exp_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `explainers`
--

INSERT INTO `explainers` (`id`, `name`, `avatar`, `min_price`, `max_price`, `email`, `slogan`, `description`, `open_time`, `close_time`, `grade_range`, `lat`, `lng`, `password`, `active`, `confirmed`, `type`, `province_id`, `exp_type_id`, `created_at`, `updated_at`) VALUES
(1, 'Lexi Corkery', 'default.png', 195, 810, 'jasen76@example.org', 'Dr.', 'Dolorum consectetur corrupti alias facere deleniti. Expedita delectus officiis asperiores aspernatur consequatur qui. Placeat maxime dignissimos et atque. Autem itaque dolorem aut officia et.', '07:00', '17:00', '10-12', -25.87636400, 32.61357700, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'true', 'true', 2, 1, 1, '2020-03-27 19:15:24', '2020-03-27 19:15:24'),
(2, 'Shad Connelly', 'default.png', 197, 979, 'qshanahan@example.net', 'Dr.', 'Totam sit reiciendis amet adipisci vitae beatae nisi veniam. Consectetur optio est autem qui tenetur cumque. Vitae sed dolor non omnis dolorem.', '07:00', '17:00', '10-12', -25.87581800, 32.61248400, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'true', 'true', 2, 1, 1, '2020-03-27 19:15:24', '2020-03-27 19:15:24'),
(3, 'Winnifred Johns', 'default.png', 127, 894, 'mazie97@example.org', 'Dr.', 'Sequi tenetur exercitationem accusantium et enim eos. Et voluptate laudantium molestiae ex quis. Natus repudiandae voluptatem iusto eius repellat ipsam.', '07:00', '17:00', '10-12', -25.87631000, 32.61082700, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'true', 'true', 2, 1, 1, '2020-03-27 19:15:24', '2020-03-27 19:15:24'),
(4, 'Alejandra Yundt', 'default.png', 130, 912, 'domenica.krajcik@example.net', 'Mr.', 'Voluptatem a sit rerum. Commodi omnis ducimus non eaque. Est corrupti et reiciendis qui voluptate quia non. Provident voluptatem quod et corporis sunt inventore.', '07:00', '17:00', '10-12', -25.87799500, 32.61362800, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'true', 'true', 2, 1, 1, '2020-03-27 19:15:24', '2020-03-27 19:15:24'),
(5, 'Pablo Larkin', 'default.png', 161, 892, 'block.magdalena@example.org', 'Mrs.', 'Ea corporis odit impedit nobis impedit officiis. Quae non rerum suscipit dolores aperiam dolorem. Amet aut fugit similique et voluptatum veritatis.', '07:00', '17:00', '10-12', -25.88018200, 32.61277600, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'true', 'true', 2, 1, 1, '2020-03-27 19:15:24', '2020-03-27 19:15:24'),
(6, 'Giles Hodkiewicz', 'default.png', 195, 994, 'lemke.jensen@example.org', 'Mr.', 'Cumque et nihil expedita quasi facilis repellat. Consequatur porro quidem ut magnam. Facilis et laboriosam qui quam deleniti. Odio explicabo at voluptas dolorem velit autem enim repellendus.', '07:00', '17:00', '10-12', -25.88310000, 32.61135100, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'true', 'true', 2, 1, 1, '2020-03-27 19:15:24', '2020-03-27 19:15:24'),
(7, 'Brooks McKenzie', 'default.png', 175, 969, 'bettye12@example.com', 'Mr.', 'Vel nesciunt quos in soluta. Alias vel vero nesciunt. Et adipisci dolore et aperiam illum.', '07:00', '17:00', '10-12', -25.87901300, 32.60942200, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'true', 'true', 2, 1, 1, '2020-03-27 19:15:25', '2020-03-27 19:15:25'),
(8, 'Viviane Friesen DDS', 'default.png', 100, 923, 'cordie37@example.org', 'Ms.', 'Et rerum vel totam exercitationem aut ut. Facere consectetur ut qui dolores ipsum. Minima tempora sit quia est.', '07:00', '17:00', '10-12', -25.88379400, 32.60523100, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'true', 'true', 2, 1, 1, '2020-03-27 19:26:14', '2020-03-27 19:26:14'),
(13, 'Cartov expl', 'default.png', 0, 0, 'cartov@gmail.com', 'Educar e Encinar', NULL, '07:00', '17:30', NULL, -25.98562325, 32.01323958, '123456789', 'true', 'true', 2, 1, 1, '2020-04-29 13:39:19', '2020-04-29 13:39:19'),
(14, 'Aquela dica', 'default.png', 0, 0, 'sultane@gmail.com', 'aquela dica e\' a sena', 'Quela dica e\' uma instituicao de Encino em moz', '07:10', '16:10', NULL, -25.98064837, 32.01334050, '12345678', 'true', 'false', 2, 1, 1, '2020-04-29 14:11:38', '2020-04-29 14:11:38'),
(15, 'sdasdsadasd', 'default.png', 0, 0, 'eduardo@eduardo.com', 'dsfadsgfdsafds', 'dfsfewrwfe', '16:48', '16:48', NULL, -25.98072880, 32.01318050, '123322432', 'true', 'false', 2, 1, 1, '2020-04-29 14:48:50', '2020-04-29 14:48:50'),
(16, 'james School', 'default.png', 200, 4000, 'James@gmail.com', 'Encino de qualidade', 'Escola de varios cursos e explicacao de qualidade xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '07:20', '17:30', '07:00', -25.96161300, 32.57267100, '1234567890', 'true', 'true', 2, 1, 1, '2020-04-29 15:58:15', '2020-04-29 15:58:15'),
(21, 'Minerva Expliner', 'default.png', 0, 0, 'minerva@gmail.com', 'Minerva, o teu lugar', 'Comore, estude e faca o teu melhor aqui conosco com os melhores explicadores e professores', '07:30', '22:30', NULL, -25.97268600, 32.56918200, '12345678', 'true', 'true', 2, 1, 1, '2020-04-29 19:48:25', '2020-04-29 19:48:25'),
(22, 'Escolacccccc', 'default.png', 0, 0, 'fernanda@gmail.com', 'sssssssssss', 'hohhghgiuhououi', '14:37', '14:37', NULL, -25.98060507, 32.01333613, '123fdsdfds', 'true', 'false', 2, 1, 1, '2020-05-01 12:37:16', '2020-05-01 12:37:16'),
(23, 'lfdsnfksjdf', 'default.png', 0, 0, 'faizal@gmail.com', 'knmfdngkfds', 'nfkdjhgjsfgs', '16:15', '16:15', NULL, -25.98087372, 32.01281313, '123dfwew', 'true', 'false', 2, 1, 1, '2020-05-01 14:16:00', '2020-05-01 14:16:00'),
(27, 'jkdfksdf', 'default.png', 0, 0, 'eduardo1@eduardo.com', 'fdgdfgfdg', 'vsdgfdsfds', '21:17', '21:17', NULL, -25.98068265, 32.01347720, '123dsfds', 'true', 'false', 2, 1, 1, '2020-05-01 19:19:26', '2020-05-01 19:19:26'),
(28, 'LPS services', 'default.png', 0, 0, 'lps@gmail.com', 'Servicos de Encino', 'dshsgfkagdkfgdaufy', '10:45', '12:47', NULL, -25.86711705, 32.61510235, '12345678', 'true', 'false', 2, 1, 1, '2020-05-07 08:45:52', '2020-05-07 08:45:52');

-- --------------------------------------------------------

--
-- Table structure for table `expl_subjects`
--

CREATE TABLE `expl_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expl_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_types`
--

CREATE TABLE `exp_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_types`
--

INSERT INTO `exp_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Particular', NULL, NULL),
(2, 'Centro', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `level` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `level`, `created_at`, `updated_at`) VALUES
(1, '1 classe', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_03_27_124155_create_exp_types_table', 1),
(4, '2020_03_27_124508_create_provinces_table', 1),
(5, '2020_03_27_124631_create_explainers_table', 1),
(6, '2020_03_27_132446_create_levels_table', 1),
(7, '2020_03_27_132533_create_students_table', 1),
(8, '2020_03_27_133245_create_enrollments_table', 1),
(9, '2020_03_27_134129_create_subjects_table', 1),
(10, '2020_03_27_134756_create_enroll_subjets_table', 1),
(11, '2020_03_27_140831_create_contacts_table', 1),
(12, '2020_03_27_205349_create_expl_subjects_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `province` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `province`, `created_at`, `updated_at`) VALUES
(1, 'Maputo', NULL, NULL),
(2, 'Gaza', NULL, NULL),
(3, 'Inhambane', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'default.png',
  `email` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lat` double(10,8) DEFAULT NULL,
  `lng` double(11,8) DEFAULT NULL,
  `active` varchar(5) NOT NULL DEFAULT 'true',
  `confirmed` varchar(5) NOT NULL DEFAULT 'true',
  `type` int(1) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `level_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `surname`, `avatar`, `email`, `number`, `password`, `lat`, `lng`, `active`, `confirmed`, `type`, `remember_token`, `level_id`, `created_at`, `updated_at`) VALUES
(2, 'Eduardo', 'Faustino', 'default.png', 'eduardo@eduardo.com', 845645456, '12345678', -25.98091593, 32.01309263, 'true', 'true', 1, NULL, 1, '2020-05-01 14:14:33', '2020-05-01 14:14:33'),
(3, 'sdfsdfd', 'dsfsd', 'default.png', 'fernanda2@gmail.com', 545545455, '123dsfsdf', -25.98152592, 32.01281508, 'true', 'true', 1, NULL, 1, '2020-05-01 19:24:12', '2020-05-01 19:24:12'),
(4, 'Nelson', 'Chadaly', 'chad.jpg', 'nchadaly4@gmail.com', 844517557, '12345678', -25.86709215, 32.61510552, 'true', 'true', 1, NULL, 1, '2020-05-06 19:32:49', '2020-05-06 19:32:49'),
(6, 'chadaly', 'nelson', 'default.png', 'chad@chad.com', 844517557, '12345678', -25.86711705, 32.61510235, 'true', 'true', 1, NULL, 1, '2020-05-07 08:31:21', '2020-05-07 08:31:21'),
(7, 'turas', 'cardoso', 'default.png', 'turas@gmail.com', 854525664, '12345678', NULL, NULL, 'true', 'true', 1, NULL, 1, '2020-05-07 08:52:20', '2020-05-07 08:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `decription` varchar(500) NOT NULL,
  `price` double UNSIGNED NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `grade` varchar(50) NOT NULL,
  `explainer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `decription`, `price`, `icon`, `grade`, `explainer_id`, `created_at`, `updated_at`) VALUES
(2, 'Matematica 1', 'xxxxxxxxxx', 0, NULL, '', 14, NULL, NULL),
(3, 'Matematica 2', 'xxxxxxxxxx', 0, NULL, '', 14, NULL, NULL),
(5, 'Fisica 1', 'nova disciplina', 0, NULL, 'all', 14, '2020-04-29 19:42:47', '2020-04-29 19:42:47'),
(6, 'Matematica', 'nova disciplina', 0, NULL, 'all', 21, '2020-04-29 19:49:12', '2020-04-29 19:49:12'),
(7, 'Fisica', 'nova disciplina', 0, NULL, 'all', 21, '2020-04-29 19:49:26', '2020-04-29 19:49:26'),
(8, 'Quimica', 'nova disciplina', 0, NULL, 'all', 21, '2020-04-29 19:49:34', '2020-04-29 19:49:34'),
(9, 'Fisica', 'nova disciplina', 0, NULL, 'all', 22, '2020-05-01 12:37:35', '2020-05-01 12:37:35'),
(10, 'Ingles', 'nova disciplina', 0, NULL, 'all', 28, '2020-05-07 08:46:15', '2020-05-07 08:46:15'),
(11, 'Fisica', 'nova disciplina', 0, NULL, 'all', 28, '2020-05-07 08:46:23', '2020-05-07 08:46:23'),
(12, 'Biologia', 'nova disciplina', 0, NULL, 'all', 28, '2020-05-07 08:46:32', '2020-05-07 08:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'nelson', 'nchadaly@gmail.com', NULL, '$2y$10$HBGIKy.aFkayxeD9up/lZ.OV9wW46V8QacUL3/1tJYNIY3iMdJsei', NULL, '2020-05-06 19:10:41', '2020-05-06 19:10:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_explainer_id_foreign` (`explainer_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollments_student_id_foreign` (`student_id`),
  ADD KEY `enrollments_explainer_id_foreign` (`explainer_id`);

--
-- Indexes for table `enroll_subjets`
--
ALTER TABLE `enroll_subjets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enroll_subjets_enroll_id_foreign` (`enroll_id`),
  ADD KEY `enroll_subjets_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `explainers`
--
ALTER TABLE `explainers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `explainers_email_unique` (`email`),
  ADD KEY `explainers_province_id_foreign` (`province_id`),
  ADD KEY `explainers_exp_type_id_foreign` (`exp_type_id`);

--
-- Indexes for table `expl_subjects`
--
ALTER TABLE `expl_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expl_subjects_expl_id_foreign` (`expl_id`),
  ADD KEY `expl_subjects_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `exp_types`
--
ALTER TABLE `exp_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`),
  ADD KEY `students_level_id_foreign` (`level_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_explainer_id_foreign` (`explainer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `enroll_subjets`
--
ALTER TABLE `enroll_subjets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `explainers`
--
ALTER TABLE `explainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `expl_subjects`
--
ALTER TABLE `expl_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_types`
--
ALTER TABLE `exp_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_explainer_id_foreign` FOREIGN KEY (`explainer_id`) REFERENCES `explainers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_explainer_id_foreign` FOREIGN KEY (`explainer_id`) REFERENCES `explainers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enroll_subjets`
--
ALTER TABLE `enroll_subjets`
  ADD CONSTRAINT `enroll_subjets_enroll_id_foreign` FOREIGN KEY (`enroll_id`) REFERENCES `enrollments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enroll_subjets_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `explainers`
--
ALTER TABLE `explainers`
  ADD CONSTRAINT `explainers_exp_type_id_foreign` FOREIGN KEY (`exp_type_id`) REFERENCES `exp_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `explainers_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expl_subjects`
--
ALTER TABLE `expl_subjects`
  ADD CONSTRAINT `expl_subjects_expl_id_foreign` FOREIGN KEY (`expl_id`) REFERENCES `explainers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expl_subjects_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_explainer_id_foreign` FOREIGN KEY (`explainer_id`) REFERENCES `explainers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
