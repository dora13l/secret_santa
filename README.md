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

- Create/edit plant listings
- Find plant cuttings for sale in your area using Mapbox API
- Purchase multiple plant cuttings from various sellers
- Checkout and pay with credit card via Stripe API
- Review your purchases
- View all your plants bought, sold and listed on your dashboard

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
# Should have created testing before creating app - but still undergoing learning process

# Add more testing
# Explore bugs (e.g. gifter.user_id kept throwing errors randomly)
# More front end/ JavaScript - was more focused on making the backend work
# Tidy scss files into smaller fragments


