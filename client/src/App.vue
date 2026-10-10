<script setup lang="ts">
import { onMounted } from 'vue'

const fetchData = async () => {
  try {
    const response = await fetch('/api', {
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
  fetchData()
})
</script>

<template>
  <h1>You did it!</h1>
</template>

<style scoped></style>
