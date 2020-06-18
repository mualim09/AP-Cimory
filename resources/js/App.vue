<template>
  <div>
    <b-container class="container-utama">
      <b-row class="justify-content-md-center p-2">
        <b-nav>
          <div class="xtombol-menu" v-if="$store.state.role">
            Selamat datang <strong>{{ $store.state.username }} - {{ $store.state.dc }}</strong>
            <b-button size="sm" variant="primary" @click="menuUtama">Menu Utama</b-button>
          </div>
          <div class="xtombol-logout" v-if="$store.state.username">
            <b-button size="sm" variant="danger" @click="logout">Logout</b-button>
          </div>
        </b-nav>
      </b-row>
      <b-row align-v="center" class="justify-content-md-center row-utama h-100">
        <fade-transition origin="center" mode="out-in" :duration="250">
            <router-view>
            </router-view>
        </fade-transition>
      </b-row>
    </b-container>
  </div>
</template>

<script>
  import {FadeTransition} from 'vue2-transitions'
  export default {
    components: {
      FadeTransition
    },
    data() {
      return {
        auth:false
      }
    },
    beforeCreate () {
      if (localStorage.getItem('token') == null && this.$route.name !== 'home' && this.$route.name !== 'login' && this.$route.name !== 'register') {
       // if (this.$route.name !== 'home' || this.$route.name != 'login') {
          this.$router.push({name: 'login'})
       // }
      }
    },
    methods: {
      logout(){
        const formData = new FormData();
        //formData.append('name', this.name);
        this.axios
          .post('/api/logout', formData)
          .then(response => (
          this.auth = false,
          this.$store.dispatch('hapusState'),
          this.$router.push({name: 'home'})
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)

      },
      menuUtama () {
        this.$router.push({name: `${localStorage.getItem('role')}-dashboard`})
      }
    }
  }
</script>
<style>
  .tombol-menu {
    position: absolute;
    top: 20px;
    right: 130px;
  }
  .tombol-logout {
    position: absolute;
    top: 80px;
    right: 130px;
  }
  /* .container-utama {
    min-height: 70vh !important;
  } */
  .row-utama{
    padding: 10px;
    background:#c9c7c72f;
    min-height: 70vh !important;
  }

  @media screen and (max-width: 480px) {
    .tombol-menu {
      position: fixed;
      top: 5px;
      right: 5px;
    }
  .tombol-logout {
      position: fixed;
      top: 40px;
      right: 5px;
    }
  }
</style>
