import { Controller } from "stimulus"
const noUiSlider = require("nouislider");

export default class extends Controller {
  static targets = ["slider", "reset", "minimum", "maximum"]

  connect() {
    this.setup()
    this.minimumTarget.innerHtml = "HI"
  }


  setup() {
    // const slider = this.sliderTarget;
    // const resetSlider = this.resetTarget;
    const minimumCapacity = parseInt(this.data.get("minimum"))
    const maximumCapacity = parseInt(this.data.get("maximum"))

    if (minimumCapacity !== null && minimumCapacity.value !== "") {
      var min = minimumCapacity
    }
    else {
      var min = 0
    }

    if (maximumCapacity !== null && maximumCapacity.value !== "") {
      var max = maximumCapacity
    }
    else {
      var max = 600
    }
    console.log( minimumCapacity)
    console.log( maximumCapacity)


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
      console.log(this.minimumTarget)
      let capacity = slider.noUiSlider.get();

      // this.minimumCapacity = capacity[0];
      // this.maximumCapacity = capacity[1];
      // this.minimumTarget.innerHtml = capacity[0];
      // this.maximumTarget.innerHtml = capacity[1];
    });

  }




}
