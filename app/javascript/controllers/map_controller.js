console.log("Start")
import { Controller } from "stimulus"
import 'leaflet/dist/leaflet.css';
import { get } from 'http'
require("leaflet")
import mapMarker from "../mi_locations/images/icons/map-marker.svg"
export default class extends Controller {
  static targets = ["mapid"]

  connect(){
    let mapBoxToken = this.data.get("mapbox-token");
    const incoming = JSON.parse(this.data.get("mapbox-location"));
    const locations = Object.entries(incoming);
    this.createMap(locations, mapBoxToken);

  }

  createMap(locations, token){

    let centerPoints = this.findCenterPoint(locations);

    if (centerPoints[0] != centerPoints[0]) {
      let mymap = L.map('mapid').setView([42.277461, -83.738293], 13);
      this.addTile(mymap, token);
      this.resizeMap(mymap);
    } else {
      let mymap = L.map('mapid').setView([centerPoints[0], centerPoints[1]], 15);
      this.addTile(mymap, token);
      this.addMarkers(mymap, locations);

      // this.resizeMap(mymap);
    }

    // this.resizeMap(mymap);

  }
  addTile(map, token){
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
      attribution: 'Map Data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
      id: 'mapbox.streets',
      accessToken: token
    }).addTo(map);
  }

  addCircle(map, location){
    let circle = L.circle([location.attributes.building.latitude, location.attributes.building.longitude], {
      color: '#2c5282',
      fillColor: '#2c5282',
      fillOpacity: 0.3,
      radius: 100
    }).addTo(map);
  }

  resizeMap(map){
    setTimeout(function(){ map.invalidateSize()}, 0);
    map.getSize();
  }

  findCenterPoint(locations){
    // 42.277083, -83.738224
    let averageLatitude = 0;
    let averageLongitude = 0;
    let locationsCount = (locations.length ? 0 : 1);

    locations[0][1].forEach(function(location, i){
      if (location.attributes.building.latitude != null || location.attributes.building.longitude != null){
        locationsCount++;
        averageLatitude = averageLatitude + location.attributes.building.latitude;
        averageLongitude = averageLongitude + location.attributes.building.longitude;

      }
    });
    averageLatitude = averageLatitude / locationsCount;
    averageLongitude = averageLongitude / locationsCount;

    let centerPoints = [averageLatitude, averageLongitude];
    return centerPoints;
  }

  addMarker(map, location){
    var mapIcon = L.icon({
      iconUrl: mapMarker,
      iconSize:     [30, 95],
      className: 'map-marker-icon'
    });
    var marker = L.marker([location[0], location[1]], {
      icon: mapIcon
    }).addTo(map);

  }

  addMarkers(map, locations){
    let locationsCount = (locations.length ? 0 : 1);
    var mapIcon = L.icon({
      iconUrl: mapMarker,
      className: 'map-marker-icon'
    });

    locations[0][1].forEach(function(location, i){
      if (location.attributes.building.latitude != null || location.attributes.building.longitude != null){
        locationsCount++;
        let marker = L.marker([location.attributes.building.latitude, location.attributes.building.longitude], {
          icon: mapIcon
        }).addTo(map);

        let popup = L.popup()
        .setLatLng([location.attributes.building.latitude, location.attributes.building.longitude])
        .setContent("I am a standalone popup.")
        .openOn(map);


      }
    });


  }

}
