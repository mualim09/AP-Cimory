<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('role_id')->default(3);
            $table->string('name');
            $table->string('username',100);
            $table->string('email', 100)->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password', 100);
            $table->string('alamat', 200)->nullable();
            $table->string('phone', 15)->nullable();
            $table->rememberToken();
            $table->timestamps();
            $table->softDeletes();
        });
    
        Schema::table('users', function (Blueprint $table) {
            $table->index('role_id');
            $table->foreign('role_id')->references('id')->on('role')->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
