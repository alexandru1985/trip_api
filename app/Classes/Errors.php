<?php

namespace App\Classes;

use Illuminate\Http\Request;
use App\Models\API\User;
use App\Models\API\Trip;
use Illuminate\Support\Str;
use Validator;

class Errors {

    public static function getUserTripDataErrors(Request $request, Validator $validator) 
    {
        $rules = [
            'user_id' => 'required|integer',
            'trip_id' => 'required|integer'
        ];
        $customMessages = [
            'user_id.integer' => 'The price field must be a valid user id.',
            'trip_id.integer' => 'The price field must be a valid trip id.'
        ];
        $validator = $validator::make($request->all(), $rules, $customMessages);
        $errors = ['errors' => $validator->errors()];
        return $errors;
    }


    public static function getTripDataErrors(Request $request, Validator $validator) 
    {
        $rules = [
            'title' => 'required',
            'description' => 'required',
            'location' => 'required',
            'price' => 'required|integer|min:0',
            'start_date' => 'required|date_format:d-m-Y',
            'end_date' => 'required|date_format:d-m-Y'
        ];
        $customMessages = [
            'price.integer' => 'The price field must be a number.'
        ];
        $validator = $validator::make($request->all(), $rules, $customMessages);
        $errors = ['errors' => $validator->errors()];
        return $errors;
    }

    public static function getUserDataErrors(Request $request, Validator $validator) 
    {
        $rules = [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6'
        ];

        $validator = $validator::make($request->all(), $rules);
        $errors = ['errors' => $validator->errors()];
        return $errors;
    }

    public static function getFindUserError($user) 
    {
        $error = [];

        if (!$user) {
            $error = ["error" => "User not found for given user id."];
        }

        return $error;
    }

    public static function getFindTripError($trip) 
    {
        $type = 'trip id';
        $url = url()->current();
        $slug = Str::contains($url, 'slug');

        if ($slug) {
            $type = 'slug';
        }

        $error = [];

        if (!$trip) {
            $error = ["error" => "Trip not found for given ". $type ."."];
        }

        return $error;
    }

    public static function getUserLoginDataErrors(Request $request, Validator $validator) 
    {
        $rules = [
            'email' => 'required|string|email',
            'password' => 'required|string|min:6',
        ];
        $validator = $validator::make($request->all(), $rules);
        $errors = ['errors' => $validator->errors()];
        return $errors;
    }
}