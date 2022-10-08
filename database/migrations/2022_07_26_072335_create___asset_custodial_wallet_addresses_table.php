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
        Schema::create('__asset_custodial_wallet_addresses', function (Blueprint $table) {
            $table->id();
            $table->string('asset_code', 64)->nullable();
            $table->foreign('asset_code')
                    ->references('code')
                    ->on('__assets')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('blockchain_address', 128)->unique(); // or owner
            $table->string('ttm_wallet_id', 96)->unique();
            $table->string('ttm_subscription_id', 24)->nullable();
            $table->unsignedTinyInteger('onchain_txn_count')->default(0);
            $table->timestamp('last_active_datetime')->nullable();

            $table->string('ttm_gp_address', 128)->unique()->nullable();
            $table->unsignedInteger('ttm_gp_index_from')->nullable();
            $table->unsignedInteger('ttm_gp_index_to')->nullable();
            $table->unsignedSmallInteger('ttm_gp_trx_fee_limit')->nullable();
            $table->string('ttm_gp_actvxn_txn_id', 255)->unique()->nullable();

            $table->string('creator_username', 64)->nullable();
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('created_datetime')->useCurrent();
            $table->softDeletes('deleted_datetime');

            $table->unique(['asset_code', 'blockchain_address', 'ttm_wallet_id'], 'asset_code_blockchain_address_ttm_wallet_id_unique');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('__asset_custodial_wallet_addresses');
    }
};
