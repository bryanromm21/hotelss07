<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class breakdowns extends Model
{
    use HasFactory;
    protected $fillable=[ 'description', 'date_breakdowns','state','priority','photo','personals_id','rooms_id','departaments_id','specials_areas_id'];

    public function personals(){
        return $this->belongsTo(personal::class, 'personals_id');
    }
    public function rooms(){
        return $this->belongsTo(room::class, 'rooms_id');
    }
    public function departaments(){
        return $this->belongsTo(departaments::class, 'departaments_id');
    }
    public function specials_areas(){
        return $this->belongsTo(specials_areas::class, 'specials_areas_id');
    }
    public static $state = [ // Nombre del enum en español (mayúsculas) 'limpio', 'Sucio','Mantenimiento', 'Ocupado','Desocupado','Bloqueado'
       'limpio' => 'limpio',
        'Sucio' => 'Sucio',
       'Mantenimiento' => 'Mantenimiento',
       'Ocupado' => 'Ocupado',
        'Desocupado' => 'Desocupado',
        'Bloqueado' => 'Bloqueado',
        
    ];
    public static $priority = [ // Nombre del enum en español (mayúsculas) ['Alta', 'Media','Baja'])
        'Alta' => 'Alta',
        'Media' => 'Media',
        'Baja' => 'Baja',

    ];
     protected $casts=[
        'state' => 'array',
    ];

}
