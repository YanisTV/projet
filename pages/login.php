<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Connectez-vous à votre compte ShopList">
    <title>Connexion - ShopList</title>
    <link rel="stylesheet" href="../assets/css/main.css">
</head>
<body>
    <!-- Include Header -->
    <?php include '../components/header.php'; ?>

    <!-- Main Content -->
    <main class="main-content">
        <section class="auth-section">
            <div class="auth-container">
                <div class="auth-card">
                    <!-- Card Header -->
                    <div class="auth-header">
                        <div class="auth-icon">🔐</div>
                        <h1 class="auth-title">Bon retour !</h1>
                        <p class="auth-subtitle">
                            Connectez-vous pour accéder à vos listes de courses
                        </p>
                    </div>

                    <!-- Login Form -->
                    <form class="auth-form" id="loginForm" action="../api/auth/login.php" method="POST">
                        <!-- Email Field -->
                        <div class="form-group">
                            <label for="email" class="form-label">
                                Adresse e-mail
                            </label>
                            <input 
                                type="email" 
                                id="email" 
                                name="email" 
                                class="form-input" 
                                placeholder="vous@exemple.com"
                                required
                                autocomplete="email"
                            >
                        </div>

                        <!-- Password Field -->
                        <div class="form-group">
                            <label for="password" class="form-label">
                                Mot de passe
                            </label>
                            <div class="input-with-icon">
                                <input 
                                    type="password" 
                                    id="password" 
                                    name="password" 
                                    class="form-input" 
                                    placeholder="••••••••"
                                    required
                                    autocomplete="current-password"
                                    minlength="8"
                                >
                                <button 
                                    type="button" 
                                    class="input-icon-btn" 
                                    id="togglePassword"
                                    aria-label="Afficher le mot de passe"
                                >
                                    👁️
                                </button>
                            </div>
                        </div>

                        <!-- Remember Me & Forgot Password -->
                        <div class="form-options">
                            <label class="checkbox-label">
                                <input type="checkbox" name="remember" class="form-checkbox">
                                <span>Se souvenir de moi</span>
                            </label>
                            <a href="forgot-password.php" class="form-link">
                                Mot de passe oublié ?
                            </a>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary btn-full">
                            Se connecter
                        </button>

                        <!-- Error Message Container -->
                        <div id="errorMessage" class="error-message" style="display: none;"></div>
                    </form>

                    <!-- Card Footer -->
                    <div class="auth-footer">
                        <p class="auth-footer-text">
                            Vous n'avez pas de compte ?
                            <a href="register.php" class="auth-footer-link">
                                Inscrivez-vous gratuitement
                            </a>
                        </p>
                    </div>
                </div>

                <!-- Additional Info -->
                <div class="auth-info">
                    <div class="info-card">
                        <span class="info-icon">🚀</span>
                        <p class="info-text">Accès rapide à vos listes de courses</p>
                    </div>
                    <div class="info-card">
                        <span class="info-icon">🔒</span>
                        <p class="info-text">Vos données sont sécurisées</p>
                    </div>
                    <div class="info-card">
                        <span class="info-icon">📱</span>
                        <p class="info-text">Disponible sur tous vos appareils</p>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Include Footer -->
    <?php include '../components/footer.php'; ?>

    <!-- JavaScript -->
    <script src="../assets/js/main.js"></script>
    <script src="../assets/js/auth.js"></script>
</body>
</html>