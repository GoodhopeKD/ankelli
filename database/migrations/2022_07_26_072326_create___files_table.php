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
        Schema::create('__files', function (Blueprint $table) {
            $table->id();
            $table->string('parent_table', 32);
            $table->string('parent_uid', 64);
            $table->enum('filegroup', ['documents', 'images']);
            $table->string('tag', 32);
            $table->string('title', 255);
            $table->unsignedSmallInteger('width')->nullable();
            $table->unsignedSmallInteger('height')->nullable();
            $table->string('uri', 255);
            $table->string('type', 12);
            $table->unsignedMediumInteger('filesize')->nullable();
            $table->string('original_filename', 255);
            $table->unsignedTinyInteger('order_index')->nullable();
            $table->unique(['parent_table', 'parent_uid', 'tag', 'order_index']);

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
        Schema::dropIfExists('__files');
    }
};
