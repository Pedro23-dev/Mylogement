import React from "react"
import { footer } from "../../data/Data"
import "./footer.css"


const Footer = () => {
  return (
    <>
      <section className='footerContact'>
        <div className='container'>
          <div className='send flex'>
            <div className='text'>
              <h1>Avez vous des questions ?</h1>
              <p>We'll help you to grow your career and growth.</p>
            </div>
            <button className='btn5'>Nous contacter</button>
          </div>
        </div>
      </section>

      <footer>
        <div className='container'>
          <div className='box'>
            <div className='logo'>
              <h1>MyLogement</h1>
              <h2>Avez vous besoin d'aide sur quelque chose ?</h2>
              {/* <p>Receive updates, hot deals, tutorials, discounts sent straignt in your inbox every month</p> */}

              <div className='input flex'>
                <input type='text' placeholder='Email Address' />
                <button>S'inscrire</button>
              </div>
            </div>
          </div>

          {footer.map((val) => (
            <div className='box'>
              <h3>{val.title}</h3>
              <ul>
                {val.text.map((items) => (
                  <li> {items.list} </li>
                ))}
              </ul>
            </div>
          ))}
        </div>
      </footer>
      <div className='legal'>
        <span>© 2025 MyLogement.</span>
      </div>
    </>
  )
}

export default Footer
