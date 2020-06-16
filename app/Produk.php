<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Produk extends Model
{
    protected $table = 'produk';
    protected $fillable = ['kode_produk', 'nama_produk'];

    public $timestamps = true;
    use SoftDeletes;
    
    public function harga() {
        return $this->hasMany('App\Harga');
    }

    public function pembelian() {
        return $this->hasMany('App\Pembelian');
    }
}
