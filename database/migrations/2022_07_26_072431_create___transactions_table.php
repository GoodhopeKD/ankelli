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
            $table->string('session_token', 16)->nullable();
            $table->foreign('session_token')
                    ->references('token')
                    ->on('__sessions')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->enum('action_type', ['entry_create', 'entry_read', 'entry_update', 'entry_delete', 'function_call', 'batch_init']);
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
            $table->string('asset_name', 64)->nullable();
            $table->foreign('asset_name')
                    ->references('name')
                    ->on('__assets')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->unsignedDecimal('transfer_value', $precision = 20, $scale = 10);
            $table->text('transfer_result');
            $table->timestamp('transfer_datetime')->useCurrent()->nullable();
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
