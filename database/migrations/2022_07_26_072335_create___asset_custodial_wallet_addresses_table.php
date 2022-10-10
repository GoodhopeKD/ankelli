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
            $table->string('asset_chain', 64);
            $table->string('blockchain_address', 128)->unique(); // or owner
            $table->string('ttm_wallet_id', 96)->nullable();
            $table->string('ttm_subscription_id', 24)->nullable();
            $table->mediumText('ttm_activated_unused_gp_addresses')->nullable();
            $table->unsignedInteger('ttm_activated_unused_gp_addresses_offset_index')->nullable();
            $table->string('ttm_last_gp_addresses_activation_txn_signature_id', 255)->unique('signature_id_unique')->nullable();

            $table->string('creator_username', 64)->nullable();
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
            $table->softDeletes('deleted_datetime');
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
