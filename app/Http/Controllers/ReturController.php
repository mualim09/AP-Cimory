<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Retur;
use App\Pembelian;
use App\Stok;
use App\Laporan;

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

    public function update_laporan($dc_id, $tanggal_sjr, $produk_id, $qty_retur)
    {
        // Cari data laporan yang akan diupdate
        $laporan = Laporan::where('dc_id', $dc_id)->where('produk_id', $produk_id)->orderBy('created_at', 'desc')->first();
        // Jika tanggal laporan terakhir/yang ada == tanggal_penjualan, update stok laporan tersebut. Berarti pembelian penjualan dan retur dihari yang sama
        if ($laporan->tanggal == $tanggal_sjr) {
          $laporan->qty_retur = $qty_retur;
          $laporan->qty_stok = $laporan->qty_pembelian - $laporan->qty_penjualan - $qty_retur;
          if ($laporan->save()) {
            return true;
          }
        } else {
        $stok = $laporan->qty_stok;
        // Jika tanggal laporan terakhir != tanggal_penjualan, buat row laporan baru, artinya tidak ada pembelian dan penjualan tapi ada retur
        $new_laporan = new Laporan([
          'dc_id' => $dc_id,
          'tanggal' => $tanggal_sjr,
          'produk_id' => $produk_id,
          'qty_pembelian' => 0,
          'qty_penjualan' => 0,
          'qty_stok' => number_format($laporan->qty_stok) - number_format($qty_retur)
        ]);
        if ($new_laporan->save()) {
          return true;
        }
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
            $this->update_laporan($dc_id = $retur['dc_id'], $produk_id = $retur['produk_id'], $qty_retur = $retur['qty_retur'], $tanggal_sjr = $retur['tanggal_sjr'], $kode_sjr = $retur['kode_sjr']);
            $retur->save();
            return response()->json("Sukses ".$retur['kode_transaksi']);
        } else {
            return response()->json("Harap periksa input anda");
        }


    }
}
