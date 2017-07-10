// test/components/Card.js
import PetTile from '../src/components/PetTile';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('Component: PetTile', () => {
  let wrapper,
    id,
    name,
    sex,
    size,
    age,
    location,
    image;

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <PetTile
        id="1"
        name="Dusty"
        sex="Male"
        size="Medium"
        age="Young"
        location="08226"
        image="http://i.imgur.com/S94DBcZ.png"
      />
    );
  });

  it('img tag should be present', () => {
   expect(wrapper.find('img')).toBePresent();
  });

  it('should render an img tag with the specific prop', () => {
    expect(wrapper.find('img').props()).toEqual({
      src: 'http://i.imgur.com/S94DBcZ.png'
    });
  });

  it('h1 tag should be present', () => {
   expect(wrapper.find('h1')).toBePresent();
  });

  it('p tag should be present', () => {
   expect(wrapper.find('p')).toBePresent();
  });

});
