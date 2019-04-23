import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ["modal"];

  launchDemo(event) {
    let modalController = this.application.getControllerForElementAndIdentifier(
      this.modalTarget,
      "modal"
    );
    modalController.open();

  }

}