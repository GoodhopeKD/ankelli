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
            $table->foreignId('asset_wallet_id')->unique()->references('id')->on('__asset_wallets');
            $table->string('user_username', 64)->nullable();
            $table->foreign('user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('blockchain_address', 128)->nullable();
            $table->unsignedInteger('ttm_derivation_key')->nullable();
            $table->unsignedTinyInteger('onchain_txn_count')->default(0);
            $table->timestamp('last_active_datetime')->nullable();

            $table->timestamp('created_datetime')->useCurrent();
            $table->softDeletes('deleted_datetime');
            
            $table->unique(['asset_wallet_id', 'blockchain_address'], 'asset_wallet_id_blockchain_address_unique');
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
