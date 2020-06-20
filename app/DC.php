<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DC extends Model
{
    protected $table = 'dc';
    protected $fillable = ['kode_dc', 'nama_dc'];

    public $timestamps = true;
    use SoftDeletes;

    public function user() {
    	return $this->hasOne('App\User');
    }

    public function pembelian() {
    	return $this->hasMany('App\Pembelian');
    }

    public function penjualan() {
    	return $this->hasMany('App\Penjualan');
    }

    public function retur() {
    	return $this->hasMany('App\Retur');
    }

    public function stok() {
    	return $this->hasMany('App\Stok');
    }

    public function laporan() {
    	return $this->hasMany('App\Laporan');
    }
}
