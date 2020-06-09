<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Buat Harga</h2>
      <form @submit.prevent="createHarga">
        <div class="form-group row">
          <label for="sales" class="col-md-4 col-form-label text-md-right">Sales </label>
          <div class="col-md-6">
          <select v-model="harga.id_sales" class="form-control">
            <option value=""></option>
            <option v-for="sales in id_sales" :value="sales.id" :key="sales.id">
              {{ sales.nama_sales }}
            </option>
          </select>
          </div>
        </div>
        <div class="form-group row">
          <label for="produk" class="col-md-4 col-form-label text-md-right">Produk </label>
          <div class="col-md-6">
          <select v-model="harga.id_produk" class="form-control">
            <option value=""></option>
            <option v-for="produk in id_produk" :value="produk.id" :key="produk.id">
              {{ produk.nama_produk }}
            </option>
          </select>
          </div>
        </div>
        <div class="form-group row">
          <label for="harga-dasar" class="col-md-4 col-form-label text-md-right">Harga Dasar </label>
          <div class="col-md-6">
            <input id="harga-dasar" type="text" class="form-control" name="harga-dasar" required v-model="harga.harga_dasar">
          </div>
        </div>
        <div class="form-group row">
          <label for="harga-jual" class="col-md-4 col-form-label text-md-right">Harga Jual </label>
          <div class="col-md-6">
            <input id="harga-jual" type="text" class="form-control" name="harga-jual" v-model="harga.harga_jual">
          </div>
        </div>
        <div class="form-group row mb-0">
          <div class="col-md-8 offset-md-4">
          <button type="submit" class="btn btn-primary">
            Simpan
          </button>
          </div>
        </div>
      </form>
    </div>
  </b-col>
</template>
<script>
  export default {
    data() {
      return {
        harga: {},
        id_sales: [],
        id_produk: []
      }
    },
    created() {
      this.axios
        .get('api/id_sales')
        .then(response => (
          console.log(response.data),
          this.id_sales = response.data
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)

        this.axios
        .get('api/id_produk')
        .then(response => (
          console.log(response.data),
          this.id_produk = response.data
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)
    },
    methods: {
      createHarga() {
        this.axios
          .post('/api/harga/store', this.harga)
          .then(response => (
            this.$router.push({name: 'master-harga'}),
            console.log(response)
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)
      }
    }
  }
</script>
