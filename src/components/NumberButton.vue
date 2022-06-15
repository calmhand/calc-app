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
        opacity: 80%;
        border: 0px;
        width: 50px;
        border-radius: 30px;
        justify-self: center;
        
    }

    .num-styles:hover {
        background-color: rgb(210, 210, 210);
        cursor: pointer;
    }

    /* 0 button */
    button:nth-of-type(17) {
        grid-column-start: 1;
        grid-column-end: 3;
        width: 142px;
    }
</style>