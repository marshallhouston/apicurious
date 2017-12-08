# README

This is a github clone that implements Github oauth and consumes data from the github API. It was built over the course of 5 days.

It is built using Ruby on Rails, tested with RSpec, and styled using HTML/CSS. TDD was used to drive development.

<img src='http://i268.photobucket.com/albums/jj12/mrhouston3/apicurious/Screen%20Shot%202017-12-08%20at%209.30.56%20AM_zpstlsvidxz.png' >

<img src='http://i268.photobucket.com/albums/jj12/mrhouston3/apicurious/Screen%20Shot%202017-12-08%20at%209.31.32%20AM_zpsnrwrkozh.png' >

<img src='http://i268.photobucket.com/albums/jj12/mrhouston3/apicurious/Screen%20Shot%202017-12-08%20at%209.32.00%20AM_zps3gv0kqhv.png' >


## Features
- User can authenticate using Omniauth
- User can view basic information about their account
- User can view a list of their repositories.
- User can view a list of their starred repositories.
- User can view a list of their followers.
- User can view a list of other users they follow on Github.

## Next features to add
- User can view a summary of activity in an overview page. This will be the landing page after logging in.

## Getting started

Install Rails at the command prompt if you haven't yet:  
` gem install rails `

At the command prompt, clone this repository:  
` git clone https://github.com/marshallhouston/apicurious.git `

Change directory to apicurious and run the following commands:  
 `cd apicurious`  
 `bundle install`  
 `rake db:create db:migrate`  

Run the server:
 `rails s`  

Using a browser, go to http://localhost:3000 and you'll be prompted to login using your Github account.

Project specifications: http://backend.turing.io/module3/projects/apicurious
