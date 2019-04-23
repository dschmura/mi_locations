import { Controller } from "stimulus";

export default class extends Controller {
  initialize() {
    console.log("Modal controller connected!");
  }
  open() {
    document.body.classList.add("modal-open");
    this.element.setAttribute("style", "display: block;");
    this.element.classList.add("modal-show");
    console.log("The modal has been opened!");

  }
  close() {
    document.body.classList.remove("modal-open");
    this.element.removeAttribute("style");
    this.element.classList.remove("modal-show");

    console.log("The modal has been CLOSED!");
  }
}