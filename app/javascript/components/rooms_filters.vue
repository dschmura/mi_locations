<template>
  <div id="rooms_filters">
    <p>{{ message }}</p>

  </div>
</template>

<script>
  export default {
    data: function () {
      return {
        message: "Hello Buildings Map!"
      }
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
