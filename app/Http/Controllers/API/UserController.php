<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\API\User;
use App\Classes\Errors;
use Validator;
use Hash;

class UserController extends Controller
{
    public function getUsers()
    {
        $user = User::all();
        return response()->json($user, 200); 
    }

    public function store(Request $request, Validator $validator)
    {
        // Check user request data
        $errors = Errors::getUserDataErrors($request, $validator);

        if (count($errors['errors']) > 0) {
            return response()->json($errors, 422);
        }
    
        // Save user data to database
        $user = $request->all();
        $user['password'] = Hash::make($user['password']);
        $user = User::create($user);

        $data['first_name'] =  $user->first_name;
        $data['last_name'] =  $user->last_name;
        $data['email'] = $user->email;
        $data['token'] =  $user->createToken('TripApi')->accessToken; 

        $response = [ 
            "message" => "User was successfully added.",
            "data" => $data
        ];

        return response()->json($response, 201); 
    }

    public function show($id)
    {    
        // Check if user exists
        $user = User::find($id);
        $findUserError = Errors::getFindUserError($user);

        if (count($findUserError) > 0) {
            return response()->json($findUserError, 422);
        }

        return response()->json($user, 200); 
    }

    public function update(Request $request, Validator $validator, $id)
    {
        // Check user request data
        $errors = Errors::getUserDataErrors($request, $validator);

        if (count($errors['errors']) > 0) {
            return response()->json($errors, 422);
        }

        // Check if user exists
        $user = User::find($id);
        $findUserError = Errors::getFindUserError($user);

        if (count($findUserError) > 0) {
            return response()->json($findUserError, 422);
        }

        // Update user data to database
        $data = [
            'first_name'=> $request->first_name,
            'last_name'=>  $request->last_name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ];
        $user->update($data);

        $response = [ "message" => "User was successfully updated."];
        return response()->json($response, 200); 
    }

    public function destroy($id)
    {
        // Check if user exists
        $user = User::find($id);
        $findUserError = Errors::getFindUserError($user);

        if (count($findUserError) > 0) {
            return response()->json($findUserError, 422);
        }
        
        // Delete user
        $user->delete();
        $response = ["message" => "User was successfully deleted."];
        return response()->json($response, 200);
    }
}
