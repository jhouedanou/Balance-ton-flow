<?php

namespace App\Models;

use App\Traits\Uuids;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends \TCG\Voyager\Models\User
{
    use HasApiTokens, HasFactory, Notifiable, Uuids;


     /**
     * Indicates if the IDs are auto-incrementing.
     *
     * @var bool
     */
    public $incrementing = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'username',
        'role_id',
        'password',
        'provider',
        'provider_id'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */

    protected $casts = [
        'email_verified_at' => 'datetime',
        'id' => 'string'
    ];

    /**
     * Always encrypt the password  when it is updated.
     *
     * @param $value
    * @return string
    */
    public function setPasswordAttribute($value)
    {
    $this->attributes['password'] = bcrypt($value);
    }

    public function isJury()
    {
        return $this->hasRole('jury');
    } 

    public function isContestant()
    {
        return $this->hasRole('contestant');
    } 

    public function isMistere()
    {
        return $this->hasRole(['jury','jury_mystere']);
    }

    public function linkedSocialAccounts()
    {
        return $this->hasOne(LinkedSocialAccount::class);
    }


}
