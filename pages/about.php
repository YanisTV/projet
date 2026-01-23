<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>À propos - ShopList</title>

    <!-- CSS global + spécifique -->
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="../assets/css/store_list.css">
</head>

<body>
    <?php include '../components/header.php'; ?>

    <main class="main-content">

        <!-- Hero -->
        <section class="features-section">
            <div class="features-container">
                <h1 class="section-title">À propos de ShopList</h1>
                <p class="section-subtitle">
                    Une application pensée pour comparer, organiser et mieux consommer
                </p>

                <div class="features-grid">

                    <div class="feature-card">
                        <div class="feature-icon">🛒</div>
                        <h2 class="feature-title">Le concept</h2>
                        <p class="feature-description">
                            <strong>ShopList</strong> est une application web développée dans le cadre
                            d’un projet pédagogique en <strong>Bachelor CPI</strong>.
                            <br><br>
                            Elle permet de comparer les prix de produits dans différents magasins,
                            de créer des listes de courses et d’optimiser son budget.
                        </p>
                    </div>

                    <div class="feature-card">
                        <div class="feature-icon">🎯</div>
                        <h2 class="feature-title">Les objectifs</h2>
                        <p class="feature-description">
                            L’objectif principal est de mettre en pratique les compétences acquises
                            en développement web :
                            <br><br>
                            • Gestion de base de données<br>
                            • Sécurité et bonnes pratiques<br>
                            • Expérience utilisateur (UX/UI)
                        </p>
                    </div>

                    <div class="feature-card">
                        <div class="feature-icon">🧠</div>
                        <h2 class="feature-title">Fonctionnalités</h2>
                        <p class="feature-description">
                            ShopList propose notamment :
                            <br><br>
                            • Comparaison de prix entre magasins<br>
                            • Gestion de panier<br>
                            • Création de listes personnalisées<br>
                            • Recherche et filtres dynamiques
                        </p>
                    </div>

                    <div class="feature-card">
                        <div class="feature-icon">💻</div>
                        <h2 class="feature-title">Technologies utilisées</h2>
                        <p class="feature-description">
                            Le projet repose sur les technologies suivantes :
                            <br><br>
                            • HTML / CSS / JavaScript<br>
                            • PHP)<br>
                            • Base de données MySQL<br>
                            • Hébergement 
                        </p>
                    </div>

                </div>

            </div>
        </section>

        <!-- CTA -->
        <section class="cta-section">
            <div class="cta-container">
                <h2 class="cta-title">Un projet en constante évolution</h2>
                <p class="cta-description">
                    ShopList est amené à évoluer avec l’ajout de nouvelles fonctionnalités
                    et l’amélioration continue de l’expérience utilisateur.
                </p>
                <a href="../pages/contact.php" class="btn btn-primary btn-large">
                    Nous contacter
                </a>
            </div>
        </section>

    </main>

    <?php include '../components/footer.php'; ?>
        <script src="../assets/js/main.js"></script>
</body>
</html>
