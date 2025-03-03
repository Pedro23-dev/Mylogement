<?php

namespace App\Http\Controllers;

use App\Models\Logement;
use App\Models\Reservation;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    public function reserver($id)
{
    // Vérifier si le logement existe
    $logement = Logement::find($id);

    if (!$logement) {
        return response()->json([
            'status' => 404,
            'message' => 'Logement non trouvé',
        ]);
    }

    // Créer une réservation pour l'utilisateur authentifié
    $reservation = Reservation::create([
        'user_id' => 1,
        'logement_id' => $logement->id, // ID du logement
        'date_reservation' => Carbon::now(), // Date de réservation actuelle
        'status' => 0, // Date de réservation actuelle
    ]);

    return response()->json([
        'status' => 200,
        'message' => 'Réservation réussie',
        'reservation' => $reservation,
    ]);
}
}
