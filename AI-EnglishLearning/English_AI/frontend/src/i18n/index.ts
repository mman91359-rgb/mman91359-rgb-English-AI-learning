import { createI18n } from 'vue-i18n'
import zhCN from './locales/zh-CN'
import enUS from './locales/en-US'
import walletZhCN from './locales/wallet.zh-CN'
import walletEnUS from './locales/wallet.en-US'
import { deepMerge } from './nest'

export type SupportedLocale = 'zh-CN' | 'en-US'

/**
 * 钱包页文案走独立分包（wallet.zh-CN / wallet.en-US），在这里合并进主语言包。
 *
 * 为什么不直接写进 locales/zh-CN.ts：那两个文件此刻有并行会话的在途改动
 * （词书功能 wordBook.*），按前端 UI 契约 §11.1「脏文件只登记、不动」，
 * 改它们会把本次改动混进对方的 git diff。分包 + 本文件合并等于零接触。
 * deepMerge 是同目录 nest.ts 已有实现，admin-console / writing 两个分包在用同一套。
 */
const messages = {
  'zh-CN': deepMerge(zhCN, walletZhCN) as typeof zhCN,
  'en-US': deepMerge(enUS, walletEnUS) as typeof enUS,
}

const i18n = createI18n({
  legacy: false,
  locale: (localStorage.getItem('language') as SupportedLocale) || 'zh-CN',
  fallbackLocale: 'zh-CN',
  messages,
})

export default i18n
