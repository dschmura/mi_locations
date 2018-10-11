  // // Include external resources for this app_files
  // import 'bootstrap'

  // Include internal resources for this app
  import './javascripts/application'
  // import fontawesome from "@fortawesome/fontawesome-free";
  import '@fortawesome/fontawesome-free/js/all';

  // SITE WIDE STYLES
  require.context("./stylesheets", true, /\.(css|scss|sass)$/)
  // import './stylesheets/_variables.sass'
  // import './stylesheets/application.sass'
  // import './stylesheets/ribbons.sass'

  import './stylesheets/alerts.sass'
  import './stylesheets/ribbons.sass'

  // IMAGES
  // require.context('./images/', true, /.(gif|jpg|jpeg|png|svg)$/)

  import './images/favicon.png'
  import './images/MiLocationsLogo.png'
