<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class products extends Model
{
    use HasFactory;

    protected $fillable =['products','stock','brand','categories_id'];


    
    public function category(){
        return $this->belongsTo(category::class,'categories_id');
    }

    public function stock(){
        return $this->hasMany(stock::class, 'id');
    }

    public function orders(){
        return $this->hasMany(orders::class, 'id');
    }
    public function orderreport(){
        return $this->hasMany(orderreports::class, 'id');
    }
}