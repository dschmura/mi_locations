<template>
  <div id="test-map">
    <p>{{ message }}</p>
  </div>
</template>

<script>
// import general map component
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
