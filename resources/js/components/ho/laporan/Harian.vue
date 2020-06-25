<template>
  <b-col cols lg="12" xs=12>
    <b-row>
      <form @submit.prevent="cariLaporan">
        <div class="form-group row">
          <label for="tanggal_pencarian" class="col-md-4 col-form-label text-md-right">Tanggal Pencarian</label>
          <div class="col-md-6">
            <input id="tanggal_pencarian" type="date" class="form-control" v-model="laporan.tanggal">
          </div>
        </div>

        <div class="form-group row">
          <label for="produk_id" class="col-md-4 col-form-label text-md-right">Produk</label>
          <div class="col-md-8">
            <select v-model="laporan.produk_id" class="form-control">
              <option value=""></option>
              <option v-for="data_produk in cari_produk" :value="data_produk.produk.id" :key="data_produk.produk.id">
                {{ data_produk.produk.nama_produk }}
              </option>
            </select>
          </div>
        </div>
        <b-button type="submit" variant="primary">Tampilkan</b-button><br>
        <!-- <b-button type="button" variant="warning" @click="resetForm">Reset</b-button> -->
      </form>
    </b-row>
    <b-row>
      <div class="login-form mx-auto text-center">
        <h2>Laporan DC Hariann</h2>
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
          tanggal: 'all',
          produk_id: 'all'
        },
        cari_produk: [],
        dataLaporan: [],
        columns: ['dc.kode_dc', 'tanggal', 'produk.nama_produk', 'qty_pembelian', 'qty_penjualan', 'qty_retur', 'qty_stok'],
        tableLaporan: [],
        options: {
          perPage: 100,
          headings: {
            'dc.kode_dc': 'Kode DC',
            tanggal: 'Tanggal',
            'produk.nama_produk': 'Produk',
            qty_pembelian: 'Pembelian',
            qty_penjualan: 'Penjualan',
            qty_retur: 'Retur',
            qty_stok: 'Stok'
          },
          sortable: ['dc.kode_dc', 'tanggal', 'produk.nama_produk', 'qty_pembelian', 'qty_penjualan', 'qty_retur', 'qty_stok']
        }
      }
    },
    created() {
      this.cariLaporan()
      // Cari produk
      this.axios
        .get('api/cari_produk')
        .then(response => (
          // console.log(response.data),
          this.cari_produk = response.data
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)
    },
    methods: {
      cariLaporan() {
        this.axios
          .get(`/api/harian/${this.laporan.tanggal}/${this.laporan.produk_id}`)
          .then(response => {
            this.dataLaporan = response.data
            this.tableLaporan = response.data
          })
      },
      resetForm() {
        this.laporan.tanggal = 'all',
        this.laporan.produk_id = 'all'
      }
    }
  }
</script>
