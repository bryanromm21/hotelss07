<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lost extends Model
{
    use HasFactory;
    protected $fillable = ['descripcion','photo', 'departaments_id','specials_areas_id',  'date of foud','date of return','return_object','personals_id', 'rooms_id' ];

public function personals(){
    return $this->belongsTo(Personal:: class, 'personals_id' );
}
public function rooms(){
    return $this->belongsTo(room:: class, 'rooms_id');
}
public function departaments(){
    return $this->belongsTo(departaments::class, 'departaments_id');
}
public function specials_areas(){
    return $this->belongsTo(specials_areas::class, 'specials_areas_id');
}

public function enumType() // Método para obtener las opciones del enum
    {
        return self::$lostType;
    }
    public static $lostType = [ // Nombre del enum en español (mayúsculas)
        'devuelto' => 'Devuelto',
        'no devuelto' => 'No Devuelto',
    ];


}



