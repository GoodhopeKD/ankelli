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
        Schema::create('__currencies', function (Blueprint $table) {
            $table->id();
            $table->string('name', 64)->unique();
            $table->string('code', 3)->unique();
            $table->string('symbol', 3);
            $table->boolean('symbol_before_number');
            $table->string('usd_rate', 32); // unsignedDecimal
            $table->string('min_transactable_cash_amount', 32); // unsignedDecimal
            $table->string('smallest_transactable_cash_denomination_amount', 32); // unsignedDecimal
            $table->enum('_status', ['active', 'deactivated'])->default('active');

            $table->string('creator_username', 64)->nullable();
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
        });

        DB::table('__currencies')->insert([
            [
                'name' => 'US Dollar',
                'code' => 'USD',
                'symbol' => '$',
                'symbol_before_number' => true,
                'usd_rate' => 1,
                'min_transactable_cash_amount' => 10,
                'smallest_transactable_cash_denomination_amount' => 1,
                'creator_username' => 'system',
            ],
            [
                'name' => 'Euro',
                'code' => 'EUR',
                'symbol' => '€',
                'symbol_before_number' => true,
                'usd_rate' => 1.02,
                'min_transactable_cash_amount' => 10,
                'smallest_transactable_cash_denomination_amount' => 1,
                'creator_username' => 'system',
            ],
            [
                'name' => 'Pound Sterling',
                'code' => 'GBP',
                'symbol' => '£',
                'symbol_before_number' => true,
                'usd_rate' => 0.89,
                'min_transactable_cash_amount' => 10,
                'smallest_transactable_cash_denomination_amount' => 1,
                'creator_username' => 'system',
            ],
            [
                'name' => 'South African Rand',
                'code' => 'ZAR',
                'symbol' => 'R',
                'symbol_before_number' => false,
                'usd_rate' => 18,
                'min_transactable_cash_amount' => 100,
                'smallest_transactable_cash_denomination_amount' => 10,
                'creator_username' => 'system',
            ],
            [
                'name' => 'Zambian Kwacha',
                'code' => 'ZMW',
                'symbol' => 'K',
                'symbol_before_number' => false,
                'usd_rate' => 14,
                'min_transactable_cash_amount' => 100,
                'smallest_transactable_cash_denomination_amount' => 10,
                'creator_username' => 'system',
            ],
            [
                'name' => 'Algerian Dinar',
                'code' => 'DZD',
                'symbol' => 'DA',
                'symbol_before_number' => false,
                'usd_rate' => 210,
                'min_transactable_cash_amount' => 100,
                'smallest_transactable_cash_denomination_amount' => 100,
                'creator_username' => 'system',
            ],
            [
                'name' => 'Zimbabwean Dollar',
                'code' => 'ZWL',
                'symbol' => '$',
                'symbol_before_number' => true,
                'usd_rate' => 800,
                'min_transactable_cash_amount' => 500,
                'smallest_transactable_cash_denomination_amount' => 50,
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
        Schema::dropIfExists('__currencies');
    }
};
