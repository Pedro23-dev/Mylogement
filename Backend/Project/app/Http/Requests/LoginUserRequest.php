<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class LoginUserRequest extends FormRequest
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
            'email' => 'required|email|exists:users,email',
            'password' => 'required',
        ];
    }


    public function failedValidation(Validator $validator)

    {

        throw new HttpResponseException(response()->json([
            'success' => false,
            'status' => 422,
            'error' => true,
            'message' => "erreur de validation",
            'errorsList' => $validator->errors()

        ]));
    }

    public function messages()
    {
        return [
            'email.required' => 'Un email doit etre fourni obligatoirement',
            'email.exists' => 'Addresse email ou mot de passe introuvable',
            'email.email' => 'Addresse email ou mot de passe invalide',
            'password.required' => 'Le mot de passe est requis'

        ];
    }
}
