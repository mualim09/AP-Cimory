  <b-col cols lg="10" xs=12>
    <b-row>
      <form @submit.prevent="createPembelian">

        <div class="form-group row">
          <label for="tanggal_pencarian" class="col-md-4 col-form-label text-md-right">Tanggal Pencarian</label>
          <div class="col-md-6">
            <input id="tanggal_pencarian" type="text" class="form-control" v-model="pembelian.no_invoice">
          </div>
        </div>

        <div class="form-group row">
          <label for="produk_id" class="col-md-4 col-form-label text-md-right">Produk</label>
          <div class="col-md-6">
            <select v-model="pembelian.produk_id" class="form-control">
              <option value=""></option>
              <option v-for="data_produk in cari_produk" :value="data_produk.produk.id" :key="data_produk.produk.id">
                {{ data_produk.produk.nama_produk }}
              </option>
            </select>
          </div>
        </div>

        <b-button type="submit" variant="primary">Simpan</b-button>

      </form>
    </b-row>
    <b-row>
      <div class="login-form mx-auto text-center">
        <h2>Grafik</h2>
          <div
          v-if="loaded"
          :chartdata="chartData"
          :options="options">
        </div>
      </div>
    </b-row>
  </b-col>

<script>
import VueCharts from 'vue-chartjs'
import { Bar, mixins } from 'vue-chartjs'
//  const { reactiveProp } = mixins

  export default {
    extends: Bar,
    mixins: [mixins.reactiveData],
    //props: ['options'],
    data() {
      return {
        chartData: '',

        loaded: false,
        // chartdata: {
        //   labels: ['January', 'February'],
        //   datasets: [
        //       {
        //         label: 'Data One',
        //         backgroundColor: '#f87979',
        //         pointBackgroundColor: 'white',
        //         borderWidth: 1,
        //         pointBorderColor: '#249EBF',
        //         data: [40, 20]
        //       }
        //     ]
        // },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              },
              gridLines: {
                display: true
              }
            }],
            xAxes: [ {
              gridLines: {
                display: false
              }
            }]
          },
          legend: {
            display: true
          },
          responsive: true,
          maintainAspectRatio: false
        }
      }
    },
    created() {
      // Cari data
      this.axios
        .get('api/grafik_pembelian/2020-06-18/1')
        .then(response => (
          console.log(response.data),
          // responseData = response.data,
          this.chartData = {
            labels: response.data.map(item => item.dc.kode_dc),
            datasets: [
              {
                label: 'Grafik Pembelian',
                backgroundColor: '#f87979',
                data: response.data.map(item => item.qty_pembelian)
              }
            ]
          },
          console.log(this.chartdata),
          this.loaded = true
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
    mounted () {
        this.renderChart(this.chartData, this.options)
    }
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
