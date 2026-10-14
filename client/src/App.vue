<script setup lang="ts">
import { onMounted } from 'vue'
import { RouterLink, RouterView, useRoute, type RouteLocationNormalizedLoadedGeneric } from 'vue-router'


const route: RouteLocationNormalizedLoadedGeneric = useRoute()

const fetchDocumentsData = async (): Promise<void> => {
  try {
    const response: Response = await fetch('/api/documents', {
      method: 'GET',
      headers: { 'Content-Type': 'application/json' }
    })
    const data: any[] = await response.json()
    console.log('接收到的数据:', data)
  } catch (error) {
    console.error('请求失败:', error)
  }
}
const fetchSitesData = async (): Promise<void> => {
  try {
    const response: Response = await fetch('/api/sites', {
      method: 'GET',
      headers: { 'Content-Type': 'application/json' }
    })
    const data: any = await response.json()
    console.log('接收到的数据:', data)
  } catch (error) {
    console.error('请求失败:', error)
  }
}
onMounted((): void => {
  fetchDocumentsData()
  fetchSitesData()
})
</script>

<template>
  <div class="header">
    <RouterLink to="/" :class="{ active: route.path === '/' }">首页</RouterLink>
    <RouterLink to="/document" :class="{ active: route.path === '/document' }">官方文档</RouterLink>
    <RouterLink to="/site" :class="{ active: route.path === '/site' }">博客站点</RouterLink>
  </div>
  <div class="content" style="flex: 1;">
    <RouterView></RouterView>
  </div>
  <div class="footer">
    <span>Copyright © 2026 shf-ns 版权所有</span>
  </div>
</template>

<style scoped>
.header {
  display: flex;
  align-items: center;
  gap: 40px;
  width: 100%;
  height: 70px;
  padding-left: 30px;
  background-color: #f3f4f7;
}

.header a {
  display: inline-block;
  height: 100%;
  line-height: 70px;
}

.active {
  color: #007bff;
  border-bottom: 3px solid #007bff;
}

.footer {
  width: 100%;
  height: 70px;
  color: #ccc;
  text-align: center;
}

@media (max-width: 768px) {
  .header {
    gap: 20px;
    height: 60px;
    padding-left: 20px;
  }

  .header a {
    line-height: 60px;
  }
}
</style>
