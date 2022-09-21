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
        Schema::create('__countries', function (Blueprint $table) {
            $table->id();
            $table->string('name', 32)->unique();
            $table->string('code', 3)->unique();
            $table->text('choice_pymt_method_slugs')->nullable();
            $table->text('choice_currency_codes')->nullable();
            $table->text('allowed_asset_codes')->nullable();
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

        DB::table('__countries')->insert([
            [
                'name' => 'Zimbabwe',
                'code' => 'ZIM',
                'creator_username' => 'system',
            ],
            [
                'name' => 'South Africa',
                'code' => 'RSA',
                'creator_username' => 'system',
            ],
            [
                'name' => 'United Kingdom',
                'code' => 'UK',
                'creator_username' => 'system',
            ],
            [
                'name' => 'United States of America',
                'code' => 'USA',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Russia',
                'code' => 'RUS',
                'creator_username' => 'system',
            ],
            [
                'name' => 'China',
                'code' => 'CHN',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Ghana',
                'code' => 'GHA',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Botswana',
                'code' => 'BOT',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Zambia',
                'code' => 'ZAM',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Algeria',
                'code' => 'ALG',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Italy',
                'code' => 'ITA',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Nigeria',
                'code' => 'NIG',
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
        Schema::dropIfExists('__countries');
    }
};
