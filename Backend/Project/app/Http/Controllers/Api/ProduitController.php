<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\EditProduitRequest;
use App\Http\Requests\ProduitRequest;
use App\Models\Produit;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProduitController extends Controller
{
    // public function store(ProduitRequest $request)
    // {

    //     if ($request->hasFile('image')) {
    //         $file = $request->file('image');

    //         if ($file->isValid()) {
    //             $extension = $file->getClientOriginalExtension();
    //             $filename = time() . '.' . $extension;

    //             // Définir le chemin du dossier dans "public/uploads/images/"
    //             $path = public_path('uploads/images/');

    //             // Vérifier et créer le dossier s'il n'existe pas
    //             if (!file_exists($path)) {
    //                 mkdir($path, 0755, true);
    //             }

    //             // Déplacer le fichier vers le dossier public/uploads/images/
    //             $file->move($path, $filename);

    //             // Stocker le chemin de l'image dans une variable
    //             $imagePath = 'uploads/images/' . $filename;
    //         }



    //             // return response()->json([
    //             //     'message' => 'Fichier uploadé avec succès !',
    //             //     'path' => $path . $filename
    //             // ]);
    //         } else {
    //             return response()->json([
    //                 'error' => 'Le fichier uploadé est invalide.'
    //             ], 422);
    //         }
    //     } else {
    //         return response()->json([
    //             'error' => 'Aucun fichier n\'a été uploadé.'
    //         ], 422);
    //     }

    //     try {
    //         $produit = new Produit();
    //         $produit->name = $request->name;
    //         $produit->price = $request->price;
    //         $produit->image = $path . $filename;
    //         $produit->status = 0;
    //         $produit->date_created = Carbon::now();
    //         $produit->created_by = 1;

    //         if ($produit->save()) {

    //             $model = [
    //                 'name' => $produit->name,
    //                 'price' => $produit->price
    //             ];

    //             return response()->json([
    //                 'status' => 201,
    //                 'message' => 'Produit créé avec succès',
    //                 'data' => $model,
    //             ]);
    //         }
    //     } catch (Exception $e) {
    //         dd($e);

    //         return response()->json([
    //             'status' => 500,
    //             'message' => 'Erreur lors de la création du produit',
    //         ]);
    //     }
    // }

    public function getProduct()
    {
        $produit = Produit::where('status', 0)->get();
        return response()->json($produit);
    }

    public function store(ProduitRequest $request)
    {
        try {
            if (!$request->hasFile('image')) {
                return response()->json([
                    'error' => 'Aucun fichier n\'a été uploadé.'
                ], 422);
            }

            $file = $request->file('image');

            if (!$file->isValid()) {
                return response()->json([
                    'error' => 'Le fichier uploadé est invalide.'
                ], 422);
            }

            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;

            // Définir le chemin du dossier relatif
            $directory = 'uploads/images/';
            $path = public_path($directory);

            // Vérifier et créer le dossier s'il n'existe pas
            if (!file_exists($path)) {
                mkdir($path, 0755, true);
            }

            // Déplacer le fichier vers le dossier public/uploads/images/
            $file->move($path, $filename);

            // Stocker le chemin relatif
            $imagePath = $directory . $filename;


            $produit = new Produit();
            $produit->name = $request->name;
            $produit->price = $request->price;
            $produit->image = $imagePath;
            $produit->status = 0;
            $produit->date_created = Carbon::now();
            $produit->created_by = 1;

            // dd($produit);

            if ($produit->save()) {
                return response()->json([
                    'status' => 201,
                    'message' => 'Produit créé avec succès',
                    'data' => [
                        'name' => $produit->name,
                        'price' => $produit->price
                    ],
                ]);
            }

            return response()->json([
                'status' => 500,
                'message' => 'Échec de l\'enregistrement du produit',
            ]);

        } catch (Exception $e) {
dd($e);

            return response()->json([
                'status' => 500,
                'message' => 'Erreur lors de la création du produit',
            ]);
        }
    }


    public function delete(Produit $produit)
    {
        try {

            // $userId = Auth::id();
            // if (!$userId) {
            //     return response()->json([
            //         'status' => 401,
            //         'message' => 'Non authentifié.',
            //     ], 401);
            // }

            // if ($produit->created_by !== $userId) {
            //     return response()->json([
            //         'status' => 403,
            //         'message' => 'Vous n\'êtes pas l\'auteur de ce produit pour le supprimer.',
            //     ], 403);
            // }

            $produit->status = 2;

            if ($produit->save()) {

                $model = [
                    'name' => $produit->name,
                    'price' => $produit->price,
                ];
                return response()->json([
                    'status' => 201,
                    'message' => 'Le produit a été supprimé avec succès.',
                    'data' => $model,
                ]);
            } else {
                return response()->json([
                    'status' => 500,
                    'message' => 'Une erreur est survenue lors de la suppression du produit.',
                ]);
            }
        } catch (Exception $e) {
            dd($e);
            return response()->json([
                'status' => 500,
                'message' => 'Erreur interne du serveur.',
            ]);
        }
    }

    public function edit(Request $request, Produit $produit)
    {


        try {
            $request->validate([

                'name' => 'required',
                'price' => 'required',
                'image' => 'nullable|mimes:png,jpg,jpeg,webp|max:2048',

            ],
            [
                'name.required' =>'Le nom est requis',
                'price.required' =>'Le prix est requis',
            ]
        );

            if ($request->has('image')) {
                $file = $request->file('image');
                $extension = $file->getClientOriginalExtension();
                $filename = time() . '.' . $extension;
                $path = 'uploads/images/';

                if (!file_exists($path)) {
                    mkdir($path, 0755, true);
                }

                // Déplacer le fichier vers le dossier approprié
                $file->move($path, $filename);


                $produit->image = $path . $filename;
            }


            $produit->name = $request->name;
            $produit->price = $request->price;
            $produit->date_updated = Carbon::now();
            $produit->updated_by = 1;

            // dd($produit);

            // dd(2);

            if ($produit->save()) {

                $model = [
                    'name' => $produit->name,
                    'price' => $produit->price
                ];

                return response()->json([
                    'status' => 201,
                    'message' => 'Produit modifié avec succès',
                    'data' => $model,
                ]);
            }
        } catch (Exception $e) {
            dd($e);

            return response()->json([
                'status' => 500,
                'message' => 'Erreur lors de la modification du produit',
            ]);
            //throw $th;
        }


            // dd($e);

        }
    }



