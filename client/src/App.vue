<script setup lang="ts">
import { onMounted } from 'vue'
import { RouterLink, RouterView } from 'vue-router'

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
      <RouterLink to="/">首页</RouterLink>
      <RouterLink to="/document">官方文档</RouterLink>
      <RouterLink to="/site">博客站点</RouterLink>
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
  gap: 30px;
  width: 100%;
  height: 80px;
  padding-left: 30px;
  font-size: large;
  background-color: #f3f4f7;
}
</style>
