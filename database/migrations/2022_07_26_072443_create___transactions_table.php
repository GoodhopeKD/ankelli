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

            $table->string('ttm_reference', 255)->nullable();
            $table->string('ttm_bc_txn_signature_id', 255)->unique()->nullable();
            $table->string('ttm_amount_blockage_id', 96)->nullable();
            $table->string('asset_value_escrowed', 38)->nullable(); // unsignedDecimal
            $table->string('bc_txn_id', 255)->unique()->nullable();
            $table->string('bc_txn_fee_asset_unit', 64)->nullable();
            $table->string('bc_txn_fee_asset_value', 38)->nullable();
            
            $table->string('session_token', 16)->nullable();
            $table->foreign('session_token')
                    ->references('token')
                    ->on('__sessions')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('operation_slug', 64);
            $table->enum('_status', ['pending', 'failed', 'aborted', 'completed']);
            $table->string('_status_note', 255)->nullable();

            $table->string('sender_bc_address', 128)->nullable(); 
            $table->string('sender_username', 64)->nullable(); 
            $table->foreign('sender_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('sender_note', 255)->nullable();

            $table->string('recipient_bc_address', 128)->nullable();
            $table->string('recipient_username', 64)->nullable(); 
            $table->foreign('recipient_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('recipient_note', 255)->nullable();

            $table->string('asset_code', 64)->nullable();
            $table->foreign('asset_code')
                    ->references('code')
                    ->on('__assets')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('asset_value', 38)->nullable(); // unsignedDecimal

            $table->text('transfer_result')->nullable();
            $table->timestamp('transfer_datetime')->useCurrent();
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
        Schema::dropIfExists('__transactions');
    }
};
