<template>
  <router-link
    to="/profile"
    class="group inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full bg-tertiary-container/20 text-tertiary border border-tertiary/10 transition-all duration-300 hover:-translate-y-0.5 hover:bg-tertiary-container/30 hover:shadow-sm active:scale-95"
    :aria-label="$t('coin.balance')"
    :title="$t('coin.balance')"
  >
    <span
      class="material-symbols-outlined text-xl transition-transform duration-300 group-hover:scale-110"
      :class="{ 'coin-bump': bumping }"
    >paid</span>
    <span class="font-label-md text-label-md font-bold tabular-nums">
      {{ userStore.coinLoaded ? formattedBalance : '—' }}
    </span>
  </router-link>
</template>

<script setup lang="ts">
import { computed, onUnmounted, ref, watch } from 'vue'
import { useUserStore } from '@/stores/user'

const userStore = useUserStore()
const bumping = ref(false)
let bumpTimer: number | null = null

const formattedBalance = computed(() => (userStore.coinBalance ?? 0).toLocaleString('zh-CN'))

watch(() => userStore.coinBalance, (next, previous) => {
  if (next > previous) {
    bumping.value = true
    if (bumpTimer !== null) window.clearTimeout(bumpTimer)
    bumpTimer = window.setTimeout(() => { bumping.value = false }, 500)
  }
})

onUnmounted(() => {
  if (bumpTimer !== null) window.clearTimeout(bumpTimer)
})
</script>
