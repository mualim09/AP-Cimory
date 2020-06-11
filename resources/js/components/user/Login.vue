<template>
  <div class="container">
    <div class="row">
      <div class="col-lg-10 mx-auto">
        <div class="" >
          <form @submit.prevent="login">
            <div class="form-group row">
              <label for="username" class="col-md-4 col-form-label text-md-right">Username</label>
              <div class="col-md-6">
              <input id="username" type="text" class="form-control @error('username') is-invalid @enderror" name="username" required autofocus v-model="user.username">
                <span class="invalid-feedback" role="alert">
                <strong></strong>
                </span>
              </div>
            </div>

            <div class="form-group row">
              <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
              <div class="col-md-6">
              <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required v-model="user.password">
                <span class="invalid-feedback" role="alert">
                <strong></strong>
                </span>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-md-6 offset-md-4">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" name="remember" id="remember" >
                <label class="form-check-label" for="remember">
                Remember Me
                </label>
              </div>
              </div>
            </div>

            <div class="form-group row mb-0">
              <div class="col-md-8 offset-md-4">
              <button type="submit" class="btn btn-primary">
                Login
              </button>
              </div>
            </div>
          </form>
          <p v-if="errorLogin" class="text-danger">{{ errorLogin }}</p>
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
    errorLogin: null,
    }
  },
  methods: {
    login() {
    const formData = new FormData();
    formData.append('username', this.user.username);
    formData.append('password', this.user.password);
    this.axios
      .post('api/login', formData)
      .then(response => (
      this.$store.dispatch('simpanState', {
        username: response.data.username,
        role: response.data.role,
        token: response.data.token
      }),
      this.$router.push({name: `${response.data.role}-dashboard`}),
      console.log(response.data)
      ))
      .catch(error => (
        this.errorLogin = error.response.data,
        console.log(this.errorLogin)
      ))
      .finally(() => this.loading = false);
    },
    logout(){
    const formData = new FormData();
    //formData.append('name', this.name);
    this.axios
      .post('api/logout', formData)
      .then(response => (
        this.$store.dispatch('hapusState'),
        this.$router.push({name: 'login'}),
        this.auth = false
      ))
      .catch(error => (console.log(error))
      )
      .finally(() => this.loading = false)
    }
  },
  }
</script>