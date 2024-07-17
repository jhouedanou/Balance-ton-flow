<?php
 namespace App\Http\Requests;

 use Illuminate\Foundation\Http\FormRequest;

 use Illuminate\Contracts\Validation\Validator;
 use Illuminate\Http\Exceptions\HttpResponseException;

 class RegisterRequest extends FormRequest
 {
     /**
      * Determine if the user is authorized to make this request.
      */
     public function authorize(): bool
     {
         return true;
     }

     /**
      * Get the validation rules that apply to the request.
      */
     public function rules(): array
     {
         return [
             'first_name' => 'required|string|max:255',
             'last_name' => 'required|string|max:255',
             'username' => 'required|string|max:255|unique:users,username',
             'email' => 'required|unique:users,email',
             'password' => 'required|string|min:8|confirmed',
             'password_confirmation' => 'required|same:password',
             'ville' => 'required|string|max:255',
             'quartier' => 'required|string|max:255',
             'cgu' => 'required|boolean',
             'telephone' => 'required|string|max:20',
             'photo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
             'bio' => 'nullable|string|max:1000',
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
            'ville.required' => 'Veuillez entrer votre ville',
            'quartier.required' => 'Veuillez entrer votre quartier',
            'cgu.required' => 'Veuillez cocher la case',
            'telephone.required' => 'Veuillez entrer un numéro de téléphone',
            'photo.required' => 'Veuillez télécharger une photo de profile ',
            'photo.mimes' => 'Votre photo dois être de type :jpeg,png,jpg,gif,svg',
            'photo.max' => 'La taille maximale est de : 2 MO',
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


