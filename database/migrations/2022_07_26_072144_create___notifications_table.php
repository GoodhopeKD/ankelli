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
        Schema::create('__notifications', function (Blueprint $table) {
            $table->string('id', 16)->primary();
            $table->string('user_username', 64);
            $table->foreign('user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('cascade');
            $table->text('content');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('read_datetime')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('__notifications');
    }
};
