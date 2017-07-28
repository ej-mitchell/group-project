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
      created="2017-07-26T19:03:09.644Z"
    />)
  })
  it ('should display the rating', () => {
    expect(wrapper.find('h4').text()).toEqual('Rating: 4 Stars');
  })

  it ('should display a user', () => {
    expect(wrapper.find('h3').text()).toEqual("Reviewed By: bobsaget")
  })

  it ('should display a timestamp', () => {
    expect(wrapper.find('h5').text()).toEqual("Reviewed On: 07/26/17")
  })

  it ('should have body text', () => {
    expect(wrapper.find('p').text()).toEqual("This is a rave review for a random book")
  })

})
