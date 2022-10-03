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
        Schema::create('__trades', function (Blueprint $table) {
            $table->string('ref_code', 16)->primary();
            $table->string('country_name', 32)->nullable();
            $table->foreign('country_name')
                    ->references('name')
                    ->on('__countries')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('location', 32)->nullable();
            
            $table->string('offer_ref_code', 16)->nullable();
            $table->foreign('offer_ref_code')
                    ->references('ref_code')
                    ->on('__offers')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->enum('was_offer_to', ['buy', 'sell']);

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
            $table->string('asset_value', 32); // unsignedDecimal
            $table->unsignedBigInteger('currency_amount');
            $table->string('asset_value_escrowed', 32); // unsignedDecimal
            $table->string('offer_price', 32)->nullable(); // unsignedDecimal
            $table->string('trade_txn_fee_fctr', 32); // unsignedDecimal

            $table->unsignedTinyInteger('buyer_cmplt_trade_mins_tmt');

            $table->string('pymt_method_slug', 64)->nullable();
            $table->foreign('pymt_method_slug')
                    ->references('slug')
                    ->on('__pymt_methods')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->text('pymt_details');
            $table->boolean('pymt_details_visible')->default(false);
            $table->timestamp('pymt_declared_datetime')->nullable();
            $table->timestamp('pymt_confirmed_datetime')->nullable();
            $table->boolean('visible_to_creator')->default(true);
            $table->boolean('visible_to_offer_creator')->default(true);
            $table->timestamp('buyer_opened_datetime')->nullable();
            $table->timestamp('closed_datetime')->nullable();
            $table->enum('_status', ['active', 'cancelled', 'flagged', 'completed'])->default('active');

            $table->string('flag_raiser_username', 64)->nullable();
            $table->foreign('flag_raiser_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('offer_creator_username', 64)->nullable();
            $table->foreign('offer_creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
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
        Schema::dropIfExists('__trades');
    }
};
