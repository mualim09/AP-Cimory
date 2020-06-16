<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Retur extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('retur', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('dc_id');
            $table->date('tanggal_sjr');
            $table->string('kode_sjr', 20);
            $table->unsignedBigInteger('produk_id');
            $table->bigInteger('qty_retur');
            $table->timestamps();
            $table->softDeletes();
        });
        Schema::table('retur', function (Blueprint $table) {
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
        Schema::table('retur', function (Blueprint $table) {
            Schema::dropIfExists('retur');
        });
    }
}
