module.exports = {
    lang: 'ja-JP',
    title: 'dammy - simple and useful shellscript',
    description: 'Simple and Usuful shellscript',
    base: '/dammy/',
    locales: {
        '/': {
            lang: 'en-US',
            title: 'dammy',
            description: 'Simple and Usuful shellscript',
        },
        '/ja/': {
            lang: 'ja-JP',
            title: 'dammy',
            description: 'Simple and Usuful shellscript',
        },
    },
    head: [
        ['link', { rel: 'icon', type: 'image/png', href: '/dammy/images/hero.png' }],
        ['meta', { name: 'og:url', content: 'https://ontheroadjp.github.com/dammy/' }],
        ['meta', { name: 'og:type', content: 'website' }],
        ['meta', { name: 'og:title', content: 'dammy' }],
        ['meta', { name: 'og:description', content: 'Simple and Useful Shellscript' }],
        ['meta', { name: 'og:image', content: 'https://ontheroadjp.github.io/dammy/images/main.jpg' }],
        ['meta', { name: 'twitter:card', content: 'summary_large_image' }],
        ['meta', { name: 'twitter:site', content: '@te_ontheroad_jp' }],
        ['meta', { name: 'twitter:title', content: 'dammy' }],
        ['meta', { name: 'twitter:description', content: 'Simple and Useful Shellscript' }],
        ['meta', { name: 'twitter:image', content: 'https://ontheroadjp.github.io/dammy/images/main.jpg' }],
    ],
    themeConfig: {
        logo: '/images/hero.png',
        repo: 'ontheroadjp/dammy',
        locales: {
            '/': {
                selectLanguageName: 'English',
                navbar: [
                    // NavbarItem
                    { text: 'overview', link: '/overview/', },
                    { text: 'setup', link: '/setup/', },
                    { text: 'usage', link: '/usage/', },
                ],
            },
            '/ja/': {
                selectLanguageName: '日本語',
                navbar: [
                    { text: '概要', link: '/ja/overview/', },
                    { text: 'セットアップ', link: '/ja/setup/', },
                    { text: '使い方', link: '/ja/usage/', },
                ],
            },
        },
        docsRepo: 'https://github.com/ontheroadjp/dammy',
        docsBranch: 'master',
        docsDir: 'docs',
        editLinkPattern: ':repo/edit/:branch/:path',
        lastUpdated: 'Last Updated',
    },
}
