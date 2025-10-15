/**
 * Shopping page JavaScript - COMPLETE VERSION
 * Handles cart, filters, shopping with persistent cart and working checkout
 */

// Shopping cart data
let cart = [];

// Data from database
let productsData = [];
let recipesData = [];
let listsData = [];

// User authentication status
let isAuthenticated = false;
let userId = null;

// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    initializeApp();
});

/**
 * Initialize the application
 */
async function initializeApp() {
    await checkAuthentication();
    await loadProducts();
    await loadRecipes();
    await loadLists();
    initCart();
    initFilters();
    initSearch();
    initShareButtons();
}

/**
 * Check if user is authenticated
 */
async function checkAuthentication() {
    try {
        const response = await fetch('../api/auth/check_auth.php');
        const data = await response.json();
        
        if (data.success && data.authenticated) {
            isAuthenticated = true;
            userId = data.user.id;
            console.log('User authenticated:', data.user.name);
            
            // Load cart from database
            await loadCartFromDatabase();
        } else {
            console.log('User not authenticated');
            isAuthenticated = false;
        }
    } catch (error) {
        console.error('Error checking authentication:', error);
        isAuthenticated = false;
    }
}

/**
 * Load cart from database for authenticated users
 */
async function loadCartFromDatabase() {
    if (!isAuthenticated) return;
    
    try {
        const response = await fetch('../api/cart/get_cart.php');
        const data = await response.json();
        
        console.log('Cart loaded from DB:', data);
        
        if (data.success && data.cart && data.cart.length > 0) {
            cart = data.cart.map(item => ({
                id: parseInt(item.id),
                name: item.name,
                price: parseFloat(item.price),
                quantity: parseInt(item.quantity)
            }));
            
            console.log('Cart after loading:', cart);
            updateCartDisplay();
        }
    } catch (error) {
        console.error('Error loading cart:', error);
    }
}

/**
 * Save cart to database for authenticated users
 */
async function saveCartToDatabase() {
    if (!isAuthenticated) {
        console.log('Not authenticated, cart not saved');
        return;
    }
    
    try {
        const response = await fetch('../api/cart/save_cart.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                items: cart
            })
        });
        
        const data = await response.json();
        console.log('Cart saved:', data);
    } catch (error) {
        console.error('Error saving cart:', error);
    }
}

/**
 * Load products from database
 */
async function loadProducts() {
    try {
        const response = await fetch('../api/products/get_products.php');
        const data = await response.json();
        
        if (data.success) {
            productsData = data.products;
            renderProducts();
            initProductButtons();
        }
    } catch (error) {
        console.error('Error loading products:', error);
    }
}

/**
 * Render products to the page
 */
function renderProducts() {
    const productsGrid = document.getElementById('productsGrid');
    
    if (!productsGrid || productsData.length === 0) return;
    
    productsGrid.innerHTML = productsData.map(product => {
        const prices = product.prices || [];
        const bestPrice = product.best_price || 0;
        
        const pricesHtml = prices.map(priceItem => `
            <div class="price-item">
                <span class="store-name">${priceItem.store_name}</span>
                <span class="price ${parseFloat(priceItem.price) === parseFloat(bestPrice) ? 'best-price' : ''}">${parseFloat(priceItem.price).toFixed(2)}€/${product.unit}</span>
            </div>
        `).join('');
        
        return `
            <div class="product-card" data-category="products">
                <div class="product-image">
                    <span class="product-emoji">${product.icon || '🛒'}</span>
                </div>
                <div class="product-info">
                    <h3 class="product-name">${product.name}</h3>
                    <p class="product-description">${product.description || ''}</p>
                    <div class="product-prices">
                        ${pricesHtml}
                    </div>
                    <button class="btn btn-primary btn-add-cart" 
                            data-id="${product.id}" 
                            data-name="${product.name}" 
                            data-price="${bestPrice}">
                        Ajouter au panier
                    </button>
                </div>
            </div>
        `;
    }).join('');
}

/**
 * Load recipes from database
 */
async function loadRecipes() {
    try {
        const response = await fetch('../api/recipes/get_recipes.php');
        const data = await response.json();
        
        if (data.success) {
            recipesData = data.recipes;
            renderRecipes();
            initRecipeButtons();
        }
    } catch (error) {
        console.error('Error loading recipes:', error);
    }
}

/**
 * Render recipes to the page
 */
function renderRecipes() {
    const recipesGrid = document.getElementById('recipesGrid');
    
    if (!recipesGrid || recipesData.length === 0) return;
    
    recipesGrid.innerHTML = recipesData.map(recipe => `
        <div class="recipe-card" data-category="recipes">
            <div class="recipe-image">
                <span class="recipe-emoji">${recipe.icon || '🍽️'}</span>
            </div>
            <div class="recipe-info">
                <h3 class="recipe-name">${recipe.name}</h3>
                <p class="recipe-description">${recipe.description || ''}</p>
                <div class="recipe-meta">
                    <span class="recipe-time">⏱️ ${recipe.preparation_time} min</span>
                    <span class="recipe-difficulty">👨‍🍳 ${recipe.difficulty}</span>
                </div>
                <div class="recipe-actions">
                    <button class="btn btn-outline btn-view-recipe" data-recipe="${recipe.id}">
                        Voir la recette
                    </button>
                    <button class="btn btn-primary btn-add-recipe" data-recipe="${recipe.id}">
                        Ajouter au panier
                    </button>
                </div>
            </div>
        </div>
    `).join('');
}

/**
 * Load lists from database
 */
async function loadLists() {
    try {
        const response = await fetch('../api/lists/get_lists.php');
        const data = await response.json();
        
        if (data.success) {
            listsData = data.lists;
            renderLists();
            initListButtons();
        }
    } catch (error) {
        console.error('Error loading lists:', error);
    }
}

/**
 * Render lists to the page
 */
function renderLists() {
    const listsGrid = document.getElementById('listsGrid');
    
    if (!listsGrid || listsData.length === 0) return;
    
    listsGrid.innerHTML = listsData.map(list => {
        const badgeClass = list.created_by === 'company' ? 'official' : '';
        const badgeText = list.created_by === 'company' ? 'Officiel' : 'Communauté';
        
        return `
            <div class="list-card" data-category="lists">
                <div class="list-header">
                    <span class="list-icon">${list.icon || '📋'}</span>
                    <span class="list-badge ${badgeClass}">${badgeText}</span>
                </div>
                <div class="list-info">
                    <h3 class="list-name">${list.name}</h3>
                    <p class="list-description">${list.description || ''}</p>
                    <div class="list-items">
                        <span class="list-item-count">${list.item_count} articles</span>
                        <span class="list-price">≈ ${parseFloat(list.estimated_price).toFixed(2)}€</span>
                    </div>
                    <div class="list-actions">
                        <button class="btn btn-outline btn-view-list" data-list="${list.id}">
                            Voir la liste
                        </button>
                        <button class="btn btn-primary btn-add-list" data-list="${list.id}">
                            Ajouter au panier
                        </button>
                    </div>
                </div>
            </div>
        `;
    }).join('');
}

/**
 * Initialize shopping cart functionality
 */
function initCart() {
    const cartToggle = document.getElementById('cartToggle');
    const cartClose = document.getElementById('cartClose');
    const cartOverlay = document.getElementById('cartOverlay');
    const checkoutBtn = document.getElementById('checkoutBtn');
    
    if (cartToggle) {
        cartToggle.addEventListener('click', openCart);
    }
    
    if (cartClose) {
        cartClose.addEventListener('click', closeCart);
    }
    
    if (cartOverlay) {
        cartOverlay.addEventListener('click', closeCart);
    }
    
    if (checkoutBtn) {
        checkoutBtn.addEventListener('click', handleCheckout);
    }
    
    updateCartDisplay();
}

/**
 * Open shopping cart sidebar
 */
function openCart() {
    const cartSidebar = document.getElementById('cartSidebar');
    const cartOverlay = document.getElementById('cartOverlay');
    
    if (cartSidebar && cartOverlay) {
        cartSidebar.classList.add('active');
        cartOverlay.classList.add('active');
    }
}

/**
 * Close shopping cart sidebar
 */
function closeCart() {
    const cartSidebar = document.getElementById('cartSidebar');
    const cartOverlay = document.getElementById('cartOverlay');
    
    if (cartSidebar && cartOverlay) {
        cartSidebar.classList.remove('active');
        cartOverlay.classList.remove('active');
    }
}

/**
 * Add item to cart
 * @param {number} id - Product ID
 * @param {string} name - Product name
 * @param {number} price - Product price
 */
function addToCart(id, name, price) {
    const existingItem = cart.find(item => item.id === id);
    
    if (existingItem) {
        existingItem.quantity += 1;
    } else {
        cart.push({
            id: id,
            name: name,
            price: parseFloat(price),
            quantity: 1
        });
    }
    
    console.log('Cart after add:', cart);
    updateCartDisplay();
    saveCartToDatabase();
    showNotification(`${name} ajouté au panier`);
}

/**
 * Remove item from cart
 * @param {number} id - Product ID
 */
function removeFromCart(id) {
    cart = cart.filter(item => item.id !== id);
    console.log('Cart after remove:', cart);
    updateCartDisplay();
    saveCartToDatabase();
}

/**
 * Update cart display
 */
function updateCartDisplay() {
    const cartItems = document.getElementById('cartItems');
    const cartBadge = document.getElementById('cartBadge');
    const cartTotal = document.getElementById('cartTotal');
    
    if (!cartItems || !cartBadge || !cartTotal) return;
    
    // Update badge
    const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
    cartBadge.textContent = totalItems;
    
    // Update cart items
    if (cart.length === 0) {
        cartItems.innerHTML = '<p class="cart-empty">Votre panier est vide</p>';
    } else {
        cartItems.innerHTML = cart.map(item => `
            <div class="cart-item">
                <div class="cart-item-info">
                    <div class="cart-item-name">${item.name}</div>
                    <div class="cart-item-price">${item.price.toFixed(2)}€ x ${item.quantity}</div>
                </div>
                <button class="cart-item-remove" onclick="removeFromCart(${item.id})">
                    ✕
                </button>
            </div>
        `).join('');
    }
    
    // Update total
    const total = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    cartTotal.textContent = `${total.toFixed(2)}€`;
}

/**
 * Handle checkout process - FULLY FUNCTIONAL
 */
async function handleCheckout() {
    console.log('Checkout clicked');
    console.log('Cart:', cart);
    console.log('Is authenticated:', isAuthenticated);
    
    if (cart.length === 0) {
        alert('Votre panier est vide');
        return;
    }
    
    // Check if user is logged in
    if (!isAuthenticated) {
        const goToLogin = confirm('Vous devez être connecté pour commander.\n\nVoulez-vous vous connecter maintenant ?');
        if (goToLogin) {
            window.location.href = 'login.php';
        }
        return;
    }
    
    // Confirm order
    const total = calculateTotal();
    const itemCount = cart.reduce((sum, item) => sum + item.quantity, 0);
    const confirmOrder = confirm(`Confirmer votre commande ?\n\n${itemCount} article(s)\nTotal: ${total}€`);
    
    if (!confirmOrder) return;
    
    try {
        console.log('Sending checkout request...');
        
        const response = await fetch('../api/orders/checkout.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                items: cart,
                store_id: 1,
                order_type: 'online',
                notes: ''
            })
        });
        
        console.log('Response status:', response.status);
        
        const data = await response.json();
        console.log('Response data:', data);
        
        if (data.success) {
            // Success message
            alert(`✅ Commande validée avec succès !\n\nNuméro de commande: #${data.order.id}\nTotal: ${parseFloat(data.order.total).toFixed(2)}€\nNombre d'articles: ${data.order.item_count}\n\nStatut: En cours de traitement\n\nMerci pour votre commande !`);
            
            // Clear cart
            cart = [];
            updateCartDisplay();
            saveCartToDatabase();
            closeCart();
        } else {
            alert('❌ Erreur: ' + (data.error || 'Une erreur est survenue lors de la commande'));
        }
    } catch (error) {
        console.error('Checkout error:', error);
        alert('❌ Erreur de connexion au serveur');
    }
}

/**
 * Calculate cart total
 * @returns {string} Total price formatted
 */
function calculateTotal() {
    const total = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    return total.toFixed(2);
}

/**
 * Initialize filter functionality
 */
function initFilters() {
    const filterBtns = document.querySelectorAll('.filter-btn');
    
    filterBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const filter = this.getAttribute('data-filter');
            
            filterBtns.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            filterContent(filter);
        });
    });
}

/**
 * Filter content based on category
 */
function filterContent(filter) {
    const productsSection = document.querySelector('.products-section');
    const recipesSection = document.querySelector('.recipes-section');
    const listsSection = document.querySelector('.lists-section');
    
    if (filter === 'all') {
        productsSection.style.display = 'block';
        recipesSection.style.display = 'block';
        listsSection.style.display = 'block';
    } else if (filter === 'products') {
        productsSection.style.display = 'block';
        recipesSection.style.display = 'none';
        listsSection.style.display = 'none';
    } else if (filter === 'recipes') {
        productsSection.style.display = 'none';
        recipesSection.style.display = 'block';
        listsSection.style.display = 'none';
    } else if (filter === 'lists') {
        productsSection.style.display = 'none';
        recipesSection.style.display = 'none';
        listsSection.style.display = 'block';
    }
}

/**
 * Initialize search functionality
 */
function initSearch() {
    const searchInput = document.getElementById('searchInput');
    
    if (searchInput) {
        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            
            const productCards = document.querySelectorAll('.product-card');
            productCards.forEach(card => {
                const name = card.querySelector('.product-name').textContent.toLowerCase();
                const description = card.querySelector('.product-description').textContent.toLowerCase();
                
                if (name.includes(searchTerm) || description.includes(searchTerm)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
            
            const recipeCards = document.querySelectorAll('.recipe-card');
            recipeCards.forEach(card => {
                const name = card.querySelector('.recipe-name').textContent.toLowerCase();
                const description = card.querySelector('.recipe-description').textContent.toLowerCase();
                
                if (name.includes(searchTerm) || description.includes(searchTerm)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
            
            const listCards = document.querySelectorAll('.list-card');
            listCards.forEach(card => {
                const name = card.querySelector('.list-name').textContent.toLowerCase();
                const description = card.querySelector('.list-description').textContent.toLowerCase();
                
                if (name.includes(searchTerm) || description.includes(searchTerm)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    }
}

/**
 * Initialize product buttons
 */
function initProductButtons() {
    const addToCartBtns = document.querySelectorAll('.btn-add-cart');
    
    addToCartBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const id = parseInt(this.getAttribute('data-id'));
            const name = this.getAttribute('data-name');
            const price = parseFloat(this.getAttribute('data-price'));
            
            addToCart(id, name, price);
        });
    });
}

/**
 * Initialize recipe buttons
 */
function initRecipeButtons() {
    const viewRecipeBtns = document.querySelectorAll('.btn-view-recipe');
    const addRecipeBtns = document.querySelectorAll('.btn-add-recipe');
    
    viewRecipeBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const recipeId = parseInt(this.getAttribute('data-recipe'));
            showRecipeDetails(recipeId);
        });
    });
    
    addRecipeBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const recipeId = parseInt(this.getAttribute('data-recipe'));
            addRecipeToCart(recipeId);
        });
    });
}

/**
 * Show recipe details
 */
function showRecipeDetails(recipeId) {
    const recipe = recipesData.find(r => r.id == recipeId);
    
    if (recipe && recipe.ingredients) {
        const ingredientsList = recipe.ingredients.map(item => 
            `- ${item.product_name}: ${parseFloat(item.price).toFixed(2)}€`
        ).join('\n');
        alert(`Ingrédients nécessaires:\n\n${ingredientsList}\n\nCliquez sur "Ajouter au panier" pour ajouter tous les ingrédients.`);
    }
}

/**
 * Add recipe to cart
 */
function addRecipeToCart(recipeId) {
    const recipe = recipesData.find(r => r.id == recipeId);
    
    if (recipe && recipe.ingredients) {
        recipe.ingredients.forEach(item => {
            addToCart(item.product_id, item.product_name, item.price);
        });
        
        showNotification('Recette ajoutée au panier');
    }
}

/**
 * Initialize list buttons
 */
function initListButtons() {
    const viewListBtns = document.querySelectorAll('.btn-view-list');
    const addListBtns = document.querySelectorAll('.btn-add-list');
    
    viewListBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const listId = parseInt(this.getAttribute('data-list'));
            showListDetails(listId);
        });
    });
    
    addListBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const listId = parseInt(this.getAttribute('data-list'));
            addListToCart(listId);
        });
    });
}

/**
 * Show list details
 */
function showListDetails(listId) {
    const list = listsData.find(l => l.id == listId);
    
    if (list && list.items) {
        const itemsList = list.items.map(item => 
            `- ${item.product_name}: ${parseFloat(item.price).toFixed(2)}€`
        ).join('\n');
        alert(`Articles de la liste:\n\n${itemsList}\n\nCliquez sur "Ajouter au panier" pour ajouter tous les articles.`);
    }
}

/**
 * Add list to cart
 */
function addListToCart(listId) {
    const list = listsData.find(l => l.id == listId);
    
    if (list && list.items) {
        list.items.forEach(item => {
            addToCart(item.product_id, item.product_name, item.price);
        });
        
        showNotification('Liste ajoutée au panier');
    }
}

/**
 * Initialize share buttons
 */
function initShareButtons() {
    const shareBtns = document.querySelectorAll('.share-btn');
    
    shareBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const platform = this.classList.contains('facebook') ? 'Facebook' :
                           this.classList.contains('twitter') ? 'Twitter' :
                           this.classList.contains('whatsapp') ? 'WhatsApp' :
                           'Email';
            
            shareCart(platform);
        });
    });
}

/**
 * Share cart
 */
function shareCart(platform) {
    if (cart.length === 0) {
        alert('Votre panier est vide. Ajoutez des articles avant de partager.');
        return;
    }
    
    const cartText = `Ma liste de courses:\n${cart.map(item => `- ${item.name} (${item.quantity})`).join('\n')}`;
    const encodedText = encodeURIComponent(cartText);
    
    let url = '';
    
    switch(platform) {
        case 'Facebook':
            url = `https://www.facebook.com/sharer/sharer.php?u=${window.location.href}&quote=${encodedText}`;
            break;
        case 'Twitter':
            url = `https://twitter.com/intent/tweet?text=${encodedText}`;
            break;
        case 'WhatsApp':
            url = `https://wa.me/?text=${encodedText}`;
            break;
        case 'Email':
            url = `mailto:?subject=Ma liste de courses&body=${encodedText}`;
            break;
    }
    
    if (url) {
        window.open(url, '_blank');
    }
}

/**
 * Show notification
 */
function showNotification(message) {
    const notification = document.createElement('div');
    notification.className = 'notification';
    notification.textContent = message;
    notification.style.cssText = `
        position: fixed;
        bottom: 20px;
        right: 20px;
        background-color: #10b981;
        color: white;
        padding: 1rem 1.5rem;
        border-radius: 0.5rem;
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        z-index: 3000;
        animation: slideIn 0.3s ease-out;
    `;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.style.animation = 'slideOut 0.3s ease-out';
        setTimeout(() => notification.remove(), 300);
    }, 2000);
}