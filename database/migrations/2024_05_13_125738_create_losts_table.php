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
        Schema::create('losts', function (Blueprint $table) {
            $table->id();
            $table->string('descripcion');
            $table->string('photo')->nullable();
            $table->foreignId('departaments_id')
            ->constrained('departaments')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
            $table->foreignId('specials_areas_id')
            ->constrained('specials_areas')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
            $table->date('date of foud');
            $table->date('date of return')->nullable();
            $table->enum('return_object',['devuelto','no devuelto']);
            $table->foreignId('personals_id')
            ->constrained('personals')
            ->cascadeOnUpdate()
            ->cascadeOnDelete();
            $table->timestamps();
            $table->foreignId('rooms_id')
            ->constrained('rooms')
            ->cascadeOnUpdate()
            ->cascadeOnDelete();
            
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('losts');
    }
};
