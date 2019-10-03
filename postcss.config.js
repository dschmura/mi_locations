var tailwindcss = require('tailwindcss');
module.exports = {
  plugins: [
    tailwindcss('./app/javascript/css/tailwind.config.js'),
    require('autoprefixer'),
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    }),
// require('@fullhuman/postcss-purgecss')({
//       content: [
//         './app/**/*.html.erb',
//         './app/**/*.html.haml',
//         './app/helpers/**/*.rb',
//         './app/javascript/**/*.js',
//         './app/javascript/**/*.vue',
//         './app/javascript/**/*.sass',
//       ],
//       defaultExtractor: content => content.match(/[A-Za-z0-9-_:/]+/g) || []
//     })
  ]

}

if (process.env.RAILS_ENV === "production" || process.env.RAILS_ENV === "staging" ) {
  environment.plugins.push(
    require('@fullhuman/postcss-purgecss')({
      content: [
        './app/**/*.html.erb',
        './app/**/*.html.haml',
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js',
        './app/javascript/**/*.vue',
        './app/javascript/**/*.sass',
      ],
      defaultExtractor: content => content.match(/[A-Za-z0-9-_:/]+/g) || []
    })
  )
}
