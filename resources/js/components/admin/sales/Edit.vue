<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Edit Sales</h2>
      <form @submit.prevent="updateSales">
        <div class="form-group row">
          <label for="nama_sales" class="col-md-4 col-form-label text-md-right">Nama Sales</label>
          <div class="col-md-6">
            <input id="nama_sales" type="text" class="form-control" name="nama_sales" required autofocus v-model="sales.nama_sales">
          </div>
        </div>
        <div class="form-group row">
          <label for="kode_sales" class="col-md-4 col-form-label text-md-right">Kode Sales</label>
          <div class="col-md-6">
            <input id="kode_sales" type="text" class="form-control" name="kode_sales" v-model="sales.kode_sales">
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
        sales: {},
      }
    },
    created() {
      this.axios
        .get(`/api/sales/edit/${this.$route.params.id}`)
        .then((response) => {
          this.sales = response.data;
          console.log(response.data);
        });
    },
    methods: {
      updateSales() {
        this.axios
          .post(`/api/sales/update/${this.$route.params.id}`, this.sales)
          .then(response => (
              this.$router.push({name: 'master-sales'})
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)
      }
    }
  }
</script>
