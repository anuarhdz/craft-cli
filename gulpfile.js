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
const crafttemplates = 'cms/templates/';
const craftcss = 'cms/web/assets/css/';
const craftjs = 'cms/web/assets/js/';
const craftimg = 'cms/web/assets/img/';
const craftfonts = 'cms/web/assets/fonts/';
const craftassets = 'cms/web/assets/';


// dev path
const imgfiles = 'dev/assets/img/**/*.+(png|jpg|gif|svg)';
const fontfiles = 'dev/assets/fonts/**/*.+(eot|svg|ttf|woff)';
const cssfiles = 'dev/assets/scss/**/*.scss';
const jsfiles = 'dev/assets/js/**/*.js';
const htmlfiles = 'dev/templates/**/*.html';
const mainjs = 'main.js';
const maincss = 'dev/assets/scss/main.scss';
const devjs = 'dev/assets/js/';

// get all js files to compile - check scripts function
const alljsfiles = [mainjs];

const vHost = 'craft3.craftgulp.test';

// clean cms assets and templates
function clean(done){
    console.log('clean assets and templates process...')
    return del([craftassets, crafttemplates])
    done();
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
        .pipe(dest(craftjs))
    });
    done()
}

function server(done){
    browserSync.init({
        proxy: vHost
    })
    done()
}

function abracadabra(done){
    console.log(`opening ${vHost}...`)
    browserSync.init({
        proxy: vHost,
        host: vHost,
        open: 'external'
    })
    console.log('your magical project has been buid, now deploy it!');
    done();
}

function reload(done){
    browserSync.reload();
    done();
}



function dev(){
    watch(
        [
            cssfiles,
            jsfiles,
            htmlfiles,
            imgfiles,
            fontfiles
        ],
        series(
            clean,
            parallel(
                css, 
                scripts, 
                graphics, 
                fonts, 
                pages, 
                reload
            )
        )
    )
}

const watchtasks = series(
    clean,
    css,
    scripts,
    fonts,
    graphics,
    pages,
    server,
    dev
);

const buildtasks = series(
    clean,
    css,
    scripts,
    fonts,
    graphics, 
    pages,
    abracadabra
);



// exports and commands
exports.fonts = fonts;
exports.graphics = graphics;
exports.scripts = scripts;
exports.css = css;
exports.pages = pages;
exports.clean = clean;
exports.default = watchtasks;
exports.blackmagic = watchtasks;
exports.buildingspell = buildtasks;
exports.build = buildtasks;