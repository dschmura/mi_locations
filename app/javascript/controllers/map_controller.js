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
    const incoming = JSON.parse(this.data.get("mapbox-room"));
    const rooms = Object.entries(incoming);
    this.createMap(rooms, mapBoxToken);

  }

  createMap(rooms, token){

    let centerPoints = this.findCenterPoint(rooms);

    if (centerPoints[0] != centerPoints[0]) {

      let mymap = L.map('mapid').setView([42.277461, -83.738293], 13);
      this.addTile(mymap, token);
      this.resizeMap(mymap);
    } else {
      let mymap = L.map('mapid').setView([centerPoints[0], centerPoints[1]], 15);
      this.addTile(mymap, token);
      this.addMarkers(mymap, rooms);
      this.resizeMap(mymap);
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

  addCircle(map, room){
    let circle = L.circle([room.building.latitude, room.building.longitude], {
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

  findCenterPoint(rooms){
    // 42.277083, -83.738224
    let averageLatitude = 0;
    let averageLongitude = 0;
    let roomsCount = (rooms.length ? 0 : 1);

    rooms[0][1].forEach(function(room, i){
      if (room.attributes.building.latitude != null || room.attributes.building.longitude != null){
        roomsCount++;
        averageLatitude = averageLatitude + room.attributes.building.latitude;
        averageLongitude = averageLongitude + room.attributes.building.longitude;

      }
    });
    averageLatitude = averageLatitude / roomsCount;
    averageLongitude = averageLongitude / roomsCount;

    let centerPoints = [averageLatitude, averageLongitude];
    return centerPoints;
  }

  addMarker(map, room){
    var mapIcon = L.icon({
      iconUrl: mapMarker,
      iconSize:     [30, 95],
      className: 'map-marker-icon'
    });
    var marker = L.marker([room[0], room[1]], {
      icon: mapIcon
    }).addTo(map);

  }

  addMarkers(map, rooms){
    let roomsCount = (rooms.length ? 0 : 1);
    var mapIcon = L.icon({
      iconUrl: mapMarker,
      className: 'map-marker-icon'
    });

    rooms[0][1].forEach(function(room, i){
      if (room.attributes.building.latitude != null || room.attributes.building.longitude != null){
        roomsCount++;
        let marker = L.marker([room.attributes.building.latitude, room.attributes.building.longitude], {
          icon: mapIcon
        }).addTo(map);
      }
    });


  }

}
