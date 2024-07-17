<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class GuestRegisterRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */

    public function rules(): array
    {
       
             return [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|unique:users,email',
            'username' => 'required|unique:users,username',
            'password' => 'required|string|min:8|confirmed',
            'password_confirmation' => 'required|same:password'
        ];
        
    }

    public function messages()
    {
        return [
            'password.required' => 'Veuillez entrer le mot de passe',
            'password.confirmed' => 'Veuillez indiquer le même mot de passe',
            'username.required' => 'Veuillez entrer le nom utilisateur.',
            'first_name.required' => 'Veuillez entrer votre prénom.',
            'last_name.required' => 'Veuillez entrer votre nom.',
            'email.required' => 'Veuillez entrer un email valide',
        ];
    }

    /**
     * Handle a failed validation attempt.
     *
     * @param  \Illuminate\Contracts\Validation\Validator  $validator
     * @throws \Illuminate\Http\Exceptions\HttpResponseException
     */
    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors();

        throw new HttpResponseException(response()->json([
            'success' => false,
            'message' => 'Validation errors',
            'errors' => $errors,
        ], 422));
    }
}
