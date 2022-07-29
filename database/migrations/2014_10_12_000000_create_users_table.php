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
        Schema::create('__users', function (Blueprint $table) {
            $table->id();
            $table->string('username', 64)->unique();
            $table->string('email_address', 64)->unique();
            $table->string('password');
            $table->unsignedTinyInteger('avatar_image_id')->nullable();
            
            $table->enum('account_status', ['active', 'inactive', 'suspended', 'deactivated'])->default('active');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
            $table->softDeletes('deleted_datetime');
        });

        DB::table('__users')->insert([
            // Default System _User, Cannot be accessed, used for automatic functions
            [
                'username' => 'system',
                'email_address' => '',
                'password' => '',
                'avatar_image_id' => 25,
                'created_datetime' => now()->toDateTimeString(),
            ],
            // Default System administrator, Cannot buy, sell; can only manage system features
            [
                'username' => 'sysadmin',
                'email_address' => 'sysadmin@ankelli-app.com',
                'password' => bcrypt('PayWy23Adm1n#1'),
                'avatar_image_id' => 25,
                'created_datetime' => now()->toDateTimeString(),
            ],
            // Deposit assistant account
            [
                'username' => 'deposits-assistant',
                'email_address' => 'deposits@ankelli-app.com',
                'password' => bcrypt('PayWy23DP#1'),
                'avatar_image_id' => 27,
                'created_datetime' => now()->toDateTimeString(),
            ],
            // Withdrawal assistant account
            [
                'username' => 'withdrawals-assistant',
                'email_address' => 'withdrawals@ankelli-app.com',
                'password' => bcrypt('PayWy23WD#1'),
                'avatar_image_id' => 27,
                'created_datetime' => now()->toDateTimeString(),
            ],
            // Personal Account with access to all features
            [
                'username' => 'hopekd01',
                'email_address' => 'goodhopedhliwayo@gmail.com',
                'password' => bcrypt('Password#123'),
                'avatar_image_id' => 25,
                'created_datetime' => now()->toDateTimeString(),
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
        Schema::dropIfExists('__users');
    }
};
