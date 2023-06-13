<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExplainersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('explainers', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->string('name', 50);
            $table->string('avatar')->default('default.png');
            $table->double('min_price')->unsigned();
            $table->double('max_price')->unsigned();
            $table->string('email',100)->unique();
            $table->string('slogan', 100)->nullable();
            $table->string('description', 1200)->nullable();
            $table->string('open_time',10)->nullable();
            $table->string('close_time',10)->nullable();
            $table->string('grade_range',20)->nullable();
            $table->decimal('lat',10,8)->nullable();
            $table->decimal('lng',11,8)->nullable();
            $table->integer('type',1)->unsigned();
            $table->string('password');
            $table->string('active', 5)->default('true');
            $table->string('confirmed', 5)->default('false');
            $table->rememberToken();

            $table->bigInteger('province_id')->unsigned();
            $table->foreign('province_id')->references('id')->on('provinces')->onDelete('cascade');

            $table->bigInteger('exp_type_id')->unsigned();
            $table->foreign('exp_type_id')->references('id')->on('exp_types')->onDelete('cascade');

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
        Schema::dropIfExists('explainers');
    }
}
