process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const webpackConfig = require('./base')

const { BundleAnalyzerPlugin } = require('webpack-bundle-analyzer')

environment.plugins.append(
  'BundleAnalyzer',
  new BundleAnalyzerPlugin()
)

module.exports = webpackConfig
