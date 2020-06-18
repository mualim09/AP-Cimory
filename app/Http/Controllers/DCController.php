<?php

namespace App\Http\Controllers;

use App\DC;
use App\Sales;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Builder;

class DCController extends Controller
{
  public function __construct()
  {   
    // $this->middleware('auth:api', ['except' => ['checkAuth', 'index', 'category', 'show', 'ambil_csrf']]);
  }

  public function index()
  {
    $dc = DC::all()->toArray();

    return response()->json([
      'dc' => array_reverse($dc),
      'success' => 'sukses ambil data dc'
    ]);
  }

  public function store(Request $request)
  {
    $dc = new DC([
      'kode_dc' => $request->kode_dc,
      'nama_dc' => $request->nama_dc
    ]);

    if ($dc->save()) {
      return response()->json([
        'success' => "sukses membuat dc ".$dc['kode_dc'],
        'dc' => $dc
      ]);
    }
  }

  public function edit($id)
  {
    $dc = DC::find($id)->toArray();
    return response()->json($dc);
  }

  public function update(Request $request, $id)
  {
    $dc = DC::find($id);
    $dc->update($request->all());

    return response()->json("sukses update dc ".$dc['kode_dc']);
  }

  public function destroy($id)
  {
    $dc = DC::find($id);
    $dc->delete();

    return response()->json([
      'dc' => $dc,
      'success' => "sukses menghapus dc ".$dc['kode_dc']
    ]);
  }

  public function id_sales(Request $request)
  {
    $username = $request->username;
    // Hasil pluck adalah single array
    $kode_dc = User::join('dc', 'users.dc_id', '=', 'dc.id')
    ->where('users.username', $username)
    ->select('dc.kode_dc')
    ->pluck('dc.kode_dc');
    $list_sales = Sales::where('kode_sales', 'like', "$kode_dc[0]%")->select('id', 'kode_sales')->get();
    //$no_sales_max = Sales::where('kode_sales', 'like', "$dc_terpilih%")->max('kode_sales');
    return response()->json($list_sales);
  }

  public function kode_dc()
  {
    $kode_dc = DC::select('id', 'kode_dc', 'nama_dc')->get()->toArray();
    return response()->json($kode_dc);
  }

  public function cari_dc()
  {
    $cari_dc = DC::select('id', 'kode_dc', 'nama_dc')->get();
    return response()->json($cari_dc);
  }
}
