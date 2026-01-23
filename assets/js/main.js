/**
 * Main JavaScript file for ShopList application
 * Handles navigation toggle and interactive elements
 */

// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    initNavigation();
});

/**
 * Initialize navigation functionality
 * Handles mobile menu toggle
 */
function initNavigation() {
    const navToggle = document.getElementById('navToggle');
    const navMenu = document.getElementById('navMenu');
    
    // Check if elements exist
    if (!navToggle || !navMenu) {
        return;
    }
    
    // Toggle mobile menu on button click
    navToggle.addEventListener('click', toggleMobileMenu);
    
    // Close mobile menu when clicking outside
    document.addEventListener('click', function(event) {
        const isClickInsideNav = navToggle.contains(event.target) || navMenu.contains(event.target);
        
        if (!isClickInsideNav && navMenu.classList.contains('active')) {
            closeMobileMenu();
        }
    });
    
    // Close mobile menu when window is resized to desktop view
    window.addEventListener('resize', function() {
        if (window.innerWidth >= 768) {
            closeMobileMenu();
        }
    });
}

/**
 * Toggle the mobile navigation menu
 * Adds or removes 'active' class
 */
function toggleMobileMenu() {
    const navMenu = document.getElementById('navMenu');
    const navToggle = document.getElementById('navToggle');
    
    if (!navMenu || !navToggle) return;
    
    navMenu.classList.toggle('active');
    navToggle.classList.toggle('active');
    
    // Update ARIA attribute for accessibility
    const isExpanded = navMenu.classList.contains('active');
    navToggle.setAttribute('aria-expanded', isExpanded);
}

/**
 * Close the mobile navigation menu
 * Removes 'active' class
 */
function closeMobileMenu() {
    const navMenu = document.getElementById('navMenu');
    const navToggle = document.getElementById('navToggle');
    
    if (!navMenu || !navToggle) return;
    
    navMenu.classList.remove('active');
    navToggle.classList.remove('active');
    navToggle.setAttribute('aria-expanded', 'false');
}

/**
 * Add smooth scroll behavior for anchor links
 * Enhances user experience when navigating to sections
 */
document.querySelectorAll('a[href^="#"]').forEach(function(anchor) {
    anchor.addEventListener('click', function(event) {
        const targetId = this.getAttribute('href');
        
        // Only apply smooth scroll if target exists
        if (targetId !== '#' && document.querySelector(targetId)) {
            event.preventDefault();
            
            const targetElement = document.querySelector(targetId);
            targetElement.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
            
            // Close mobile menu after clicking a link
            closeMobileMenu();
        }
    });
});