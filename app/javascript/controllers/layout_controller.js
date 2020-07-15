import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["format", "list", "grid"]

  initialize() {

  }
  toggle() {
  }

  resetToggle() {
    console.log("clicked")
    event.preventDefault()
    this.formatTargets.forEach((el, i) => {
      el.classList.toggle("hidden")

    })
  }

  list() {

    this.gridTarget.classList.remove("active")
    this.listTarget.classList.add("active")

    this.resetToggle()
    localStorage.setItem('selectedLayout', "list");

  }
  grid() {

    this.listTarget.classList.remove("active")
    this.gridTarget.classList.add("active")
    this.resetToggle()
    localStorage.setItem('selectedLayout', "grid");
  }


}