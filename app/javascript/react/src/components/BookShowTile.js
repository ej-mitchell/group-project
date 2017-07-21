import React from 'react';

const BookShowTile = (props) => {
  return (
    <div>
      <p><strong>Pages:</strong> {props.pages}</p>
      <p><strong>Summary:</strong> {props.summary}</p>
    </div>
  )
}

export default BookShowTile
