import React, { Component }  from 'react';
import PetTile from '../components/PetTile';

class PetsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      pets: [],
      zipCode: '',
      sex: '',
      type: '',
      age: '',
      size: ''
    }
    this.retrievePets = this.retrievePets.bind(this);
    this.updateZipCode = this.updateZipCode.bind(this);
    this.updateSex = this.updateSex.bind(this);
    this.updateType = this.updateType.bind(this);
    this.updateAge = this.updateAge.bind(this);
    this.updateSize = this.updateSize.bind(this);
  }


  updateZipCode(event) {
    console.log("updated zipcode");
    this.setState({ zipCode: event.target.value });
  }

  updateSex(event){
    console.log('updated sex')
    this.setState({ sex: event.target.value })
  }

  updateType(event){
    console.log('updated type')
    this.setState({ type: event.target.value })
  }

  updateAge(event){
    this.setState({ age: event.target.value })
  }

  updateSize(event){
    this.setState({ size: event.target.value })
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
        if(this.state.sex === "Male"){
          return pet.sex === "Male"
        }else if(this.state.sex === "Female"){
          return pet.sex === "Female"
        }else{
          return pet
        }
      }
    );

    filteredPets = filteredPets.filter(
      (pet) => {
        if(this.state.type === "Dog"){
          return pet.animal === "Dog"
        }else if(this.state.type === "Cat"){
          return pet.animal === "Cat"
        }else{
          return pet
        }
      }
    );

    filteredPets = filteredPets.filter(
      (pet) => {
        if(this.state.age === "Baby"){
          return pet.age === "Baby"
        }else if(this.state.age === "Young"){
          return pet.age === "Young"
        }else if(this.state.age === "Adult"){
          return pet.age === "Adult"
        }else if(this.state.age === "Senior"){
          return pet.age === "Senior"
        }else{
          return pet
        }
      }
    );

    filteredPets = filteredPets.filter(
      (pet) => {
        if(this.state.size === "Small"){
          return pet.size === "Small"
        }else if(this.state.size === "Medium"){
          return pet.size === "Medium"
        }else if(this.state.size === "Large"){
          return pet.size === "Large"
        }else if(this.state.size === "Extra Large"){
          return pet.size === "Extra Large"
        }else{
          return pet
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
            size={pet.size}
            age={pet.age}
            location={pet.location}
            image={pet.image}
          />
        );
      });

    return (
    <div>
        <div className="row filterPanel">
          <div className="large-3 columns">
            <label id="zipLabel" className="filterLabel" htmlFor="zipCode">zipcode</label>
            <input
              id="zipCode"
              name="zipCode"
              className="zipCode"
              placeholder="zipcode"
              type="text"
              value={this.state.zipCode}
              onChange={this.updateZipCode}
            />
          </div>
        <div className="large-3 columns">
          <label id="typeLabel" className="filterLabel" htmlFor="typeFilter">type</label>
          <select className="typeFilter" id="typeFilter" name="typeFilter" onChange={this.updateType}>
            <option value="Any">Any</option>
            <option value="Dog">Dog</option>
            <option value="Cat">Cat</option>
          </select>
        </div>
        <div className="large-2 columns">
          <label id="sexLabel" className="filterLabel" htmlFor="sexFilter">sex</label>
          <select className="sexFilter" id="sexFilter" name="sexFilter" onChange={this.updateSex}>
            <option value="Any">Any</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
          </select>
        </div>

        <div className="large-2 columns">
          <label id="ageLabel" className="filterLabel" htmlFor="ageFilter">age</label>
          <select className="ageFilter" id="ageFilter" name="ageFilter" onChange={this.updateAge}>
            <option value="Any">Any</option>
            <option value="Baby">Baby</option>
            <option value="Young">Young</option>
            <option value="Adult">Adult</option>
            <option value="Senior">Senior</option>
          </select>
        </div>
        <div className="large-2 columns">
          <label id="sizeLabel" className="filterLabel" htmlFor="sizeFilter">size</label>
          <select className="sizeFilter" id="sizeFilter" name="sizeFilter" onChange={this.updateSize}>
            <option value="Any">Any</option>
            <option value="Small">Small</option>
            <option value="Medium">Medium</option>
            <option value="Large">Large</option>
            <option value="Extra Large">Extra Large</option>
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
