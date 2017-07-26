import React from 'react';

const UpvoteButton = (props) => {

  return (
    <img className = {props.up} onClick={props.handleUpVoteClick} src="/vote_icons/like.png" ></img>
  )
}

export default UpvoteButton
