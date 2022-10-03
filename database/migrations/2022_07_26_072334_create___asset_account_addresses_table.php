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
        Schema::create('__asset_account_addresses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('asset_account_id')->references('id')->on('__asset_accounts');
            $table->string('user_username', 64)->nullable();
            $table->foreign('user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('blockchain_address', 96)->unique()->nullable();
            $table->unsignedInteger('tatum_derivation_key')->nullable();
            $table->unsignedTinyInteger('onchain_txn_count')->default(0);

            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('last_active_datetime')->nullable();
            $table->softDeletes('deleted_datetime');
            
            $table->unique(['asset_account_id', 'blockchain_address', 'tatum_derivation_key'], 'asset_account_id_blockchain_address_tatum_derivation_key_unique');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('__asset_account_addresses');
    }
};
