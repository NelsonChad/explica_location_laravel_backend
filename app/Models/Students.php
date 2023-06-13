<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class Students extends Model
{
    protected $fillable = [
        'name', 'avatar', 'surname', 'number', 'email', 'lat', 'lng','password','level_id','type'
    ];
}
