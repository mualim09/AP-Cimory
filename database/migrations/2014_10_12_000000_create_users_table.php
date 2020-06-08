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
            $table->string('username',100)->unique();
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
        DB::table('users')->insert(
            [
                'role_id' => 1,
                'name' => 'Ahmad Bagwi Rifai',
                'username' => 'ahmadbagwi',
                'email' => 'ahmadbagwi.id@gmail.com',
                'email_verified_at' => null,
                'password' => bcrypt('Bismillah91'),
                'alamat' => 'Cibanteng',
                'phone' => '085719191812'
            ]
        );
        DB::table('users')->insert(
            [
                'role_id' => 2,
                'name' => 'Dinda Yourista',
                'username' => 'dinda',
                'email' => 'dinda.ipb42@gmail.com',
                'email_verified_at' => null,
                'password' => bcrypt('Bismillah91'),
                'alamat' => 'Tuban, Jawa Timur',
                'phone' => '085719191812'
            ]
        );
        DB::table('users')->insert(
            [
                'role_id' => 3,
                'name' => 'Arumi Nismara',
                'username' => 'nismara',
                'email' => 'nismara.id@gmail.com',
                'email_verified_at' => null,
                'password' => bcrypt('Bismillah91'),
                'alamat' => 'TDP',
                'phone' => '085719191852'
            ]
        );
        DB::table('users')->insert(
            [
                'role_id' => 4,
                'name' => 'Rifanti',
                'username' => 'rifanti',
                'email' => 'rifanti.id@gmail.com',
                'email_verified_at' => null,
                'password' => bcrypt('Bismillah91'),
                'alamat' => 'Cibanteng',
                'phone' => '085719191812'
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
        Schema::dropIfExists('users');
    }
}
