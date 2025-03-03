<?php

use App\Http\Controllers\Api\ProduitController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\LogementController;
use App\Http\Controllers\ReservationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/register', [UserController::class,'register' ]);



Route::post('/login', [UserController::class, 'login']);

Route::get('/logement/get', [LogementController::class, 'getLogement']);

Route::post('/logement/create', [LogementController::class, 'store']);

Route::get('/logement/details/{id}', [LogementController::class, 'details']);


Route::post('/logement/reserver/{id}', [ReservationController::class, 'reserver']);





// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');


Route::middleware('auth:sanctum')->group(function () {

    Route::post('/logout', [UserController::class, 'logout']);






    Route::delete('produit/delete/{produit}', [ProduitController::class, 'delete']);

    Route::put('produit/edit/{produit}', [ProduitController::class, 'edit']);



    Route::put('user/edit/{user}', [UserController::class, 'update']);



    Route::delete('user/delete/{user}', [UserController::class, 'delete']);






    Route::get('/user', function (Request $request) {
        return $request->user();
    });
});
