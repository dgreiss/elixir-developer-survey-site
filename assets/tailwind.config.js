const colors = require('tailwindcss/colors')

module.exports = {
  purge: {
    enabled: process.env.NODE_ENV === "production",
    content: [
      "../lib/**/*.eex",
      "../lib/**/*.leex",
      "../lib/**/*_view.ex"
    ],
    options: {
      whitelist: [/phx/, /nprogress/]
    }
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        "blue-gray": colors.blueGray,
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
