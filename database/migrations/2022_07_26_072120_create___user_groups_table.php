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
        Schema::create('__user_groups', function (Blueprint $table) {
            $table->id();
            $table->string('name', 64)->unique();
            $table->string('slug', 64)->unique();
            $table->text('description');
            $table->enum('_status', ['active', 'deactivated'])->default('active');

            $table->string('creator_username', 64)->nullable();
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
            $table->softDeletes('deleted_datetime');
            
            $table->unique(['name', 'slug']);
        });

        DB::table('__user_groups')->insert([
            [
                'name' => 'Default Users',
                'slug' => 'default_users',
                'description' => 'Group for Default User accounts created on system initialization and factory_data loading. 
New users cannot be added to this group.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Administrators',
                'slug' => 'administrators',
                'description' => 'Automatically joined group (Users with active Admin Extension). 
Members can be added to other admin groups.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Developers',
                'slug' => 'developers',
                'description' => 'Admin group for unrestricted system users. 
Members have access to all features and OTP access to account named "developer". 
Only "developer" account can add members to this group.
Group used for System Development and Maintenance.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'System Administrators',
                'slug' => 'system_administrators',
                'description' => 'Admin Group for System Administrators. 
Members can manage system functions and sysconfig params. 
Members have OTP access to account named "sysadmin".
Only "sysadmin" account can add members to this group.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Business Administrators',
                'slug' => 'business_administrators',
                'description' => 'Admin group for Business Administrators.
Members have access to business related features.
Members have OTP access to accounts named "busops" and "busadmin".
Only "busadmin" account can add members to this group.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'User Administrators',
                'slug' => 'user_administrators',
                'description' => 'Admin group for User Administrators. 
Members can manage other users and user related queries.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Platform moderators',
                'slug' => 'moderators',
                'description' => 'Group for Platform moderators. 
Members can respond in the customer service chat module, handle flagged business elements, manage daily updates.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Sellers',
                'slug' => 'sellers',
                'description' => 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Buyers',
                'slug' => 'buyers',
                'description' => 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Beta Testers',
                'slug' => 'beta_testers',
                'description' => 'User Group for selected individuals to test certain features before they are published.',
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
        Schema::dropIfExists('__user_groups');
    }
};
