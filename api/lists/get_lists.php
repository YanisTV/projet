<?php
/**
 * Shopping Lists API
 * Get all pre-made shopping lists with items
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
            name,
            description,
            icon,
            is_template,
            is_public,
            created_by,
            estimated_price,
            item_count
        FROM shopping_lists
        WHERE is_template = 1 AND is_public = 1
        ORDER BY created_at DESC
    ");
    
    $lists = $stmt->fetchAll();
    
    // Get items for each list
    foreach ($lists as &$list) {
        $stmtItems = $pdo->prepare("
            SELECT 
                sli.quantity,
                sli.unit,
                p.id as product_id,
                p.name as product_name,
                p.icon as product_icon,
                MIN(pp.price) as price
            FROM shopping_list_items sli
            JOIN products p ON sli.product_id = p.id
            LEFT JOIN product_prices pp ON p.id = pp.product_id
            WHERE sli.list_id = ?
            GROUP BY p.id
        ");
        
        $stmtItems->execute([$list['id']]);
        $list['items'] = $stmtItems->fetchAll();
    }
    
    sendJsonResponse([
        'success' => true,
        'lists' => $lists
    ]);
    
} catch (PDOException $e) {
    sendJsonResponse([
        'success' => false,
        'error' => 'Erreur lors de la récupération des listes'
    ], 500);
}