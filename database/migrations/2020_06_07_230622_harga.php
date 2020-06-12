<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Harga extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('harga', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_produk');
            $table->bigInteger('harga_dasar');
            $table->bigInteger('harga_jual');
            $table->timestamps();
            $table->softDeletes();
        });

        Schema::table('harga', function (Blueprint $table) {
            $table->index('id_produk');
            $table->foreign('id_produk')->references('id')->on('produk')->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('harga', function (Blueprint $table) {
            Schema::dropIfExists('harga');
        });
    }
}
