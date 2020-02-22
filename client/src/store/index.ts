import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    loggedIn: false
  },
  mutations: {
    SET_LOGIN_STATUS(state, payload) {
      state.loggedIn = payload.status;
    }
  },
  actions: {
    setLoginStatus({ commit }, payload) {
      commit("SET_LOGIN_STATUS", payload);
    }
  },
  modules: {}
});
