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
    	return $this->hasOne('App\User', 'dc_id');
    }
}
