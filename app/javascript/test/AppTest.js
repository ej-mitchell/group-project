import App from '../react/src/components/App';
import React from 'react';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';


describe('App.js file', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(<App />)
  })

  it('should have the appropriate header', () => {
    expect(wrapper.find('h1').text()).toEqual("Welcome to our site!")
  })
})
