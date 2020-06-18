<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Penjualan;
use App\Pembelian;
use App\Stok;

class PenjualanController extends Controller
{
    public function index($kode_dc)
    {
        // Ambil data penjualan berdasarkan kode_dc
        $penjualan = Penjualan::with('dc:dc.id,kode_dc', 'produk:produk.id,nama_produk', 'sales:sales.id,kode_sales')
        ->whereHas('dc', function ($query) use ($kode_dc) {
            $query->where('kode_dc', $kode_dc);
        })->get();

        return response()->json($penjualan);
    }
    // Mengurangi stok berdasarkan data pembelian (tanggal_pembelian = tanggal_penjualan, produk_id)
    public function update_stok($dc_id, $tanggal_penjualan, $kode_transaksi, $produk_id, $qty_penjualan)
    {
        $qty_pembelian = Pembelian::where('dc_id', $dc_id)->where('produk_id', $produk_id)->where('tanggal_pembelian', $tanggal_penjualan)->first()->qty_pembelian;
        $qty_stok = $qty_pembelian - $qty_penjualan;
        $stok = new Stok([
            'dc_id' => $dc_id,
            'tanggal_stok' => $tanggal_penjualan,
            'keterangan' => "penjualan ".$kode_transaksi,
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
            'tanggal_penjualan' => ['required', 'date'],
            'kode_transaksi' => ['required'],
            'sales_id' => ['required'],
            'produk_id' => ['required'],
            'qty_penjualan' => ['required'],
            'nilai_penjualan' => ['required']
        ]);

        $penjualan = new Penjualan($request->all());
        if ($this->update_stok($dc_id = $penjualan['dc_id'], $tgl_penjualan = $penjualan['tanggal_penjualan'], $kode_transaksi = $penjualan['kode_transaksi'], $produk_id = $penjualan['produk_id'], $qty_penjualan = $penjualan['qty_penjualan'])) {
            $penjualan->save();
            return response()->json("Sukses ".$penjualan['kode_transaksi']);
        } else {
            return response()->json("Harap periksa input anda, pastikan tanggal penjualan = tanggal pembelian produk tersebut");
        }


    }
}
