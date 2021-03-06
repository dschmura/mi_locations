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

var Turbolinks = require("turbolinks")
Turbolinks.start()

import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css';
window.tippy = tippy;

import '../mi_locations/stylesheets/alerts.sass'
import '../mi_locations/stylesheets/application.sass'
import '../mi_locations/stylesheets/buildings.sass'
import '../mi_locations/stylesheets/coming_soon.sass'
import '../mi_locations/stylesheets/devise.sass'
import '../mi_locations/stylesheets/feedback.sass'
import '../mi_locations/stylesheets/filters.sass'
import '../mi_locations/stylesheets/footer.sass'
import '../mi_locations/stylesheets/header.sass'
// import '../mi_locations/stylesheets/office_tour.sass'
import '../mi_locations/stylesheets/pages.sass'
import '../mi_locations/stylesheets/ribbons.sass'
import '../mi_locations/stylesheets/room_card2.sass'
import '../mi_locations/stylesheets/room_show.sass'
import '../mi_locations/stylesheets/rooms_row.sass'
import '../mi_locations/stylesheets/rooms_search.sass'

require.context('../mi_locations/images/', true, /.(gif|jpg|jpeg|png|svg)$/)

import "nouislider/distribute/nouislider.min.css"
require('trix')
require('@rails/actiontext')
import 'trix/dist/trix.css'



import "../controllers/autosubmit_controller.js"
import "../controllers/capacity_slider_controller.js"
import "../controllers/choices_controller.js"
import "../controllers/clipboard_controller.js"
import "../controllers/index.js"
import "../controllers/infinite_scroll_controller.js"
import "../controllers/map_controller.js"
import "../controllers/pannellum_controller.js"
// import "../controllers/popover_controller.js"
import "../controllers/toggle_controller.js"