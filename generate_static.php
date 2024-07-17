<?php
// Sauvegardez ce fichier comme 'generate_static.php' à la racine de votre projet Laravel

// Configuration
$baseUrl = 'http://127.0.0.1:8000'; // Assurez-vous que votre application Laravel tourne sur ce port
$outputDir = 'static_site';
$routes = [
    '/',
    '/about',
    '/contact',
    // Ajoutez ici toutes les routes que vous voulez inclure
];

// Créer le dossier de sortie
if (!is_dir($outputDir)) {
    mkdir($outputDir, 0755, true);
}

// Fonction pour récupérer le contenu d'une page
function getPageContent($url) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $content = curl_exec($ch);
    curl_close($ch);
    return $content;
}

// Générer les pages statiques
foreach ($routes as $route) {
    $url = $baseUrl . $route;
    $content = getPageContent($url);
    
    $filePath = $outputDir . ($route === '/' ? '/index.html' : $route . '.html');
    $fileDir = dirname($filePath);
    
    if (!is_dir($fileDir)) {
        mkdir($fileDir, 0755, true);
    }
    
    file_put_contents($filePath, $content);
    echo "Generated: $filePath\n";
}

echo "Static site generation complete.\n";
echo "Don't forget to copy your assets (CSS, JS, images) to the $outputDir folder.\n";