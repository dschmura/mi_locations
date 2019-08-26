import 'leaflet/dist/leaflet.css'
require("leaflet")


function openmapster(map ) {
  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    id: 'mapbox.streets',
    accessToken: '<%= Rails.application.credentials.dig(:MI_LOCATIONS_OPENMAP_TOKEN) %>'

  }).addTo(map);

}

document.addEventListener('turbolinks:load', () => {
  const mymap = L.map('mapid').setView([42.276, -83.738], 15);
  openmapster(mymap);
});

// Called after every non-initial page load
document.addEventListener('turbolinks:render', () => {
  const mymap = L.map('mapid').setView([42.276, -83.738], 15);
  openmapster(mymap);
});
