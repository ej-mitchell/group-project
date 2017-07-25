import BookTile from '../../react/src/components/BookTile';
import React from 'react';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

describe('BookHomeTile', () => {
  let wrapper;
  let id;
  let title;

  beforeEach(() => {
    wrapper = mount(<BookTile
      id={1}
      title="I'm a title"
    />)
  })

  it ('should display the title', () => {
    expect(wrapper.find('h4').text()).toEqual("I'm a title");
  })

  // it('should have a link', () => {
  //   wrapper.find('h4').simulate('click');
  //
  // })

})
