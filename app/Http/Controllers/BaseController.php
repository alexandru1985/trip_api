<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class BaseController extends Controller
{
    public function login() {
        $response = ["message"=> "Please login to api."];
        return response()->json($response, 422);
    }
}
