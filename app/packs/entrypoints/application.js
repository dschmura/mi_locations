/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
// import "channels"
import Rails from "@rails/ujs"

// var Turbolinks = 
// import tippy from 'tippy.js';
// import 'tippy.js/dist/tippy.css';
// window.tippy = tippy;

import 'stylesheets/application.sass'
// import 'stylesheets/alerts.sass'
// import 'stylesheets/buildings.sass'
import 'stylesheets/coming_soon.sass'
// import 'stylesheets/devise.sass'
import 'stylesheets/feedback.sass'
import 'stylesheets/filters.sass'
import 'stylesheets/footer.sass'
import 'stylesheets/header.sass'
// // import 'stylesheets/office_tour.sass'
import 'stylesheets/pages.sass'
import 'stylesheets/ribbons.sass'
// import 'stylesheets/room_card2.sass'
// import 'stylesheets/room_show.sass'
import 'stylesheets/rooms_row.sass'
import 'stylesheets/rooms_search.sass'


function importAll(r) {
  r.keys().forEach(r);
}
// Add relevant file extensions as needed below.
importAll(require.context('../images/', true, /\.(svg|jpg|gif|png)$/));




import "nouislider/distribute/nouislider.min.css"
// require('trix')
// require('@rails/actiontext')
// import 'trix/dist/trix.css'



// import "../controllers/autosubmit_controller.js"
// import "../controllers/capacity_slider_controller.js"
// import "../controllers/choices_controller.js"
// import "../controllers/clipboard_controller.js"
// import "../controllers/index.js"
// import "../controllers/infinite_scroll_controller.js"
// import "../controllers/map_controller.js"
// import "../controllers/pannellum_controller.js"
// // import "../controllers/popover_controller.js"
// import "../controllers/toggle_controller.js" 
// import "controllers"

import "controllers"
Rails.start()