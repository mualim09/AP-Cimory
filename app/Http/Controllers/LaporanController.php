<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Laporan;
use App\Penjualan;

class LaporanController extends Controller
{
    public function index($kode_dc)
    {
      // Ambil data berdasarkan kode_dc
      $laporan = Laporan::with('dc:dc.id,kode_dc', 'produk:produk.id,nama_produk')
      ->whereHas('dc', function ($query) use ($kode_dc) {
          $query->where('kode_dc', $kode_dc);
      })->get();
      return response()->json($laporan);
    }

    public function harian($tanggal, $produk_id)
    {
      if ($tanggal == 'all' && $produk_id == 'all') {
        $laporan = Laporan::with('dc:dc.id,kode_dc', 'produk:produk.id,nama_produk')->get();
      } else {
        $laporan = Laporan::with('dc:dc.id,kode_dc', 'produk:produk.id,nama_produk')->where('tanggal', $tanggal)->where('produk_id', $produk_id)->get();
      }
      return response()->json($laporan);
    }

    public function kompensasi(Request $request)
    {
      $tanggal_awal = $request->tanggal_awal;
      $tanggal_akhir = $request->tanggal_akhir;

      if ($tanggal_awal == null && $tanggal_akhir == null) {
        $laporan = Laporan::groupBy('laporan.produk_id', 'produk.nama_produk', 'harga.harga_dasar', 'harga.harga_jual')
        ->join('harga', 'laporan.produk_id', '=', 'harga.id')
        ->join('produk', 'laporan.produk_id', '=', 'produk.id')
        ->select('produk.nama_produk')
        ->selectRaw('sum(laporan.qty_pembelian) as pembelian, sum(laporan.qty_pembelian) * harga.harga_dasar as harga_dasar, sum(laporan.qty_penjualan) as penjualan, sum(laporan.qty_penjualan) * harga.harga_jual as harga_jual, sum(laporan.qty_penjualan) * harga.harga_jual - sum(laporan.qty_pembelian) * harga.harga_dasar as kompensasi')
        ->get();
      } else {
        $laporan = Laporan::groupBy('laporan.produk_id', 'produk.nama_produk', 'harga.harga_dasar','harga.harga_jual')
        ->whereBetween('tanggal', [$tanggal_awal, $tanggal_akhir])
        ->join('harga', 'laporan.produk_id', '=', 'harga.id')
        ->join('produk', 'laporan.produk_id', '=', 'produk.id')
        ->select('produk.nama_produk')
        ->selectRaw('sum(laporan.qty_pembelian) as pembelian, sum(laporan.qty_pembelian) * harga.harga_dasar as harga_dasar, sum(laporan.qty_penjualan) as penjualan, sum(laporan.qty_penjualan) * harga.harga_jual as harga_jual, sum(laporan.qty_penjualan) * harga.harga_jual - sum(laporan.qty_pembelian) * harga.harga_dasar as kompensasi')
        ->get();
      }
      return response()->json($laporan);
    }

    public function grafik_penjualan(Request $request)
    {
      $tanggal = $request->tanggal;
      if ($tanggal == null) {
        $tanggal = date('Y-m-d');
      }
        $grafik_penjualan = Laporan::groupBy('dc.kode_dc', 'produk.nama_produk', 'laporan.qty_penjualan', 'laporan.qty_pembelian')
        ->join('produk', 'laporan.produk_id', '=', 'produk.id')
        ->join('dc', 'laporan.dc_id', '=', 'dc.id')
        ->where('tanggal', $tanggal)
        ->select('dc.kode_dc', 'produk.nama_produk')
        ->selectRaw('sum(laporan.qty_penjualan) as penjualan, sum(laporan.qty_pembelian) as pembelian')
        ->get();
      return response()->json($grafik_penjualan);
    }
}
