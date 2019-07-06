// const loadGoogleMapsApi = require('load-google-maps-api');
// class Map {
//   static loadGoogleMapsApi() {
//     // TODO
//     // return loadGoogleMapsApi({ key: "<%= Rails.application.credentials[:google_geocoder_api_key] %>" });
//     return loadGoogleMapsApi({ key: "AIzaSyDanqx5Jg7UKmeh9tTVeV6ovANhFhxOFhk" });
//   }
//   static createMap(googleMaps, mapElement) {
//     return new googleMaps.Map(mapElement, {
//       center: { lat: 46.276868, lng: -83.738206 },
//       zoom: 15
//     });
//   }
// }
// export { Map };
// // console.log( "<%= Rails.application.credentials.google_geocoder_api_key />" )


import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "map"]
  initialize() {
    fetch(this.data.get("gmap"))
    console.log("HI")
    console.log(gmap)
  }

}