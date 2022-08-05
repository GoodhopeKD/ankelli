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
        Schema::create('__offers', function (Blueprint $table) {
            $table->string('ref_code', 16)->primary();
            $table->string('country', 32);
            
            $table->enum('offer_to', ['buy', 'sell']);

            $table->string('asset_code', 64)->nullable();
            $table->foreign('asset_code')
                    ->references('code')
                    ->on('__assets')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('currency_code', 64)->nullable();
            $table->foreign('currency_code')
                    ->references('code')
                    ->on('__currencies')
                    ->onUpdate('cascade')
                    ->onDelete('set null');

            $table->unsignedDecimal('asset_sell_price', $precision = 20, $scale = 10)->nullable();
            $table->unsignedDecimal('min_sell_value', $precision = 20, $scale = 10)->nullable();
            $table->unsignedDecimal('max_sell_value', $precision = 20, $scale = 10)->nullable();

            $table->unsignedDecimal('asset_purchase_price', $precision = 20, $scale = 10)->nullable();
            $table->unsignedBigInteger('min_purchase_amount')->nullable();
            $table->unsignedBigInteger('max_purchase_amount')->nullable();

            $table->string('payment_method', 64);
            $table->text('payment_details');
            $table->string('note', 64);
            $table->enum('status', ['online', 'offline'])->default('online');

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
        Schema::dropIfExists('__offers');
    }
};
