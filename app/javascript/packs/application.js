/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

require("@rails/ujs").start()
require("@rails/activestorage").start()

// import Turbolinks from 'turbolinks'
// Turbolinks.start()
var Turbolinks = require("turbolinks")
Turbolinks.start()

import * as Clipboard from 'clipboard'

// Specific frontend applications
// import 'mi_locations'

import '../mi_locations/stylesheets/_variables.sass'
import '../mi_locations/stylesheets/application.sass'
import '../mi_locations/stylesheets/feedback.sass'
import '../mi_locations/stylesheets/header.sass'
import '../mi_locations/stylesheets/footer.sass'
import '../mi_locations/stylesheets/pages.sass'
import '../mi_locations/stylesheets/rooms.sass'
import '../mi_locations/stylesheets/buildings.sass'
import '../mi_locations/stylesheets/alerts.sass'
import '../mi_locations/stylesheets/feedback.sass'
import '../mi_locations/stylesheets/ribbons.sass'
import '@fortawesome/fontawesome-free/js/all';

document.addEventListener('turbolinks:load', () => {
  FontAwesome.dom.i2svg();
})
require.context('../mi_locations/images/', true, /.(gif|jpg|jpeg|png|svg)$/)
// $(document).ready(function(){
//   $( ".clipboard-btn" ).click(function() {
//     var clipboard = new Clipboard('.clipboard-btn');
//     console.log(clipboard);
//   });

// });
require("trix")
require("@rails/actiontext")
import 'trix/dist/trix.css'