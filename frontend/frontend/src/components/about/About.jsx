import React from "react"
import Back from "../common/Back"
import Heading from "../common/Heading"
import img from "../images/about.jpg"
import "./about.css"

const About = () => {
  return (
    <>
      <section className='about'>
        <Back name='About Us' title='A propos de nous - Qui sommes nous?' cover={img} />
        <div className='container flex mtop'>
          <div className='left row'>
            <Heading title='Notre histoire' subtitle="Découvrez l'histoire de notre entreprise et notre processus de travail" />

            <p>Nous sommes une équipe passionnée par l'art de la gestion de logements. Depuis notre création, nous nous engageons à offrir une expérience unique à chaque personne qui recherche un endroit où séjourner. Que vous soyez en voyage d'affaires, en vacances ou en quête d'un logement temporaire, notre mission est de rendre votre réservation aussi simple et agréable que possible.</p>
            <p>Notre plateforme met à votre disposition une sélection soigneusement choisie de logements, adaptés à tous les besoins et budgets. Chaque espace est vérifié pour garantir confort, sécurité et qualité. Nous comprenons l'importance de trouver un logement où vous vous sentirez chez vous, et c'est ce que nous nous efforçons de vous offrir à chaque réservation.</p>
            <button className='btn2'>Lire plus</button>
          </div>
          <div className='right row'>
            <img src='./immio.jpg' alt='' />
          </div>
        </div>
      </section>
    </>
  )
}

export default About
