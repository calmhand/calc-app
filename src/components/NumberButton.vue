<template>
    <button @click="$emit('returnVal', value)" class="num-styles">{{value}}</button>
</template>

<script>
    export default {
        props: {
            value: Number,
        },
    }
</script>

<style>
    .num-styles {
        background-color: #fff;
        text-align: center;
        color: #000;
        border: 1px solid #000
    }

    .num-styles:hover {
        background-color: rgb(210, 210, 210);
    }
</style>