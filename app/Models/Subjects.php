<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class Subjects extends Model
{
    protected $fillable = [
        'name', 'explainer_id','price','decription','grade'
    ];
}
