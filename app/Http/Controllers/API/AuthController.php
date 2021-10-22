<?php

namespace App\Http\Controllers\API;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Classes\Errors;
use Validator;
use Hash;
use Auth;

class AuthController extends Controller
{
    public function login(Request $request, Validator $validator)
    {
        // Check login request data
        $errors = Errors::getUserLoginDataErrors($request, $validator);
        
        if (count($errors['errors']) > 0) {
            return response()->json($errors, 422);
        }
   
        // Check if user exists in database
        $user = User::where('email', $request->email)->first();

        // Login user to api
        if ($user) {
            if (Hash::check($request->password, $user->password)) {
                $response['first_name']  = $user->first_name;
                $response['last_name']  = $user->last_name;
                $response['email']  = $user->email;
                $response['token'] = $user->createToken('TripApi')->accessToken;
                return response()->json($response, 200);
            } else {
                $response = ["error" => "Password mismatch."];
                return response()->json($response, 422);
            }
        } else {
            $response = ["error" =>'User does not exist.'];
            return response()->json($response, 422);
        }
    }

    public function logout(Request $request) 
    {
        $user = Auth::user()->token();
        $user->revoke();
        $response = ['message' => 'You have been successfully logged out.'];
        return response($response, 200);
    }
}