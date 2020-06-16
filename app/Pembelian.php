<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Pembelian extends Model
{
    protected $table = 'pembelian';
    protected $fillable = ['dc_id', 'tanggal_pembelian', 'no_invoice', 'produk_id', 'qty_pembelian'];

    public $timestamps = true;
    use SoftDeletes;
    
    public function produk() {
    	return $this->hasMany('App\Produk');
    }

    public function sales() {
    	return $this->hasMany('App\Sales');
    }

    public function dc() {
    	return $this->belongsTo('App\DC');
    }

    public function produk() {
        return $this->belongsTo('App\Produk');
    }
}
