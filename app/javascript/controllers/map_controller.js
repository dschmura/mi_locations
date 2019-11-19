import { Controller } from "stimulus"
import 'leaflet/dist/leaflet.css';
import { get } from 'http'
require("leaflet")

export default class extends Controller {
  static targets = ["mapid"]

  initialize(){
    let mapBoxToken = this.data.get("mapbox-token");
    const rooms = JSON.parse(this.data.get("mapbox-room"));
    this.createMap(rooms, mapBoxToken);

  }

  createMap(rooms, token){
    let centerPoints = this.findCenterPoint(rooms);
    const mymap = L.map('mapid').setView([centerPoints[0], centerPoints[1]], 15);

    this.addTile(mymap, token);
    this.addMarkers(mymap, rooms);

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
    setTimeout(function(){ map.invalidateSize()}, 100);
  }

  findCenterPoint(rooms){
    // 42.277083, -83.738224
    let averageLatitude = 0;
    let averageLongitude = 0;
    let roomsCount = 0;

    rooms.forEach(function(room, i){
      if (room.building.latitude != null || room.building.longitude != null){

        roomsCount++;

        averageLatitude = averageLatitude + rooms[i].building.latitude;
        averageLongitude = averageLongitude + rooms[i].building.longitude;

      }
    });

    averageLatitude = averageLatitude / roomsCount;
    averageLongitude = averageLongitude / roomsCount;
    let centerPoints = [averageLatitude, averageLongitude];
    return centerPoints;
  }

  addMarker(map, room){
    var greenIcon = L.icon({
      iconUrl: '/packs/media/images/marker-icon-2273e3d8.png'
    });
    var marker = L.marker([room[0], room[1]], {
      icon: greenIcon
    }).addTo(map);

  }

  addMarkers(map, rooms){
    var greenIcon = L.icon({
      iconUrl: '/packs/media/images/marker-icon-2273e3d8.png'
    });

    for( var i = 0; i < rooms.length; i++ ) {
      if (rooms[i].building.latitude != null || rooms[i].building.longitude != null){
        let marker = L.marker([rooms[i].building.latitude, rooms[i].building.longitude], {
          icon: greenIcon
        }).addTo(map);


      }
    }
  }
}
