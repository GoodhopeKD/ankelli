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
            $table->string('country', 32);
            
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
            $table->unsignedDecimal('asset_value', $precision = 20, $scale = 10);
            $table->unsignedBigInteger('purchase_amount');

            $table->unsignedDecimal('asset_sell_price', $precision = 20, $scale = 10)->nullable();
            $table->unsignedDecimal('asset_purchase_price', $precision = 20, $scale = 10)->nullable();

            $table->string('payment_method_slug', 64)->nullable();
            $table->foreign('payment_method_slug')
                    ->references('slug')
                    ->on('__payment_methods')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->text('payment_method_details');
            $table->timestamp('payment_declared_datetime')->nullable();
            $table->timestamp('payment_confirmed_datetime')->nullable();
            $table->boolean('visible_to_creator')->default(true);
            $table->boolean('visible_to_offer_creator')->default(true);
            $table->enum('status', ['active', 'cancelled', 'flagged', 'completed'])->default('active');

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
