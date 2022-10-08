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
            $table->string('parent_uid', 64);
            $table->string('key_name', 64);
            $table->string('key_slug', 32);
            $table->string('value', 64);
            $table->string('value_type', 64);
            
            $table->string('creator_username', 64)->nullable();
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
            
            $table->unique(['parent_table', 'parent_uid', 'key_slug']);
        });

        DB::table('__pref_items')->insert([
            [
                'key_name' => 'Backend rest api enabled',
                'key_slug' => 'backend_rest_api_enabled',
                'value' => true,
                'value_type' => 'boolean',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Scaffolding app enabled',
                'key_slug' => 'scaffolding_app_enabled',
                'value' => true,
                'value_type' => 'boolean',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Fallback Display Language',
                'key_slug' => 'fallback_pref_lang',
                'value' => 'en',
                'value_type' => 'enum:langs',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Fallback Display Theme',
                'key_slug' => 'fallback_pref_theme',
                'value' => 'light',
                'value_type' => 'enum:themes',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Image storage driver',
                'key_slug' => 'image_storage_driver',
                'value' => 'lavarel_file_storage',
                'value_type' => 'enum:file_storage_drivers',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Document storage driver',
                'key_slug' => 'document_storage_driver',
                'value' => 'lavarel_file_storage',
                'value_type' => 'enum:file_storage_drivers',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            /*[
                'key_name' => 'Logs database driver',
                'key_slug' => 'logs_db_driver',
                'value' => 'lavarel_mysql_db',
                'value_type' => 'enum:db_drivers',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Notifications database driver',
                'key_slug' => 'notifs_db_driver',
                'value' => 'lavarel_mysql_db',
                'value_type' => 'enum:db_drivers',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Chats database driver',
                'key_slug' => 'chats_db_driver',
                'value' => 'lavarel_mysql_db',
                'value_type' => 'enum:db_drivers',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Messages database driver',
                'key_slug' => 'msgs_db_driver',
                'value' => 'lavarel_mysql_db',
                'value_type' => 'enum:db_drivers',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Offers database driver',
                'key_slug' => 'offers_db_driver',
                'value' => 'lavarel_mysql_db',
                'value_type' => 'enum:db_drivers',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Trades database driver',
                'key_slug' => 'trades_db_driver',
                'value' => 'lavarel_mysql_db',
                'value_type' => 'enum:db_drivers',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],*/
            [
                'key_name' => 'Open Registration enabled',
                'key_slug' => 'open_reg_enabled',
                'value' => false,
                'value_type' => 'boolean',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Token registration enabled',
                'key_slug' => 'token_reg_enabled',
                'value' => false,
                'value_type' => 'boolean',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Registration token max use count',
                'key_slug' => 'reg_token_max_use_count',
                'value' => 10,
                'value_type' => 'integer',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Offers to sell enabled',
                'key_slug' => 'offer_to_sell_enabled',
                'value' => false,
                'value_type' => 'boolean',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Offers to buy enabled',
                'key_slug' => 'offer_to_buy_enabled',
                'value' => true,
                'value_type' => 'boolean',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Min timeout (minutes) for buyer to open trade',
                'key_slug' => 'buyer_open_trade_min_mins_tmt',
                'value' => 10,
                'value_type' => 'integer',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Max timeout (minutes) for buyer to complete trade (auto flags)',
                'key_slug' => 'buyer_cmplt_trade_max_mins_tmt',
                'value' => 240,
                'value_type' => 'integer',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Use tatum crypto asset engine API',
                'key_slug' => 'use_ttm_api',
                'value' => true,
                'value_type' => 'boolean',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Platform fee factor on trade transactions',
                'key_slug' => 'trade_txn_fee_fctr',
                'value' => 0.01,
                'value_type' => 'float',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Platform fee factor on direct onchain transfers',
                'key_slug' => 'withdrawal_txn_fee_fctr',
                'value' => 0.01,
                'value_type' => 'float',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Platform fee factor on direct offchain transfers',
                'key_slug' => 'pymt_txn_fee_fctr',
                'value' => 0.01,
                'value_type' => 'float',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Platform fee factor on ankelli pay payments',
                'key_slug' => 'pay_txn_fee_fctr',
                'value' => 0.01,
                'value_type' => 'float',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
            ],
            [
                'key_name' => 'Platform fee factor on crypto conversions',
                'key_slug' => 'crypto_conv_txn_fee_fctr',
                'value' => 0.01,
                'value_type' => 'float',
                'parent_table' => '__users',
                'parent_uid' => 'system',
                'creator_username' => 'system',
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
