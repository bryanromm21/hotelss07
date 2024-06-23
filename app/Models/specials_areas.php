<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class specials_areas extends Model
{
    use HasFactory;
    protected $fillable =['Area' , 'Ubicacion'];

    public function activities(){
        return $this->hasMany(activity::class, 'id');
    }
    public function Losts(){
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
    public function breakdowns(){
        return $this->hasMany(breakdowns::class, 'id');
    }
    
}
