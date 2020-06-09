<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Master Data Harga</h2>
      <router-link :to="{name: 'create-harga'}" class="btn btn-success">Harga Baru</router-link>
      <v-client-table :data="tableHarga" :columns="columns" :options="options">
        <router-link :to="{name: 'edit-harga', params: { id: props.row.id }}" slot="edit" slot-scope="props"><b-button size="sm" variant="outline-primary">Edit</b-button></router-link>
        <b-button size="sm" variant="outline-danger" @click="deleteHarga(props.row.id)"  slot="hapus" slot-scope="props">Delete</b-button>
      </v-client-table>
    </div>
  </b-col>
</template>
<script>
  export default {
    data() {
      return {
        dataHarga: [],
        columns: ['id', 'nama_sales', 'nama_produk', 'harga_dasar', 'harga_jual', 'created_at', 'updated_at', 'edit', 'hapus'],
        tableHarga: [],
        options: {
          perPage: 10,
          headings: {
            nama_sales: 'Nama Sales',
            nama_produk: 'Nama Produk',
            harga_dasar: 'Harga Dasar',
            harga_jual: 'Harga Jual',
            created_at: 'Dibuat',
            updated_at: 'Diperbarui',
            edit:'Ubah',
            hapus: 'Hapus'
          },
          sortable: ['id', 'nama_sales', 'nama_produk', 'harga_dasar', 'harga_jual', 'created_at', 'updated_at']
        }
      }
    },
    created() {
      this.axios
        .get('/api/harga')
        .then(response => {
          this.dataHarga = response.data.harga
          this.tableHarga = response.data.harga
        })
    },
    methods: {
      deleteHarga(id) {
        this.axios
          .delete(`/api/harga/delete/${id}`)
          .then(response => {
            let i = this.dataHarga.map(item => item.id).indexOf(id); // find index of your object
            this.dataHarga.splice(i, 1)
          })
      }
    }
  }
</script>
