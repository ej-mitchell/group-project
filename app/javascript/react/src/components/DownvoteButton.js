import React from 'react';

const DownvoteButton = (props) => {

  return (
    <img className = {props.down} onClick={props.handleDownVoteClick} src="/vote_icons/dislike.png" ></img>
  )
}

export default DownvoteButton
