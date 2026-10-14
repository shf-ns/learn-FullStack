<script lang="ts" setup></script>

<template>
    <div class="home">
        <div class="title-container">
            <h1 class="title"> linkHub</h1>
            <p class="description">高效使用工具，触手可及</p>
        </div>
        <div class="description">
            <p> LinkHub 是一个专注于提升开发效率的工具集合平台。</p>
            <p>在这里，你可以快速找到前后端开发、文档查阅、工具推荐等资源，</p>
            <p>让开发变得更加简单和高效。</p>
        </div>
    </div>
</template>

<style scoped>
.home {
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    width: 100%;
    height: 100%;
    margin: 0 auto;
}

.title-container,
.description {
    display: flex;
    flex-direction: column;
    align-items: center;
}


.title-container .title {
    font-size: 40px;
    color: #354e96;
}

.title-container .description {
    font-size: small;
    color: #666;
}
</style>
