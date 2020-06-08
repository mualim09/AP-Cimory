<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Produk extends Model
{
    protected $table = 'produk';
    protected $fillable = ['nama_produk', 'keterangan'];

    public $timestamps = true;
    use SoftDeletes;
    // public function user() {
    // 	return $this->belongsTo('App\User');
    // }
}
