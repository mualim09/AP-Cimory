<template>
  <b-col cols lg="10" xs=12>
    <div class="mx-auto text-center">
      <h2>Menu HO</h2>
      <router-link to="/master-grafik" class="nav-item nav-link"><b-button class="btn-landing" variant="success"><b-icon icon="tag"></b-icon>Grafik</b-button></router-link>
      <router-link to="/master-harian" class="nav-item nav-link"><b-button class="btn-landing" variant="success"><b-icon icon="tag"></b-icon>Laporan Harian</b-button></router-link>
      <router-link to="/master-kompensasi" class="nav-item nav-link"><b-button class="btn-landing" variant="success"><b-icon icon="tag"></b-icon>Laporan Kompensasi</b-button></router-link>
    </div>
  </b-col>
</template>
<script>

    export default {
        components: {

        },
        data() {
            return {
                blogs: [],
                auth: false,
            }
        },
        created() {

            this.axios
                .get('/api/blogs')
                .then(response => {
                    this.blogs = response.data.blogs;
                    this.success = response.data.auth;
                });

        },
        methods: {

        }
    }

</script>
