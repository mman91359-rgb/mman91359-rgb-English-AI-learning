<template>
  <div class="min-h-screen bg-background text-on-background flex items-center justify-center px-6">
    <div class="bg-surface-container-lowest rounded-[24px] p-8 shadow-soft-glow border border-outline-variant/20 max-w-md text-center">
      <span class="material-symbols-outlined text-5xl text-error">block</span>
      <h1 class="font-headline-md text-headline-md text-on-surface mt-4">{{ $t('admin.noPermission') }}</h1>
      <p class="font-body-md text-body-md text-on-surface-variant mt-2">{{ $t('admin.noPermissionDesc') }}</p>
      <RouterLink to="/dashboard" class="inline-flex mt-6 px-5 py-2.5 rounded-full bg-primary text-on-primary font-label-lg text-label-lg">
        {{ $t('admin.backToLearning') }}
      </RouterLink>
    </div>
  </div>
</template>

<script setup lang="ts">
import { RouterLink } from 'vue-router'
</script>
