# Rails-Engine-Lite

## Contents: 

- Rails Engine Lite is a project that exposes API endpoints for a E-Commerce Application. The front and back end of this application are seperate and communicate vie API. 

* Exposes API enpoints

* Uses serializers to format JSON responses

* Test API exposure

* Use SQL and AR to gather data

## Installation

1. Clone the repo
   ```sh
   git clone https://github.com/caden-jarrett/rails-engine
   ```
2. Install Ruby 2.7.4 and Rails 5.2.7

3. Install required gems using the included gemfile
   ```sh
   bundle install
   ```
4. Create Postgresql database, run migrations and seed database
   ```sh
   rails db:{create,migrate,seed}
   ```
5. Launch local server
   ```sh
   rails s
   ```
6. Use a browser or tool like PostMan to explore the API on http://localhost:3000
   ```sh
   http://localhost:3000
   ```

## Dependencies:

* Ruby Version: 2.7.4

* Rails Version: 5.2.8

## Gems:

* [Rspec-rails](https://github.com/rspec/rspec-rails)

* [Simplecov, requre: false, group:test](https://github.com/simplecov-ruby/simplecov)

* [Factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)

* [Faker](https://github.com/faker-ruby/faker)

* [Pry](https://github.com/pry/pry)

* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)

* [jsonapi_serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)

## API Endpoints

### Merchants:
  * get all merchants `GET http://localhost:3000/api/v1/merchants`
  * get one merchant `GET http://localhost:3000/api/v1/merchants/:merchant_id`
  * get all items held by a given merchant `GET http://localhost:3000/api/v1/merchants/:merchant_id/items`
### Items:
  * get all items `GET http://localhost:3000/api/v1/items`
  * get one item `GET http://localhost:3000/api/v1/items/:item_id`
  * create an item `POST http://localhost:3000/api/v1/items/:item_id`
  * edit an item `PUT http://localhost:3000/api/v1/items/:item_id`
  * delete an item `DESTROY http://localhost:3000/api/v1/items/:item_id`
  * get the merchant data for a given item ID `GET http://localhost:3000/api/v1/items/:item_id/merchant`

### Search:
  * find one merchant by name `GET http://localhost:3000/api/v1/merchants/find?name=iLl`  
