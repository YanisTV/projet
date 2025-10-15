<?php
/**
 * User Login API
 * Handles user authentication
 */

require_once '../config.php';

// Only accept POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendJsonResponse(['success' => false, 'error' => 'Method not allowed'], 405);
}

// Get POST data
$email = trim($_POST['email'] ?? '');
$password = $_POST['password'] ?? '';

// Validation
if (!isValidEmail($email)) {
    sendJsonResponse([
        'success' => false,
        'error' => 'Adresse e-mail invalide'
    ], 400);
}

if (strlen($password) < 8) {
    sendJsonResponse([
        'success' => false,
        'error' => 'Mot de passe invalide'
    ], 400);
}

// Check credentials
try {
    $stmt = $pdo->prepare("
        SELECT id, first_name, last_name, email, password
        FROM users
        WHERE email = ?
    ");
    
    $stmt->execute([$email]);
    $user = $stmt->fetch();
    
    if (!$user || !verifyPassword($password, $user['password'])) {
        sendJsonResponse([
            'success' => false,
            'error' => 'Email ou mot de passe incorrect'
        ], 401);
    }
    
    // Create session
    $_SESSION['user_id'] = $user['id'];
    $_SESSION['user_email'] = $user['email'];
    $_SESSION['user_name'] = $user['first_name'] . ' ' . $user['last_name'];
    
    sendJsonResponse([
        'success' => true,
        'message' => 'Connexion réussie',
        'user' => [
            'id' => $user['id'],
            'email' => $user['email'],
            'name' => $user['first_name'] . ' ' . $user['last_name']
        ]
    ]);
    
} catch (PDOException $e) {
    sendJsonResponse([
        'success' => false,
        'error' => 'Erreur lors de la connexion'
    ], 500);
}