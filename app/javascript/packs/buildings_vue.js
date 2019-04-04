import Vue from 'vue/dist/vue.esm'

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

import VueResource from 'vue-resource'
Vue.use(VueResource)

import * as Clipboard from 'clipboard'
import { listenerCount } from 'events';
// import Search from '../components/search.vue'
// Vue.component('search', Search)

Vue.config.ignoredElements = ['trix-toolbar', 'trix-editor']
// import Map from '../components/buildings_maps.vue'
// Vue.component('buildings_maps', Map)

// import * as VueGoogleMaps from 'vue2-google-maps'
// Vue.component('buildings_maps', VueGoogleMaps)

FontAwesomeConfig = { autoReplaceSvg: 'nest' }//important addition!


document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  const app = new Vue({

    el: '[data-behavior="vue-layout"]',
    data: {
      layout: 'list',
      filters: false,
      sort_options: false
    },
    methods: {
      set_layout_list() {
        this.layout = 'list';
      },
      set_layout_grid() {
        this.layout = 'grid';
      },
      set_layout_map() {
        this.layout = 'map';
      },
      toggle_filters() {
        this.filters = this.filters ? false : true;
      },
      toggle_sort_options() {
        this.sort_options = this.sort_options ? false : true;
      }
    }
  });

});
