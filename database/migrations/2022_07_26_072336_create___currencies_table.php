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
            $table->string('alpha_three_code', 3)->unique();
            $table->unsignedDecimal('min_transactable_cash_amount', $precision = 10, $scale = 2);
            $table->unsignedDecimal('smallest_transactable_cash_denomination_amount', $precision = 10, $scale = 2);

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
                'alpha_three_code' => 'USD',
                'min_transactable_cash_amount' => 10,
                'smallest_transactable_cash_denomination_amount' => 5,
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'name' => 'Euro',
                'alpha_three_code' => 'EUR',
                'min_transactable_cash_amount' => 10,
                'smallest_transactable_cash_denomination_amount' => 5,
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'name' => 'Pound Sterling',
                'alpha_three_code' => 'GBP',
                'min_transactable_cash_amount' => 10,
                'smallest_transactable_cash_denomination_amount' => 5,
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'name' => 'South African rand',
                'alpha_three_code' => 'ZAR',
                'min_transactable_cash_amount' => 100,
                'smallest_transactable_cash_denomination_amount' => 100,
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'name' => 'Zambian Kwacha',
                'alpha_three_code' => 'ZMW',
                'min_transactable_cash_amount' => 100,
                'smallest_transactable_cash_denomination_amount' => 100,
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
        Schema::dropIfExists('__currencies');
    }
};
