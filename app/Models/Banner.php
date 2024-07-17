<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;
use App\Traits\Uuids;
use App\Models\ContestCategory;


class Banner extends Model
{
    use Translatable, Uuids;

    protected $translatable = [];

    protected $table = 'banners';

    protected $fillable = ['category_id','image','active','type'];

    public $incrementing = false;

    public function category()
    {
        return $this->belongsTo(ContestCategory::class, 'category_id');
    }
    
}
