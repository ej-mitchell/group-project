import React from 'react';

const BookShowTile = (props) => {
  return (
    <div>
      <img className="show-cover" src={props.cover}/>
      <h5><strong>By: </strong>{props.author}</h5>
      <p><strong>Pages:</strong> {props.pages}</p>
      <p><strong>Summary:</strong> {props.summary}</p>
    </div>
  )
}

export default BookShowTile
