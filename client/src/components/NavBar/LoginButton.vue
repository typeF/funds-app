<template>
  <div>
    <div class="loginButton" v-on:click="login">{{ userName }}</div>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from "vue-property-decorator";
import Login from "../../api/Login";
import store from "../../store";

@Component
export default class LoginButton extends Vue {
  @Prop() private userName!: string;

  login() {
    // store.dispatch("setLoginStatus", { status: true });
    store.dispatch("login");
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.loginButton {
  background: lightgreen;
  border-radius: 3px;
  cursor: pointer;
  margin: 5px;
  padding: 5px;
}
</style>
