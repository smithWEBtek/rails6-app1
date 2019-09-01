# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version:
  - by default, Rails 6 asks for Ruby version `2.6.2` (specified  in Gemfile)
  - Use rvm to install version 2.6.2 or later

* System dependencies:
  - gemfile loads them by running `bundle install`
  - `watir, nokogiri and httparty` are added for scraping

* Configuration
  - default with Rails 6 new app install

* Database creation
  - to create your database:
    - be sure your system has PostgreSQL installed and started
    - run `$ rake db:create`

* Database initialization
  - to initialize your database:
    - be sure:
      - your system has PostgreSQL installed and started
      - you have already run `$ rake db:create` to create your database
      - then run `$ rake db:migrate` to run the Rails migrations and create your database tables

* How to run the test suite
  - No test suite yet

* Services (job queues, cache servers, search engines, etc.)
  - None

* Deployment instructions
  - This is a locally running project for scraping data and experimenting with Rails 6

* NOTES
  - To create a scrape of data:
  1. run `$ rails c` to open Rails console
  2. run `$ Scrape.call` to call the Scrape model and run start the scraper method named `self.call`
  3. The scraper will stop on the 3rd item because the site does not have consistent css styles for each of the items we are scraping.
