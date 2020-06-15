<?php

namespace App\Http\Controllers;

use App\Produk;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProdukController extends Controller
{
  public function __construct()
  {   
    //$this->middleware('auth:api', ['except' => ['ambil_csrf']]);
  }

  public function index()
  {
    $produk = Produk::all()->toArray();

    return response()->json([
      'produk' => array_reverse($produk),
      'success' => 'sukses ambil data produk'
    ]);
  }

  public function store(Request $request)
  {
    $produk = new Produk([
      'kode_produk' => $request->kode_produk,
      'nama_produk' => $request->nama_produk
    ]);

    if ($produk->save()) {
      return response()->json([
        'success' => "sukses membuat produk ".$produk['nama_produk'],
        'produk' => $produk
      ]);
    }
  }

  public function edit($id)
  {
    $produk = Produk::find($id)->toArray();
    return response()->json($produk);
  }

  public function update(Request $request, $id)
  {
    $produk = Produk::find($id);
    $produk->update($request->all());

    return response()->json("sukses update produk ".$produk['nama_produk']);
  }

  public function destroy($id)
  {
    $produk = Produk::find($id);
    $produk->delete();

    return response()->json([
      'produk' => $produk,
      'success' => "sukses menghapus blog ".$produk['nama_produk']
    ]);
  }
}
