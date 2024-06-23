<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class progress extends Model
{
    use HasFactory;
    protected $fillable =['activities_id'];

    public function activities(){
        return $this->belongsTo(activity::class, 'activities_id');
    }
}
