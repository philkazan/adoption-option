import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import PetsIndexContainer from './containers/PetsIndexContainer'

$(function() {
  ReactDOM.render(
    <PetsIndexContainer/>,
    document.getElementById('app')
  );
});
