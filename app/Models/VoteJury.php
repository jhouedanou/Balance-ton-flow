<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;
use App\Traits\Uuids;
use App\Models\ContestCategory;
use App\Models\Recipe;


class VoteJury extends Model
{
    use Translatable, Uuids;

    protected $translatable = [];

    protected $table = 'vote_jury';

    protected $fillable = ['votes','user_id','category_id','recipe_id','owner_id'];

    public $incrementing = false;

    public function user()
    {
        return $this->belongsTo(Voyager::modelClass('User'), 'user_id');
    }

    public function category()
    {
        return $this->belongsTo(ContestCategory::class, 'category_id');
    }

    public function recipe()
    {
        return $this->belongsTo(Recipe::class, 'recipe_id');
    }


    public function candidat()
    {
        return $this->belongsTo(Voyager::modelClass('User'), 'owner_id');
    }
}
