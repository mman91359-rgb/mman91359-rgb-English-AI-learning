<template>
  <Teleport to="body">
    <Transition name="coin-burst">
      <div
        v-if="visible"
        class="fixed inset-0 z-[200] pointer-events-none flex items-center justify-center"
      >
        <div class="relative flex flex-col items-center">
          <div class="coin-reward-text flex items-center gap-2 text-tertiary">
            <AppIcon name="paid" size="2xl" filled />
            <span class="font-headline-md text-headline-md font-bold">+{{ amount }}</span>
          </div>
          <span
            v-for="i in 8"
            :key="i"
            class="coin-particle"
            :class="`coin-particle-${i}`"
          >
            <AppIcon name="paid" size="md" filled />
          </span>
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup lang="ts">
import AppIcon from './ui/AppIcon.vue'

defineProps<{
  visible: boolean
  amount: number
}>()
</script>
