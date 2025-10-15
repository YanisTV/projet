<?php
// Détection du chemin de base
$basePath = dirname($_SERVER['PHP_SELF']);
$isInPages = strpos($basePath, '/pages') !== false;
$baseUrl = $isInPages ? '..' : '.';

// Démarrage de la session
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Vérifier si l'utilisateur est connecté
$isLoggedIn = isset($_SESSION['user_id']);
$userName = $_SESSION['user_name'] ?? '';
?>

<header class="main-header">
    <nav class="navbar">
        <div class="nav-container">
            <!-- Logo -->
            <div class="nav-logo">
                <a href="<?= $baseUrl . '/index.php' ?>">
                    <img src="<?= $baseUrl . '/assets/images/logo.png' ?>" alt="ShopList Logo" class="logo-image">
                    <span class="logo-text">ShopList</span>
                </a>
            </div>

            <!-- Theme Toggle -->
            <div class="theme-toggle">
                <button id="themeButton" class="btn btn-outline">🌙 / ☀️</button>
            </div>

            <!-- Mobile Menu Toggle -->
            <button class="nav-toggle" id="navToggle" aria-label="Toggle navigation">
                <span class="hamburger"></span>
            </button>

            <!-- Navigation Links -->
            <div class="nav-menu" id="navMenu">
                <ul class="nav-list">
                    <li><a href="<?= $baseUrl . '/index.php' ?>" class="nav-link">Accueil</a></li>
                    <li><a href="<?= $baseUrl . '/pages/shop.php' ?>" class="nav-link">Boutique</a></li>
                    <li><a href="<?= $baseUrl . '/pages/store_list.php' ?>" class="nav-link">Magasins</a></li>
                    <li><a href="<?= $baseUrl . '/pages/about.php' ?>" class="nav-link">À propos</a></li>
                    <li><a href="<?= $baseUrl . '/pages/contact.php' ?>" class="nav-link">Contact</a></li>
                </ul>

                <!-- Auth Section -->
                <div class="nav-auth">
                    <?php if ($isLoggedIn): ?>
                        <span class="user-greeting">
                            Connecté en tant que <strong><?= htmlspecialchars($userName) ?></strong>
                        </span>
                        <button id="logoutBtn" class="btn btn-outline">Déconnexion</button>
                    <?php else: ?>
                        <a href="<?= $baseUrl . '/pages/login.php' ?>" class="btn btn-outline">Connexion</a>
                        <a href="<?= $baseUrl . '/pages/register.php' ?>" class="btn btn-primary">Inscription</a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </nav>
</header>

<!-- Liens externes -->
<link rel="stylesheet" href="<?= $baseUrl . '/assets/css/header.css' ?>">
<script src="<?= $baseUrl . '/assets/js/header.js' ?>" defer></script>
