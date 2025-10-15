<?php
/**
 * Check Authentication API
 * Returns current user information if logged in
 */

require_once '../config.php';

// Check if user is logged in
if (isset($_SESSION['user_id'])) {
    sendJsonResponse([
        'success' => true,
        'authenticated' => true,
        'user' => [
            'id' => $_SESSION['user_id'],
            'email' => $_SESSION['user_email'],
            'name' => $_SESSION['user_name']
        ]
    ]);
} else {
    sendJsonResponse([
        'success' => true,
        'authenticated' => false
    ]);
}