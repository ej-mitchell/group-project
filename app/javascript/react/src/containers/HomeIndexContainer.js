import React from 'react';
import BookHomeTile from '../components/BookHomeTile';

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
          image = {book.cover_url}
          title = {book.title}
          author = {book.author}
        />
      )
    })
    return (
      <div>
          {bookHomeTiles}
      </div>

    )
  };
}

export default HomeIndexContainer;
