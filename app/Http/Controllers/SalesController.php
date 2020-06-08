<?php

namespace App\Http\Controllers;

use App\Sales;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SalesController extends Controller
{
  public function __construct()
  {   
    // $this->middleware('auth:api', ['except' => ['checkAuth', 'index', 'category', 'show', 'ambil_csrf']]);
  }

  public function index()
  {
    $sales = Sales::all()->toArray();

    return response()->json([
      'sales' => array_reverse($sales),
      'success' => 'sukses ambil data sales'
    ]);
  }

  public function store(Request $request)
  {
    $sales = new Sales([
      'nama_sales' => $request->nama_sales,
      'kode_sales' => $request->kode_sales
    ]);

    if ($sales->save()) {
      return response()->json([
        'success' => "sukses membuat sales ".$sales['nama_sales'],
        'sales' => $sales
      ]);
    }
  }

  public function edit($id)
  {
    $sales = Sales::find($id)->toArray();
    return response()->json($sales);
  }

  public function update(Request $request, $id)
  {
    $sales = Sales::find($id);
    $sales->update($request->all());

    return response()->json("sukses update sales ".$sales['nama_sales']);
  }

  public function destroy($id)
  {
    $sales = Sales::find($id);
    $sales->delete();

    return response()->json([
      'sales' => $sales,
      'success' => "sukses menghapus blog ".$sales['nama_sales']
    ]);
  }
}
