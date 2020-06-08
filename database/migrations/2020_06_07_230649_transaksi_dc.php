<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class TransaksiDc extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transaksi_dc', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_produk');
            $table->unsignedBigInteger('id_sales');
            $table->unsignedBigInteger('id_dc');
            $table->bigInteger('qty_pembelian');
            $table->bigInteger('qty_penjualan');
            $table->bigInteger('qty_retur');
            $table->bigInteger('qty_stock');
            $table->timestamps();
            $table->softDeletes();
        });

        Schema::table('transaksi_dc', function (Blueprint $table) {
            $table->index('id_produk');
            $table->index('id_sales');
            $table->index('id_dc');
            $table->foreign('id_produk')->references('id')->on('produk')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('id_sales')->references('id')->on('sales')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('id_dc')->references('id')->on('dc')->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('transaksi_dc', function (Blueprint $table) {
            Schema::dropIfExists('transaksi_dc');
        });
    }
}
