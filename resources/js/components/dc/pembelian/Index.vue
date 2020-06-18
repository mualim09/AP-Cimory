<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Laporan Pembelian</h2>
      <v-client-table :data="tablePembelian" :columns="columns" :options="options">
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
        dataPembelian: [],
        columns: ['dc.kode_dc', 'tanggal_pembelian', 'no_invoice', 'produk.nama_produk', 'qty_pembelian'],
        tablePembelian: [],
        options: {
          perPage: 100,
          headings: {
            'dc.kode_dc': 'Kode DC',
            tanggal_pembelian: 'Tanggal Pembelian',
            no_invoice: 'No. Invoice',
            'produk.nama_produk': 'Produk',
            qty_pembelian: 'Qty Pembelian',
          },
          sortable: ['kode_dc', 'tanggal_pembelian', 'no_invoice', 'nama_produk', 'qty_pembelian']
        }
      }
    },
    created() {
      this.axios
        .get(`/api/pembelian/${localStorage.getItem('dc')}`)
        .then(response => {
          this.dataPembelian = response.data
          this.tablePembelian = response.data
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
