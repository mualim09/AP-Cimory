<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Penjualan extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('penjualan', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('dc_id');
            $table->date('tanggal_penjualan');
            $table->string('kode_transaksi', 20);
            $table->unsignedBigInteger('sales_id');
            $table->unsignedBigInteger('produk_id');
            $table->bigInteger('qty_penjualan');
            $table->bigInteger('nilai_penjualan');
            $table->timestamps();
            $table->softDeletes();
        });
        Schema::table('penjualan', function (Blueprint $table) {
            $table->index('dc_id');
            $table->index('sales_id');
            $table->index('produk_id');
            $table->foreign('dc_id')->references('id')->on('dc')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('produk_id')->references('id')->on('produk')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('sales_id')->references('id')->on('sales')->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('penjualan', function (Blueprint $table) {
            Schema::dropIfExists('penjualan');
        });
    }
}
