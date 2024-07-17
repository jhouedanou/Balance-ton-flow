module.exports = {
  proxy: '127.0.0.1:8000', // L'adresse et le port utilisés par `php artisan serve`
  files: ['public/assets/styles.css'], // Les fichiers à surveiller
  watch: true,
  ignore: [],
  reloadDelay: 10,
  ui: false,
  notify: false,
  port: 3000,
};