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
        Schema::create('__preference_items', function (Blueprint $table) {
            $table->id();
            $table->enum('parent_table', ['__users', '__email_addresses']);
            $table->string('parent_uid', 64);
            $table->string('key_name', 64);
            $table->string('key_slug', 32);
            $table->string('value', 16);
            $table->unique(['parent_table', 'parent_uid', 'key_slug']);
            
            $table->string('creator_username', 64)->nullable();
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
        });

        DB::table('__preference_items')->insert([
            [
                'key_name' => 'Token based registration enabled',
                'key_slug' => 'token_registration_enabled',
                'value' => true,
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Open Registration enabled',
                'key_slug' => 'open_registration',
                'value' => false,
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Value charged by platform on transactions',
                'key_slug' => 'platform_charge_value',
                'value' => 0.01,
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Minimum allowed price per unit currency on offers',
                'key_slug' => 'min_offer_purchase_price',
                'value' => 0.5,
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Default Display Language',
                'key_slug' => 'default_lang',
                'value' => 'en',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Default Display Theme',
                'key_slug' => 'default_theme',
                'value' => 'default',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],

            [
                'key_name' => 'Receive Promotions in Email Inbox',
                'key_slug' => 'receive_promotions',
                'value' => false,
                'parent_table' => '__email_addresses',
                'parent_uid' => 'deposits@ankelli-app.com',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Receive Promotions in Email Inbox',
                'key_slug' => 'receive_promotions',
                'value' => false,
                'parent_table' => '__email_addresses',
                'parent_uid' => 'withdrawals@ankelli-app.com',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Receive Promotions in Email Inbox',
                'key_slug' => 'receive_promotions',
                'value' => false,
                'parent_table' => '__email_addresses',
                'parent_uid' => 'goodhopedhliwayo@gmail.com',
                'creator_username' => 'hopekd01', 'created_datetime' => now()->toDateTimeString(),
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
        Schema::dropIfExists('__preference_items');
    }
};
