<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Master Data DC</h2>
      <router-link :to="{name: 'create-dc'}" class="btn btn-success">DC Baru</router-link>
      <v-client-table :data="tableDC" :columns="columns" :options="options">
        <router-link :to="{name: 'edit-dc', params: { id: props.row.id }}" slot="edit" slot-scope="props"><b-button size="sm" variant="outline-primary">Edit</b-button></router-link>
        <b-button size="sm" variant="outline-danger" @click="deleteDC(props.row.id)"  slot="hapus" slot-scope="props">Delete</b-button>
      </v-client-table>
    </div>
  </b-col>
</template>
<script>
  export default {
    data() {
      return {
        dataDC: [],
        columns: ['id', 'kode_dc', 'nama_dc', 'created_at', 'updated_at', 'edit', 'hapus'],
        tableDC: [
          //{
            //id: this.id, title: this.title, meta:this.meta, edit: this.created_at
          //}
        ],
        options: {
          perPage: 10,
          headings: {
            kode_dc: 'Kode DC',
            nama_dc: 'Nama DC/Kota',
            created_at: 'Dibuat',
            updated_at: 'Diperbarui',
            edit:'Ubah',
            hapus: 'Hapus'
          },
          sortable: ['id', 'kode_dc', 'nama_dc', 'created_at', 'updated_at']
        }
      }
    },
    created() {
      this.axios
        .get('/api/dc')
        .then(response => {
          this.dataDC = response.data.dc
          this.tableDC = response.data.dc
        })
    },
    methods: {
      deleteDC(id) {
        this.axios
          .delete(`/api/dc/delete/${id}`)
          .then(response => {
            let i = this.dataDC.map(item => item.id).indexOf(id); // find index of your object
            this.dataDC.splice(i, 1)
          })
      }
    }
  }
</script>
