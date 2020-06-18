<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Laporan Penjualan</h2>
      <v-client-table :data="tablePenjualan" :columns="columns" :options="options">
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
        dataPenjualan: [],
        columns: ['dc.kode_dc', 'tanggal_penjualan', 'kode_transaksi', 'sales.kode_sales', 'produk.nama_produk', 'qty_penjualan', 'nilai_penjualan'],
        tablePenjualan: [],
        options: {
          perPage: 100,
          headings: {
            'dc.kode_dc': 'Kode DC',
            tanggal_penjualan: 'Tanggal Penjualan',
            kode_transaksi: 'Kode Transaksi',
            'sales.kode_sales': 'Sales',
            'produk.nama_produk': 'Produk',
            qty_penjualan: 'Qty Penjualan',
            nilai_penjualan: 'Nilai Penjualan'
          },
          sortable: ['dc.kode_dc', 'tanggal_penjualan', 'kode_transaksi', 'sales.kode_sales', 'produk.nama_produk', 'qty_penjualan', 'nilai_penjualan']
        }
      }
    },
    created() {
      this.axios
        .get(`/api/penjualan/${localStorage.getItem('dc')}`)
        .then(response => {
          this.dataPenjualan = response.data
          this.tablePenjualan = response.data
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
