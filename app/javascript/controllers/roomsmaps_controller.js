import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ["maps"];

  launchDemo(event) {
    let mapsController = this.application.getControllerForElementAndIdentifier(
      this.mapsTarget,
      "maps"
    );
    mapsController.open();

  }

}