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
        Schema::create('__reviews', function (Blueprint $table) {
            $table->id();
            $table->enum('parent_table', ['__users', '__merchants']);
            $table->string('parent_uid', 64);
            $table->enum('pivot_parent_table', ['__trades', '__orders'])->nullable();
            $table->string('pivot_parent_uid', 64)->nullable();
            $table->unsignedTinyInteger('rating');
            $table->tinyText('comment')->nullable();
            $table->string('creator_username', 64)->nullable();
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();

            $table->unique(['parent_table', 'parent_uid', 'pivot_parent_table', 'pivot_parent_uid', 'creator_username'], 'parent_table_uid_pivot_parent_table_uid_creator_username_unique');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('__reviews');
    }
};
