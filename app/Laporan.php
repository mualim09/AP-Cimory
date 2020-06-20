<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Laporan extends Model
{
    protected $table = 'laporan';
    protected $fillable = ['dc_id', 'tanggal', 'produk_id', 'qty_pembelian', 'qty_penjualan', 'qty_retur', 'qty_stok'];

    public $timestamps = true;
    use SoftDeletes;

    public function dc() {
    	return $this->belongsTo('App\DC');
    }

    public function produk() {
    	return $this->belongsTo('App\Produk');
    }
}
