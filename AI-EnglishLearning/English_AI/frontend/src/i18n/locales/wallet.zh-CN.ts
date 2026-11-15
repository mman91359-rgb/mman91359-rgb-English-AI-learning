/**
 * 金币钱包页文案（分包）
 *
 * 不并入 locales/zh-CN.ts：该文件此刻有并行会话的在途改动（词书功能），
 * 按前端 UI 契约 §11.1「脏文件只登记、不动」处理；改为在干净的 i18n/index.ts
 * 里用已有的 deepMerge 合并。
 */
export default {
  wallet: {
    title: '金币钱包',
    subtitle: '余额与金币明细',
    balance: '当前余额',
    balanceHint: '金币只增不减：系统目前没有扣减与兑换出口',
    entry: '查看金币明细',
    totalEarned: '累计获得',
    totalSpent: '累计消耗',
    monthSpent: '本月消耗',
    ledgerTitle: '金币流水',
    ledgerHint: '按天分组，最新在前',
    emptyTitle: '还没有金币记录',
    emptyDesc: '完成每日签到或背完一组单词后，这里会出现第一笔流水',
    emptyFilteredTitle: '该类型暂无记录',
    emptyFilteredDesc: '切换回「全部」可查看其他类型的金币流水',
    filter: {
      all: '全部',
      label: '流水类型',
    },
    unknownBiz: '金币变动',
    /** 流水标题走业务类型映射，不直出后端中文 description（英文界面会冒中文） */
    biz: {
      CHECK_IN: '每日签到',
      CHECK_IN_MILESTONE: '连续签到里程碑',
      VOCAB_GROUP: '完成一组单词',
    },
    unknownDate: '日期未知',
    balanceAfter: '余额 {value}',
    loadMore: '加载更多',
    noMore: '已经到底了',
    loadFailed: '金币流水加载失败',
    rules: {
      title: '金币规则',
      redeem: '金币目前只记录、不消耗：系统没有扣减或兑换出口。',
      sources: '获得方式：每日签到、连续签到里程碑、完成一组单词（奖励值与每日上限见签到页）。',
    },
  },
}
