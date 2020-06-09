<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Sales extends Model
{
    protected $table = 'sales';
    protected $fillable = ['nama_sales', 'kode_sales'];

    public $timestamps = true;
    use SoftDeletes;

    public function harga() {
        return $this->hasMany('App\Harga');
    }
}
