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
        Schema::create('__pymt_methods', function (Blueprint $table) {
            $table->id();
            $table->string('name', 64)->unique();
            $table->string('slug', 64)->unique();
            $table->text('details_required');
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

        DB::table('__pymt_methods')->insert([
            [
                'name' => 'Cash in person',
                'slug' => 'cash_in_person',
                'details_required' => json_encode([
                    'address' => '255',
                    'phone_number'=> '16',
                ]),
                'creator_username' => 'system',
            ],
            [
                'name' => 'Stanbic bank',
                'slug' => 'stanbic_bank',
                'details_required' => json_encode([
                    'account_holder_name' => '255',
                    'account_number'=> '32',
                ]),
                'creator_username' => 'system',
            ],
            [
                'name' => 'FNB bank',
                'slug' => 'fnb_bank',
                'details_required' => json_encode([
                    'account_holder_name' => '255',
                    'account_number'=> '32',
                ]),
                'creator_username' => 'system',
            ],
            [
                'name' => 'Mukuru',
                'slug' => 'mukuru',
                'details_required' => json_encode([
                    'recepient_name' => '255',
                    'recepient_number'=> '32',
                ]),
                'creator_username' => 'system',
            ],
            [
                'name' => 'Algérie Poste',
                'slug' => 'algerie_poste',
                'details_required' => json_encode([
                    'account_holder_name' => '255',
                    'account_number'=> '32',
                    'account_key'=> '2',
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
        Schema::dropIfExists('__pymt_methods');
    }
};
