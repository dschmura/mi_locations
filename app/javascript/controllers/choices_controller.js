import { Controller } from "stimulus"
const Choices = require('choices.js');
// import 'choices.js/source/styles/choices.scss';
// import 'choices.js/src/styles/base.scss'
// import 'choices.js/public/assets/styles/choices.min.css'
// import 'choices.js/src/styles/choices.scss'
// import 'choices.js/public/assets/styles/base.min.css'

export default class extends Controller {
  static targets = [ "choice" ]

  initialize(){
    // const element = document.querySelector('.js-choice');
    const element = this.choiceTarget
    const choices = new Choices(element, {
      placeholder: true,
      placeholderValue: "Please select",
      searchFields: ['label'],
      removeItemButton: true,
      maxItemCount: 2
    })
  }

}
