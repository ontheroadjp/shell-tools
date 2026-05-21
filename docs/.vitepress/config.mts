import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'Shell Tools',
  description: 'A collection of standalone shell scripts for everyday terminal operations.',
  base: '/shell-tools/',

  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Tools', link: '/tools/colors' },
    ],

    sidebar: [
      {
        text: 'Getting Started',
        items: [
          { text: 'Overview', link: '/' },
          { text: 'Setup', link: '/setup' },
        ],
      },
      {
        text: 'Tools',
        items: [
          { text: 'colors', link: '/tools/colors' },
          { text: 'counts', link: '/tools/counts' },
          { text: 'dictionary', link: '/tools/dictionary' },
          { text: 'holiday', link: '/tools/holiday' },
          { text: 'movie-converter', link: '/tools/movie-converter' },
          { text: 'numstats', link: '/tools/numstats' },
          { text: 'quick-memo', link: '/tools/quick-memo' },
          { text: 'stock-jp', link: '/tools/stock-jp' },
          { text: 'timer', link: '/tools/timer' },
          { text: 'today', link: '/tools/today' },
          { text: 'wareki', link: '/tools/wareki' },
          { text: 'weather', link: '/tools/weather' },
          { text: 'wifi-helth-check', link: '/tools/wifi-helth-check' },
          { text: 'worldtime', link: '/tools/worldtime' },
          { text: 'yubin', link: '/tools/yubin' },
        ],
      },
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/ontheroadjp/shell-tools' },
    ],

    footer: {
      message: 'Released under the MIT License.',
    },
  },
})
