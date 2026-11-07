import './assets/main.css'
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import router from './router'
import i18n from './i18n'
import { useAppStore } from './stores/app'

/**
 * 说明：Element Plus 依赖按契约仅保留在 package.json，不注册、不引入其样式。
 * 全站 UI 统一为 Tailwind + M3 自研组件；页面禁止使用 el-* 组件。
 */
const app = createApp(App)
const pinia = createPinia()

app.use(pinia)
app.use(router)
app.use(i18n)

// 初始化主题（避免闪烁）
useAppStore().init()

app.mount('#app')
