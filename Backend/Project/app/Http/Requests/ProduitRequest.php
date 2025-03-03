<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class ProduitRequest extends FormRequest
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
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name'=>'required',
            'price'=>'required',
            'image'=> 'required|mimes:png,jpg,jpeg,webp|max:2048',
        ];
    }
    public function failedValidation(Validator $validator)

    {

        throw new HttpResponseException(response()->json([
            'success' => false,
            'error' => true,
            'message' => "erreur de validation",
            'errorsList' => $validator->errors()

        ]));

}

    public function messages()
    {
        return [
            'name.required' => 'Le nom du produit doit etre fourni obligatoirement',
            'price.required' => 'Le prix du produit doit etre fourni obligatoirement',
            'image.required' => 'L\'image du produit doit etre fourni obligatoirement',

        ];
    }

}
