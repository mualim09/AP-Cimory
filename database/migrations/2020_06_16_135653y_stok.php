<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Stok extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('stok', function (Blueprint $table) {
          $table->bigIncrements('id');
          $table->unsignedBigInteger('dc_id');
          $table->date('tanggal_stok');
          $table->string('keterangan');
          $table->unsignedBigInteger('produk_id');
          $table->bigInteger('qty_stok');
          $table->timestamps();
          $table->softDeletes();
      });
      Schema::table('stok', function (Blueprint $table) {
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
      Schema::table('stok', function (Blueprint $table) {
          Schema::dropIfExists('stok');
      });
    }
}
