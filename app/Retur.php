<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Retur extends Model
{
    protected $table = 'retur';
    protected $fillable = ['dc_id', 'tanggal_sjr', 'kode_sjr', 'produk_id', 'qty_retur'];

    public $timestamps = true;
    use SoftDeletes;
    
    public function dc() {
    	return $this->belongsTo('App\DC');
    }
}
