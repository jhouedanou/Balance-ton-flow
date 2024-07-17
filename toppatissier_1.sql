-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 10 juil. 2024 à 09:59
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `toppatissier`
--

-- --------------------------------------------------------

--
-- Structure de la table `banners`
--

CREATE TABLE `banners` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `banners`
--

INSERT INTO `banners` (`id`, `image`, `active`, `created_at`, `updated_at`, `category_id`, `type`) VALUES
('8e70799b-a370-45ac-9b1a-a15cd2f91899', 'banners/May2024/AzczlTiyqMQIF9x96J1q.jpg', 0, '2023-01-10 16:00:00', '2024-05-29 14:19:09', '8c3ee210-1c0c-41df-a66b-58af6131f513', 'default'),
('ebf0da33-31d1-460b-b157-3e58ad662e6e', 'banners/May2024/cMKTuokx3jSVwJIOUbaB.jpg', 1, '2023-01-09 17:26:00', '2024-05-29 14:19:01', '8c3ee210-1c0c-41df-a66b-58af6131f513', 'recipe');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
('2580fb90-c9ae-492a-a907-aaba3ce109d9', NULL, 1, 'Category 2', 'category-2', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('7dfb1152-0d3a-4262-a5ef-971471ef8901', NULL, 1, 'Category 1', 'category-1', '2022-12-02 15:15:32', '2022-12-02 15:15:32');

-- --------------------------------------------------------

--
-- Structure de la table `contestants`
--

CREATE TABLE `contestants` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quartier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cgu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contestants`
--

INSERT INTO `contestants` (`id`, `last_name`, `first_name`, `ville`, `quartier`, `cgu`, `user_id`, `telephone`, `photo`, `bio`, `created_at`, `updated_at`, `slug`) VALUES
('1442b95a-54d0-4318-a35f-8e997a187b92', 'KONAN', 'HENRI', 'ABIDJAN', 'treichville', '1', '2e4cd43c-7b1d-43a7-8e7c-e6bf6aef3dbc', '+225 49 55 71 01', 'contestants//July2024/LOG.png', 'dvfr vrvrvr', '2024-07-10 09:57:22', '2024-07-10 09:57:22', 'henri-konan-1'),
('1993cd8e-c233-48be-9a63-25c95ce3ee4e', 'JOEL', 'KONAN', 'Abidjan', 'treichville', '1', '69407aac-dc9c-4d26-8073-171cf8b8b101', '+225 49 55 71 01', 'contestants//January2023/unnamed.png', 'je suis henri joel balkba blka bka', '2023-01-27 14:11:07', '2023-01-27 14:11:07', 'konan-joel'),
('1e72895e-8b08-4d19-b531-4c7e041db1b7', 'konan', 'konan', 'Abidjan', 'Treichville', '1', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', '0749557101', 'contestants//February2023/Capture d’écran 2023-01-31 à 20.06.38.png', 'zerferfrfr r grfgrfrfr', '2023-02-01 10:30:20', '2023-02-01 10:30:20', 'konan-konan'),
('4dd46469-b992-4038-9561-86accbf206e9', 'JOEL', 'KONAN', 'Abidjan', 'deee', '1', '677b5c25-9d17-4809-98b7-0774cf6814b7', '+225 49 55 71 01', 'contestants//May2024/LOG.png', 'e eeee e', '2024-05-17 08:33:57', '2024-05-17 08:33:57', 'konan-joel-1'),
('6669014a-3dad-43ed-beb7-45b8bb477316', 'konan', 'henri', 'abidjan', 'treichville', '1', '531881a7-2d3a-49d7-afd4-ad1da0ee418e', '0708470139', 'contestants//April2024/hjk.jpg', 'je suis henri joel mz maotrege hebhbe.', '2024-04-24 15:15:37', '2024-04-24 15:15:37', 'henri-konan'),
('a29b8333-e80b-42ab-a73f-1a881e46821c', 'BOGUI', 'CHRISTIAN', 'Abidjan', 'kiumassi', '1', 'd7830b23-4e7a-4287-bd24-a4efd435c1e4', '0708470139', 'contestants//July2024/Capture d’écran 2024-07-01 à 09.46.25.png', 'rfrfrf', '2024-07-10 09:51:02', '2024-07-10 09:51:02', 'christian-bogui'),
('ad93dc09-55f1-4d43-afac-d634ec14ff83', 'KONAN', 'JOEL', 'okok', 'ooko', '1', '57d3bcad-9d34-4afb-a7e3-3f92b4a8e2b6', '0956096790', 'contestants//May2024/LOGO.png', 'erfr trgtrgtgtg t gt', '2024-05-17 08:32:10', '2024-05-17 08:32:10', 'joel-konan'),
('b4693ddc-583a-40b7-946e-ff820f60dcef', 'JOEL', 'KONAN', 'Abidjan', 'eeee', '1', '6141a4b5-d595-4ca9-ab6c-7f94003b96bc', '+225 49 55 71 01', 'contestants//May2024/LOG.png', '\"d\"\' r\'rr\'r\'r rfffgfrrfr', '2024-05-17 08:35:40', '2024-05-17 08:35:40', 'konan-joel-3'),
('c0feb267-305a-426c-b3a9-fa66ef7525d1', 'JOEL', 'KONAN', 'Abidjan', 'rrrrr', '1', 'f9000f47-5d7e-4c0d-9b69-a3272d9e18a5', '+225 49 55 71 01', 'contestants//May2024/LOG.png', 'r tg t gt gt ttt', '2024-05-17 08:46:46', '2024-05-17 08:46:46', 'konan-joel-4'),
('cc5a6e47-9303-4c1e-92b9-50f6f306685a', 'JOEL', 'KONAN', 'Abidjan', 'treichville', '1', '0d12c4a6-7b46-4ebb-bea1-ef8232efbd4e', '+225 49 55 71 01', 'contestants//February2024/LOGO-MySOBOA.jpg', 'efrfrfrf', '2024-02-26 18:27:40', '2024-02-26 18:27:40', 'konan-joel-2');

-- --------------------------------------------------------

--
-- Structure de la table `contest_categories`
--

CREATE TABLE `contest_categories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_recipe` datetime NOT NULL,
  `end_recipe` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_vote` datetime NOT NULL,
  `end_vote` datetime NOT NULL,
  `top` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contest_categories`
--

INSERT INTO `contest_categories` (`id`, `slug`, `name`, `start_recipe`, `end_recipe`, `active`, `description`, `start_vote`, `end_vote`, `top`, `created_at`, `updated_at`) VALUES
('8c3ee210-1c0c-41df-a66b-58af6131f513', 'grtg', 'Manche 1', '2024-05-16 18:00:00', '2024-06-28 18:00:00', 1, '<p>grtt</p>', '2024-05-08 18:00:00', '2024-06-19 18:00:00', 10, '2024-05-24 18:03:38', '2024-06-06 17:18:32');

-- --------------------------------------------------------

--
-- Structure de la table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'last_name', 'text', 'Last Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'first_name', 'text', 'First Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'ville', 'text', 'Ville', 0, 1, 1, 1, 1, 1, '{}', 4),
(60, 7, 'quartier', 'text', 'Quartier', 0, 1, 1, 1, 1, 1, '{}', 5),
(61, 7, 'cgu', 'text', 'Cgu', 0, 0, 1, 0, 1, 1, '{}', 6),
(62, 7, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, '{}', 7),
(63, 7, 'created_at', 'timestamp', 'Created at', 0, 1, 1, 1, 0, 1, '{}', 12),
(64, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(65, 7, 'contestant_belongsto_user_relationship', 'relationship', 'users', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Contestant\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(66, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(67, 8, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 3),
(68, 8, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(71, 8, 'created_at', 'timestamp', 'Crée le', 0, 1, 1, 0, 0, 1, '{}', 6),
(72, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(73, 7, 'telephone', 'text', 'Telephone', 0, 1, 1, 1, 1, 1, '{}', 8),
(74, 7, 'photo', 'image', 'Photo', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 9),
(75, 7, 'bio', 'rich_text_box', 'Bio', 0, 0, 1, 0, 1, 1, '{}', 11),
(76, 8, 'active', 'select_dropdown', 'Active', 0, 1, 1, 1, 1, 1, '{\"default\":0,\"options\":{\"0\":\"NON ACTIF\",\"1\":\"ACTIF\"}}', 8),
(77, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(78, 9, 'user_id', 'text', 'User Id', 1, 0, 0, 1, 1, 0, '{}', 2),
(79, 9, 'category_id', 'text', 'Category Id', 1, 0, 0, 1, 1, 0, '{}', 3),
(80, 9, 'images', 'multiple_images', 'Images', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 4),
(81, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 1, 0, 1, '{}', 9),
(82, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(83, 9, 'recipe_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\ContestCategory\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(84, 9, 'recipe_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(85, 3, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 6),
(86, 1, 'username', 'text', 'Username', 1, 1, 1, 1, 1, 1, '{}', 6),
(87, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 7),
(88, 1, 'provider_id', 'text', 'Provider Id', 0, 1, 1, 0, 0, 1, '{}', 13),
(89, 1, 'provider', 'text', 'Provider', 0, 1, 1, 0, 0, 1, '{}', 14),
(90, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(91, 10, 'ip', 'text', 'Ip', 0, 1, 1, 0, 0, 0, '{}', 12),
(92, 10, 'votes', 'text', 'Votes', 0, 1, 1, 0, 0, 0, '{}', 10),
(93, 10, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, '{}', 2),
(94, 10, 'category_id', 'text', 'Category Id', 0, 1, 1, 0, 0, 0, '{}', 3),
(95, 10, 'recipe_id', 'text', 'Recipe Id', 0, 0, 0, 0, 0, 0, '{}', 4),
(96, 10, 'created_at', 'timestamp', 'Date de vote', 0, 0, 0, 0, 0, 0, '{}', 5),
(97, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(98, 10, 'vote_belongsto_category_relationship', 'relationship', 'Categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\ContestCategory\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(99, 10, 'vote_belongsto_recipe_relationship', 'relationship', 'recipes', 0, 0, 1, 0, 0, 0, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}],\"model\":\"App\\\\Models\\\\Recipe\",\"table\":\"recipes\",\"type\":\"belongsTo\",\"column\":\"recipe_id\",\"key\":\"id\",\"label\":\"images\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(100, 10, 'vote_belongsto_user_relationship', 'relationship', 'Votant', 0, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(101, 10, 'last_vote', 'date', 'Last Vote', 0, 1, 1, 0, 0, 0, '{}', 11),
(102, 10, 'owner_id', 'text', 'Owner Id', 0, 1, 1, 0, 0, 0, '{}', 14),
(103, 10, 'vote_belongsto_user_relationship_1', 'relationship', 'Candidat', 0, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"owner_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(104, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(105, 11, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 2),
(106, 11, 'active', 'select_dropdown', 'Active', 0, 1, 1, 1, 1, 1, '{\"default\":0,\"options\":{\"0\":\"NON ACTIF\",\"1\":\"ACTIF\"}}', 3),
(107, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(108, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(109, 11, 'category_id', 'text', 'Category Id', 0, 0, 0, 1, 1, 0, '{}', 6),
(110, 11, 'banner_belongsto_contest_category_relationship', 'relationship', 'contest_categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\ContestCategory\",\"table\":\"contest_categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"banners\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(111, 8, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 11),
(112, 8, 'start_recipe', 'timestamp', 'Start Recipe', 0, 1, 1, 1, 1, 1, '{}', 4),
(113, 8, 'end_recipe', 'timestamp', 'End Recipe', 0, 1, 1, 1, 1, 1, '{}', 5),
(114, 11, 'type', 'select_dropdown', 'Type', 0, 1, 1, 1, 1, 1, '{\"default\":\"default\",\"options\":{\"default\":\"Banni\\u00e8re par defaut\",\"recipe\":\"Banni\\u00e8re recette\"}}', 7),
(115, 8, 'start_vote', 'timestamp', 'Start Vote', 0, 1, 1, 1, 1, 1, '{}', 9),
(116, 8, 'end_vote', 'timestamp', 'End Vote', 0, 1, 1, 1, 1, 1, '{}', 10),
(117, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(118, 12, 'votes', 'text', 'Votes', 0, 1, 1, 1, 1, 1, '{}', 2),
(119, 12, 'user_id', 'text', 'Jury', 0, 0, 0, 0, 1, 1, '{}', 3),
(120, 12, 'category_id', 'text', 'Categorie', 0, 0, 0, 0, 1, 1, '{}', 4),
(121, 12, 'recipe_id', 'text', 'Recipe', 0, 0, 0, 1, 1, 1, '{}', 5),
(122, 12, 'owner_id', 'text', 'Candidat', 0, 0, 0, 0, 1, 1, '{}', 6),
(123, 12, 'created_at', 'timestamp', 'Date de vote', 0, 1, 1, 1, 0, 1, '{}', 7),
(124, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(125, 12, 'vote_jury_belongsto_user_relationship', 'relationship', 'Jury', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"banners\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(126, 12, 'vote_jury_belongsto_contest_category_relationship', 'relationship', 'Catégorie', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\ContestCategory\",\"table\":\"contest_categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"banners\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(127, 12, 'vote_jury_belongsto_recipe_relationship', 'relationship', 'Recette', 0, 0, 0, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}],\"model\":\"App\\\\Models\\\\Recipe\",\"table\":\"recipes\",\"type\":\"belongsTo\",\"column\":\"recipe_id\",\"key\":\"id\",\"label\":\"images\",\"pivot_table\":\"banners\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(128, 12, 'vote_jury_belongsto_user_relationship_1', 'relationship', 'Candidat', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"owner_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"banners\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(129, 8, 'top', 'text', 'Top', 0, 1, 1, 1, 1, 1, '{}', 12),
(130, 9, 'view_count', 'text', 'View Count', 0, 1, 1, 1, 1, 1, '{}', 7),
(131, 9, 'lien_video', 'text', 'Lien Video', 0, 1, 1, 1, 1, 1, '{}', 6);

-- --------------------------------------------------------

--
-- Structure de la table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-12-02 15:15:31', '2023-01-02 11:36:47'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-12-02 15:15:31', '2022-12-02 15:15:31'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'App\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-12-02 15:15:31', '2022-12-05 18:20:45'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(7, 'contestants', 'contestants', 'Contestant', 'Contestants', 'voyager-categories', 'App\\Models\\Contestant', NULL, 'App\\Http\\Controllers\\Voyager\\VoyagerContestantController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-12-02 15:49:43', '2022-12-03 18:24:42'),
(8, 'contest_categories', 'contest-categories', 'Contest Category', 'Contest Categories', 'voyager-photo', 'App\\Models\\ContestCategory', NULL, 'App\\Http\\Controllers\\Voyager\\VoyagerContestCategoryController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-12-02 16:40:05', '2023-01-18 17:28:56'),
(9, 'recipes', 'recipes', 'Recipe', 'Recipes', 'voyager-bread', 'App\\Models\\Recipe', NULL, 'App\\Http\\Controllers\\Voyager\\VoyagerRecipeController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-12-05 17:40:37', '2023-02-01 14:07:32'),
(10, 'votes', 'votes', 'Vote', 'Votes', 'voyager-bell', 'App\\Models\\Vote', NULL, 'App\\Http\\Controllers\\Voyager\\VoyagerVoteController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-03 17:16:47', '2023-01-04 03:58:20'),
(11, 'banners', 'banners', 'Banner', 'Banners', NULL, 'App\\Models\\Banner', NULL, 'App\\Http\\Controllers\\Voyager\\VoyagerBannerController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-09 17:14:02', '2023-01-10 15:57:05'),
(12, 'vote_jury', 'vote-jury', 'Vote Jury', 'Vote Juries', 'voyager-bubble', 'App\\Models\\VoteJury', NULL, 'App\\Http\\Controllers\\Voyager\\VoyagerVoteJuryController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-13 16:35:41', '2023-01-16 15:34:56');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `linked_social_accounts`
--

CREATE TABLE `linked_social_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `linked_social_accounts`
--

INSERT INTO `linked_social_accounts` (`id`, `provider_id`, `user_id`, `provider_name`, `created_at`, `updated_at`) VALUES
(1, '8027681367275079', '57811f8a-da9e-43c4-9fc0-6ec031ef049b', 'facebook', '2024-05-27 19:13:27', '2024-05-27 19:13:27');

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-12-02 15:15:31', '2022-12-02 15:15:31'),
(2, 'front', '2023-01-09 08:58:55', '2023-01-09 08:58:55'),
(3, 'footer', '2023-01-10 18:28:03', '2023-01-10 18:28:03');

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-12-02 15:15:31', '2022-12-02 15:15:31', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 17, 3, '2022-12-02 15:15:31', '2022-12-02 17:19:39', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 17, 2, '2022-12-02 15:15:31', '2022-12-02 17:19:36', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 17, 1, '2022-12-02 15:15:31', '2022-12-02 17:19:25', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 3, '2022-12-02 15:15:31', '2022-12-02 17:19:52', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-12-02 15:15:31', '2022-12-02 17:19:16', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-12-02 15:15:31', '2022-12-02 17:19:16', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-12-02 15:15:31', '2022-12-02 17:19:16', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-12-02 15:15:31', '2022-12-02 17:19:16', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 17, 7, '2022-12-02 15:15:31', '2022-12-02 17:21:08', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 17, 6, '2022-12-02 15:15:32', '2022-12-02 17:19:52', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 17, 4, '2022-12-02 15:15:32', '2022-12-02 17:19:44', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 17, 5, '2022-12-02 15:15:32', '2022-12-02 17:19:49', 'voyager.pages.index', NULL),
(15, 1, 'Contestants', '', '_self', 'voyager-person', '#000000', NULL, 4, '2022-12-02 15:49:43', '2022-12-02 17:21:08', 'voyager.contestants.index', 'null'),
(16, 1, 'Contest Categories', '', '_self', 'voyager-categories', '#000000', NULL, 5, '2022-12-02 16:40:05', '2022-12-02 17:21:08', 'voyager.contest-categories.index', 'null'),
(17, 1, 'Administration', '#', '_self', 'voyager-key', '#000000', NULL, 2, '2022-12-02 17:18:47', '2022-12-02 17:19:21', NULL, ''),
(18, 1, 'Recipes', '', '_self', 'voyager-bread', '#000000', NULL, 6, '2022-12-05 17:40:37', '2022-12-05 17:43:12', 'voyager.recipes.index', 'null'),
(19, 1, 'Votes', '', '_self', 'voyager-bell', '#000000', NULL, 7, '2023-01-03 17:16:47', '2023-01-03 17:17:54', 'voyager.votes.index', 'null'),
(20, 2, 'Jury', '/jury-page', '_self', NULL, '#000000', NULL, 3, '2023-01-09 09:00:28', '2023-01-09 15:30:40', NULL, ''),
(21, 2, 'Ma vidéo', '/add-recipe', '_self', NULL, '#000000', NULL, 2, '2023-01-09 09:43:55', '2024-05-15 15:44:39', NULL, ''),
(22, 2, 'Accueil', '/', '_self', NULL, '#000000', NULL, 1, '2023-01-09 15:30:30', '2023-01-09 15:30:36', NULL, ''),
(23, 1, 'Banners', '', '_self', 'voyager-photo', '#000000', NULL, 8, '2023-01-09 17:14:02', '2023-01-09 17:16:08', 'voyager.banners.index', 'null'),
(24, 3, 'Reglement', '/reglement', '_self', NULL, '#000000', NULL, 9, '2023-01-10 18:30:43', '2023-01-10 18:30:43', NULL, ''),
(25, 3, 'Politique de confidentialités', '/privacy-policy', '_self', NULL, '#000000', NULL, 10, '2023-01-10 18:34:06', '2023-01-25 23:51:02', NULL, ''),
(26, 3, 'Terms and Conditions', '/terms-and-conditions', '_self', NULL, '#000000', NULL, 11, '2023-01-10 18:41:07', '2023-01-25 23:52:01', NULL, ''),
(27, 1, 'Vote Juries', '', '_self', 'voyager-bubble', NULL, NULL, 12, '2023-01-13 16:35:41', '2023-01-13 16:35:41', 'voyager.vote-jury.index', NULL),
(28, 2, 'Top Candidat', '/top', '_self', NULL, '#000000', NULL, 13, '2023-01-16 18:36:49', '2023-01-16 18:36:49', NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(29, '2023_01_05_165856_create_visits_table', 2),
(30, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(31, '2024_05_24_174104_create_constest_categories_table', 4),
(32, '2024_05_24_174104_create_contest_categories_table', 5),
(33, '2024_05_24_174322_create_recipes_table', 6),
(35, '2024_05_27_162952_create_linked_social_accounts_table', 7);

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE `pages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
('3bbaa46f-150c-4877-a0c1-81bf1ea2b3a1', 'b2845b3f-1105-496d-87bb-e1068c0881c4', 'Privacy Policy', 'Privacy Policy', '<h1>Privacy Policy</h1>\n<p>Last updated: January 25, 2023</p>\n<p>This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.</p>\n<p>We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the <a href=\"https://www.freeprivacypolicy.com/free-privacy-policy-generator/\" target=\"_blank\" rel=\"noopener\">Free Privacy Policy Generator</a>.</p>\n<h1>Interpretation and Definitions</h1>\n<h2>Interpretation</h2>\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\n<h2>Definitions</h2>\n<p>For the purposes of this Privacy Policy:</p>\n<ul>\n<li>\n<p><strong>Account</strong> means a unique account created for You to access our Service or parts of our Service.</p>\n</li>\n<li>\n<p><strong>Affiliate</strong> means an entity that controls, is controlled by or is under common control with a party, where \"control\" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.</p>\n</li>\n<li>\n<p><strong>Company</strong> (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to Top P&acirc;tissier.</p>\n</li>\n<li>\n<p><strong>Cookies</strong> are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.</p>\n</li>\n<li>\n<p><strong>Country</strong> refers to: C&ocirc;te d&rsquo;Ivoire</p>\n</li>\n<li>\n<p><strong>Device</strong> means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p>\n</li>\n<li>\n<p><strong>Personal Data</strong> is any information that relates to an identified or identifiable individual.</p>\n</li>\n<li>\n<p><strong>Service</strong> refers to the Website.</p>\n</li>\n<li>\n<p><strong>Service Provider</strong> means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.</p>\n</li>\n<li>\n<p><strong>Usage Data</strong> refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).</p>\n</li>\n<li>\n<p><strong>Website</strong> refers to Top P&acirc;tissier, accessible from <a href=\"https://top-patissier.net\" target=\"_blank\" rel=\"external nofollow noopener\">https://top-patissier.net</a></p>\n</li>\n<li>\n<p><strong>You</strong> means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>\n</li>\n</ul>\n<h1>Collecting and Using Your Personal Data</h1>\n<h2>Types of Data Collected</h2>\n<h3>Personal Data</h3>\n<p>While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:</p>\n<ul>\n<li>\n<p>Email address</p>\n</li>\n<li>\n<p>Usage Data</p>\n</li>\n</ul>\n<h3>Usage Data</h3>\n<p>Usage Data is collected automatically when using the Service.</p>\n<p>Usage Data may include information such as Your Device\'s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.</p>\n<p>When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.</p>\n<p>We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.</p>\n<h3>Tracking Technologies and Cookies</h3>\n<p>We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:</p>\n<ul>\n<li><strong>Cookies or Browser Cookies.</strong> A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.</li>\n<li><strong>Web Beacons.</strong> Certain sections of our Service and our emails may contain small electronic files known as web beacons (also referred to as clear gifs, pixel tags, and single-pixel gifs) that permit the Company, for example, to count users who have visited those pages or opened an email and for other related website statistics (for example, recording the popularity of a certain section and verifying system and server integrity).</li>\n</ul>\n<p>Cookies can be \"Persistent\" or \"Session\" Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser. Learn more about cookies on the <a href=\"https://www.freeprivacypolicy.com/blog/sample-privacy-policy-template/#Use_Of_Cookies_And_Tracking\" target=\"_blank\" rel=\"noopener\">Free Privacy Policy website</a> article.</p>\n<p>We use both Session and Persistent Cookies for the purposes set out below:</p>\n<ul>\n<li>\n<p><strong>Necessary / Essential Cookies</strong></p>\n<p>Type: Session Cookies</p>\n<p>Administered by: Us</p>\n<p>Purpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.</p>\n</li>\n<li>\n<p><strong>Cookies Policy / Notice Acceptance Cookies</strong></p>\n<p>Type: Persistent Cookies</p>\n<p>Administered by: Us</p>\n<p>Purpose: These Cookies identify if users have accepted the use of cookies on the Website.</p>\n</li>\n<li>\n<p><strong>Functionality Cookies</strong></p>\n<p>Type: Persistent Cookies</p>\n<p>Administered by: Us</p>\n<p>Purpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.</p>\n</li>\n</ul>\n<p>For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy or the Cookies section of our Privacy Policy.</p>\n<h2>Use of Your Personal Data</h2>\n<p>The Company may use Personal Data for the following purposes:</p>\n<ul>\n<li>\n<p><strong>To provide and maintain our Service</strong>, including to monitor the usage of our Service.</p>\n</li>\n<li>\n<p><strong>To manage Your Account:</strong> to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.</p>\n</li>\n<li>\n<p><strong>For the performance of a contract:</strong> the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.</p>\n</li>\n<li>\n<p><strong>To contact You:</strong> To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application\'s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.</p>\n</li>\n<li>\n<p><strong>To provide You</strong> with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.</p>\n</li>\n<li>\n<p><strong>To manage Your requests:</strong> To attend and manage Your requests to Us.</p>\n</li>\n<li>\n<p><strong>For business transfers:</strong> We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.</p>\n</li>\n<li>\n<p><strong>For other purposes</strong>: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.</p>\n</li>\n</ul>\n<p>We may share Your personal information in the following situations:</p>\n<ul>\n<li><strong>With Service Providers:</strong> We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.</li>\n<li><strong>For business transfers:</strong> We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.</li>\n<li><strong>With Affiliates:</strong> We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.</li>\n<li><strong>With business partners:</strong> We may share Your information with Our business partners to offer You certain products, services or promotions.</li>\n<li><strong>With other users:</strong> when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside.</li>\n<li><strong>With Your consent</strong>: We may disclose Your personal information for any other purpose with Your consent.</li>\n</ul>\n<h2>Retention of Your Personal Data</h2>\n<p>The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.</p>\n<p>The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.</p>\n<h2>Transfer of Your Personal Data</h2>\n<p>Your information, including Personal Data, is processed at the Company\'s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to &mdash; and maintained on &mdash; computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.</p>\n<p>Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.</p>\n<p>The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.</p>\n<h2>Delete Your Personal Data</h2>\n<p>You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.</p>\n<p>Our Service may give You the ability to delete certain information about You from within the Service.</p>\n<p>You may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.</p>\n<p>Please note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.</p>\n<h2>Disclosure of Your Personal Data</h2>\n<h3>Business Transactions</h3>\n<p>If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.</p>\n<h3>Law enforcement</h3>\n<p>Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).</p>\n<h3>Other legal requirements</h3>\n<p>The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:</p>\n<ul>\n<li>Comply with a legal obligation</li>\n<li>Protect and defend the rights or property of the Company</li>\n<li>Prevent or investigate possible wrongdoing in connection with the Service</li>\n<li>Protect the personal safety of Users of the Service or the public</li>\n<li>Protect against legal liability</li>\n</ul>\n<h2>Security of Your Personal Data</h2>\n<p>The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.</p>\n<h1>Children\'s Privacy</h1>\n<p>Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.</p>\n<p>If We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent\'s consent before We collect and use that information.</p>\n<h1>Links to Other Websites</h1>\n<p>Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party\'s site. We strongly advise You to review the Privacy Policy of every site You visit.</p>\n<p>We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.</p>\n<h1>Changes to this Privacy Policy</h1>\n<p>We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.</p>\n<p>We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the \"Last updated\" date at the top of this Privacy Policy.</p>\n<p>You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</p>\n<h1>Contact Us</h1>\n<p>If you have any questions about this Privacy Policy, You can contact us:</p>\n<ul>\n<li>By email: henri@bigfiveabidjan.com</li>\n</ul>', NULL, 'privacy-policy', 'Politique de confidentialité', 'Politique de confidentialité', 'ACTIVE', '2023-01-10 18:33:02', '2023-01-25 23:39:41'),
('68b48d1e-f7df-446d-80cb-d44d2891bcab', 'b2845b3f-1105-496d-87bb-e1068c0881c4', 'Terms and Conditions', 'Conditions d\'utilisation', '<h1>Terms and Conditions</h1>\n<p>Last updated: January 26, 2023</p>\n<p>Please read these terms and conditions carefully before using Our Service.</p>\n<h1>Interpretation and Definitions</h1>\n<h2>Interpretation</h2>\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\n<h2>Definitions</h2>\n<p>For the purposes of these Terms and Conditions:</p>\n<ul>\n<li>\n<p><strong>Affiliate</strong> means an entity that controls, is controlled by or is under common control with a party, where \"control\" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.</p>\n</li>\n<li>\n<p><strong>Country</strong> refers to: C&ocirc;te d&rsquo;Ivoire</p>\n</li>\n<li>\n<p><strong>Company</strong> (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to top patissier.</p>\n</li>\n<li>\n<p><strong>Device</strong> means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p>\n</li>\n<li>\n<p><strong>Service</strong> refers to the Website.</p>\n</li>\n<li>\n<p><strong>Terms and Conditions</strong> (also referred as \"Terms\") mean these Terms and Conditions that form the entire agreement between You and the Company regarding the use of the Service. This Terms and Conditions agreement has been created with the help of the <a href=\"https://www.freeprivacypolicy.com/free-terms-and-conditions-generator/\" target=\"_blank\" rel=\"noopener\">Free Terms and Conditions Generator</a>.</p>\n</li>\n<li>\n<p><strong>Third-party Social Media Service</strong> means any services or content (including data, information, products or services) provided by a third-party that may be displayed, included or made available by the Service.</p>\n</li>\n<li>\n<p><strong>Website</strong> refers to top patissier, accessible from <a href=\"https://top-patissier.net/\" target=\"_blank\" rel=\"external nofollow noopener\">https://top-patissier.net/</a></p>\n</li>\n<li>\n<p><strong>You</strong> means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>\n</li>\n</ul>\n<h1>Acknowledgment</h1>\n<p>These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.</p>\n<p>Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.</p>\n<p>By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.</p>\n<p>You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.</p>\n<p>Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.</p>\n<h1>Links to Other Websites</h1>\n<p>Our Service may contain links to third-party web sites or services that are not owned or controlled by the Company.</p>\n<p>The Company has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such web sites or services.</p>\n<p>We strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or services that You visit.</p>\n<h1>Termination</h1>\n<p>We may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.</p>\n<p>Upon termination, Your right to use the Service will cease immediately.</p>\n<h1>Limitation of Liability</h1>\n<p>Notwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven\'t purchased anything through the Service.</p>\n<p>To the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.</p>\n<p>Some states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party\'s liability will be limited to the greatest extent permitted by law.</p>\n<h1>\"AS IS\" and \"AS AVAILABLE\" Disclaimer</h1>\n<p>The Service is provided to You \"AS IS\" and \"AS AVAILABLE\" and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, the Company, on its own behalf and on behalf of its Affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory or otherwise, with respect to the Service, including all implied warranties of merchantability, fitness for a particular purpose, title and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage or trade practice. Without limitation to the foregoing, the Company provides no warranty or undertaking, and makes no representation of any kind that the Service will meet Your requirements, achieve any intended results, be compatible or work with any other software, applications, systems or services, operate without interruption, meet any performance or reliability standards or be error free or that any errors or defects can or will be corrected.</p>\n<p>Without limiting the foregoing, neither the Company nor any of the company\'s provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the Service, or the information, content, and materials or products included thereon; (ii) that the Service will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the Service; or (iv) that the Service, its servers, the content, or e-mails sent from or on behalf of the Company are free of viruses, scripts, trojan horses, worms, malware, timebombs or other harmful components.</p>\n<p>Some jurisdictions do not allow the exclusion of certain types of warranties or limitations on applicable statutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to You. But in such a case the exclusions and limitations set forth in this section shall be applied to the greatest extent enforceable under applicable law.</p>\n<h1>Governing Law</h1>\n<p>The laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service. Your use of the Application may also be subject to other local, state, national, or international laws.</p>\n<h1>Disputes Resolution</h1>\n<p>If You have any concern or dispute about the Service, You agree to first try to resolve the dispute informally by contacting the Company.</p>\n<h1>For European Union (EU) Users</h1>\n<p>If You are a European Union consumer, you will benefit from any mandatory provisions of the law of the country in which you are resident in.</p>\n<h1>United States Legal Compliance</h1>\n<p>You represent and warrant that (i) You are not located in a country that is subject to the United States government embargo, or that has been designated by the United States government as a \"terrorist supporting\" country, and (ii) You are not listed on any United States government list of prohibited or restricted parties.</p>\n<h1>Severability and Waiver</h1>\n<h2>Severability</h2>\n<p>If any provision of these Terms is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect.</p>\n<h2>Waiver</h2>\n<p>Except as provided herein, the failure to exercise a right or to require performance of an obligation under these Terms shall not effect a party\'s ability to exercise such right or require such performance at any time thereafter nor shall the waiver of a breach constitute a waiver of any subsequent breach.</p>\n<h1>Translation Interpretation</h1>\n<p>These Terms and Conditions may have been translated if We have made them available to You on our Service. You agree that the original English text shall prevail in the case of a dispute.</p>\n<h1>Changes to These Terms and Conditions</h1>\n<p>We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days\' notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.</p>\n<p>By continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service.</p>\n<h1>Contact Us</h1>\n<p>If you have any questions about these Terms and Conditions, You can contact us:</p>\n<ul>\n<li>By email: henri@bigfiveabidjan.com</li>\n</ul>', NULL, 'terms-and-conditions', 'conditions-d-utilisation', 'conditions-d-utilisation', 'ACTIVE', '2023-01-10 18:40:15', '2023-01-26 00:20:36'),
('6e51459e-9820-4df4-af0e-4e3efc6af2ef', 'b2845b3f-1105-496d-87bb-e1068c0881c4', 'Reglement', 'deeded', '<p><strong>R&Egrave;GLEMENT JEU CONCOURS JACKPOT NO&Euml;L</strong></p>\n<p><strong><span style=\"text-decoration: underline;\">Article 1 :</span> Objet </strong></p>\n<p>La soci&eacute;t&eacute; SANIA Cie, Soci&eacute;t&eacute; Anonyme avec conseil d&rsquo;administration au capital de 44.110.000.000 FCFA, dont le si&egrave;ge social est sis &agrave; Abidjan Zone Industrielle de Vridi, 01 BP 2949 Abidjan 01, inscrite au Registre du Commerce et du Cr&eacute;dit Immobilier d&rsquo;Abidjan sous le num&eacute;ro CI-ABJ-08-M2-13989, T&eacute;l&eacute;phone : (225) 21 75 77 57 / Fax : (225) 21 75 77 87 repr&eacute;sent&eacute;e par Monsieur Coulibaly Lacina, en sa qualit&eacute; de Directeur G&eacute;n&eacute;ral, organise, un jeu concours.</p>\n<p>&laquo; Top patissier &raquo;</p>\n<p><strong><span style=\"text-decoration: underline;\">Article 2 </span>: Conditions de participation</strong></p>\n<p>La participation &agrave; ce jeu promotionnel est ouverte &agrave; toute personne physique ou morale r&eacute;sidant, ou de passage, en C&ocirc;te d&rsquo;Ivoire &agrave; l&rsquo;exclusion de :</p>\n<p>La soci&eacute;t&eacute; <strong>SANIA</strong></p>\n<p>L&rsquo;Agence de communication BIG FIVE ABIDJAN</p>\n<p>De leur personnel et des membres de leurs familles respectives</p>\n<p>Chaque participant joue en son nom propre.</p>\n<p>La participation au concours entra&icirc;ne l&rsquo;acceptation pure et simple du pr&eacute;sent R&egrave;glement, en toutes ses dispositions, ainsi que l&rsquo;acceptation de la collecte, de l\'enregistrement et de l&rsquo;utilisation par la Soci&eacute;t&eacute; Organisatrice des informations &agrave; caract&egrave;re nominatif et personnel donn&eacute;es par les candidats et n&eacute;cessaires pour les besoins de la gestion du concours.</p>\n<p>La participation au concours &eacute;tant limit&eacute;e &agrave; 1 participation, les candidats ne sont pas autoris&eacute;s &agrave; :</p>\n<ul>\n<li>Utiliser des dispositifs, logiciels, ou algorithme, incluant, mais ne se limitant pas aux virus, trojan, vers, attaque DDOS, VPN et tout autre moyen pouvant causer des dommages ou s\'opposer au bon fonctionnement du Site Web et de ses bases de donn&eacute;es, ou &agrave; n\'importe quelle transaction se d&eacute;roulant sur le Site Web, d\'intercepter et utiliser le syst&egrave;me, donn&eacute;es, ou informations personnelles du Site Web.</li>\n<li>Entreprendre des actions qui visent &agrave; surcharger notre syst&egrave;me, incluant, mais ne se limitant pas au &laquo; Spam &raquo; ou autre technique d\'envois d\'email massifs.</li>\n<li>Jouer avec plusieurs comptes diff&eacute;rents, pour une m&ecirc;me personne</li>\n</ul>\n<p>En cas de non-respect des r&egrave;gles ci-dessus cit&eacute;es, leur participation &agrave; Top P&acirc;tissier sera consid&eacute;r&eacute;e comme nulle et non existante. Les lots et r&eacute;compenses obtenues gr&acirc;ce aux moyens violant nos r&egrave;gles seront consid&eacute;r&eacute;es comme invalides. Enfin, en cas de rupture de l&rsquo;int&eacute;grit&eacute; des r&egrave;gles de notre syst&egrave;me, les concern&eacute;s ferotn l&rsquo;objet de poursuites judiciaires.</p>\n<p><strong><span style=\"text-decoration: underline;\">Article 3 :</span> P&eacute;riode du jeu</strong></p>\n<p>Le jeu concours se d&eacute;roulera du 15 d&eacute;cembre au 23 d&eacute;cembre 2022</p>\n<p><strong><span style=\"text-decoration: underline;\">Article 4 :</span> Principe du jeu concours</strong></p>\n<p>Le jeu concours consiste &agrave; lancer une animation qui permet de r&eacute;cup&eacute;rer des lots, lorsque l\'utilisateur obtient 3 fois le m&ecirc;me motif. L&rsquo;utilisateur ne peut pr&eacute;tendre &agrave; l&rsquo;obtention d&rsquo;un lot qu&rsquo;apr&egrave;s avoir lanc&eacute; l&rsquo;animation : toute combinaison gagnante apparaissant au lancement de la page web ne saurait faire l&rsquo;objet d&rsquo;une r&eacute;clamation en tant que lot gagn&eacute;.</p>\n<p><strong><span style=\"text-decoration: underline;\">Article 5 :</span> Retrait des lots</strong></p>\n<p>Tous les lots devront &ecirc;tre imp&eacute;rativement retir&eacute;s au si&egrave;ge de l&rsquo;agence <strong>BIG FIVE ABIDJAN. </strong>Une date de retrait sera communiqu&eacute;e aux gagnants. Ils devront alors se rendre &agrave; BIG FIVE ABIDJAN muni de leur pi&egrave;ce d&rsquo;identit&eacute; &agrave; la date indiqu&eacute;e.</p>\n<p>En cas d&rsquo;emp&ecirc;chement, une procuration l&eacute;galis&eacute;e &agrave; la mairie devra &ecirc;tre produite indiquant les noms et pr&eacute;noms, num&eacute;ro de t&eacute;l&eacute;phone, ainsi qu&rsquo;une copie de la CNI de celui qui devra retirer le lot en lieu et place du gagnant.</p>\n<p>Les lots ne seront ni repris, ni &eacute;chang&eacute;s ou transform&eacute;s ; ils ne pourront en aucun cas &ecirc;tre exp&eacute;di&eacute;s par voie postale.</p>\n<p><strong><span style=\"text-decoration: underline;\">Article 6 :</span> Obligations des gagnants</strong></p>\n<p>Les gagnants s&rsquo;engagent &agrave; permettre l&rsquo;exploitation de leur image, nom et voix sans pr&eacute;tendre &agrave; aucune indemnit&eacute; sp&eacute;ciale de ce fait. Ils acceptent de faire l&rsquo;objet de prises de vues et interviews qui seront utilis&eacute;es par SANIA dans le but exclusif de promouvoir et rendre compte du d&eacute;roulement de la promotion.</p>\n<p>La participation au jeu est subordonn&eacute;e &agrave; l&rsquo;acceptation de la condition pr&eacute;cit&eacute;e.</p>\n<p><strong><span style=\"text-decoration: underline;\">Article 7 :</span> R&egrave;glements des litiges</strong></p>\n<p>Tout litige n&eacute; de l&rsquo;interpr&eacute;tation ou de l&rsquo;application du pr&eacute;sent r&egrave;glement fera l&rsquo;objet d&rsquo;un arrangement &agrave; l&rsquo;amiable et devra &ecirc;tre transmis dans un d&eacute;lai d&rsquo;un mois &agrave; compter de la date de fin du jeu promotionnel et &agrave; d&eacute;faut d&rsquo;entente entre les parties, sera soumis aux Tribunaux d&rsquo;Abidjan</p>', NULL, 'reglement', 'edede edede', 'reglement', 'ACTIVE', '2023-01-10 18:29:55', '2023-01-26 17:42:01'),
('93ba8203-ce16-41a7-b55b-c6c372e7c30b', 'b2845b3f-1105-496d-87bb-e1068c0881c4', 'Jury', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.ggg</p>', 'pages/page1.jpg', 'jury-page', 'Membre du jury', 'Keyword1, Keyword2', 'ACTIVE', '2022-12-02 15:15:32', '2023-01-09 11:00:49');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('sikefouet@yahoo.com', '$2y$10$NgC5M2VIx/LviDkIUTHwFed26tzGlXWyKP5DMb/Vc6S/9g1clY3de', '2022-12-05 14:14:41'),
('okok@gmail.com', '$2y$10$S/ELSOR4KTW5PIgrNAb5D.6dssStjWRNnu76rhDihbasUNqHVrY9e', '2023-01-04 15:19:10'),
('sikefouet@gmail.com', '$2y$10$owjhFtAn.EnPNo6vD55rxus6UC5VIyPUjvBAjJ3rejDFBceUTXSWq', '2023-01-04 15:20:43');

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(2, 'browse_bread', NULL, '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(3, 'browse_database', NULL, '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(4, 'browse_media', NULL, '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(5, 'browse_compass', NULL, '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(6, 'browse_menus', 'menus', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(7, 'read_menus', 'menus', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(8, 'edit_menus', 'menus', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(9, 'add_menus', 'menus', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(10, 'delete_menus', 'menus', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(11, 'browse_roles', 'roles', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(12, 'read_roles', 'roles', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(13, 'edit_roles', 'roles', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(14, 'add_roles', 'roles', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(15, 'delete_roles', 'roles', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(16, 'browse_users', 'users', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(17, 'read_users', 'users', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(18, 'edit_users', 'users', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(19, 'add_users', 'users', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(20, 'delete_users', 'users', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(21, 'browse_settings', 'settings', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(22, 'read_settings', 'settings', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(23, 'edit_settings', 'settings', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(24, 'add_settings', 'settings', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(25, 'delete_settings', 'settings', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(26, 'browse_categories', 'categories', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(27, 'read_categories', 'categories', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(28, 'edit_categories', 'categories', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(29, 'add_categories', 'categories', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(30, 'delete_categories', 'categories', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(31, 'browse_posts', 'posts', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(32, 'read_posts', 'posts', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(33, 'edit_posts', 'posts', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(34, 'add_posts', 'posts', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(35, 'delete_posts', 'posts', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(36, 'browse_pages', 'pages', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(37, 'read_pages', 'pages', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(38, 'edit_pages', 'pages', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(39, 'add_pages', 'pages', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(40, 'delete_pages', 'pages', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
(41, 'browse_contestants', 'contestants', '2022-12-02 15:49:43', '2022-12-02 15:49:43'),
(42, 'read_contestants', 'contestants', '2022-12-02 15:49:43', '2022-12-02 15:49:43'),
(43, 'edit_contestants', 'contestants', '2022-12-02 15:49:43', '2022-12-02 15:49:43'),
(44, 'add_contestants', 'contestants', '2022-12-02 15:49:43', '2022-12-02 15:49:43'),
(45, 'delete_contestants', 'contestants', '2022-12-02 15:49:43', '2022-12-02 15:49:43'),
(46, 'browse_contest_categories', 'contest_categories', '2022-12-02 16:40:05', '2022-12-02 16:40:05'),
(47, 'read_contest_categories', 'contest_categories', '2022-12-02 16:40:05', '2022-12-02 16:40:05'),
(48, 'edit_contest_categories', 'contest_categories', '2022-12-02 16:40:05', '2022-12-02 16:40:05'),
(49, 'add_contest_categories', 'contest_categories', '2022-12-02 16:40:05', '2022-12-02 16:40:05'),
(50, 'delete_contest_categories', 'contest_categories', '2022-12-02 16:40:05', '2022-12-02 16:40:05'),
(51, 'browse_recipes', 'recipes', '2022-12-05 17:40:37', '2022-12-05 17:40:37'),
(52, 'read_recipes', 'recipes', '2022-12-05 17:40:37', '2022-12-05 17:40:37'),
(53, 'edit_recipes', 'recipes', '2022-12-05 17:40:37', '2022-12-05 17:40:37'),
(54, 'add_recipes', 'recipes', '2022-12-05 17:40:37', '2022-12-05 17:40:37'),
(55, 'delete_recipes', 'recipes', '2022-12-05 17:40:37', '2022-12-05 17:40:37'),
(56, 'browse_votes', 'votes', '2023-01-03 17:16:47', '2023-01-03 17:16:47'),
(57, 'read_votes', 'votes', '2023-01-03 17:16:47', '2023-01-03 17:16:47'),
(58, 'edit_votes', 'votes', '2023-01-03 17:16:47', '2023-01-03 17:16:47'),
(59, 'add_votes', 'votes', '2023-01-03 17:16:47', '2023-01-03 17:16:47'),
(60, 'delete_votes', 'votes', '2023-01-03 17:16:47', '2023-01-03 17:16:47'),
(61, 'browse_banners', 'banners', '2023-01-09 17:14:02', '2023-01-09 17:14:02'),
(62, 'read_banners', 'banners', '2023-01-09 17:14:02', '2023-01-09 17:14:02'),
(63, 'edit_banners', 'banners', '2023-01-09 17:14:02', '2023-01-09 17:14:02'),
(64, 'add_banners', 'banners', '2023-01-09 17:14:02', '2023-01-09 17:14:02'),
(65, 'delete_banners', 'banners', '2023-01-09 17:14:02', '2023-01-09 17:14:02'),
(66, 'browse_vote_jury', 'vote_jury', '2023-01-13 16:35:41', '2023-01-13 16:35:41'),
(67, 'read_vote_jury', 'vote_jury', '2023-01-13 16:35:41', '2023-01-13 16:35:41'),
(68, 'edit_vote_jury', 'vote_jury', '2023-01-13 16:35:41', '2023-01-13 16:35:41'),
(69, 'add_vote_jury', 'vote_jury', '2023-01-13 16:35:41', '2023-01-13 16:35:41'),
(70, 'delete_vote_jury', 'vote_jury', '2023-01-13 16:35:41', '2023-01-13 16:35:41');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
('1', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('10', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('11', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('12', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('13', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('14', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('15', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('16', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('17', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('18', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('19', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('2', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('20', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('21', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('22', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('23', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('24', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('25', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('26', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('27', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('28', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('29', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('3', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('30', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('31', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('32', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('33', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('34', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('35', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('36', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('37', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('38', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('39', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('4', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('40', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('41', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('42', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('43', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('44', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('45', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('46', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('47', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('48', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('49', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('5', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('50', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('51', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('52', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('53', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('54', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('55', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('56', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('57', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('58', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('59', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('6', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('60', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('61', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('62', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('63', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('64', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('65', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('66', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('67', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('68', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('69', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('7', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('70', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('8', '91b45615-3ac7-4124-8389-82e2cacc4d7a'),
('9', '91b45615-3ac7-4124-8389-82e2cacc4d7a');

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(2, 'App\\Models\\User', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', 'konan konan-AuthToken', '02ede6ff75599371c652377d2e40f5e08d3c6b03ef5d977db7a087374926af5b', '[\"*\"]', '2024-05-24 19:16:34', NULL, '2024-05-24 15:59:58', '2024-05-24 19:16:34'),
(3, 'App\\Models\\User', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', 'konan konan-AuthToken', 'c15d710abc1102a33f5268f0c03aa7435f66214ec381eeea7875b99156993c3c', '[\"*\"]', '2024-05-24 16:10:32', NULL, '2024-05-24 16:07:25', '2024-05-24 16:10:32'),
(4, 'App\\Models\\User', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', 'konan konan-AuthToken', 'd83c9f6b4d3996f3312eabafa832d91e314c60fa862e900640c2efa2d8b7f68b', '[\"*\"]', '2024-05-27 15:00:37', NULL, '2024-05-24 18:11:53', '2024-05-27 15:00:37'),
(5, 'App\\Models\\User', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', 'konan konan-AuthToken', '29f2c4fbb60d71328c8edc550ff917a42755b9183c71156aca5b1941b9e5939d', '[\"*\"]', '2024-05-24 18:48:00', NULL, '2024-05-24 18:46:57', '2024-05-24 18:48:00'),
(6, 'App\\Models\\User', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', 'konan konan-AuthToken', '98ed32093591549b898d0ba1d1046d50de4c019ca830f1f0f6149c3005f91be4', '[\"*\"]', '2024-05-27 15:02:49', NULL, '2024-05-24 18:48:14', '2024-05-27 15:02:49'),
(7, 'App\\Models\\User', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', 'konan konan-AuthToken', '19bae3d0fe5e45b0e5899b3ad09ce05a886a8ff14867d71c4aa835926d7d8727', '[\"*\"]', NULL, NULL, '2024-05-27 14:41:55', '2024-05-27 14:41:55'),
(8, 'App\\Models\\User', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', 'konan konan-AuthToken', '5f2e1f50b3a256056ef27777708cae677eb21d781c9eb2b08e0bd74cefd05c39', '[\"*\"]', '2024-05-27 15:22:59', NULL, '2024-05-27 15:03:13', '2024-05-27 15:22:59'),
(9, 'App\\Models\\User', '8eae2d7d-2e90-45b4-b2a8-91e510bb601e', 'API Token', '04b4d64a6ce420e71e69d990128d2db8e14d7c08a6ac5459e8dfd785e8194594', '[\"*\"]', NULL, NULL, '2024-05-27 19:05:36', '2024-05-27 19:05:36'),
(10, 'App\\Models\\User', '57811f8a-da9e-43c4-9fc0-6ec031ef049b', 'API Token', '3d5d2736439b0156f740a8de5a528b8dd930e5aa53ca0ad790dec05d4d736c28', '[\"*\"]', NULL, NULL, '2024-05-27 19:13:27', '2024-05-27 19:13:27'),
(11, 'App\\Models\\User', '57811f8a-da9e-43c4-9fc0-6ec031ef049b', 'API Token', 'dab04b3fa55fe63879aae9be3a6bbb815bc3099e7f6973fdb1a68076dbcdafef', '[\"*\"]', NULL, NULL, '2024-05-27 19:14:34', '2024-05-27 19:14:34'),
(12, 'App\\Models\\User', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', 'konan konan-AuthToken', '29346ce1c0bb69c4aa91dd882f0342cc284739c43f7f91b299ffa51a6ed3752c', '[\"*\"]', NULL, NULL, '2024-05-27 22:14:31', '2024-05-27 22:14:31'),
(13, 'App\\Models\\User', '57811f8a-da9e-43c4-9fc0-6ec031ef049b', 'API Token', '4d409b729472258dbbfab186da9ec16f16379acc0da9f6b6d12ec47628533416', '[\"*\"]', NULL, NULL, '2024-05-28 15:02:28', '2024-05-28 15:02:28'),
(14, 'App\\Models\\User', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', 'konan konan-AuthToken', '3f1194bc44a5f509d3d51c13d7ea188008fec6d9b40371c313b294a98c30226a', '[\"*\"]', NULL, NULL, '2024-05-28 15:02:53', '2024-05-28 15:02:53'),
(15, 'App\\Models\\User', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', 'konan konan-AuthToken', '4f1856fd0ee56bd24277b566f2b15e101ffb365433cc0a72b325f8f58349c56f', '[\"*\"]', '2024-05-30 15:28:33', NULL, '2024-05-30 15:24:12', '2024-05-30 15:28:33');

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
('1ce03b8a-9147-43e8-9de5-280b1705e7be', 'b2845b3f-1105-496d-87bb-e1068c0881c4', '2580fb90-c9ae-492a-a907-aaba3ce109d9', 'Latest Post 2222', '', 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post-2222', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-12-02 15:15:32', '2022-12-02 15:18:34'),
('616c46e0-9a93-4c6b-ac28-19796fc4702c', '0', NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('8f55a780-8b79-445a-899c-baa4876f4809', '0', NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('bc4f26f8-7029-4a21-921f-c6eabeb04893', '0', NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-12-02 15:15:32', '2022-12-02 15:15:32');

-- --------------------------------------------------------

--
-- Structure de la table `recipes`
--

CREATE TABLE `recipes` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lien_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipes`
--

INSERT INTO `recipes` (`id`, `user_id`, `category_id`, `images`, `id_video`, `lien_video`, `view_count`, `created_at`, `updated_at`) VALUES
('05c93f93-e504-4011-935f-faf5e85e5727', '0d12c4a6-7b46-4ebb-bea1-ef8232efbd4e', '8c3ee210-1c0c-41df-a66b-58af6131f513', '[\"recipes\\/July2024\\/test-copie-2.mp4\"]', NULL, NULL, NULL, '2024-07-10 09:36:11', '2024-07-10 09:36:11'),
('139a1fb0-f63d-48da-b085-27497b67a2c4', '57d3bcad-9d34-4afb-a7e3-3f92b4a8e2b6', '8c3ee210-1c0c-41df-a66b-58af6131f513', '[\"recipes\\/July2024\\/chapitosikitoys.mp4\"]', NULL, NULL, NULL, '2024-07-10 09:39:14', '2024-07-10 09:39:14'),
('2fdf2b04-00a6-4fb0-9573-92f94ebfc8d4', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', '8c3ee210-1c0c-41df-a66b-58af6131f513', '[\"recipes\\/July2024\\/test-copie-2.mp4\"]', NULL, NULL, 1, '2024-07-09 18:59:52', '2024-07-09 19:04:49'),
('58b47d73-8851-4575-a795-1ac6e8280acc', 'd7830b23-4e7a-4287-bd24-a4efd435c1e4', '8c3ee210-1c0c-41df-a66b-58af6131f513', '[\"recipes\\/July2024\\/ly-kem-keo-mut-va-cai-ket-shorts.mp4\"]', NULL, NULL, NULL, '2024-07-10 09:51:41', '2024-07-10 09:51:41'),
('7747afd8-fde8-4f25-adc5-4ea2d83e9872', '2e4cd43c-7b1d-43a7-8e7c-e6bf6aef3dbc', '8c3ee210-1c0c-41df-a66b-58af6131f513', '[\"recipes\\/July2024\\/chapitosikitoys.mp4\"]', NULL, NULL, NULL, '2024-07-10 09:57:42', '2024-07-10 09:57:42'),
('f1c17bc2-a556-4e98-bce5-af7d178d5523', '69407aac-dc9c-4d26-8073-171cf8b8b101', '8c3ee210-1c0c-41df-a66b-58af6131f513', '[\"recipes\\/July2024\\/ly-kem-keo-mut-va-cai-ket-shorts.mp4\"]', NULL, NULL, NULL, '2024-07-10 09:40:40', '2024-07-10 09:40:40');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`, `slug`) VALUES
('3ea25b05-bab7-40bf-8d5c-566c5588470e', 'contestant', 'Contestants', '2022-12-05 18:16:49', '2022-12-05 18:16:49', 'contestant'),
('889de597-9225-47d3-9b55-a66df7701426', 'jury_mystere', 'Jury Mystère', '2023-01-16 17:04:09', '2023-01-16 17:04:09', 'mistere'),
('91b45615-3ac7-4124-8389-82e2cacc4d7a', 'admin', 'Administrator', '2022-12-02 15:15:32', '2022-12-05 18:14:11', 'admin'),
('a7920298-8878-428a-b14d-c45edf0e21e1', 'user', 'Normal User', '2022-12-02 15:15:32', '2022-12-05 18:14:27', 'user'),
('c02835e9-c10a-4d14-82cb-a160c45d01f9', 'jury', 'Jury', '2023-01-16 13:57:26', '2023-01-16 13:57:26', 'jury');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Concours Vidéo', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Concours Vidéo', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/May2024/HUUGkBd6bflVlMmZb0iu.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/May2024/LxiLucP9As8b7Vi20MEP.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Concours Vidéo', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Concours Vidéo à Abidjan', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings/May2024/vI69TT9JnE8JzSeccV04.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/May2024/YC9ZOAfMDBbuSwYKczTC.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '650053435611-ira5n52fvhfm1t75v7jmrnevul2vhspe.apps.googleusercontent.com', '', 'text', 1, 'Admin'),
(11, 'site.favicon', 'Site favicon', 'settings/May2024/9N9icTrkKa2AB99BrjiG.png', NULL, 'image', 6, 'Site');

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

CREATE TABLE `translations` (
  `id` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
('03027f7c-dd3b-4805-8488-30e1a067993a', 'data_rows', 'display_name', '18', 'en', 'Created At', '2022-12-05 18:13:34', '2022-12-05 18:13:34'),
('05a0bce8-3be0-4a90-9701-214f28aba426', 'data_types', 'display_name_singular', '1', 'pt', 'Utilizador', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('0893a3a8-1b37-4771-b59e-e936779d9dde', 'data_types', 'display_name_singular', '9', 'en', 'Recipe', '2022-12-05 17:41:12', '2022-12-05 17:41:12'),
('091cba8f-9d35-43c0-8887-89849ac0013a', 'menu_items', 'title', '13', 'pt', 'Páginas', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('0e2e2dd3-e8c0-4547-a518-a232542074e3', 'categories', 'slug', '2580fb90-c9ae-492a-a907-aaba3ce109d9', 'pt', 'categoria-2', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('10b6678a-a3fd-4a40-b1b5-caf850d99da8', 'data_rows', 'display_name', '83', 'en', 'categories', '2022-12-05 17:45:48', '2022-12-05 17:45:48'),
('128402d9-a486-477b-850e-4439c9ede3ae', 'data_types', 'display_name_plural', '6', 'pt', 'Páginas', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('19d320f4-c6fb-4f0a-a4cc-45de138da4b9', 'data_types', 'display_name_singular', '6', 'pt', 'Página', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('1ae14b93-438a-46f5-95e4-afe6c55d6a18', 'data_types', 'display_name_plural', '3', 'pt', 'Funções', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('1b73c44e-d0d2-46ae-a168-416d3c00dae2', 'data_rows', 'display_name', '19', 'en', 'Updated At', '2022-12-05 18:13:34', '2022-12-05 18:13:34'),
('1c046e95-4444-4528-ac77-9df16b87af28', 'data_rows', 'display_name', '57', 'en', 'Last Name', '2022-12-02 15:54:12', '2022-12-02 15:54:12'),
('1d052fe8-c8fd-488d-8ff8-af34d883aded', 'data_rows', 'display_name', '78', 'en', 'User Id', '2022-12-05 17:41:12', '2022-12-05 17:41:12'),
('1ee328db-718a-4e37-91ff-e3b92349d396', 'data_rows', 'display_name', '16', 'en', 'ID', '2022-12-05 18:13:34', '2022-12-05 18:13:34'),
('2308112d-d892-486c-9037-6fa24ced7c34', 'pages', 'slug', '93ba8203-ce16-41a7-b55b-c6c372e7c30b', 'en', 'hello-world', '2022-12-02 15:18:19', '2022-12-02 15:18:19'),
('239b5cb9-cf53-48ac-89ec-fbd561ec8263', 'menu_items', 'title', '6', 'pt', 'Menus', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('2617955a-5c15-428b-8a7b-a34e44879d0c', 'posts', 'excerpt', '1ce03b8a-9147-43e8-9de5-280b1705e7be', 'en', 'This is the excerpt for the latest post', '2022-12-02 15:18:34', '2022-12-02 15:18:34'),
('278692ee-6e93-4bf6-bb0d-863d41e32e29', 'menu_items', 'title', '5', 'pt', 'Ferramentas', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('27d94d90-e4c8-4f52-bdb5-88226d01325a', 'posts', 'slug', '1ce03b8a-9147-43e8-9de5-280b1705e7be', 'en', 'latest-post', '2022-12-02 15:18:34', '2022-12-02 15:18:34'),
('2a8224f4-490e-4724-96da-8cad93f74dc9', 'categories', 'slug', '7dfb1152-0d3a-4262-a5ef-971471ef8901', 'pt', 'categoria-1', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('2aa4baf3-c53c-4f62-ace3-fc8a4597dc7d', 'contest_categories', 'name', '92b12092-253d-42be-abf1-814e180a20f1', 'en', 'Manche 1', '2022-12-05 17:36:05', '2022-12-05 17:36:05'),
('2b76ff87-474e-41e4-ba21-81a5dc7d84ea', 'data_rows', 'display_name', '62', 'en', 'User Id', '2022-12-02 15:54:12', '2022-12-02 15:54:12'),
('2d7501f7-a769-49e2-bb06-7cf9b7badd80', 'data_types', 'display_name_singular', '3', 'pt', 'Função', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('2f1f7e27-6e11-483e-89ad-6b10c0378afc', 'data_types', 'display_name_plural', '9', 'en', 'Recipes', '2022-12-05 17:41:12', '2022-12-05 17:41:12'),
('307ad9db-98cd-4d36-8b9b-6bda97a7fb3e', 'data_types', 'display_name_plural', '3', 'en', 'Roles', '2022-12-05 18:13:34', '2022-12-05 18:13:34'),
('3405eb35-8f58-476e-9a98-a7dfede910ec', 'contest_categories', 'slug', '92b12092-253d-42be-abf1-814e180a20f1', 'en', 'manche-1', '2022-12-05 17:36:05', '2022-12-05 17:36:05'),
('35a380ed-eb18-4502-a63e-2db34c483371', 'menu_items', 'title', '10', 'pt', 'Configurações', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('365dac7a-15b7-4b09-980c-68f6b8ef324e', 'data_types', 'display_name_plural', '4', 'pt', 'Categorias', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('47e13664-2171-471e-8d9b-d05511f5b957', 'data_rows', 'display_name', '76', 'en', 'Active', '2022-12-05 17:34:24', '2022-12-05 17:34:24'),
('492a1390-441b-4d49-b876-36f204ba5bf9', 'data_rows', 'display_name', '84', 'en', 'users', '2022-12-05 17:45:48', '2022-12-05 17:45:48'),
('4db30700-c12a-4a77-b4a4-3de29a31c684', 'data_types', 'display_name_singular', '3', 'en', 'Role', '2022-12-05 18:13:34', '2022-12-05 18:13:34'),
('501c7a85-056c-434d-9ce3-c0e17215371b', 'data_rows', 'display_name', '72', 'en', 'Updated At', '2022-12-02 16:44:34', '2022-12-02 16:44:34'),
('552155cb-7a5b-42f2-9dec-cfae128b75a5', 'data_types', 'display_name_plural', '5', 'pt', 'Posts', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('5546e9e6-122a-4e2c-92e9-dc3d46312a65', 'data_types', 'display_name_singular', '8', 'en', 'Contest Category', '2022-12-02 16:44:34', '2022-12-02 16:44:34'),
('5aa51903-69ba-478a-9e39-efd26390dbc3', 'pages', 'title', '93ba8203-ce16-41a7-b55b-c6c372e7c30b', 'en', 'Hello World', '2022-12-02 15:18:19', '2022-12-02 15:18:19'),
('5b267dbb-8d78-4522-93f6-1ee8be61437e', 'data_types', 'display_name_singular', '5', 'pt', 'Post', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('5db4f48f-fc58-49db-ae93-ceca1db6c31c', 'categories', 'name', '2580fb90-c9ae-492a-a907-aaba3ce109d9', 'pt', 'Categoria 2', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('5fc8dc9e-7097-4b3c-af8e-37c205f7134c', 'menu_items', 'title', '11', 'pt', 'Categorias', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('63abac21-d7ab-42e3-950a-6f74bb28b630', 'data_rows', 'display_name', '65', 'en', 'users', '2022-12-02 15:54:12', '2022-12-02 15:54:12'),
('6cec324e-0da1-4843-a783-991954e4755e', 'data_rows', 'display_name', '59', 'en', 'Ville', '2022-12-02 15:54:12', '2022-12-02 15:54:12'),
('704d4d25-91ab-4802-a49c-2114249da98c', 'categories', 'name', '7dfb1152-0d3a-4262-a5ef-971471ef8901', 'pt', 'Categoria 1', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('72908c4f-2062-4e00-b9f4-abcfa5e94ce5', 'menu_items', 'title', '12', 'pt', 'Publicações', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('734f9122-6944-4104-9849-1a9ec4ffaede', 'data_rows', 'display_name', '74', 'en', 'Photo', '2022-12-02 17:15:56', '2022-12-02 17:15:56'),
('73683ac7-216b-4683-9e6e-21e64fb9942e', 'pages', 'body', '93ba8203-ce16-41a7-b55b-c6c372e7c30b', 'en', '<p>Hello World. Scallywag grog swab Cat onine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-12-02 15:18:19', '2022-12-02 15:18:19'),
('737c900a-d3b0-43f2-8f33-2e860e004e72', 'menu_items', 'title', '7', 'pt', 'Base de dados', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('79aac74b-e328-4387-8037-9a6b8ab7c4a2', 'data_rows', 'display_name', '77', 'en', 'Id', '2022-12-05 17:41:12', '2022-12-05 17:41:12'),
('7a8c10c5-8cce-4414-8dcf-269d92adde0e', 'data_rows', 'display_name', '80', 'en', 'Images', '2022-12-05 17:41:12', '2022-12-05 17:41:12'),
('822bfb9d-915c-4d6d-b8be-6b29405946da', 'posts', 'meta_keywords', '1ce03b8a-9147-43e8-9de5-280b1705e7be', 'en', 'keyword1, keyword2, keyword3', '2022-12-02 15:18:34', '2022-12-02 15:18:34'),
('863a9ad9-914c-4e83-a0ab-5e5d128a7306', 'data_types', 'display_name_singular', '2', 'pt', 'Menu', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('8a87e6e4-9fee-48c7-aac1-2013c1000e1a', 'data_rows', 'display_name', '64', 'en', 'Updated At', '2022-12-02 15:54:12', '2022-12-02 15:54:12'),
('8c3cf64b-a613-400f-bfbc-645feaf8c23d', 'menu_items', 'title', '15', 'en', 'Contestants', '2022-12-02 16:53:02', '2022-12-02 16:53:02'),
('8f5519bd-eb4e-4916-a3e3-23e35eecf172', 'data_rows', 'display_name', '60', 'en', 'Quartier', '2022-12-02 15:54:12', '2022-12-02 15:54:12'),
('95ba99b0-403a-4068-8ef2-cd6ec7be046a', 'menu_items', 'title', '1', 'pt', 'Painel de Controle', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('976daae3-6197-4666-b6d6-6ebfb8b815ea', 'data_rows', 'display_name', '20', 'en', 'Display Name', '2022-12-05 18:13:34', '2022-12-05 18:13:34'),
('9beac9d1-3a18-4fca-8449-29e04fa68a14', 'data_rows', 'display_name', '66', 'en', 'Id', '2022-12-02 16:44:34', '2022-12-02 16:44:34'),
('9bf0d674-9aa5-4edc-b329-fcaff3ce6117', 'data_types', 'display_name_plural', '7', 'en', 'Contestants', '2022-12-02 15:54:12', '2022-12-02 15:54:12'),
('a04a558b-3b07-43b5-a589-f4049b773298', 'pages', 'slug', '93ba8203-ce16-41a7-b55b-c6c372e7c30b', 'pt', 'ola-mundo', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('a59b80ee-3e1a-4ea3-9744-3bfb2d576bdc', 'posts', 'title', '1ce03b8a-9147-43e8-9de5-280b1705e7be', 'en', 'Latest Post', '2022-12-02 15:18:34', '2022-12-02 15:18:34'),
('a5ccd5a8-f8ca-4ce3-ab7a-3d3375bda505', 'data_rows', 'display_name', '82', 'en', 'Updated At', '2022-12-05 17:41:12', '2022-12-05 17:41:12'),
('aab70b26-5a10-4a95-9bab-676e4b359759', 'menu_items', 'title', '2', 'pt', 'Media', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('abf4488d-552d-40fb-b2ab-4ad96be3d2d5', 'data_rows', 'display_name', '79', 'en', 'Category Id', '2022-12-05 17:41:12', '2022-12-05 17:41:12'),
('af1f0e51-3a56-4b1d-984a-5b7890d04d6a', 'data_rows', 'display_name', '81', 'en', 'Created At', '2022-12-05 17:41:12', '2022-12-05 17:41:12'),
('afd7422b-3a38-482e-a603-36b5382f28d5', 'data_rows', 'display_name', '63', 'en', 'Created at', '2022-12-02 15:54:12', '2022-12-02 15:54:12'),
('b3015f96-48f5-48ca-8842-ddb85b63a7f5', 'pages', 'title', '93ba8203-ce16-41a7-b55b-c6c372e7c30b', 'pt', 'Olá Mundo', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('b792b492-bf09-4894-86a4-3e8d16efe09b', 'posts', 'meta_description', '1ce03b8a-9147-43e8-9de5-280b1705e7be', 'en', 'This is the meta description', '2022-12-02 15:18:34', '2022-12-02 15:18:34'),
('b9ed9301-18cf-44d4-81a3-1b846b2b392e', 'data_rows', 'display_name', '73', 'en', 'Telephone', '2022-12-02 17:15:56', '2022-12-02 17:15:56'),
('bba6581e-031d-472f-a13a-df7c88b89eaa', 'data_rows', 'display_name', '68', 'en', 'Name', '2022-12-02 16:44:34', '2022-12-02 16:44:34'),
('c2537d6a-fd30-4db1-8109-eb5bb2f04dcd', 'data_rows', 'display_name', '70', 'en', 'End Time', '2022-12-02 16:44:34', '2022-12-02 16:44:34'),
('c3684fe3-5a82-47ce-922b-d7fc0d794e09', 'data_rows', 'display_name', '58', 'en', 'First Name', '2022-12-02 15:54:12', '2022-12-02 15:54:12'),
('cbbec46c-6c60-4339-9791-67cb152012f3', 'data_rows', 'display_name', '69', 'en', 'Start Time', '2022-12-02 16:44:34', '2022-12-02 16:44:34'),
('cbd02298-bb47-41e7-b476-ad11ff42c1e9', 'data_types', 'display_name_plural', '8', 'en', 'Contest Categories', '2022-12-02 16:44:34', '2022-12-02 16:44:34'),
('ccaee875-24ba-4031-9dd1-a1c11c7a03c1', 'data_types', 'display_name_plural', '1', 'pt', 'Utilizadores', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('d2136f53-6ed4-4b3e-8c8a-1eefbc32b7ca', 'data_rows', 'display_name', '71', 'en', 'Created At', '2022-12-02 16:44:34', '2022-12-02 16:44:34'),
('d6d4fade-3535-4a17-ab4f-273d80ee0d3c', 'data_types', 'display_name_singular', '4', 'pt', 'Categoria', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('da67e97f-bc31-4777-9873-5605eaf8282a', 'data_rows', 'display_name', '61', 'en', 'Cgu', '2022-12-02 15:54:12', '2022-12-02 15:54:12'),
('dd70817b-920e-4899-ba3c-acc93acb627e', 'data_rows', 'display_name', '17', 'en', 'Name', '2022-12-05 18:13:34', '2022-12-05 18:13:34'),
('dde4ba4f-66b3-4e98-a853-2917f3c78850', 'data_types', 'display_name_plural', '2', 'pt', 'Menus', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('e023bda4-a8ac-4c3b-91d3-542e1eaabc8f', 'data_rows', 'display_name', '56', 'en', 'Id', '2022-12-02 15:54:12', '2022-12-02 15:54:12'),
('e1b3d8bf-c398-467e-a38e-33ecb5e5610d', 'menu_items', 'title', '16', 'en', 'Contest Categories', '2022-12-02 16:52:44', '2022-12-02 16:52:44'),
('e3defc70-dc8e-4559-87bf-c3805d914406', 'menu_items', 'title', '3', 'pt', 'Utilizadores', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('e8b3c529-aca7-46d9-8ef5-693b8a7938dc', 'menu_items', 'title', '18', 'en', 'Recipes', '2022-12-05 17:43:12', '2022-12-05 17:43:12'),
('e93daec6-09c2-4cab-bd41-5cc7e6a0e7a9', 'data_rows', 'display_name', '75', 'en', 'Bio', '2022-12-02 17:15:56', '2022-12-02 17:15:56'),
('eb53cb2b-2b42-4cca-aeb9-44874a50f1e3', 'data_rows', 'display_name', '85', 'en', 'Slug', '2022-12-05 18:16:13', '2022-12-05 18:16:13'),
('ecb4b9ee-7d2a-44f5-946f-8cf15f1ff306', 'posts', 'body', '1ce03b8a-9147-43e8-9de5-280b1705e7be', 'en', '<p>This is the body for the latest post</p>', '2022-12-02 15:18:34', '2022-12-02 15:18:34'),
('fa5fc0f8-7686-4237-aabb-6823aed2b52b', 'menu_items', 'title', '4', 'pt', 'Funções', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('fc1ebfb3-da92-4c3b-baa7-27acd25d6b84', 'pages', 'body', '93ba8203-ce16-41a7-b55b-c6c372e7c30b', 'pt', '<p>Olá Mundo. Scallywag grog swab Cat onine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-12-02 15:15:32', '2022-12-02 15:15:32'),
('fc4c2441-44a4-4b9d-aa8d-0424eef0cac4', 'data_rows', 'display_name', '67', 'en', 'Slug', '2022-12-02 16:44:34', '2022-12-02 16:44:34'),
('fca7c04b-564c-410b-a19c-59f6d6f72271', 'data_types', 'display_name_singular', '7', 'en', 'Contestant', '2022-12-02 15:54:12', '2022-12-02 15:54:12'),
('e9e427b1-e130-4182-96b5-e9b85548cc1a', 'data_rows', 'display_name', '1', 'en', 'ID', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('b9ef3d75-2e27-4136-ba65-095425d15c24', 'data_rows', 'display_name', '21', 'en', 'Role', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('56afee43-71fe-4ca9-931c-05ed5c178547', 'data_rows', 'display_name', '2', 'en', 'Name', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('e50334a3-aa4a-4d54-986c-c9091517dd48', 'data_rows', 'display_name', '3', 'en', 'Email', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('8930ad76-27fc-4600-82ae-89fe0ec927ec', 'data_rows', 'display_name', '8', 'en', 'Avatar', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('95ec93b6-5ccf-410d-95e1-d47aa731b55e', 'data_rows', 'display_name', '4', 'en', 'Password', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('9c1c0407-a7a4-4564-83cd-0eda4ab305c4', 'data_rows', 'display_name', '5', 'en', 'Remember Token', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('f9f13966-eb74-4446-ae53-b71d3dc6c7f5', 'data_rows', 'display_name', '11', 'en', 'Settings', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('ab20676d-cba2-4bc7-8c7d-ab10f7f4af23', 'data_rows', 'display_name', '6', 'en', 'Created At', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('4129fffa-26e8-4d35-8046-d80abc52b2ae', 'data_rows', 'display_name', '7', 'en', 'Updated At', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('8699ee85-ba2e-4854-9d5d-15d65024f827', 'data_rows', 'display_name', '9', 'en', 'Role', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('ffc91a91-75ca-435a-9a28-1fccf50e71f5', 'data_rows', 'display_name', '10', 'en', 'Roles', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('3b606aed-56ea-45c5-befb-8d1717c5fadf', 'data_types', 'display_name_singular', '1', 'en', 'User', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('ae6e8836-a866-423b-817f-22a3aaa82e2c', 'data_types', 'display_name_plural', '1', 'en', 'Users', '2023-01-02 11:36:47', '2023-01-02 11:36:47'),
('6b0d6d58-a802-4920-a41d-5f9aa710e88f', 'data_rows', 'display_name', '90', 'en', 'Id', '2023-01-03 17:17:35', '2023-01-03 17:17:35'),
('ef4b5d40-cc0a-4db3-9bd7-601668c8fb0f', 'data_rows', 'display_name', '91', 'en', 'Ip', '2023-01-03 17:17:35', '2023-01-03 17:17:35'),
('170f23f6-9997-48fc-8419-c39454efefaa', 'data_rows', 'display_name', '92', 'en', 'Votes', '2023-01-03 17:17:35', '2023-01-03 17:17:35'),
('c48dfbbc-a0c4-405d-a889-dbb84847d03e', 'data_rows', 'display_name', '93', 'en', 'User Id', '2023-01-03 17:17:35', '2023-01-03 17:17:35'),
('c8446cb4-5ca7-4340-8224-4614c92d70ec', 'data_rows', 'display_name', '94', 'en', 'Category Id', '2023-01-03 17:17:35', '2023-01-03 17:17:35'),
('9bf90387-f760-4939-9283-bfac94cc7b98', 'data_rows', 'display_name', '95', 'en', 'Recipe Id', '2023-01-03 17:17:35', '2023-01-03 17:17:35'),
('3876b103-f855-4725-91ee-644a8bc9fe52', 'data_rows', 'display_name', '96', 'en', 'Created At', '2023-01-03 17:17:35', '2023-01-03 17:17:35'),
('123c0cbd-8460-4ba8-98a2-49f194414243', 'data_rows', 'display_name', '97', 'en', 'Updated At', '2023-01-03 17:17:35', '2023-01-03 17:17:35'),
('810176b1-88d6-4d22-ad9b-c82fa99f06fb', 'data_types', 'display_name_singular', '10', 'en', 'Vote', '2023-01-03 17:17:35', '2023-01-03 17:17:35'),
('9d53f283-fc09-424b-afd6-7be7b681a71e', 'data_types', 'display_name_plural', '10', 'en', 'Votes', '2023-01-03 17:17:35', '2023-01-03 17:17:35'),
('d90653c1-b99f-47bd-a9ca-b8355be24066', 'menu_items', 'title', '19', 'en', 'Votes', '2023-01-03 17:17:54', '2023-01-03 17:17:54'),
('96180774-8feb-419d-9cb1-a5c78ca8cd56', 'data_rows', 'display_name', '98', 'en', 'categories', '2023-01-03 17:22:18', '2023-01-03 17:22:18'),
('29c5db43-2a20-41ed-b53f-0ef3c976ca28', 'data_rows', 'display_name', '99', 'en', 'recipes', '2023-01-03 17:22:18', '2023-01-03 17:22:18'),
('924f26e6-c3e0-4d35-abf3-c7aa973a3522', 'data_rows', 'display_name', '100', 'en', 'users', '2023-01-03 17:22:18', '2023-01-03 17:22:18'),
('cc7435dc-833f-4870-8310-6cd51099a997', 'data_rows', 'display_name', '101', 'en', 'Last Vote', '2023-01-04 03:37:00', '2023-01-04 03:37:00'),
('d7762a7d-c7d2-492f-aee9-bcc75efec073', 'data_rows', 'display_name', '102', 'en', 'Owner Id', '2023-01-04 03:49:35', '2023-01-04 03:49:35'),
('6bef9f10-03b4-4bd0-a1be-cd8387857347', 'data_rows', 'display_name', '103', 'en', 'users', '2023-01-04 03:49:35', '2023-01-04 03:49:35'),
('825daa59-b900-4153-b3ac-46e2f00cf316', 'menu_items', 'title', '20', 'en', 'Jury', '2023-01-09 09:00:47', '2023-01-09 11:06:58'),
('ed1f0763-f591-4c13-aca0-1e72250debc4', 'menu_items', 'title', '22', 'en', 'Home', '2023-01-09 15:30:30', '2023-01-09 15:30:30'),
('4dec704a-fce8-4b4d-aeaa-aed5c8997691', 'menu_items', 'title', '21', 'en', 'My Video', '2023-01-09 15:31:13', '2024-05-15 15:45:35'),
('e1591c0a-d655-4504-8a63-49834c4c89a4', 'menu_items', 'title', '23', 'en', 'Banners', '2023-01-09 17:16:08', '2023-01-09 17:16:08'),
('71d5f9d2-02b0-4887-a6f8-91c40e7396ce', 'data_rows', 'display_name', '104', 'en', 'Id', '2023-01-09 17:24:45', '2023-01-09 17:24:45'),
('d8a016bf-825f-45d4-ac30-c8dee877f022', 'data_rows', 'display_name', '105', 'en', 'Image', '2023-01-09 17:24:45', '2023-01-09 17:24:45'),
('78e8c37d-6006-4456-840b-844dd008a475', 'data_rows', 'display_name', '106', 'en', 'Active', '2023-01-09 17:24:45', '2023-01-09 17:24:45'),
('d6ec5194-668d-41ec-80cb-9c4456e6532d', 'data_rows', 'display_name', '107', 'en', 'Created At', '2023-01-09 17:24:45', '2023-01-09 17:24:45'),
('a5432200-6bda-4fd1-a5a9-d5570d70c39a', 'data_rows', 'display_name', '108', 'en', 'Updated At', '2023-01-09 17:24:45', '2023-01-09 17:24:45'),
('3a7c4a7e-148a-4282-a836-0308da30d817', 'data_rows', 'display_name', '109', 'en', 'Category Id', '2023-01-09 17:24:45', '2023-01-09 17:24:45'),
('57a0101d-8755-41f1-8dc5-9a0d5ebc918c', 'data_rows', 'display_name', '110', 'en', 'contest_categories', '2023-01-09 17:24:45', '2023-01-09 17:24:45'),
('8894093f-597b-47f7-8c82-9274d74bc13c', 'data_types', 'display_name_singular', '11', 'en', 'Banner', '2023-01-09 17:24:45', '2023-01-09 17:24:45'),
('1686f079-513c-4b17-809a-f763bec594e6', 'data_types', 'display_name_plural', '11', 'en', 'Banners', '2023-01-09 17:24:45', '2023-01-09 17:24:45'),
('33188886-fe5e-4288-9f20-ec5b1fa29796', 'data_rows', 'display_name', '111', 'en', 'Description', '2023-01-09 17:59:31', '2023-01-09 17:59:31'),
('12ec4d73-00e3-42e4-9087-906e16092886', 'data_rows', 'display_name', '112', 'en', 'Start Recipe', '2023-01-10 14:42:47', '2023-01-10 14:42:47'),
('e60a3622-db28-4b7a-aee6-42d4ad13d104', 'data_rows', 'display_name', '113', 'en', 'End Recipe', '2023-01-10 14:42:47', '2023-01-10 14:42:47'),
('b913f11f-31bc-463d-b786-5df972a099f9', 'data_rows', 'display_name', '114', 'en', 'Type', '2023-01-10 15:57:05', '2023-01-10 15:57:05'),
('0d05db1c-f806-44c8-83eb-4f2d0aedf58b', 'data_rows', 'display_name', '115', 'en', 'Start Vote', '2023-01-10 17:44:55', '2023-01-10 17:44:55'),
('1bbf7a1c-6ecb-45c4-abd3-406fcf6dbac6', 'data_rows', 'display_name', '116', 'en', 'End Vote', '2023-01-10 17:44:55', '2023-01-10 17:44:55'),
('bfbae08c-f019-4c2f-b70b-8a32c2510706', 'menu_items', 'title', '24', 'en', 'Reglement', '2023-01-10 18:30:43', '2023-01-10 18:30:43'),
('08afe46c-46c2-48c6-a445-bcd5c3100f94', 'menu_items', 'title', '25', 'en', 'Privacy policy', '2023-01-10 18:34:06', '2023-01-25 23:51:02'),
('844515ff-b14e-4922-b220-0b9b6786da3b', 'data_types', 'display_name_singular', '12', 'en', 'Vote Jury', '2023-01-13 16:40:43', '2023-01-13 16:40:43'),
('81752a69-2b8a-42e4-97d1-1e46bd4a7d72', 'data_types', 'display_name_plural', '12', 'en', 'Vote Juries', '2023-01-13 16:40:43', '2023-01-13 16:40:43'),
('0937dae7-8e6d-4966-a6c2-217ed4eaf20e', 'data_rows', 'display_name', '117', 'en', 'Id', '2023-01-16 15:26:51', '2023-01-16 15:26:51'),
('c7eaa4cf-e8f6-4ea6-9e23-a2b27a4afd9c', 'data_rows', 'display_name', '118', 'en', 'Votes', '2023-01-16 15:26:51', '2023-01-16 15:26:51'),
('4bbb7ea7-d0ec-47c5-86ed-0c03e49d7860', 'data_rows', 'display_name', '119', 'en', 'Jury', '2023-01-16 15:26:51', '2023-01-16 15:26:51'),
('fcb30eaa-a15c-4f77-a8ca-99391d75bb64', 'data_rows', 'display_name', '120', 'en', 'Categorie', '2023-01-16 15:26:51', '2023-01-16 15:26:51'),
('caa3e79c-dd7b-487f-8c16-907a2487dc49', 'data_rows', 'display_name', '121', 'en', 'Recipe', '2023-01-16 15:26:51', '2023-01-16 15:26:51'),
('3008ea23-7869-4503-a1ca-b5ec793b427f', 'data_rows', 'display_name', '122', 'en', 'Candidat', '2023-01-16 15:26:51', '2023-01-16 15:26:51'),
('69bada13-6b16-4711-ac5a-38a591d732d1', 'data_rows', 'display_name', '123', 'en', 'Date de vote', '2023-01-16 15:26:51', '2023-01-16 15:26:51'),
('73d2630b-223e-40dd-bba6-7742bc89de48', 'data_rows', 'display_name', '124', 'en', 'Updated At', '2023-01-16 15:26:51', '2023-01-16 15:26:51'),
('9bd4c4a9-cdd4-42ee-a79e-9511f924583f', 'data_rows', 'display_name', '125', 'en', 'users', '2023-01-16 15:26:51', '2023-01-16 15:26:51'),
('c76a5ff5-5f09-4944-b56c-dc614184b386', 'data_rows', 'display_name', '126', 'en', 'contest_categories', '2023-01-16 15:28:09', '2023-01-16 15:28:09'),
('41fa06a0-4fd5-4a8b-9cf0-38f85e4dbb20', 'data_rows', 'display_name', '127', 'en', 'recipes', '2023-01-16 15:30:13', '2023-01-16 15:30:13'),
('30033665-b11a-44f3-a314-a1736f7290ba', 'data_rows', 'display_name', '128', 'en', 'users', '2023-01-16 15:33:37', '2023-01-16 15:33:37'),
('ee33367d-4df2-4779-ae83-a66153988598', 'menu_items', 'title', '28', 'en', 'Top Constestant', '2023-01-16 18:36:49', '2023-01-16 18:36:49'),
('86fe8a79-79e5-454d-b936-c95945e89655', 'pages', 'title', '3bbaa46f-150c-4877-a0c1-81bf1ea2b3a1', 'en', 'Privacy Policy', '2023-01-25 23:39:41', '2023-01-25 23:49:09'),
('08a75d9e-4c63-4eb9-a52d-920467a2730c', 'pages', 'body', '3bbaa46f-150c-4877-a0c1-81bf1ea2b3a1', 'en', '<h1>Privacy Policy</h1>\n<p>Last updated: January 25, 2023</p>\n<p>This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.</p>\n<p>We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the <a href=\"https://www.freeprivacypolicy.com/free-privacy-policy-generator/\" target=\"_blank\" rel=\"noopener\">Free Privacy Policy Generator</a>.</p>\n<h1>Interpretation and Definitions</h1>\n<h2>Interpretation</h2>\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\n<h2>Definitions</h2>\n<p>For the purposes of this Privacy Policy:</p>\n<ul>\n<li>\n<p><strong>Account</strong> means a unique account created for You to access our Service or parts of our Service.</p>\n</li>\n<li>\n<p><strong>Affiliate</strong> means an entity that controls, is controlled by or is under common control with a party, where \"control\" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.</p>\n</li>\n<li>\n<p><strong>Company</strong> (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to Top P&acirc;tissier.</p>\n</li>\n<li>\n<p><strong>Cookies</strong> are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.</p>\n</li>\n<li>\n<p><strong>Country</strong> refers to: C&ocirc;te d&rsquo;Ivoire</p>\n</li>\n<li>\n<p><strong>Device</strong> means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p>\n</li>\n<li>\n<p><strong>Personal Data</strong> is any information that relates to an identified or identifiable individual.</p>\n</li>\n<li>\n<p><strong>Service</strong> refers to the Website.</p>\n</li>\n<li>\n<p><strong>Service Provider</strong> means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.</p>\n</li>\n<li>\n<p><strong>Usage Data</strong> refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).</p>\n</li>\n<li>\n<p><strong>Website</strong> refers to Top P&acirc;tissier, accessible from <a href=\"https://top-patissier.net\" target=\"_blank\" rel=\"external nofollow noopener\">https://top-patissier.net</a></p>\n</li>\n<li>\n<p><strong>You</strong> means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>\n</li>\n</ul>\n<h1>Collecting and Using Your Personal Data</h1>\n<h2>Types of Data Collected</h2>\n<h3>Personal Data</h3>\n<p>While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:</p>\n<ul>\n<li>\n<p>Email address</p>\n</li>\n<li>\n<p>Usage Data</p>\n</li>\n</ul>\n<h3>Usage Data</h3>\n<p>Usage Data is collected automatically when using the Service.</p>\n<p>Usage Data may include information such as Your Device\'s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.</p>\n<p>When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.</p>\n<p>We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.</p>\n<h3>Tracking Technologies and Cookies</h3>\n<p>We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:</p>\n<ul>\n<li><strong>Cookies or Browser Cookies.</strong> A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.</li>\n<li><strong>Web Beacons.</strong> Certain sections of our Service and our emails may contain small electronic files known as web beacons (also referred to as clear gifs, pixel tags, and single-pixel gifs) that permit the Company, for example, to count users who have visited those pages or opened an email and for other related website statistics (for example, recording the popularity of a certain section and verifying system and server integrity).</li>\n</ul>\n<p>Cookies can be \"Persistent\" or \"Session\" Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser. Learn more about cookies on the <a href=\"https://www.freeprivacypolicy.com/blog/sample-privacy-policy-template/#Use_Of_Cookies_And_Tracking\" target=\"_blank\" rel=\"noopener\">Free Privacy Policy website</a> article.</p>\n<p>We use both Session and Persistent Cookies for the purposes set out below:</p>\n<ul>\n<li>\n<p><strong>Necessary / Essential Cookies</strong></p>\n<p>Type: Session Cookies</p>\n<p>Administered by: Us</p>\n<p>Purpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.</p>\n</li>\n<li>\n<p><strong>Cookies Policy / Notice Acceptance Cookies</strong></p>\n<p>Type: Persistent Cookies</p>\n<p>Administered by: Us</p>\n<p>Purpose: These Cookies identify if users have accepted the use of cookies on the Website.</p>\n</li>\n<li>\n<p><strong>Functionality Cookies</strong></p>\n<p>Type: Persistent Cookies</p>\n<p>Administered by: Us</p>\n<p>Purpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.</p>\n</li>\n</ul>\n<p>For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy or the Cookies section of our Privacy Policy.</p>\n<h2>Use of Your Personal Data</h2>\n<p>The Company may use Personal Data for the following purposes:</p>\n<ul>\n<li>\n<p><strong>To provide and maintain our Service</strong>, including to monitor the usage of our Service.</p>\n</li>\n<li>\n<p><strong>To manage Your Account:</strong> to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.</p>\n</li>\n<li>\n<p><strong>For the performance of a contract:</strong> the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.</p>\n</li>\n<li>\n<p><strong>To contact You:</strong> To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application\'s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.</p>\n</li>\n<li>\n<p><strong>To provide You</strong> with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.</p>\n</li>\n<li>\n<p><strong>To manage Your requests:</strong> To attend and manage Your requests to Us.</p>\n</li>\n<li>\n<p><strong>For business transfers:</strong> We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.</p>\n</li>\n<li>\n<p><strong>For other purposes</strong>: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.</p>\n</li>\n</ul>\n<p>We may share Your personal information in the following situations:</p>\n<ul>\n<li><strong>With Service Providers:</strong> We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.</li>\n<li><strong>For business transfers:</strong> We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.</li>\n<li><strong>With Affiliates:</strong> We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.</li>\n<li><strong>With business partners:</strong> We may share Your information with Our business partners to offer You certain products, services or promotions.</li>\n<li><strong>With other users:</strong> when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside.</li>\n<li><strong>With Your consent</strong>: We may disclose Your personal information for any other purpose with Your consent.</li>\n</ul>\n<h2>Retention of Your Personal Data</h2>\n<p>The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.</p>\n<p>The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.</p>\n<h2>Transfer of Your Personal Data</h2>\n<p>Your information, including Personal Data, is processed at the Company\'s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to &mdash; and maintained on &mdash; computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.</p>\n<p>Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.</p>\n<p>The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.</p>\n<h2>Delete Your Personal Data</h2>\n<p>You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.</p>\n<p>Our Service may give You the ability to delete certain information about You from within the Service.</p>\n<p>You may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.</p>\n<p>Please note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.</p>\n<h2>Disclosure of Your Personal Data</h2>\n<h3>Business Transactions</h3>\n<p>If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.</p>\n<h3>Law enforcement</h3>\n<p>Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).</p>\n<h3>Other legal requirements</h3>\n<p>The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:</p>\n<ul>\n<li>Comply with a legal obligation</li>\n<li>Protect and defend the rights or property of the Company</li>\n<li>Prevent or investigate possible wrongdoing in connection with the Service</li>\n<li>Protect the personal safety of Users of the Service or the public</li>\n<li>Protect against legal liability</li>\n</ul>\n<h2>Security of Your Personal Data</h2>\n<p>The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.</p>\n<h1>Children\'s Privacy</h1>\n<p>Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.</p>\n<p>If We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent\'s consent before We collect and use that information.</p>\n<h1>Links to Other Websites</h1>\n<p>Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party\'s site. We strongly advise You to review the Privacy Policy of every site You visit.</p>\n<p>We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.</p>\n<h1>Changes to this Privacy Policy</h1>\n<p>We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.</p>\n<p>We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the \"Last updated\" date at the top of this Privacy Policy.</p>\n<p>You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</p>\n<h1>Contact Us</h1>\n<p>If you have any questions about this Privacy Policy, You can contact us:</p>\n<ul>\n<li>By email: henri@bigfiveabidjan.com</li>\n</ul>', '2023-01-25 23:39:41', '2023-01-25 23:49:09'),
('cc566c22-eaf9-48f9-8555-0d6e398930fc', 'pages', 'slug', '3bbaa46f-150c-4877-a0c1-81bf1ea2b3a1', 'en', 'privacy-policy', '2023-01-25 23:39:41', '2023-01-25 23:49:09'),
('a22e030b-20c4-477b-afd8-72e6c15cf1d4', 'pages', 'title', '68b48d1e-f7df-446d-80cb-d44d2891bcab', 'en', 'Terms and Conditions', '2023-01-25 23:43:41', '2023-01-25 23:49:38'),
('850dda1f-992b-4004-ae26-5a08e2b6827c', 'pages', 'body', '68b48d1e-f7df-446d-80cb-d44d2891bcab', 'en', '<p>Une&nbsp;<a href=\"https://www.captaincontrat.com/proteger-sa-societe/rediger-politique-confidentialite\" target=\"_blank\" rel=\"noopener\">politique de confidentialit&eacute;</a>&nbsp;est un document ou un contrat qui expose&nbsp;<strong>les engagements de l&rsquo;entreprise en mati&egrave;re de</strong><strong>&nbsp;traitement des donn&eacute;es personnelles des utilisateurs</strong>&nbsp;(d&rsquo;un service, d&rsquo;un site Web&hellip;). Cette politique doit expliquer en d&eacute;tail le mode de collecte, le traitement, le proc&eacute;d&eacute; de publication et de suppression des donn&eacute;es personnelles, ainsi que la finalit&eacute; de ces proc&eacute;d&eacute;s. L&rsquo;information qui figure dans la politique de confidentialit&eacute; doit &ecirc;tre claire, concise et transparente.&nbsp;</p>\n<p>Ce document doit permettre aux clients et/ou aux utilisateurs de :</p>\n<ul>\n<li aria-level=\"1\">savoir pourquoi leurs informations personnelles sont collect&eacute;es (l&rsquo;usage qu&rsquo;il en est fait) ;</li>\n<li aria-level=\"1\">conna&icirc;tre les modalit&eacute;s de traitement de leurs donn&eacute;es personnelles ;</li>\n<li aria-level=\"1\">s&rsquo;assurer de la protection de leurs donn&eacute;es ;&nbsp;</li>\n<li aria-level=\"1\">s&rsquo;informer sur l&rsquo;exercice de leurs droits.&nbsp;</li>\n</ul>\n<p>&nbsp;</p>\n<p>La politique de confidentialit&eacute; permet donc de renforcer la&nbsp;confiance entre l&rsquo;utilisateur et l&rsquo;entreprise&nbsp;qui collecte et traite ses donn&eacute;es personnelles. En faisant preuve de transparence et de clart&eacute;, l&rsquo;entreprise garantit &agrave; ses utilisateurs qu&rsquo;elle veille &agrave; la protection de leurs donn&eacute;es.&nbsp;</p>', '2023-01-25 23:43:41', '2023-01-25 23:43:41'),
('a6f03293-7196-483a-9090-cdb8689b4a8d', 'pages', 'slug', '68b48d1e-f7df-446d-80cb-d44d2891bcab', 'en', 'terms-and-conditions', '2023-01-25 23:43:41', '2023-01-25 23:49:38'),
('c4dee7ce-dd0f-4952-ad4a-3d54ee7b3716', 'menu_items', 'title', '26', 'en', 'Terms and Conditions', '2023-01-25 23:52:01', '2023-01-25 23:52:01'),
('39eccea8-1676-499a-8515-848e1d853e01', 'pages', 'title', '6e51459e-9820-4df4-af0e-4e3efc6af2ef', 'en', 'Reglement', '2023-01-26 17:42:01', '2023-01-26 17:42:01'),
('2b2c6985-016c-408e-9da1-c2b11efddce7', 'pages', 'body', '6e51459e-9820-4df4-af0e-4e3efc6af2ef', 'en', '<p>eded edede</p>', '2023-01-26 17:42:01', '2023-01-26 17:42:01'),
('8aa53f56-f485-4e6b-8c75-373882041dae', 'pages', 'slug', '6e51459e-9820-4df4-af0e-4e3efc6af2ef', 'en', 'reglement', '2023-01-26 17:42:01', '2023-01-26 17:42:01'),
('c3551a21-95db-43bb-aba1-51120853e9f4', 'contest_categories', 'name', '8c3ee210-1c0c-41df-a66b-58af6131f513', 'en', 'grtg', '2024-05-24 18:03:58', '2024-05-24 18:03:58'),
('c861b206-0866-41e7-b870-8ac7020dc7cc', 'contest_categories', 'slug', '8c3ee210-1c0c-41df-a66b-58af6131f513', 'en', 'grtg', '2024-05-24 18:03:58', '2024-05-24 18:03:58');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `username`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `provider_id`, `provider`) VALUES
('051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', '3ea25b05-bab7-40bf-8d5c-566c5588470e', 'konan konan', 'candidat@gmail.com', 'users/default.png', 'konan', NULL, '$2y$10$XlHbMSd6bwGvpn7urQYTbOgBYO7ATQCH0PPcR8fc1KkcypwxEucP.', NULL, NULL, '2023-02-01 10:30:20', '2023-02-01 10:30:20', NULL, NULL),
('0d12c4a6-7b46-4ebb-bea1-ef8232efbd4e', '3ea25b05-bab7-40bf-8d5c-566c5588470e', 'KONAN JOEL', 'candidat@bigfiveabidjan.com', 'users/default.png', 'candidat1', NULL, '$2y$10$QlmnyH4l7KY5XY4uAZrqZeZLo78a0ykTMidC2UST6jD1PmiSSiFlq', NULL, NULL, '2024-02-26 18:27:40', '2024-02-26 18:27:40', NULL, NULL),
('2e4cd43c-7b1d-43a7-8e7c-e6bf6aef3dbc', '3ea25b05-bab7-40bf-8d5c-566c5588470e', 'HENRI KONAN', 'sikefouet@yahoo.com', 'users/default.png', 'henrijojo', NULL, '$2y$10$hI6tvhNO.VENKe9/Ow.tiey8Int4trhkhnVvI22fnPqkKJlROM8.a', NULL, NULL, '2024-07-10 09:57:22', '2024-07-10 09:57:22', NULL, NULL),
('531881a7-2d3a-49d7-afd4-ad1da0ee418e', '3ea25b05-bab7-40bf-8d5c-566c5588470e', 'henri konan', 'momopo@gmail.com', 'users/default.png', 'henri', NULL, '$2y$10$LGJM840Gt5t59UPsRk/c7OjzFo80tzrxXimFSmanSw4rA69lN/Kb2', NULL, NULL, '2024-04-24 15:15:37', '2024-04-24 15:15:37', NULL, NULL),
('57811f8a-da9e-43c4-9fc0-6ec031ef049b', 'a7920298-8878-428a-b14d-c45edf0e21e1', 'Henri-Joël Konan Sikefouët', NULL, 'users/default.png', NULL, '2024-05-27 19:13:27', '$2y$10$Yiz20xFa3nWZjl9nKOTugusxhQFn/VYkLkrR37RLknbWNfsW0PKka', NULL, NULL, '2024-05-27 19:13:27', '2024-05-27 19:13:27', NULL, NULL),
('57d3bcad-9d34-4afb-a7e3-3f92b4a8e2b6', '3ea25b05-bab7-40bf-8d5c-566c5588470e', 'JOEL KONAN', 'blafoucoco@gmail.com', 'users/default.png', 'mitsu', NULL, '$2y$10$44okBXsTcnOeb2eMvEw45upA8TONu3gfcsxGV4SBrE9BLm6HR2KdK', NULL, NULL, '2024-05-17 08:32:10', '2024-05-17 08:32:10', NULL, NULL),
('6141a4b5-d595-4ca9-ab6c-7f94003b96bc', '3ea25b05-bab7-40bf-8d5c-566c5588470e', 'KONAN JOEL', 'mompp@gmail.com', 'users/default.png', 'mitsurrr', NULL, '$2y$10$ZYRfA4SJYBUB9KapvCxmL.QyC4mvP9k1.vFvxx3jOriPaJHaOeyMC', NULL, NULL, '2024-05-17 08:35:40', '2024-05-17 08:35:40', NULL, NULL),
('677b5c25-9d17-4809-98b7-0774cf6814b7', '3ea25b05-bab7-40bf-8d5c-566c5588470e', 'KONAN JOEL', 'lomo@gmail.com', 'users/default.png', 'mitsu34', NULL, '$2y$10$ODu72N.y4tobovVi5/tWDOiOdsCxiJjQti7jZhheswet9DAbRj8Xm', NULL, NULL, '2024-05-17 08:33:57', '2024-05-17 08:33:57', NULL, NULL),
('69407aac-dc9c-4d26-8073-171cf8b8b101', '3ea25b05-bab7-40bf-8d5c-566c5588470e', 'Henri-Joël Konan Sikefouët', 'sikefouet@gmail.com', 'users/default.png', 'sikefouet', NULL, '$2y$10$ldbkCg8Ga/UsN0GOuYOPwutbAuwSKhU22LAC66FMlRKb1h5v7Xple', NULL, NULL, '2023-01-27 14:11:07', '2023-01-27 14:18:30', NULL, NULL),
('85f783b4-1111-453f-b716-c55426f247d0', 'a7920298-8878-428a-b14d-c45edf0e21e1', 'lopo lolu', 'kolo@gmail.com', 'users/default.png', 'lopo', NULL, '$2y$10$ArL54nBN28l/WJmjIilFQul8VgLQI/M1q9YTj9k57MIqCM3bZYQBm', NULL, NULL, '2024-04-24 15:24:39', '2024-04-24 15:24:39', NULL, NULL),
('88d0481a-8189-48cc-8eec-3e9e87ce5793', 'c02835e9-c10a-4d14-82cb-a160c45d01f9', 'kouassi', 'kouassi@gmail.com', 'users/default.png', NULL, NULL, '$2y$10$7EMKFtsG/8rxZsH96Fq7Z.tgTKT2uwKoVmioO/3O/uqY.4UTvFxeq', NULL, '{\"locale\":\"fr\"}', '2023-01-27 14:20:38', '2023-01-27 14:20:38', NULL, NULL),
('8eae2d7d-2e90-45b4-b2a8-91e510bb601e', 'a7920298-8878-428a-b14d-c45edf0e21e1', 'Henri-Joël Konan Sikefouët', NULL, 'users/default.png', NULL, NULL, '$2y$10$ZVkdo1DqGJ59ChmxHu5vzOeWJEmcvVob.tzZrt/kng8kyhXAjIAn.', NULL, NULL, '2024-05-27 19:05:36', '2024-05-27 19:05:36', '8027681367275079', 'facebook'),
('b2845b3f-1105-496d-87bb-e1068c0881c4', '91b45615-3ac7-4124-8389-82e2cacc4d7a', 'Henri Joel Konan', 'henri@bigfiveabidjan.com', 'users/May2024/7wYVgOuILPvl5XWMmw3P.jpeg', NULL, NULL, '$2a$12$igh9N8s75Ju7jDh04RQKJ.wzfSZgUw0kE8ywRPjddEVOuHQhLl0Se', '8gG4fc4YOaZPvW4ojXzfnuqoRfOCTIxHksia6xBmKb543blTFr9EVzNo92GC', '{\"locale\":\"fr\"}', '2022-12-02 15:15:32', '2024-05-15 15:52:51', NULL, NULL),
('b4bc1025-51f5-4ac6-a138-fbce874c6be4', 'a7920298-8878-428a-b14d-c45edf0e21e1', 'Henri-Joël Konan Sikefouët', NULL, 'users/default.png', NULL, '2024-05-27 19:09:30', '$2y$10$4lbbVYnGzMg07icIgWpJwuR2jYenncEdDC/W31IDP2nnEw7M/Bz66', NULL, NULL, '2024-05-27 19:09:30', '2024-05-27 19:09:30', NULL, NULL),
('d7830b23-4e7a-4287-bd24-a4efd435c1e4', '3ea25b05-bab7-40bf-8d5c-566c5588470e', 'CHRISTIAN BOGUI', 'delorsbogui2017@gmail.com', 'users/default.png', 'delors', NULL, '$2y$10$lWKnEpJ57ygt0uSdX0cuQuECIGERTPHNy/4/XjFFgpX.0MCals1fa', NULL, NULL, '2024-07-10 09:51:02', '2024-07-10 09:51:02', NULL, NULL),
('f9000f47-5d7e-4c0d-9b69-a3272d9e18a5', '3ea25b05-bab7-40bf-8d5c-566c5588470e', 'KONAN JOEL', 'iiiiii@gmail.com', 'users/default.png', 'mitsu34rrr', NULL, '$2y$10$42Rz2mjAG7QALzfOGBTj..Xe5Frjjv/hFGj6101TUJ0Pdy8HpWNWm', NULL, NULL, '2024-05-17 08:46:46', '2024-05-17 08:46:46', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
('68cd4453-f597-4d0b-859a-fd184397936d', '889de597-9225-47d3-9b55-a66df7701426');

-- --------------------------------------------------------

--
-- Structure de la table `user_visits`
--

CREATE TABLE `user_visits` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visited_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_visits`
--

INSERT INTO `user_visits` (`id`, `ip_address`, `page_url`, `visited_at`, `created_at`, `updated_at`) VALUES
('1cd164a0-99ce-4e85-a7af-68f08a753f3a', '127.0.0.1', 'http://127.0.0.1:8000/candidats/henri-konan', '2023-01-06 16:41:48', '2023-01-06 16:41:48', '2023-01-06 16:41:48'),
('4a7f4ad8-417d-41de-9420-b7fd0042a4bf', '127.0.0.1', 'http://127.0.0.1:8000/candidats/mpmp', '2023-01-06 17:00:04', '2023-01-06 17:00:04', '2023-01-06 17:00:04'),
('52cb7866-debf-4437-a212-6067b6c5669a', '127.0.0.1', 'http://127.0.0.1:8000/candidats/mpmp', '2023-01-06 16:48:06', '2023-01-06 16:48:06', '2023-01-06 16:48:06'),
('5cbbd0f9-6320-44db-822e-80e4d2913159', '127.0.0.1', 'http://127.0.0.1:8000/candidats/mpmp', '2023-01-06 16:53:59', '2023-01-06 16:53:59', '2023-01-06 16:53:59'),
('79a17399-fe9b-47b2-8aa0-a65f216208fa', '127.0.0.1', 'http://127.0.0.1:8000/candidats/mpmp', '2023-01-06 16:59:43', '2023-01-06 16:59:43', '2023-01-06 16:59:43'),
('7d5c0094-bdd0-40d0-8a71-f9c7233315d5', '127.0.0.1', 'http://127.0.0.1:8000/candidats/mpmp', '2023-01-06 16:53:38', '2023-01-06 16:53:38', '2023-01-06 16:53:38'),
('86020bad-8062-4d8f-810f-a1fa2226dcaa', '127.0.0.1', 'http://127.0.0.1:8000/candidats/konan', '2023-01-06 16:47:27', '2023-01-06 16:47:27', '2023-01-06 16:47:27'),
('930b58b1-cbde-4dd7-92b0-964494b9852d', '127.0.0.1', 'http://127.0.0.1:8000/candidats/konan', '2023-01-06 16:47:24', '2023-01-06 16:47:24', '2023-01-06 16:47:24'),
('9ebe65d6-1f84-43bb-bc1e-9076d75a05b3', '127.0.0.1', 'http://127.0.0.1:8000/candidats/mpmp', '2023-01-06 16:55:26', '2023-01-06 16:55:26', '2023-01-06 16:55:26'),
('a1ed5777-d34b-4f21-83c1-eb274e31b2b7', '127.0.0.1', 'http://127.0.0.1:8000/candidats/henri-konan', '2023-01-06 16:47:32', '2023-01-06 16:47:32', '2023-01-06 16:47:32'),
('a74731ef-a3f2-489f-8652-64a8c2c3ca31', '127.0.0.1', 'http://127.0.0.1:8000/candidats/henri-konan', '2023-01-06 16:33:21', '2023-01-06 16:33:22', '2023-01-06 16:33:22'),
('bf6ce016-588b-4de0-b0c5-30713822c439', '127.0.0.1', 'http://127.0.0.1:8000/candidats/mpmp', '2023-01-06 16:55:06', '2023-01-06 16:55:06', '2023-01-06 16:55:06'),
('bfa4cee2-8f32-4ffc-b258-811fead87ee1', '127.0.0.1', 'http://127.0.0.1:8000/candidats/mpmp', '2023-01-06 17:00:49', '2023-01-06 17:00:49', '2023-01-06 17:00:49'),
('d8b0d429-51be-4bdd-8150-e41a14c72d5c', '127.0.0.1', 'http://127.0.0.1:8000/candidats/mpmp', '2023-01-06 16:47:48', '2023-01-06 16:47:48', '2023-01-06 16:47:48'),
('f5eb3b19-a9f8-4809-a3d3-d9c5b7f1c45e', '127.0.0.1', 'http://127.0.0.1:8000/candidats/momo', '2023-01-06 16:47:40', '2023-01-06 16:47:40', '2023-01-06 16:47:40'),
('fd9dfc8d-f22e-4711-a9ed-a3708dcab6f0', '127.0.0.1', 'http://127.0.0.1:8000/candidats/henri-konan', '2023-01-06 16:41:44', '2023-01-06 16:41:44', '2023-01-06 16:41:44');

-- --------------------------------------------------------

--
-- Structure de la table `visits`
--

CREATE TABLE `visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `primary_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secondary_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` bigint(20) UNSIGNED NOT NULL,
  `list` json DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `votes`
--

CREATE TABLE `votes` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `user_id` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipe_id` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_vote` date DEFAULT NULL,
  `owner_id` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `votes`
--

INSERT INTO `votes` (`id`, `ip`, `votes`, `user_id`, `category_id`, `recipe_id`, `created_at`, `updated_at`, `last_vote`, `owner_id`) VALUES
('0859db45-677f-4477-bbd5-aa5676d9ef79', '127.0.0.1', 1, '0d12c4a6-7b46-4ebb-bea1-ef8232efbd4e', '92b12092-253d-42be-abf1-814e180a20f1', '10bc4365-2bd1-473f-a100-aab503605e6b', '2024-05-16 10:53:25', '2024-05-16 10:53:25', '2024-05-16', '0d12c4a6-7b46-4ebb-bea1-ef8232efbd4e'),
('198f0265-9d15-4022-8b97-3d8fdf403f0b', '127.0.0.1', 1, '0d12c4a6-7b46-4ebb-bea1-ef8232efbd4e', '92b12092-253d-42be-abf1-814e180a20f1', '5721327c-7f24-40a1-8e37-4f1dce562777', '2024-05-16 10:54:13', '2024-05-16 10:54:13', '2024-05-16', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1'),
('2c3623c2-d5e7-44c7-81ea-c08f2cbf1d3c', '127.0.0.1', 1, 'b2845b3f-1105-496d-87bb-e1068c0881c4', '8c3ee210-1c0c-41df-a66b-58af6131f513', 'fd7eeefb-99fa-4383-8a5d-d409e90aee32', '2024-05-29 15:30:42', '2024-05-29 15:30:42', '2024-05-29', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1'),
('335a7a90-8b33-4cac-a57d-7a0caf894d09', '160.120.180.100', 1, '69407aac-dc9c-4d26-8073-171cf8b8b101', '92b12092-253d-42be-abf1-814e180a20f1', 'aafa4bd0-6d8a-44aa-b20c-e3e2ba81cb5b', '2023-01-27 14:17:01', '2023-01-27 14:17:01', '2023-01-27', '69407aac-dc9c-4d26-8073-171cf8b8b101'),
('3cbd72b8-59a5-45e5-912c-4eb0fa3b8b6c', '127.0.0.1', 1, '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', '92b12092-253d-42be-abf1-814e180a20f1', '5721327c-7f24-40a1-8e37-4f1dce562777', '2024-05-17 15:09:21', '2024-05-17 15:09:21', '2024-05-17', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1'),
('5c544f83-42b4-4ed5-ae72-fca16cfe481f', '160.120.180.100', 1, 'b2845b3f-1105-496d-87bb-e1068c0881c4', '92b12092-253d-42be-abf1-814e180a20f1', 'aafa4bd0-6d8a-44aa-b20c-e3e2ba81cb5b', '2023-01-27 14:19:13', '2023-01-27 14:19:13', '2023-01-27', '69407aac-dc9c-4d26-8073-171cf8b8b101'),
('5c65c222-b266-416a-8cf2-6d2ab353c461', '127.0.0.1', 1, 'b2845b3f-1105-496d-87bb-e1068c0881c4', '8c3ee210-1c0c-41df-a66b-58af6131f513', '42eda7ed-0c83-4ca1-8dfc-99f12f185c0f', '2024-05-29 15:30:48', '2024-05-29 15:30:48', '2024-05-29', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1'),
('709fa27b-9e1a-49c1-9708-a9203fbd35ab', '127.0.0.1', 1, 'b2845b3f-1105-496d-87bb-e1068c0881c4', '8c3ee210-1c0c-41df-a66b-58af6131f513', '88188431-dd5d-46de-84d7-1b67994ac093', '2024-05-29 15:30:47', '2024-05-29 15:30:47', '2024-05-29', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1'),
('7ae7d7c8-bc3c-4189-8cd3-a4e6a454d65e', '127.0.0.1', 1, '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', '92b12092-253d-42be-abf1-814e180a20f1', '71f4fa7d-ae7f-4f65-a3d4-f87457db03f2', '2023-05-22 10:40:59', '2023-05-22 10:40:59', '2023-05-22', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1'),
('894bf899-b077-4428-b919-4305aa67f474', '127.0.0.1', 1, '85f783b4-1111-453f-b716-c55426f247d0', '92b12092-253d-42be-abf1-814e180a20f1', 'c5e18724-9043-496e-8d7b-0f943273d780', '2024-04-24 15:24:46', '2024-04-24 15:24:46', '2024-04-24', '531881a7-2d3a-49d7-afd4-ad1da0ee418e'),
('8fbb8a6c-a655-4158-a99b-07fc2cb738d3', '127.0.0.1', 1, '85f783b4-1111-453f-b716-c55426f247d0', '92b12092-253d-42be-abf1-814e180a20f1', 'e05df453-7607-40c7-a814-5e4cfb9bc886', '2024-04-24 15:24:50', '2024-04-24 15:24:50', '2024-04-24', '531881a7-2d3a-49d7-afd4-ad1da0ee418e'),
('a7cecace-71f6-4800-b892-60ae5fe8a092', '127.0.0.1', 1, '88d0481a-8189-48cc-8eec-3e9e87ce5793', '92b12092-253d-42be-abf1-814e180a20f1', '10bc4365-2bd1-473f-a100-aab503605e6b', '2024-05-16 10:54:37', '2024-05-16 10:54:37', '2024-05-16', '0d12c4a6-7b46-4ebb-bea1-ef8232efbd4e'),
('b1de27b5-bd43-4df4-99ab-5058262413ad', '127.0.0.1', 1, '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', '92b12092-253d-42be-abf1-814e180a20f1', 'aafa4bd0-6d8a-44aa-b20c-e3e2ba81cb5b', '2023-05-22 10:41:36', '2023-05-22 10:41:36', '2023-05-22', '69407aac-dc9c-4d26-8073-171cf8b8b101'),
('c7ff4e3c-bcd1-46e5-86fe-8258b95c5977', '127.0.0.1', 1, '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', '92b12092-253d-42be-abf1-814e180a20f1', '10bc4365-2bd1-473f-a100-aab503605e6b', '2024-05-17 15:08:59', '2024-05-17 15:08:59', '2024-05-17', '0d12c4a6-7b46-4ebb-bea1-ef8232efbd4e'),
('d0b20932-5f14-4dd7-b79a-e81a68ca0830', '160.120.180.100', 1, '59622292-7ca7-40a9-b59d-3f663c271499', '92b12092-253d-42be-abf1-814e180a20f1', '3567f9ad-0ba8-4363-b7c6-157aaad1384e', '2023-01-26 17:34:16', '2023-01-26 17:34:16', '2023-01-26', '59622292-7ca7-40a9-b59d-3f663c271499'),
('d7faea2f-e57c-431e-b23c-85a850f5e6b2', '127.0.0.1', 1, '677b5c25-9d17-4809-98b7-0774cf6814b7', '92b12092-253d-42be-abf1-814e180a20f1', '10bc4365-2bd1-473f-a100-aab503605e6b', '2024-05-17 09:26:12', '2024-05-17 09:26:12', '2024-05-17', '0d12c4a6-7b46-4ebb-bea1-ef8232efbd4e'),
('f98ba2b1-ff74-42f0-b42a-d082fd1fc41c', '127.0.0.1', 2, '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', '8c3ee210-1c0c-41df-a66b-58af6131f513', 'fd7eeefb-99fa-4383-8a5d-d409e90aee32', '2024-05-29 15:38:41', '2024-05-30 15:28:21', '2024-05-30', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1');

-- --------------------------------------------------------

--
-- Structure de la table `vote_jury`
--

CREATE TABLE `vote_jury` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `votes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipe_id` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_id` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vote_jury`
--

INSERT INTO `vote_jury` (`id`, `votes`, `user_id`, `category_id`, `recipe_id`, `owner_id`, `created_at`, `updated_at`) VALUES
('703c703a-1144-4a90-b314-c3346a67b978', '6', '88d0481a-8189-48cc-8eec-3e9e87ce5793', '92b12092-253d-42be-abf1-814e180a20f1', '5721327c-7f24-40a1-8e37-4f1dce562777', '051767a2-5ee2-46f1-8a2d-7e8a6098d0d1', '2024-05-16 10:46:35', '2024-05-16 10:46:35'),
('a613896c-3a33-4a1a-b5fa-e6b0c0a69d99', '7', '88d0481a-8189-48cc-8eec-3e9e87ce5793', '92b12092-253d-42be-abf1-814e180a20f1', '10bc4365-2bd1-473f-a100-aab503605e6b', '0d12c4a6-7b46-4ebb-bea1-ef8232efbd4e', '2024-05-16 10:55:11', '2024-05-16 10:55:11');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_category_id_index` (`category_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Index pour la table `contestants`
--
ALTER TABLE `contestants`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contest_categories`
--
ALTER TABLE `contest_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contest_categories_slug_unique` (`slug`);

--
-- Index pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Index pour la table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `linked_social_accounts`
--
ALTER TABLE `linked_social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `linked_social_accounts_user_id_foreign` (`user_id`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Index pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Index pour la table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipes_user_id_foreign` (`user_id`),
  ADD KEY `recipes_category_id_foreign` (`category_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Index pour la table `user_visits`
--
ALTER TABLE `user_visits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visits_primary_key_secondary_key_unique` (`primary_key`,`secondary_key`);

--
-- Index pour la table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vote_jury`
--
ALTER TABLE `vote_jury`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT pour la table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `linked_social_accounts`
--
ALTER TABLE `linked_social_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `linked_social_accounts`
--
ALTER TABLE `linked_social_accounts`
  ADD CONSTRAINT `linked_social_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `contest_categories` (`id`),
  ADD CONSTRAINT `recipes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
