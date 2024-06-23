<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Personal extends Model
{
    use HasFactory;
    protected $fillable =['name','photo','age','birthdate','CI','nationality','passport','sex','email','emergency_contac','positions_id','equips_id','user_id'];
    public function positions(){
        return $this->belongsTo(position::class, 'positions_id');
    }
    public function equips(){
        return $this->belongsTo(equip::class, 'equips_id');

    }    

    public function users(){
        return $this->belongsTo(user::class, 'users_id');
    }
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
    public function orderreport(){
        return $this->hasMany(orderreports::class, 'id');
    }
    public function getAge()
    {
        return Carbon::parse($this->birthdate)->age;
    }

    public function stock(){
        return $this->hasMany(stock::class, 'id');
        
    }
    public function orders(){
        return $this->hasMany(orders::class, 'id');
    }
    public function enumEstado() // Método para obtener las opciones del enum
    {
        return self::$sexPersonal;
    }
    public static $sexPersonal = [ // Nombre del enum en español (mayúsculas)
        'masculino' => 'Masculino',
        'femenino' => 'Femenino',
        
    ];
    
   
}


