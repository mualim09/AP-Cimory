<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Input Penjualan</h2>
      <form @submit.prevent="createPenjualan">

        <div class="form-group row">
          <label for="dc_id" class="col-md-4 col-form-label text-md-right">DC</label>
          <div class="col-md-6">
          <select v-model="penjualan.dc_id" required class="form-control">
            <option v-for="dc in cari_dc" :value="dc.id" :key="dc.id" v-if="dc.kode_dc == local_dc">
              {{ dc.nama_dc }}
            </option>
          </select>
          </div>
        </div>

        <div class="form-group row">
          <label for="tanggal_penjualan" class="col-md-4 col-form-label text-md-right">Tanggal</label>
          <div class="col-md-6">
            <input id="tanggal_penjualan" type="date" class="form-control" required v-model="penjualan.tanggal_penjualan">
          </div>
        </div>

        <div class="form-group row">
          <label for="kode_transaksi" class="col-md-4 col-form-label text-md-right">Kode Transaksi</label>
          <div class="col-md-6">
            <input id="kode_transaksi" type="text" class="form-control" v-model="penjualan.kode_transaksi">
          </div>
        </div>

        <div class="form-group row">
          <label for="sales_id" class="col-md-4 col-form-label text-md-right">Sales</label>
          <div class="col-md-6">
          <select v-model="penjualan.sales_id" class="form-control">
            <option value=""></option>
            <option v-for="sales in cari_sales" :value="sales.id"  :key="sales.id">
              {{ sales.kode_sales }}
            </option>
          </select>
          </div>
        </div>

        <div class="form-group row">
          <label for="produk_id" class="col-md-4 col-form-label text-md-right">Produk</label>
          <div class="col-md-6">
          <select v-model="penjualan.produk_id" @change="hargaProduk($event)" class="form-control">
            <option value=""></option>
            <option v-for="data_produk in cari_produk" :value="data_produk.produk.id" :key="data_produk.produk.id">
              {{ data_produk.produk.nama_produk }}
            </option>
          </select>
          </div>
        </div>

        <div class="form-group row">
          <label for="qty_penjualan" class="col-md-4 col-form-label text-md-right">Qty Penjualan</label>
          <div class="col-md-6">
            <input id="qty_penjualan" type="text" class="form-control" @change="nilaiPenjualan" v-model="penjualan.qty_penjualan">
          </div>
        </div>

        <div class="form-group row">
          <label for="nilai_penjualan" class="col-md-4 col-form-label text-md-right">Nilai Penjualan</label>
          <div class="col-md-6">
            <input id="nilai_penjualan" type="text" class="form-control" v-model="penjualan.nilai_penjualan">
          </div>
        </div>

        <b-button type="submit" variant="primary">Simpan</b-button>

      </form>
      <span class="info">Tanggal penjualan harus sama dengan tanggal pembelian sebuah produk,<br>karena jika ada perulangan pembelian produk yang sama dikemudian hari,<br>jumlah stok diketahui berdasarkan pembelian produk xx tgl xx - penjualan produk xx tgl xx</span>
    </div>
  </b-col>
</template>
<script>
  export default {
    // props: ['harga'],
    data() {
      return {
        penjualan: {},
        cari_dc: [],
        cari_sales: [],
        cari_produk: [],
        harga: null,
        local_dc: localStorage.getItem('dc')
      }
    },
    created() {
      // Cari DC
      this.axios
        .get('api/cari_dc')
        .then(response => (
          console.log(response.data),
          this.cari_dc = response.data
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)
      // Cari sales
      this.axios
        .get(`api/cari_sales/${localStorage.getItem('dc')}`)
        .then(response => (
          console.log(response.data),
          this.cari_sales = response.data
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)
      // Cari produk
      this.axios
        .get('api/cari_produk')
        .then(response => (
          console.log(response.data),
          this.cari_produk = response.data
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)
    },
    methods: {
      createPenjualan() {
        this.axios
          .post('/api/penjualan/store', this.penjualan)
          .then(response => (
            this.$router.push({name: 'master-penjualan'}),
            console.log(response)
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)
      },
      hargaProduk(event) {
        var self = this
        this.cari_produk.forEach(function callback(element, index, array) {
          // console.log(element)
          if (element.produk_id == self.penjualan['produk_id']) {
            console.log(element.harga_jual)
            self.harga = element.harga_jual
          }
        })
      }
    },
    computed : {
      nilaiPenjualan: function () {
        return this.penjualan.nilai_penjualan = this.harga * this.penjualan.qty_penjualan
      }
    }
  }
</script>
<style scoped>
  .info{
    color: red;
  }
</style>
