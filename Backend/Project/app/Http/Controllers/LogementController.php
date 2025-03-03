<?php

namespace App\Http\Controllers;

use App\Http\Requests\LogementRequest;
use App\Models\Logement;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;

class LogementController extends Controller
{
    public function getLogement()
    {
        $logements = Logement::where('status', 0)->get();


        if ($logements->isEmpty()) {
            return response()->json([
                'status' => 404,
                'message' => "Aucun logement trouvé"
            ]);
        } else {
            return response()->json($logements);
        }
    }



    public function store(LogementRequest $request)
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
            $directory = 'logements/images/';
            $path = public_path($directory);

            // Vérifier et créer le dossier s'il n'existe pas
            if (!file_exists($path)) {
                mkdir($path, 0755, true);
            }

            // Déplacer le fichier vers le dossier public/uploads/images/
            $file->move($path, $filename);

            // Stocker le chemin relatif
            $imagePath = $directory . $filename;


            $logement = new Logement();
            $logement->libelle = $request->libelle;
            $logement->price = $request->price;
            $logement->location= $request->location;
            $logement->ville= $request->ville;
            $logement->nbre_chambre = $request->nbre_chambre;
            $logement->image = $imagePath;
            $logement->status = 0;
            $logement->date_created = Carbon::now();
            $logement->created_by = 1;

            // dd($logement);

            if ($logement->save()) {
                return response()->json([
                    'status' => 201,
                    'message' => 'Logement créé avec succès',
                    'data' => [
                        'name' => $logement->libelle,
                        'price' => $logement->price,
                        'location' => $logement->location,
                        'ville' => $logement->ville,
                        'nbre_chambre' => $logement->nbre_chambre,

                    ],
                ]);
            }

            return response()->json([
                'status' => 500,
                'message' => 'Échec de l\'enregistrement du logement',
            ]);

        } catch (Exception $e) {
dd($e);

            return response()->json([
                'status' => 500,
                'message' => 'Erreur lors de la création du logement',
            ]);
        }
    }



    public function details($id)
    {
        $logement = Logement::find($id); // Recherche du logement par ID

        if ($logement) {
            // Si le logement est trouvé, retourner les détails
            return response()->json([
                'status' => 200,
                'message' => 'Logement récupéré avec succès',
                'logement' => $logement
            ]);
        } else {
            // Si le logement n'est pas trouvé
            return response()->json([
                'status' => 404,
                'message' => 'Logement non trouvé',
            ]);
        }
    }

}
