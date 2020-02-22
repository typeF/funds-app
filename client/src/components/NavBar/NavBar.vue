<template>
  <nav id="navbar">
    <div id="navbar-left">
      <router-link to="/" tag="h1">Funds App</router-link>
    </div>
    <div id="navbar-right">
      <div id="nav">
        <router-link to="/about">About</router-link>
        <a>Login</a>
      </div>
      <!-- <div id="login-buttons">
        <LoginButton userName="John Smith" />
        <LoginButton userName="Jane Doe" />
      </div>-->
    </div>
  </nav>
</template>

<script lang="ts">
import { Component, Prop, Vue } from "vue-property-decorator";
import LoginButton from "@/components/NavBar/LoginButton.vue";

@Component({
  components: {
    LoginButton
  }
})
export default class NavBar extends Vue {
  @Prop() private userName!: string;
}
</script>

<style scoped lang="scss">
#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;
    text-decoration: none;
    margin-right: 15px;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
#navbar {
  align-items: center;
  display: flex;
  justify-content: space-between;
  padding: 0 40px 0 40px;
}

#navbar-right {
  align-items: center;
  display: flex;
}

#login-buttons {
  display: flex;
}
</style>
