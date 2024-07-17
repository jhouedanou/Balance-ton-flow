const sass = require('sass');
const fs = require('fs');
const path = require('path');
const chokidar = require('chokidar');
const browserSync = require('browser-sync').create();

const inputDir = 'public/assets/scss';
const outputDir = 'public/assets/css';

// Fonction pour compiler SCSS en CSS
function compileSass(file) {
    const baseName = path.basename(file, '.scss');
    try {
        const result = sass.compile(file, { 
            style: 'compressed',
            sourceMap: true,
            outFile: path.join(outputDir, `${baseName}.css`)
        });
        fs.writeFile(path.join(outputDir, `${baseName}.css`), result.css, (err) => {
            if (err) console.error('Erreur lors de l\'écriture du fichier CSS:', err);
            else console.log(`Compilé : ${file}`);
            fs.writeFile(path.join(outputDir, `${baseName}.css.map`), JSON.stringify(result.sourceMap), (err) => {
                if (err) console.error('Erreur lors de l\'écriture du fichier map:', err);
                else console.log(`Map généré : ${baseName}.css.map`);
            });
            browserSync.reload('*.css');
        });
    } catch (error) {
        console.error(`Erreur de compilation pour ${file}:`, error.message);
        browserSync.notify(`Erreur de compilation : ${error.message}`, 5000);
    }
}



// Créer le répertoire de sortie s'il n'existe pas
if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
}

// Initialiser Browsersync
browserSync.init({
    proxy: 'http://localhost:8000', // Assurez-vous que cela correspond à l'URL de votre serveur Laravel
    files: [
        'app/**/*.php',
        'resources/views/**/*.php',
        `${outputDir}/*.css`,
    ],
    open: false
});

// Surveiller les changements dans les fichiers SCSS
chokidar.watch(`${inputDir}/**/*.scss`).on('all', (event, file) => {
    console.log(`Fichier ${file} a été ${event}`);
    compileSass(file);
});

console.log('Surveillance des fichiers SCSS...');