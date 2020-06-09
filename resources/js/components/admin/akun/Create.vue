<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Tambah User/Akun</h2>
      <form @submit.prevent="register">
        <div class="form-group row">
          <label for="name" class="col-md-4 col-form-label text-md-right">Name</label>
          <div class="col-md-6">
          <input id="name" type="text" class="form-control" name="name" required autofocus v-model="user.name">
          </div>
        </div>
        <div class="form-group row">
          <label for="username" class="col-md-4 col-form-label text-md-right">Username</label>
          <div class="col-md-6">
          <input id="username" type="text" class="form-control" name="username" required v-model="user.username">
          </div>
        </div>
        <div class="form-group row">
          <label for="email" class="col-md-4 col-form-label text-md-right">E-Mail</label>
          <div class="col-md-6">
          <input id="email" type="text" class="form-control" name="email" required v-model="user.email">
          </div>
        </div>
        <div class="form-group row">
          <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
          <div class="col-md-6">
          <input id="password" type="password" class="form-control" name="password" required v-model="user.password">
          </div>
        </div>
        <div class="form-group row">
          <label for="password-confirm" class="col-md-4 col-form-label text-md-right">Confirm Password</label>
          <div class="col-md-6">
          <input id="password-confirm" type="password" class="form-control" name="password-confirm" required v-model="user.password_confirmation">
          </div>
        </div>
        <div class="form-group row">
          <label for="DC" class="col-md-4 col-form-label text-md-right">Posisi</label>
          <div class="col-md-6">
          <select v-model="user.dc_id" class="form-control">
            <option value="ho">HO</option>
            <option value="admin">Admin</option>
            <option v-for="dc in kode_dc" :value="dc.id" :key="dc.id">
              {{ dc.kode_dc }} - {{ dc.nama_dc }}
            </option>
          </select>
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
        user: {},
        auth: null,
        kode_dc: []
      }
    },

    created () {
      this.axios
        .get('api/kode_dc')
        .then(response => (
          console.log(response.data),
          this.kode_dc = response.data
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)
    },

    methods: {
      register() {
        const formData = new FormData();
        formData.append('name', this.user.name);
        formData.append('username', this.user.username);
        formData.append('email', this.user.email);
        formData.append('password', this.user.password);
        formData.append('password_confirmation', this.user.password_confirmation);
        formData.append('dc_id', this.user.dc_id);
        this.axios
          .post('api/register', formData)
          .then(response => (
            console.log(response.data),
            this.$router.push({name: 'master-akun'})
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)
      }
    }
  }
</script>