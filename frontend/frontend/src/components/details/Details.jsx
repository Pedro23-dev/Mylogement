import React, { useState, useEffect } from "react";
import axios from "axios";
import "./Details.css";
import { useParams, useHistory } from "react-router-dom"; // Importer useHistory pour rediriger

const Details = () => {
  const { id } = useParams(); // Récupérer l'ID du logement dans l'URL
  const [property, setProperty] = useState(null);
  const [isReserved, setIsReserved] = useState(false); // État pour suivre la réservation
  const history = useHistory();

  useEffect(() => {
    // Appel API pour récupérer les détails du logement avec l'ID
    axios.get(`http://localhost:8000/api/logement/details/${id}`)
      .then((response) => {
        if (response.data.status === 200) {
          setProperty(response.data.logement);
        } else {
          console.error("Le logement n'a pas été trouvé");
        }
      })
      .catch((error) => {
        console.error("Erreur lors du chargement des détails du logement", error);
      });
  }, [id]);

  const handleReservation = () => {
    const token = localStorage.getItem("auth_token");
    
    if (!token) {
      alert("Veuillez vous connecter avant de réserver !");
      history.push("/login"); // Rediriger vers la page de connexion
      return;
    }
  
    axios.post(`http://localhost:8000/api/logement/reserver/${id}`, {}, {
      headers: { Authorization: `Bearer ${token}` } 
    })
    .then((response) => {
      if (response.data.status === 200) {
        setIsReserved(true);
        alert("Réservation réussie !");
        history.push("/confirmation");
      }
    })
    .catch((error) => {
      console.error("Erreur lors de la réservation", error);
      alert("Une erreur est survenue lors de la réservation.");
    });
  };
  

  return (
    <div className="logement-details">
      {property ? (
        <div>
          <h1>{property.libelle}</h1>
          <img src={`http://localhost:8000/${property.image}`} alt={property.libelle} />
          <p className="price">Prix: {property.price} FCFA</p>
          <p><strong>Type:</strong> {property.type}</p>
          <p><strong>Ville:</strong> {property.ville}</p>
          <p><strong>Adresse:</strong> {property.location}</p>
          <p><strong>Nombre de chambres:</strong> {property.nbre_chambre}</p>
          <p className="description">{property.description}</p>
          
          {/* Bouton Réserver */}
          {!isReserved ? (
            <button className="reserve-btn" onClick={handleReservation}>
              Réserver
            </button>
          ) : (
            <p className="reserved-message">Ce logement est déjà réservé.</p>
          )}
        </div>
      ) : (
        <p className="loading">Chargement...</p>
      )}
    </div>
  );
};

export default Details;
