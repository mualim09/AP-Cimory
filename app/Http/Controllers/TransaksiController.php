<?php

namespace App\Http\Controllers;

use App\Transaksi;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TransaksiController extends Controller
{
  public function __construct()
  {   
    // $this->middleware('auth:api', ['except' => ['checkAuth', 'index', 'category', 'show', 'ambil_csrf']]);
  }

  public function index()
  {
    // $transaksi = Transaksi::all()->toArray();
    $user_id = Auth::user()->id;
    $id_dc = User::where('id', $user_id)->pluck('dc_id');
    $transaksi = Transaksi::join('sales', 'transaksi_dc.id_sales', '=', 'sales.id')
      ->join('produk', 'transaksi_dc.id_produk', '=', 'produk.id')
      ->join('dc', 'transaksi_dc.id_dc', '=', 'dc.id')
      ->where('transaksi_dc.id_dc', $id_dc)
      ->select('transaksi_dc.id', 'sales.kode_sales', 'produk.nama_produk', 'dc.kode_dc', 'transaksi_dc.qty_pembelian', 'transaksi_dc.qty_penjualan', 'transaksi_dc.qty_retur', 'transaksi_dc.qty_stock', 'transaksi_dc.created_at', 'transaksi_dc.updated_at')
      ->get();
      return response()->json([
      'transaksi' => $transaksi,
      'success' => 'sukses ambil data transaksi'
    ]);
  }

  public function store(Request $request)
  {
    $this->validate($request, [
      'id_sales' => 'required',
      'id_produk' => 'required',
      // 'id_dc' => 'required',
      'qty_pembelian' => 'required',
      'qty_penjualan' => 'required',
      'qty_retur' => 'required',
      'qty_stock' => 'required'
    ]);

    $transaksi = new Transaksi([
      'id_sales' => $request->id_sales,
      'id_produk' => $request->id_produk,
      'id_dc' => Auth::user()->dc_id,
      'qty_pembelian' => $request->qty_pembelian,
      'qty_penjualan' => $request->qty_penjualan,
      'qty_retur' => $request->qty_retur,
      'qty_stock' => $request->qty_stock
    ]);

    if ($transaksi->save()) {
      return response()->json([
        'success' => "sukses membuat transaksi ",
        'transaksi' => $transaksi
      ]);
    }
  }

  public function edit($id)
  {
    $transaksi = Transaksi::find($id)->toArray();
    return response()->json($transaksi);
  }

  public function update(Request $request, $id)
  {
    $transaksi = Transaksi::find($id);
    $transaksi->update($request->all());

    return response()->json("sukses update transaksi ".$transaksi['kode_dc']);
  }

  public function destroy($id)
  {
    $transaksi = Transaksi::find($id);
    $transaksi->delete();

    return response()->json([
      'transaksi' => $transaksi,
      'success' => "sukses menghapus transaksi ".$transaksi['kode_dc']
    ]);
  }

  public function kode_dc()
  {
    $kode_dc = Transaksi::select('id', 'kode_dc', 'nama_dc')->get()->toArray();
    return response()->json($kode_dc);
  }
}
