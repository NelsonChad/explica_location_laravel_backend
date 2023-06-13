<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('students', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->string('name', 50);
            $table->string('surname', 50);
            $table->string('avatar')->default('default.png');
            $table->string('email',100)->unique();
            $table->string('number',10)->unique();
            $table->string('password');
            $table->integer('type',1)->unsigned();
            $table->decimal('lat',10,8)->nullable();
            $table->decimal('lng',11,8)->nullable();
            $table->string('active', 5)->default('true');
            $table->string('confirmed', 5)->default('true');
            $table->rememberToken();

            $table->bigInteger('level_id')->unsigned();
            $table->foreign('level_id')->references('id')->on('levels')->onDelete('cascade');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('students');
    }
}
