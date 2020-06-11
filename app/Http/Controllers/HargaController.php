<?php

namespace App\Http\Controllers;

use App\Harga;
use App\Sales;
use App\Produk;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HargaController extends Controller
{
  public function __construct()
  {   
    // $this->middleware('auth:api', ['except' => ['checkAuth', 'index', 'category', 'show', 'ambil_csrf']]);
  }

  public function index()
  {
    $harga = Harga::join('produk', 'harga.id_produk', '=', 'produk.id')
      ->join('sales', 'harga.id_sales', '=', 'sales.id')
      ->select('harga.id', 'produk.nama_produk', 'sales.nama_sales', 'harga.harga_dasar', 'harga.harga_jual', 'harga.created_at', 'harga.updated_at')
      ->get();

    return response()->json([
      'harga' => $harga,
      'success' => 'sukses ambil data harga'
    ]);
  }

  public function store(Request $request)
  {
    $harga = new Harga([
      'id_sales' => $request->id_sales,
      'id_produk' => $request->id_produk,
      'harga_dasar' => $request->harga_dasar,
      'harga_jual' => $request->harga_jual
    ]);

    if ($harga->save()) {
      return response()->json([
        'success' => "sukses membuat harga ".$harga['kode_dc'],
        'harga' => $harga
      ]);
    }
  }

  public function edit($id)
  {
    $harga = Harga::find($id)->toArray();
    return response()->json($harga);
  }

  public function update(Request $request, $id)
  {
    $harga = Harga::find($id);
    $harga->update($request->all());

    return response()->json("sukses update harga ".$harga['id_produk']);
  }

  public function destroy($id)
  {
    $harga = Harga::find($id);
    $harga->delete();

    return response()->json([
      'harga' => $harga,
      'success' => "sukses menghapus harga ".$harga['id_produk']
    ]);
  }

  public function id_sales()
  {
    $sales = Sales::select('id', 'nama_sales')->get()->toArray();
    return response()->json($sales);
  }

  public function id_produk()
  {
    $produk = Produk::select('id', 'nama_produk')->get();
    return response()->json($produk);
  }
}
