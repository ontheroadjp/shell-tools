import { defineConfig } from 'vitepress'

const toolsSidebarEn = [
  {
    text: 'Tools',
    items: [
      { text: 'bench_command', link: '/tools/bench_command' },
      { text: 'bench_function', link: '/tools/bench_function' },
      { text: 'bench_net', link: '/tools/bench_net' },
      { text: 'bench_zsh', link: '/tools/bench_zsh' },
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

const toolsSidebarJa = [
  {
    text: 'ツール',
    items: [
      { text: 'bench_command', link: '/ja/tools/bench_command' },
      { text: 'bench_function', link: '/ja/tools/bench_function' },
      { text: 'bench_net', link: '/ja/tools/bench_net' },
      { text: 'bench_zsh', link: '/ja/tools/bench_zsh' },
      { text: 'colors', link: '/ja/tools/colors' },
      { text: 'counts', link: '/ja/tools/counts' },
      { text: 'dictionary', link: '/ja/tools/dictionary' },
      { text: 'holiday', link: '/ja/tools/holiday' },
      { text: 'movie-converter', link: '/ja/tools/movie-converter' },
      { text: 'numstats', link: '/ja/tools/numstats' },
      { text: 'quick-memo', link: '/ja/tools/quick-memo' },
      { text: 'stock-jp', link: '/ja/tools/stock-jp' },
      { text: 'timer', link: '/ja/tools/timer' },
      { text: 'today', link: '/ja/tools/today' },
      { text: 'wareki', link: '/ja/tools/wareki' },
      { text: 'weather', link: '/ja/tools/weather' },
      { text: 'wifi-helth-check', link: '/ja/tools/wifi-helth-check' },
      { text: 'worldtime', link: '/ja/tools/worldtime' },
      { text: 'yubin', link: '/ja/tools/yubin' },
    ],
  },
]

const toolsSidebarZh = [
  {
    text: '工具',
    items: [
      { text: 'bench_command', link: '/zh/tools/bench_command' },
      { text: 'bench_function', link: '/zh/tools/bench_function' },
      { text: 'bench_net', link: '/zh/tools/bench_net' },
      { text: 'bench_zsh', link: '/zh/tools/bench_zsh' },
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
  cleanUrls: true,

  locales: {
    root: {
      label: 'English',
      lang: 'en',
      themeConfig: {
        nav: [
          { text: 'Home', link: '/' },
          { text: 'Setup', link: '/setup' },
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
          ...toolsSidebarEn,
        ],
      },
    },
    ja: {
      label: '日本語',
      lang: 'ja',
      themeConfig: {
        nav: [
          { text: 'ホーム', link: '/ja/' },
          { text: 'セットアップ', link: '/ja/setup' },
          { text: 'ツール', link: '/ja/tools/colors' },
        ],
        sidebar: [
          {
            text: 'はじめに',
            items: [
              { text: '概要', link: '/ja/' },
              { text: 'セットアップ', link: '/ja/setup' },
            ],
          },
          ...toolsSidebarJa,
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
