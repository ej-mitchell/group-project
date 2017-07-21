import React from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import BookIndexContainer from './containers/BookIndexContainer';
import BookShowContainer from './containers/BookShowContainer'

const App = props => {
  return(
    <div>
      <Router history={browserHistory}>

        <Route path='/books' component={BookIndexContainer}/>
        <Route path='/books/:id' component={BookShowContainer}/>

    </Router>

  </div>
  )
}

export default App;
