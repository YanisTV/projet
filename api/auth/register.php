<?php
/**
 * User Registration API
 * Handles new user registration with password hashing
 */

require_once '../config.php';

// Only accept POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendJsonResponse(['success' => false, 'error' => 'Method not allowed'], 405);
}

// Get POST data
$firstName = trim($_POST['first_name'] ?? '');
$lastName = trim($_POST['last_name'] ?? '');
$email = trim($_POST['email'] ?? '');
$password = $_POST['password'] ?? '';
$confirmPassword = $_POST['confirm_password'] ?? '';

// Validation
$errors = [];

if (strlen($firstName) < 2) {
    $errors[] = 'Le prénom doit contenir au moins 2 caractères';
}

if (strlen($lastName) < 2) {
    $errors[] = 'Le nom doit contenir au moins 2 caractères';
}

if (!isValidEmail($email)) {
    $errors[] = 'Adresse e-mail invalide';
}

if (strlen($password) < 8) {
    $errors[] = 'Le mot de passe doit contenir au moins 8 caractères';
}

if ($password !== $confirmPassword) {
    $errors[] = 'Les mots de passe ne correspondent pas';
}

// Return validation errors
if (!empty($errors)) {
    sendJsonResponse(['success' => false, 'errors' => $errors], 400);
}

// Check if email already exists
try {
    $stmt = $pdo->prepare("SELECT id FROM users WHERE email = ?");
    $stmt->execute([$email]);
    
    if ($stmt->fetch()) {
        sendJsonResponse([
            'success' => false,
            'error' => 'Cette adresse e-mail est déjà utilisée'
        ], 400);
    }
    
    // Hash password and insert user
    $hashedPassword = hashPassword($password);
    
    $stmt = $pdo->prepare("
        INSERT INTO users (first_name, last_name, email, password)
        VALUES (?, ?, ?, ?)
    ");
    
    $stmt->execute([$firstName, $lastName, $email, $hashedPassword]);
    
    $userId = $pdo->lastInsertId();
    
    // Create session
    $_SESSION['user_id'] = $userId;
    $_SESSION['user_email'] = $email;
    $_SESSION['user_name'] = $firstName . ' ' . $lastName;
    
    sendJsonResponse([
        'success' => true,
        'message' => 'Inscription réussie',
        'user' => [
            'id' => $userId,
            'email' => $email,
            'name' => $firstName . ' ' . $lastName
        ]
    ], 201);
    
} catch (PDOException $e) {
    sendJsonResponse([
        'success' => false,
        'error' => 'Erreur lors de l\'inscription'
    ], 500);
}