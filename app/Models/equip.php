<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class equip extends Model
{
    use HasFactory;

    protected $fillable=[ 'name'];
    public function activities(){
        return $this->hasMany(activity::class, 'id');
    }
    public function equips(){
        return $this->hasMany(equip::class, 'id');
    }
}
