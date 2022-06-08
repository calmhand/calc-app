<template>
  <div id="app">
    <h2 id="title">Calmhand's Calculator</h2>
    <Calculator />
  </div>
</template>

<script>
import Calculator from './components/Calculator'

export default {
  name: 'App',
  components: {
    Calculator
  }
}
</script>

<style>
  #app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    margin-top: 60px;
  }

  html {
    background-color: #000;
  }

  #title {
    text-align: center;
    color: beige;
  }
</style>
