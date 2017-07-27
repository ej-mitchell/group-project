import React from 'react';

const ReviewTile = (props) => {
  let year = props.created.substring(2, 4);
  let month = props.created.substring(5, 7);
  let day = props.created.substring(8, 10);
  
  return (
    <div className='reviews'>
      <h5><b>Reviewed By:</b> {props.user}</h5>
      <h5><b>Rating: </b>{props.rating} Stars</h5>
      <p><b>Reviewed On:</b> {`${month}/${day}/${year}`}</p>
      <p>{props.text}</p>
    </div>
  )
}

export default ReviewTile
