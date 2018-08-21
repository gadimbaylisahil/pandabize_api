# pandabize_api

PandabizeAPI is built to serve as a backend for the [Pandabize](https://github.com/gadimbaylisahil/pandabize_frontend) application built in React.
App contains functionality to create Bicycles with Options which generates list of variants.

Demonstrates usage of API only application with object Serializers, Request and Unit Tests.

### Demo

Frontend Application is deployed [here](https://pandabize.firebaseapp.com)

API is deployed [here](https://pandabizeapi.herokuapp.com)

## API Documentation
API Docs are available [here](https://documenter.getpostman.com/view/4361815/RWTpsGpo)

### Prerequisites

Ruby 2.4
Rails 5.2.1
Postgresql 9.6+

## Installation

Clone the repository and cd to the dir.

```
 bundle install
 bundle exec rails db:create
 bundle exec rails db:migrate
 RAILS_ENV=test bundle exec rails db:migrate
```

## Using with React Frontend App

This api is built to serve as a backend for PandabizeFrontend. In development PandabizeFrontend is expecting backend to run at port 8081.

```ruby
  rails server -p8081
```

## Running Tests
```
 bundle exec rspec
```