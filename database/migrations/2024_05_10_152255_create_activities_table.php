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
        Schema::create('activities', function (Blueprint $table) {
            $table->id();
            $table->dateTime('date_activities');
            $table->dateTime('end_activities');
            
            $table->foreignId('specials_areas_id')
            ->constrained('specials_areas')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();

            $table->foreignId('descriptions_id')
            ->constrained('descriptions')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
            $table->enum('progress',['inicio','proceso','finalizado']);
            $table->foreignId('personals_id')
            ->constrained('personals')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
            $table->timestamps();
            $table->foreignId('rooms_id')
            ->constrained('rooms')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
            $table->foreignId('equips_id')
            ->constrained('equips')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
            
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('activities');
    }
};
