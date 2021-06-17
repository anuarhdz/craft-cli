const { src, dest, watch, series, parallel } = require('gulp');
const sass = require('gulp-sass');
const plumber = require('gulp-plumber');
const autoprefixer = require('gulp-autoprefixer');
const sourcemaps = require('gulp-sourcemaps');
const cleancss = require('gulp-clean-css');
const uglify = require('gulp-uglify');
const rev = require('gulp-rev');
const { readFileSync } = require('fs');
const revRewrite = require('gulp-rev-rewrite');
const del = require('del');
const browserSync = require('browser-sync').create();

const path = {
    craft: {
        templates: './cms/templates/',
        css: './cms/web/assets/css/',
        js: './cms/web/assets/js/'
    },
    dev: {
        templates: './dev/templates/**/*.html',
        css: './dev/assets/scss/main.scss',
        js: './dev/assets/js/main.js'
    }
}

const vHost = 'craft3.craftgulp.test';

// limpiando directorio - prebuild
function clean(){
    return del(['cms/web/assets/**', 'cms/templates/**'])
}

// compilando templates
function pages(){
    console.log('running pages process...')
    return src(path.dev.templates)
    .pipe(dest(path.craft.templates))
}

// compilando scss
function css(){
    console.log('compiling sass...')
    return src(path.dev.css)
        .pipe(plumber())
        .pipe(sourcemaps.init())
        .pipe(sass().on('error', sass.logError))
        .pipe(autoprefixer())
        .pipe(sourcemaps.write())
        .pipe(cleancss())
        .pipe(dest(path.craft.css))
}

// compilando js
function scripts(){
    console.log('compiling scripts...')
    return src(path.dev.js)
        .pipe(plumber())
        .pipe(sourcemaps.init())
        .pipe(uglify())
        .pipe(sourcemaps.write())
        .pipe(dest(path.craft.js))
}

function server(done){
    browserSync.init({
        proxy: vHost
    })
    done()
}

function reload(done){
    browserSync.reload();
    done();
}

function dev(){
    watch(['dev/assets/scss/**/*.scss', 'dev/assets/js/**/*.js', 'dev/templates/**/*.html'], series(clean, parallel(css, scripts, pages, reload)))
}

exports.scripts = scripts;
exports.css = css;
exports.pages = pages;
exports.clean = clean;
//exports.watch = series(dev, parallel(dev));

exports.default = series(
    clean,
    css,
    scripts,
    pages,
    server,
    dev
)


// function watchTask(){
//     watch('dev/assets/scss/**/*.scss', series(compileSass, pages, rewrite, reload));
//     watch('dev/templates/**/*.html', series(pages, compileSass, rewrite, reload));
// }

// exports.default = series(
//     compileSass,
//     pages,
//     server,
//     watchTask
// )

// exports.clean = clean;
// exports.build = series(clean, parallel(compileSass, pages, rewrite));