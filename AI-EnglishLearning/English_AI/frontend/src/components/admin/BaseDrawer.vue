<template>
  <Teleport to="body">
    <Transition name="drawer-fade">
      <div v-if="open" class="fixed inset-0 z-[120] flex justify-end">
        <div class="absolute inset-0 bg-scrim/40 backdrop-blur-sm" aria-hidden="true" @click="onBackdrop" />
        <aside
          ref="panelRef"
          role="dialog"
          aria-modal="true"
          :aria-labelledby="titleId"
          tabindex="-1"
          class="relative flex h-dvh w-full max-w-xl flex-col bg-surface-container-lowest shadow-soft-glow focus:outline-none"
        >
          <header class="flex items-center justify-between gap-4 border-b border-outline-variant/40 px-6 py-4">
            <h2 :id="titleId" class="font-headline-sm text-headline-sm text-on-surface">{{ title }}</h2>
            <button
              type="button"
              :class="btnIconSm"
              :disabled="closeDisabled"
              :aria-label="$t('common.close')"
              @click="close"
            >
              <span class="material-symbols-outlined text-icon-md" aria-hidden="true">close</span>
            </button>
          </header>
          <div class="flex-1 overflow-y-auto px-6 py-6">
            <slot />
          </div>
          <footer v-if="$slots.footer" class="flex items-center justify-end gap-3 border-t border-outline-variant/40 px-6 py-4">
            <slot name="footer" />
          </footer>
        </aside>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup lang="ts">
import { ref, useId } from 'vue'
import { useModalBehavior } from '@/composables/useModalBehavior'
import { btnIconSm } from '@/components/ui/buttonStyles'

const props = withDefaults(defineProps<{
  open: boolean
  title: string
  closeDisabled?: boolean
}>(), {
  closeDisabled: false,
})

const emit = defineEmits<{ close: [] }>()

const panelRef = ref<HTMLElement | null>(null)
const titleId = `drawer-title-${useId()}`

const close = () => {
  if (!props.closeDisabled) emit('close')
}

const onBackdrop = () => close()

useModalBehavior({
  isOpen: () => props.open,
  container: panelRef,
  onEscape: close,
})
</script>

<style scoped>
.drawer-fade-enter-active,
.drawer-fade-leave-active {
  transition: opacity 0.25s ease;
}
.drawer-fade-enter-from,
.drawer-fade-leave-to {
  opacity: 0;
}
.drawer-fade-enter-active aside,
.drawer-fade-leave-active aside {
  transition: transform 0.25s ease;
}
.drawer-fade-enter-from aside,
.drawer-fade-leave-to aside {
  transform: translateX(100%);
}

@media (prefers-reduced-motion: reduce) {
  .drawer-fade-enter-active,
  .drawer-fade-leave-active,
  .drawer-fade-enter-active aside,
  .drawer-fade-leave-active aside {
    transition: none;
  }
}
</style>
