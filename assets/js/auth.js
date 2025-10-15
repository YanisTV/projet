/**
 * Authentication JavaScript file
 * Handles login and registration form interactions
 */

// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    initPasswordToggle();
    initFormValidation();
});

/**
 * Initialize password visibility toggle functionality
 * Allows users to show/hide password fields
 */
function initPasswordToggle() {
    const togglePasswordBtn = document.getElementById('togglePassword');
    const toggleConfirmPasswordBtn = document.getElementById('toggleConfirmPassword');
    
    if (togglePasswordBtn) {
        togglePasswordBtn.addEventListener('click', function() {
            togglePasswordVisibility('password', togglePasswordBtn);
        });
    }
    
    if (toggleConfirmPasswordBtn) {
        toggleConfirmPasswordBtn.addEventListener('click', function() {
            togglePasswordVisibility('confirmPassword', toggleConfirmPasswordBtn);
        });
    }
}

/**
 * Toggle password field visibility
 * @param {string} fieldId - The ID of the password input field
 * @param {HTMLElement} button - The toggle button element
 */
function togglePasswordVisibility(fieldId, button) {
    const passwordField = document.getElementById(fieldId);
    
    if (!passwordField) return;
    
    if (passwordField.type === 'password') {
        passwordField.type = 'text';
        button.textContent = '🙈';
        button.setAttribute('aria-label', 'Masquer le mot de passe');
    } else {
        passwordField.type = 'password';
        button.textContent = '👁️';
        button.setAttribute('aria-label', 'Afficher le mot de passe');
    }
}

/**
 * Initialize form validation
 * Handles client-side validation before submission
 */
function initFormValidation() {
    const loginForm = document.getElementById('loginForm');
    const registerForm = document.getElementById('registerForm');
    
    if (loginForm) {
        loginForm.addEventListener('submit', handleLoginSubmit);
    }
    
    if (registerForm) {
        registerForm.addEventListener('submit', handleRegisterSubmit);
        
        // Real-time password matching validation
        const password = document.getElementById('password');
        const confirmPassword = document.getElementById('confirmPassword');
        
        if (password && confirmPassword) {
            confirmPassword.addEventListener('input', function() {
                validatePasswordMatch(password.value, confirmPassword.value);
            });
        }
    }
}

/**
 * Handle login form submission
 * @param {Event} event - The form submit event
 */
async function handleLoginSubmit(event) {
    event.preventDefault();
    
    const form = event.target;
    const email = form.email.value.trim();
    const password = form.password.value;
    
    // Clear previous error messages
    hideMessage('errorMessage');
    
    // Basic client-side validation
    if (!isValidEmail(email)) {
        showError('Veuillez entrer une adresse e-mail valide.');
        return;
    }
    
    if (password.length < 8) {
        showError('Le mot de passe doit contenir au moins 8 caractères.');
        return;
    }
    
    // Submit to API
    try {
        const formData = new FormData(form);
        const response = await fetch('../api/auth/login.php', {
            method: 'POST',
            body: formData
        });
        
        const data = await response.json();
        
        if (data.success) {
            // Redirect to shop page on success
            window.location.href = 'shop.php';
        } else {
            showError(data.error || 'Une erreur est survenue');
        }
    } catch (error) {
        console.error('Login error:', error);
        showError('Erreur de connexion au serveur');
    }
}

/**
 * Handle registration form submission
 * @param {Event} event - The form submit event
 */
async function handleRegisterSubmit(event) {
    event.preventDefault();
    
    const form = event.target;
    const firstName = form.first_name.value.trim();
    const lastName = form.last_name.value.trim();
    const email = form.email.value.trim();
    const password = form.password.value;
    const confirmPassword = form.confirm_password.value;
    const termsAccepted = form.terms.checked;
    
    // Clear previous messages
    hideMessage('errorMessage');
    hideMessage('successMessage');
    
    // Validation
    if (firstName.length < 2) {
        showError('Le prénom doit contenir au moins 2 caractères.');
        return;
    }
    
    if (lastName.length < 2) {
        showError('Le nom doit contenir au moins 2 caractères.');
        return;
    }
    
    if (!isValidEmail(email)) {
        showError('Veuillez entrer une adresse e-mail valide.');
        return;
    }
    
    if (password.length < 8) {
        showError('Le mot de passe doit contenir au moins 8 caractères.');
        return;
    }
    
    if (password !== confirmPassword) {
        showError('Les mots de passe ne correspondent pas.');
        return;
    }
    
    if (!termsAccepted) {
        showError('Vous devez accepter les conditions générales.');
        return;
    }
    
    // Submit to API
    try {
        const formData = new FormData(form);
        const response = await fetch('../api/auth/register.php', {
            method: 'POST',
            body: formData
        });
        
        const data = await response.json();
        
        if (data.success) {
            showSuccess('Inscription réussie ! Redirection...');
            setTimeout(() => {
                window.location.href = 'shop.php';
            }, 1500);
        } else {
            if (data.errors) {
                showError(data.errors.join('<br>'));
            } else {
                showError(data.error || 'Une erreur est survenue');
            }
        }
    } catch (error) {
        console.error('Registration error:', error);
        showError('Erreur de connexion au serveur');
    }
}

/**
 * Validate if password and confirm password match
 * @param {string} password - The password value
 * @param {string} confirmPassword - The confirm password value
 * @returns {boolean} True if passwords match
 */
function validatePasswordMatch(password, confirmPassword) {
    const confirmField = document.getElementById('confirmPassword');
    
    if (!confirmField) return false;
    
    if (confirmPassword && password !== confirmPassword) {
        confirmField.setCustomValidity('Les mots de passe ne correspondent pas');
        return false;
    } else {
        confirmField.setCustomValidity('');
        return true;
    }
}

/**
 * Validate email format
 * @param {string} email - The email address to validate
 * @returns {boolean} True if email is valid
 */
function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

/**
 * Show error message to user
 * @param {string} message - The error message to display
 */
function showError(message) {
    const errorDiv = document.getElementById('errorMessage');
    if (errorDiv) {
        errorDiv.textContent = message;
        errorDiv.style.display = 'block';
        errorDiv.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
    }
}

/**
 * Show success message to user
 * @param {string} message - The success message to display
 */
function showSuccess(message) {
    const successDiv = document.getElementById('successMessage');
    if (successDiv) {
        successDiv.textContent = message;
        successDiv.style.display = 'block';
        successDiv.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
    }
}

/**
 * Hide message element
 * @param {string} elementId - The ID of the message element to hide
 */
function hideMessage(elementId) {
    const element = document.getElementById(elementId);
    if (element) {
        element.style.display = 'none';
    }
}