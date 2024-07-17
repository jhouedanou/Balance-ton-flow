<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreContestantRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'last_name' => 'required|string|max:255',
            'first_name' => 'required|string|max:255',
            'ville' => 'required|string|max:255',
            'quartier' => 'required|string|max:255',
            'cgu' => 'required|boolean',
            'user_id' => 'required|exists:users,id',
            'telephone' => 'required|string|max:20',
            'photo' => 'nullable|string|max:255',
            'bio' => 'nullable|string',
            'slug' => 'required|string|max:255|unique:contestants,slug',
        ];
    }
}
