<?php
/**
 * Stores API
 * Get all store locations
 */

require_once '../config.php';

// Allow GET requests
if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    sendJsonResponse(['success' => false, 'error' => 'Method not allowed'], 405);
}

try {
    $stmt = $pdo->query("
        SELECT 
            id,
            name as nom,
            address as adresse,
            city,
            postal_code,
            latitude,
            longitude
        FROM stores
        ORDER BY name
    ");
    
    $stores = $stmt->fetchAll();
    
    sendJsonResponse([
        'success' => true,
        'stores' => $stores
    ]);
    
} catch (PDOException $e) {
    sendJsonResponse([
        'success' => false,
        'error' => 'Erreur lors de la récupération des magasins'
    ], 500);
}