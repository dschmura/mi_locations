// https://medium.com/founders-factory/building-a-custom-google-map-component-with-vue-js-d1c01ddd0b0a
<template>
  <div class="google-map" :id="mapName"></div>
</template>

<script>
export default {
  name: 'google-map',
  components: {},
  props: {
    name: String,
    building_locations: Array
  },
  data: function () {
    return {
      mapName: this.name + "-map",
      markerCoordinates: [{
        latitude: 42.276594,
        longitude: -83.739669
      }, {
        latitude: 42.275966,
        longitude: -83.736248
      }, {
        latitude: 42.275689,
        longitude: -83.735154
      }, {
        latitude: 42.289293,
        longitude: -83.717336
      }],
      map: null,
      bounds: null,
      markers: []
    }
  },
  mounted: function () {
    this.bounds = new google.maps.LatLngBounds();
    const element = document.getElementById(this.mapName)
    const mapCentre = this.markerCoordinates[0]
    const options = {
      center: new google.maps.LatLng(mapCentre.latitude, mapCentre.longitude)
    }
    this.map = new google.maps.Map(element, options);
    this.markerCoordinates.forEach((coord) => {
      const position = new google.maps.LatLng(coord.latitude, coord.longitude);
      const marker = new google.maps.Marker({
        position,
        map: this.map
      });
    this.markers.push(marker)
      this.map.fitBounds(this.bounds.extend(position))
    });
  }
};
</script>

<style scoped>
.google-map {
  width: 800px;
  height: 600px;
  margin: 0 auto;
  background: gray;
}
</style>
