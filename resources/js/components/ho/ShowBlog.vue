<template>
    
    <div class="container"><h1>{{ blog[0].tags }}</h1><h2>{{ hasil_token }}</h2>
        <div class="row">
            <div class="col-lg-10 mx-auto" v-for="dataBlog in blog" :key="dataBlog.id">
                <h2 id="title">{{ dataBlog.title }}</h2>
                <img :src="dataBlog.featured" class="img-fluid"  style="max-width:950px">
                <h3 id="category">{{ dataBlog.category }}</h3>
                <p id="content"><span v-html="dataBlog.content"></span></p>
            </div>
        </div>
    </div>

</template>
<script>
    export default {
        data() {
            return {
                blog: {},
                testitle: 'abc',
                hasil_token:''
            }
        },


        created() {
            this.axios
                .get(`/api/blog/show/${this.$route.params.slug}`)
                .then(response => {
                    this.blog = response.data.blog,
                    this.hasil_token = response.data.data_token
                });
            
        },

        // metaInfo () {
        //     return {
        //     title: this.blog.title,
        //     meta: [
        //         { name: 'description', content: `${this.blog.meta} konten apa aja meta nya`},
        //         { property: 'og:description', content: `${this.blog.meta} konten og desc`},
        //     ]
        //     }
        // },
        metaInfo () {
            return {
                title: this.testitle,
                meta: [
                { charset: 'utf-8' },
                { name: 'viewport', content: 'width=device-width, initial-scale=1' },
                { name: 'csrf-token', content: 'testoken' }
                ]
                }
            }
    }
    
</script>

<style scoped>
    #title {
        font-family: fantasy;
        font-size: 60px;
        font-weight: 500;
        display: block;
    }

    #category {
        font-family: fantasy;
        font-size: 25px;
	    font-weight: 500;
        line-height: 1.3em;
        display: block;
    }
</style>