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
            $table->enum('txn_context', ['onchain', 'offchain']);
            $table->string('blockchain_txn_id', 255)->unique()->nullable();
            $table->string('tatum_reference', 255)->nullable();
            $table->string('session_token', 16)->nullable();
            $table->foreign('session_token')
                    ->references('token')
                    ->on('__sessions')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('operation_slug', 64);
            $table->string('sender_username', 64)->nullable(); 
            $table->foreign('sender_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('sender_note', 255)->nullable();
            $table->string('source_blockchain_address', 96)->nullable(); 
            $table->string('recipient_username', 64)->nullable(); 
            $table->foreign('recipient_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('recipient_note', 255)->nullable();
            $table->string('destination_blockchain_address', 96)->nullable();
            $table->foreign('destination_blockchain_address')
                    ->references('blockchain_address')
                    ->on('__asset_wallet_addresses')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('asset_code', 64)->nullable();
            $table->foreign('asset_code')
                    ->references('code')
                    ->on('__assets')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('xfer_asset_value', 38)->nullable(); // unsignedDecimal
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
