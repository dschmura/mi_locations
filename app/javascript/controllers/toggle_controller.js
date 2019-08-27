import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dropdown", "filters", "mainnav", "roomsmap", "instructor_computer_checkbox"]

  mainnavtoggle() {
    event.preventDefault()
    this.mainnavTargets.forEach((el, i) => {
      el.classList.toggle("hidden")

    })
  }

  roomsmaptoggle() {
    event.preventDefault()
    this.roomsmapTargets.forEach((el, i) => {
      el.classList.toggle("hidden")

    })
  }
  // instructor_computer_checkboxtoggle(){
  //   this.instructor_computer_checkboxTargets.forEach((el, i) => {
  //     el.checked = !el.checked;
  //   })
  // }
  // get_checked() {
  //   this.instructor_computer_checkboxTargets.filter(checkbox => checkbox.checked)
  // }

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
