import React from 'react';
import { Link } from 'react-router'

const BookHomeTile = (props) => {
  return (
    <div>
      <Link to = {`/books/${props.id}`}>
        <h4>{props.title}</h4>
        <p>{props.author}</p>
        <p>{props.created}</p>
        <img src={props.image} height='120' width='120'></img>
      </Link>
    </div>
  )
}

export default BookHomeTile
