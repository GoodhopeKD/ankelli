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
        Schema::create('__deposit_tokens', function (Blueprint $table) {
            $table->string('token', 16)->primary();
            $table->string('asset_name', 64)->nullable();
            $table->foreign('asset_name')
                    ->references('name')
                    ->on('__assets')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->unsignedDecimal('asset_value', $precision = 20, $scale = 10);
            $table->string('purchase_currency', 3);
            $table->unsignedBigInteger('purchase_amount');
            
            $table->string('creator_username', 64);
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('cascade');
            $table->timestamp('created_datetime')->useCurrent();
            $table->string('user_username', 64);
            $table->foreign('user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('cascade');
            $table->timestamp('used_datetime')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('__deposit_tokens');
    }
};
