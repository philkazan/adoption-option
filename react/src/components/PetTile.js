import React from 'react';
import { Link } from 'react-router';

const PetTile = ({ id, name, sex, age, location, image }) => {
    return(

          <div className="card small-2 medium-4">
            <a href={`/pets/${id}`}>
              <img src={image}/>
              <div className="card-divider">
                <h1>{name}</h1>
              </div>
              <div className="card-section">
                <ul className="attributes">
                  <li>{age}</li>
                  <li>{sex}</li>
                  <li>{location}</li>
                </ul>
              </div>
            </a>
          </div>

    )
  }

export default PetTile;
