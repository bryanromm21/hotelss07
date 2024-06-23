<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class activity extends Model
{
    use HasFactory;
    protected $fillable =['date_activities','end_activities','specials_areas_id','descriptions_id','progress','personals_id','rooms_id','equips_id'];
    public function specials_areas(){
        return $this->belongsTo(specials_areas::class, 'specials_areas_id');
    }
    public function descriptions(){
        return $this->belongsTo(description::class, 'descriptions_id');
    }
    public function personals(){
        return $this->belongsTo(personal::class, 'personals_id');
    }
    
    public function rooms(){
        return $this->belongsTo(room::class, 'rooms_id');
    }
    public function equips(){
        return $this->belongsTo(equip::class, 'equips_id');

    }    
    public function progress(){
        return $this->hasMany(progress::class, 'id');
    }
    public function enumType() // Método para obtener las opciones del enum
    {
        return self::$activityType;
    }
    public static $activityType = [ // Nombre del enum en español (mayúsculas)
        'inicio' => 'Inicio',
        'proceso' => 'Proceso',
        'finalizado' => 'Finalizado',
    ];
    
    protected $casts=[
        'state' => 'array',
    ];
}
