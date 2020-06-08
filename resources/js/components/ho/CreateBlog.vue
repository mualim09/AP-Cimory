<template>
    <div class="container">
        <div class="row">
            <div class="col-lg-10 mx-auto">
                <div class="recent-items-title">
                    <h2>Buat Blog</h2>
                </div>
                <form @submit.prevent="createBlog">
                    <div class="col-lg-6">
                    <div class="form-group">
                        <label>Judul</label>
                        <input type="text" class="form-control" v-model="blog.title">
                    </div>
                    <div class="form-group">
                        <label>Meta</label>
                        <input type="text" class="form-control" v-model="blog.meta" value="blog.title">
                    </div>
                    <div class="form-group">
                        <label>Slug</label>
                        <input type="text" class="form-control" v-model="blog.slug">
                    </div>
                    <div class="form-group">
                        <label>Kategori</label>
                        <input type="text" class="form-control" v-model="blog.category">
                    </div>
                    
                    <div class="form-group">
                        <label>Tags</label>
                        <input type="text" class="form-control" v-model="blog.tags">
                    </div>
                    <div class="form-group">
                        <label>Featured</label>
                        <div class="input-group">
                            <span class="input-group-btn">
                                <a id="lfm" data-input="featured" data-preview="holder" class="btn btn-info" @click="openFileManager">
                                <i class="fa fa-picture-o"></i> Choose
                                </a>
                            </span>
                            <input id="featured" class="form-control" type="text" v-model="blog.featured">
                            </div>
                            <img id="holder" class="mt-3" :src="blog.featured">
                        </div>
                    </div>
                    <div class="col-lg-10">
                    <div class="form-group">
                        <label>Konten</label>
                        <!-- <ckeditor v-model="blog.content" :config="editorConfig"></ckeditor> -->
                        <textarea id="content" name="content" class="form-control" v-model="blog.content"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
    //import CKEditor from 'ckeditor4-vue';

    export default {
        components: {
            //ckeditor: CKEditor.component
        },
        data() {
            return {
                blog: {},
                // editorData: '',
                // editorConfig: {
                    
                // }
            }
            
        },
        beforeCreate() {
            let addLfm = document.createElement('script');
            addLfm.setAttribute('src', "//cdn.ckeditor.com/4.6.2/standard/ckeditor.js")
            addLfm.async = true
            document.body.appendChild(addLfm)
        },
        mounted() {
            // let addjQuery321 = document.createElement('script');
            // addjQuery321.setAttribute('src', "https://code.jquery.com/jquery-3.2.1.min.js")
            // //addjQuery321.async = true
            // document.body.appendChild(addjQuery321)

            // let addPopper = document.createElement('script');
            // addPopper.setAttribute('src', "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js")
            // //addPopper.async = true
            // document.body.appendChild(addPopper)

            // let addRoute = document.createElement('script')
            // addRoute.innerText = `var route_prefix = "/filemanager"`
            // //addRoute.async = true
            // document.body.appendChild(addRoute)

            

            // let addjQuery = document.createElement('script');
            // addjQuery.setAttribute('src', "//cdnjs.cloudflare.com/ajax/libs/ckeditor/4.5.11/adapters/jquery.js")
            // //addjQuery.async = true
            // document.body.appendChild(addjQuery)


            //let addLfmOptions = document.createElement('script')
            var options = { filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images', filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token=', filebrowserBrowseUrl: '/laravel-filemanager?type=Files', filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token='}
            //addLfmOptions.async = true
            //document.body.appendChild(addLfmOptions)

            //let ckeditorReplace = document.createElement('script')
            //ckeditorReplace.innerText = `$('textarea[name=content]').ckeditor({ height: 100, filebrowserImageBrowseUrl: route_prefix + '?type=Images', filebrowserImageUploadUrl: route_prefix + '/upload?type=Images&_token={{csrf_token()}}', filebrowserBrowseUrl: route_prefix + '?type=Files', filebrowserUploadUrl: route_prefix + '/upload?type=Files&_token={{csrf_token()}}' })`
            //ckeditorReplace.innerText = CKEDITOR.replace('content', options)
            //ckeditorReplace.async = true
            //document.body.appendChild(ckeditorReplace)
            CKEDITOR.replace('content', options)
        },

        // watch: {
        //     ckoption: function() { 
        //         var options = {
        //             filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
        //             filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token=',
        //             filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
        //             filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token='
        //         };
        //     },
        //     ckreplace: function() { CKEDITOR.replace('content', options); }
        // },

        methods: {
            createBlog() {
                this.axios
                    .post('/api/blog/store', this.blog)
                    .then(response => (
                        this.$router.push({name: 'blogs'})
                        // console.log(response.data)
                    ))
                    .catch(error => console.log(error))
                    .finally(() => this.loading = false)
            },
            openFileManager () {
                window.open(`/filemanager?type=image`, "width=900,height=600")
                var self = this
                window.SetUrl = function (items) {
                    self.blog.featured = items[0].url
                }
                return false

            }    
        }
    }
</script>