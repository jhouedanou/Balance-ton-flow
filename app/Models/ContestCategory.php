<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;
use App\Traits\Uuids;

class ContestCategory extends Model
{
    use Translatable, Uuids;

    protected $translatable = ['slug', 'name'];

    protected $table = 'contest_categories';

    protected $fillable = ['slug', 'name','description','active','start_recipe', 'end_recipe','start_vote', 'end_vote'];

    public $incrementing = false;

    public function posts()
    {
        return $this->hasMany(Voyager::modelClass('Post'))
            ->published()
            ->orderBy('created_at', 'DESC');
    }

    public function parentId()
    {
        return $this->belongsTo(self::class);
    }
}
