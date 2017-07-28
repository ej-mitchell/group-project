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
        this.setState({ book: json.reviews[0].book, reviews: json.reviews  })
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
        <div className="book-tile">
          <h1 className='book-tile-title'>{this.state.book.title}</h1>
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
        <div>
          <br></br>
          <h3>Reviews</h3>
          <a href={`/books/${this.props.params.id}/reviews/new`}>Add new review</a>
          {mapOfReviews}
        </div>
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
