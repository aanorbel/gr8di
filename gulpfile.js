var gulp = require('gulp');
var sass = require('gulp-sass');
var browserSync = require('browser-sync').create();
var header = require('gulp-header');
var cleanCSS = require('gulp-clean-css');
var rename = require("gulp-rename");
var uglify = require('gulp-uglify');
var pkg = require('./package.json');

// Set the banner content
var banner = ['/*!\n',
  ' * gr8DI - <%= pkg.title %> v<%= pkg.version %> (<%= pkg.homepage %>)\n',
  ' * Copyright 2017-' + (new Date()).getFullYear(), ' <%= pkg.author %>\n',
  ' */\n',
  ''
].join('');

// Compiles SCSS files from /scss into /css
gulp.task('sass', function() {
  return gulp.src('grails-app/assets/stylesheets/scss/gr8di.scss')
    .pipe(sass())
    .pipe(header(banner, {
      pkg: pkg
    }))
    .pipe(gulp.dest('grails-app/assets/stylesheets/'))
    .pipe(browserSync.reload({
      stream: true
    }))
});

// Minify compiled CSS
gulp.task('minify-css', ['sass'], function() {
  return gulp.src('grails-app/assets/stylesheets/gr8di.css')
    .pipe(cleanCSS({
      compatibility: 'ie8'
    }))
    .pipe(rename({
      suffix: '.min'
    }))
    .pipe(gulp.dest('grails-app/assets/stylesheets'))
    .pipe(browserSync.reload({
      stream: true
    }))
});

// Minify custom JS
gulp.task('minify-js', function() {
  return gulp.src('grails-app/assets/javascripts/gr8di.js')
    .pipe(uglify())
    .pipe(header(banner, {
      pkg: pkg
    }))
    .pipe(rename({
      suffix: '.min'
    }))
    .pipe(gulp.dest('grails-app/assets/javascripts'))
    .pipe(browserSync.reload({
      stream: true
    }))
});

// Copy vendor files from /node_modules into /vendor
// NOTE: requires `npm install` before running!
gulp.task('copy', function() {

});

// Default task
gulp.task('default', ['sass', 'minify-css', 'minify-js', 'copy']);

// Configure the browserSync task
gulp.task('browserSync', function() {
  browserSync.init({
    server: {
      baseDir: ''
    }
  })
});

// Dev task with browserSync
gulp.task('dev', ['browserSync', 'sass', 'minify-css', 'minify-js'], function() {
  gulp.watch('grails-app/assets/stylesheets/scss/*.scss', ['sass']);
  gulp.watch('grails-app/assets/stylesheets/*.css', ['minify-css']);
  gulp.watch('grails-app/assets/javascripts/*.js', ['minify-js']);
  // // Reloads the browser whenever HTML or JS files change
  // gulp.watch('*.html', browserSync.reload);
  // gulp.watch('**/*.html', browserSync.reload);
  gulp.watch('grails-app/assets/javascripts/**/*.js', browserSync.reload);
});
