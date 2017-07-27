import React from 'react';
import BookShowTile from '../components/BookShowTile';
import ReviewsIndexContainer from './ReviewsIndexContainer';


class BookShowContainer extends React.Component {
  constructor(props) {
    super(props);
      this.state = {
        bookId: this.props.params.id,
        book: {}
      }
  }

  componentDidMount() {
    fetch(`/api/v1/books/${this.state.bookId}`)
      .then(response => {
        return response.json()})
      .then(body => {
        let json = body;
        this.setState({ book: json.book })
    })
  }

  render() {

    if (this.props.params.id !== "new") {
      return (
        <div>
        <div className="book-tile Book">
          <h1>{this.state.book.title}</h1>
          <BookShowTile
            key={this.state.book.id}
            id={this.state.book.id}
            title={this.state.book.title}
            pages={this.state.book.page_number}
            summary={this.state.book.summary}
            author={this.state.book.author}
            cover={this.state.book.cover_url}
          />
        </div>
          <ReviewsIndexContainer
            bookId={this.state.bookId}
          />
      </div>
      )
    } else {
      return (
        <p></p>
      )
    }
  }
}

export default BookShowContainer;
