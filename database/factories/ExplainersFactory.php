<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Model;
use Faker\Generator as Faker;

$factory->define(\App\Models\Explainers::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'slogan' => $faker->title,
        'min_price' => rand(100,200),
        'max_price' => rand(800,1000),
        'description' => $faker->text,
        'open_time' => '07:00',
        'close_time' => '17:00',
        'grade_range' => '10-12',
        'lat' => 0000000000,
        'lng' => 0000000000,
        'password' => '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', // secret
        'email' => $faker->unique()->safeEmail,

        'province_id'=> 1,
        'exp_type_id' => 1
    ];
});
