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
        Schema::create('__phone_nos', function (Blueprint $table) {
            $table->id();
            $table->enum('parent_table', ['__users']);
            $table->string('parent_pmkey', 64);
            $table->string('country_calling_code',4);
            $table->string('number', 16);
            $table->enum('tag', ['whatsapp', 'calls', 'calls_or_whatsapp'])->default('calls_or_whatsapp');
            $table->timestamp('verified_datetime')->nullable();
            
            $table->string('creator_username', 64)->nullable();
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('created_datetime')->useCurrent();
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
        Schema::dropIfExists('__phone_nos');
    }
};
