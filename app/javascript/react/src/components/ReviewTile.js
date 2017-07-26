import React from 'react';

const ReviewTile = (props) => {
  return (
    <div>
      <h4>{props.rating} Stars</h4>
      <h5>Reviewed By: {props.user}</h5>
      <p>{props.text}</p>
    </div>
  )
}

export default ReviewTile
