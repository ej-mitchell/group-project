import React from 'react';

const UpvoteButton = (props) => {
  let upClass;
  if (props.id){
    upClass = 'selected';
  }
  return (
    <img src="/icons/like.png" className = {props.class} onClick={props.selectUp} />
  )
}

export default UpvoteButton
