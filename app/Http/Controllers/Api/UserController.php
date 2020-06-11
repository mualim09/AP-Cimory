<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Auth;
use Validator;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{

    public $successStatus = 200;
    
    public function index()
    {
        // $akun = User::all()->toArray();
        $akun = User::join('dc', 'users.dc_id', '=', 'dc.id')
            ->join('role', 'users.role_id', '=', 'role.id')
            ->select('users.id', 'users.name', 'users.username', 'role.role', 'dc.kode_dc', 'users.created_at', 'users.updated_at')
            ->get();
        // $akun = User::doesntHave('dc_id')->orWhereHas('dc_id', function($query) {
        //     $query->join('dc', 'users.dc_id', '=', 'dc.id')
        //     ->join('role', 'users.role_id', '=', 'role.id')
        //     ->select('users.id', 'users.name', 'users.username', 'role.role', 'dc.kode_dc', 'users.created_at', 'users.updated_at')
        //     ->get();
        // });
        return response()->json([
        'akun' => $akun,
        'success' => 'sukses ambil data akun'
        ]);
    }

    public function edit($id)
    {
        $akun = User::find($id)->toArray();
        return response()->json($akun);
    }

    public function update(Request $request, $id)
    {
        $akun = User::find($id);
        $input = $request->all();
        $input['password'] = Hash::make($input['password']);
        $akun->update($input);

        return response()->json("sukses update akun ".$akun['username']);
    }

    public function login(Request $request){
        // Validasi username dan password
        $this->validate($request, [
            'username' => 'required|string',
            'password' => 'required|string|min:6',
        ]);
        // $validator = $request->validateWithBag('post', [
        //     'username' => ['required', 'string', 'max:50'],
        //     'password' => ['required' ,'string', 'min:6'],
        // ]);
        // if ($validator->fails()) {
        //     $errorValidator = $validator->messages()->get('*');
        // }
        // $errors = $$validator->messages()->get('*');
        // Otomatis tipe login dengan username atau email, keduanya bisa walaupun form input username
        $loginType = filter_var($request->username, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
      
        // Simpan informasi loginnya
        $login = [
            $loginType => $request->username,
            'password' => $request->password
        ];
      
        // Proses login
        if (Auth::attempt($login)) {
            // Jika berhasil berikan respon username, role dan token yang akan disimpan pada state vuex dan localStorage rowser
            $token = Auth::user()->createToken('nApp')->accessToken;
            $username = Auth::user()->username;
            $role = Auth::user()->role['role'];
            $status_auth = Auth::check();
            return response()->json(['token' => $token, 'username' => $username, 'role' => $role, 'status' => $status_auth]);
        } else {
            return response()->json(['error' => 'username atau password salah'], 401);
        }
    }

    public function register(Request $request)
    {
        // Validasi semua form input
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'username' => 'alpha_dash|required|unique:users',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed|min:6',
            // 'password-confirm' => 'required|same:password',
            'dc_id'
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 401);            
        }

        // Proses registrasi 
        $input = $request->all();
        $input['password'] = Hash::make($input['password']);
        // Buat akun baru
        $user = User::create($input);
        $success['token'] =  $user->createToken('nApp')->accessToken;
        $success['name'] =  $user->name;

        return response()->json(['success'=>$success], $this->successStatus);
    }   

    public function logout()
    {   
	    if (Auth::check()) {
            Auth::logout();
	        return response()->json(['success' =>'logout_success']); 
	    } else {
	        return response()->json(['error' => 'anda tidak login']);
	    }
    }
    
    public function destroy($id)
    {
        $akun = User::find($id);
        $akun->delete();

        return response()->json([
            'akun' => $akun,
            'success' => "sukses menghapus akun ".$akun['username']
        ]);
    }
}