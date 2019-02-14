<template>
  <div>
  </div>
</template>

<script>
import Vue from "vue/dist/vue.esm";
import VueSelect from "vue-select";
Vue.component("vue-select", VueSelect);

export default {
  el: '.grid-list-map-toggle',
  data: function() {
    return {
      layout: 'grid'
    };
  },

};
</script>

<style scoped lang='sass'>
p {
  font-size: 2em;
  text-align: center;
}
</style>
