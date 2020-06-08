<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Auth;
use Validator;

class UserController extends Controller
{

    public $successStatus = 200;

    public function login(Request $request){
        // if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){
        //     $user = Auth::user();
        //     $success['token'] =  $user->createToken('nApp')->accessToken;
        //     return response()->json(['success' => $success], $this->successStatus);
        // }
        // else{
        //     return response()->json(['error'=>'Unauthorised'], 401);
        // }
        $this->validate($request, [
            'username' => 'required|string', //VALIDASI KOLOM USERNAME
            //TAPI KOLOM INI BISA BERISI EMAIL ATAU USERNAME
            'password' => 'required|string|min:6',
        ]);

        //LAKUKAN PENGECEKAN, JIKA INPUTAN DARI USERNAME FORMATNYA ADALAH EMAIL, MAKA KITA AKAN MELAKUKAN PROSES AUTHENTICATION MENGGUNAKAN EMAIL, SELAIN ITU, AKAN     MENGGUNAKAN USERNAME
        $loginType = filter_var($request->username, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
      
        //TAMPUNG INFORMASI LOGINNYA, DIMANA KOLOM TYPE PERTAMA BERSIFAT DINAMIS BERDASARKAN VALUE DARI PENGECEKAN DIATAS
        $login = [
            $loginType => $request->username,
            'password' => $request->password
        ];
      
        //LAKUKAN LOGIN
        if (Auth::attempt($login)) {
            //JIKA BERHASIL, MAKA REDIRECT KE HALAMAN HOME
            // return redirect()->route('home');
            $token = Auth::user()->createToken('nApp')->accessToken;
            $username = Auth::user()->username;
            $role = Auth::user()->role['role'];
            $status_auth = Auth::check();
            return response()->json(['token' => $token, 'username' => $username, 'role' => $role, 'status' => $status_auth]);
        }
        //JIKA SALAH, MAKA KEMBALI KE LOGIN DAN TAMPILKAN NOTIFIKASI 
        return redirect()->route('/')->with(['error' => 'Email/Password salah!']);
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 401);            
        }

        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['token'] =  $user->createToken('nApp')->accessToken;
        $success['name'] =  $user->name;

        return response()->json(['success'=>$success], $this->successStatus);
    }   

    public function logout()
    {   
	    if (Auth::check()) {
            Auth::logout();
            // $status_auth = Auth::check();
	        return response()->json(['success' =>'logout_success']); 
	    } else {
	        return response()->json(['error' => 'anda tidak login']);
	    }
    }
    
    public function details()
    {
        $user = Auth::user();
        return response()->json(['success' => $user], $this->successStatus);
    }
}