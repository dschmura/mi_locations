import Vue from 'vue/dist/vue.esm'

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

import VueResource from 'vue-resource'
Vue.use(VueResource)

import * as Clipboard from 'clipboard'

// import Search from '../components/search.vue'
// Vue.component('search', Search)

Vue.config.ignoredElements = ['trix-toolbar', 'trix-editor']
// import Map from '../components/buildings_maps.vue'
// Vue.component('buildings_maps', Map)

// import * as VueGoogleMaps from 'vue2-google-maps'
// Vue.component('buildings_maps', VueGoogleMaps)


document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  const app = new Vue({

    el: '[data-behavior="vue-layout"]',
    data: {
      layout: 'card'
    }
    });

  const app2 = new Vue({
    el: '[data-behavior="vue-filters-toggle"]',
    data: {
      tests: "Can you say hello?",
      layout: 'card',
      show_filters: 'on'
    },
    computed: {
      filteredByLabel() {
        let view_format = new RegExp(this.selected, 'i')
        return this.posts.filter(el => el.label.match(filter))
      },

    }


    //   components: {
    //     Search
    //   }
    // })
  })


});
