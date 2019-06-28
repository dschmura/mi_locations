import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dropdown", "filters", "mainnav"]

  mainnavtoggle() {
    event.preventDefault()
    this.mainnavTargets.forEach((el, i) => {
      el.classList.toggle("hidden")

    })
  }

  dropdowntoggle() {
    const { clientWidth } = this.element
    event.preventDefault()
    if (clientWidth > 640 ){
      this.dropdownTargets.forEach((el, i) => {
        el.classList.toggle("hidden")
      })
    }
  }

  filtertoggle() {
    event.preventDefault()
    this.filtersTargets.forEach((el, i) => {
      el.classList.toggle("hidden")
    })


  }
}