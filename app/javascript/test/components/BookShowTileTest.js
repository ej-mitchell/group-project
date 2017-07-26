import BookShowTile from '../../react/src/components/BookShowTile';
import React from 'react';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

describe('BookHomeTile', () => {
  let wrapper;
  let pages;
  let summary;

  beforeEach(() => {
    wrapper = mount(<BookShowTile
      title="I am a title"
      pages={800}
      summary="I am a very large summary"
    />)
  })

  it('should have the book details formatted appropriately', () => {
    expect(wrapper.text()).toContain("large summary");
    expect(wrapper.text()).toContain("800");
  })
})
