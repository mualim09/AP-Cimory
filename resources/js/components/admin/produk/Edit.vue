<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Edit Produk</h2>
      <form @submit.prevent="updateProduk">
        <div class="form-group row">
          <label for="kode_produk" class="col-md-4 col-form-label text-md-right">Keterangan</label>
          <div class="col-md-6">
            <input id="kode_produk" type="text" class="form-control" name="kode_produk" v-model="produk.kode_produk">
          </div>
        </div>
        <div class="form-group row">
          <label for="nama_produk" class="col-md-4 col-form-label text-md-right">Nama Produk</label>
          <div class="col-md-6">
            <input id="nama_produk" type="text" class="form-control" name="nama_produk" required autofocus v-model="produk.nama_produk">
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
        produk: {},
      }
    },
    created() {
      this.axios
        .get(`/api/produk/edit/${this.$route.params.id}`)
        .then((response) => {
          this.produk = response.data;
          console.log(response.data);
        });
    },
    methods: {
      updateProduk() {
        this.axios
          .post(`/api/produk/update/${this.$route.params.id}`, this.produk)
          .then(response => (
              this.$router.push({name: 'master-produk'})
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)
      }
    }
  }
</script>
