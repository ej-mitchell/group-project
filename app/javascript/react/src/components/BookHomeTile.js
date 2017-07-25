import React from 'react';
import { Link } from 'react-router'

const BookHomeTile = (props) => {
  return (
    <div>
      <Link to = {`/books/${props.id}`}>
        <h4>{props.title}</h4>
        <h5>{props.author}</h5>
        <p>{props.created}</p>
        <img src={props.image}></img>
      </Link>
    </div>
  )
}

export default BookHomeTile
