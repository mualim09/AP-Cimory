<template>
  <div class="container">
    <div class="row">
      <div class="col-lg-10 mx-auto">
      <div class="" v-if="!auth">
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

          <div class="form-group row mb-0">
            <div class="col-md-8 offset-md-4">
            <button type="submit" class="btn btn-primary">
              Registrasi
            </button>
            </div>
          </div>
        </form>
      </div>
      <div  v-if="auth">
        <form id="logout-form" @submit.prevent="logout" style="">
        <button type="submit" class="btn btn-sm btn-primary">
          Logout
        </button>
        </form>
      </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        user: {},
        auth: null,
      }
    },
    methods: {
      register() {
        const formData = new FormData();
        formData.append('name', this.user.name);
        formData.append('username', this.user.username);
        formData.append('email', this.user.email);
        formData.append('password', this.user.password);
        formData.append('password_confirmation', this.user.password_confirmation);
        this.axios
          .post('api/register', formData)
          .then(response => (
            console.log(response.data),
            this.$router.push({name: 'login'})
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)
      }
    }
  }
</script>