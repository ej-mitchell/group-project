import React from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import BookIndexContainer from '../containers/BookIndexContainer';
import BookShowContainer from '../containers/BookShowContainer';
import HomeIndexContainer from '../containers/HomeIndexContainer';

const App = props => {
  return(
    <div>
      <Router history={browserHistory}>
        <Route path="/" component={HomeIndexContainer}/>
        <Route path='/books/:id' component={BookShowContainer}/>
        <Route path='/books' component={BookIndexContainer}/>
      </Router>
  </div>
  )
}

export default App;
