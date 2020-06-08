<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableRole extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('role', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('role', 15)->default('dc');
            $table->timestamps();
            $table->softDeletes();
        });

        DB::table('role')->insert(
            [
                'role' => 'root'
            ]
        );
        DB::table('role')->insert(
            [
                'role' => 'ho'
            ]
        );
        DB::table('role')->insert(
            [
                'role' => 'dc'
            ]
        );
        DB::table('role')->insert(
            [
                'role' => 'admin'
            ]
        );
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('role', function (Blueprint $table) {
            Schema::dropIfExists('role');
        });
    }
}
