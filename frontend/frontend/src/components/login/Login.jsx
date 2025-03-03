import React, { useState } from "react";
import { Link, useHistory } from "react-router-dom";
import axios from "axios";
import Back from "../common/Back";
import "../home/recent/recent.css";
import img from "../images/about.jpg";

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [errorMessage, setErrorMessage] = useState("");
  const history = useHistory(); // Hook pour la redirection

  // Gérer la soumission du formulaire
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post("http://localhost:8000/api/login", {
        email,
        password,
      });

      if (response.data.status === 200) {
        // Stocker le token et les infos utilisateur dans le localStorage
        localStorage.setItem("auth_token", response.data.token);
        localStorage.setItem("user", JSON.stringify(response.data.data));

        alert("Connexion réussie !");
        history.push("/"); // Redirection vers la page d'accueil
      } else {
        setErrorMessage("Identifiants incorrects");
      }
    } catch (error) {
      console.error(error);
      setErrorMessage("Une erreur est survenue. Veuillez réessayer.");
    }
  };

  return (
    <section className="blog-out mb">
      <Back name="Connexion" title="Connectez-vous à votre compte" cover={img} />
      <div className="container recent">
        <div className="login-form">
          <h2>Se connecter</h2>
          <form onSubmit={handleSubmit}>
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
            <button type="submit" className="btn1">Se connecter</button>
            {errorMessage && <p className="error-message">{errorMessage}</p>}
          </form>
          <p className="signup-text">
            Pas de compte ? <Link to="/register">S'inscrire</Link>
          </p>
        </div>
      </div>
    </section>
  );
};

export default Login;
