<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pembelian;

class PembelianController extends Controller
{
    public function index($kode_dc)
    {
        // Ambil data pembelian berdasarkan kode_dc
        $pembelian = Pembelian::with('dc:dc.id,kode_dc', 'produk:produk.id,nama_produk')
        ->whereHas('dc', function ($query) use ($kode_dc) {
            $query->where('kode_dc', $kode_dc);
        })->get();

        return response()->json($pembelian);
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'dc_id' => ['required'],
            'tanggal_pembelian' => ['required', 'date'],
            'no_invoice' => ['required'],
            'produk_id' => ['required'],
            'qty_pembelian' => ['required']
        ]);

        $pembelian = new Pembelian($request->all());
        $pembelian->save();

        return response()->json("Sukses ".$pembelian);
    }
}
