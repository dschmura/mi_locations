import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "mainnav", "filters"]


  toggle() {
    this.mainnavTargets.forEach((el, i) => {
      el.classList.toggle("hidden")

    })
  }
  filtertoggle() {
    this.filtersTarget.classList.toggle("hidden")

  }
}