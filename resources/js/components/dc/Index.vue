<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Laporan DC</h2>
      <v-client-table :data="tableTransaksi" :columns="columns" :options="options">
        <!-- <router-link :to="{name: 'edit-dc', params: { id: props.row.id }}" slot="edit" slot-scope="props"><b-button size="sm" variant="outline-primary">Edit</b-button></router-link>
        <b-button size="sm" variant="outline-danger" @click="deleteDC(props.row.id)"  slot="hapus" slot-scope="props">Delete</b-button> -->
      </v-client-table>
    </div>
  </b-col>
</template>
<script>
  export default {
    data() {
      return {
        dataTransaksi: [],
        columns: ['id', 'nama_sales', 'nama_produk', 'kode_dc', 'qty_pembelian', 'qty_penjualan', 'qty_retur', 'qty_stock', 'created_at', 'updated_at'],
        tableTransaksi: [
          //{
            //id: this.id, title: this.title, meta:this.meta, edit: this.created_at
          //}
        ],
        options: {
          perPage: 10,
          headings: {
            nama_sales: 'Nama Sales',
            nama_produk: 'Nama Produk',
            kode_dc: 'Kode DC',
            qty_pembelian: 'Jumlah Pembelian',
            qty_penjualan: 'Jumlah Penjualan',
            qty_retur: 'Retur',
            qty_stock: 'Stock',
            created_at: 'Dibuat',
            updated_at: 'Diperbarui',
            edit:'Ubah',
            hapus: 'Hapus'
          },
          sortable: ['id', 'nama_sales', 'nama_produk', 'kode_dc', 'qty_pembelian', 'qty_penjualan', 'qty_retur', 'qty_stock', 'created_at', 'updated_at']
        }
      }
    },
    created() {
      this.axios
        .get('/api/transaksi')
        .then(response => {
          this.dataTransaksi = response.data.transaksi
          this.tableTransaksi = response.data.transaksi
        })
    },
    methods: {
      deleteDC(transaksi) {
        this.axios
          .delete(`/api/transaksi/delete/${id}`)
          .then(response => {
            let i = this.dataTransaksi.map(item => item.id).indexOf(id); // find index of your object
            this.dataTransaksi.splice(i, 1)
          })
      }
    }
  }
</script>
