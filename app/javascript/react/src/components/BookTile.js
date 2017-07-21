import React from 'react';
import { Link } from 'react-router';

const BookTile = (props) => {
  return (
    <Link to={`/books/${props.id}`}><h4>{props.title}</h4></Link>
  )
}

export default BookTile
