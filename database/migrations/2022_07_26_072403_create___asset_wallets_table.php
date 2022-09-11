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
            $table->string('blockchain_account_id', 255)->nullable();
            $table->string('blockchain_address', 255)->nullable();
            $table->string('blockchain_private_key', 255)->nullable();
            $table->string('tatum_customer_id', 255)->nullable();
            $table->unsignedBigInteger('tatum_derivation_key')->nullable();
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
            $table->string('asset_value', 32)->default(0); // unsignedDecimal
            $table->unique(['user_username', 'asset_code']);
            $table->enum('_status', ['active', 'frozen'])->default('active');

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
        Schema::dropIfExists('__asset_wallets');
    }
};
