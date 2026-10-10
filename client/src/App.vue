<script setup lang="ts">

const res: () => Promise<Response> = async () => {
  return await fetch('/api', {
    method: 'GET',
    headers: { 'Content-Type': 'application/json' }
  })
}
const s = async () => await res().then((res) => res.json())

console.log(s())
</script>

<template>
  <h1>You did it!</h1>
</template>

<style scoped></style>
