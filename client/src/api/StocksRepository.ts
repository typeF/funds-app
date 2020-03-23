import Repository from "./Repository";

const resource = "stocks";

export default {
  get() {
    return Repository.get(`${resource}`);
  },

  getShop(symbol: string) {
    return Repository.get(`${resource}/${symbol}`);
  }
};
