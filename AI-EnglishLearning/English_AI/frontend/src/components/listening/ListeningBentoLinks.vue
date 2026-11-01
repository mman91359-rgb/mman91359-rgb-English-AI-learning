<template>
  <div class="grid grid-cols-1 md:grid-cols-12 gap-gutter">
    <div class="col-span-1 md:col-span-6 flex flex-col gap-4">
      <router-link
        to="/favorites"
        class="bg-surface-container-lowest rounded-[24px] p-6 shadow-[0_4px_20px_rgba(51,58,72,0.05)] flex items-center justify-between cursor-pointer hover:bg-surface-container-lowest/80 transition-colors"
      >
        <div class="flex items-center gap-4">
          <div class="w-10 h-10 rounded-full bg-error-container/30 flex items-center justify-center">
            <span class="material-symbols-outlined text-error" style="font-variation-settings: 'FILL' 1;">favorite</span>
          </div>
          <span class="font-body-lg text-body-lg text-on-surface">{{ $t('listening.entryFavorites') }}</span>
        </div>
        <span class="material-symbols-outlined text-outline">chevron_right</span>
      </router-link>

      <router-link
        to="/error-book"
        class="bg-surface-container-lowest rounded-[24px] p-6 shadow-[0_4px_20px_rgba(51,58,72,0.05)] flex items-center justify-between cursor-pointer hover:bg-surface-container-lowest/80 transition-colors"
      >
        <div class="flex items-center gap-4">
          <div class="w-10 h-10 rounded-full bg-secondary-container/30 flex items-center justify-center">
            <span class="material-symbols-outlined text-secondary">build</span>
          </div>
          <span class="font-body-lg text-body-lg text-on-surface">{{ $t('listening.entryErrors') }}</span>
        </div>
        <span class="material-symbols-outlined text-outline">chevron_right</span>
      </router-link>
    </div>

    <div class="col-span-1 md:col-span-6 flex flex-col gap-4">
      <router-link
        to="/history"
        class="bg-surface-container-lowest rounded-[24px] p-6 shadow-[0_4px_20px_rgba(51,58,72,0.05)] flex items-center justify-between cursor-pointer hover:bg-surface-container-lowest/80 transition-colors"
      >
        <div class="flex items-center gap-4">
          <div class="w-10 h-10 rounded-full bg-tertiary-container/30 flex items-center justify-center">
            <span class="material-symbols-outlined text-tertiary">hourglass_bottom</span>
          </div>
          <span class="font-body-lg text-body-lg text-on-surface">{{ $t('listening.entryHistory') }}</span>
        </div>
        <span class="material-symbols-outlined text-outline">chevron_right</span>
      </router-link>

      <button
        type="button"
        class="bg-surface-container-lowest rounded-[24px] p-6 shadow-[0_4px_20px_rgba(51,58,72,0.05)] flex items-center justify-between cursor-pointer hover:bg-surface-container-lowest/80 transition-colors text-left"
        @click="showAiComingSoon"
      >
        <div class="flex items-center gap-4">
          <div class="w-10 h-10 rounded-full bg-secondary-container/30 flex items-center justify-center">
            <span class="material-symbols-outlined text-secondary">psychology</span>
          </div>
          <span class="font-body-lg text-body-lg text-on-surface">{{ $t('listening.entryAi') }}</span>
        </div>
        <span class="material-symbols-outlined text-outline">chevron_right</span>
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { useToast } from '../../composables/useToast'

const { t } = useI18n()
const { show: toast } = useToast()

const showAiComingSoon = () => toast(t('listening.entryAiComingSoon'), 'info')
</script>
