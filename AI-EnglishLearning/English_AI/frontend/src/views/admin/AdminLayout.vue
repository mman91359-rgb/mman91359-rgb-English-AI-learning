<template>
  <div class="min-h-screen bg-background text-on-background flex">
    <AdminSidebar :collapsed="collapsed" @toggle="collapsed = !collapsed" />
    <div class="flex-1 min-w-0 transition-all duration-200" :class="collapsed ? 'md:ml-[72px]' : 'md:ml-[240px]'">
      <AdminTopbar />
      <main class="w-full max-w-[1440px] mx-auto px-4 md:px-8 py-6 pb-16">
        <RouterView />
      </main>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { RouterView } from 'vue-router'
import AdminSidebar from '../../components/admin/AdminSidebar.vue'
import AdminTopbar from '../../components/admin/AdminTopbar.vue'

const collapsed = ref(false)
</script>
