<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class activityreports extends Model
{
    use HasFactory;
    protected $fillable =['departaments_id','descripcion','observaciones','progress','departure date','entry time','departure time','personals_id','rooms_id','specials_areas_id','lost_reports_id'];

    public function departaments(){
        return $this->belongsTo(departaments::class, 'departaments_id');
    }
    
    public function positions(){
        return $this->belongsTo(position::class, 'positions_id');
    }
    
    public function personals(){
        return $this->belongsTo(personal::class, 'personals_id');
    }
    public function rooms(){
        return $this->belongsTo(room::class, 'rooms_id');
    }
    public function lost_reports(){
        return $this->belongsTo(LostReports::class, 'lost_reports_id');
    }
    public function specials_areas(){
        return $this->belongsTo(specials_areas::class, 'specials_areas_id');
    }
    public function enumType() // Método para obtener las opciones del enum
    {
        return self::$activityreportsType;
    }
    public static $activityreportsType = [ // Nombre del enum en español (mayúsculas)
        'en proceso' => 'En Proceso',
        'finalizado' => 'Finlizado',

    ];
}
