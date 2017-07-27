import React from 'react';

const ReviewTile = (props) => {
  return (
    <div>
      <h4>{props.rating} <img src="/icons/star.png"/></h4>
      <h5>username: {props.user}</h5>
      <p>{props.text}</p>
    </div>
  )
}

export default ReviewTile
