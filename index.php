<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="ShopList - Application intelligente de liste de courses pour mieux organiser vos achats">
    <title>ShopList - Listes de Courses Intelligentes</title>
    <link rel="stylesheet" href="../assets/css/main.css">
</head>
<body>
    <!-- Include Header -->
    <?php include 'components/header.php'; ?>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Hero Section -->
        <section class="hero-section">
            <div class="hero-container">
                <div class="hero-content">
                    <h1 class="hero-title">
                        Faites vos courses plus intelligemment, <br>
                        <span class="hero-highlight">Gagnez du temps</span>
                    </h1>
                    <p class="hero-description">
                        Créez, organisez et gérez vos listes de courses sans effort. 
                        N'oubliez plus jamais un article avec notre compagnon de courses intelligent.
                    </p>
                    <div class="hero-actions">
                        <a href="pages/register.php" class="btn btn-primary btn-large">
                            Commencer gratuitement
                        </a>
                        <a href="#features" class="btn btn-outline btn-large">
                            En savoir plus
                        </a>
                    </div>
                </div>
                <div class="hero-image">
                    <div class="hero-illustration">
                        <span class="illustration-icon">🛒</span>
                    </div>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features-section" id="features">
            <div class="features-container">
                <h2 class="section-title">Pourquoi choisir ShopList ?</h2>
                <p class="section-subtitle">
                    Tout ce dont vous avez besoin pour organiser vos courses en un seul endroit
                </p>

                <div class="features-grid">
                    <!-- Feature 1 -->
                    <div class="feature-card">
                        <div class="feature-icon">📝</div>
                        <h3 class="feature-title">Organisation facile</h3>
                        <p class="feature-description">
                            Créez plusieurs listes et organisez vos articles par catégories pour des courses efficaces.
                        </p>
                    </div>

                    <!-- Feature 2 -->
                    <div class="feature-card">
                        <div class="feature-icon">📱</div>
                        <h3 class="feature-title">Mobile d'abord</h3>
                        <p class="feature-description">
                            Accédez à vos listes n'importe où, n'importe quand avec notre interface optimisée mobile.
                        </p>
                    </div>

                    <!-- Feature 3 -->
                    <div class="feature-card">
                        <div class="feature-icon">✅</div>
                        <h3 class="feature-title">Suivez votre progression</h3>
                        <p class="feature-description">
                            Cochez les articles au fur et à mesure et ne manquez plus rien de votre liste.
                        </p>
                    </div>

                    <!-- Feature 4 -->
                    <div class="feature-card">
                        <div class="feature-icon">🔒</div>
                        <h3 class="feature-title">Sécurisé et privé</h3>
                        <p class="feature-description">
                            Vos données sont cryptées et sécurisées. Nous respectons votre vie privée.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="cta-section">
            <div class="cta-container">
                <h2 class="cta-title">Prêt à commencer ?</h2>
                <p class="cta-description">
                    Rejoignez des milliers d'utilisateurs qui organisent leurs courses avec ShopList
                </p>
                <a href="pages/register.php" class="btn btn-primary btn-large">
                    Créer votre compte
                </a>
            </div>
        </section>
    </main>

    <!-- Include Footer -->
    <?php include 'components/footer.php'; ?>

    <!-- JavaScript -->
    <script src="assets/js/main.js"></script>
</body>
</html>