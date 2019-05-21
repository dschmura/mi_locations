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


  },
  variants: {
    // Some useful comment
  },
  plugins: [
    // Some useful comment
  ],

  plugins: [
    function ({ addUtilities, addComponents, theme }) {
      addUtilities({
        '.sr-only': {
          position: 'absolute',
          width: '1px',
          height: '1px',
          padding: '0',
          overflow: 'hidden',
          clip: 'rect(0, 0, 0, 0)',
          whiteSpace: 'nowrap',
          border: '0',
        }
      })

      addComponents({
        '.form-checkbox': {
          appearance: 'none',
          display: 'inline-block',
          height: theme('spacing.4', defaultTheme.spacing[4]),
          width: theme('spacing.4', defaultTheme.spacing[4]),
          verticalAlign: 'middle',
          borderWidth: theme('borderWidth.default', defaultTheme.borderWidth.default),
          borderRadius: theme('borderRadius.default', defaultTheme.borderRadius.default),
          backgroundColor: '#fff',
          userSelect: 'none',
          'input[type=checkbox]:focus + &, input[type=checkbox]&:focus': {
            outline: 'none',
            boxShadow: theme('boxShadow.outline', defaultTheme.boxShadow.outline),
          },
          'input[type=checkbox]:focus:not(:checked) + &, input[type=checkbox]&:focus:not(:checked)': {
            borderColor: defaultTheme.colors.blue[400],
          },
          'input[type=checkbox]:checked + &, input[type=checkbox]&:checked': {
            backgroundColor: 'currentColor',
            borderColor: 'currentColor',
            backgroundImage: `url("data:image/svg+xml,%3Csvg viewBox='0 0 16 16' fill='%23fff' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M13.293 4.293a1 1 0 0 1 0 1.414L7 12a1 1 0 0 1-1.414 0L3.293 9.707a1 1 0 0 1 1.414-1.414l1.586 1.586 5.586-5.586a1 1 0 0 1 1.414 0z'/%3E%3C/svg%3E")`,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            backgroundRepeat: 'no-repeat',
          },
        },
        '.form-radio': {
          appearance: 'none',
          display: 'inline-block',
          height: theme('spacing.4', defaultTheme.spacing[4]),
          width: theme('spacing.4', defaultTheme.spacing[4]),
          verticalAlign: 'middle',
          borderWidth: theme('borderWidth.default', defaultTheme.borderWidth.default),
          borderRadius: '9999px',
          backgroundColor: '#fff',
          userSelect: 'none',
          'input[type=radio]:focus + &, input[type=radio]&:focus': {
            outline: 'none',
            boxShadow: theme('boxShadow.outline', defaultTheme.boxShadow.outline),
          },
          'input[type=radio]:focus:not(:checked) + &, input[type=radio]&:focus:not(:checked)': {
            borderColor: defaultTheme.colors.blue[400],
          },
          'input[type=radio]:checked + &, input[type=radio]&:checked': {
            backgroundColor: 'currentColor',
            borderColor: 'currentColor',
            backgroundImage: `url("data:image/svg+xml,%3Csvg viewBox='0 0 24 24' fill='%23ffffff' xmlns='http://www.w3.org/2000/svg'%3E%3Ccircle cx='12' cy='12' r='5'/%3E%3C/svg%3E")`,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            backgroundRepeat: 'no-repeat',
          },
        },
        '.form-input, .form-textarea, .form-multiselect': {
          appearance: 'none',
          backgroundColor: '#fff',
          borderWidth: theme('borderWidth.default', defaultTheme.borderWidth.default),
          borderRadius: theme('borderRadius.default', defaultTheme.borderRadius.default),
          padding: `${theme('spacing.2', defaultTheme.spacing[2])} ${theme('spacing.3', defaultTheme.spacing[3])}`,
          lineHeight: theme('lineHeight.normal', defaultTheme.lineHeight.normal),
          '&:focus': {
            outline: 'none',
            boxShadow: theme('boxShadow.outline', defaultTheme.boxShadow.outline),
            borderColor: defaultTheme.colors.blue[400],
          }
        },
        '.form-select': {
          backgroundColor: '#fff',
          borderWidth: theme('borderWidth.default', defaultTheme.borderWidth.default),
          borderRadius: theme('borderRadius.default', defaultTheme.borderRadius.default),
          paddingTop: `${theme('spacing.2', defaultTheme.spacing[2])}`,
          paddingRight: `${theme('spacing.10', defaultTheme.spacing[10])}`,
          paddingBottom: `${theme('spacing.2', defaultTheme.spacing[2])}`,
          paddingLeft: `${theme('spacing.3', defaultTheme.spacing[3])}`,
          lineHeight: theme('lineHeight.normal', defaultTheme.lineHeight.normal),
          appearance: 'none',
          backgroundImage: `url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='${theme('colors.gray.500', defaultTheme.colors.gray[500]).replace('#', '%23')}' viewBox='0 0 24 24' %3E%3Cpath d='M15.3 9.3a1 1 0 0 1 1.4 1.4l-4 4a1 1 0 0 1-1.4 0l-4-4a1 1 0 0 1 1.4-1.4l3.3 3.29 3.3-3.3z'/%3E%3C/svg%3E")`,
          backgroundPosition: `right ${theme('spacing.2', defaultTheme.spacing[2])} center`,
          backgroundRepeat: 'no-repeat',
          backgroundSize: '1.5em 1.5em',
          '&::-ms-expand': {
            display: 'none',
          },
          '&:focus': {
            outline: 'none',
            boxShadow: theme('boxShadow.outline', defaultTheme.boxShadow.outline),
            borderColor: defaultTheme.colors.blue[400],
          }
        },
      })
    }
  ]
}
