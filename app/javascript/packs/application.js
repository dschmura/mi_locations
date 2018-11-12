/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

  import Rails from 'rails-ujs'
  Rails.start()

  import Turbolinks from 'turbolinks'
  Turbolinks.start()

  import Vue from 'vue/dist/vue.esm'

  import App from '../components/app.vue'
  Vue.component('app', App)

  // Specific frontend applications
  import 'mi_locations'

  import 'actiontext'
  import 'trix/dist/trix.css'

  // document.addEventListener('turbolinks:load', () => {
  //   const app = new Vue({
  //     el: '[data-behavior="vue"]',
  //     data: {
  //       message: "Can you say hello?"
  //     },
  //     components: {
  //       App
  //     }
  //   })
  // })
