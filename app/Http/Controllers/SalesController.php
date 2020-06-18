<?php

namespace App\Http\Controllers;

use App\Sales;
use App\DC;
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

  public function id_dc()
  {
    $dc= DC::select('id', 'kode_dc', 'nama_dc')->get();
    return response()->json($dc);
  }

  public function cari_sales($kode_dc)
  {
    $cari_sales = Sales::where('kode_sales', 'like', "$kode_dc%")->select('id', 'kode_sales')->get();
    return response()->json($cari_sales);
  }

  public function buat_kode_sales(Request $request)
  {
    // Ambil data DC, karena sales ini dibuat untuk dilokasi DC mana
    $dc_terpilih = $request->dc_terpilih;
    // Ambil no urut sales terakhir jika DC11-05 maka ambil angka 05 untuk di increment
    // $no_sales_terakhir = Sales::where('kode_sales', 'like', "$dc_terpilih%")->select(\DB::raw('max(RIGHT(kode_sales, 2)) as urutan_terakhir'))->value('urutan_terakhir');
    // $no_sales_terakhir = Sales::where('kode_sales', 'like', "$dc_terpilih%")->select(\DB::raw('SUBSTRING_INDEX(kode_sales,-,-1) as urutan_terakhir'))->value('urutan_terakhir');
    $no_sales_max = Sales::where('kode_sales', 'like', "$dc_terpilih%")->max('kode_sales');
    // Jika $no_sales_terakhir == null atau belum ada sales
    $no_sales_terakhir = substr($no_sales_max, strpos($no_sales_max, "-") + 1);
    if ($no_sales_terakhir == null) {
    // Buat sales dari awal (1)
      $no_sales_terakhir = 1;
    } else {
    // Jika $no_sales_terakhir !== null, tingkatkan 1 angka (increment) dari $no_sales_terakhir
      $no_sales_terakhir++;
    }
    // Karena $no_sales_terakhir sekarang integer, tetapi kode_sales string, maka ubah ke string
    // Karena integer tidak ada 0 diawal, jika $no_sales_terakhir++ < 10 tambahkan 0 didepan
    if ($no_sales_terakhir < 10) {
      $no_sales_baru = "0{$no_sales_terakhir}";
    } else {
      $no_sales_baru = "{$no_sales_terakhir}";
    }
    // Gabungkan $dc_terpilih dengan $no_sales_baru, jangan lupa gunakan -
    $kode_sales_baru = $dc_terpilih."-".$no_sales_baru;
    // Kirim kode baru sebagai json
    return response()->json($kode_sales_baru);
  }
}
