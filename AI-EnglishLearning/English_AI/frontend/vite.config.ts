import { fileURLToPath, URL } from 'node:url'

import { defineConfig, type Plugin } from 'vite'
import vue from '@vitejs/plugin-vue'

/**
 * 本地 dev 可能跑在 5176/5180 等端口，而网关 CORS 默认只放行 5173。
 * 浏览器到 Vite 是同源请求；在进入代理前把 Origin 统一改成允许值，
 * 避免非 5173 端口登录被网关 403。
 */
function devProxyOrigin(): Plugin {
  return {
    name: 'dev-proxy-origin',
    configureServer(server) {
      server.middlewares.use((req, _res, next) => {
        if (req.url?.startsWith('/api')) {
          req.headers.origin = 'http://localhost:5173'
        }
        next()
      })
    },
  }
}

export default defineConfig({
  plugins: [
    vue(),
    devProxyOrigin(),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
    },
  },
  server: {
    port: 5173,
    proxy: {
      '/api': {
        target: 'http://localhost:8086',
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, ''),
      },
    },
  },
})
