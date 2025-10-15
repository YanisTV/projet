<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Découvrez nos produits, recettes et listes de courses">
    <title>Catalogue - ShopList</title>
    <link rel="stylesheet" href="../assets/css/main.css">
</head>
<body>
    <!-- Include Header -->
    <?php include '../components/header.php'; ?>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Hero Section -->
        <section class="shop-hero">
            <div class="shop-hero-container">
                <h1 class="shop-hero-title">Faites vos courses intelligemment</h1>
                <p class="shop-hero-subtitle">Découvrez nos produits, recettes et listes toutes prêtes</p>
                
                <!-- Search Bar -->
                <div class="search-bar">
                    <input 
                        type="text" 
                        id="searchInput" 
                        class="search-input" 
                        placeholder="Rechercher un produit, une recette..."
                    >
                    <button class="search-btn">
                        <span>🔍</span>
                    </button>
                </div>

                <!-- Cart Icon -->
                <div class="cart-icon-wrapper">
                    <button class="cart-icon-btn" id="cartToggle">
                        🛒
                        <span class="cart-badge" id="cartBadge">0</span>
                    </button>
                </div>
            </div>
        </section>

        <!-- Filters/Tabs -->
        <section class="filters-section">
            <div class="filters-container">
                <button class="filter-btn active" data-filter="all">Tous</button>
                <button class="filter-btn" data-filter="products">Produits</button>
                <button class="filter-btn" data-filter="recipes">Recettes</button>
                <button class="filter-btn" data-filter="lists">Listes</button>
            </div>
        </section>

        <!-- Products Section -->
        <section class="products-section">
            <div class="products-container">
                <h2 class="section-title">Nos Produits</h2>
                
                <div class="products-grid" id="productsGrid">
                    <!-- Product Card 1 -->
                    <div class="product-card" data-category="products">
                        <div class="product-image">
                            <span class="product-emoji">🍎</span>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Pommes Bio</h3>
                            <p class="product-description">Pommes rouges fraîches du verger</p>
                            <div class="product-prices">
                                <div class="price-item">
                                    <span class="store-name">Magasin A</span>
                                    <span class="price">2,50€/kg</span>
                                </div>
                                <div class="price-item">
                                    <span class="store-name">Magasin B</span>
                                    <span class="price best-price">2,20€/kg</span>
                                </div>
                            </div>
                            <button class="btn btn-primary btn-add-cart" 
                                    data-id="1" 
                                    data-name="Pommes Bio" 
                                    data-price="2.20">
                                Ajouter au panier
                            </button>
                        </div>
                    </div>

                    <!-- Product Card 2 -->
                    <div class="product-card" data-category="products">
                        <div class="product-image">
                            <span class="product-emoji">🥖</span>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Baguette Tradition</h3>
                            <p class="product-description">Pain frais cuit au feu de bois</p>
                            <div class="product-prices">
                                <div class="price-item">
                                    <span class="store-name">Magasin A</span>
                                    <span class="price best-price">1,20€</span>
                                </div>
                                <div class="price-item">
                                    <span class="store-name">Magasin B</span>
                                    <span class="price">1,40€</span>
                                </div>
                            </div>
                            <button class="btn btn-primary btn-add-cart" 
                                    data-id="2" 
                                    data-name="Baguette Tradition" 
                                    data-price="1.20">
                                Ajouter au panier
                            </button>
                        </div>
                    </div>

                    <!-- Product Card 3 -->
                    <div class="product-card" data-category="products">
                        <div class="product-image">
                            <span class="product-emoji">🥛</span>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Lait Demi-écrémé</h3>
                            <p class="product-description">Lait frais de la ferme 1L</p>
                            <div class="product-prices">
                                <div class="price-item">
                                    <span class="store-name">Magasin A</span>
                                    <span class="price">1,50€</span>
                                </div>
                                <div class="price-item">
                                    <span class="store-name">Magasin B</span>
                                    <span class="price best-price">1,35€</span>
                                </div>
                            </div>
                            <button class="btn btn-primary btn-add-cart" 
                                    data-id="3" 
                                    data-name="Lait Demi-écrémé" 
                                    data-price="1.35">
                                Ajouter au panier
                            </button>
                        </div>
                    </div>

                    <!-- Product Card 4 -->
                    <div class="product-card" data-category="products">
                        <div class="product-image">
                            <span class="product-emoji">🧀</span>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Fromage Comté</h3>
                            <p class="product-description">Fromage AOP affiné 12 mois</p>
                            <div class="product-prices">
                                <div class="price-item">
                                    <span class="store-name">Magasin A</span>
                                    <span class="price best-price">18,90€/kg</span>
                                </div>
                                <div class="price-item">
                                    <span class="store-name">Magasin B</span>
                                    <span class="price">19,50€/kg</span>
                                </div>
                            </div>
                            <button class="btn btn-primary btn-add-cart" 
                                    data-id="4" 
                                    data-name="Fromage Comté" 
                                    data-price="18.90">
                                Ajouter au panier
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Recipes Section -->
        <section class="recipes-section">
            <div class="recipes-container">
                <h2 class="section-title">Recettes Inspirantes</h2>
                
                <div class="products-grid" id="recipesGrid">
                    <!-- Recipe Card 1 -->
                    <div class="recipe-card" data-category="recipes">
                        <div class="recipe-image">
                            <span class="recipe-emoji">🥗</span>
                        </div>
                        <div class="recipe-info">
                            <h3 class="recipe-name">Salade Niçoise</h3>
                            <p class="recipe-description">Une salade fraîche et complète</p>
                            <div class="recipe-meta">
                                <span class="recipe-time">⏱️ 20 min</span>
                                <span class="recipe-difficulty">👨‍🍳 Facile</span>
                            </div>
                            <div class="recipe-actions">
                                <button class="btn btn-outline btn-view-recipe" data-recipe="1">
                                    Voir la recette
                                </button>
                                <button class="btn btn-primary btn-add-recipe" data-recipe="1">
                                    Ajouter au panier
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Recipe Card 2 -->
                    <div class="recipe-card" data-category="recipes">
                        <div class="recipe-image">
                            <span class="recipe-emoji">🍝</span>
                        </div>
                        <div class="recipe-info">
                            <h3 class="recipe-name">Pâtes Carbonara</h3>
                            <p class="recipe-description">La vraie recette italienne</p>
                            <div class="recipe-meta">
                                <span class="recipe-time">⏱️ 25 min</span>
                                <span class="recipe-difficulty">👨‍🍳 Moyen</span>
                            </div>
                            <div class="recipe-actions">
                                <button class="btn btn-outline btn-view-recipe" data-recipe="2">
                                    Voir la recette
                                </button>
                                <button class="btn btn-primary btn-add-recipe" data-recipe="2">
                                    Ajouter au panier
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Recipe Card 3 -->
                    <div class="recipe-card" data-category="recipes">
                        <div class="recipe-image">
                            <span class="recipe-emoji">🍰</span>
                        </div>
                        <div class="recipe-info">
                            <h3 class="recipe-name">Gâteau au Chocolat</h3>
                            <p class="recipe-description">Fondant et gourmand</p>
                            <div class="recipe-meta">
                                <span class="recipe-time">⏱️ 45 min</span>
                                <span class="recipe-difficulty">👨‍🍳 Facile</span>
                            </div>
                            <div class="recipe-actions">
                                <button class="btn btn-outline btn-view-recipe" data-recipe="3">
                                    Voir la recette
                                </button>
                                <button class="btn btn-primary btn-add-recipe" data-recipe="3">
                                    Ajouter au panier
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Pre-made Lists Section -->
        <section class="lists-section">
            <div class="lists-container">
                <h2 class="section-title">Listes Toutes Prêtes</h2>
                
                <div class="products-grid" id="listsGrid">
                    <!-- List Card 1 -->
                    <div class="list-card" data-category="lists">
                        <div class="list-header">
                            <span class="list-icon">📋</span>
                            <span class="list-badge">Communauté</span>
                        </div>
                        <div class="list-info">
                            <h3 class="list-name">Courses de la Semaine</h3>
                            <p class="list-description">Les essentiels pour toute la semaine</p>
                            <div class="list-items">
                                <span class="list-item-count">12 articles</span>
                                <span class="list-price">≈ 45,00€</span>
                            </div>
                            <div class="list-actions">
                                <button class="btn btn-outline btn-view-list" data-list="1">
                                    Voir la liste
                                </button>
                                <button class="btn btn-primary btn-add-list" data-list="1">
                                    Ajouter au panier
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- List Card 2 -->
                    <div class="list-card" data-category="lists">
                        <div class="list-header">
                            <span class="list-icon">🏪</span>
                            <span class="list-badge official">Officiel</span>
                        </div>
                        <div class="list-info">
                            <h3 class="list-name">Petit Déjeuner Complet</h3>
                            <p class="list-description">Pour bien commencer la journée</p>
                            <div class="list-items">
                                <span class="list-item-count">8 articles</span>
                                <span class="list-price">≈ 22,50€</span>
                            </div>
                            <div class="list-actions">
                                <button class="btn btn-outline btn-view-list" data-list="2">
                                    Voir la liste
                                </button>
                                <button class="btn btn-primary btn-add-list" data-list="2">
                                    Ajouter au panier
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- List Card 3 -->
                    <div class="list-card" data-category="lists">
                        <div class="list-header">
                            <span class="list-icon">🎉</span>
                            <span class="list-badge">Communauté</span>
                        </div>
                        <div class="list-info">
                            <h3 class="list-name">Apéro entre Amis</h3>
                            <p class="list-description">Tout pour un apéro réussi</p>
                            <div class="list-items">
                                <span class="list-item-count">15 articles</span>
                                <span class="list-price">≈ 35,80€</span>
                            </div>
                            <div class="list-actions">
                                <button class="btn btn-outline btn-view-list" data-list="3">
                                    Voir la liste
                                </button>
                                <button class="btn btn-primary btn-add-list" data-list="3">
                                    Ajouter au panier
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        
    </main>

    <!-- Shopping Cart Sidebar -->
    <div class="cart-sidebar" id="cartSidebar">
        <div class="cart-header">
            <h2 class="cart-title">Mon Panier</h2>
            <button class="cart-close" id="cartClose">✕</button>
        </div>
        <div class="cart-items" id="cartItems">
            <p class="cart-empty">Votre panier est vide</p>
        </div>
        <div class="cart-footer">
            <div class="cart-total">
                <span class="cart-total-label">Total</span>
                <span class="cart-total-price" id="cartTotal">0,00€</span>
            </div>
            <button class="btn btn-primary btn-full" id="checkoutBtn">
                Commander
            </button>
        </div>
    </div>

    <!-- Overlay -->
    <div class="cart-overlay" id="cartOverlay"></div>

    <!-- Include Footer -->
    <?php include '../components/footer.php'; ?>

    <!-- JavaScript -->
    <script src="../assets/js/main.js"></script>
    <script src="../assets/js/shop.js"></script>
</body>
</html>