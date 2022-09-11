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
            $table->string('hex_color', 6)->nullable();
            $table->text('details_required');
            $table->text('choice_currency_codes')->nullable();
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
                'hex_color' => '5e5d4b',
                'details_required' => json_encode(['phone_no']),
                'choice_currency_codes' => null,
                'creator_username' => 'system',
            ],
            [
                'name' => 'Stanbic bank',
                'slug' => 'stanbic_bank',
                'hex_color' => '066ef3',
                'details_required' => json_encode(['account_holder_name', 'account_no' ]),
                'choice_currency_codes' => json_encode(['USD','ZWL']),
                'creator_username' => 'system',
            ],
            [
                'name' => 'FNB bank',
                'slug' => 'fnb_bank',
                'hex_color' => '009eaa',
                'details_required' => json_encode(['account_holder_name', 'account_no' ]),
                'choice_currency_codes' => json_encode(['ZAR']),
                'creator_username' => 'system',
            ],
            [
                'name' => 'Mukuru',
                'slug' => 'mukuru',
                'hex_color' => 'e77924',
                'details_required' => json_encode(['fullname', 'phone_no' ]),
                'choice_currency_codes' => json_encode(['USD']),
                'creator_username' => 'system',
            ],
            [
                'name' => 'Algérie Poste',
                'slug' => 'algerie_poste',
                'hex_color' => '01009a',
                'details_required' => json_encode(['account_holder_name', 'account_no', 'account_key' ]),
                'choice_currency_codes' => json_encode(['DZD']),
                'creator_username' => 'system',
            ],
            [
                'name' => 'MTN Mobile Money',
                'slug' => 'mtn_momo',
                'hex_color' => 'feca05',
                'details_required' => json_encode(['fullname', 'phone_no' ]),
                'choice_currency_codes' => null,
                'creator_username' => 'system',
            ],
            [
                'name' => 'Ecocash',
                'slug' => 'ecocash',
                'hex_color' => '005ba4',
                'details_required' => json_encode(['fullname', 'phone_no' ]),
                'choice_currency_codes' => json_encode(['ZWL']),
                'creator_username' => 'system',
            ],
            [
                'name' => 'Paypal',
                'slug' => 'paypal',
                'hex_color' => '27346a',
                'details_required' => json_encode(['fullname', 'email_address' ]),
                'choice_currency_codes' => json_encode(['USD','EUR','GBP']),
                'creator_username' => 'system',
            ],
            [
                'name' => 'Skrill',
                'slug' => 'skrill',
                'hex_color' => '862165',
                'details_required' => json_encode(['fullname', 'email_address' ]),
                'choice_currency_codes' => null,
                'creator_username' => 'system',
            ],
            [
                'name' => 'World Remit',
                'slug' => 'world_remit',
                'hex_color' => '604684',
                'details_required' => json_encode(['fullname', 'email_address' ]),
                'choice_currency_codes' => null,
                'creator_username' => 'system',
            ],
            [
                'name' => 'Mastercard',
                'slug' => 'mastercard',
                'hex_color' => 'cc0001',
                'details_required' => json_encode(['account_holder_name', 'account_no' ]),
                'choice_currency_codes' => null,
                'creator_username' => 'system',
            ],
            [
                'name' => 'Visa',
                'slug' => 'visa',
                'hex_color' => '0055a5',
                'details_required' => json_encode(['account_holder_name', 'account_no' ]),
                'choice_currency_codes' => null,
                'creator_username' => 'system',
            ],
            [
                'name' => 'FBC Bank',
                'slug' => 'fbc_bank',
                'hex_color' => '0055a5',
                'details_required' => json_encode(['account_holder_name', 'account_no' ]),
                'choice_currency_codes' => json_encode(['USD','ZWL']),
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
