
import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['content']

  // Sets the popover offset using Stimulus data map objects.
  initialize() {
    // this.tooltip = this.data.get('class') || 'hidden'
    this.contentTarget.setAttribute(
      'style',
      `transform:translate(${this.translateX = this.data.get('translateX') || '0'}, ${this.translateY = this.data.get('translateY') || '0'});`,
    )
  }

  // Show the popover
  mouseOver() {
    this.contentTarget.classList.remove('hidden')
    this.contentTarget.innerHTML = this.popover.content
  }
  // Hide the popover
  mouseOut() {
    this.contentTarget.classList.add('hidden')
  }
}