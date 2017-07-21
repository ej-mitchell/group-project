import React from 'react';
import BookTile from '../components/BookTile'


class BookIndexContainer extends React.Component {
  constructor(props) {
    super(props);
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
    let bookMap = this.state.books.map((book) => {
      return (
        <BookTile
          key={book.id}
          id={book.id}
          title={book.title}
        />
      )
    })

    return (
      <div>
        <h1>Books by Title</h1>
        {bookMap}
      
      </div>
    )
  }
}

export default BookIndexContainer;
