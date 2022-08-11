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
        Schema::create('__permissions', function (Blueprint $table) {
            $table->id();
            $table->string('name', 64)->unique();
            $table->string('slug', 64)->unique();
            $table->unique(['name', 'slug']);
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
        });

        DB::table('__permissions')->insert([
            // _UserGroups: platform_administrators
            [
                'name' => 'Update system config params',
                'slug' => 'update_sysconfig_params',
                'description' => 'Permission holder can update system config params.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Handle feedback reports',
                'slug' => 'handle_feedback_reports',
                'description' => 'Permission holder can handle feedback reports.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Manage datalists',
                'slug' => 'manage_datalists',
                'description' => 'Permission holder can manage datalists.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Manage system tools',
                'slug' => 'manage_systools',
                'description' => 'Permission holder can manage system tools.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'View all logs',
                'slug' => 'view_all_logs',
                'description' => 'Permission holder can view all logs.',
                'creator_username' => 'system',
            ],
            // _UserGroups: business_administrators
            [
                'name' => 'View all transactions',
                'slug' => 'view_all_transactions',
                'description' => 'Permission holder can view all transactions.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Manage Deposit Tokens',
                'slug' => 'manage_deposit_tokens',
                'description' => 'Permission holder can create and edit deposit tokens.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Handle Withdrawals',
                'slug' => 'handle_withdrawals',
                'description' => 'Permission holder can handle withdrawals.',
                'creator_username' => 'system',
            ],
            // _UserGroups: user_administrators
            [
                'name' => 'Manage Registration Tokens',
                'slug' => 'manage_reg_tokens',
                'description' => 'Permission holder can create and edit registration tokens.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Handle flagged users',
                'slug' => 'handle_flagged_users',
                'description' => 'Permission holder can handle flagged Users.',
                'creator_username' => 'system',
            ],
            // _UserGroups: platform_moderators
            [
                'name' => 'Handle customer service chats',
                'slug' => 'handle_customer_service_chats',
                'description' => 'Permission holder can handle customer service chats.',
                'creator_username' => 'system',
            ],
            [
                'name' => 'Manage update posts',
                'slug' => 'manage_update_posts',
                'description' => 'Permission holder can handle posting and editing update posts.',
                'creator_username' => 'system',
            ],
            // _UserGroups: platform_moderators, business_administrators
            [
                'name' => 'Handle flagged business elems',
                'slug' => 'handle_flagged_business_elems',
                'description' => 'Permission holder can handle flagged business elems (Offers, Trades, etc).',
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
        Schema::dropIfExists('__permissions');
    }
};
