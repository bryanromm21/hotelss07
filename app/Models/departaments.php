<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class departaments extends Model
{
    use HasFactory;
    protected $fillable=[ 'departaments'];

    public function breakdowns(){
        return $this->hasMany(breakdowns::class, 'id');
    }
    public function stock(){
        return $this->hasMany(stock::class, 'id');
    }

    public function orders(){
        return $this->hasMany(orders::class, 'id');
    }
    public function Losts(){
        return $this->hasMany(Lost::class, 'id');
    }
    public function LostReports(){
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
}
