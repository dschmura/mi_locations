import 'leaflet/dist/leaflet.css'
require("leaflet")

document.addEventListener('turbolinks:load', () => {

  const mymap = L.map('mapid').setView([42.276, -83.738], 15);
  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoidW1pY2hyYWlscyIsImEiOiJjanpzZng4bXAwNDFnM2pwOXl6NWVjcXJzIn0.rCEZ2pNHo_a9A9XPOsRxcA'
  }).addTo(mymap);

  // L.marker([42.276, -83.738]).addTo(mymap);

  var circle = L.circle([42.276, -83.738], {
    color: 'red',
    fillColor: '#f03',
    fillOpacity: 0.5,
    radius: 50
  }).addTo(mymap);
});

// Called after every non-initial page load
document.addEventListener('turbolinks:render', () =>
  {  const mymap = L.map('mapid').setView([42.276, -83.738], 15);
  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoidW1pY2hyYWlscyIsImEiOiJjanpzZng4bXAwNDFnM2pwOXl6NWVjcXJzIn0.rCEZ2pNHo_a9A9XPOsRxcA'
  }).addTo(mymap);

  // L.marker([42.276, -83.738]).addTo(mymap);

  var circle = L.circle([42.276, -83.738], {
    color: 'red',
    fillColor: '#f03',
    fillOpacity: 0.5,
    radius: 50
  }).addTo(mymap);
}
);