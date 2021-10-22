<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login', 'API\AuthController@login')->middleware('throttle:10,2');

Route::group(['middleware' => 'auth:api'], function() {
    Route::apiResources([
        'users' => 'API\UserController',
        'trips' => 'API\TripController'
    ]);
    Route::get('users', 'API\UserController@getUsers');
    Route::get('trips', 'API\TripController@getTrips');
    Route::get('trips/slug/{slug}', 'API\TripController@getTripBySlug');
    Route::get('trips/order/price/{type}', 'API\TripController@getTripsOrderByPrice');
    Route::get('trips/location/{location}/price/min/{min}/max/{max}/order/price/{type}', 'API\TripController@getTripsByLocationWithPriceRange');
    Route::post('bookings', 'API\BookingController@store');
    Route::get('user/bookings', 'API\BookingController@getUserBookingTrips');
    Route::post('logout', 'API\AuthController@logout');
});

Route::post('users', 'API\UserController@store');