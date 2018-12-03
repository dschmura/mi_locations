const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue =  require('./loaders/vue')

environment.plugins.append('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.append('vue', vue)
module.exports = environment

// For production deployments?
const path = require("path")
Object.assign(environment.loaders.get("css").use.find(el => el.loader === "postcss-loader").options, {
  config: {
    path: path.resolve(__dirname, "../..", ".postcssrc.yml")
  }
})
