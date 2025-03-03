import React from "react"
import img from "../images/pricing.jpg"
import Back from "../common/Back"
import "./contact.css"

const Contact = () => {
  return (
    <>
      <section className='contact mb'>
        <Back name='Nous contacter' title="Obtenez de l'aide et un support amical" cover={img} />
        <div className='container'>
          <form className='shadow'>
            <h4>Remplissez le formulaire</h4> <br />
            <div>
              <input type='text' required placeholder='Nom' />
              <input type='text' required placeholder='Adresse e-mail' />
            </div>
            <input type='text' required placeholder='Sujet' />
            <textarea cols='30' required rows='10'></textarea>
            <button>Envoyer</button>
          </form>
        </div>
      </section>
    </>
  )
}

export default Contact
