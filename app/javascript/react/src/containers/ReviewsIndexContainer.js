import React from 'react';
import ReviewTile from '../components/ReviewTile';


class ReviewsIndexContainer extends React.Component {
  constructor(props) {
    super(props);
      this.state = {
        bookId: this.props.bookId,
        reviews: []
      }
  }

  componentDidMount() {
      let bookId = this.state.bookId
      fetch(`/api/v1/books/${bookId}`)
        .then(response => {
          return response.json()})
        .then(body => {
          let json = body;
          this.setState({ reviews: json.reviews })
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

      return (
        <div>
          <h1>Reviews</h1>
          {mapOfReviews}
        </div>
      )
  }
}

export default ReviewsIndexContainer;
