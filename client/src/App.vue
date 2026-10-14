<script setup lang="ts">
import { onMounted } from 'vue'
import { RouterLink, RouterView, useRoute } from 'vue-router'

const route = useRoute()

const fetchDocumentsData = async () => {
  try {
    const response = await fetch('/api/documents', {
      method: 'GET',
      headers: { 'Content-Type': 'application/json' }
    })
    const data = await response.json()
    console.log('接收到的数据:', data)
  } catch (error) {
    console.error('请求失败:', error)
  }
}
const fetchSitesData = async () => {
  try {
    const response = await fetch('/api/sites', {
      method: 'GET',
      headers: { 'Content-Type': 'application/json' }
    })
    const data = await response.json()
    console.log('接收到的数据:', data)
  } catch (error) {
    console.error('请求失败:', error)
  }
}
onMounted(() => {
  fetchDocumentsData()
  fetchSitesData()
})
</script>

<template>
  <div class="main">
    <div class="header">
      <RouterLink to="/" :class="{ active: route.path === '/' }">首页</RouterLink>
      <RouterLink to="/document" :class="{ active: route.path === '/document' }">官方文档</RouterLink>
      <RouterLink to="/site" :class="{ active: route.path === '/site' }">博客站点</RouterLink>
    </div>
    <div class="content">
      <RouterView></RouterView>
    </div>
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
