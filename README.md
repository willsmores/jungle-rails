# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Project Purpose

- Become familiar with Ruby and the Rails framework
- Learn how to navigate an existing code-base
- Use existing code style and approach to implement new features in unfamiliar territory
- Apply previous learning tactics to research and become familiar with a new paradigm, language and \* framework
- A simulation of the real world where feature and bug-fix requests are listed instead of step-by-step instructions on how to implement a solution

## Final Product

!["Screenshot of Home page"](https://github.com/willsmores/jungle-rails/blob/master/img/jungle-home-page.PNG?raw=true)
!["Screenshot of Product page"](https://github.com/willsmores/jungle-rails/blob/master/img/jungle-product-page.PNG?raw=true)
!["Screenshot of Shopping Cart page"](https://github.com/willsmores/jungle-rails/blob/master/img/jungle-shopping-cart.PNG?raw=true)
!["Screenshot of Admin Dashboard page"](https://github.com/willsmores/jungle-rails/blob/master/img/jungle-admin-dashboard.PNG?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Startup

1. Run `startpostgres` and login
2. Run `bin/rails s -b 0.0.0.0` to start the server
3. Browse to `http://localhost:3000/`

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
