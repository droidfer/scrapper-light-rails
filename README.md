# README Project: Scrapper Light

**Description:**

Scrapper Light is a simple application where a user can add a link to a web page and the application will scrape all the information of that page and get a list of all of the links in that page

## Features
* List of all the pages that I have scrapped with the number of links that the scraper found, including pagination of the results
* Each scrapped page provide a view of all the links of a particular page, including pagination of the results

## Configuration and Dependencies
* **Rails:** 7
* **Ruby:** 3.1.2
* **Database:** The database utilize in the project is SQLite due is easier to deploy
* **Nokogiri:** Gem that query the information on the html provided
* **Kaminari:** Gem for pagination
* **ActiveJob:** For asynchronous tasks
* **Bootstrap:** Style of the page
* **Test:** RSPEC, FactoryBot

## Database creation and initialization
Create the Database on SQLite
```
rake db:create
```

Migrate the schema on the created db
```
rake db:migrate
```

##  Deployment instructions
In order to run the application the command to apply is
```
./bin/dev
```

