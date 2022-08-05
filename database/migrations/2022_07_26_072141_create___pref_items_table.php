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
        Schema::create('__pref_items', function (Blueprint $table) {
            $table->id();
            $table->enum('parent_table', ['__users', '__email_addresses']);
            $table->string('parent_pmkey', 64);
            $table->string('key_name', 64);
            $table->string('key_slug', 32);
            $table->string('value', 32);
            $table->unique(['parent_table', 'parent_pmkey', 'key_slug']);
            
            $table->string('creator_username', 64)->nullable();
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
        });

        DB::table('__pref_items')->insert([
            [
                'key_name' => 'App Running',
                'key_slug' => 'app_running',
                'value' => true,
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Fallback Display Language',
                'key_slug' => 'fallback_pref_lang',
                'value' => 'en',
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Fallback Display Theme',
                'key_slug' => 'fallback_pref_theme',
                'value' => 'default',
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'File upload location',
                'key_slug' => 'file_upload_location',
                'value' => 'lavarel_file_storage', // lavarel_db_storage_storage / firebase_cloud_storage
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Logs database storage location',
                'key_slug' => 'logs_db_storage_location',
                'value' => 'lavarel_db_storage', // lavarel_db_storage / firebase_cloud_firestore
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Notifications database storage location',
                'key_slug' => 'notifs_db_storage_location',
                'value' => 'lavarel_db_storage', // lavarel_db_storage / firebase_cloud_firestore
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Chats database storage location',
                'key_slug' => 'chats_db_storage_location',
                'value' => 'lavarel_db_storage', // lavarel_db_storage / firebase_cloud_firestore
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Messages database storage location',
                'key_slug' => 'msgs_db_storage_location',
                'value' => 'lavarel_db_storage', // lavarel_db_storage / firebase_cloud_firestore
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Offers database storage location',
                'key_slug' => 'offers_db_storage_location',
                'value' => 'lavarel_db_storage', // lavarel_db_storage / firebase_cloud_firestore
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Trades database storage location',
                'key_slug' => 'trades_db_storage_location',
                'value' => 'lavarel_db_storage', // lavarel_db_storage / firebase_cloud_firestore
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Token registration enabled',
                'key_slug' => 'token_reg_enabled',
                'value' => true,
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Open Registration enabled',
                'key_slug' => 'open_reg_enabled',
                'value' => false,
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Learn mode available',
                'key_slug' => 'learn_mode_available',
                'value' => true,
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Offers to buy enabled',
                'key_slug' => 'offers_to_buy_enabled',
                'value' => true,
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Offers to sell enabled',
                'key_slug' => 'offers_to_sell_enabled',
                'value' => false,
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Value charged by platform on transactions',
                'key_slug' => 'platform_charge_value',
                'value' => 0.01,
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Minimum allowed price per unit currency on offers',
                'key_slug' => 'min_offer_purchase_price',
                'value' => 0.5,
                'parent_table' => '__users',
                'parent_pmkey' => 'system',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],

            [
                'key_name' => 'Receive Promotions in Email Inbox',
                'key_slug' => 'receive_promotions',
                'value' => false,
                'parent_table' => '__email_addresses',
                'parent_pmkey' => 'deposits@ankelli-app.com',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Receive Promotions in Email Inbox',
                'key_slug' => 'receive_promotions',
                'value' => false,
                'parent_table' => '__email_addresses',
                'parent_pmkey' => 'withdrawals@ankelli-app.com',
                'creator_username' => 'sysadmin', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'key_name' => 'Receive Promotions in Email Inbox',
                'key_slug' => 'receive_promotions',
                'value' => false,
                'parent_table' => '__email_addresses',
                'parent_pmkey' => 'goodhopedhliwayo@gmail.com',
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
        Schema::dropIfExists('__pref_items');
    }
};
