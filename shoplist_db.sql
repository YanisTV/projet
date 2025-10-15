-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 15 oct. 2025 à 10:17
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
-- Base de données : `shoplist_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` decimal(10,2) NOT NULL DEFAULT '1.00',
  `price` decimal(10,2) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','ready','completed','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `order_type` enum('online','click_collect') COLLATE utf8mb4_unicode_ci DEFAULT 'online',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'pièce',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `product_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_prices`
--

INSERT INTO `product_prices` (`id`, `product_id`, `store_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2.50', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(2, 1, 2, '2.20', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(3, 2, 1, '1.20', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(4, 2, 2, '1.40', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(5, 3, 1, '1.50', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(6, 3, 2, '1.35', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(7, 4, 1, '18.90', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(8, 4, 2, '19.50', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(9, 5, 1, '3.50', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(10, 5, 2, '3.30', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(11, 6, 1, '2.80', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(12, 6, 2, '2.70', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(13, 7, 1, '4.20', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(14, 7, 2, '4.00', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(15, 8, 1, '3.90', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(16, 8, 2, '3.80', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(17, 9, 1, '1.50', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(18, 9, 2, '1.45', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(19, 10, 1, '3.20', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(20, 10, 2, '3.10', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(21, 11, 1, '5.50', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(22, 11, 2, '5.40', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(23, 12, 1, '3.80', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(24, 12, 2, '3.70', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(25, 13, 1, '1.20', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(26, 13, 2, '1.15', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(27, 14, 1, '1.50', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(28, 14, 2, '1.45', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(29, 15, 1, '4.20', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(30, 15, 2, '4.10', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(31, 16, 1, '1.20', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(32, 16, 2, '1.15', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(33, 17, 1, '3.50', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(34, 17, 2, '3.40', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(35, 18, 1, '2.90', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(36, 18, 2, '2.80', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(37, 19, 1, '1.80', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(38, 19, 2, '1.75', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(39, 20, 1, '3.20', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(40, 20, 2, '3.10', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(41, 21, 1, '2.50', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(42, 21, 2, '2.40', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(43, 22, 1, '2.20', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(44, 22, 2, '2.10', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(45, 23, 1, '4.50', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(46, 23, 2, '4.40', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(47, 24, 1, '5.80', '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(48, 24, 2, '5.70', '2025-10-15 07:48:11', '2025-10-15 07:48:11');

-- --------------------------------------------------------

--
-- Structure de la table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preparation_time` int(11) DEFAULT NULL COMMENT 'Time in minutes',
  `difficulty` enum('Facile','Moyen','Difficile') COLLATE utf8mb4_unicode_ci DEFAULT 'Facile',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `recipe_ingredients` (
  `id` int(10) UNSIGNED NOT NULL,
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`id`, `recipe_id`, `product_id`, `quantity`, `unit`) VALUES
(1, 1, 5, '2.00', 'pièces'),
(2, 1, 6, '2.00', 'pièces'),
(3, 1, 7, '1.00', 'boîte'),
(4, 1, 8, '1.00', 'pot'),
(5, 2, 9, '0.50', 'kg'),
(6, 2, 10, '1.00', 'paquet'),
(7, 2, 6, '3.00', 'pièces'),
(8, 2, 11, '1.00', 'paquet'),
(9, 3, 12, '2.00', 'tablettes'),
(10, 3, 13, '0.20', 'kg'),
(11, 3, 14, '0.15', 'kg'),
(12, 3, 15, '1.00', 'plaquette');

-- --------------------------------------------------------

--
-- Structure de la table `shopping_lists`
--

CREATE TABLE `shopping_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `is_public` tinyint(1) DEFAULT '0',
  `created_by` enum('user','company','community') COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `estimated_price` decimal(10,2) DEFAULT '0.00',
  `item_count` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `shopping_lists`
--

INSERT INTO `shopping_lists` (`id`, `user_id`, `name`, `description`, `icon`, `is_template`, `is_public`, `created_by`, `estimated_price`, `item_count`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Courses de la Semaine', 'Les essentiels pour toute la semaine', '📋', 1, 1, 'company', '45.00', 4, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(2, NULL, 'Petit Déjeuner Complet', 'Pour bien commencer la journée', '🏪', 1, 1, 'company', '22.50', 4, '2025-10-15 07:48:11', '2025-10-15 07:48:11'),
(3, NULL, 'Apéro entre Amis', 'Tout pour un apéro réussi', '🎉', 1, 1, 'community', '35.80', 4, '2025-10-15 07:48:11', '2025-10-15 07:48:11');

-- --------------------------------------------------------

--
-- Structure de la table `shopping_list_items`
--

CREATE TABLE `shopping_list_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `list_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(10,2) DEFAULT '1.00',
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `shopping_list_items`
--

INSERT INTO `shopping_list_items` (`id`, `list_id`, `product_id`, `quantity`, `unit`, `added_at`) VALUES
(1, 1, 16, '1.00', 'pièce', '2025-10-15 07:48:11'),
(2, 1, 3, '1.00', 'L', '2025-10-15 07:48:11'),
(3, 1, 6, '1.00', 'boîte', '2025-10-15 07:48:11'),
(4, 1, 4, '0.50', 'kg', '2025-10-15 07:48:11'),
(5, 2, 17, '1.00', 'boîte', '2025-10-15 07:48:11'),
(6, 2, 18, '1.00', 'bouteille', '2025-10-15 07:48:11'),
(7, 2, 19, '1.00', 'paquet', '2025-10-15 07:48:11'),
(8, 2, 20, '1.00', 'pot', '2025-10-15 07:48:11'),
(9, 3, 21, '2.00', 'sachet', '2025-10-15 07:48:11'),
(10, 3, 22, '2.00', 'sachet', '2025-10-15 07:48:11'),
(11, 3, 23, '1.00', 'pack', '2025-10-15 07:48:11'),
(12, 3, 24, '1.00', 'plateau', '2025-10-15 07:48:11');

-- --------------------------------------------------------

--
-- Structure de la table `stores`
--

CREATE TABLE `stores` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `stores`
--

INSERT INTO `stores` (`id`, `name`, `address`, `city`, `postal_code`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'Magasin Paris', '12 Rue Exemple, 75001 Paris', 'Paris', '75001', '48.85660000', '2.35220000', '2025-10-15 07:48:11'),
(2, 'Magasin Lyon', '45 Rue Bellecour, 69002 Lyon', 'Lyon', '69002', '45.76400000', '4.83570000', '2025-10-15 07:48:11'),
(3, 'Magasin Marseille', '3 Rue Paradis, 13001 Marseille', 'Marseille', '13001', '43.29650000', '5.36980000', '2025-10-15 07:48:11'),
(4, 'Magasin Paris 15ème', '25 Rue de la Convention, 75015 Paris', 'Paris', '75015', '48.84060000', '2.29500000', '2025-10-15 09:13:33'),
(5, 'Magasin Boulogne-Billancourt', '78 Avenue Jean-Baptiste Clément, 92100 Boulogne-Billancourt', 'Boulogne-Billancourt', '92100', '48.84150000', '2.23990000', '2025-10-15 09:13:33'),
(6, 'Magasin Montreuil', '15 Boulevard Théophile Sueur, 93100 Montreuil', 'Montreuil', '93100', '48.85890000', '2.44390000', '2025-10-15 09:13:33'),
(7, 'Magasin Saint-Denis', '32 Avenue du Président Wilson, 93200 Saint-Denis', 'Saint-Denis', '93200', '48.93620000', '2.35440000', '2025-10-15 09:13:33'),
(8, 'Magasin Paris 15ème', '25 Rue de la Convention, 75015 Paris', 'Paris', '75015', '48.84060000', '2.29500000', '2025-10-15 09:17:18'),
(9, 'Magasin Boulogne-Billancourt', '78 Avenue Jean-Baptiste Clément, 92100 Boulogne-Billancourt', 'Boulogne-Billancourt', '92100', '48.84150000', '2.23990000', '2025-10-15 09:17:18'),
(10, 'Magasin Montreuil', '15 Boulevard Théophile Sueur, 93100 Montreuil', 'Montreuil', '93100', '48.85890000', '2.44390000', '2025-10-15 09:17:18'),
(11, 'Magasin Saint-Denis', '32 Avenue du Président Wilson, 93200 Saint-Denis', 'Saint-Denis', '93200', '48.93620000', '2.35440000', '2025-10-15 09:17:18');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hashed password',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'elyes', 'jaffel', 'elyesjaffel1@gmail.com', '$2y$10$lnhCsu9Vf/Mq3OhcqxvXEOtSUfVrzF2mTqvo7Cb/4v2KaMaijRu7.', '2025-10-15 08:06:30', '2025-10-15 08:06:30');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_product` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_status` (`status`);

--
-- Index pour la table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_order` (`order_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category` (`category_id`),
  ADD KEY `idx_name` (`name`);

--
-- Index pour la table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_store` (`product_id`,`store_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `idx_price` (`price`);

--
-- Index pour la table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_difficulty` (`difficulty`);

--
-- Index pour la table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_recipe` (`recipe_id`);

--
-- Index pour la table `shopping_lists`
--
ALTER TABLE `shopping_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_template` (`is_template`);

--
-- Index pour la table `shopping_list_items`
--
ALTER TABLE `shopping_list_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_list` (`list_id`);

--
-- Index pour la table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_city` (`city`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT pour la table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `shopping_lists`
--
ALTER TABLE `shopping_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `shopping_list_items`
--
ALTER TABLE `shopping_list_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

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
