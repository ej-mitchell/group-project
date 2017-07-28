import React from 'react';


const ReviewTile = (props) => {
  return (
    <div>
      <h4>{props.rating} <img src="/icons/star.png"/></h4>
      <h4>Reviewed By: {props.username}</h4>
      <h5>{props.rating} Stars</h5>
      <p>{props.created}</p>
      <p>{props.text}</p>
    </div>
  )
}

export default ReviewTile
