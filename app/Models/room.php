<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class room extends Model
{
    use HasFactory;
    protected $fillable =['rooms','rooms_number','rooms_price','rooms_type','capacity','state'];
    public function activities(){
        return $this->hasMany(activity::class, 'id');
    }
    public function Lost () {
        return $this->hasMany(Lost::class, 'id');
    }
    public function LostReports () {
        return $this->hasMany(LostReports::class, 'id');
    }
    public function activityreports(){
        return $this->hasMany(activityreports::class, 'id');
    }
    public function faultreports(){
        return $this->hasMany(faultreports::class, 'id');
    }
    
    public function enumType() // Método para obtener las opciones del enum
    {
        return self::$roomType;
    }
    public static $roomType = [ // Nombre del enum en español (mayúsculas)
        'matrimonial' => 'Matrimonial',
        'doble' => 'Doble',
        'individual' => 'Individual',
        
        
    ];
    protected $casts=[
        'state' => 'array',
    ];

    
}
