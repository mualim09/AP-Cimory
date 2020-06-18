import Home from './components/Landing.vue'
import Login from './components/user/Login.vue'
import Register from './components/user/Register.vue'
import DefaultDashboard from './components/user/Dashboard.vue'
import HoDashboard from './components/ho/Dashboard.vue'
import DcDashboard from './components/dc/Dashboard.vue'
import AdminDashboard from './components/admin/Dashboard.vue'
import MasterProduk from './components/admin/produk/Index.vue'
import CreateProduk from './components/admin/produk/Create.vue'
import EditProduk from './components/admin/produk/Edit.vue'
import MasterSales from './components/admin/sales/Index.vue'
import CreateSales from './components/admin/sales/Create.vue'
import EditSales from './components/admin/sales/Edit.vue'
import MasterDC from './components/admin/dc/Index.vue'
import CreateDC from './components/admin/dc/Create.vue'
import EditDC from './components/admin/dc/Edit.vue'
import MasterAkun from './components/admin/akun/Index.vue'
import CreateAkun from './components/admin/akun/Create.vue'
import EditAkun from './components/admin/akun/Edit.vue'
import MasterHarga from './components/admin/harga/Index.vue'
import CreateHarga from './components/admin/harga/Create.vue'
import EditHarga from './components/admin/harga/Edit.vue'
import MasterLaporanDC from './components/dc/Index.vue'
import CreateTransaksi from './components/dc/Create.vue'
import MasterPembelian from './components/dc/pembelian/Index.vue'
import CreatePembelian from './components/dc/pembelian/Create.vue'
import MasterPenjualan from './components/dc/penjualan/Index.vue'
import CreatePenjualan from './components/dc/penjualan/Create.vue'
import MasterRetur from './components/dc/retur/Index.vue'
import CreateRetur from './components/dc/retur/Create.vue'

export const routes = [
  {
    name: 'home',
    path: '/',
    component: Home
  },
  {
    name: 'login',
    path: '/login',
    component: Login
  },
  {
    name: 'register',
    path: '/register',
    component: Register
  },
  {
    name: 'dashboard',
    path: '/user/dashboard',
    component: DefaultDashboard
  },
  {
    name: 'ho-dashboard',
    path: '/ho/dashboard',
    component: HoDashboard
  },
  {
    name: 'dc-dashboard',
    path: '/dc/dashboard',
    component: DcDashboard
  },
  {
    name: 'admin-dashboard',
    path: '/admin/dashboard',
    component: AdminDashboard
  },
  // Route produk
  {
    name: 'master-produk',
    path: '/master-produk',
    component: MasterProduk
  },
  {
    name: 'create-produk',
    path: '/create-produk',
    component: CreateProduk
  },
  {
    name: 'edit-produk',
    path: '/produk/edit/:id',
    component: EditProduk
  },
  // Route sales
  {
    name: 'master-sales',
    path: '/master-sales',
    component: MasterSales
  },
  {
    name: 'create-sales',
    path: '/create-sales',
    component: CreateSales
  },
  {
    name: 'edit-sales',
    path: '/sales/edit/:id',
    component: EditSales
  },
  // Route DC
  {
    name: 'master-dc',
    path: '/master-dc',
    component: MasterDC
  },
  {
    name: 'create-dc',
    path: '/create-dc',
    component: CreateDC
  },
  {
    name: 'edit-dc',
    path: '/dc/edit/:id',
    component: EditDC
  },
  // Route akun
  {
    name: 'master-akun',
    path: '/master-akun',
    component: MasterAkun
  },
  {
    name: 'create-akun',
    path: '/create-akun',
    component: CreateAkun
  },
  {
    name: 'edit-akun',
    path: '/akun/edit/:id',
    component: EditAkun
  },
  // Route harga
  {
    name: 'master-harga',
    path: '/master-harga',
    component: MasterHarga
  },
  {
    name: 'create-harga',
    path: '/create-harga',
    component: CreateHarga
  },
  {
    name: 'edit-harga',
    path: '/harga/edit/:id',
    component: EditHarga
  },
  // Route transaksi
  {
    name: 'master-laporan-dc',
    path: '/master-laporan-dc',
    component: MasterLaporanDC
  },
  {
    name: 'create-transaksi',
    path: '/create-transaksi',
    component: CreateTransaksi
  },
  // Route pembelian DC
  {
    name: 'master-pembelian',
    path: '/master-pembelian',
    component: MasterPembelian
  },
  {
    name: 'create-pembelian',
    path: '/create-pembelian',
    component: CreatePembelian
  },
  // Route penjualan DC
  {
    name: 'master-penjualan',
    path: '/master-penjualan',
    component: MasterPenjualan
  },
  {
    name: 'create-penjualan',
    path: '/create-penjualan',
    component: CreatePenjualan
  },
  // Route retur DC
  {
    name: 'master-retur',
    path: '/master-retur',
    component: MasterRetur
  },
  {
    name: 'create-retur',
    path: '/create-retur',
    component: CreateRetur
  },
];
export default {

}
