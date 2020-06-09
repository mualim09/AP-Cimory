<?php

namespace App\Http\Controllers;

use App\DC;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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

  public function kode_dc()
  {
    $kode_dc = DC::select('id', 'kode_dc', 'nama_dc')->get()->toArray();
    return response()->json($kode_dc);
  }
}
