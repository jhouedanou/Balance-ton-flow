<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class RecipeRequest extends FormRequest
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
    public function rules()
    {
        return [
            'imageFile' => ['required'],
            'user_id' => ['string'],
            'category_id' => ['string'],
        ];
    }

    public function messages()
    {
        return [
            'imageFile.required' => 'The video is required.',
            'user_id.required' => 'The user ID is required.',
            'user_id.string' => 'The user ID must be a string.',
            'category_id.required' => 'The category ID is required.',
            'category_id.string' => 'The category ID must be a string.',
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
