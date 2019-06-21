import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "mainnav", "filters"]


  toggle() {
    this.mainnavTargets.forEach((el, i) => {
      el.classList.toggle("hidden")

    })
  }
  filtertoggle() {
    this.filtersTargets.forEach((el, i) => {
      el.classList.toggle("hidden")
    })


  }
}