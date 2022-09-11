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
            $table->string('blockchain_id', 255)->nullable();
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
                'email_address' => 'system',
                'password' => '',
            ],
            [
                'username' => 'escrow',
                'email_address' => 'escrow',
                'password' => '',
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
