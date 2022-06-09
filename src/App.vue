<template>
  <div id="app">
    <Header />
    <Calculator />
    <Footer />
  </div>
</template>

<script>
import Calculator from './components/Calculator'
import Header from './components/Header'
import Footer from './components/Footer'

export default {
  name: 'App',
  components: {
    Header,
    Calculator,
    Footer
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
</style>
