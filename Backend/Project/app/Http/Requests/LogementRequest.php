<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class LogementRequest extends FormRequest
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
                'libelle'=>'required',
                'price'=>'required',
                'location'=>'required',
                'ville'=>'required',
                'nbre_chambre'=>'required',
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
            'libelle.required' => 'Un libellé est requis pour le logement',
            'price.required' => 'Le prix du produit doit etre fourni obligatoirement',
            'location.required' => 'Une adresse ou localisation est requise',
            'ville.required' => 'La ville est requise',
            'nbre_chambre.required' => 'Le nombre de chambre est requis',
            'image.required' => 'L\'image du logement doit etre fourni obligatoirement',

        ];
    }
}
