<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Tambah Sales</h2>
      <form @submit.prevent="createSales">
        <div class="form-group row">
          <label for="produk" class="col-md-4 col-form-label text-md-right">DC </label>
          <div class="col-md-6">
          <select v-model="kode_dc" @change="selectedDC($event)" class="form-control">
            <option value="0" selected>Pilih</option>
            <option v-for="dc in id_dc" :value="dc.kode_dc"  :key="dc.id">
              {{ dc.kode_dc }} {{ dc.nama_dc }}
            </option>
          </select>
          </div>
        </div>
        <div class="form-group row">
          <label for="kode_sales" class="col-md-4 col-form-label text-md-right">Kode Sales (otomatis)</label>
          <div class="col-md-6">
            <input id="kode_sales" type="text" class="form-control" name="kode_sales" v-model="kodeSalesBaru">
          </div>
        </div>
        <div class="form-group row">
          <label for="nama_sales" class="col-md-4 col-form-label text-md-right">Nama Sales</label>
          <div class="col-md-6">
            <input id="nama_sales" type="text" class="form-control" name="nama_sales" required autofocus v-model="sales.nama_sales">
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
        kode_dc: null,
        kodeSalesBaru: null,
        sales: {},
        id_dc: {}
      }
    },
    created() {
      this.axios
        .get('/api/id_dc')
        .then(response => (
          this.id_dc = response.data,
          console.log(response)
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)
    },
    methods: {
      createSales() {
        const formData = new FormData();
        formData.append('kode_sales', this.kodeSalesBaru)
        formData.append('nama_sales', this.sales.nama_sales)
        this.axios
          .post('/api/sales/store', formData)
          .then(response => (
            this.$router.push({name: 'master-sales'}),
            console.log(response)
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)
      },
      selectedDC (event) {
        return this.axios
        .get('/api/buat_kode_sales', { params: { dc_terpilih : this.kode_dc } })
        .then(response => (
          this.kodeSalesBaru = response.data,
          console.log(response)
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)
      }
    }
  }
</script>
