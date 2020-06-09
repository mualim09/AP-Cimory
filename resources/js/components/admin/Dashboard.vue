<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
        <h2>Menu Admin</h2>
        <router-link to="/master-harga" class="nav-item nav-link"><b-button class="btn-landing" variant="success"><b-icon icon="tag"></b-icon> Master Data Harga</b-button></router-link>
        <router-link to="/master-sales" class="nav-item nav-link"><b-button class="btn-landing" variant="primary"><b-icon icon="people"></b-icon> Master Data Sales</b-button></router-link>
        <router-link to="/master-akun" class="nav-item nav-link"><b-button class="btn-landing" variant="primary"><b-icon icon="person"></b-icon> Master Data Akun/User</b-button></router-link>
        <router-link to="/master-produk" class="nav-item nav-link"><b-button class="btn-landing" variant="primary"><b-icon icon="table"></b-icon> Master Data Produk</b-button></router-link>
        <router-link to="/master-dc" class="nav-item nav-link"><b-button class="btn-landing" variant="primary"><b-icon icon="truck"></b-icon> Master Data DC</b-button></router-link>       
    </div>
  </b-col>
</template>
<script>
  
  export default {
    data() {
        return {

        }
    },
    created() {

    },
    methods: {
        
    }
  }

</script>
