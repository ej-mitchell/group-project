**LAUNCH ACADEMY GROUP PROJECT**
![Build Status](https://codeship.com/projects/1b07a800-4d43-0135-028e-2a4961856651/status?branch=master)
![Coverage Status](https://coveralls.io/repos/eliza-jane/group-project/badge.png)


Between the Covers is an application for book lovers. It was created to demonstrate our knowledge of React on Rails, and to integrate with Foundation for an attractive user interface.

**TECHNOLOGIES:**
React is a great front-end technology that makes websites dynamic and increases user experiences by cutting down page reloads.

Rails was used for the back-end with PostGreSQL as the database.  Rails is a convention-over-configuration framework that allowed us to get the application up and running without too much time spent on configuration decisions.  PostGreSQL is a Heroku-supported database that makes deployment easier.

Jasmine/Enzyme is used for testing our React components. RSpec is used for testing controllers and models on the back-end.

**SETUP:**
To get setup run,
```
bundle
rake db:create
rake db:migrate
rails s
```
In separate terminal run,
```
yarn
yarn start
```
And navigate to `localhost:3000`
To run Ruby tests, run `rake` or `rspec`
To run Enzyme tests, run `yarn test`
