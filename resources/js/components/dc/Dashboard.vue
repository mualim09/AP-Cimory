<template>
  <b-col cols lg="10" xs=12>
  <div class="login-form mx-auto text-center">
    <h2>Menu DC</h2>
    <router-link to="/create-transaksi" class="nav-item nav-link"><b-button class="btn-landing" variant="success"><b-icon icon="tag"></b-icon> Input Laporan</b-button></router-link>
    <!-- <router-link to="/edit-laporan-dc" class="nav-item nav-link"><b-button class="btn-landing" variant="primary"><b-icon icon="people"></b-icon> Master Data Sales</b-button></router-link>-->
    <router-link to="/master-laporan-dc" class="nav-item nav-link"><b-button class="btn-landing" variant="primary"><b-icon icon="person"></b-icon> Laporan DC</b-button></router-link>       
  </div>
  </b-col>
</template>
<script>
  
export default {
  components: {
    
  },
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
