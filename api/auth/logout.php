<?php
/**
 * Logout API
 * Destroys user session
 */

require_once '../config.php';

// Destroy session
session_destroy();

sendJsonResponse([
    'success' => true,
    'message' => 'Déconnexion réussie'
]);