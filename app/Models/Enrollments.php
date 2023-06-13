<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class Enrollments extends Model
{
    protected $fillable = [
        'student_id', 'explainer_id'
    ];
}
