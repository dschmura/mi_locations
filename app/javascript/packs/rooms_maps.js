// const loadGoogleMapsApi = require('load-google-maps-api');
// class Map {

//   static loadGoogleMapsApi() {
//     return loadGoogleMapsApi({ key: "AIzaSyDanqx5Jg7UKmeh9tTVeV6ovANhFhxOFhk" });
//   }
//   static createMap(googleMaps, mapElement) {
//     var bounds = new google.maps.LatLngBounds();

//     var map = new googleMaps.Map(mapElement, {
//       center: { lat: 42.276868, lng: -83.738206 },
//       zoom: 14
//     });
//     var mapItems = document.getElementById('rooms_found');
//     var result_items = JSON.parse(mapItems.innerHTML);
//     var markers = result_items.map(function (obj) {
//       var building = new Array()
//       building[0] = '' + obj.building.name + '';
//       building[1] = obj.building.latitude;
//       building[2] = obj.building.longitude;
//       return building;
//     });

//   //   // Info Window Content
//   var infoWindowContent = [];
//   for( var info=0; info<markers.length; info++){
//     var temp = [ '<div class="info_content">' +
//             '<h3>' + markers[info][0] +
//             '</h3>' +
//             '<p>The First Building is a giant Ferris wheel situated on the banks of the River Thames. The entire structure is 135 metres (443 ft) tall and the wheel has a diameter of 120 metres (394 ft).</p>' +
//             '</div>' ];
//             infoWindowContent[info] = temp;
//   }

//     // Display multiple markers on a map
//     var infoWindow = new google.maps.InfoWindow(), marker, i;
//     // Loop through our array of markers & place each one on the map
//     for( var i = 0; i < markers.length; i++ ) {
//       var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
//       bounds.extend(position);
//       var marker = new google.maps.Marker({
//           position: position,
//           map: map,
//           // title: "Yo Yo Yolo"
//           title: markers[i][0]
//       });
//       // Allow each marker to have an info window
//       google.maps.event.addListener(marker, 'click', (function(marker, i) {
//         return function() {
//             infoWindow.setContent(infoWindowContent[i][0]);
//             infoWindow.open(map, marker);
//         }
//     })(marker, i));
//     }
//   }
// }

// export { Map };
