import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["format"]

  initialize() {
    this.list()
  }
  toggleVisability(format) {
    this.formatTargets.forEach((el) => {
      console.log(el)
      if(el == format){
        alert(format)
        el.classList.toggle("format--current", el)
      }
    })
  }
  list() {
    this.layout = 'list'
    this.toggleVisability('list')

  }
  grid() {
    this.layout = 'grid'
    console.log(this.layout)
    this.toggleVisability('grid')
  }
  map() {
    this.layout = 'map'
    console.log(this.layout)
    this.toggleVisability('map')
  }

}