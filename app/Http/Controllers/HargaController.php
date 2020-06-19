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
    $harga = Harga::with('produk:produk.id,produk_id,nama_produk')->get();

    return response()->json([
      'harga' => $harga,
      'success' => 'sukses ambil data harga'
    ]);
  }

  public function store(Request $request)
  {
    $harga = new Harga([
      'produk_id' => $request->produk_id,
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

    return response()->json("sukses update harga ".$harga['produk_id']);
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

  public function id_produk()
  {
    $produk = Produk::select('id', 'nama_produk')->get();
    return response()->json($produk);
  }
}
