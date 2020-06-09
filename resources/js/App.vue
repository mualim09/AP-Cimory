<template>
  <div>
    <b-container class="container-utama">
      <b-row align-v="center" class="justify-content-md-center row-utama h-100">
        <div class="tombol-menu" v-if="$store.state.role">
          <b-button size="sm" variant="outline-success" @click="menuUtama">Menu Utama</b-button>
        </div>
        <div class="tombol-logout" v-if="$store.state.username">
          <b-button size="sm" variant="outline-danger" @click="logout">Logout</b-button>
        </div>
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
    methods: {
      logout(){
        const formData = new FormData();
        //formData.append('name', this.name);
        this.axios
          .post('http://cimory.local/api/logout', formData)
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
    position: fixed;
    top: 20px;
    right: 150px;
  }
  .tombol-logout {
    position: fixed;
    top: 80px;
    right: 150px;
  }
  /* .container-utama {
    min-height: 70vh !important;
  } */
  .row-utama{
    padding: 10px;
    background:#c9c7c72f;
    min-height: 70vh !important;
  }
</style>