<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubjectsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subjects', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->string('name', 50);
            $table->string('decription', 500);
            $table->double('price')->unsigned();
            $table->string('icon')->nullable();
            $table->string('grade', 50);

            $table->bigInteger('explainer_id')->unsigned();
            $table->foreign('explainer_id')->references('id')->on('explainers')->onDelete('cascade');

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
        Schema::dropIfExists('subjects');
    }
}
