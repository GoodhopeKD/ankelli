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
        Schema::create('__reg_tokens', function (Blueprint $table) {
            $table->string('token', 16)->primary();
            $table->enum('_status', ['active', 'deactivated', 'used_up'])->default('active');
            
            $table->string('creator_username', 64);
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('cascade');
            $table->timestamp('created_datetime')->useCurrent();
        });

        DB::table('__reg_tokens')->insert([
            [
                'token' => '1234567890',
                'creator_username' => 'hopekd01',
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
        Schema::dropIfExists('__reg_tokens');
    }
};
