<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\EditUserRequest;
use App\Http\Requests\LoginUserRequest;
use App\Http\Requests\RegisterUserRequest;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function register (RegisterUserRequest $request){
        try {

            $forbidden = [
                'azerty',
                '0000',
                '1234',
                '12345678910',
                'Azerty',
                '1234567890',

            ];

            if (in_array($request->password, $forbidden)) {

                return response()->json([
                    'status'=>400,
                    'message'=> 'Mot de passe très faible, choississez un plus sécurisé',
                ]);
            }

            if (filter_var($request->email, FILTER_VALIDATE_EMAIL)) {
                $user = new User();
                $user->name = $request->name;
                $user->email = $request->email;
                $user->status = 0;
                $user->password = Hash::make($request->password, [
                    'rounds' => 12
                ]);

            } else {
                return response()->json([
                    'status' => '422',
                    'message' => 'L\'adresse e-mail est invalide.'
                ]);
            }


            if ($user->save()) {

                $model=[
                    'name'=>$user->name,
                    'email'=>$user->email
                ];
                return response()->json([
                    'status'=>201,
                    'message'=>"Utilisateur créé avec succès",
                    'success' => true, // Ajout de cette clé
                    'data'=> $model,
                ]);
            }


        } catch (Exception $e) {
            return response()->json([
                'status' => 500,
                'message' => $e,

            ]);


        }
    }


    public function login(LoginUserRequest $request)
    {
        if (Auth::attempt($request->only(['email', 'password']))) {

            $user = Auth::user();

            if ($user instanceof \App\Models\User) {
                $token = $user->createToken('BIGPEDRO_23')->plainTextToken;
            }


            $model = [
                'name' => $user->name,
                'email' => $user->email
            ];

            return response()->json([
                'status' => 200,
                'message' => 'Utilisateur connecté avec succès',
                'success' => true, // Ajout de cette clé
                'data' => $model,
                'token' => $token
            ]);


        }else{
            return response()->json([
                'status' => 403,
                'message' => 'Informations non valide'
            ]);

        }
    }

    public function update(EditUserRequest $request, User $user){


        try {
            $user->name = $request->name;
            $user->email = $request->name;


            if ($user->save()) {
                return response()->json([
                    'status' => 200,
                    'message' => 'L\'utilisateur a été modifié avec succès',
                    'data' => $user
                ]);
            }

        } catch (Exception $e) {
            return response()->json([
                'status' => 500,
                'message' => 'Erreur lors de la mise à jour de l\'utilisateur.',
                'error' => $e->getMessage()
            ]);
            //throw $th;
        }

    }

    public function delete(User $user){

        try {
            $user->status=2;


            if ($user->save()) {

                $model = [
                    'name' => $user->name,
                    'email' => $user->email
                ];

                return response()->json([
                    'status' => 200,
                    'message' => 'L\'utilisateur a été supprimé avec succes ',
                    'data' => $model
                ]);
            }


        } catch (Exception $e) {
            return response()->json($e);
        }

    }


    public function logout(Request $request)
    {
    
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Utilisateur déconnecté avec succès',
        ]);
    }

}
