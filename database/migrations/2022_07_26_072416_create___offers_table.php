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
        Schema::create('__offers', function (Blueprint $table) {
            $table->string('ref_code', 16)->primary();
            $table->string('country', 32);
            $table->string('location', 32);
            
            $table->enum('offer_to', ['buy', 'sell']);

            $table->string('asset_code', 64)->nullable();
            $table->foreign('asset_code')
                    ->references('code')
                    ->on('__assets')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('currency_code', 64)->nullable();
            $table->foreign('currency_code')
                    ->references('code')
                    ->on('__currencies')
                    ->onUpdate('cascade')
                    ->onDelete('set null');

            $table->unsignedDecimal('asset_sell_price', $precision = 20, $scale = 10)->nullable();
            $table->unsignedDecimal('min_sell_value', $precision = 20, $scale = 10)->nullable();
            $table->unsignedDecimal('max_sell_value', $precision = 20, $scale = 10)->nullable();

            $table->unsignedDecimal('asset_purchase_price', $precision = 20, $scale = 10)->nullable();
            $table->unsignedBigInteger('min_purchase_amount')->nullable();
            $table->unsignedBigInteger('max_purchase_amount')->nullable();

            $table->string('pymt_method_slug', 64)->nullable();
            $table->foreign('pymt_method_slug')
                    ->references('slug')
                    ->on('__pymt_methods')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->text('pymt_method_details');
            $table->string('note', 64);
            $table->enum('_status', ['online', 'offline'])->default('online');

            $table->string('creator_username', 64)->nullable();
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
            $table->softDeletes('deleted_datetime');
        });

        // Offers to buy
        DB::table('__offers')->insert([
            [
                'ref_code' => '001',
                'country' => 'Zimbabwe',
                'location' => 'Harare CBD',
                'offer_to' => 'buy',
                'asset_code' => 'USDT',
                'currency_code' => 'USD',
                'asset_purchase_price' => 0.95,
                'min_purchase_amount' => 100,
                'max_purchase_amount' => 500,
                'pymt_method_slug' => 'cash_in_person',
                'pymt_method_details' => json_encode([
                    'address' => 'Kingstones Book Shop, Cnr First st, R.Mugabe.',
                    'phone_number' => '+263776543256'
                ]),
                'note' => 'Quick deal',
                'creator_username' => 'popo',
            ],
            [
                'ref_code' => '002',
                'country' => 'Zimbabwe',
                'location' => 'Byo CBD',
                'offer_to' => 'buy',
                'asset_code' => 'USDT',
                'currency_code' => 'USD',
                'asset_purchase_price' => 0.96,
                'min_purchase_amount' => 100,
                'max_purchase_amount' => 500,
                'pymt_method_slug' => 'stanbic_bank',
                'pymt_method_details' => json_encode([
                    'account_holder_name' => 'Sekuru Gudo',
                    'account_number' => '9146898775793'
                ]),
                'note' => 'Quick deal',
                'creator_username' => 'gudo',
            ],
            [
                'ref_code' => '003',
                'country' => 'Algeria',
                'location' => 'Oran',
                'offer_to' => 'buy',
                'asset_code' => 'USDT',
                'currency_code' => 'DZD',
                'asset_purchase_price' => 175,
                'min_purchase_amount' => 10000,
                'max_purchase_amount' => 20000,
                'pymt_method_slug' => 'algerie_poste',
                'pymt_method_details' => json_encode([
                    'account_holder_name' => 'Nassim',
                    'account_number' => '257698097',
                    'account_key' => '55',
                ]),
                'note' => 'Quick deal',
                'creator_username' => 'nassim',
            ],
            [
                'ref_code' => '004',
                'country' => 'United Kingdom',
                'location' => 'Manchester',
                'offer_to' => 'buy',
                'asset_code' => 'USDT',
                'currency_code' => 'EUR',
                'asset_purchase_price' => 0.71,
                'min_purchase_amount' => 200,
                'max_purchase_amount' => 1000,
                'pymt_method_slug' => 'cash_in_person',
                'pymt_method_details' => json_encode([
                    'address' => '10 First Street',
                    'phone_number' => '+44788654789',
                ]),
                'note' => 'Quick deal',
                'creator_username' => 'gudo',
            ],
            [
                'ref_code' => '005',
                'country' => 'South Africa',
                'location' => 'Capetown',
                'offer_to' => 'buy',
                'asset_code' => 'USDT',
                'currency_code' => 'ZAR',
                'asset_purchase_price' => 14,
                'min_purchase_amount' => 500,
                'max_purchase_amount' => 2000,
                'pymt_method_slug' => 'fnb_bank',
                'pymt_method_details' => json_encode([
                    'account_holder_name' => 'Momoterai',
                    'account_number' => '257698097',
                ]),
                'note' => 'Quick deal',
                'creator_username' => 'momo',
            ],
            [
                'ref_code' => '006',
                'country' => 'Zimbabwe',
                'location' => 'Gweru',
                'offer_to' => 'buy',
                'asset_code' => 'USDT',
                'currency_code' => 'USD',
                'asset_purchase_price' => 0.94,
                'min_purchase_amount' => 100,
                'max_purchase_amount' => 500,
                'pymt_method_slug' => 'mukuru',
                'pymt_method_details' => json_encode([
                    'name' => 'Momo',
                    'phone_number' => '+263776587536'
                ]),
                'note' => 'Quick deal',
                'creator_username' => 'momo',
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
        Schema::dropIfExists('__offers');
    }
};
