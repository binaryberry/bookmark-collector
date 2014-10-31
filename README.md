Bookmark Collector
================

## What is it?

A nifty tool helping people to save and categorise their favorite websites! Users can create their accounts and associate each link with tags. If they forget their passwords, they will receive an email allowing to reset their account.

##How to run it?
It can be found [here](https://bookmarkcollector.herokuapp.com/).

## How was it done?

TDD-ed using Rspec, and built using Ruby and Sinatra. I used a postgresql database with Datamapper to save user information, and Mailgun to email users a token to reset their password if they forgot it.

I pair programmed with David Wickes the first two days, then one day with Kevin Daniells before finishing the app solo (with some help for the Mailgun bit!).

## Which technologies were used?

- Ruby
- Rspec
- Sinatra
- PostgreSQL
- Datamapper
- Mailgun
- Heroku
- CSS

## What did I learn?

- Writing a server, handling routes
- Feature testing
- Handling databases
- Creating user sessions, and allowing users to reset their passwords
- Styling

##Can I see the tests?

Oui! First clone the repo:
```shell
$ git clone https://github.com/binaryberry/bookmark-collector.git
```

Change into the directory
```shell
$ cd bookmark-collector
```

Run bundle to load the required gems
```shell
$ bundle 
```

You will need to create a database locally:
```shell
$ psql postgres
  =# create database 'bookmark_collector_test';
  =# \q
```

Migrate the required tables:
```shell
$ rake auto_migrate
```

Run Rspec:
```shell
$ rspec
```
