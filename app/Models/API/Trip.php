<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Model;

class Trip extends Model
{
    protected $fillable = [
        'title', 'slug', 'description', 'location', 'title', 'price', 'start_date', 'end_date' 
    ];
}
