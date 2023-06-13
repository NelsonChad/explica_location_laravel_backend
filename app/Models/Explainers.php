<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Explainers extends Model
{
    protected $fillable = [
        'name', 'avatar', 'min_price', 'max_price', 'email', 'slogan','description','type',
        'open_time','close_time','grade_range', 'lat', 'lng','password','province_id','exp_type_id',
    ];
}
