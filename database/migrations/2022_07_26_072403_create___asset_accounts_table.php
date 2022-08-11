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
        Schema::create('__asset_accounts', function (Blueprint $table) {
            $table->id();
            $table->string('user_username', 64)->nullable();
            $table->foreign('user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->string('asset_code', 64)->nullable();
            $table->foreign('asset_code')
                    ->references('code')
                    ->on('__assets')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->unsignedDecimal('asset_value', $precision = 20, $scale = 10);
            $table->unique(['user_username', 'asset_code']);
            $table->enum('_status', ['active', 'frozen'])->default('active');

            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
        });

        DB::table('__asset_accounts')->insert([
            [
                'user_username' => 'ankelli',
                'asset_code' => 'USDT',
                'asset_value' => 2500,
            ],
        ]);

        DB::table('__asset_accounts')->insert([
            [
                'user_username' => 'popo',
                'asset_code' => 'USDT',
                'asset_value' => 347.3367778,
            ],
            [
                'user_username' => 'momo',
                'asset_code' => 'USDT',
                'asset_value' => 22.8658,
            ],
            [
                'user_username' => 'gudo',
                'asset_code' => 'USDT',
                'asset_value' => 478.9897,
            ],
            [
                'user_username' => 'nassim',
                'asset_code' => 'USDT',
                'asset_value' => 450.755389,
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
        Schema::dropIfExists('__asset_accounts');
    }
};
