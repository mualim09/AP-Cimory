<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Master Data Sales</h2>
      <router-link :to="{name: 'create-sales'}" class="btn btn-success">Sales Baru</router-link>
      <v-client-table :data="tableSales" :columns="columns" :options="options">
        <router-link :to="{name: 'edit-sales', params: { id: props.row.id }}" slot="edit" slot-scope="props"><b-button size="sm" variant="outline-primary">Edit</b-button></router-link>
        <b-button size="sm" variant="outline-danger" @click="deleteProduk(props.row.id)"  slot="hapus" slot-scope="props">Delete</b-button>
      </v-client-table>
    </div>
  </b-col>
</template>
<script>
  export default {
    data() {
      return {
        dataSales: [],
        columns: ['id', 'nama_sales', 'kode_sales', 'created_at', 'updated_at', 'edit', 'hapus'],
        tableSales: [
          //{
            //id: this.id, title: this.title, meta:this.meta, edit: this.created_at
          //}
        ],
        options: {
          perPage: 10,
          headings: {
            title: 'Judul',
            nama_sales: 'Nama Sales',
            kode_sales: 'Kode Sales',
            created_at: 'Dibuat',
            updated_at: 'Diperbarui',
            edit:'Ubah',
            hapus: 'Hapus'
          },
          sortable: ['id', 'nama_sales', 'kode_sales', 'created_at', 'updated_at']
        }
      }
    },
    created() {
      this.axios
        .get('/api/sales')
        .then(response => {
          this.dataSales = response.data.sales
          this.tableSales = response.data.sales
        })
    },
    methods: {
      deleteProduk(id) {
        this.axios
          .delete(`/api/sales/delete/${id}`)
          .then(response => {
            let i = this.dataSales.map(item => item.id).indexOf(id); // find index of your object
            this.dataSales.splice(i, 1)
          })
      }
    }
  }
</script>
