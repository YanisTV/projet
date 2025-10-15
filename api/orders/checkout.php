<?php
/**
 * Checkout API
 * Create order from cart items and clear cart
 */

require_once '../config.php';

// Only accept POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendJsonResponse(['success' => false, 'error' => 'Method not allowed'], 405);
}

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    sendJsonResponse([
        'success' => false,
        'error' => 'Vous devez être connecté pour passer commande'
    ], 401);
}

// Get POST data
$data = json_decode(file_get_contents('php://input'), true);
$cartItems = $data['items'] ?? [];
$storeId = $data['store_id'] ?? 1; // Default to first store
$orderType = $data['order_type'] ?? 'online';
$notes = $data['notes'] ?? '';

// Validation
if (empty($cartItems)) {
    sendJsonResponse([
        'success' => false,
        'error' => 'Votre panier est vide'
    ], 400);
}

try {
    // Begin transaction
    $pdo->beginTransaction();
    
    // Calculate total
    $totalAmount = 0;
    foreach ($cartItems as $item) {
        $totalAmount += $item['price'] * $item['quantity'];
    }
    
    // Insert order
    $stmt = $pdo->prepare("
        INSERT INTO orders (user_id, store_id, total_amount, status, order_type, notes)
        VALUES (?, ?, ?, 'pending', ?, ?)
    ");
    
    $stmt->execute([
        $_SESSION['user_id'],
        $storeId,
        $totalAmount,
        $orderType,
        $notes
    ]);
    
    $orderId = $pdo->lastInsertId();
    
    // Insert order items
    $stmtItem = $pdo->prepare("
        INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal)
        VALUES (?, ?, ?, ?, ?)
    ");
    
    foreach ($cartItems as $item) {
        $subtotal = $item['price'] * $item['quantity'];
        $stmtItem->execute([
            $orderId,
            $item['id'],
            $item['quantity'],
            $item['price'],
            $subtotal
        ]);
    }
    
    // Clear cart from database
    $stmtClear = $pdo->prepare("DELETE FROM cart_items WHERE user_id = ?");
    $stmtClear->execute([$_SESSION['user_id']]);
    
    // Commit transaction
    $pdo->commit();
    
    sendJsonResponse([
        'success' => true,
        'message' => 'Commande créée avec succès',
        'order' => [
            'id' => $orderId,
            'total' => $totalAmount,
            'status' => 'pending',
            'item_count' => count($cartItems),
            'created_at' => date('Y-m-d H:i:s')
        ]
    ], 201);
    
} catch (PDOException $e) {
    // Rollback on error
    $pdo->rollBack();
    
    sendJsonResponse([
        'success' => false,
        'error' => 'Erreur lors de la création de la commande'
    ], 500);
}