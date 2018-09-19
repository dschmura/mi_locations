<template lang="html">
  <component :is="data.component" v-bind="data.props"></component>
</template>
<script>
import * as components from './components/GoogleMap'
export default {
  name: 'map-comp-wrapper',
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
