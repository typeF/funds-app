import Vue from "vue";
import Vuex from "vuex";
import Login from "../api/Login";

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
    },
    login({ commit }) {
      Login.then(response => {
        const token = response.data.auth_token;
        localStorage.setItem("token", token);
        commit("SET_LOGIN_STATUS", { status: true });
      }).catch(error => {
        console.log(error.response);
        commit("SET_LOGIN_STATUS", { status: false });
      });
    }
  },
  modules: {}
});
