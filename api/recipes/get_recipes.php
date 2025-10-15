<?php
/**
 * Recipes API
 * Get all recipes with their ingredients
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
            preparation_time,
            difficulty
        FROM recipes
        ORDER BY name
    ");
    
    $recipes = $stmt->fetchAll();
    
    // Get ingredients for each recipe
    foreach ($recipes as &$recipe) {
        $stmtIngredients = $pdo->prepare("
            SELECT 
                ri.quantity,
                ri.unit,
                p.id as product_id,
                p.name as product_name,
                p.icon as product_icon,
                MIN(pp.price) as price
            FROM recipe_ingredients ri
            JOIN products p ON ri.product_id = p.id
            LEFT JOIN product_prices pp ON p.id = pp.product_id
            WHERE ri.recipe_id = ?
            GROUP BY p.id
        ");
        
        $stmtIngredients->execute([$recipe['id']]);
        $recipe['ingredients'] = $stmtIngredients->fetchAll();
    }
    
    sendJsonResponse([
        'success' => true,
        'recipes' => $recipes
    ]);
    
} catch (PDOException $e) {
    sendJsonResponse([
        'success' => false,
        'error' => 'Erreur lors de la récupération des recettes'
    ], 500);
}