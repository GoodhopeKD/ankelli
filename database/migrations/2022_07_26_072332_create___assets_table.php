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

            //$table->string('xpub', 255)->nullable();

            $table->string('gp_owner_bc_address', 128)->nullable();
            $table->boolean('chain_gp_addresses_storage')->default(false);
            $table->mediumText('ttm_activated_unused_gp_addresses')->nullable();
            $table->unsignedInteger('ttm_activated_unused_gp_addresses_offset_index')->nullable();

            $table->string('smallest_display_unit', 38); // unsignedDecimal
            $table->unsignedDecimal('withdrawal_txn_fee_usd_fctr', $precision = 8, $scale = 4);
            $table->unsignedTinyInteger('withdrawal_min_limit_usd_fctr');
            $table->unsignedInteger('withdrawal_max_limit_usd_fctr');
            $table->string('usd_asset_exchange_rate', 38); // unsignedDecimal
            $table->text('onchain_disclaimer');
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
