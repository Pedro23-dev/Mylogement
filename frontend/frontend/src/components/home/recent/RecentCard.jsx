import React, { useState, useEffect } from "react";
import axios from "axios"; // Importer axios
import { useHistory } from "react-router-dom"; // Importer useHistory pour la navigation

const RecentCard = () => {
  const [properties, setProperties] = useState([]); // Liste des propriétés
  const [loading, setLoading] = useState(false); // État de chargement
  const history = useHistory(); // Utilisation de useHistory pour rediriger

  // Charger les logements
  useEffect(() => {
    setLoading(true);
    axios.get("http://localhost:8000/api/logement/get")
      .then((response) => {
        console.log("Réponse de l'API :", response);
        setProperties(response.data); // Mettre à jour les logements
        setLoading(false);
      })
      .catch((error) => {
        console.error("Erreur lors du chargement des propriétés", error);
        setLoading(false);
      });
  }, []);



  // Fonction pour naviguer vers la page de détails du logement
const handleViewDetails = (propertyId) => {
  history.push(`/details/${propertyId}`); // Changer '/logement/${propertyId}' en '/details/${propertyId}'
};


  return (
    <div className="content grid3 mtop">
      {properties.map((property, index) => {
        const { id, image, category, location, ville, libelle, price, type, nbre_chambre } = property;
        return (
          <div className="box shadow" key={index}>
            <div className="img">
              <img src={`http://localhost:8000/${image}`} alt={libelle} />
            </div>
            <div className="text">
              <div className="category flex">
                <span style={{ background: category === "For Sale" ? "#25b5791a" : "#ff98001a", color: category === "For Sale" ? "#25b579" : "#ff9800" }}>
                  {category}
                </span>
                <i className="fa fa-heart"></i>
              </div>
              <h4>{libelle}</h4>
              <p>Nombre de chambre: {nbre_chambre}</p>
              <p><i className="fa fa-location-dot"></i> {ville}</p>
              <p><i className="fa fa-location-dot"></i> {location}</p>
            </div>
            <div className="button flex">
              <div>
                <button className="btn2">{price}</button> <label>FCFA</label>
              </div>
              <span>{type}</span>
            </div>
            {/* Ajouter un bouton "Voir plus" qui redirige vers la page de détails */}
            <div className="view-more">
              <button onClick={() => handleViewDetails(id)} className="btn-view-more">Voir plus</button>
            </div>
          </div>
        );
      })}
    </div>
  );
};

export default RecentCard;
