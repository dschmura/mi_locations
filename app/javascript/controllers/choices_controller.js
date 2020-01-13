import { Controller } from "stimulus"
require('choices.js')
// import 'choices.js/source/styles/choices.scss';
// import 'choices.js/src/styles/base.scss'
import 'choices.js/src/styles/choices.scss'

export default class extends Controller {
  static targets = [ "select" ]


  connect(){
    // console.log("hi dave")
  }
}
