/**
 * Coin wallet page copy (split bundle).
 *
 * Not merged into locales/en-US.ts: that file carries another session's
 * in-flight changes (word books), so per the frontend UI contract §11.1 it is
 * registered but left untouched. The merge happens in i18n/index.ts instead.
 */
export default {
  wallet: {
    title: 'Coin Wallet',
    subtitle: 'Balance and coin history',
    balance: 'Current balance',
    balanceHint: 'Coins are earned only: there is no spending or redemption outlet yet',
    entry: 'View coin history',
    totalEarned: 'Total earned',
    totalSpent: 'Total spent',
    monthSpent: 'Spent this month',
    ledgerTitle: 'Coin history',
    ledgerHint: 'Grouped by day, newest first',
    emptyTitle: 'No coin records yet',
    emptyDesc: 'Check in daily or finish a word group and the first entry will show up here',
    emptyFilteredTitle: 'No records of this type',
    emptyFilteredDesc: 'Switch back to All to see other coin entries',
    filter: {
      all: 'All',
      label: 'Transaction type',
    },
    unknownBiz: 'Coin change',
    /** Titles map from bizType instead of rendering the backend's hardcoded Chinese description */
    biz: {
      CHECK_IN: 'Daily check-in',
      CHECK_IN_MILESTONE: 'Streak milestone',
      VOCAB_GROUP: 'Word group completed',
    },
    unknownDate: 'Unknown date',
    balanceAfter: 'Balance {value}',
    loadMore: 'Load more',
    noMore: 'No more records',
    loadFailed: 'Failed to load coin history',
    rules: {
      title: 'Coin rules',
      redeem: 'Coins are recorded only: the system has no deduction or redemption outlet.',
      sources: 'How to earn: daily check-in, streak milestones, and finishing a word group (amounts and daily caps are on the check-in page).',
    },
  },
}
