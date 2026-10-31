<template>
  <AppLayout>
    <div class="flex items-center gap-4 mb-8">
      <button class="p-2 hover:bg-surface-variant rounded-full transition-colors" @click="$router.back()">
        <span class="material-symbols-outlined text-on-surface">arrow_back</span>
      </button>
      <h2 class="font-headline-lg text-headline-lg text-on-surface">{{ $t('app.title') }} - {{ $t('learning.myFavorites') }}</h2>
    </div>

    <div class="bg-surface-container-lowest rounded-[20px] p-5 shadow-soft-glow mb-6">
      <div class="relative">
        <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-outline">search</span>
        <input
          v-model="searchKeyword"
          class="w-full pl-12 pr-4 py-3 bg-background border border-outline-variant rounded-xl text-on-surface placeholder-outline font-body-md text-body-md focus:border-primary focus:ring-1 focus:ring-primary outline-none transition-all"
          :placeholder="$t('learning.searchFavorites')"
        />
      </div>
    </div>

    <LoadingState v-if="loading" />

    <ErrorState
      v-else-if="loadError"
      :message="loadError"
      :action-label="$t('common.retry')"
      @retry="load"
    />

    <EmptyState
      v-else-if="favorites.length === 0"
      icon="favorite_border"
      :title="$t('learning.noFavorites')"
      :description="$t('learning.noFavoritesHint')"
    />

    <EmptyState
      v-else-if="filteredFavorites.length === 0"
      icon="search_off"
      :title="$t('learning.noMatchingFavorites')"
      :description="$t('learning.tryOtherKeywords')"
    />

    <div v-else class="space-y-4">
      <div
        v-for="fav in filteredFavorites"
        :key="fav.id"
        class="bg-surface-container-lowest rounded-[20px] p-5 shadow-soft-glow flex items-start justify-between gap-4 hover:shadow-md transition-shadow"
      >
        <div class="flex items-start gap-3 flex-1 min-w-0">
          <span class="material-symbols-outlined text-error shrink-0 mt-0.5">favorite</span>
          <div class="min-w-0 flex-1">
            <p
              :class="[
                'font-body-md text-body-md break-words',
                fav.questionId && getModuleInfo(fav.sourceType)
                  ? 'text-primary hover:underline cursor-pointer'
                  : 'text-on-surface'
              ]"
              @click="handleReanswer(fav)"
            >
              {{ fav.sentenceText }}
            </p>
            <div class="flex items-center gap-2 mt-1 flex-wrap">
              <span class="font-label-sm text-label-sm text-on-surface-variant">
                {{ formatDate(fav.createdAt, locale) }}
              </span>
              <span
                v-if="fav.questionId && getModuleInfo(fav.sourceType)"
                class="px-2 py-0.5 rounded-full bg-primary-container/30 text-primary text-xs font-medium"
              >
                {{ getModuleInfo(fav.sourceType)?.name }}
              </span>
            </div>
          </div>
        </div>
        <div class="flex items-center gap-2 shrink-0">
          <button
            v-if="fav.questionId && getModuleInfo(fav.sourceType)"
            class="px-4 py-2 bg-primary text-on-primary rounded-xl font-label-sm text-label-sm hover:bg-primary/90 transition-colors flex items-center gap-1 shrink-0"
            @click="handleReanswer(fav)"
          >
            <span class="material-symbols-outlined text-base">replay</span>
            {{ $t('learning.retry') }}
          </button>
          <button
            class="p-2 hover:bg-error-container/20 rounded-full transition-colors shrink-0"
            @click="handleRemove(fav)"
          >
            <span class="material-symbols-outlined text-error">delete</span>
          </button>
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import LoadingState from '@/components/ui/LoadingState.vue'
import EmptyState from '@/components/ui/EmptyState.vue'
import ErrorState from '@/components/ui/ErrorState.vue'
import { useUserStore } from '@/stores/user'
import { moduleName, moduleTypeFromSource } from '@/config/modules'
import { formatDate } from '@/utils/format'
import { getFavorites, removeFavorite, type FavoriteVO } from '@/api/exercise'

const { t, locale } = useI18n()
const router = useRouter()
const userStore = useUserStore()
const favorites = ref<FavoriteVO[]>([])
const loading = ref(true)
const loadError = ref('')
const searchKeyword = ref('')

const getModuleInfo = (sourceType: string): { type: number; name: string } | null => {
  const type = moduleTypeFromSource(sourceType)
  if (!type) return null
  return { type, name: moduleName(type, t) }
}

const filteredFavorites = computed(() => {
  const keyword = searchKeyword.value.trim().toLowerCase()
  if (!keyword) return favorites.value
  return favorites.value.filter(fav =>
    fav.sentenceText.toLowerCase().includes(keyword)
  )
})

const load = async () => {
  const uid = userStore.userId
  if (!uid) return
  loading.value = true
  loadError.value = ''
  try {
    favorites.value = await getFavorites(uid)
  } catch (e) {
    console.warn('加载收藏列表失败', e)
    loadError.value = e instanceof Error ? e.message : '加载收藏列表失败'
  } finally {
    loading.value = false
  }
}

const handleReanswer = (fav: FavoriteVO) => {
  if (!fav.questionId) return
  const info = getModuleInfo(fav.sourceType)
  if (!info) {
    router.back()
    return
  }
  router.push({ path: '/learning/practice', query: { moduleType: info.type, count: 1 } })
}

const handleRemove = async (fav: FavoriteVO) => {
  const uid = userStore.userId
  if (!uid) return
  try {
    await removeFavorite(fav.id, uid)
    favorites.value = favorites.value.filter(f => f.id !== fav.id)
  } catch (e) {
    console.warn('删除收藏失败', e)
  }
}

onMounted(load)
</script>
