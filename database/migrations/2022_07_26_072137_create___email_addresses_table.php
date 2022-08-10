<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('__email_addresses', function (Blueprint $table) {
            $table->id();
            $table->string('email_address', 64)->unique();
            $table->string('user_username', 64);
            $table->foreign('user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('cascade');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('verified_datetime')->nullable();
        });

        DB::table('__email_addresses')->insert([
            [
                'user_username' => 'sysadmin',
                'email_address' => 'sysadmin@ankelli.com',
                'verified_datetime' => now()->toDateTimeString(),
            ],
            [
                'user_username' => 'ankelli',
                'email_address' => 'ankelli@ankelli.com',
                'verified_datetime' => now()->toDateTimeString(),
            ],
            [
                'user_username' => 'hopekd01',
                'email_address' => 'goodhopedhliwayo@gmail.com',
                'verified_datetime' => now()->toDateTimeString(),
            ],
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('__email_addresses');
    }
};
