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
            $table->string('reg_token', 16)->nullable();
            $table->unsignedTinyInteger('avatar_image_id')->nullable();
            
            $table->enum('_status', ['active', 'inactive', 'suspended', 'deactivated'])->default('active');
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
            ],
            // Default System administrator, Cannot buy, sell; can only manage system features
            [
                'username' => 'sysadmin',
                'email_address' => 'sysadmin@ankelli.com',
                'password' => bcrypt('Ank3ll1#1'),
                'avatar_image_id' => 25,
            ],
            // Ankelli finance tracking account
            [
                'username' => 'ankelli',
                'email_address' => 'ankelli@ankelli.com',
                'password' => bcrypt('Ank3ll1#1'),
                'avatar_image_id' => 27,
            ],
            // Personal Account with access to all features
            [
                'username' => 'hopekd01',
                'email_address' => 'goodhopedhliwayo@gmail.com',
                'password' => bcrypt('Password#123'),
                'avatar_image_id' => 25,
            ],
        ]);

        DB::table('__users')->insert([
            [
                'username' => 'popo',
                'email_address' => 'popo@ankelli.com',
                'password' => bcrypt('Password#123'),
            ],
            [
                'username' => 'momo',
                'email_address' => 'momo@ankelli.com',
                'password' => bcrypt('Password#123'),
            ],
            [
                'username' => 'gudo',
                'email_address' => 'gudo@ankelli.com',
                'password' => bcrypt('Password#123'),
            ],
            [
                'username' => 'nassim',
                'email_address' => 'nassim@ankelli.com',
                'password' => bcrypt('Password#123'),
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
