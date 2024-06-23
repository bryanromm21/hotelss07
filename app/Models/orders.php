<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class orders extends Model
{
    use HasFactory;

    protected $fillable =['date','amount','personals_id','departaments_id','products_id'];
    public function Personals(){
        return $this->belongsTo(Personal::class, 'personals_id');
    }

    public function departaments(){
        return $this->belongsTo(departaments::class, 'departaments_id');
    }

    public function products(){
        return $this->belongsTo(products::class, 'products_id');
    }
}
