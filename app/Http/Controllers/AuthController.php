<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Models\User;
use Illuminate\Validation\ValidationException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;

class AuthController extends Controller
{
    public function register(RegisterRequest $request) {
        $data = $request->validated();
        $data['password']=Hash::make($data['password']);

        if ($request->hasFile('profile_picture')) {
            $data['profile_picture'] = $request->file('profile_picture')->store('profiles', 'public'); 
        }

        
        $user = User::create($data);

        Log::info('User registered successfully', ['user_id' => $user->id]);

        return response()->json([
            'user' => $user,
            'photo_url' => isset($data['profile_picture']) ? asset("storage/{$data['profile_picture']}") : null,
            'token' => $user->createToken('auth_token')->plainTextToken
        ], 201);
    }

    public function login(LoginRequest $request) {
        
        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }

        return response()->json([
            'user' => $user,
            'token' => $user->createToken('auth_token', [$user->role])->plainTextToken
        ], 200);
    }

    public function logout(Request $request) {
        $request->user()->tokens()->delete();
        return response()->json(['message' => 'Logged out'], 200);
    }

    public function me(Request $request) {
        return response()->json([
            'user' => $request->user(),
        ], 200);
    }
}
