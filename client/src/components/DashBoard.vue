<template>
  <div id="dashboard">
    <h1>Logged In</h1>
    <ul>
      <li v-bind:key="shop.id" v-for="shop in shops">
        {{ shop.title }} ({{ shop.location }})
      </li>
    </ul>
    <ul>
      <li v-bind:key="stock.id" v-for="stock in stocks">
        {{ stock.symbol }} ({{ stock.data }})
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from "vue-property-decorator";
import { RepositoryFactory } from "../api/RepositoryFactory";
const ShopsRepository = RepositoryFactory.get("shops");
const StocksRepository = RepositoryFactory.get("stocks");

@Component({})
export default class DashBoard extends Vue {
  @Prop() private msg!: string;

  shops: Array<object> = [];
  stocks: Array<object> = [];

  mounted() {
    this.getShops();
    this.getStocks();
  }

  async getShops() {
    interface ResponseValue {
      data: Array<object>;
    }

    await ShopsRepository.get().then((response: ResponseValue) => {
      console.log(response);
      this.shops = response.data;
    });
  }

  async getStocks() {
    interface ResponseValue {
      data: Array<object>;
    }

    await StocksRepository.get().then((response: ResponseValue) => {
      console.log(response);
      this.stocks = response.data;
    });
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
  // display: inline-block;
  margin: 0 10px;
}
a {
  color: #4e504f;
}
</style>
