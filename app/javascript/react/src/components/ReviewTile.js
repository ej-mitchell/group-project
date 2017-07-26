import React from 'react';

const ReviewTile = (props) => {
  return (
    <div>
      <h4>Reviewed By: {props.user}</h4>
      <h5>{props.rating} Stars</h5>
      <p>{props.created}</p>
      <p>{props.text}</p>
    </div>
  )
}

export default ReviewTile
