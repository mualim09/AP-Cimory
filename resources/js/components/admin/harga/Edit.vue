<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Edit Harga</h2>
      <form @submit.prevent="updateHarga">
        <div v-if="step === 1">
          <div class="form-group row">
            <label for="produk" class="col-md-4 col-form-label text-md-right">Produk </label>
            <div class="col-md-6">
            <select v-model="harga.id_produk" @click="selectedProduct($event)" class="form-control">
              <option value=""></option>
              <option v-for="produk in id_produk" :value="produk.id"  :key="produk.id">
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
          <b-button size="sm" variant="outline-success" @click.prevent="next">Berikutnya</b-button>
        </div>
          <div v-if="step === 2">
            <ul id="dataInput">
              <li>Nama Produk: {{ nama_p }}</li>
              <li>Harga Dasar: {{ harga.harga_dasar }}</li>
              <li>Harga Jual: {{ harga.harga_jual }}</li>
            </ul>
          <b-button size="sm" variant="outline-success" @click.prevent="prev">Sebelumnya</b-button>
          <b-button type="submit" variant="primary">Simpan</b-button>
        </div>
      </form>
    </div>
  </b-col>
</template>
<script>
  export default {
    data() {
      return {
        step: 1,
        harga: {},
        id_produk: [],
        nama_p: ''
      }
    },
    created() {
      this.axios
        .get(`/api/harga/edit/${this.$route.params.id}`)
        .then((response) => {
          this.harga = response.data
          console.log(response.data)
        })
      
        this.axios
        .get('api/id_produk')
        .then(response => (
          console.log(response.data),
          this.id_produk = response.data,
          this.nama_p = response.data.nama_produk
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)

    },
    
    methods: {
      // Ambil text dari selected item https://www.itsolutionstuff.com/post/vue-js-get-selected-option-text-exampleexample.html
      selectedProduct(event) {
        this.nama_p = event.target.options[event.target.options.selectedIndex].text
        console.log(this.nama_p)
      },
      // Memisahkan div agar menjadi multipage form https://www.raymondcamden.com/2018/01/29/a-multi-step-form-in-vuejs
      next() {
        this.step++
      },
      prev() {
        this.step--
      },
    
      // Proses update harga
      updateHarga() {
        this.axios
          .post(`/api/harga/update/${this.$route.params.id}`, this.harga)
          .then(response => (
              this.$router.push({name: 'master-harga'})
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)
      }
    }
  }
</script>
<style scoped>
  #dataInput {
    list-style: none;
  }
</style>
