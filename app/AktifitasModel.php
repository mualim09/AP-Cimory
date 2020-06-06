<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AktifitasModel extends Model
{
    protected $table = "aktifitas";
    protected $fillable = ['user_id', 'aktifitas'];
    public $timestamps = true;

    // public function pasar()
    // {
    // 	return $this->belongsTo('App\PasarModel');
    // }

    public function user() {
    	return $this->belongsTo('App\User');
    }
}
