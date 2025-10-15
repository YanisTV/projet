// === Theme toggle ===
const currentTheme = localStorage.getItem('theme') || 'light';
document.body.classList.add(currentTheme);

const themeButton = document.getElementById('themeButton');
if (themeButton) {
    themeButton.addEventListener('click', () => {
        document.body.classList.toggle('dark');
        document.body.classList.toggle('light');
        localStorage.setItem(
            'theme',
            document.body.classList.contains('dark') ? 'dark' : 'light'
        );
    });
}

// === Logout functionality ===
const logoutBtn = document.getElementById('logoutBtn');
if (logoutBtn) {
    logoutBtn.addEventListener('click', async function () {
        if (confirm('Voulez-vous vraiment vous déconnecter ?')) {
            try {
                const response = await fetch('./api/auth/logout.php', { method: 'POST' });
                const data = await response.json();

                if (data.success) {
                    window.location.href = './index.php';
                }
            } catch (error) {
                console.error('Logout error:', error);
                alert('Erreur lors de la déconnexion');
            }
        }
    });
}
