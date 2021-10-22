<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\API\Trip;
use Illuminate\Support\Str;
use App\Classes\Errors;
use Validator;

class TripController extends Controller
{
    public function getTrips()
    {
        $trips = Trip::all();
        return response()->json($trips, 200); 
    }

    public function getTripBySlug($slug) 
    {
        // Check if trip exists
        $trip = Trip::where('slug','=', $slug)->first();
        $findTripError = Errors::getFindTripError($trip);

        if (count($findTripError) > 0) {
            return response()->json($findTripError, 422);
        }

        return response()->json($trip, 200); 
    }

    public function getTripsOrderByPrice($type) 
    {
        $trips = Trip::where('id','>=', 1)->orderBy('price', $type)->get();
        return response()->json($trips, 200); 
    }

    public function getTripsByLocationWithPriceRange($location, $min, $max, $type) 
    {
        $trips = Trip::where('location', ucfirst($location))
            ->whereBetween('price', [$min, $max])
            ->orderBy('price', $type)->get();
        return response()->json($trips, 200);
    }

    public function store(Request $request, Validator $validator)
    {
        // Check trip request data
        $errors = Errors::getTripDataErrors($request, $validator);

        if (count($errors['errors']) > 0) {
            return response()->json($errors, 422);
        }

        // Save trip data to database
        $trip = $request->all();
        $trip['slug'] = Str::of($request->title)->slug('-');
        $trip['start_date'] = date('Y-m-d', strtotime($request->start_date));
        $trip['end_date'] = date('Y-m-d', strtotime($request->end_date));
        $trip = Trip::create($trip);

        $response = ["message" => "Trip was successfully added."];
        return response()->json($response, 201); 
    }

    public function show($id)
    {
        // Check if trip exists
        $trip = Trip::find($id);
        $findTripError = Errors::getFindTripError($trip);

        if (count($findTripError) > 0) {
            return response()->json($findTripError, 422);
        }

        return response()->json($trip, 200); 
    }

    public function update(Request $request, Validator $validator, $id)
    {
        // Check trip request data
        $errors = Errors::getTripDataErrors($request, $validator);

        if (count($errors['errors']) > 0) {
            return response()->json($errors, 422);
        }

        // Check if trip exists
        $trip = Trip::find($id);
        $findTripError = Errors::getFindTripError($trip);

        if (count($findTripError) > 0) {
            return response()->json($findTripError, 422);
        }

        // Update trip data to database
        $data = $request->all();
        $data['slug'] = Str::of($request->title)->slug('-');
        $data['start_date'] = date('Y-m-d', strtotime($request->start_date));
        $data['end_date'] = date('Y-m-d', strtotime($request->end_date));
        $trip->update($data);

        $response = ["message" => "Trip was successfully updated."];
        return response()->json($response, 200); 
    }

 
    public function destroy($id)
    {
        // Check if trip exists
        $trip = Trip::find($id);
        $findTripError = Errors::getFindTripError($trip);

        if (count($findTripError) > 0) {
            return response()->json($findTripError, 422);
        }

        // Delete trip
        $trip->delete();
        $response = ["message" => "Trip was successfully deleted."];
        return response()->json($response, 200);
    }
}
