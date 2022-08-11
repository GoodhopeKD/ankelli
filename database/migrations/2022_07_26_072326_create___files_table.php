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

        DB::table('__files')->insert([
            [
                'parent_table' => '__pymt_methods',
                'parent_uid' => 'cash_in_person',
                'filegroup' => 'images',
                'tag' => 'pymt_method_icon',
                'title' => 'Cash in person',
                'width' => NULL,
                'height' => NULL,
                'uri' => 'https://ankelli.test/storage/images/pymt_methods/Cash in person.jpg',
                'type' => 'image/jpg',
                'filesize' => NULL,
                'original_filename' => 'Cash in person.jpg',
                'order_index' => NULL,
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'parent_table' => '__pymt_methods',
                'parent_uid' => 'stanbic_bank',
                'filegroup' => 'images',
                'tag' => 'pymt_method_icon',
                'title' => 'Stanbic Bank Icon',
                'width' => NULL,
                'height' => NULL,
                'uri' => 'https://ankelli.test/storage/images/pymt_methods/Stanbic bank.jpg',
                'type' => 'image/jpg',
                'filesize' => NULL,
                'original_filename' => 'Stanbic Bank Icon.jpg',
                'order_index' => NULL,
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'parent_table' => '__pymt_methods',
                'parent_uid' => 'fnb_bank',
                'filegroup' => 'images',
                'tag' => 'pymt_method_icon',
                'title' => 'FNB Bank Icon',
                'width' => NULL,
                'height' => NULL,
                'uri' => 'https://ankelli.test/storage/images/pymt_methods/FNB bank.png',
                'type' => 'image/jpg',
                'filesize' => NULL,
                'original_filename' => 'FNB Bank Icon.jpg',
                'order_index' => NULL,
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'parent_table' => '__pymt_methods',
                'parent_uid' => 'mukuru',
                'filegroup' => 'images',
                'tag' => 'pymt_method_icon',
                'title' => 'Mukuru Icon',
                'width' => NULL,
                'height' => NULL,
                'uri' => 'https://ankelli.test/storage/images/pymt_methods/Mukuru.jpg',
                'type' => 'image/jpg',
                'filesize' => NULL,
                'original_filename' => 'Mukuru Icon.jpg',
                'order_index' => NULL,
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'parent_table' => '__pymt_methods',
                'parent_uid' => 'algerie_poste',
                'filegroup' => 'images',
                'tag' => 'pymt_method_icon',
                'title' => 'Algerie poste Icon',
                'width' => NULL,
                'height' => NULL,
                'uri' => 'https://ankelli.test/storage/images/pymt_methods/Algerie poste.jpg',
                'type' => 'image/jpg',
                'filesize' => NULL,
                'original_filename' => 'Algerie poste Icon.jpg',
                'order_index' => NULL,
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
        ]);
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
