import { defineConfig } from 'vitepress'

const toolsSidebarJa = [
  {
    text: 'ツール',
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
]

const toolsSidebarEn = [
  {
    text: 'Tools',
    items: [
      { text: 'colors', link: '/en/tools/colors' },
      { text: 'counts', link: '/en/tools/counts' },
      { text: 'dictionary', link: '/en/tools/dictionary' },
      { text: 'holiday', link: '/en/tools/holiday' },
      { text: 'movie-converter', link: '/en/tools/movie-converter' },
      { text: 'numstats', link: '/en/tools/numstats' },
      { text: 'quick-memo', link: '/en/tools/quick-memo' },
      { text: 'stock-jp', link: '/en/tools/stock-jp' },
      { text: 'timer', link: '/en/tools/timer' },
      { text: 'today', link: '/en/tools/today' },
      { text: 'wareki', link: '/en/tools/wareki' },
      { text: 'weather', link: '/en/tools/weather' },
      { text: 'wifi-helth-check', link: '/en/tools/wifi-helth-check' },
      { text: 'worldtime', link: '/en/tools/worldtime' },
      { text: 'yubin', link: '/en/tools/yubin' },
    ],
  },
]

const toolsSidebarZh = [
  {
    text: '工具',
    items: [
      { text: 'colors', link: '/zh/tools/colors' },
      { text: 'counts', link: '/zh/tools/counts' },
      { text: 'dictionary', link: '/zh/tools/dictionary' },
      { text: 'holiday', link: '/zh/tools/holiday' },
      { text: 'movie-converter', link: '/zh/tools/movie-converter' },
      { text: 'numstats', link: '/zh/tools/numstats' },
      { text: 'quick-memo', link: '/zh/tools/quick-memo' },
      { text: 'stock-jp', link: '/zh/tools/stock-jp' },
      { text: 'timer', link: '/zh/tools/timer' },
      { text: 'today', link: '/zh/tools/today' },
      { text: 'wareki', link: '/zh/tools/wareki' },
      { text: 'weather', link: '/zh/tools/weather' },
      { text: 'wifi-helth-check', link: '/zh/tools/wifi-helth-check' },
      { text: 'worldtime', link: '/zh/tools/worldtime' },
      { text: 'yubin', link: '/zh/tools/yubin' },
    ],
  },
]

export default defineConfig({
  title: 'Shell Tools',
  description: 'A collection of standalone shell scripts for everyday terminal operations.',
  base: '/shell-tools/',

  locales: {
    root: {
      label: '日本語',
      lang: 'ja',
      themeConfig: {
        nav: [
          { text: 'ホーム', link: '/' },
          { text: 'セットアップ', link: '/setup' },
          { text: 'ツール', link: '/tools/colors' },
        ],
        sidebar: [
          {
            text: 'はじめに',
            items: [
              { text: '概要', link: '/' },
              { text: 'セットアップ', link: '/setup' },
            ],
          },
          ...toolsSidebarJa,
        ],
      },
    },
    en: {
      label: 'English',
      lang: 'en',
      themeConfig: {
        nav: [
          { text: 'Home', link: '/en/' },
          { text: 'Setup', link: '/en/setup' },
          { text: 'Tools', link: '/en/tools/colors' },
        ],
        sidebar: [
          {
            text: 'Getting Started',
            items: [
              { text: 'Overview', link: '/en/' },
              { text: 'Setup', link: '/en/setup' },
            ],
          },
          ...toolsSidebarEn,
        ],
      },
    },
    zh: {
      label: '中文',
      lang: 'zh',
      themeConfig: {
        nav: [
          { text: '首页', link: '/zh/' },
          { text: '安装', link: '/zh/setup' },
          { text: '工具', link: '/zh/tools/colors' },
        ],
        sidebar: [
          {
            text: '快速入门',
            items: [
              { text: '概述', link: '/zh/' },
              { text: '安装', link: '/zh/setup' },
            ],
          },
          ...toolsSidebarZh,
        ],
      },
    },
  },

  themeConfig: {
    socialLinks: [
      { icon: 'github', link: 'https://github.com/ontheroadjp/shell-tools' },
    ],
    footer: {
      message: 'Released under the MIT License.',
    },
  },
})
