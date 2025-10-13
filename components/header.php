<?php
/**
 * Header Component
 * Reusable navigation header
 */

// Define base path for navigation
$basePath = dirname($_SERVER['PHP_SELF']);
$isInPages = strpos($basePath, '/pages') !== false;
$baseUrl = $isInPages ? '..' : '.';
?>
<link rel="stylesheet" href="assets/css/header.css">
<link rel="stylesheet" href="assets/css/main.css">
<header class="main-header">
    <nav class="navbar">
        <div class="nav-container">
            <!-- Logo -->
            <div class="nav-logo">
                <a href="<?php echo $baseUrl; ?>/index.php">
                    <img 
                        src="<?php echo $baseUrl; ?>/assets/images/logo.png" 
                        alt="ShopList Logo" 
                        class="logo-image"
                    >
                    <span class="logo-text">ShopList</span>
                </a>
            </div>

            <!-- Mobile Menu Toggle -->
            <button class="nav-toggle" id="navToggle" aria-label="Toggle navigation">
                <span class="hamburger"></span>
            </button>

            <!-- Navigation Links -->
            <div class="nav-menu" id="navMenu">
                <ul class="nav-list">
                    <li class="nav-item">
                        <a href="<?php echo $baseUrl; ?>/index.php" class="nav-link">Accueil</a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo $baseUrl; ?>/pages/store_list.php" class="nav-link">Listes Des Magasins</a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo $baseUrl; ?>/pages/about.php" class="nav-link">À propos</a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo $baseUrl; ?>/pages/contact.php" class="nav-link">Contact</a>
                    </li>
                </ul>

                <!-- Auth Buttons -->
                <div class="nav-auth">
                    <a href="<?php echo $baseUrl; ?>/pages/login.php" class="btn btn-outline">Connexion</a>
                    <a href="<?php echo $baseUrl; ?>/pages/register.php" class="btn btn-primary">Inscription</a>
                </div>
            </div>
        </div>
    </nav>
</header>