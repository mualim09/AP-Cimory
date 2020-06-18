<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Input Pembelian</h2>
      <form @submit.prevent="createPembelian">

        <div class="form-group row">
          <label for="dc_id" class="col-md-4 col-form-label text-md-right">DC</label>
          <div class="col-md-6">
          <select v-model="pembelian.dc_id" required class="form-control">
            <option selected v-for="dc in cari_dc" :value="dc.id" :key="dc.id" v-if="dc.kode_dc == local_dc">
              {{ dc.nama_dc }}
            </option>
          </select>
          </div>
        </div>

        <div class="form-group row">
          <label for="tanggal_pembelian" class="col-md-4 col-form-label text-md-right">Tanggal</label>
          <div class="col-md-6">
            <input id="tanggal_pembelian" type="date" class="form-control" required v-model="pembelian.tanggal_pembelian">
          </div>
        </div>

        <div class="form-group row">
          <label for="no_invoice" class="col-md-4 col-form-label text-md-right">No. Invoice</label>
          <div class="col-md-6">
            <input id="no_invoice" type="text" class="form-control" v-model="pembelian.no_invoice">
          </div>
        </div>

        <div class="form-group row">
          <label for="produk_id" class="col-md-4 col-form-label text-md-right">Produk</label>
          <div class="col-md-6">
          <select v-model="pembelian.produk_id" class="form-control">
            <option value=""></option>
            <option v-for="produk in cari_produk" :value="produk.id"  :key="produk.id">
              {{ produk.nama_produk }}
            </option>
          </select>
          </div>
        </div>

        <div class="form-group row">
          <label for="qty_pembelian" class="col-md-4 col-form-label text-md-right">Qty Pembelian</label>
          <div class="col-md-6">
            <input id="qty_pembelian" type="text" class="form-control" v-model="pembelian.qty_pembelian">
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
        pembelian: {},
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
      createPembelian() {
        this.axios
          .post('/api/pembelian/store', this.pembelian)
          .then(response => (
            this.$router.push({name: 'master-pembelian'}),
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
