<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $table = 'user_bookings';
    protected $fillable = [
        'user_id', 'trip_id' 
    ];
}
