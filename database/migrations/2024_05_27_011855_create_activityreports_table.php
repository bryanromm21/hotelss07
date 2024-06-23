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
        Schema::create('activityreports', function (Blueprint $table) {
            $table->id();
            $table->foreignId('departaments_id')
            ->constrained('departaments')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
            $table->string('descripcion')->nullable();
            $table->string('observaciones')->nullable();
            $table->enum('progress',['en proceso','finalizado']);
            $table->date('departure date');
            $table->time('entry time');
            $table->time('departure time');
            $table->foreignId('personals_id')
            ->constrained('personals')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
            $table->timestamps();
            $table->foreignId('rooms_id')
            ->constrained('rooms')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
            $table->foreignId('specials_areas_id')
            ->constrained('specials_areas')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
            $table->foreignId('lost_reports_id')
            ->constrained('lost_reports')
            ->cascadeOnUpdate()
            ->cascadeOnDelete()->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('activityreports');
    }
};
