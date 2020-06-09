<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Tambah DC</h2>
      <form @submit.prevent="createDC">
        <div class="form-group row">
          <label for="kode_dc" class="col-md-4 col-form-label text-md-right">Kode DC</label>
          <div class="col-md-6">
            <input id="kode_dc" type="text" class="form-control" name="kode_dc" required autofocus v-model="dc.kode_dc">
          </div>
        </div>
        <div class="form-group row">
          <label for="nama_dc" class="col-md-4 col-form-label text-md-right">Nama/Kota DC</label>
          <div class="col-md-6">
            <input id="nama_dc" type="text" class="form-control" name="nama_dc" v-model="dc.nama_dc">
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
        dc: {},
      }
    },
    created() {

    },
    methods: {
      createDC() {
        this.axios
          .post('/api/dc/store', this.dc)
          .then(response => (
            this.$router.push({name: 'master-dc'}),
            console.log(response)
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)
      }
    }
  }
</script>
