<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class orderreports extends Model
{
    use HasFactory;
    protected $fillable =['departaments_id','date','personals_id','categories_id','products_id'];

    public function departaments(){
        return $this->belongsTo(departaments::class, 'departaments_id');
    }
    public function personals(){
        return $this->belongsTo(personal::class, 'personals_id');
    }
    public function categories(){
        return $this->belongsTo(category::class, 'categories_id');
    }
    public function products(){
        return $this->belongsTo(products::class, 'products_id');
    }
    
}
