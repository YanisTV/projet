<?php
/**
 * Products API
 * Get all products with prices from different stores
 */

require_once '../config.php';

// Allow GET requests
if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    sendJsonResponse(['success' => false, 'error' => 'Method not allowed'], 405);
}

try {
    $stmt = $pdo->query("
        SELECT 
            p.id,
            p.name,
            p.description,
            p.icon,
            p.unit,
            c.name as category_name
        FROM products p
        LEFT JOIN categories c ON p.category_id = c.id
        ORDER BY p.name
    ");
    
    $products = $stmt->fetchAll();
    
    // Get prices for each product
    foreach ($products as &$product) {
        $stmtPrices = $pdo->prepare("
            SELECT 
                s.id as store_id,
                s.name as store_name,
                pp.price
            FROM product_prices pp
            JOIN stores s ON pp.store_id = s.id
            WHERE pp.product_id = ?
            ORDER BY pp.price ASC
        ");
        
        $stmtPrices->execute([$product['id']]);
        $product['prices'] = $stmtPrices->fetchAll();
        
        // Find best price
        if (!empty($product['prices'])) {
            $product['best_price'] = min(array_column($product['prices'], 'price'));
        }
    }
    
    sendJsonResponse([
        'success' => true,
        'products' => $products
    ]);
    
} catch (PDOException $e) {
    sendJsonResponse([
        'success' => false,
        'error' => 'Erreur lors de la récupération des produits'
    ], 500);
}