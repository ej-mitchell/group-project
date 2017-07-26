import React from 'react';
import UpvoteButton from './UpvoteButton'
import DownvoteButton from './DownvoteButton'

const ReviewTile = (props) => {
  return (
    <div>
      <h4>{props.rating} <img src="/vote_icons/star.png"/></h4>
      <h5>username: {props.user}</h5>
      <p>{props.text}</p>
        <UpvoteButton
          handleUpVoteClick={props.handleUpVoteClick}
          up = {props.up}
        />
        <DownvoteButton
          handleDownVoteClick={props.handleDownVoteClick}
          down = {props.down}
        />
    </div>
  )
}

export default ReviewTile
