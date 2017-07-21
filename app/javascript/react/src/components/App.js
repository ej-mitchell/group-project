import React from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import BookIndexContainer from '../containers/BookIndexContainer';
import BookShowContainer from '../containers/BookShowContainer'

const App = props => {
  return(
    <div>
      <h1>Welcome to our site!</h1>
      <Router history={browserHistory}>
        <Route path='/books' component={BookIndexContainer}/>
        <Route path='/books/new'/>
        <Route path='/books/:id' component={BookShowContainer}/>
      </Router>
  </div>
  )
}

export default App;
