<template lang="html">
  <component :is="data.component" v-bind="data.props"></component>
</template>
<script>
import * as components from './components/buildings_search'
export default {
  name: 'comp-wrapper',
  components,
  data () {
    return {
      data: {}
    }
  },
  created() {
    this.data = JSON.parse(this.$attrs.data)
  }
}
</script>
<style lang="scss" scoped>
</style>
