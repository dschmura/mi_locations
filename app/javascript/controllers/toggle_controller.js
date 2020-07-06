import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dropdown", "filters", "mainnav", "roomsmap", "toggleable", "layout", "sort"]

  connect() {
    this.toggleClass = this.data.get('class') || 'hidden'
  }

  toggle(event) {
    event.preventDefault()
    this.toggleableTargets.forEach(target => {
      target.classList.toggle(this.toggleClass)
    })
  }

  mainnavtoggle() {
    event.preventDefault()
    this.mainnavTargets.forEach((el, i) => {
      el.classList.toggle("hidden")

    })
  }

  layoutToggle() {
    event.preventDefault()
    this.layoutTarget.forEach((el, i) => {
      el.classList.toggle("hidden")

    })
  }

  sortToggle() {
    event.preventDefault()
    this.sortTargets.forEach((el, i) => {
      el.classList.toggle("hidden")

    })
  }

  roomsmapToggle() {
    event.preventDefault();
    this.roomsmapTargets.forEach((el, i) => {
      el.classList.toggle("hidden")
    });
    window.scrollTo(0, 0);
    window.dispatchEvent(new Event('resize'));
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
    const width = window.innerWidth
    || document.documentElement.clientWidth
    || document.body.clientWidth;
    event.preventDefault()
    this.filtersTargets.forEach((el, i) => {
      el.classList.toggle("hidden")
    })
    if (width > 768 && width < 1280){
      this.filtersTargets.forEach((el, i) => {
        el.classList.toggle("")
      })
    }

  }
}
