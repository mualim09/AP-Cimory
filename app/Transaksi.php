<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Transaksi extends Model
{
    protected $table = 'transaksi_dc';
    protected $fillable = ['id_produk', 'id_sales', 'id_dc', 'qty_pembelian', 'qty_penjualan', 'qty_retur', 'qty_stock'];

    public $timestamps = true;
    use SoftDeletes;
    
    public function produk() {
    	return $this->hasMany('App\Produk');
    }

    public function sales() {
    	return $this->hasMany('App\Sales');
    }

    public function dc() {
    	return $this->hasMany('App\DC');
    }
}
