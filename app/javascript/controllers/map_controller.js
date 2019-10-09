import { Controller } from "stimulus"
import 'leaflet/dist/leaflet.css';
import { get } from 'http'
require("leaflet")

export default class extends Controller {
  static targets = [ "roommap" ]

  connect(){
    let mapBoxToken = this.data.get("mapbox-token");
    const room = JSON.parse(this.data.get("mapbox-room"));
    this.createMap(room, mapBoxToken);
  }

  createMap(room, token){
    const mymap = L.map('mapid').setView([room.building.latitude, room.building.longitude], 15);
    this.addTile(mymap, token);
    this.addMarker(mymap, room);
    this.addCircle(mymap, room);
  }
  addTile(map, token){
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
      attribution: 'Map Data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
      id: 'mapbox.streets',
      accessToken: token
    }).addTo(map);
  }

  addCircle(map, room){
    var circle = L.circle([room.building.latitude, room.building.longitude], {
      color: '#2c5282',
      fillColor: '#2c5282',
      fillOpacity: 0.3,
      radius: 100
    }).addTo(map);
  }

  addMarker(map, room){
    var marker = L.marker([room.building.latitude, room.building.longitude]).addTo(map);
  }

}
