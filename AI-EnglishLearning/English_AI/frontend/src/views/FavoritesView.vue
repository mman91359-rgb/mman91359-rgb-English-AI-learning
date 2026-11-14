<template>
  <AppLayout>
    <PageHeader :title="$t('app.title') + ' - ' + $t('learning.myFavorites')" back />

    <div class="bg-surface-container-lowest rounded-2xl p-6 shadow-soft-glow mb-6">
      <div class="relative">
        <AppIcon name="search" size="lg" class="pointer-events-none absolute left-4 top-1/2 -translate-y-1/2 text-outline" />
        <input
          v-model="searchKeyword"
          :class="[inputClassOnCard, 'pl-12']"
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
        class="bg-surface-container-lowest rounded-2xl p-4 shadow-soft-glow flex items-start justify-between gap-4"
      >
        <div class="flex items-start gap-3 flex-1 min-w-0">
          <AppIcon name="favorite" size="lg" filled tone="error" class="shrink-0 mt-0.5" />
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
              <Tag
                v-if="fav.questionId && getModuleInfo(fav.sourceType)"
                tone="primary"
                size="sm"
              >
                {{ getModuleInfo(fav.sourceType)?.name }}
              </Tag>
            </div>
          </div>
        </div>
        <div class="flex items-center gap-2 shrink-0">
          <button
            v-if="fav.questionId && getModuleInfo(fav.sourceType)"
            :class="btnPrimarySm"
            @click="handleReanswer(fav)"
          >
            <AppIcon name="replay" size="sm" />
            {{ $t('learning.retry') }}
          </button>
          <button
            :class="btnIconDanger"
            @click="handleRemove(fav)"
          >
            <AppIcon name="delete" size="lg" tone="error" />
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
import AppIcon from '@/components/ui/AppIcon.vue'
import PageHeader from '@/components/ui/PageHeader.vue'
import Tag from '@/components/ui/Tag.vue'
import LoadingState from '@/components/ui/LoadingState.vue'
import EmptyState from '@/components/ui/EmptyState.vue'
import ErrorState from '@/components/ui/ErrorState.vue'
import { useUserStore } from '@/stores/user'
import { moduleName, moduleTypeFromSource } from '@/config/modules'
import { formatDate } from '@/utils/format'
import { getFavorites, removeFavorite, type FavoriteVO } from '@/api/exercise'
import { btnIconDanger, btnPrimarySm } from '@/components/ui/buttonStyles'
import { inputClassOnCard } from '@/components/ui/formStyles'

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
