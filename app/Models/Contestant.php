<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;
use App\Traits\Uuids;


class Contestant extends Model
{
    use Translatable, Uuids;

    protected $translatable = [];

    protected $table = 'contestants';

    protected $fillable = ['last_name', 'first_name', 'ville','quartier', 'cgu', 'user_id','telephone','photo','bio','slug'];

    public $incrementing = false;

    public function user()
    {
        return $this->belongsTo(Voyager::modelClass('User'), 'user_id');
    }


    
}
