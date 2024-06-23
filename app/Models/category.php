<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class category extends Model
{
    use HasFactory;

    protected $fillable =['categories'];

    public function products(){
        return $this->hasMany(products::class, 'id');
    }
    public function orderreport(){
        return $this->hasMany(orderreports::class, 'id');
    }
}
