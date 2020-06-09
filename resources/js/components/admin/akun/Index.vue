<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Master Data User/Akun</h2>
      <router-link :to="{name: 'create-akun'}" class="btn btn-success">Akun Baru</router-link>
      <v-client-table :data="tableAkun" :columns="columns" :options="options">
        <router-link :to="{name: 'edit-akun', params: { id: props.row.id }}" slot="edit" slot-scope="props"><b-button size="sm" variant="outline-primary">Edit</b-button></router-link>
        <b-button size="sm" variant="outline-danger" @click="deleteAkun(props.row.id)"  slot="hapus" slot-scope="props">Delete</b-button>
      </v-client-table>
    </div>
  </b-col>
</template>
<script>
  export default {
    data() {
      return {
        dataAkun: [],
        columns: ['id', 'name', 'username', 'role', 'kode_dc', 'created_at', 'updated_at', 'edit', 'hapus'],
        tableAkun: [
          //{
            //id: this.id, title: this.title, meta:this.meta, edit: this.created_at
          //}
        ],
        options: {
          perPage: 10,
          headings: {
            name: 'Nama Lengkap',
            username: 'Username',
            role: 'Level Akun',
            kode_dc: 'Kode DC',
            created_at: 'Dibuat',
            updated_at: 'Diperbarui',
            edit:'Ubah',
            hapus: 'Hapus'
          },
          sortable: ['id', 'name', 'username', 'role', 'kode_dc', 'created_at', 'updated_at']
        }
      }
    },
    created() {
      this.axios
        .get('/api/akun')
        .then(response => {
          this.dataAkun = response.data.akun
          this.tableAkun = response.data.akun
        })
    },
    methods: {
      deleteAkun(id) {
        this.axios
          .delete(`/api/akun/delete/${id}`)
          .then(response => {
            let i = this.dataAkun.map(item => item.id).indexOf(id); // find index of your object
            this.dataAkun.splice(i, 1)
          })
      }
    }
  }
</script>
