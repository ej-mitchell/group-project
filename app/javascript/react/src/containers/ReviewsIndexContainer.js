import React from 'react';
import ReviewTile from '../components/ReviewTile';
import UpvoteButton from '../components/UpvoteButton'
import DownvoteButton from '../components/DownvoteButton'


class ReviewsIndexContainer extends React.Component {
  constructor(props) {
    super(props);
      this.state = {
        bookId: this.props.bookId,
        reviews: [],
        upSelectedId: [],
        downSelectedId: []
      }
      this.upSelectedId = this.upSelectedId.bind(this);
      this.downSelectedId = this.downSelectedId.bind(this);
  }

  upPost(payload) {
    let jsonPayload = JSON.stringify(payload)
    fetch(`/reviews/${payload.review_id}/votes`, {
      method: 'POST',
      credentials: "same-origin",
      headers: {
        'Accept': 'application/json, text/plain, */*',
        'Content-Type': 'application/json'
      },
      body: jsonPayload
    })
    .then(response => {
      response.json()
    })

  }

  downPost(payload) {
    let jsonPayload = JSON.stringify(payload)
    fetch(`/reviews/${payload.review_id}/votes`, {
      method: 'POST',
      credentials: "same-origin",
      headers: {
        'Accept': 'application/json, text/plain, */*',
        'Content-Type': 'application/json'
      },
      body: jsonPayload
    })
    .then(response => {
      response.json()
    })

  }

  upSelectedId(id) {
    if(!this.state.upSelectedId.includes(id)) {
      this.upPost({review_id: id, value: 1});
      this.setState({ upSelectedId: [...this.state.upSelectedId, id] })
    } else {
      this.upPost({review_id: id, value: 0})
      let index = this.state.upSelectedId.indexOf(id);
      this.state.upSelectedId.splice(index, 1)
      this.setState({ upSelectedId: this.state.upSelectedId })
    }

  }

  downSelectedId(id) {
    if(!this.state.downSelectedId.includes(id)) {
      this.downPost({review_id: id, value: -1});
      this.setState({ downSelectedId: [...this.state.downSelectedId, id] })
    } else {
      this.downPost({review_id: id, value: 0})
      let index = this.state.downSelectedId.indexOf(id);
      this.state.downSelectedId.splice(index, 1)
      this.setState({ downSelectedId: this.state.downSelectedId })
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
      let selectUp = () => this.upSelectedId(review.id)
      let selectDown = () => this.downSelectedId(review.id)

      let upClass;
      if(this.state.upSelectedId.includes(review.id)) {
        upClass = 'up-selected';
      } else {
        upClass = "";
      }

      let downClass;
      if(this.state.downSelectedId.includes(review.id)) {
        downClass = 'down-selected';
      } else {
        downClass = "";
      }

      return (
        <div>
          <ReviewTile
            key={review.id}
            id={review.id}
            rating={review.rating}
            created={review.created_at}
            text={review.text_body}
            user={review.user_id}
            username={review.username}
          />

          <UpvoteButton
            selectUp = {selectUp}
            class={upClass}
          />
          <DownvoteButton
          selectDown = {selectDown}
          class={downClass}
          />
        </div>
      )

    })

      return (
        <div>
          <h1>Reviews</h1>
          <a href={`/books/${this.state.bookId}/reviews/new`}>Add new review</a>
          {mapOfReviews}
        </div>
      )
  }
}

export default ReviewsIndexContainer;
