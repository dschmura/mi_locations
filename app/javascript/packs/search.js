var noUiSlider = require("nouislider");


document.addEventListener('turbolinks:load', () => {
  var slider = document.getElementById('slider');
  var resetSlider = document.getElementById('reset-slider');
  const minimumCapacity = document.getElementById('minimum-capacity');
  const maximumCapacity = document.getElementById('maximum-capacity');

  console.log(minimumCapacity.value)
  if (minimumCapacity !== null && minimumCapacity.value !== "") {
    var min = parseInt(minimumCapacity.value, 10)
  }
  else {
    var min = 0
  }

  if (maximumCapacity !== null && maximumCapacity.value !== "") {
    var max = parseInt(maximumCapacity.value, 10)
  }
  else {
    var max = 600
  }

  noUiSlider.create(slider, {

    range: {
      'min': 0,
      'max': 600
    },


    step: 5,
    // Handles start at ...
    start: [min , max],
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
        return parseInt(value) + '';


      },
      from: function (value) {
        return value.replace(',-', '');
      },


    },

  });

  // resetSlider.addEventListener('click', function() {
  //     slider.noUiSlider.reset();
  //   }),

  slider.noUiSlider.on('update', function () {
    var capacity = slider.noUiSlider.get();
    minimumCapacity.value = capacity[0];
    maximumCapacity.value = capacity[1];
  });
});
