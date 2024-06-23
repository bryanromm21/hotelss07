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
        Schema::create('breakdowns', function (Blueprint $table) {
            $table->id();
            $table->text('description');
            $table->dateTime('date_breakdowns');
            $table->string('state');
            $table->enum('priority', ['Alta', 'Media','Baja']);
            $table->string('photo')->nullable();
            $table->foreignId('personals_id')
            ->constrained('personals')
            ->cascadeOnUpdate()
            ->cascadeOnDelete();
            $table->timestamps();
            $table->foreignId('rooms_id')
            ->constrained('rooms')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
            
            $table->foreignId('departaments_id')
            ->constrained('departaments')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
            $table->foreignId('specials_areas_id')
            ->constrained('specials_areas')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('breakdowns');
    }
};
