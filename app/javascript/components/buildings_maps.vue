<template>
<div class="mapper">
  <h1>This is a map page</h1>
  <div id="map_holder">
    <div>
      <h2>Search and add a pin</h2>
      <label>
        <gmap-autocomplete
          @place_changed="setPlace">
        </gmap-autocomplete>
        <button @click="addMarker">Add</button>
      </label>
      <br/>

    </div>
    <div>
      <GmapMap
        :center=center
        :zoom="15" map-type-id="roadmap" style="width: 500px; height: 300px">
        <GmapMarker
          :key="index" v-for="(m, index) in markers"
          :position="m.position"
          :clickable="true"
          :draggable="true" @click="center=m.position" />
      </GmapMap>
    </div>
  </div>
</div>
</template>

<script>
console.log("GMAP key in use: " + process.env.VUE_APP_GOOGLE_MAP_API)
// @ is an alias to /src
import Vue from 'vue'
import * as VueGoogleMaps from 'vue2-google-maps'
import {GmapMarker} from 'vue2-google-maps/src/components/marker'
Vue.component('GmapMarker', GmapMarker)

Vue.use(VueGoogleMaps, {
  load: {
    key: process.env.VUE_APP_GOOGLE_MAP_API,
    libraries: 'places', // This is required if you use the Autocomplete plugin
    // OR: libraries: 'places,drawing'
    // OR: libraries: 'places,drawing,visualization'
    // (as you require)

    //// If you want to set the version, you can do so:
    // v: '3.26',
  },

  //// If you intend to programmatically custom event listener code
  //// (e.g. `this.$refs.gmap.$on('zoom_changed', someFunc)`)
  //// instead of going through Vue templates (e.g. `<GmapMap @zoom_changed="someFunc">`)
  //// you might need to turn this on.
  // autobindAllEvents: false,

  //// If you want to manually install components, e.g.
  //// import {GmapMarker} from 'vue2-google-maps/src/components/marker'
  //// Vue.component('GmapMarker', GmapMarker)
  //// then disable the following:
  installComponents: true,
})

export default {
  name: 'mapper',
  data() {
    return {
      // default to Montreal to keep it simple
      // change this to whatever makes sense
      center: { lat: 42.2784, lng: -83.7382 },
      markers: [],
      places: [],
      currentPlace: null
    };
  },

  mounted() {
    // this.geolocate();
  },

  methods: {
    // receives a place object via the autocomplete component
    setPlace(place) {
      this.currentPlace = place;
    },
    addMarker() {
      if (this.currentPlace) {
        const marker = {
          lat: this.currentPlace.geometry.location.lat(),
          lng: this.currentPlace.geometry.location.lng()
        };
        this.markers.push({ position: marker });
        this.places.push(this.currentPlace);
        this.center = marker;
        this.currentPlace = null;
      }
    },
    geolocate: function() {
      navigator.geolocation.getCurrentPosition(position => {
        this.center = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };
      });
    }
  }
};
</script>

<style scoped>
  #map_holder {
    display: flex;
    justify-content: center;
  }
  #map_holder > div {
    margin: 10px;
    padding: 20px;
  }
</style>
