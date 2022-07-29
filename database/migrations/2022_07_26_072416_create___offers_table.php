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
            $table->id();
            $table->string('country', 32);
            $table->string('asset_name', 64)->nullable();
            $table->foreign('asset_name')
                    ->references('name')
                    ->on('__assets')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('purchase_currency', 3);
            $table->unsignedDecimal('purchase_price', $precision = 3, $scale = 2);
            $table->unsignedBigInteger('min_purchase_amount');
            $table->unsignedBigInteger('max_purchase_amount');
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
