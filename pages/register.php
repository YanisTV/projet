<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Créez votre compte ShopList gratuitement">
    <title>Inscription - ShopList</title>
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
                        <div class="auth-icon">✨</div>
                        <h1 class="auth-title">Créez votre compte</h1>
                        <p class="auth-subtitle">
                            Rejoignez ShopList et organisez vos courses facilement
                        </p>
                    </div>

                    <!-- Register Form -->
                    <form class="auth-form" id="registerForm" action="../api/auth/register.php" method="POST">
                        <!-- First Name Field -->
                        <div class="form-group">
                            <label for="firstName" class="form-label">
                                Prénom
                            </label>
                            <input 
                                type="text" 
                                id="firstName" 
                                name="first_name" 
                                class="form-input" 
                                placeholder="Jean"
                                required
                                autocomplete="given-name"
                                minlength="2"
                                maxlength="50"
                            >
                        </div>

                        <!-- Last Name Field -->
                        <div class="form-group">
                            <label for="lastName" class="form-label">
                                Nom
                            </label>
                            <input 
                                type="text" 
                                id="lastName" 
                                name="last_name" 
                                class="form-input" 
                                placeholder="Dupont"
                                required
                                autocomplete="family-name"
                                minlength="2"
                                maxlength="50"
                            >
                        </div>

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
                                    autocomplete="new-password"
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
                            <p class="form-hint">
                                Minimum 8 caractères
                            </p>
                        </div>

                        <!-- Confirm Password Field -->
                        <div class="form-group">
                            <label for="confirmPassword" class="form-label">
                                Confirmer le mot de passe
                            </label>
                            <div class="input-with-icon">
                                <input 
                                    type="password" 
                                    id="confirmPassword" 
                                    name="confirm_password" 
                                    class="form-input" 
                                    placeholder="••••••••"
                                    required
                                    autocomplete="new-password"
                                    minlength="8"
                                >
                                <button 
                                    type="button" 
                                    class="input-icon-btn" 
                                    id="toggleConfirmPassword"
                                    aria-label="Afficher le mot de passe"
                                >
                                    👁️
                                </button>
                            </div>
                        </div>

                        <!-- Terms & Conditions -->
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" name="terms" class="form-checkbox" required>
                                <span>
                                    J'accepte les 
                                    <a href="cgv.php" class="form-link" target="_blank">
                                        Conditions Générales de Vente
                                    </a>
                                    et les
                                    <a href="legal.php" class="form-link" target="_blank">
                                        Mentions Légales
                                    </a>
                                </span>
                            </label>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary btn-full">
                            Créer mon compte
                        </button>

                        <!-- Error/Success Message Container -->
                        <div id="errorMessage" class="error-message" style="display: none;"></div>
                        <div id="successMessage" class="success-message" style="display: none;"></div>
                    </form>

                    <!-- Card Footer -->
                    <div class="auth-footer">
                        <p class="auth-footer-text">
                            Vous avez déjà un compte ?
                            <a href="login.php" class="auth-footer-link">
                                Connectez-vous
                            </a>
                        </p>
                    </div>
                </div>

                <!-- Additional Info -->
                <div class="auth-info">
                    <div class="info-card">
                        <span class="info-icon">🎉</span>
                        <p class="info-text">Inscription rapide et gratuite</p>
                    </div>
                    <div class="info-card">
                        <span class="info-icon">📋</span>
                        <p class="info-text">Créez vos listes immédiatement</p>
                    </div>
                    <div class="info-card">
                        <span class="info-icon">💾</span>
                        <p class="info-text">Sauvegardez vos listes en ligne</p>
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