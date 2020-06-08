<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Dc extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dc', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('kode_dc', 10)->unique();
            $table->string('nama_dc', 200);
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('dc', function (Blueprint $table) {
            Schema::dropIfExists('dc');
        });
    }
}
