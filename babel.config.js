module.exports = function (api) {
  api.cache(true)
  const presets = [
    [
      '@babel/preset-env',
      {
        targets: {
          browsers: '> 1%'
        },
        useBuiltIns: 'entry',
        forceAllTransforms: true
      }
    ]
  ]
  const plugins = [
    '@babel/plugin-transform-modules-commonjs',
    '@babel/plugin-proposal-export-default-from',
    '@babel/plugin-proposal-export-namespace-from',
    '@babel/plugin-syntax-dynamic-import',
    '@babel/plugin-proposal-object-rest-spread',
    '@babel/plugin-transform-runtime'
  ]

  return {
    presets,
    plugins
  }
}