<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use AktifitasHelp;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        //dd(Auth::user()->username);
        return response()->json("This is home");
        // $userLogin = Auth::user()->username;
        // AktifitasHelp::simpanAktifitas($aktifitas = "sukses login $userLogin");
        // return view('home');
        
    }
}
