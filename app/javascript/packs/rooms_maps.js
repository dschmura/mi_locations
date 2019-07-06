const loadGoogleMapsApi = require('load-google-maps-api');
class Map {

  static loadGoogleMapsApi() {
    // TODO
    // return loadGoogleMapsApi({ key: "<%= Rails.application.credentials[:google_geocoder_api_key] %>" });
    return loadGoogleMapsApi({ key: "AIzaSyDanqx5Jg7UKmeh9tTVeV6ovANhFhxOFhk" });
  }
  static createMap(googleMaps, mapElement) {
    return new googleMaps.Map(mapElement, {
      center: { lat: 42.276868, lng: -83.738206 },
      zoom: 14
    });
  }
}
export { Map };
