import Vue from 'vue/dist/vue.esm'

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

import axios from 'axios'

let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token
axios.defaults.headers.common['Accept'] = 'application/json'

// import Search from '../components/search.vue'
// Vue.component('search', Search)

// import RoomsFilters from '../components/rooms_filters.vue'
// Vue.component('rooms_filters', RoomsFilters)
import LayoutButton from '../components/layout_button.vue'
Vue.component('layout-button', LayoutButton)

import vSelect from 'vue-select'
Vue.component('v-select', vSelect)
import 'vue-select/src/scss/vue-select.scss'

Vue.config.ignoredlements = ['trix-toolbar', 'trix-editor']

FontAwesomeConfig = { autoReplaceSvg: 'nest' }//important addition!

document.addEventListener('turbolinks:load', () => {

  const app = new Vue({

    el: '[data-behavior="vue-layout"]',
    // props: ['isOpen'],
    props: {


    },
    props: {
      isOpen: {
        type: Boolean,
        default: false
      },
      isCard: {
        type: Boolean,
        default: false
      },
      isRow: {
        type: Boolean,
        default: true
      },
      placeholder: {
        type: String,
        default: "HI Dave"
      },
    },
    data: function () {
      return {
        room_characteristics_params: [],
        buildings: [],
        schools_or_colleges: []
      }
    },
    methods: {
      clear_room_characteristics_params() {
        this.room_characteristics_params = [];
      }
    },

  });

});
