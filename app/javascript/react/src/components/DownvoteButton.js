import React from 'react';

const DownvoteButton = (props) => {

  return (
    <img className = {props.class} onClick={props.selectDown} src="/icons/dislike.png" ></img>
  )
}

export default DownvoteButton
