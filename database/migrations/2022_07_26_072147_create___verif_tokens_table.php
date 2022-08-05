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
        Schema::create('__verif_tokens', function (Blueprint $table) {
            $table->string('token', 16)->primary();
            $table->string('user_username', 64);
            $table->foreign('user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('cascade');
            $table->enum('recepient_resource_table', ['__phone_nos', '__email_addresses']);
            $table->unsignedBigInteger('recepient_resource_id');
            $table->enum('charge', ['email_address_verification', 'phone_no_verification', 'password_reset']);
            $table->enum('status', ['unused', 'verified', 'annulled'])->default('unused');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('verified_datetime')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('__verif_tokens');
    }
};
