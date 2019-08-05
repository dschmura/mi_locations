import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dropdown", "filters", "mainnav", "checkbox"]

  mainnavtoggle() {
    event.preventDefault()
    this.mainnavTargets.forEach((el, i) => {
      el.classList.toggle("hidden")

    })
  }

  checkboxtoggle(){
    this.checkboxTargets.forEach((el, i) => {
      el.checked = !el.checked;

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
  hideuseractions(){
    const width = window.innerWidth
        || document.documentElement.clientWidth
        || document.body.clientWidth;
    if (width < 640 ){
      this.dropdownTargets.forEach((el, i) => {
        el.classList.add("hidden")
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
