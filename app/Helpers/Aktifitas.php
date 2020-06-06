<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
Use App\AktifitasModel;

class Aktifitas {
    public static function simpanAktifitas($aktifitas) {
        $aktifitasBaru = new AktifitasModel;
        $aktifitasBaru->user_id = Auth::user()->id;
        $aktifitasBaru->aktifitas = $aktifitas;

        if ($aktifitasBaru->save()) {
        	Log::info('aktifitas '.$aktifitasBaru->user_id. ' adalah '. $aktifitasBaru->aktifitas);
        }
    }
}