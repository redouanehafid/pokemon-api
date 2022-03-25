# README

This api allows you to discover the list of all the pokemons and perform CRUD operations.
### Ruby version
 
  Install rvm => [https://rvm.io/rvm/install](https://rvm.io/rvm/install)

  ```bash
    $ rvm install 3.1.1
  ```

  Check if your ruby local is 3.1.1

  ```bash
    $ ruby -v
  ```
  
  If your ruby version is diffrent than 3.1.1 run

  ```bash
    $ rvm use 3.1.1
  ```

### System dependencies
   Install rails

  ```bash
    $ gem install rails
    $ gem install bundler
  ```

### Configuration
  Install postgresql

  ```bash
    $ brew install postgresql
  ```

  Database creation

  ```bash
    $ bundle exec rails db:create
    $ bundle exec rails db:migrate
  ```

### Database initialization
  ```bash
    $ bundle exec rails db:seed
  ```
### run the test suite
  ```bash
    $ bundle exec rspec
  ```


