<script setup lang="ts">
import { ref, type Ref } from 'vue';


const s: Ref<string> = ref<string>('')
const res: () => Promise<Response> = async () => {
  return await fetch('/api', {
    method: 'GET',
    headers: { 'Content-Type': 'application/json' }
  })
}
s.value = await res().then((res) => res.json())

console.log(s.value)
</script>

<template>
  <h1>You did it!</h1>
  <p>
    Visit <a href="https://vuejs.org/" target="_blank" rel="noopener">vuejs.org</a> to read the
    documentation
  </p>
</template>

<style scoped></style>
