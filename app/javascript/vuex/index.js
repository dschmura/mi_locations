import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';
Vue.use(Vuex);

import BuildingStore from './stores/building.js';

const store = new Vuex.Store({
  modules: {
    BuildingStore;
  }
});

export default store;
