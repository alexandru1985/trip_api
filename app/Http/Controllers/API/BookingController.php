<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\API\User;
use App\Models\API\Trip;
use App\Models\API\Booking;
use App\Classes\Errors;
use Validator;


class BookingController extends Controller
{
    public function getUserBookingTrips()
    {
        $userBookingTrips = User::with('bookingTrips')->get();
        return $userBookingTrips;
    }

    public function store(Request $request, Validator $validator)
    {
        // Check user trip request data
        $errors = Errors::getUserTripDataErrors($request, $validator);

        if (count($errors['errors']) > 0) {
            return response()->json($errors, 422);
        }

        // Check if user exists
        $user = User::find($request['user_id']);
        $findUserError = Errors::getFindUserError($user);

        if (count($findUserError) > 0) {
            return response()->json($findUserError, 422);
        }

        // Check if trip exists
        $trip = Trip::find($request['trip_id']);
        $findTripError = Errors::getFindTripError($trip);
        
        if (count($findTripError) > 0) {
            return response()->json($findTripError, 422);
        }

        // Save user trip data to database
        $userTrip = $request->all();
        $userTrip = Booking::create($userTrip);

        $response = ["message" => "User trip was successfully added."];
        return response()->json($response, 201); 
    }
}
