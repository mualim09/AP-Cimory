<template>
  <b-col cols lg="12" xs=12>
    <b-row>
      <form @submit.prevent="cariLaporan">
        <div class="form-group row">
          <label for="tanggal_awal" class="col-md-4 col-form-label text-md-right">Tanggal Awal</label>
          <div class="col-md-6">
            <input id="tanggal_awal" type="date" class="form-control" v-model="laporan.tanggal_awal">
          </div>
        </div>
        <div class="form-group row">
          <label for="tanggal_akhir" class="col-md-4 col-form-label text-md-right">Tanggal Akhir</label>
          <div class="col-md-6">
            <input id="tanggal_akhir" type="date" class="form-control" v-model="laporan.tanggal_akhir">
          </div>
        </div>

        <b-button type="submit" variant="primary">Tampilkan</b-button><br>
        <!-- <b-button type="button" variant="warning" @click="resetForm">Reset</b-button> -->
      </form>
    </b-row>
    <b-row>
      <div class="login-form mx-auto text-center">
        <h2>Laporan Kompensasi</h2>
        <v-client-table :data="tableLaporan" :columns="columns" :options="options">
          <!-- <router-link :to="{name: 'edit-dc', params: { id: props.row.id }}" slot="edit" slot-scope="props"><b-button size="sm" variant="outline-primary">Edit</b-button></router-link>
          <b-button size="sm" variant="outline-danger" @click="deleteDC(props.row.id)"  slot="hapus" slot-scope="props">Delete</b-button> -->
        </v-client-table>
      </div>
    </b-row>
  </b-col>
</template>
<script>
  export default {
    data() {
      return {
        laporan: {
          tanggal_awal: null,
          tanggal_akhir: null
        },
        dataLaporan: [],
        columns: ['nama_produk', 'pembelian', 'harga_dasar', 'penjualan', 'harga_jual', 'kompensasi'],
        tableLaporan: [],
        options: {
          perPage: 100,
          headings: {
            nama_produk: 'Produk',
            pembelian: 'Qty Pembelian',
            harga_dasar: 'Harga Dasar',
            penjualan: 'Qty Penjualan',
            harga_jual: 'Harga Jual',
            kompensasi: 'Kompensasi'
          },
          sortable: ['nama_produk', 'pembelian', 'harga_dasar', 'penjualan', 'harga_jual', 'kompensasi']
        }
      }
    },
    created() {
      this.cariLaporan()
    },
    methods: {
      cariLaporan() {
        this.axios
          .get(`/api/kompensasi/`, { params: { tanggal_awal: this.laporan.tanggal_awal, tanggal_akhir: this.laporan.tanggal_akhir }})
          .then(response => {
            this.dataLaporan = response.data
            this.tableLaporan = response.data
          })
      },
      resetForm() {
        this.laporan.tanggal = null
      }
    }
  }
</script>
