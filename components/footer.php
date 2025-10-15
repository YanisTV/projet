<?php
/**
 * Footer Component
 * Reusable footer section
 */

// Define base path for navigation
$basePath = dirname($_SERVER['PHP_SELF']);
$isInPages = strpos($basePath, '/pages') !== false;
$baseUrl = $isInPages ? '..' : '.';
?>
<footer class="main-footer">
    <div class="footer-container">
        <!-- Footer Top Section -->
        <div class="footer-content">
            <!-- About Section -->
            <div class="footer-section">
                <h3 class="footer-title">ShopList</h3>
                <p class="footer-description">
                    Organisez vos courses efficacement avec notre application de liste de courses intelligente.
                </p>
            </div>

            <!-- Quick Links -->
            <div class="footer-section">
                <h4 class="footer-heading">Liens rapides</h4>
                <ul class="footer-links">
                    <li><a href="../pages/cgv.php" class="footer-link">Conditions Générales de Vente</a></li>
                    <li><a href="../pages/legal.php" class="footer-link">Mentions Légales</a></li>
                    <li><a href="../pages/contact.php" class="footer-link">Nous Contacter</a></li>
                </ul>
            </div>

            <!-- Social Media -->
            <div class="footer-section">
                <h4 class="footer-heading">Suivez-nous</h4>
                <div class="social-links">
                    <a href="#" class="social-link" aria-label="Facebook">
                        <span class="social-icon">📘</span>
                    </a>
                    <a href="#" class="social-link" aria-label="Twitter">
                        <span class="social-icon">🐦</span>
                    </a>
                    <a href="#" class="social-link" aria-label="Instagram">
                        <span class="social-icon">📷</span>
                    </a>
                    <a href="#" class="social-link" aria-label="LinkedIn">
                        <span class="social-icon">💼</span>
                    </a>
                </div>
            </div>
        </div>

        <!-- Footer Bottom -->
        <div class="footer-bottom">
            <p class="footer-copyright">
                &copy; <?php echo date('Y'); ?> ShopList. Tous droits réservés.
            </p>
        </div>
    </div>
</footer>