import React from 'react';

const ReviewTile = (props) => {

  let year = props.created.substring(2, 4);
  let month = props.created.substring(5, 7);
  let day = props.created.substring(8, 10);
  let formattedDate = `${month}/${day}/${year}`

  return (
    <div className='reviews'>
      <h3 className='reviewed-by'><b>Reviewed By:</b> {props.user}</h3>
      <h4 className='rating'><b>Rating: </b>{props.rating} Stars</h4>
      <h5 className='reviewed-on'><b>Reviewed On:</b> {formattedDate}</h5>
      <p>{props.text}</p>
    </div>
  )
}

export default ReviewTile
