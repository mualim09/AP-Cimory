<template>
  <b-col cols lg="3" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Selamat datang di aplikasi cimory</h2>
      <router-link to="/login" class="nav-item nav-link"><b-button class="btn-landing" block type="submit" variant="primary"><b-icon icon="box-arrow-in-right"></b-icon> Klik disini untuk masuk</b-button></router-link>
    </div>
  </b-col>
</template>
<script>

export default {
  data() {
    return {
      trip: {},
      category: [],
      
    }
  },
  created() {
    this.axios
      .get('/api/blogs')
      .then(response => {
        this.trip = response.data.blogs
      })

    this.axios
      .get('/api/blog/category/all')
      .then(response => {
        this.category = response.data.category
      })
  },
  updated() {
    
  },
  methods: {
    findTrip(category) {
      
      this.axios
      .get(`/api/blog/category/${category}`)
      .then(response => {
        this.trip = response.data.findBlog,console.log(this.trip);
      });
    }
  }
}
</script>
<style scoped>
  /*#video-home {
     margin-top: -150px; 
  }*/

 

</style>