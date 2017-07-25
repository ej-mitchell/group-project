import React from 'react';
import BookHomeTile from '../components/BookHomeTile'
import { Link } from 'react-router'

class HomeIndexContainer extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      books: []
    }
  }

  componentDidMount() {
    fetch("/api/v1/books.json")
      .then((response) => response.json())
      .then((responseData) => {
        let data = responseData["books"]
        this.setState({ books: data })
      })
  }

  render() {
    let bookHomeTiles = this.state.books.map((book) => {
      return(
        <BookHomeTile
          key = {book.id}
          id = {book.id}
          image = {book.cover_photo.thumb.url}
          title = {book.title}
          author = {book.author}
          created= {book.created_at}
        />
      )
    })
    return (
      <div>
        <Link to='/books'>Books</Link>
        {bookHomeTiles}
      </div>

    )
  };
}

export default HomeIndexContainer;
