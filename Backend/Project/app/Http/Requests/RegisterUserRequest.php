<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
// use Illuminate\Validation\Validator;

class RegisterUserRequest extends FormRequest
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
            'email'=>'required|unique:users,email',
            'password'=>'required',
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
            'name.required' => 'Un nom doit etre fourni obligatoirement',
            'email.required' => 'Un email doit etre fourni obligatoirement',
            'email.unique' => 'Cette adresse mail est déjà prise',
            'password.required' => 'Le mot de passe est requis'

        ];

    }

}
