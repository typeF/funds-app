<template>
  <div class="home">
    <NavBar />
    <MainPage v-if="!loggedIn" msg="Welcome to the Funds App." />
    <DashBoard v-else />
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from "vue-property-decorator";
import NavBar from "@/components/NavBar/NavBar.vue";
import MainPage from "@/components/MainPage.vue";
import DashBoard from "@/components/DashBoard.vue";

@Component({
  components: {
    DashBoard,
    MainPage,
    NavBar
  }
})
export default class Home extends Vue {
  @Prop() private msg!: string;

  get loggedIn() {
    return this.$store.state.loggedIn;
  }
}
</script>

<style>
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
