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
            $table->unique(['name', 'slug']);
            $table->text('description');
            $table->enum('status', ['active', 'deactivated'])->default('active');

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

        DB::table('__user_groups')->insert([
            [
                'name' => 'System Administrators',
                'slug' => 'system_administrators',
                'description' => 'Admin Group for System unrestricted users. Members have access to all features. Group used for System Development.',
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'name' => 'Platform Administrators',
                'slug' => 'platform_administrators',
                'description' => 'Admin Group for Platform Administrators. Members can manage platform config params.',
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'name' => 'User Administrators',
                'slug' => 'user_administrators',
                'description' => 'Automatically joined group (Users with active Admin Extension) for User Administrators. Members can manage other users and user related queries.',
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'name' => 'Business Administrators',
                'slug' => 'business_administrators',
                'description' => 'Admin group for Business Intelligence. Members have access to business related features.',
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'name' => 'Platform moderators',
                'slug' => 'platform_moderators',
                'description' => 'Admin Group for Platform moderators. Members can respond in the customer service chat module, handle flagged business elems, manage daily updates.',
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'name' => 'Sellers',
                'slug' => 'sellers',
                'description' => 'Automatically joined group (Users with active Seller Extension) for members who have sold assets on the platform.',
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'name' => 'Buyers',
                'slug' => 'buyers',
                'description' => 'Automatically joined group (Users with active Buyer Extension) for buyers who have bought assets on the platform.',
                'creator_username' => 'system', 'created_datetime' => now()->toDateTimeString(),
            ],
            [
                'name' => 'Beta Testers',
                'slug' => 'beta_testers',
                'description' => 'User Group for selected individuals to test certain features before they are published.',
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
        Schema::dropIfExists('__user_groups');
    }
};
