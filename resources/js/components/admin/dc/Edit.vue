<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Edit DC</h2>
      <form @submit.prevent="updateDC">
        <div class="form-group row">
          <label for="kode_dc" class="col-md-4 col-form-label text-md-right">Kode DC</label>
          <div class="col-md-6">
            <input id="kode_dc" type="text" class="form-control" name="kode_dc" required autofocus v-model="dc.kode_dc">
          </div>
        </div>
        <div class="form-group row">
          <label for="nama_dc" class="col-md-4 col-form-label text-md-right">Nama DC/Kota</label>
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
      this.axios
        .get(`/api/dc/edit/${this.$route.params.id}`)
        .then((response) => {
          this.dc = response.data;
          console.log(response.data);
        });
    },
    methods: {
      updateDC() {
        this.axios
          .post(`/api/dc/update/${this.$route.params.id}`, this.dc)
          .then(response => (
              this.$router.push({name: 'master-dc'})
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)
      }
    }
  }
</script>
