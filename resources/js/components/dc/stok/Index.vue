<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Laporan Stok</h2>
      <v-client-table :data="tableStok" :columns="columns" :options="options">
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
        dataStok: [],
        columns: ['dc.kode_dc', 'tanggal_stok', 'keterangan', 'produk.nama_produk', 'qty_stok'],
        tableStok: [],
        options: {
          perPage: 100,
          headings: {
            'dc.kode_dc': 'Kode DC',
            tanggal_stok: 'Tanggal Stok',
            keterangan: 'Keterangan',
            'produk.nama_produk': 'Produk',
            qty_stok: 'Qty Stok',
          },
          sortable: ['kode_dc', 'tanggal_stok', 'keterangan', 'produk.nama_produk', 'qty_stok']
        }
      }
    },
    created() {
      this.axios
        .get(`/api/stok/${localStorage.getItem('dc')}`)
        .then(response => {
          this.dataStok = response.data
          this.tableStok = response.data
        })
    },
    // methods: {
    //   deleteDC(transaksi) {
    //     this.axios
    //       .delete(`/api/transaksi/delete/${id}`)
    //       .then(response => {
    //         let i = this.dataTransaksi.map(item => item.id).indexOf(id); // find index of your object
    //         this.dataTransaksi.splice(i, 1)
    //       })
    //   }
    // }
  }
</script>
