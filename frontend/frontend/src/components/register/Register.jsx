import React, { useState } from "react";
import { Link, useHistory } from "react-router-dom";
import axios from "axios";
import Back from "../common/Back";
import "../home/recent/recent.css";
import img from "../images/about.jpg";

const Register = () => {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const [errorMessage, setErrorMessage] = useState("");
  const history = useHistory(); // Hook pour rediriger après l'inscription réussie

  // Gérer la soumission du formulaire
  const handleSubmit = async (e) => {
    e.preventDefault();

    // Vérifier que les mots de passe correspondent
 

    try {
      const response = await axios.post("http://localhost:8000/api/register", {
        name,
        email,
        password,
       
      });

      // Si l'inscription est réussie, tu peux rediriger vers la page de connexion ou tableau de bord
      if (response.data.success) {
        history.push("/login"); // Redirection vers la page de connexion après inscription
      } else {
        setErrorMessage(response.data.message || "Une erreur est survenue. Veuillez réessayer.");
      }
    } catch (error) {
      console.error(error);
      setErrorMessage("Une erreur est survenue. Veuillez réessayer.");
    }
  };

  return (
    <section className="blog-out mb">
      <Back name="Inscription" title="Créez votre compte" cover={img} />
      <div className="container recent">
        <div className="login-form">
          <h2>S'inscrire</h2>
          <form onSubmit={handleSubmit}>
            <div className="input-group">
              <label>Nom</label>
              <input
                type="text"
                placeholder="Entrez votre nom"
                value={name}
                onChange={(e) => setName(e.target.value)}
                required
              />
            </div>
            <div className="input-group">
              <label>Email</label>
              <input
                type="email"
                placeholder="Entrez votre email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
              />
            </div>
            <div className="input-group">
              <label>Mot de passe</label>
              <input
                type="password"
                placeholder="Entrez votre mot de passe"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
              />
            </div>
            
            <button type="submit" className="btn1">S'inscrire</button>
            {errorMessage && <p className="error-message">{errorMessage}</p>}
          </form>
          <p className="signup-text">
            Déjà un compte ? <Link to="/login">Se connecter</Link>
          </p>
        </div>
      </div>
    </section>
  );
};

export default Register;
