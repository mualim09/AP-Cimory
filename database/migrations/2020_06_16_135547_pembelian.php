<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Pembelian extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pembelian', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('dc_id');
            $table->date('tanggal_pembelian');
            $table->string('no_invoice', 20);
            $table->unsignedBigInteger('produk_id');
            $table->bigInteger('qty_pembelian');
            $table->timestamps();
            $table->softDeletes();
        });
        Schema::table('pembelian', function (Blueprint $table) {
            $table->index('dc_id');
            $table->index('produk_id');
            $table->foreign('dc_id')->references('id')->on('dc')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('produk_id')->references('id')->on('produk')->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('pembelian', function (Blueprint $table) {
            Schema::dropIfExists('pembelian');
        });
    }
}
