<template>
  <b-col cols lg="10" xs=12>
  <div class="mx-auto text-center">
    <h2>Menu DC</h2>
    <router-link to="/create-pembelian" class="nav-item nav-link"><b-button class="btn-landing" variant="success"><b-icon icon="tag"></b-icon>Pembelian</b-button></router-link>
    <router-link to="/create-penjualan" class="nav-item nav-link"><b-button class="btn-landing" variant="success"><b-icon icon="tag"></b-icon>Penjualan</b-button></router-link>
    <router-link to="/create-retur" class="nav-item nav-link"><b-button class="btn-landing" variant="success"><b-icon icon="tag"></b-icon>Retur</b-button></router-link>
    <router-link to="/master-pembelian" class="nav-item nav-link"><b-button class="btn-landing" variant="primary"><b-icon icon="person"></b-icon>Laporan Pembelian</b-button></router-link>
    <router-link to="/master-penjualan" class="nav-item nav-link"><b-button class="btn-landing" variant="primary"><b-icon icon="person"></b-icon>Laporan Penjualan</b-button></router-link>
    <router-link to="/master-retur" class="nav-item nav-link"><b-button class="btn-landing" variant="primary"><b-icon icon="person"></b-icon>Laporan Retur</b-button></router-link>
    <router-link to="/master-stok" class="nav-item nav-link"><b-button class="btn-landing" variant="warning"><b-icon icon="person"></b-icon>Laporan Stok</b-button></router-link>
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
