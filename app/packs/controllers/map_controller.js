// import { Controller } from "stimulus"
// import 'leaflet/dist/leaflet.css';
// import { get } from 'http'
// require("leaflet")
// import mapMarker from "../mi_locations/images/icons/map-marker.svg"
// export default class extends Controller {
//   static targets = ["mapid"]

//   connect(){
//     let mapBoxToken = this.data.get("mapbox-token");
//     const incoming = JSON.parse(this.data.get("mapbox-location"));
//     const locations_data = Object.entries(incoming.data);
//     const valid_locations = this.validLocations(locations_data);
//     const locations = this.uniqueLocations(valid_locations)
//     this.createMap(locations, mapBoxToken);

//     let centerPoints = this.findCenterPoint(locations);
//     console.log("RESULTING CENTERPOINTS: " + centerPoints)
//   }

//   createMap(locations, token){
//     // if (centerPoints[0] != centerPoints[0]) {
//       let mymap = L.map('mapid').setView([42.277461, -83.738293], 13);
//       this.addTile(mymap, token);
//       this.addMarkers(mymap, locations);
//       this.resizeMap(mymap);
//   }
//   addTile(map, token){
//     L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
//       attribution: 'Map Data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
//       id: 'mapbox.streets',
//       accessToken: token
//     }).addTo(map);
//   }

//   addCircle(map, location){
//     let circle = L.circle([location.attributes.building.latitude, location.attributes.building.longitude], {
//       color: '#2c5282',
//       fillColor: '#2c5282',
//       fillOpacity: 0.3,
//       radius: 100
//     }).addTo(map);
//   }

//   resizeMap(map){
//     setTimeout(function(){ map.invalidateSize()}, 0);
//     map.getSize();
//   }
//   findCenterPoint(locations){
//     var locationsCount = locations.length;
//     console.log("Count: " + locationsCount)
//     var X = 0.0;
//     var Y = 0.0;
//     var Z = 0.0;

//     locations.forEach(function(location, i){
//       if (location[1].attributes.latitude && location[1].attributes.longitude){
//         var latitude = location[1].attributes.latitude * Math.PI / 180;
//         var longitude = location[1].attributes.longitude * Math.PI / 180;
//         var a = Math.cos(latitude) * Math.cos(longitude);
//         var b = Math.cos(latitude) * Math.sin(longitude);
//         var c = Math.sin(latitude);

//         X += a;
//         Y += b;
//         Z += c;

//         X /= locationsCount;
//         Y /= locationsCount;
//         Z /= locationsCount;
//       }

//     var longitude_2 = Math.atan2(Y, X);
//     var hyp = Math.sqrt(X * X + Y * Y);
//     var latitude2 = Math.atan2(Z, hyp);

//     var averageLatitude = latitude2 * 180 / Math.PI;
//     var averageLongitude =  longitude_2 * 180 / Math.PI;

//     let centerPoints = [averageLatitude, averageLongitude];
//     return centerPoints;
//    });
//   }

//   validLocations(locations){
//     // Locations need a latitude and longitude to be valid
//     let valid_locations = []
//     locations.forEach(function(location){

//       if (location[1].attributes.latitude != location[1].attributes.latitude || location[1].attributes.longitude != location[1].attributes.latitude){
//         valid_locations.push(location)
//       }
//     });
//     console.log(valid_locations)
//     return valid_locations
//   }

//   uniqueLocations(locations) {
//     let unique_location_pairs = []
//     let unique_locations = []

//     locations.forEach(function(location){
//       var lat_long_pair = (location[1].attributes.latitude  + location[1].attributes.longitude)

//       if(unique_location_pairs.includes(lat_long_pair)){
//       }
//       else{
//         unique_location_pairs.push(lat_long_pair)
//         unique_locations.push(location)
//       }
//     })

//     return unique_locations
//   }

//   addMarker(location){

//     // var mapIcon = L.icon({
//     //   iconUrl: mapMarker,
//     //   iconSize:     [30, 95],
//     //   className: 'map-marker-icon'
//     // });
//     // var marker = L.marker([location[0], location[1]], {
//     //   icon: mapIcon
//     // }).addTo(map);

//   }

//   addMarkers(map, locations){
//     console.log("Before count: " + locations.length)

//     var locations = this.uniqueLocations(locations)
//     console.log("After count: " + locations.length)
//     var mapIcon = L.icon({
//       iconUrl: mapMarker,
//       className: 'map-marker-icon'
//     });

//     locations.forEach(function(location, i){

//         let marker = L.marker([location[1].attributes.latitude, location[1].attributes.longitude], {
//           icon: mapIcon
//         }).addTo(map).bindPopup(location[1].attributes.location_name);

//     });


//   }

// }
