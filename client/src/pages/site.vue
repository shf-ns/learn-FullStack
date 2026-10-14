<script lang="ts" setup>
import { onMounted, ref } from 'vue'

const repos = ref<any[]>([])

const fetchSitesData = async (): Promise<void> => {
    try {
        const response: Response = await fetch('/api/sites', {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' }
        })
        const result: any = await response.json()

        repos.value = result.data
    } catch (error) {
        console.error('请求失败:', error)
    }
}

onMounted((): void => {
    fetchSitesData()
})
</script>

<template>
    <ul class="site-list">
        <li class="item" v-for="(repo, index) in repos" :key="index">
            <a :href="repo.url" target="_blank">
                <div class="img">
                    <img :src="repo.icon" alt="">
                </div>
                <div class="info">
                    <h3 class="title">
                        {{ repo.name }}
                    </h3>
                    <div class="desc">
                        {{ repo.description }}
                    </div>
                </div>
            </a>
        </li>
    </ul>
</template>

<style scoped>
.site-list {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    justify-items: center;
    gap: 20px;
    padding: 0 20px;
    margin-top: 50px;
}

.item {
    width: 80%;
    height: 150px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.item a {
    display: flex;
    justify-content: space-around;
    align-items: center;
    gap: 20px;
    width: 100%;
    height: 100%;
    padding: 15px;
}

.item .img {
    width: 40px;
    height: 40px;
}

.item .img img {
    width: 100%;
    height: 100%;
}

.item .info {
    flex: 2;
}

.item .info .desc {
    color: #666;
}
</style>
