// import { Map } from './rooms_maps';
// document.addEventListener("DOMContentLoaded", function() {
//   let mapElement = document.getElementById('map');

//   Map.loadGoogleMapsApi().then(function(googleMaps) {
//     Map.createMap(googleMaps, mapElement);
//     // Map.createMarker(googleMaps, mapElement);

//   });
// });



const loadGoogleMapsApi = require('load-google-maps-api');
class Map {

  static loadGoogleMapsApi() {
    // TODO
    // return loadGoogleMapsApi({ key: "<%= Rails.application.credentials[:google_geocoder_api_key] %>" });
    return loadGoogleMapsApi({ key: "AIzaSyDanqx5Jg7UKmeh9tTVeV6ovANhFhxOFhk" });
  }
  static createMap(googleMaps, mapElement) {
    var bounds = new google.maps.LatLngBounds();

    var map = new googleMaps.Map(mapElement, {
      center: { lat: 42.276868, lng: -83.738206 },
      zoom: 14
    });
    var mapItems = document.getElementById('rooms_found');
    var result_items = JSON.parse(mapItems.innerHTML);
    var markers = result_items.map(function (obj) {
      var building = new Array()
      building[0] = '' + obj.building.name + '';
      building[1] = obj.building.latitude;
      building[2] = obj.building.longitude;
      return building;
    });
    console.log(result_items);
    console.log(markers);
    var markers1 = [

      [ '120 WEISER HALL', 42.276, -83.736 ],
      ['Second Building', 42.276868, -83.738206],

    ];
    // console.log(markers1);

    // Info Window Content
    var infoWindowContent = [
      ['<div class="info_content">' +
      '<h3>' + markers[0][0] + '</h3>' +
      '<p>The First Building is a giant Ferris wheel situated on the banks of the River Thames. The entire structure is 135 metres (443 ft) tall and the wheel has a diameter of 120 metres (394 ft).</p>' +        '</div>'],
      ['<div class="info_content">' +
      '<h3>' + markers[1][0] + '</h3>' +
      '<p>The second building is the meeting place of the House of Commons and the House of Lords, the two houses of the Parliament of the United Kingdom. Commonly known as the Houses of Parliament after its tenants.</p>' +
      '</div>']
  ];
  //   var infoWindowContent = [
  //     ['<div class="info_content">' +
  //     '<h3>'First building'</h3>' +
  //     '<p>The First Building is a giant Ferris wheel situated on the banks of the River Thames. The entire structure is 135 metres (443 ft) tall and the wheel has a diameter of 120 metres (394 ft).</p>' +        '</div>'],
  //     ['<div class="info_content">' +
  //     '<h3>Second building</h3>' +
  //     '<p>The second building is the meeting place of the House of Commons and the House of Lords, the two houses of the Parliament of the United Kingdom. Commonly known as the Houses of Parliament after its tenants.</p>' +
  //     '</div>']
  // ];

      // Display multiple markers on a map
      var infoWindow = new google.maps.InfoWindow(), marker, i;
    // Loop through our array of markers & place each one on the map
    for( var i = 0; i < markers.length; i++ ) {
      var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
      bounds.extend(position);
      var marker = new google.maps.Marker({
          position: position,
          map: map,
          // title: "Yo Yo Yolo"
          title: markers[i][0]
      });
      // Allow each marker to have an info window
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
            infoWindow.setContent(infoWindowContent[i][0]);
            infoWindow.open(map, marker);
        }
    })(marker, i));
    }
  }
}

export { Map };