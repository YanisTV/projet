<?php
// about.php
// Modifie ces variables si besoin
$siteName = "ShopList";
$pageTitle = "À propos — $siteName";
?>
<!doctype html>
<html lang="fr">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title><?= htmlspecialchars($pageTitle) ?></title>
    <link rel="stylesheet" href="../assets/css/about.css">
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="../assets/css/header.css">
    <meta name="description"
        content="ShopList — Organisez vos courses, gagnez du temps et ne ratez plus aucun article." />
</head>

<body>
    <div class="container">
        <header>
            <a href="../index.php" class="back-btn">Retour à l’accueil</a>
            <div class="brand">
                <div class="logo"><?= strtoupper($siteName[0]) ?></div>
                <div>
                    <div class="site-title"><strong><?= htmlspecialchars($siteName) ?></strong></div>
                    <div class="small">Votre compagnon de courses intelligent</div>
                </div>
            </div>
            <div class="header-right">
                <a class="btn btn-ghost" href="login.php">Se connecter</a>
                <a class="btn btn-primary" href="register.php">Créer un compte</a>
            </div>
        </header>

        <main>
            <section class="hero" aria-labelledby="hero-title">
                <h2 id="hero-title">Faites vos courses plus intelligemment — Gagnez du temps</h2>
                <p class="lead">Créez, organisez et gérez vos listes de courses sans effort. N'oubliez plus jamais un
                    article grâce à notre compagnon de courses intelligent, accessible partout depuis votre mobile.</p>

                <div class="cta-row">
                    <a class="btn btn-primary" href="register.php">Commencer gratuitement</a>
                </div>

                <div class="progress-note">Des milliers d'utilisateurs organisent déjà leurs courses avec
                    <?= htmlspecialchars($siteName) ?>.</div>
            </section>

            <section class="features" aria-label="Fonctionnalités principales">
                <article class="card">
                    <div class="icon">📝</div>
                    <div>
                        <h3>Organisation facile</h3>
                        <p>Créez plusieurs listes et organisez vos articles par catégories pour des courses rapides et
                            efficaces.</p>
                    </div>
                </article>

                <article class="card">
                    <div class="icon">📱</div>
                    <div>
                        <h3>Mobile d'abord</h3>
                        <p>Accédez à vos listes n'importe où, n'importe quand grâce à notre interface optimisée pour
                            mobile.</p>
                    </div>
                </article>

                <article class="card">
                    <div class="icon">✅</div>
                    <div>
                        <h3>Suivez votre progression</h3>
                        <p>Cochez les articles au fur et à mesure et ne manquez plus rien. Gagnez du temps en magasin.
                        </p>
                    </div>
                </article>

                <article class="card">
                    <div class="icon">🔒</div>
                    <div>
                        <h3>Sécurisé et privé</h3>
                        <p>Vos données sont cryptées et stockées en toute sécurité. Nous respectons votre vie privée.
                        </p>
                    </div>
                </article>
            </section>

            <section style="margin-top:18px;">
                <div class="card" style="align-items:center;justify-content:space-between;">
                    <div style="display:flex;gap:12px;align-items:center">
                        <div class="icon">🛒</div>
                        <div>
                            <h3>Prêt à commencer ?</h3>
                            <p class="small">Rejoignez des milliers d'utilisateurs qui organisent leurs courses avec
                                <?= htmlspecialchars($siteName) ?>.</p>
                        </div>
                    </div>
                    <div>
                        <a class="btn btn-primary" href="register.php">Créer votre compte</a>
                    </div>
                </div>
            </section>
        </main>

        <footer>
            <div class="links small">
                <a href="/cgv.php">Conditions Générales de Vente</a>
                <span>•</span>
                <a href="/mentions.php">Mentions Légales</a>
                <span>•</span>
                <a href="/contact.php">Nous Contacter</a>
            </div>

            <div style="display:flex;gap:14px;align-items:center">
                <div class="socials" aria-label="Suivez-nous">
                    <a href="#" title="Facebook">📘</a>
                    <a href="#" title="Twitter">🐦</a>
                    <a href="#" title="Instagram">📷</a>
                    <a href="#" title="LinkedIn">💼</a>
                </div>
                <div class="small">&copy; <?= date('Y') ?> <?= htmlspecialchars($siteName) ?></div>
            </div>
        </footer>
    </div>
</body>

</html>