import { defineConfig } from 'vitepress'

const toolsSidebarEn = [
  {
    text: 'System',
    items: [
      { text: 'battery', link: '/tools/battery' },
      { text: 'colors', link: '/tools/colors' },
      { text: 'get-ssid', link: '/tools/get-ssid' },
      { text: 'get-volume', link: '/tools/get-volume' },
      { text: 'ssid', link: '/tools/ssid' },
    ],
  },
  {
    text: 'System Utilities',
    items: [
      { text: 'bench_command', link: '/tools/bench_command' },
      { text: 'bench_function', link: '/tools/bench_function' },
      { text: 'bench_net', link: '/tools/bench_net' },
      { text: 'bench_zsh', link: '/tools/bench_zsh' },
      { text: 'counts', link: '/tools/counts' },
      { text: 'fix_filename', link: '/tools/fix_filename' },
      { text: 'numstats', link: '/tools/numstats' },
      { text: 'wifi-helth-check', link: '/tools/wifi-helth-check' },
    ],
  },
  {
    text: 'Utilities',
    items: [
      { text: 'deepl-translater', link: '/tools/deepl-translater' },
      { text: 'text_converter', link: '/tools/text_converter' },
    ],
  },
  {
    text: 'Mini Apps',
    items: [
      { text: 'dictionary', link: '/tools/dictionary' },
      { text: 'holiday', link: '/tools/holiday' },
      { text: 'quick-memo', link: '/tools/quick-memo' },
      { text: 'stock-jp', link: '/tools/stock-jp' },
      { text: 'timer', link: '/tools/timer' },
      { text: 'today', link: '/tools/today' },
      { text: 'wareki', link: '/tools/wareki' },
      { text: 'weather', link: '/tools/weather' },
      { text: 'worldtime', link: '/tools/worldtime' },
      { text: 'yubin', link: '/tools/yubin' },
    ],
  },
  {
    text: 'Multimedia',
    items: [
      { text: 'movie-converter', link: '/tools/movie-converter' },
    ],
  },
  {
    text: 'Network',
    items: [
      { text: 'extract_links', link: '/tools/extract_links' },
      { text: 'list_downloader', link: '/tools/list_downloader' },
    ],
  },
]

const toolsSidebarJa = [
  {
    text: 'システム',
    items: [
      { text: 'battery', link: '/ja/tools/battery' },
      { text: 'colors', link: '/ja/tools/colors' },
      { text: 'get-ssid', link: '/ja/tools/get-ssid' },
      { text: 'get-volume', link: '/ja/tools/get-volume' },
      { text: 'ssid', link: '/ja/tools/ssid' },
    ],
  },
  {
    text: 'システムユーティリティ',
    items: [
      { text: 'bench_command', link: '/ja/tools/bench_command' },
      { text: 'bench_function', link: '/ja/tools/bench_function' },
      { text: 'bench_net', link: '/ja/tools/bench_net' },
      { text: 'bench_zsh', link: '/ja/tools/bench_zsh' },
      { text: 'counts', link: '/ja/tools/counts' },
      { text: 'fix_filename', link: '/ja/tools/fix_filename' },
      { text: 'numstats', link: '/ja/tools/numstats' },
      { text: 'wifi-helth-check', link: '/ja/tools/wifi-helth-check' },
    ],
  },
  {
    text: 'ユーティリティ',
    items: [
      { text: 'deepl-translater', link: '/ja/tools/deepl-translater' },
      { text: 'text_converter', link: '/ja/tools/text_converter' },
    ],
  },
  {
    text: 'ミニアプリ',
    items: [
      { text: 'dictionary', link: '/ja/tools/dictionary' },
      { text: 'holiday', link: '/ja/tools/holiday' },
      { text: 'quick-memo', link: '/ja/tools/quick-memo' },
      { text: 'stock-jp', link: '/ja/tools/stock-jp' },
      { text: 'timer', link: '/ja/tools/timer' },
      { text: 'today', link: '/ja/tools/today' },
      { text: 'wareki', link: '/ja/tools/wareki' },
      { text: 'weather', link: '/ja/tools/weather' },
      { text: 'worldtime', link: '/ja/tools/worldtime' },
      { text: 'yubin', link: '/ja/tools/yubin' },
    ],
  },
  {
    text: 'マルチメディア',
    items: [
      { text: 'movie-converter', link: '/ja/tools/movie-converter' },
    ],
  },
  {
    text: 'ネットワーク',
    items: [
      { text: 'extract_links', link: '/ja/tools/extract_links' },
      { text: 'list_downloader', link: '/ja/tools/list_downloader' },
    ],
  },
]

const toolsSidebarZh = [
  {
    text: '系统',
    items: [
      { text: 'battery', link: '/zh/tools/battery' },
      { text: 'colors', link: '/zh/tools/colors' },
      { text: 'get-ssid', link: '/zh/tools/get-ssid' },
      { text: 'get-volume', link: '/zh/tools/get-volume' },
      { text: 'ssid', link: '/zh/tools/ssid' },
    ],
  },
  {
    text: '系统工具',
    items: [
      { text: 'bench_command', link: '/zh/tools/bench_command' },
      { text: 'bench_function', link: '/zh/tools/bench_function' },
      { text: 'bench_net', link: '/zh/tools/bench_net' },
      { text: 'bench_zsh', link: '/zh/tools/bench_zsh' },
      { text: 'counts', link: '/zh/tools/counts' },
      { text: 'fix_filename', link: '/zh/tools/fix_filename' },
      { text: 'numstats', link: '/zh/tools/numstats' },
      { text: 'wifi-helth-check', link: '/zh/tools/wifi-helth-check' },
    ],
  },
  {
    text: '工具',
    items: [
      { text: 'deepl-translater', link: '/zh/tools/deepl-translater' },
      { text: 'text_converter', link: '/zh/tools/text_converter' },
    ],
  },
  {
    text: '迷你应用',
    items: [
      { text: 'dictionary', link: '/zh/tools/dictionary' },
      { text: 'holiday', link: '/zh/tools/holiday' },
      { text: 'quick-memo', link: '/zh/tools/quick-memo' },
      { text: 'stock-jp', link: '/zh/tools/stock-jp' },
      { text: 'timer', link: '/zh/tools/timer' },
      { text: 'today', link: '/zh/tools/today' },
      { text: 'wareki', link: '/zh/tools/wareki' },
      { text: 'weather', link: '/zh/tools/weather' },
      { text: 'worldtime', link: '/zh/tools/worldtime' },
      { text: 'yubin', link: '/zh/tools/yubin' },
    ],
  },
  {
    text: '多媒体',
    items: [
      { text: 'movie-converter', link: '/zh/tools/movie-converter' },
    ],
  },
  {
    text: '网络',
    items: [
      { text: 'extract_links', link: '/zh/tools/extract_links' },
      { text: 'list_downloader', link: '/zh/tools/list_downloader' },
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
