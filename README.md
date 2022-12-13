# Secret Santa

This is an mvp secret santa generator, written in ruby on rails. 
This app allows users to create secret santa events, add participants and find out who they have to buy presents for.

## General Information
* ruby on rails
* javascript
* scss
* user authentication

## Technologies Used

- Rails 7.0.4 - Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
- Ruby 3.1.2
- yarn 1.22.17
- SCSS
- bootstrap 5
- font-awesome 6
- PostgreSQL 12

## Features

- Create events
- Add participants to the event
- Create a draw that ensures everyone has a person to gift
- Create your wishlist and add items to it
- Display what events you are a part of, your wishlists and the events you have created on own users profile page

## Setup

You will need Ruby 3.1.2 and Rails 7.0.4. Both can be installed via rbenv

To check that you have the correct ruby version run:
`ruby --version`

Then run:
`bundle install`
to install the required gems

Run:
`yarn install`
to install the js packages

Run:
`rails db:create`
`rails db:migrate`
`rails db:seed`
to set up your database

Run:
`rails s`
to start a local rails server

## Room for Improvement
Should have created testing before creating app - but still undergoing learning process

- Add more testing
- Explore bugs (e.g. gifter.user_id kept throwing errors randomly possibly due to when users do not create a draw at the same time as creating the event?)
- More front end/ JavaScript - was more focused on making the backend work
- Tidy scss files into smaller fragments


