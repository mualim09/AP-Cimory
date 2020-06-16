<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Sales extends Model
{
    protected $table = 'sales';
    protected $fillable = ['nama_sales'];

    public $timestamps = true;
    use SoftDeletes;

    public function penjualan() {
    	return $this->hasMany('App\Penjualan');
    }
}
