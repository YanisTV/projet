-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 23 jan. 2026 à 13:12
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `shoplist_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`, `created_at`) VALUES
(1, 'Fruits & Légumes', '🥬', '2025-10-15 07:48:11'),
(2, 'Boulangerie', '🥖', '2025-10-15 07:48:11'),
(3, 'Produits laitiers', '🥛', '2025-10-15 07:48:11'),
(4, 'Épicerie', '🌾', '2025-10-15 07:48:11');

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `store_id` int UNSIGNED DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','ready','completed','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `order_type` enum('online','click_collect') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'online',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `store_id`, `total_amount`, `status`, `order_type`, `notes`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 29.90, 'pending', 'online', '', '2026-01-23 09:46:27', '2026-01-23 09:46:27');

-- --------------------------------------------------------

--
-- Structure de la table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `idx_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `subtotal`) VALUES
(1, 1, 15, 1.00, 4.10, 4.10),
(2, 1, 22, 1.00, 2.10, 2.10),
(3, 1, 9, 1.00, 1.45, 1.45),
(4, 1, 10, 1.00, 3.10, 3.10),
(5, 1, 6, 1.00, 2.70, 2.70),
(6, 1, 11, 1.00, 5.40, 5.40),
(7, 1, 17, 1.00, 3.40, 3.40),
(8, 1, 18, 1.00, 2.80, 2.80),
(9, 1, 19, 1.00, 1.75, 1.75),
(10, 1, 20, 1.00, 3.10, 3.10);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pièce',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category_id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `icon`, `category_id`, `unit`, `created_at`, `updated_at`) VALUES
(1, 'Pommes Bio', 'Pommes rouges fraîches du verger', '🍎', 1, 'kg', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(2, 'Baguette Tradition', 'Pain frais cuit au feu de bois', '🥖', 2, 'pièce', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(3, 'Lait Demi-écrémé', 'Lait frais de la ferme 1L', '🥛', 3, 'L', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(4, 'Fromage Comté', 'Fromage AOP affiné 12 mois', '🧀', 3, 'kg', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(5, 'Tomates', 'Tomates fraîches', '🍅', 1, 'kg', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(6, 'Oeufs', 'Oeufs frais', '🥚', 3, 'boîte', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(7, 'Thon', 'Thon en conserve', '🐟', 4, 'boîte', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(8, 'Olives', 'Olives noires', '🫒', 4, 'pot', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(9, 'Pâtes', 'Pâtes italiennes', '🍝', 4, 'kg', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(10, 'Lardons', 'Lardons fumés', '🥓', 3, 'paquet', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(11, 'Parmesan', 'Parmesan râpé', '🧀', 3, 'paquet', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(12, 'Chocolat noir', 'Chocolat noir 70%', '🍫', 4, 'tablette', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(13, 'Farine', 'Farine de blé', '🌾', 4, 'kg', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(14, 'Sucre', 'Sucre blanc', '🍬', 4, 'kg', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(15, 'Beurre', 'Beurre doux', '🧈', 3, 'plaquette', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(16, 'Pain', 'Pain de campagne', '🍞', 2, 'pièce', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(17, 'Céréales', 'Céréales complètes', '🥣', 4, 'boîte', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(18, 'Jus d\'orange', 'Jus d\'orange frais', '🍊', 4, 'bouteille', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(19, 'Pain de mie', 'Pain de mie complet', '🍞', 2, 'paquet', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(20, 'Confiture', 'Confiture de fraises', '🍓', 4, 'pot', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(21, 'Chips', 'Chips salées', '🥔', 4, 'sachet', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(22, 'Cacahuètes', 'Cacahuètes grillées', '🥜', 4, 'sachet', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(23, 'Sodas', 'Pack de sodas', '🥤', 4, 'pack', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(24, 'Fromage apéro', 'Plateau fromage apéritif', '🧀', 3, 'plateau', '2025-10-15 07:48:11', '2025-10-15 07:48:11');

-- --------------------------------------------------------

--
-- Structure de la table `product_prices`
--

DROP TABLE IF EXISTS `product_prices`;
CREATE TABLE IF NOT EXISTS `product_prices` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `store_id` int UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_product_store` (`product_id`,`store_id`),
  KEY `store_id` (`store_id`),
  KEY `idx_price` (`price`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_prices`
--

INSERT INTO `product_prices` (`id`, `product_id`, `store_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2.50, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(2, 1, 2, 2.20, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(3, 2, 1, 1.20, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(4, 2, 2, 1.40, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(5, 3, 1, 1.50, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(6, 3, 2, 1.35, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(7, 4, 1, 18.90, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(8, 4, 2, 19.50, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(9, 5, 1, 3.50, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(10, 5, 2, 3.30, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(11, 6, 1, 2.80, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(12, 6, 2, 2.70, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(13, 7, 1, 4.20, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(14, 7, 2, 4.00, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(15, 8, 1, 3.90, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(16, 8, 2, 3.80, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(17, 9, 1, 1.50, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(18, 9, 2, 1.45, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(19, 10, 1, 3.20, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(20, 10, 2, 3.10, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(21, 11, 1, 5.50, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(22, 11, 2, 5.40, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(23, 12, 1, 3.80, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(24, 12, 2, 3.70, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(25, 13, 1, 1.20, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(26, 13, 2, 1.15, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(27, 14, 1, 1.50, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(28, 14, 2, 1.45, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(29, 15, 1, 4.20, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(30, 15, 2, 4.10, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(31, 16, 1, 1.20, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(32, 16, 2, 1.15, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(33, 17, 1, 3.50, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(34, 17, 2, 3.40, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(35, 18, 1, 2.90, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(36, 18, 2, 2.80, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(37, 19, 1, 1.80, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(38, 19, 2, 1.75, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(39, 20, 1, 3.20, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(40, 20, 2, 3.10, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(41, 21, 1, 2.50, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(42, 21, 2, 2.40, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(43, 22, 1, 2.20, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(44, 22, 2, 2.10, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(45, 23, 1, 4.50, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(46, 23, 2, 4.40, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(47, 24, 1, 5.80, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(48, 24, 2, 5.70, '2025-10-15 07:48:11', '2025-10-15 07:48:11');

-- --------------------------------------------------------

--
-- Structure de la table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE IF NOT EXISTS `recipes` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preparation_time` int DEFAULT NULL COMMENT 'Time in minutes',
  `difficulty` enum('Facile','Moyen','Difficile') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Facile',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_difficulty` (`difficulty`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `description`, `icon`, `preparation_time`, `difficulty`, `created_at`, `updated_at`) VALUES
(1, 'Salade Niçoise', 'Une salade fraîche et complète', '🥗', 20, 'Facile', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(2, 'Pâtes Carbonara', 'La vraie recette italienne', '🍝', 25, 'Moyen', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(3, 'Gâteau au Chocolat', 'Fondant et gourmand', '🍰', 45, 'Facile', '2025-10-15 07:48:11', '2025-10-15 07:48:11');

-- --------------------------------------------------------

--
-- Structure de la table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
CREATE TABLE IF NOT EXISTS `recipe_ingredients` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `recipe_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `idx_recipe` (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`id`, `recipe_id`, `product_id`, `quantity`, `unit`) VALUES
(1, 1, 5, 2.00, 'pièces'),
(2, 1, 6, 2.00, 'pièces'),
(3, 1, 7, 1.00, 'boîte'),
(4, 1, 8, 1.00, 'pot'),
(5, 2, 9, 0.50, 'kg'),
(6, 2, 10, 1.00, 'paquet'),
(7, 2, 6, 3.00, 'pièces'),
(8, 2, 11, 1.00, 'paquet'),
(9, 3, 12, 2.00, 'tablettes'),
(10, 3, 13, 0.20, 'kg'),
(11, 3, 14, 0.15, 'kg'),
(12, 3, 15, 1.00, 'plaquette');

-- --------------------------------------------------------

--
-- Structure de la table `shopping_lists`
--

DROP TABLE IF EXISTS `shopping_lists`;
CREATE TABLE IF NOT EXISTS `shopping_lists` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `is_public` tinyint(1) DEFAULT '0',
  `created_by` enum('user','company','community') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `estimated_price` decimal(10,2) DEFAULT '0.00',
  `item_count` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_template` (`is_template`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `shopping_lists`
--

INSERT INTO `shopping_lists` (`id`, `user_id`, `name`, `description`, `icon`, `is_template`, `is_public`, `created_by`, `estimated_price`, `item_count`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Courses de la Semaine', 'Les essentiels pour toute la semaine', '📋', 1, 1, 'company', 45.00, 4, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(2, NULL, 'Petit Déjeuner Complet', 'Pour bien commencer la journée', '🏪', 1, 1, 'company', 22.50, 4, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(3, NULL, 'Apéro entre Amis', 'Tout pour un apéro réussi', '🎉', 1, 1, 'community', 35.80, 4, '2025-10-15 07:48:11', '2025-10-15 07:48:11');

-- --------------------------------------------------------

--
-- Structure de la table `shopping_list_items`
--

DROP TABLE IF EXISTS `shopping_list_items`;
CREATE TABLE IF NOT EXISTS `shopping_list_items` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `list_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `quantity` decimal(10,2) DEFAULT '1.00',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `idx_list` (`list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `shopping_list_items`
--

INSERT INTO `shopping_list_items` (`id`, `list_id`, `product_id`, `quantity`, `unit`, `added_at`) VALUES
(1, 1, 16, 1.00, 'pièce', '2025-10-15 07:48:11'),
(2, 1, 3, 1.00, 'L', '2025-10-15 07:48:11'),
(3, 1, 6, 1.00, 'boîte', '2025-10-15 07:48:11'),
(4, 1, 4, 0.50, 'kg', '2025-10-15 07:48:11'),
(5, 2, 17, 1.00, 'boîte', '2025-10-15 07:48:11'),
(6, 2, 18, 1.00, 'bouteille', '2025-10-15 07:48:11'),
(7, 2, 19, 1.00, 'paquet', '2025-10-15 07:48:11'),
(8, 2, 20, 1.00, 'pot', '2025-10-15 07:48:11'),
(9, 3, 21, 2.00, 'sachet', '2025-10-15 07:48:11'),
(10, 3, 22, 2.00, 'sachet', '2025-10-15 07:48:11'),
(11, 3, 23, 1.00, 'pack', '2025-10-15 07:48:11'),
(12, 3, 24, 1.00, 'plateau', '2025-10-15 07:48:11');

-- --------------------------------------------------------

--
-- Structure de la table `stores`
--

DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_city` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `stores`
--

INSERT INTO `stores` (`id`, `name`, `address`, `city`, `postal_code`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'ShopList ', '12 Rue Exemple, 75001 Paris', 'Paris', '75001', 48.85660000, 2.35220000, '2025-10-15 07:48:11'),
(2, 'Shoplist Lyon', '45 Rue Bellecour, 69002 Lyon', 'Lyon', '69002', 45.76400000, 4.83570000, '2025-10-15 07:48:11'),
(3, 'ShopList Marseille', '3 Rue Paradis, 13001 Marseille', 'Marseille', '13001', 43.29650000, 5.36980000, '2025-10-15 07:48:11'),
(4, 'ShopList Paris 15ème', '25 Rue de la Convention, 75015 Paris', 'Paris', '75015', 48.84060000, 2.29500000, '2025-10-15 09:13:33'),
(5, 'ShopList Boulogne-Billancourt', '78 Avenue Jean-Baptiste Clément, 92100 Boulogne-Billancourt', 'Boulogne-Billancourt', '92100', 48.84150000, 2.23990000, '2025-10-15 09:13:33'),
(6, 'Shoplist Montreuil', '15 Boulevard Théophile Sueur, 93100 Montreuil', 'Montreuil', '93100', 48.85890000, 2.44390000, '2025-10-15 09:13:33'),
(8, 'Shoplist CFA ITIS', '46 Bd de l\'Yerres', 'Évry-Courcouronnes', '91000', 48.61896400, 2.42871618, '2025-12-10 14:04:23');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hashed password',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'elyes', 'jaffel', 'elyesjaffel1@gmail.com', '$2y$10$lnhCsu9Vf/Mq3OhcqxvXEOtSUfVrzF2mTqvo7Cb/4v2KaMaijRu7.', '2025-10-15 08:06:30', '2025-10-15 08:06:30'),
(2, 'eaze', 'eaezae', 'yanisamandpro@gmail.com', '$2y$10$Jsb9KoxQTcB64r0bbgELLOmPu.G4qGE5qAS80dpgwGybuMvI4CPOe', '2025-12-10 14:09:00', '2025-12-10 14:09:00'),
(3, 'Yanis', 'AMAND', 'shakzeryt2004@gmail.com', '$2y$10$ZXDjjbe4vmd9phfjqRYQZOEeDjcoB72lLXp4Mb/JPYUqIk4ca.h6G', '2026-01-23 09:35:04', '2026-01-23 09:35:04');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `product_prices`
--
ALTER TABLE `product_prices`
  ADD CONSTRAINT `product_prices_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_prices_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_ingredients_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `shopping_lists`
--
ALTER TABLE `shopping_lists`
  ADD CONSTRAINT `shopping_lists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `shopping_list_items`
--
ALTER TABLE `shopping_list_items`
  ADD CONSTRAINT `shopping_list_items_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `shopping_lists` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shopping_list_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
