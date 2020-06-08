<template>
   <div class="container">
        <div class="row">
            <div class="col-lg-10 mx-auto">  
                <div class="recent-items-title">
                    <h2>Berita</h2><button-counter></button-counter>
                    
                    <router-link :to="{name: 'create-blog'}" class="btn btn-success">Baru</router-link>
                </div>
                <!-- <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Judul</th>
                        <th>Penulis</th>
                        <th>Tanggal</th>
                        <th>Kategori</th>
                        <th>Aksi</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="blog in blogs" :key="blog.id">
                        <td>{{ blog.id }}</td>
                        <td>{{ blog.title }}</td>
                        <td>{{ blog.user_id }}</td>
                        <td>{{ blog.created_at }}</td>
                        <td>{{ blog.category }}</td>
                        <td>
                            <div class="btn-group" role="group">
                                <router-link :to="{name: 'show-blog', params: { id: blog.id }}" class="btn btn-primary">Tampilkan</router-link>
                                <router-link :to="{name: 'edit-blog', params: { id: blog.id }}" class="btn btn-warning">Edit</router-link>
                                <button class="btn btn-danger" @click="deleteBlog(blog.id)">Delete</button>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table> --><br>
                <template>
                <li class="nav-item" v-show="auth">
                    <form id="logout-form" @submit.prevent="logout" style="">
                        <button type="submit" class="btn btn-primary">
                            Logout
                        </button>
                    </form>
                </li>
                </template>
            
                <!-- <router-link :to="{name: 'show-blog', params: { id: 2}}" class="btn btn-primary" v-model="tableData.show">Tampilkan</router-link> -->
                    <v-client-table :data="tableData" :columns="columns" :options="options">
                        <router-link :to="{name: 'show-blog', params: { slug: props.row.slug }}" slot="tampilkan" slot-scope="props" class="btn btn-primary">Tampilkan</router-link>
                        <router-link :to="{name: 'edit-blog', params: { id: props.row.id }}" slot="edit" slot-scope="props" class="btn btn-warning">Edit</router-link>
                        <button class="btn btn-danger" @click="deleteBlog(props.row.id)"  slot="hapus" slot-scope="props">Delete</button>
                        <!-- <a slot="edit" slot-scope="props" class="fa fa-edit" :href="props.row.id"></a> -->
                    </v-client-table>
                    <!-- <datatable :columns="columns" :data="rows"></datatable> -->
            </div>
        </div>
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
                // columns: [
                //     {label: 'id', field: 'id'},
                //     {label: 'Title', field: 'title'},
                //     {label: 'User Id', field: 'user_id'},
                    
                // ],
                
                // rows: [{ }
                //     // {
                //     //     id: 1,
                //     //     user: {
                //     //         username: "dprice0",
                //     //         firstName: "Daniel",
                //     //         lastName: "Price",
                //     //         email: "dprice0@blogs.com"
                //     //     },
                //     //     address: "3 Toban Park",
                //     //     city: "Pocatello",
                //     //     state: "Idaho"
                //     // }
                // ],
                columns: ['id', 'title', 'category', 'created_at', 'updated_at', 'tampilkan', 'edit', 'hapus'],
                tableData: [
                    //{
                        //id: this.id, title: this.title, meta:this.meta, edit: this.created_at
                    //}
                ],
                options: {
                    perPage: 10,
                    headings: {
                        title: 'Judul',
                        category: 'Kategori',
                        created_at: 'Dibuat',
                        updated_at: 'Diperbarui',
                        tampilkan: 'Lihat',
                        edit:'Ubah',
                        hapus: 'Hapus'
                    },
                    sortable: ['id', 'title', 'category', 'created_at', 'updated_at']
                },
                
            }
        },

        metaInfo () {
            return {
            title: `Semua Blog`,
            meta: [
                { name: 'description', content: `Semua Blog Aketajawe`},
                { property: 'og:description', content: `Semu Blog Aketajawe`},
            ]
            }
        },
        created() {
            // this.axios.defaults.headers.common = {
            //     'X-CSRF-TOKEN': Laravel.csrfToken,
            //     'X-Requested-With': 'XMLHttpRequest',
            //     'Authorization': 'Bearer ' + Laravel.apiToken,
            // };
            this.axios
                .get('/api/blogs')
                .then(response => {
                    this.blogs = response.data.blogs;
                    this.tableData = response.data.blogs;
                    this.success = response.data.auth;
                });
             //console.log(tableData);
        },
        methods: {
            deleteBlog(id) {
                this.axios
                    .delete(`/api/blog/delete/${id}`)
                    .then(response => {
                        let i = this.blogs.map(item => item.id).indexOf(id); // find index of your object
                        this.blogs.splice(i, 1)
                    });
            },
            logout(){
                const formData = new FormData();
                //formData.append('name', this.name);
                this.axios
                    .post('/logout', formData)
                    .then(response => (
                        //this.$router.push({name: 'blogs'}),
                        console.log(response.data)
                    ))
                    .catch(error => console.log(error))
                    .finally(() => this.loading = false)
                    //const idx = this.auth.indexOf(auth)
                    //Vue.delete('logout-form')
            }
        }
    }
    
</script>
