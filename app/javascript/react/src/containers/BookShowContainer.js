import React from 'react';
import BookShowTile from '../components/BookShowTile';
import ReviewTile from '../components/ReviewTile';


class BookShowContainer extends React.Component {
  constructor(props) {
    super(props);
      this.state = {
        book: {},
        reviews: [],
        upVoteSelected: false,
        downVoteSelected: false
      }
      this.handleUpVoteClick = this.handleUpVoteClick.bind(this);
      this.handleDownVoteClick = this.handleDownVoteClick.bind(this);
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

  handleUpVoteClick(event) {
    let harry_potter = this.state.upVoteSelected
    this.setState({ upVoteSelected: !harry_potter })
  }

  handleDownVoteClick(event) {
    let harry_potter = this.state.downVoteSelected
    this.setState({ downVoteSelected: !harry_potter })
  }


  render() {
    let up;
    if (this.state.upVoteSelected) {
      up = "up";
    } else {
      up = ""
    }

    let down;
    if (this.state.downVoteSelected) {
      down = "down";
    } else {
      down = ""
    }

    let mapOfReviews = this.state.reviews.map((review) => {
      return (
        <ReviewTile
          key={review.id}
          rating={review.rating}
          created={review.created_at}
          text={review.text_body}
          user={review.user_id}
          handleUpVoteClick={this.handleUpVoteClick}
          handleDownVoteClick={this.handleDownVoteClick}
          up = {up}
          down = {down}
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
          <div>Icons made by <a href="https://www.flaticon.com/authors/gregor-cresnar" title="Gregor Cresnar">Gregor Cresnar</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
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
