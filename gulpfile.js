const { src, dest, watch, series } = require('gulp');
const sass = require('gulp-sass');
const browserSync = require('browser-sync').create();




const vHost = 'craft3.craftgulp.test';

// copiando html 

function pages(){
    return src('dev/templates/**/*.html')
    .pipe(dest('cms/templates'))
    //.pipe(browserSync.reload({ stream: true }))
}

// function copy(){
//     return gulp.src('./dev/assets/img')
//     .pipe(gulp.dest(path.img))
//     .pipe(browserSync.reload({ stream: true }))
// }

function compileSass(){
    return src('dev/assets/scss/main.scss')
    .pipe(sass())
    //.pipe(reload())
    .pipe(dest('cms/web/assets/css'))
    
    //done();
}

function server(cb){
    browserSync.init({
        proxy: vHost
    });
    cb();
}

function reload(cb){
    browserSync.reload();
    cb();
}

function watchTask(){
    watch('dev/assets/scss/**/*.scss', series(compileSass, reload));
    watch('dev/templates/**/*.html', series(pages, reload));
    
    // watch([dev_path.scss, dev_path.html],     
    //     series(parallel(server, compileSass, pages, reload))
    //     )
    // watch('./dev/templates/**/*.html').on('all', gulp.series(pages, browserSync.reload))
    // watch('./dev/assets/scss/main.scss').on('all', gulp.series(compileSass, browserSync.reload)) 
}

exports.default = series(
    compileSass,
    pages,
    server,
    watchTask
)

// gulp.task('build',
// gulp.parallel(pages, copy, compileSass))

// gulp.task('default', 
// gulp.series('build', server, watch))