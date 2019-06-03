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
var noUiSlider = require("nouislider");
require('nouislider/distribute/nouislider.css')
// import * as Clipboard from 'clipboard'

// Specific frontend applications
// import 'mi_locations'

// import '../mi_locations/stylesheets/variables.sass'
import '../mi_locations/stylesheets/application.sass'
import '../mi_locations/stylesheets/coming_soon.sass'
import '../mi_locations/stylesheets/toggle.sass'
import '../mi_locations/stylesheets/header.sass'
import '../mi_locations/stylesheets/footer.sass'
import '../mi_locations/stylesheets/pages.sass'
import '../mi_locations/stylesheets/rooms.sass'
import '../mi_locations/stylesheets/buildings.sass'
import '../mi_locations/stylesheets/alerts.sass'
import '../mi_locations/stylesheets/ribbons.sass'

import '../mi_locations/stylesheets/filters.sass'
import '../mi_locations/stylesheets/search.sass'
import '../mi_locations/stylesheets/tooltips.sass'

import '@fortawesome/fontawesome-free/js/all';
require.context('../mi_locations/images/', true, /.(gif|jpg|jpeg|png|svg)$/)
// $(document).ready(function(){
//   $( ".clipboard-btn" ).click(function() {
//     var clipboard = new Clipboard('.clipboard-btn');
//     console.log(clipboard);
//   });

// });
require('trix')
require('@rails/actiontext')
import 'trix/dist/trix.css'

import 'mi_locations/javascripts/application.js'

document.addEventListener('turbolinks:load', () => {
  FontAwesome.dom.i2svg();
  function highlightCurrent() {
    const curPage = document.URL;
    const links = document.getElementsByTagName('a');
    for (let link of links) {
      if (link.href == curPage) {
        link.classList.add("current");
      }
    }


  }
  highlightCurrent();
  var slider = document.getElementById('slider');
  var resetSlider = document.getElementById('reset-slider');

  noUiSlider.create(slider, {
    range: {
      'min': 0,
      'max': 2000
    },
    step: 5,
    // Handles start at ...
    start: [30,  200],
    // Display colored bars between handles
    connect: true,
    // Put '0' at the bottom of the slider
    direction: 'ltr',
    orientation: 'horizontal',
    // Move handle on tap, bars are draggable
    behaviour: 'tap-drag',
    tooltips: true,
    format: {
      to: function (value) {
        return value + '';
      },
      from: function (value) {
        return value.replace(',-', '');
      }
    },

  });

  resetSlider.addEventListener('click', function() {
      slider.noUiSlider.reset();
    })

  slider.addEventListener('change', function () {
    minimum.noUiSlider.set([null, this.value]);
  });
});

import "controllers"


// var inputFormat = document.getElementById('input-format');

// sliderFormat.noUiSlider.on('update', function (values, handle) {
//   inputFormat.value = values[handle];
// });

// inputFormat.addEventListener('change', function () {
//   sliderFormat.noUiSlider.set(this.value);
// });
