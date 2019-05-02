import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["text", "thingToShow"]

  isShown() { return this.data.get("shown") === "true" }

  flip() { this.data.set("shown", this.isShown() ? "false" : "true") }

  toggle() {
    this.flip()
    this.thingToShowTarget.classList.toggle("is-shown", this.isShown())
    this.textTarget.innerText = this.isShown() ? "Show" : "Hide"
  }

}

// filters section starts out hidden
// when user clickes filters-button
  // it adds is-visible class to filters section
  // it toggles the text in the button from show to hide filters
