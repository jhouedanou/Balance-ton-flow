<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;
use App\Traits\Uuids;
use App\Models\ContestCategory;
use App\Models\Contestant;
use App\Models\User;

class Recipe extends Model
{
    use Translatable, Uuids;

    protected $translatable = [];

    protected $table = 'recipes';

    protected $fillable = ['user_id', 'category_id','id_video','images','view_count','lien_video'];

    public $incrementing = false;

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function category()
    {
        return $this->belongsTo(ContestCategory::class, 'category_id');
    }

    public function vote()
    {
        return $this->hasMany(Vote::class);
    }

  

   /*  public function incrementReadCount() {
        $this->reads++;
        return $this->save();
    } */

    

    
}
