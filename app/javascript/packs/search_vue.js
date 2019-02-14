import Vue from 'vue/dist/vue.esm'

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

import VueResource from 'vue-resource'
Vue.use(VueResource)

import * as Clipboard from 'clipboard'

import Search from '../components/search.vue'
Vue.component('search', Search)

Vue.config.ignoredElements = ['trix-toolbar', 'trix-editor']
// import Map from '../components/buildings_maps.vue'
// Vue.component('buildings_maps', Map)

// import * as VueGoogleMaps from 'vue2-google-maps'
// Vue.component('buildings_maps', VueGoogleMaps)


document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  const app = new Vue({
    el: '[data-behavior="vue"]',
    data: {
      message: "Can you say hello?"
    },
    components: {
      Search
    }
  })
})
// $(document).ready(function(){
//   $( ".clipboard-btn" ).click(function() {
//     var clipboard = new Clipboard('.clipboard-btn');
//     console.log(clipboard);
//   });
//
// });
