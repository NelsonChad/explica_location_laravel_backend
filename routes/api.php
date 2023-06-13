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

Route::group(['namespace' => 'api'], function(){
    Route::get('/places','ExplainerController@index')->name('api.explainers');
    Route::get('/places/{id}','ExplainerController@show')->name('api.explainers.show');
    Route::get('/explainers/contacts/{id}','ExplainerController@showContacts')->name('api.explainers.showContact');
    Route::get('/explainers/subjects/{id}','ExplainerController@showSubjects')->name('api.explainers.showSubject');

    Route::post('/explainers/store','RegisterController@storeExplainer')->name('api.explainer.storeExplainer');
    Route::post('/explainers/contact/store','RegisterController@storeContact')->name('api.explainer.storContact');
    Route::post('/explainers/subject/store','RegisterController@storeSubject')->name('api.explainer.storeSubject');

    Route::post('/student/store','RegisterController@storeStudent')->name('api.student.storeStudent');

    Route::post('/auth/student/login', 'AuthController@studentLogin')->name('login');
    Route::post('/auth/explainer/login', 'AuthController@explainerLogin')->name('login');

    Route::post('/enrollment/store','RegisterController@storeEnrollment')->name('api.student.storeEnrollment');
    Route::get('/enrollments/{id}','ExplainerController@showEnrollments')->name('api.explainers.showEnrollments');

    Route::post('/auth/register', 'AuthController@register');
    Route::group(['middleware' => 'auth:api'], function() {
        Route::get('/auth/logout', 'AuthController@logout');
        // Route::get('/auth/user/{id}', 'AuthController@show');showEnrollments
        // Route::get('/auth/user', 'AuthController@user');
    });

});
