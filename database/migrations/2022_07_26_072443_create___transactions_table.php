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
        Schema::create('__transactions', function (Blueprint $table) {
            $table->string('ref_code', 16)->primary();
            $table->enum('context', ['onchain', 'offchain']);
            $table->string('blockchain_txid', 255)->nullable();
            $table->string('tatum_reference', 255)->nullable();
            $table->string('session_token', 16)->nullable();
            $table->foreign('session_token')
                    ->references('token')
                    ->on('__sessions')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('description', 255);
            $table->string('operation_slug', 64);
            $table->string('source_user_username', 64)->nullable(); 
            $table->foreign('source_user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('destination_user_username', 64)->nullable(); 
            $table->foreign('destination_user_username')
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
            $table->string('transfer_asset_value', 32)->nullable(); // unsignedDecimal
            $table->text('transfer_result');
            $table->timestamp('transfer_datetime')->useCurrent()->nullable();
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
        Schema::dropIfExists('__transactions');
    }
};
