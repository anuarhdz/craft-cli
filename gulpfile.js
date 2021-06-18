const { src, dest, watch, series, parallel } = require('gulp');
const sass = require('gulp-sass');
const plumber = require('gulp-plumber');
const autoprefixer = require('gulp-autoprefixer');
const sourcemaps = require('gulp-sourcemaps');
const cleancss = require('gulp-clean-css');
const uglify = require('gulp-uglify');
const rename = require('gulp-rename');
const browserify = require('browserify');
const babelify = require('babelify');
const source = require('vinyl-source-stream');
const buffer = require('vinyl-buffer');
const del = require('del');
const browserSync = require('browser-sync').create();

// cms path
const craftimg = 'cms/web/assets/img/';
const craftfonts = 'cms/web/assets/fonts/';
const crafttemplates = 'cms/templates/';
const craftcss = 'cms/web/assets/css/';

// dev path
const imgfiles = 'dev/assets/img/**/*.+(png|jpg|gif|svg)';
const fontfiles = 'dev/assets/fonts/**/*.+(eot|svg|ttf|woff)';
const cssfiles = 'dev/assets/scss/**/*.scss';
const jsfiles = 'dev/assets/js/**/*.js';
const htmlfiles = 'dev/templates/**/*.html';
const mainjs = 'main.js';
const maincss = 'dev/assets/scss/main.scss';
const alljsfiles = [mainjs];
const devjs = 'dev/assets/js/';
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

// assets - img process
function graphics(done){
    console.log('assets process...');
    return src(imgfiles)
        .pipe(dest(craftimg));
        done();
}

// assets - fonts process
function fonts(done){
    console.log('fonts process...');
    return src(fontfiles)
        .pipe(dest(craftfonts))
        done();
}

// compilando templates
function pages(done){
    console.log('templates process...')
    return src(htmlfiles)
        .pipe(dest(crafttemplates))
        done();
}

// compilando scss
function css(done){
    console.log('sass process...')
    return src(maincss)
        .pipe(plumber())
        .pipe(sourcemaps.init())
        .pipe(sass().on('error', sass.logError))
        .pipe(autoprefixer())
        .pipe(sourcemaps.write())
        .pipe(cleancss())
        .pipe(dest(craftcss))
    done();
}

// compilando js
function scripts(done){
    console.log('compiling scripts...')
    alljsfiles.map(function(entry){
        return browserify({
            entries: [devjs + entry]
        })
        .transform(babelify, {presets: ['@babel/preset-env']} )
        .bundle()
        .pipe(source(entry))
        .pipe(rename({ extname: '.min.js'}))
        .pipe(buffer())
        .pipe(sourcemaps.init({loadMaps: true}))
        .pipe(uglify())
        .pipe(sourcemaps.write())
        .pipe(dest(path.craft.js))
    });
    done()
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
    watch([cssfiles, jsfiles, htmlfiles, imgfiles, fontfiles ], series(clean, parallel(css, scripts, graphics, fonts, pages, reload)))
}

exports.fonts = fonts;
exports.graphics = graphics;
exports.scripts = scripts;
exports.css = css;
exports.pages = pages;
exports.clean = clean;

exports.default = series(
    clean,
    css,
    scripts,
    fonts,
    graphics,
    pages,
    server,
    dev
)