import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["text", "thingToHide"]

  isHidden() { return this.data.get("hidden") === "true" }

  flip() { this.data.set("hidden", this.isHidden() ? "false" : "true") }

  toggle() {
    this.flip()
    this.thingToHideTarget.classList.toggle("is-hidden", this.isHidden())
    this.textTarget.innerText = this.isHidden() ? "Hide Filters" : "Show Filters"
  }

}