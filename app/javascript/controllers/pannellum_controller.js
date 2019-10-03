import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "panorama" ]
  // static values = { panoimage: String }

  connect(){
    this.pano()
  }
  pano() {
    let panoimage = this.data.get("panoimage")
    let panopreview = this.data.get("panopreview")

    pannellum.viewer('panorama', {
      "type": "equirectangular",
      "panorama": panoimage,
      "preview": panopreview
    });
  }

}
