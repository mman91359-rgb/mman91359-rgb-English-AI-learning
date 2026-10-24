import './assets/main.css'
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import router from './router'
import i18n from './i18n'
import { useAppStore } from './stores/app'
// 新增：引入 Element Plus 及图标库
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

const app = createApp(App)
const pinia = createPinia()

app.use(pinia)
app.use(router)
app.use(i18n)
// 新增：注册 Element Plus 组件库
app.use(ElementPlus)

// 新增：遍历注册全部 Element Plus 图标
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}

// 初始化主题（避免闪烁）
useAppStore().init()

app.mount('#app')