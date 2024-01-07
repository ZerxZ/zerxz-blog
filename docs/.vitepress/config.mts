import { defineConfig } from 'vitepress'

// 导入主题的配置
import { blogTheme } from './blog-theme'

// Vitepress 默认配置
// 详见文档：https://vitepress.dev/reference/site-config
export default defineConfig({
  // 继承博客主题(@sugarat/theme)
  markdown: {
    container: {
      tipLabel: '提示',
      warningLabel: '警告',
      dangerLabel: '危险',
      infoLabel: '信息',
      detailsLabel: '详细信息'
    },
    lineNumbers: true,
    toc: { level: [1, 2] },
  },
  extends: blogTheme,
  lang: 'zh-cn',
  title: '深渊の鸽子',
  description: '学习Godot和Dotnet的博客',
  lastUpdated: true,
  // 详见：https://vitepress.dev/reference/site-config#head
  head: [
    // 配置网站的图标（显示在浏览器的 tab 上）
    ['link', { rel: 'icon', href: '/favicon.ico' }]
  ],
  
  themeConfig: {
    lastUpdatedText: '上次更新于',
    logo: '/icon.png',
    // editLink: {
    //   pattern:
    //     'https://github.com/ATQQ/sugar-blog/tree/master/packages/blogpress/:path',
    //   text: '去 GitHub 上编辑内容'
    // },
    nav: [
      { text: '首页', link: '/' },
      { text: 'Godot学习', link: '/godot/' },
     // { text: 'Dotnet学习', link: '/dotnet/' },
      { text: '关于博客主题', link: 'https://github.com/ATQQ/sugar-blog' },
    ],
    socialLinks: [
      {
        icon: 'github',
        link: 'https://github.com/ZerxZ'
      }
    ]
  }
})
