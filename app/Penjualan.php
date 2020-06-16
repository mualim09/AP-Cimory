<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Penjualan extends Model
{
    protected $table = 'penjualan';
    protected $fillable = ['dc_id', 'tanggal_penjualan', 'kode_transaksi', 'sales_id', 'qty_penjualan', 'nilai_penjualan'];

    public $timestamps = true;
    use SoftDeletes;
    
    public function produk() {
    	return $this->hasMany('App\Produk');
    }

    public function sales() {
    	return $this->belongsTo('App\Sales');
    }

    public function dc() {
    	return $this->belongsTo('App\DC');
    }
}
