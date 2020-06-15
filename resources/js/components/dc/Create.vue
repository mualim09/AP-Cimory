<template>
  <b-col cols lg="10" xs=12>
    <div class="login-form mx-auto text-center">
      <h2>Input Laporan</h2>
      <form @submit.prevent="createTransaksi">
        <div v-if="step === 1">
          <div class="form-group row">
            <label for="sales" class="col-md-4 col-form-label text-md-right">Sales </label>
            <div class="col-md-6">
            <select v-model="transaksi.id_sales" @change="selectedSales($event)" class="form-control">
              <option value=""></option>
              <option v-for="sales in id_sales" :value="sales.id" :key="sales.id">
                {{ sales.kode_sales }}
              </option>
            </select>
            </div>
          </div>
          <div class="form-group row">
            <label for="produk" class="col-md-4 col-form-label text-md-right">Produk </label>
            <div class="col-md-6">
            <select v-model="transaksi.id_produk" @change="selectedProduct($event)" class="form-control">
              <option value=""></option>
              <option v-for="produk in id_produk" :value="produk.id"  :key="produk.id">
                {{ produk.nama_produk }}
              </option>
            </select>
            </div>
          </div>
          <div class="form-group row">
            <label for="qty_pembelian" class="col-md-4 col-form-label text-md-right">Pembelian</label>
            <div class="col-md-6">
              <input id="qty_pembelian" type="text" class="form-control" name="qty_pembelian" required v-model="transaksi.qty_pembelian">
            </div>
          </div>
          <b-button size="sm" variant="outline-success" @click.prevent="next">Berikutnya</b-button>
        </div>
        
        <div v-if="step === 2">
          <ul id="dataTransaksi">
            <li>Nama Sales: {{ nama_s }}
            <li>Nama Produk: {{ nama_p }}</li>
            <li>Jumlah Pembelian: {{ transaksi.qty_pembelian }}</li>
          </ul>
          <div class="form-group row">
            <label for="qty-penjualan" class="col-md-4 col-form-label text-md-right">Penjualan </label>
            <div class="col-md-6">
              <input id="qty-penjualan" type="text" class="form-control" name="qty-penjualan" v-model="transaksi.qty_penjualan">
            </div>
          </div>
          <b-button size="sm" variant="outline-danger" @click.prevent="prev">Sebelumnya</b-button>
          <b-button size="sm" variant="outline-success" @click.prevent="next">Berikutnya</b-button>
        </div>
        <div v-if="step === 3">
          <ul id="dataTransaksi">
            <li>Nama Sales: {{ nama_s }}
            <li>Nama Produk: {{ nama_p }}</li>
            <li>Jumlah Pembelian: {{ transaksi.qty_pembelian }}</li>
            <li>Jumlah  Penjualan: {{ transaksi.qty_penjualan }}</li>
          </ul>
          <div class="form-group row">
            <label for="retur" class="col-md-4 col-form-label text-md-right">Retur </label>
            <div class="col-md-6">
              <input id="retur" type="text" class="form-control" name="retur" v-model="transaksi.qty_retur">
            </div>
          </div>
          <b-button size="sm" variant="outline-danger" @click.prevent="prev">Sebelumnya</b-button>
          <b-button size="sm" variant="outline-success" @click.prevent="next">Berikutnya</b-button>
        </div>
        <div v-if="step === 4">
          <ul id="dataTransaksi">
            <li>Nama Sales: {{ nama_s }}
            <li>Nama Produk: {{ nama_p }}</li>
            <li>Jumlah Pembelian: {{ transaksi.qty_pembelian }}</li>
            <li>Jumlah  Penjualan: {{ transaksi.qty_penjualan }}</li>
            <li>Retur : {{ transaksi.qty_retur }}</li>
            <li>Stock: {{ hitungStock }}</li>
          </ul>
          <div class="form-group row">
            <label for="stock" class="col-md-4 col-form-label text-md-right">Stock </label>
            <div class="col-md-6">
              <input id="stock" type="text" class="form-control" name="stock" v-model="transaksi.qty_stock">
            </div>
          </div>
          <b-button size="sm" variant="outline-danger" @click.prevent="prev">Sebelumnya</b-button>
          <b-button size="sm" variant="outline-success" @click.prevent="next">Berikutnya</b-button>
        </div>
        <div v-if="step === 5">
          <ul id="dataTransaksi">
            <li>Nama Sales: {{ nama_s }}
            <li>Nama Produk: {{ nama_p }}</li>
            <li>Jumlah Pembelian: {{ transaksi.qty_pembelian }}</li>
            <li>Jumlah  Penjualan: {{ transaksi.qty_penjualan }}</li>
            <li>Retur : {{ transaksi.qty_retur }}</li>
            <li>Stok : {{ hitungStock }}</li>
          </ul>
          <b-button size="sm" variant="outline-success" @click.prevent="prev">Sebelumnya</b-button>
          <b-button type="submit" variant="primary">Simpan</b-button>
        </div>  
      </form>
    </div>
  </b-col>
</template>
<script>
  export default {
    data() {
      return {
        step: 1,
        transaksi: {},
        id_sales: [],
        id_produk: [],
        nama_s: '',
        nama_p: ''
      }
    },
    created() {
      this.axios
        .get('api/id_sales', { params: { username: localStorage.getItem('username') } })
        .then(response => (
          console.log(response.data),
          this.id_sales = response.data
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)

      this.axios
        .get('api/id_produk')
        .then(response => (
          console.log(response.data),
          this.id_produk = response.data
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)
    },
    methods: {
      // Ambil text dari selected item https://www.itsolutionstuff.com/post/vue-js-get-selected-option-text-exampleexample.html
      selectedSales(event) {
        this.nama_s = event.target.options[event.target.options.selectedIndex].text
        console.log(this.nama_s);
      },
      selectedProduct(event) {
        this.nama_p = event.target.options[event.target.options.selectedIndex].text
        console.log(this.nama_p);
      },
      // Memisahkan div agar menjadi multipage form https://www.raymondcamden.com/2018/01/29/a-multi-step-form-in-vuejs
      prev() {
        this.step--
      },
      next() {
        this.step++
      },
      // Proses simpan transaksi
      createTransaksi() {
        this.axios
          .post('/api/transaksi/store', this.transaksi)
          .then(response => (
            this.$router.push({name: 'master-laporan-dc'}),
            console.log(response)
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)
      }
    },
    computed: {
      hitungStock: function () {
        return this.transaksi.qty_stock = this.transaksi.qty_pembelian - this.transaksi.qty_penjualan - this.transaksi.qty_retur
      }
    }
  }
</script>
<style scoped>
  #dataTransaksi {
    list-style: none;
  }
</style>