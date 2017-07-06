import React, { Component }  from 'react';
import PetTile from '../components/PetTile';

class PetsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      pets: [],
      zipCode: '',
      sex: ''
    }
    this.retrievePets = this.retrievePets.bind(this);
    this.updateZipCode = this.updateZipCode.bind(this);
    this.updateSex = this.updateSex.bind(this);
  }


  updateZipCode(event) {
    this.setState({ zipCode: event.target.value });
  }

  updateSex(event){
    this.setState({ sex: event.target.value })
  }

  retrievePets() {
    $.ajax({
      url: '/api/v1/pets/',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ pets: data });
    });
  }

  componentDidMount() {
    this.retrievePets();
  }

  render() {
    let filteredPets = this.state.pets.filter(
      (pet) => {
        return pet.location.toLowerCase().indexOf(this.state.zipCode.toLowerCase()) !== -1;
      }
    );

    filteredPets = filteredPets.filter(
      (pet) => {
        if(this.state.sex === "M"){
          return pet.sex === "M"
        }else if(this.state.sex === "F"){
          return pet.sex === "F"
        }else{
          return pet.sex
        }
      }
    );

  let filter = filteredPets.map(pet => {
        return(
          <PetTile
            key={pet.id}
            id={pet.id}
            name={pet.name}
            sex={pet.sex}
            age={pet.age}
            location={pet.location}
            image={pet.image}
          />
        );
      });

    return (
    <div>
        <div className="row">
          <div className="filterControls">
            <label id="labelZipCode" htmlFor="zipCode">zipcode</label>
            <input
              id="zipCode"
              name="zipCode"
              className="zipCode"
              placeholder="zipcode"
              type="text"
              value={this.state.zipCode}
              onChange={this.updateZipCode}
            />

            <label id="labelSexType" htmlFor="sexType">sex</label>
            <select className="sexType" id="sexType" name="sexType" onChange={this.updateSex}>
              <option value="all">all</option>
              <option value="M">male</option>
              <option value="F">female</option>
            </select>
          </div>
        </div>

        <div className="pets-container">
          {filter}
        </div>

  </div>

    );
  }
};

export default PetsIndexContainer;
