import React from 'react';
import { Link } from 'react-router';

const PetTile = ({ id, name, sex, size, age, location, image }) => {
    return(

          <div className="card small-12 medium-4">
            <a href={`/pets/${id}`}>
              <img src={image}/>
              <div className="card-divider">
                <h1>{name}</h1>
              </div>
              <div className="card-section">
                <p className="specs">{age} &#9679; {sex} &#9679; {size}</p>
              </div>
            </a>
          </div>

    )
  }

export default PetTile;
