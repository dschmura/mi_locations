import { Controller } from "stimulus"
require('infinite-scroll')

export default class extends Controller {
  static targets = [ "scrollcontainer" ]
  // static values = { panoimage: String }

  connect(){
    let infScroll = new InfiniteScroll( this.scrollcontainerTarget, {
      path: '.view-more-link',
      append: '.post',
      history: false,
    })

  }
}
