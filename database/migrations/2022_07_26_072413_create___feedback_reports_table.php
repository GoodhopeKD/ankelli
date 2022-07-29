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
        Schema::create('__feedback_reports', function (Blueprint $table) {
            $table->id();
            $table->string('ticket_code', 16)->unique();
            $table->foreignId('session_id')
                    ->nullable()
                    ->constrained('__sessions')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->enum('type', ['bug_report', 'crash_report', 'vulnerability_report', 'abuse_report', 'appreciation_message', 'contact_form_message']);
            $table->string('title', 32);
            $table->text('message');
            $table->string('creator_name', 32);
            $table->string('creator_email_address', 64);
            $table->text('closing_note')->nullable();
            $table->enum('status', ['open', 'closed'])->default('open');

            $table->string('creator_username', 64)->nullable();
            $table->foreign('creator_username')
                    ->references('username')
                    ->on('__users')
                    ->onUpdate('cascade')
                    ->onDelete('set null');
            $table->timestamp('created_datetime')->useCurrent();
            $table->timestamp('updated_datetime')->nullable()->useCurrentOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('__feedback_reports');
    }
};
