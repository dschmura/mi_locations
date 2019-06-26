var noUiSlider = require("nouislider");
require('nouislider/distribute/nouislider.css')

document.addEventListener('turbolinks:load', () => {
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

  // resetSlider.addEventListener('click', function() {
  //     slider.noUiSlider.reset();
  //   }),

  slider.addEventListener('change', function () {
    minimum.noUiSlider.set([null, this.value]);
  });
});