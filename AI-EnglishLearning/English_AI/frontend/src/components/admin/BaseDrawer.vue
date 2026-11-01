<template>
  <Teleport to="body">
    <Transition name="drawer-fade">
      <div v-if="open" class="fixed inset-0 z-[120] flex justify-end">
        <div class="absolute inset-0 bg-on-background/40 backdrop-blur-sm" aria-hidden="true" @click="onBackdrop" />
        <aside
          role="dialog"
          aria-modal="true"
          :aria-label="title"
          class="relative flex h-full w-full max-w-xl flex-col bg-surface-container-lowest shadow-soft-glow"
        >
          <header class="flex items-center justify-between gap-4 border-b border-outline-variant/40 px-6 py-4">
            <h2 class="font-headline-sm text-headline-sm text-on-surface">{{ title }}</h2>
            <button
              type="button"
              class="flex h-8 w-8 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-surface-container-high disabled:opacity-50"
              :disabled="closeDisabled"
              :aria-label="$t('adminConsole.common.close')"
              @click="close"
            >
              <span class="material-symbols-outlined text-icon-md">close</span>
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
import { onBeforeUnmount, watch } from 'vue'

const props = withDefaults(defineProps<{
  open: boolean
  title: string
  closeDisabled?: boolean
}>(), {
  closeDisabled: false,
})

const emit = defineEmits<{ close: [] }>()

let previousOverflow = ''
let listening = false

const close = () => {
  if (!props.closeDisabled) emit('close')
}

const onBackdrop = () => close()

const onKeydown = (event: KeyboardEvent) => {
  if (event.key === 'Escape') close()
}

const start = () => {
  if (listening) return
  previousOverflow = document.body.style.overflow
  document.body.style.overflow = 'hidden'
  window.addEventListener('keydown', onKeydown)
  listening = true
}

const stop = () => {
  if (!listening) return
  document.body.style.overflow = previousOverflow
  window.removeEventListener('keydown', onKeydown)
  listening = false
}

watch(
  () => props.open,
  (open) => (open ? start() : stop()),
  { immediate: true },
)

onBeforeUnmount(stop)
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
</style>
