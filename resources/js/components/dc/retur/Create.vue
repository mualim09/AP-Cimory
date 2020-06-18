<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Input Retur</h2>
      <form @submit.prevent="createRetur">

        <div class="form-group row">
          <label for="dc_id" class="col-md-4 col-form-label text-md-right">DC</label>
          <div class="col-md-6">
          <select v-model="retur.dc_id" required class="form-control">
            <option selected v-for="dc in cari_dc" :value="dc.id" :key="dc.id" v-if="dc.kode_dc == local_dc">
              {{ dc.nama_dc }}
            </option>
          </select>
          </div>
        </div>

        <div class="form-group row">
          <label for="tanggal_sjr" class="col-md-4 col-form-label text-md-right">Tanggal SJR</label>
          <div class="col-md-6">
            <input id="tanggal_sjr" type="date" class="form-control" required v-model="retur.tanggal_sjr">
          </div>
        </div>

        <div class="form-group row">
          <label for="kode_sjr" class="col-md-4 col-form-label text-md-right">Kode SJR</label>
          <div class="col-md-6">
            <input id="kode_sjr" type="text" class="form-control" v-model="retur.kode_sjr">
          </div>
        </div>

        <div class="form-group row">
          <label for="produk_id" class="col-md-4 col-form-label text-md-right">Produk</label>
          <div class="col-md-6">
          <select v-model="retur.produk_id" class="form-control">
            <option value=""></option>
            <option v-for="data_produk in cari_produk" :value="data_produk.produk.id" :key="data_produk.produk.id">
              {{ data_produk.produk.nama_produk }}
            </option>
          </select>
          </div>
        </div>

        <div class="form-group row">
          <label for="qty_retur" class="col-md-4 col-form-label text-md-right">Qty Retur</label>
          <div class="col-md-6">
            <input id="qty_retur" type="text" class="form-control" v-model="retur.qty_retur">
          </div>
        </div>

        <b-button type="submit" variant="primary">Simpan</b-button>

      </form>
    </div>
  </b-col>
</template>
<script>
  export default {
    data() {
      return {
        retur: {},
        cari_dc: [],
        cari_produk: [],
        local_dc: localStorage.getItem('dc')
      }
    },
    created() {
      // Cari DC
      this.axios
        .get('api/cari_dc')
        .then(response => (
          console.log(response.data),
          this.cari_dc = response.data
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)
      // Cari produk
      this.axios
        .get('api/cari_produk')
        .then(response => (
          console.log(response.data),
          this.cari_produk = response.data
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)
    },
    methods: {
      createRetur() {
        this.axios
          .post('/api/retur/store', this.retur)
          .then(response => (
            this.$router.push({name: 'master-retur'}),
            console.log(response)
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)
      }
    }
  }
</script>
<style scoped>

</style>
