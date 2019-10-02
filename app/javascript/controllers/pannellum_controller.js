import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "panorama" ]
  // static values = { panoimage: String }

  connect(){
    this.pano()
  }
  pano() {
    var panoimage = this.data.get("panoimage")
    var panopreview = this.data.get("panopreview")

    pannellum.viewer('panorama', {
      "type": "equirectangular",
      "panorama": panoimage,
      "preview": panopreview
    });
  }

}
