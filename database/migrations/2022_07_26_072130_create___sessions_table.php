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
        Schema::create('__sessions', function (Blueprint $table) {
            $table->string('token', 16)->primary();
            $table->string('user_username', 64)->nullable();
            $table->foreign('user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->text('device_info');
            $table->text('agent_app_info');
            
            $table->enum('_status', ['empty', 'active', 'ended'])->default('empty');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
            $table->timestamp('signin_datetime')->nullable();
            $table->timestamp('signout_datetime')->nullable();
        });

        DB::table('__sessions')->insert([
            [
                'token' => 'FACTORY_SSN',
                'user_username' => 'system',
                'device_info' => json_encode([
                    'name' => 'Factory device',
                    'version' => 1.0,
                ]),
                'agent_app_info' => json_encode([
                    'name' => 'Factory agent app',
                    'version' => 1.0,
                ]),
                '_status' => 'ended',
            ],
            [
                'token' => 'TATUM_NOTIFS_SSN',
                'user_username' => 'system',
                'device_info' => json_encode([
                    'name' => 'Tatum Notification Station device',
                    'version' => 1.0,
                ]),
                'agent_app_info' => json_encode([
                    'name' => 'Tatum Notification Station agent app',
                    'version' => 1.0,
                ]),
                '_status' => 'active',
            ],
            [
                'token' => 'TEST_SSN',
                'user_username' => null,
                'device_info' => json_encode([
                    'name' => 'Factory device',
                    'version' => 1.0,
                ]),
                'agent_app_info' => json_encode([
                    'name' => 'Factory agent app',
                    'version' => 1.0,
                ]),
                '_status' => 'active',
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
        Schema::dropIfExists('__sessions');
    }
};
