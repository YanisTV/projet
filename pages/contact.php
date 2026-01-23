<?php
// contact.php
$siteName = "ShopList";
$pageTitle = "Contact — $siteName";
?>
<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title><?= htmlspecialchars($pageTitle) ?></title>
  <meta name="description" content="Contactez l'équipe ShopList pour toute question, suggestion ou assistance.">
  <link rel="stylesheet" href="../assets/css/contact.css">
</head>
<body>

  <div class="container">
    <header>
      <a href="../index.php" class="back-btn">Retour à l’accueil</a>

      <div class="logo">S</div>
      <h1>Contactez l’équipe <?= htmlspecialchars($siteName) ?></h1>
      <p class="lead">Une question, une suggestion ou besoin d’aide ? Nous sommes là pour vous répondre.</p>
    </header>

    <section class="contact-section">
      <h2>📬 Envoyez-nous un message</h2>
      <form method="post" action="#">
        <div>
          <label for="name">Nom complet</label>
          <input type="text" id="name" name="name" placeholder="Votre nom" required>
        </div>

        <div>
          <label for="email">Adresse e-mail</label>
          <input type="email" id="email" name="email" placeholder="exemple@mail.com" required>
        </div>

        <div>
          <label for="subject">Sujet</label>
          <input type="text" id="subject" name="subject" placeholder="Sujet de votre message" required>
        </div>

        <div>
          <label for="message">Message</label>
          <textarea id="message" name="message" placeholder="Votre message..." required></textarea>
        </div>

        <button type="submit" class="btn">Envoyer le message</button>
      </form>

      <div class="info">
        <div class="info-card">
          <span>📍</span>
          <div>
            <h3>Adresse</h3>
            <p>123 Rue des Courses, 75000 Paris, France</p>
          </div>
        </div>

        <div class="info-card">
          <span>📧</span>
          <div>
            <h3>Email</h3>
            <p>support@shoplist.fr</p>
          </div>
        </div>

        <div class="info-card">
          <span>☎️</span>
          <div>
            <h3>Téléphone</h3>
            <p>+33 1 23 45 67 89</p>
          </div>
        </div>
      </div>
    </section>

    <footer>
      <p>&copy; <?= date('Y') ?> <?= htmlspecialchars($siteName) ?> — Tous droits réservés</p>
      <p>
        <a href="/pages/cgv.php">CGV</a> • 
        <a href="/pages/mentions.php">Mentions légales</a> • 
        <a href="/pages/about.php">À propos</a>
      </p>
    </footer>
  </div>
    <script src="../assets/js/main.js"></script>
</body>
</html>
