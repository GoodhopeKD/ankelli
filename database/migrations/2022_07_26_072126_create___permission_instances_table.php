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
        Schema::create('__permission_instances', function (Blueprint $table) {
            $table->id();
            $table->enum('parent_table', ['__users', '__user_groups']);
            $table->string('parent_uid', 64);
            $table->string('permission_slug', 64);
            $table->foreign('permission_slug')
                    ->references('slug')
                    ->on('__permissions')
                    ->onUpdate('cascade')
                    ->onDelete('cascade');
            $table->unique(['parent_table', 'parent_uid', 'permission_slug'], 'parent_table_parent_uid_permission_slug_unique');
            $table->enum('_status', ['active', 'revoked'])->default('active');

            $table->string('creator_username', 64)->nullable();
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
        });

        DB::table('__permission_instances')->insert([
            // _UserGroup: system_administrators
            [
                'parent_table' => '__user_groups',
                'parent_uid' => 'system_administrators',
                'permission_slug' => 'update_sysconfig_params',
                'creator_username' => 'system',
            ],
            [
                'parent_table' => '__user_groups',
                'parent_uid' => 'system_administrators',
                'permission_slug' => 'handle_feedback_reports',
                'creator_username' => 'system',
            ],
            [
                'parent_table' => '__user_groups',
                'parent_uid' => 'system_administrators',
                'permission_slug' => 'manage_systools',
                'creator_username' => 'system',
            ],
            [
                'parent_table' => '__user_groups',
                'parent_uid' => 'system_administrators',
                'permission_slug' => 'manage_datalists',
                'creator_username' => 'system',
            ],
            [
                'parent_table' => '__user_groups',
                'parent_uid' => 'system_administrators',
                'permission_slug' => 'view_all_logs',
                'creator_username' => 'system',
            ],
            // _UserGroup: business_administrators
            [
                'parent_table' => '__user_groups',
                'parent_uid' => 'business_administrators',
                'permission_slug' => 'view_all_transactions',
                'creator_username' => 'system',
            ],
            [
                'parent_table' => '__user_groups',
                'parent_uid' => 'business_administrators',
                'permission_slug' => 'manage_deposit_tokens',
                'creator_username' => 'system',
            ],
            [
                'parent_table' => '__user_groups',
                'parent_uid' => 'business_administrators',
                'permission_slug' => 'handle_withdrawals',
                'creator_username' => 'system',
            ],
            // _UserGroup: user_administrators
            [
                'parent_table' => '__user_groups',
                'parent_uid' => 'user_administrators',
                'permission_slug' => 'manage_reg_tokens',
                'creator_username' => 'system',
            ],
            [
                'parent_table' => '__user_groups',
                'parent_uid' => 'user_administrators',
                'permission_slug' => 'handle_flagged_users',
                'creator_username' => 'system',
            ],
            // _UserGroup: platform_moderators
            [
                'parent_table' => '__user_groups',
                'parent_uid' => 'platform_moderators',
                'permission_slug' => 'handle_customer_service_chats',
                'creator_username' => 'system',
            ],
            [
                'parent_table' => '__user_groups',
                'parent_uid' => 'platform_moderators',
                'permission_slug' => 'handle_flagged_business_elems',
                'creator_username' => 'system',
            ],
            [
                'parent_table' => '__user_groups',
                'parent_uid' => 'platform_moderators',
                'permission_slug' => 'manage_update_posts',
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
        Schema::dropIfExists('__permission_instances');
    }
};
