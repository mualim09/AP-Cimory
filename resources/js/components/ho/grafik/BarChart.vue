  <b-col cols lg="10" xs=12>
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
        .get('api/grafik_pembelian/2020-06-22/1')
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
