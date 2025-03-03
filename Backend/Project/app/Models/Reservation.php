<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Reservation extends Model
{
    public $timestamps = false;

    protected $guarded =[];


    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function logement()
    {
        return $this->belongsTo(Logement::class);
    }
}
