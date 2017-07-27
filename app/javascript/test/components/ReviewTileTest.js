import ReviewTile from '../../react/src/components/ReviewTile';
import React from 'react';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

describe('ReviewTile', () => {
  let wrapper;
  let rating;
  let user;
  let text;

  beforeEach(() => {
    wrapper = mount(<ReviewTile
      rating={4}
      user="bobsaget"
      text="This is a rave review for a random book"
    />)
  })

  it ('should display the rating', () => {
    expect(wrapper.find('h5').text()).toEqual('4');
  })

  it ('should display a user', () => {
    expect(wrapper.find('h5').text()).toEqual("username: bobsaget")
  })

  it ('should have body text', () => {
    expect(wrapper.find('p').text()).toEqual("This is a rave review for a random book")
  })

})
