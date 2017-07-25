import BookHomeTile from '../../react/src/components/BookHomeTile';
import React from 'react';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

describe('BookHomeTile', () => {
  let wrapper;
  let title;
  let author;
  let created;
  let image;

  beforeEach(() => {
    wrapper = mount(<BookHomeTile
      title="Harry Potter"
      author="JK Rowling"
      created="now"
      image="http://bookriotcom.c.presscdn.com/wp-content/uploads/2014/08/HP_hc_old_2.jpg"
    />)
  })

  it('should have the title formatted appropriately', () => {
    expect(wrapper.find('h4').text()).toEqual("Harry Potter");
  })

  it('should have an author', () => {
    expect(wrapper.find('h5').text()).toEqual("JK Rowling");
  })

  it('should have a date', () => {
    expect(wrapper.find('p').text()).toEqual("now");
  })

  it('should render an img tag with the specific props', () => {
    expect(wrapper.find('img').props()).toEqual({ src: 'http://bookriotcom.c.presscdn.com/wp-content/uploads/2014/08/HP_hc_old_2.jpg' });
  })
})
