<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Master Data Produk</h2>
      <router-link :to="{name: 'create-produk'}" class="btn btn-success">Produk Baru</router-link>
      <v-client-table :data="tableProduk" :columns="columns" :options="options">
        <router-link :to="{name: 'edit-produk', params: { id: props.row.id }}" slot="edit" slot-scope="props"><b-button size="sm" variant="outline-primary">Edit</b-button></router-link>
        <b-button size="sm" variant="outline-danger" @click="deleteProduk(props.row.id)"  slot="hapus" slot-scope="props">Delete</b-button>
      </v-client-table>
    </div>
  </b-col>
</template>
<script>
  export default {
    data() {
      return {
        dataProduk: [],
        columns: ['kode_produk', 'nama_produk', 'created_at', 'updated_at', 'edit', 'hapus'],
        tableProduk: [],
        options: {
          perPage: 10,
          headings: {
            nama_produk: 'Kode Produk',
            keterangan: 'Nama Produk',
            created_at: 'Dibuat',
            updated_at: 'Diperbarui',
            edit:'Ubah',
            hapus: 'Hapus'
          },
          sortable: ['kode_produk', 'nama_produk', 'created_at', 'updated_at']
        }
      }
    },
    created() {
      this.axios
        .get('/api/produk')
        .then(response => {
          this.dataProduk = response.data.produk
          this.tableProduk = response.data.produk
        })
    },
    methods: {
      deleteProduk(id) {
        this.axios
          .delete(`/api/produk/delete/${id}`)
          .then(response => {
            let i = this.dataProduk.map(item => item.id).indexOf(id); // find index of your object
            this.dataProduk.splice(i, 1)
          })
      }
    }
  }
</script>
