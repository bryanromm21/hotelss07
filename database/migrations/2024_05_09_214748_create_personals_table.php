<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('personals', function (Blueprint $table) {
            $table->id();
            $table->text('name');
            $table->string('photo')->nullable();
            $table->integer('age');
            $table->date('birthdate');
            $table->text('CI')-> unique()->nullable();
            $table->string('nationality')->nullable();
            $table->text('passport')->nullable();
            $table->enum('sex', ['masculino', 'femenino']);
            $table->text('email')-> unique();
            $table->string('emergency_contac');
            
            $table->foreignId('positions_id')
            ->constrained('positions')
            ->cascadeOnUpdate()
            ->cascadeOnDelete();
            $table->foreignId('equips_id')
            ->constrained('equips')
            ->cascadeOnUpdate()
            ->cascadeOnDelete();
            $table->foreignId('users_id')
            ->constrained('users')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('personals');
    }
};
