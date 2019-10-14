import { Controller } from "stimulus"
import 'leaflet/dist/leaflet.css';
import { get } from 'http'
require("leaflet")

export default class extends Controller {

  connect(){
    let mapBoxToken = this.data.get("mapbox-token");
    const room = JSON.parse(this.data.get("mapbox-room"));
    this.createMap(room, mapBoxToken);
    // To get around issue https://stackoverflow.com/questions/36246815/data-toggle-tab-does-not-download-leaflet-map/36257493#36257493
    window.dispatchEvent(new Event('resize'));

  }

  createMap(room, token){
    let centerPoints = this.findCenterPoint(room);
    const mymap = L.map('mapid').setView([centerPoints[0], centerPoints[1]], 15);
    mymap.invalidateSize();
    this.addTile(mymap, token);
    this.addMarkers(mymap, room)
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

  findCenterPoint(room){
    let averageLatitude = 0;
    let averageLongitude = 0;
    let roomCount = 0;
    for( var i = 0; i < room.length; i++ ) {
      console.log(room[i].building.latitude)
      if (room[i].building.latitude != null || room[i].building.longitude != null){
        roomCount++;

      averageLatitude = averageLatitude + room[i].building.latitude;
      averageLongitude = averageLongitude + room[i].building.longitude;

      }
    }
    averageLatitude = averageLatitude / roomCount;
    averageLongitude = averageLongitude / roomCount;
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

  addMarkers(map, room){
    var greenIcon = L.icon({
      iconUrl: '/packs/media/images/marker-icon-2273e3d8.png'
    });

    for( var i = 0; i < room.length; i++ ) {
      if (room[i].building.latitude != null || room[i].building.longitude != null){
        let marker = L.marker([room[i].building.latitude, room[i].building.longitude], {
          icon: greenIcon
        }).addTo(map);
      }
    }
  }
}
