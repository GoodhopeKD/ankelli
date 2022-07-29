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
        Schema::create('__seller_extensions', function (Blueprint $table) {
            $table->id();
            $table->string('user_username', 64)->unique();
            $table->foreign('user_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('cascade');
            $table->enum('status', ['active', 'suspended', 'deactivated'])->default('active');

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

        DB::table('__seller_extensions')->insert([
            [
                'user_username' => 'sysadmin',
                'status' => 'deactivated', 'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'user_username' => 'deposits-assistant',
                'status' => 'deactivated', 'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'user_username' => 'withdrawals-assistant',
                'status' => 'deactivated', 'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
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
        Schema::dropIfExists('__seller_extensions');
    }
};
