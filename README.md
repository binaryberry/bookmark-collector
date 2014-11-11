Bookmark Collector
================

## What is it?

A nifty tool helping people to save and categorise their favorite websites! Users can create their accounts and associate each link with tags. If they forget their passwords, they will receive an email allowing to reset their account.

##How to run it?

First clone the repo:
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

You will need to create the databases locally:
```shell
$ psql postgres
  =# create database 'bookmark_collector_test';
  =# create database 'bookmark_collector_development';
  =# \q
```

Migrate the tables:
```shell
$ rake auto_migrate
```

If you want to see the tests, run Rspec:
```shell
$ rspec
```

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
- CSS

## What did I learn?

- Writing a server, handling routes
- Feature testing
- Handling databases
- Creating user sessions, and allowing users to reset their passwords
- Styling
