module.exports = {
  plugins: [
    require("tailwindcss")('./app/javascript/css/tailwind.config.js'),
    require('autoprefixer'),
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require("@fullhuman/postcss-purgecss")({
      content: [
        './app/**/*.html.erb',
        './app/**/*.html.haml',
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js',
        './app/javascript/**/*.sass',
        './node_modules/trix/**/*.*',
        './node_modules/pannellum/**/*.js',
        './node_modules/pannellum/**/*.css',
        './node_modules/nouislider/distribute/*.*'
      ],
      defaultExtractor: content => content.match(/[A-Za-z0-9-_:/]+/g) || []
    }),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    }),
  ]
}