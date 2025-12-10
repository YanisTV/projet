<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nos magasins - ShopList</title>

    <!-- CSS global + spécifique -->
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="../assets/css/store_list.css">

    <!-- Leaflet -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
</head>

<body>
    <?php include '../components/header.php'; ?>

    <main class="main-content">
        <section class="features-section">
            <div class="features-container">
                <h1 class="section-title">Nos magasins</h1>
                <p class="section-subtitle">Cliquez sur un magasin pour voir son emplacement sur la carte.</p>

                <div class="store-map-container">
                    <!-- Liste à gauche -->
                    <div class="store-list" id="storeList">
                        <p>Chargement des magasins...</p>
                    </div>

                    <!-- Carte à droite -->
                    <div id="map"></div>
                </div>
            </div>
        </section>
    </main>

    <?php include '../components/footer.php'; ?>

    <script>
        // Initialize map
        let map;
        let markers = [];
        let stores = [];

        // Load stores from API
        async function loadStores() {
            try {
                const response = await fetch('../api/stores/get_stores.php');
                const data = await response.json();
                
                if (data.success) {
                    stores = data.stores;
                    renderStoreList();
                    initializeMap();
                } else {
                    document.getElementById('storeList').innerHTML = '<p>Erreur de chargement des magasins</p>';
                }
            } catch (error) {
                console.error('Error loading stores:', error);
                document.getElementById('storeList').innerHTML = '<p>Erreur de chargement des magasins</p>';
            }
        }

        // Render store list
        function renderStoreList() {
            const storeList = document.getElementById('storeList');
            
            storeList.innerHTML = stores.map(store => `
                <div class="store-card" data-lat="${store.latitude}" data-lng="${store.longitude}">
                    <h3>${store.nom}</h3>
                    <p>${store.adresse}</p>
                </div>
            `).join('');
            
            // Add click events
            document.querySelectorAll('.store-card').forEach((card, index) => {
                card.addEventListener('click', () => {
                    const lat = parseFloat(card.dataset.lat);
                    const lng = parseFloat(card.dataset.lng);
                    map.setView([lat, lng], 13);
                    markers[index].openPopup();
                    
                    document.querySelectorAll('.store-card').forEach(c => c.classList.remove('active'));
                    card.classList.add('active');
                });
            });
        }

        // Initialize Leaflet map
        function initializeMap() {
            map = L.map('map').setView([46.5, 2.5], 6);

            // OpenStreetMap tile layer
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; OpenStreetMap contributors'
            }).addTo(map);

            // Add markers
            stores.forEach((store, index) => {
                const marker = L.marker([store.latitude, store.longitude])
                    .addTo(map)
                    .bindPopup(`<strong>${store.nom}</strong><br>${store.adresse}`);
                markers.push(marker);
            });
        }

        // Load stores when page loads
        document.addEventListener('DOMContentLoaded', loadStores);
    </script>
</body>
</html>