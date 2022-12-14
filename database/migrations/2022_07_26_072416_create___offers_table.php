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
            $table->string('country_name', 32)->nullable();
            $table->foreign('country_name')
                    ->references('name')
                    ->on('__countries')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('location', 32)->nullable();
            
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

            $table->string('offer_price', 38); // unsignedDecimal
            $table->string('trade_txn_fee_fctr', 38); // unsignedDecimal

            // for offer_to = buy
            $table->unsignedBigInteger('min_trade_purchase_amount')->nullable();
            $table->unsignedBigInteger('max_trade_purchase_amount')->nullable();
            $table->unsignedBigInteger('offer_total_purchase_amount')->nullable();
            $table->unsignedBigInteger('filled_amount')->default(0);

            // for offer_to = sell
            $table->string('min_trade_sell_value', 38)->nullable(); // unsignedDecimal
            $table->string('max_trade_sell_value', 38)->nullable(); // unsignedDecimal
            $table->string('offer_total_sell_value', 38)->nullable(); // unsignedDecimal
            $table->string('filled_value', 38)->default(0); // unsignedDecimal
            
            $table->unsignedTinyInteger('buyer_cmplt_trade_mins_tmt');

            $table->string('pymt_method_slug', 64)->nullable();
            $table->foreign('pymt_method_slug')
                    ->references('slug')
                    ->on('__pymt_methods')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->text('pymt_details')->nullable();
            $table->string('note', 64)->nullable();
            $table->enum('_status', ['online', 'offline'])->default('online');

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
