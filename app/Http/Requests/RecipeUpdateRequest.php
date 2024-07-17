<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class RecipeUpdateRequest extends FormRequest
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
            'lien_video' => 'sometimes|url|max:255',
            'user_id' => 'sometimes|exists:users,id',
            'category_id' => 'sometimes|exists:contest_categories,id',
            'recipe_id' => 'sometimes|exists:recipes,id',
            // other fields
        ];
    }

    public function messages()
    {
        return [
            'lien_video.required' => 'The video link is required.',
            'lien_video.url' => 'The video link must be a valid URL.',
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
