# RailsGoat [![Build Status](https://api.travis-ci.org/OWASP/railsgoat.png?branch=master)](https://travis-ci.org/OWASP/railsgoat) [![Code Climate](https://codeclimate.com/github/OWASP/railsgoat.png)](https://codeclimate.com/github/OWASP/railsgoat)

RailsGoat is a vulnerable version of the Ruby on Rails Framework from versions 3 to 6. It includes vulnerabilities from the OWASP Top 10, as well as some "extras" that the initial project contributors felt worthwhile to share. This project is designed to educate both developers, as well as security professionals.

## Getting Started

Clone this repo:

```bash
$ git clone git@github.com:rifkinni/railsgoat.git
$ cd railsgoat
```

Install the dependencies:

```bash
$ bundle install
```

You may need to install Ruby 2.6.5 if you don't yet have it

```bash
$ brew update && brew upgrade ruby-build
$ rbenv install 2.6.5
```

Initialize the database:

```bash
$ rails db:setup
```

Run the test suite: 
```bash
$ bundle exec rake
```

You should see 14/21 specs failing. 

Or start the Thin web server:

```bash
$ rails server
```

Open your favorite browser, navigate to `http://localhost:3000` and start hacking!

# License

[The MIT License (MIT)](./LICENSE.md)
