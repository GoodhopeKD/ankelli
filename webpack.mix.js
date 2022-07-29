const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.webpackConfig({
    resolve: {
        extensions: [".js", '.ts', ".jsx"],
        alias: {
            "app": __dirname + "/resources/js/src/app"
        }
    }
});

mix
    .setResourceRoot( "/ankelli/public/") // Temp
    .sourceMaps() // Remove error: Source map error: Error: request failed with status 404
    .ts('resources/js/app.js', 'public/js')
    .react()
    .sass('resources/sass/app.scss', 'public/css');
