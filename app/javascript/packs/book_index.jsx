// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import BookIndexContainer from '../react/src/containers/BookIndexContainer'


document.addEventListener('DOMContentLoaded', () => {
  let bookIndexElement = document.getElementById('react-book-index')

  ReactDOM.render(
    <BookIndexContainer />,
    bookIndexElement
  )
})
