<template>
    <div>
        
    <div class="recent-items-title">
        <h2>Halaman Dashboard DC</h2>
    </div>
        <h3>Data Status disini</h3>
    </div>
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
