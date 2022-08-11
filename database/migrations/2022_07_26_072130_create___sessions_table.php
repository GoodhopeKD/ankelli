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
        Schema::create('__sessions', function (Blueprint $table) {
            $table->string('token',16)->primary();
            $table->string('user_username', 64)->nullable();
            $table->foreign('user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->text('device_info');
            $table->text('agent_app_info');
            
            $table->enum('_status', ['empty', 'active', 'ended'])->default('empty');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
            $table->timestamp('signin_datetime')->nullable();
            $table->timestamp('signout_datetime')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('__sessions');
    }
};
