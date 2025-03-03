# Mon Projet (Laravel API + React Frontend)

Ce projet est une application web utilisant **Laravel** pour le backend et **React** pour le frontend.  
Il est organisé en deux dossiers :
- `backend/` : Contient l'API Laravel.
- `frontend/` : Contient l'application React.

## 🚀 Installation et Exécution

### 1️⃣ Backend (Laravel API)

#### 📌 Prérequis
Avant d'exécuter le backend, assure-toi d'avoir installé :
- PHP (>= 8.x)
- Composer
- MySQL (ou SQLite/PostgreSQL)
- Node.js (si utilisation de Webpack)

#### ⚙️ Installation
1. Aller dans le dossier `backend`.
2. Installer les dépendances avec Composer.
3. Copier le fichier de configuration `.env` et générer la clé d'application.
4. Configurer la base de données dans le fichier `.env`.
5. Exécuter les migrations et insérer les données initiales.
6. Démarrer le serveur Laravel.

L'API sera accessible sur `http://127.0.0.1:8000`.

---

### 2️⃣ Frontend (React App)

#### 📌 Prérequis
Avant d'exécuter le frontend, assure-toi d'avoir installé :
- Node.js (>= 18.x)
- npm ou yarn

#### ⚙️ Installation
1. Aller dans le dossier `frontend`.
2. Installer les dépendances avec npm ou yarn.
3. Lancer le serveur en mode développement.

L'application sera accessible à `http://localhost:3000`.

---

## 🔗 API et Configuration CORS

Si le frontend et le backend sont hébergés sur des domaines ou ports différents, il est nécessaire d'activer **CORS** dans Laravel pour permettre la communication entre les deux.

---

## 🎯 Déploiement

### 🚀 Backend (Laravel)
Le backend peut être déployé sur un serveur ou une plateforme comme Laravel Forge, Heroku ou un VPS. Il faut s'assurer que la base de données est bien configurée et exécuter les migrations en production.

### 🚀 Frontend (React)
Le frontend peut être hébergé sur des plateformes comme Vercel, Netlify ou un serveur Nginx. Avant le déploiement, il faut générer une version optimisée de l'application.

---

## 📌 Auteurs
- **Ton Nom** – Développeur Fullstack  
- 📧 Contact : ton-email@example.com  
