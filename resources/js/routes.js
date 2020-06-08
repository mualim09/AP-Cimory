import Home from './components/Landing.vue';
import Login from './components/user/Login.vue';
import Register from './components/user/Register.vue';
import DefaultDashboard from './components/user/Dashboard.vue';
import HoDashboard from './components/ho/Dashboard.vue';
import DcDashboard from './components/dc/Dashboard.vue';
import AdminDashboard from './components/admin/Dashboard.vue';
import MasterProduk from './components/admin/produk/Index.vue';
import CreateProduk from './components/admin/produk/Create.vue';
import EditProduk from './components/admin/produk/Edit.vue';
import MasterSales from './components/admin/sales/Index.vue';
import CreateSales from './components/admin/sales/Create.vue';
import EditSales from './components/admin/sales/Edit.vue';

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
];
export default {
    
}