<template>
    <div @click="clickButton">
     <button @click='toggle()'>Open/Close</button>



  </div>
</template>

<script>

export default {
  name: 'layout-button',

  data() {
    return {

    }

  },
  methods: {
    clickButton() {
      this.isOpen = !this.isOpen

    },
    toggle: function(){
      this.isOpen = !this.isOpen
    }
  },

}
</script>

<style>

</style>
