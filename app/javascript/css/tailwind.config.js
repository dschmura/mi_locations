const defaultTheme = require('tailwindcss/defaultTheme')
module.exports = {
  theme: {
    extend: {},
    colors: {

      transparent: 'transparent',

      black: '#000',
      white: '#fff',

      gray: {
        100: '#f7fafc',
        200: '#edf2f7',
        300: '#e2e8f0',
        400: '#cbd5e0',
        500: '#a0aec0',
        600: '#718096',
        700: '#4a5568',
        800: '#2d3748',
        900: '#1a202c',
      },
      red: {
        100: '#fff5f5',
        200: '#fed7d7',
        300: '#feb2b2',
        400: '#fc8181',
        500: '#f56565',
        600: '#e53e3e',
        700: '#c53030',
        800: '#9b2c2c',
        900: '#742a2a',
      },
      orange: {
        100: '#fffaf0',
        200: '#feebc8',
        300: '#fbd38d',
        400: '#f6ad55',
        500: '#ed8936',
        600: '#dd6b20',
        700: '#c05621',
        800: '#9c4221',
        900: '#7b341e',
      },
      yellow: {
        100: '#fffff0',
        200: '#fefcbf',
        300: '#faf089',
        400: '#f6e05e',
        500: '#ecc94b',
        600: '#d69e2e',
        700: '#b7791f',
        800: '#975a16',
        900: '#744210',
      },
      green: {
        100: '#f0fff4',
        200: '#c6f6d5',
        300: '#9ae6b4',
        400: '#68d391',
        500: '#48bb78',
        600: '#38a169',
        700: '#2f855a',
        800: '#276749',
        900: '#22543d',
      },

      blue: {
        100: '#ebf8ff',
        200: '#bee3f8',
        300: '#90cdf4',
        400: '#63b3ed',
        500: '#4299e1',
        600: '#3182ce',
        700: '#2b6cb0',
        800: '#2c5282',
        // 900: '#2a4365',
        900: '#00274c',
      },
      indigo: {
        100: '#ebf4ff',
        200: '#c3dafe',
        300: '#a3bffa',
        400: '#7f9cf5',
        500: '#667eea',
        600: '#5a67d8',
        700: '#4c51bf',
        800: '#434190',
        900: '#3c366b',
      },
      purple: {
        100: '#faf5ff',
        200: '#e9d8fd',
        300: '#d6bcfa',
        400: '#b794f4',
        500: '#9f7aea',
        600: '#805ad5',
        700: '#6b46c1',
        800: '#553c9a',
        900: '#44337a',
      },
      pink: {
        100: '#fff5f7',
        200: '#fed7e2',
        300: '#fbb6ce',
        400: '#f687b3',
        500: '#ed64a6',
        600: '#d53f8c',
        700: '#b83280',
        800: '#97266d',
        900: '#702459',
      },
    },
    customForms: {
      horizontalPadding: defaultTheme.spacing[3],
      verticalPadding: defaultTheme.spacing[2],
      lineHeight: defaultTheme.lineHeight.normal,
      fontSize: defaultTheme.fontSize.base,
      borderColor: defaultTheme.borderColor.default,
      borderWidth: defaultTheme.borderWidth.default,
      borderRadius: defaultTheme.borderRadius.default,
      backgroundColor: defaultTheme.colors.white,
      focusBorderColor: defaultTheme.colors.blue[400],
      focusBoxShadow: defaultTheme.boxShadow.outline,
      boxShadow: defaultTheme.boxShadow.none,
      checkboxSize: '1em',
      radioSize: '1em',
      checkboxIcon: `<svg viewBox="0 0 16 16" fill="#fff" xmlns="http://www.w3.org/2000/svg"><path d="M5.707 7.293a1 1 0 0 0-1.414 1.414l2 2a1 1 0 0 0 1.414 0l4-4a1 1 0 0 0-1.414-1.414L7 8.586 5.707 7.293z"/></svg>`,
      radioIcon: `<svg viewBox="0 0 16 16" fill="#fff" xmlns="http://www.w3.org/2000/svg"><circle cx="8" cy="8" r="3"/></svg>`,
      checkedColor: defaultTheme.colors.blue[500],
      selectIcon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="${defaultTheme.colors.gray[500]}"><path d="M15.3 9.3a1 1 0 0 1 1.4 1.4l-4 4a1 1 0 0 1-1.4 0l-4-4a1 1 0 0 1 1.4-1.4l3.3 3.29 3.3-3.3z"/></svg>`,
      selectIconOffset: defaultTheme.spacing[2],
      selectIconSize: '1.5em',
    }

  },
  variants: {
    // Some useful comment
  },
  plugins: [
    // Some useful comment
  ],

  plugins: [
    require('@tailwindcss/custom-forms')
  ]
}
