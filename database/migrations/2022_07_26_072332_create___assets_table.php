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
        Schema::create('__assets', function (Blueprint $table) {
            $table->id();
            $table->string('name', 64)->unique();
            $table->string('code', 64)->unique();
            $table->string('unit', 64);
            $table->string('chain', 64);
            $table->string('xpub', 255)->nullable();
            $table->string('gp_owner_bc_address', 128)->nullable();
            $table->boolean('ttm_gp_chain_addresses_storage')->default(false);
            $table->text('ttm_gp_calculated_batch_addresses')->nullable();
            $table->unsignedBigInteger('ttm_gp_last_calculated_index')->nullable();
            $table->unsignedBigInteger('ttm_gp_last_activated_index')->nullable();

            $table->string('smallest_display_unit', 38); // unsignedDecimal
            $table->unsignedDecimal('withdrawal_txn_fee_usd_fctr', $precision = 8, $scale = 4);
            $table->string('withdrawal_min_limit', 38);
            $table->string('withdrawal_max_limit', 38);
            $table->string('usd_asset_exchange_rate', 38); // unsignedDecimal
            $table->string('centralization_threshold', 38); // unsignedDecimal
            $table->text('onchain_disclaimer');
            $table->string('bc_txn_id_scan_url', 255);
            $table->enum('_status', ['active', 'deactivated'])->default('active');

            $table->string('creator_username', 64)->nullable();
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('__assets');
    }
};
