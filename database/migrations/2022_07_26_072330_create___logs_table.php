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
        Schema::create('__logs', function (Blueprint $table) {
            $table->string('id', 16)->primary();
            $table->string('session_token', 16)->nullable();
            $table->foreign('session_token')
                    ->references('token')
                    ->on('__sessions')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('action_note', 255)->nullable();
            $table->enum('action_type', ['entry_create', 'entry_read', 'entry_update', 'entry_delete', 'function_call', 'batch_init']);
            $table->string('action_user_username', 64)->nullable(); 
            $table->foreign('action_user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('action_datetime')->useCurrent()->nullable();
            $table->string('utc_offset', 8)->nullable();
            $table->string('batch_code', 64)->nullable();
            $table->string('entry_table', 32)->nullable();
            $table->string('entry_pmkey', 64)->nullable(); 
            $table->text('entry_update_result')->nullable();
            $table->text('request_location')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('__logs');
    }
};
