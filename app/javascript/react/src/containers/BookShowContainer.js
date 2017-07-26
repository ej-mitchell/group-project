import React from 'react';
import BookShowTile from '../components/BookShowTile';
import ReviewTile from '../components/ReviewTile';


class BookShowContainer extends React.Component {
  constructor(props) {
    super(props);
      this.state = {
        book: {},
        reviews: []
      }
  }

  componentDidMount() {
    let bookId = this.props.params.id;
    fetch(`/api/v1/books/${bookId}`)
      .then(response => {
        return response.json()})
      .then(body => {
        let json = body;
        this.setState({ book: json.book, reviews: json.reviews })
    })
  }

  render() {
    let mapOfReviews = this.state.reviews.map((review) => {
      return (
        <ReviewTile
          key={review.id}
          rating={review.rating}
          created={review.created_at}
          text={review.text_body}
          user={review.user_id}
        />
      )

    })

    if (this.props.params.id !== "new") {
      return (
        <div>
          <h1>{this.state.book.title}</h1>
          <BookShowTile
            key={this.state.book.id}
            id={this.state.book.id}
            title={this.state.book.title}
            pages={this.state.book.page_number}
            summary={this.state.book.summary}
          />
          <h1>Reviews</h1>
          <a href={`/books/${this.props.params.id}/reviews/new`}>Add new review</a>
          {mapOfReviews}
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
