<?php
namespace App\Gates;
use App\Models\Role;
use Illuminate\Support\Facades\Auth;

class CommonGate
{
    public function isAdmin($user){

        $role = Role::where('id',$user->role_id)->first();  
        return $role->slug === 'admin' ? true : false;
    }

    public function isContestant($user){
       
        $role = Role::where('id',$user->role_id)->first();     
        return $role->slug === 'contestant' ? true : false;
    }

    public function isJury($user){
       
        $role = Role::where('id',$user->role_id)->first();     
        return $role->slug === 'jury' ? true : false;
    }
    
}
