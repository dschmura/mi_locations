import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dropdown", "filters", "mainnav", "roomsmap", "roommap", "instructor_computer_checkbox"]

  mainnavtoggle() {
    event.preventDefault()
    this.mainnavTargets.forEach((el, i) => {
      el.classList.toggle("hidden")

    })
  }

  roomsmapToggle() {
    event.preventDefault();

    this.roomsmapTargets.forEach((el, i) => {
      el.classList.toggle("hidden")

    });
    window.scrollTo(0, 0);
  }

  roommapToggle() {
    event.preventDefault();
    this.roommapTargets.forEach((el, i) => {
      el.classList.toggle("hidden")

    });
    window.scrollTo(0, 0);
  }
  instructor_computer_checkboxtoggle(){
    this.instructor_computer_checkboxTargets.forEach((el, i) => {
      el.checked = !el.checked;
    })
  }
  get_checked() {
    this.instructor_computer_checkboxTargets.filter(checkbox => checkbox.checked)
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
