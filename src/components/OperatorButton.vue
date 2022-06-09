<template>
    <button @click="parse()" class="op-styles">{{operation}}</button>

</template>

<script>
    export default {
        props: {
            operation: String,
        },
        methods: {
            parse() {
                switch (this.operation) {
                    case 'C':
                        this.$emit('clear-calc')
                        break
                    case 'NEG':
                        this.$emit('negate')
                        break
                    case '%':
                        this.$emit('modulo')
                        break
                    case '/':
                        this.$emit('divide')
                        break
                    case '*':
                        this.$emit('multi')
                        break
                    case '-':
                        this.$emit('subtract')
                        break
                    case '+':
                        this.$emit('add')
                        break
                    case '=':
                        this.$emit('solve')
                        break
                    case '.':
                        this.$emit('decimal')
                    default:
                        break
                }
            },
        }
    }
</script>

<style>
    .op-styles {
        background-color: rgb(81, 81, 208);
        text-align: center;
        color: #fff;
        border: 0px;
        width: 50px;
        border-radius: 30px;
        justify-self: center;
    }

    .op-styles:hover {
        background-color: rgb(116, 116, 203);
        cursor: pointer;
    }
</style>