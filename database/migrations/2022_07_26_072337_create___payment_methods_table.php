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
        Schema::create('__payment_methods', function (Blueprint $table) {
            $table->id();
            $table->string('name', 64)->unique();
            $table->string('slug', 64)->unique();
            $table->text('details_required');
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

        DB::table('__payment_methods')->insert([
            [
                'name' => 'Cash in person',
                'slug' => 'cash_in_person',
                'details_required' => json_encode([
                    'address' => 'string,255',
                    'phone_number'=> 'string,16',
                ]),
                'creator_username' => 'system',
            ],
            [
                'name' => 'Stanbic bank transfer',
                'slug' => 'stanbic_bank_transfer',
                'details_required' => json_encode([
                    'account_holder_name' => 'string,255',
                    'account_number'=> 'string,32',
                ]),
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
        Schema::dropIfExists('__payment_methods');
    }
};
