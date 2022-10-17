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
        Schema::create('__asset_wallet_addresses', function (Blueprint $table) {
            $table->id();
            //$table->unsignedInteger('ttm_derivation_key')->unique()->nullable();
            $table->string('user_username', 64)->nullable();
            $table->foreign('user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('bc_address', 128)->unique()->nullable();
            $table->string('asset_code', 64)->nullable();
            $table->foreign('asset_code')
                    ->references('code')
                    ->on('__assets')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('__asset_wallet_addresses');
    }
};
