<template>
  <div id="main-page">
    <h1>{{ msg }}</h1>
    <h3>Please LOGIN to continue.</h3>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from "vue-property-decorator";

@Component
export default class MainPage extends Vue {
  @Prop() private msg!: string;

  get loggedIn() {
    return this.$store.state.loggedIn;
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #4e504f;
}
</style>
