<template>
  <b-col cols lg="10" xs=12>
    <b-row>
      <form @submit.prevent="cariGrafikBaru">

        <div class="form-group row">
          <label for="tanggal" class="col-md-4 col-form-label text-md-right">Tanggal Pencarian</label>
          <div class="col-md-6">
            <input id="tanggal" type="date" class="form-control" v-model="tanggal">
          </div>
        </div>

        <!-- <div class="form-group row">
          <label for="produk_id" class="col-md-4 col-form-label text-md-right">Produk</label>
          <div class="col-md-6">
            <select v-model="pembelian.produk_id" class="form-control">
              <option value=""></option>
              <option v-for="data_produk in cari_produk" :value="data_produk.produk.id" :key="data_produk.produk.id">
                {{ data_produk.produk.nama_produk }}
              </option>
            </select>
          </div>
        </div> -->

        <b-button type="submit" variant="primary">Tampilkan</b-button>

      </form>
    </b-row>
    <b-row>
      <div class="login-form mx-auto text-center">
        <h2>Grafik</h2>
        <bar-chart
          v-if="loaded"
          :chartData="chartData"
          :options="options"/>
      </div>
    </b-row>
  </b-col>
</template>
<script>
  import BarChart from './BarChart.vue'
  export default {
    name: 'BarChartContainer',
    components: { BarChart },
    data() {
      return {
        loaded: false,
        tanggal: '2020-06-25',
        chartData: {
          },
        pembelian: {},
        cari_produk: [],
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
    mounted (){

    },
    async created() {
      this.axios
        .get('api/cari_produk')
        .then(response => (
          this.cari_produk = response.data
        ))
        .catch(error => console.log(error))
        .finally(() => this.loading = false)

        var self = this
        this.loaded = false
        new Promise(function (resolve, reject){
          self.axios
            .get(`/api/grafik_penjualan`, { params: {tanggal: self.tanggal }})
            .then(response => (
              self.chartData = {
                labels: response.data.map(item => item.kode_dc),
                datasets: [
                  {
                    label: `Pembelian ${response.data[0].nama_produk}`,
                    backgroundColor: '#38c172',
                    data: response.data.map(item => item.pembelian),
                  },
                  {
                    label: `Penjualan ${response.data[0].nama_produk}`,
                    backgroundColor: '#3f9ae5',
                    data: response.data.map(item => item.penjualan),
                  }
                ]
              }
            ))
            .catch(error => console.log(error))
          resolve (self.loaded = true)
        })
        .catch(error => console.log(error))
    },
    methods: {
      cariGrafikBaru() {
        this.axios
          .get('api/cari_produk')
          .then(response => (
            this.cari_produk = response.data
          ))
          .catch(error => console.log(error))
          .finally(() => this.loading = false)

          var self = this
          this.loaded = false
          new Promise(function (resolve, reject){
            self.axios
              .get(`/api/grafik_penjualan`, { params: {tanggal: self.tanggal }})
              .then(response => (
                self.chartData = {
                  labels: response.data.map(item => item.kode_dc),
                  datasets: [
                    {
                      label: `Pembelian ${response.data[0].nama_produk}`,
                      backgroundColor: '#38c172',
                      data: response.data.map(item => item.pembelian),
                    },
                    {
                      label: `Penjualan ${response.data[0].nama_produk}`,
                      backgroundColor: '#3f9ae5',
                      data: response.data.map(item => item.penjualan),
                    }
                  ]
                }
              ))
              .catch(error => console.log(error))
            resolve (self.loaded = true)
          })
          .catch(error => console.log(error))
      }
    }
  }
</script>
