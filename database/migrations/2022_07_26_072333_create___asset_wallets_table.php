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
        Schema::create('__asset_wallets', function (Blueprint $table) {
            $table->id();
            $table->string('ttm_virtual_account_id', 24)->nullable();
            $table->string('ttm_subscription_id', 24)->nullable();
            $table->string('user_username', 64)->nullable();
            $table->foreign('user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('asset_code', 64)->nullable();
            $table->foreign('asset_code')
                    ->references('code')
                    ->on('__assets')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('asset_chain', 64)->nullable();
            $table->string('usable_balance_asset_value', 38)->default(0); // unsignedDecimal
            $table->string('total_balance_asset_value', 38)->default(0); // unsignedDecimal
            $table->enum('_status', ['active', 'frozen'])->default('active');

            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
            
            $table->unique(['user_username', 'asset_code']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('__asset_wallets');
    }
};
