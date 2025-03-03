import React, { useState, useEffect } from "react";
import "./header.css";
import { nav } from "../../data/Data";
import { Link, useHistory } from "react-router-dom";
import axios from "axios";

const Header = () => {
  const [navList, setNavList] = useState(false);
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const history = useHistory();

  // Vérifier si l'utilisateur est connecté
  useEffect(() => {
    const token = localStorage.getItem("auth_token");
    setIsLoggedIn(!!token); // Si le token existe, isLoggedIn = true
  }, []);

  // Fonction pour gérer la déconnexion via l'API
  const handleLogout = async () => {
    const token = localStorage.getItem("auth_token");

    if (!token) return;

    try {
      await axios.post(
        "http://localhost:8000/api/logout",
        {},
        {
          headers: { Authorization: `Bearer ${token}` },
        }
      );

      // Suppression des données après la confirmation du serveur
      localStorage.removeItem("auth_token");
      localStorage.removeItem("user");
      setIsLoggedIn(false);
      history.push("/"); // Rediriger vers l'accueil
    } catch (error) {
      console.error("Erreur lors de la déconnexion :", error);
    }
  };

  return (
    <header>
      <div className="container flex">
        <div className="logo">
          <h1>MyLogement</h1>
        </div>
        <div className="nav">
          <ul className={navList ? "small" : "flex"}>
            {nav.map((list, index) => (
              <li key={index}>
                <Link to={list.path}>{list.text}</Link>
              </li>
            ))}
          </ul>
        </div>

        <div className="button flex">
          {isLoggedIn ? (
            <button onClick={handleLogout} className="btn1">
              <i className="fa fa-sign-out"></i> Se déconnecter
            </button>
          ) : (
            <Link to="/login" className="btn1">
              <i className="fa fa-sign-in"></i> Se connecter
            </Link>
          )}
        </div>

        <div className="toggle">
          <button onClick={() => setNavList(!navList)}>
            {navList ? <i className="fa fa-times"></i> : <i className="fa fa-bars"></i>}
          </button>
        </div>
      </div>
    </header>
  );
};

export default Header;
