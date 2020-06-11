require('./bootstrap');

window.Vue = require('vue');

import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router'
import {routes} from './routes'
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
import VueAxios from 'vue-axios'
import axios from 'axios'
import {ServerTable, ClientTable, Event} from 'vue-tables-2'
import { store } from './store'

Vue.use(ClientTable, {}, false, 'bootstrap4')
Vue.use(VueRouter)
Vue.use(VueAxios, axios)
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)

// Set default baseURL untuk axios dengan mix variable env https://laravel.com/docs/5.6/mix#environment-variables
// Set default header Authorization untuk setiap request axios, dimana laravel_token telah disimpan di vuex state/localStorage
axios.defaults.baseURL = (process.env.VUE_APP_BASE_URL !== undefined) ? process.env.VUE_APP_BASE_URL : 'http://cimory.ahmadbagwi.id/'
// Intercept header setiap akan request, jika tidak token hanya aktif ketika refresh laman
axios.interceptors.request.use(
  (config) => {
    let token = store.state.token
    if (token) {
      config.headers['Authorization'] = `Bearer ${ token }`
    }
    return config;
  }, 
  (error) => {
    return Promise.reject(error)
  }
  )

  // Error form global
Vue.prototype.$errorForm = null

const router = new VueRouter({
  mode: 'history',
  routes: routes
})

const app = new Vue({
  el: '#app',
  store,
  router: router,
  render: h => h(App),
});

