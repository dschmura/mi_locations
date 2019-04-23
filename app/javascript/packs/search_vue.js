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
      }
    },
    data: function () {
      return {

      }
    },
    methods: {
    },

  });

});
