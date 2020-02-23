import Repository from "./Repository";

const resource = "shops";

export default {
  get() {
    return Repository.get(`${resource}`);
  },

  getShop(shopId: string) {
    return Repository.get(`${resource}/${shopId}`);
  }
};
