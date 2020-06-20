<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Laporan;

class LaporanController extends Controller
{
    public function index($kode_dc)
    {
        // Ambil data stok berdasarkan kode_dc
        $laporan = Laporan::with('dc:dc.id,kode_dc', 'produk:produk.id,nama_produk')
        ->whereHas('dc', function ($query) use ($kode_dc) {
            $query->where('kode_dc', $kode_dc);
        })->get();

        return response()->json($laporan);
    }
}
