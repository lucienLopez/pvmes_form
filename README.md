# Used stack

+ [Ruby](http://ruby-lang.org) => `3.0`
+ [Rails](http://rubyonrails.org) => `7.0`
+ [PostgreSQL](http://www.postgresql.org) => `12.11`

# Usage

## Installation:
  - Install gems: `bundle install`
  - Set up these environment variables to connect to psql: `DB_USERNAME`, `DB_PASSWORD`. This can be done with [Dotenv](https://github.com/bkeepers/dotenv)
  - Create db: `bundle exec rake db:create && bundle exec rake db:migrate`

## Starting local server:
`bundle exec rails s`

## Using this API:
POST a JSON with the following structure to `/installations`:
````
curl -X POST http://localhost:3000/installations\
   -H 'Content-Type: application/json'\
   -d '{
         "company":{"name":"company_name","siren":"123456789"},
         "customer":{"name":"Custo Mer","email":"customer@mail.com","phone":"0123456789"},
         "installation":{
           "address":"23 installation road","date":"2020/01/15","type":"hybrid",
           "panel_ids":["123456","654321"]
         }
       }'
````

# Work remaining

- Have a better API documentation, maybe using Rswag
- Stop creating new companies and customers on each call, check if we already have an existing one with received attributes before creation
- Ask support team what fields they use for filtering and ordering, to make sure our setup is ok
