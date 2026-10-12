<script setup lang="ts">
import { onMounted } from 'vue'

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
  <div class="header">
    <div>首页</div>
    <div>官方文档</div>
    <div>博客站点</div>
  </div>
</template>

<style scoped>
.header {
  display: flex;
  align-items: center;
  gap: 20px;
  width: 100%;
  height: 80px;
  padding-left: 30px;
  font-size: large;
  background-color: #dddfe2;
}
</style>
