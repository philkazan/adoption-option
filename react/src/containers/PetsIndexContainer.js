import React, { Component }  from 'react';
import PetTile from '../components/PetTile';

class PetsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      foods: [],
      zipCode: '',
      sex: ''
    }
    this.retrieveFoods = this.retrieveFoods.bind(this);
    this.updateZipCode = this.updateZipCode.bind(this);
    this.updateSex = this.updateSex.bind(this);
  }


  updateZipCode(event) {
    this.setState({ zipCode: event.target.value });
  }

  updateSex(event){
    this.setState({ sex: event.target.value })
  }

  retrieveFoods() {
    $.ajax({
      url: '/api/v1/pets/',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ foods: data });
    });
  }

  componentDidMount() {
    this.retrieveFoods();
  }

  render() {
    let filteredFoods = this.state.foods.filter(
      (food) => {
        return food.location.toLowerCase().indexOf(this.state.zipCode.toLowerCase()) !== -1;
      }
    );

    filteredFoods = filteredFoods.filter(
      (food) => {
        if(this.state.sex === "M"){
          return food.sex === "M"
        }else if(this.state.sex === "F"){
          return food.sex === "F"
        }else{
          return food.sex
        }
      }
    );

  let filter = filteredFoods.map(food => {
        return(
          <PetTile
            key={food.id}
            id={food.id}
            name={food.name}
            sex={food.sex}
            age={food.age}
            location={food.location}
            image={food.image}
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
