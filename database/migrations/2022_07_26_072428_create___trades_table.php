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
            $table->id();
            $table->string('asset_name', 64)->nullable();
            $table->foreign('asset_name')
                    ->references('name')
                    ->on('__assets')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->unsignedDecimal('asset_value', $precision = 20, $scale = 10);
            $table->string('purchase_currency', 3);
            $table->unsignedDecimal('purchase_price', $precision = 3, $scale = 2);
            $table->unsignedBigInteger('purchase_amount');
            $table->string('payment_method', 64);
            $table->text('payment_details');
            $table->timestamp('payment_declared_datetime')->nullable();
            $table->timestamp('payment_confirmed_datetime')->nullable();
            $table->boolean('visible_to_creator')->default(true);
            $table->boolean('visible_to_buyer')->default(true);
            $table->enum('status', ['active', 'cancelled', 'flagged', 'completed'])->default('active');

            $table->string('buyer_username', 64)->nullable();
            $table->foreign('buyer_username')
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
