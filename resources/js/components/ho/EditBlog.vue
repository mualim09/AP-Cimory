<template>
    <div class="container">
        <div class="row">
            <div class="col-lg-10 mx-auto">
                <div class="recent-items-title">
                    <h2>Buat Blog</h2>
                </div>
                <form @submit.prevent="updateBlog">
                    <div class="form-group">
                        <label>Judul</label>
                        <input type="text" class="form-control" v-model="blog.title">
                    </div>
                    <div class="form-group">
                        <label>Meta</label>
                        <input type="text" class="form-control" v-model="blog.meta">
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
                        <span class="input-group-btn">
                            <a id="lfm" data-input="featured" data-preview="holder" class="btn btn-info">
                            <i class="fa fa-picture-o"></i> Choose
                            </a>
                        </span>
                        <input id="featured" class="form-control" type="text" v-model="blog.featured">
                        <img id="holder" class="mt-3" :src="blog.featured">
                    </div>
                    <div class="form-group">
                        <label>Konten</label>
                        <ckeditor id="content" v-model="blog.content" :config="editorConfig"></ckeditor>
                    </div>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </form>
            </div>
        </div>
    </div>
</template>
<script>
    import CKEditor from 'ckeditor4-vue';
    export default {
        components: {
            // Use the <ckeditor> component in this view.
            ckeditor: CKEditor.component
        },
        data() {
            return {
                blog: {},
                editorData: '',
                editorConfig: {
                    // The configuration of the editor.
                }
            }
        },
        created() {
            this.axios
                .get(`/api/blog/edit/${this.$route.params.id}`)
                .then((response) => {
                    this.blog = response.data;
                    // console.log(response.data);
                });
        },
        methods: {
            updateBlog() {
                this.axios
                    .post(`/api/blog/update/${this.$route.params.id}`, this.blog)
                    .then(response => (
                        this.$router.push({name: 'blogs'})
                        // console.log(response.data)
                    ))
                    .catch(error => console.log(error))
                    .finally(() => this.loading = false)
            }
        }
    }
</script>