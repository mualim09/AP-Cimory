import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
export const store = new Vuex.Store({
  state: {
    username: localStorage.getItem('username') || null,
    role: localStorage.getItem('role') || null,
    token: localStorage.getItem('token') || null
  },
  mutations: {
    setUsername (state, username) {
      state.username = username
    },
    destroyUsername (state) {
      state.username = null
    },
    setRole (state, role) {
      state.role = role
    },
    destroyRole (state) {
      state.role = null
    },
    setToken (state, token) {
      state.token = token
    },
    destroyToken (state) {
      state.token = null
    }
  },
  actions: {
    simpanState(context, payload) {
      let username = payload.username
      let role = payload.role
      let token = payload.token
      localStorage.setItem('username', username)
      localStorage.setItem('role', role)
      localStorage.setItem('token', token)
      context.commit('setUsername', username)
      context.commit('setRole', role)
      context.commit('setToken', token)
    },
    
    hapusState (context) {
      localStorage.removeItem('username')
      localStorage.removeItem('role')
      localStorage.removeItem('token')
      context.commit('destroyUsername')
      context.commit('destroyRole')
      context.commit('destroyToken')
    }
  },
  getters: {
  }
})
