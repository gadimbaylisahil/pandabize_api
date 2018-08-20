# pandabize_api

PandabizeAPI is built to serve as a backend for the PandabizeFrontend application built in React.
App demonstrates basic functionality to create Bicycles with Options which generates list of variants.

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

## API Documentation
API Docs are available [here](https://documenter.getpostman.com/view/4361815/RWTpsGpo)


## Running Tests
```
 bundle exec rspec
```