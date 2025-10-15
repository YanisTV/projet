<?php
/**
 * Database Configuration
 * Main configuration file for database connection
 */

// Database credentials
define('DB_HOST', 'localhost');
define('DB_NAME', 'shoplist_db');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_CHARSET', 'utf8mb4');

// Create PDO connection
try {
    $pdo = new PDO(
        "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET,
        DB_USER,
        DB_PASS,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false
        ]
    );
} catch (PDOException $e) {
    http_response_code(500);
    die(json_encode([
        'success' => false,
        'error' => 'Database connection failed'
    ]));
}

/**
 * Helper function to hash passwords
 * @param string $password Plain text password
 * @return string Hashed password
 */
function hashPassword($password) {
    return password_hash($password, PASSWORD_BCRYPT);
}

/**
 * Helper function to verify passwords
 * @param string $password Plain text password
 * @param string $hash Hashed password
 * @return bool True if password matches
 */
function verifyPassword($password, $hash) {
    return password_verify($password, $hash);
}

/**
 * Helper function to send JSON response
 * @param array $data Data to send
 * @param int $statusCode HTTP status code
 */
function sendJsonResponse($data, $statusCode = 200) {
    http_response_code($statusCode);
    header('Content-Type: application/json');
    echo json_encode($data);
    exit;
}

/**
 * Helper function to validate email
 * @param string $email Email to validate
 * @return bool True if valid
 */
function isValidEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL) !== false;
}

/**
 * Start session if not already started
 */
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}