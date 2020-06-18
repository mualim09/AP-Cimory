<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Retur;
use App\Pembelian;
use App\Stok;

class ReturController extends Controller
{
    public function index($kode_dc)
    {
        // Ambil data retur berdasarkan kode_dc
        $retur = Retur::with('dc:dc.id,kode_dc', 'produk:produk.id,nama_produk')
        ->whereHas('dc', function ($query) use ($kode_dc) {
            $query->where('kode_dc', $kode_dc);
        })->get();

        return response()->json($retur);
    }
    // Mengurangi stok terakhir dari tabel stok berdasarkan tanggal stok
    public function update_stok($dc_id, $produk_id, $qty_retur, $tanggal_sjr, $kode_sjr)
    {
        $qty_stok_terakhir = Stok::where('dc_id', $dc_id)->where('produk_id', $produk_id)->orderBy('created_at', 'desc')->first()->qty_stok;
        $qty_stok = $qty_stok_terakhir - $qty_retur;
        $stok = new Stok([
            'dc_id' => $dc_id,
            'tanggal_stok' => $tanggal_sjr,
            'keterangan' => "retur ".$kode_sjr,
            'produk_id' => $produk_id,
            'qty_stok' => $qty_stok,
        ]);
        if ($stok->save()){
          return true;
        }
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'dc_id' => ['required'],
            'tanggal_sjr' => ['required', 'date'],
            'kode_sjr' => ['required'],
            'produk_id' => ['required'],
            'qty_retur' => ['required']
        ]);

        $retur = new Retur($request->all());
        if ($this->update_stok($dc_id = $retur['dc_id'], $produk_id = $retur['produk_id'], $qty_retur = $retur['qty_retur'], $tanggal_sjr = $retur['tanggal_sjr'], $kode_sjr = $retur['kode_sjr'])) {
            $retur->save();
            return response()->json("Sukses ".$retur['kode_transaksi']);
        } else {
            return response()->json("Harap periksa input anda");
        }


    }
}
