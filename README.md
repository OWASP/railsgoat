# RailsGoat [![Build Status](https://api.travis-ci.org/OWASP/railsgoat.png?branch=master)](https://travis-ci.org/OWASP/railsgoat) [![Code Climate](https://codeclimate.com/github/OWASP/railsgoat.png)](https://codeclimate.com/github/OWASP/railsgoat)

RailsGoat is a vulnerable version of the Ruby on Rails Framework both versions 3 and 4. It includes vulnerabilities from the OWASP Top 10, as well as some "extras" that the initial project contributors felt worthwhile to share. This project is designed to educate both developers, as well as security professionals.

## Getting Started

To begin, install the Ruby Version Manager (RVM):

```bash
$ curl -L https://get.rvm.io | bash -s stable --autolibs=3 --ruby=2.1.2
```

After installing the package, clone this repo:

```bash
$ git clone git@github.com:OWASP/railsgoat.git
```

**NOTE: NOT NECESSARY IF YOU WANT TO WORK WITH RAILS 4.** Otherwise, if you wish to use the Rails 3 version, you'll need to switch branches 

```bash
$ cd railsgoat
$ git checkout rails_3_2
```

Navigate into the directory (already there if you followed the previous step) and install the dependencies:

```bash
$ bundle install
```

If you receive an error, make sure you have `bundler` installed:

```bash
$ gem install bundler
```

Initialize the database:

```bash
$ rake db:setup
```

Start the Thin web server:

```bash
$ rails server
```

Open your favorite browser, navigate to `http://localhost:3000` and start hacking!

## Vagrant Install

To run Railsgoat with Vagrant you must first have [Vagrant](https://www.vagrantup.com/) and [Virtualbox](https://www.virtualbox.org/) installed. Once those dependencies are installed cd into the Railsgoat directory where you've cloned the code and run.

```
#~/code/railsgoat
$ vagrant up
...
    railsgoat:   Port: 3000:3000
    railsgoat:  
    railsgoat: Container created: 3084633a81675346
==> railsgoat: Starting container...
==> railsgoat: Provisioners will not be run since container doesn't support SSH.
$
```
Once you see the preceeding message Railsgoat is running on your localhost on port 3000.

Open your favorite browser, navigate to `http://localhost:3000` and start hacking!

## Capybara Tests

RailsGoat now includes a set of failing Capybara RSpecs, each one indicating that a separate vulnerability exists in the application. To run them, you first need to install [PhantomJS](https://github.com/jonleighton/poltergeist#installing-phantomjs), which is required by the Poltergeist Capybara driver. Upon installation, simply run the following rake task:

```
$ rake training
```

To run just one spec:

```
$ rake training SPEC=spec/vulnerabilities/sql_injection_spec.rb
```

NOTE: As vulnerabilities are fixed in the application, these specs will not change to `passing`, but to `pending`.


## MySQL Environment

By default in development mode Railsgoat runs with a SQLite database. There is an environment defined to use MySQL. For some of the SQL injection vulnerabilities to work you have to run the app with MySQL as the database. The following steps will setup and run Railsgoat to use MySQL. *MySQL must be installed and running before running these steps*

```
#Create the MySQL database
RAILS_ENV=mysql rake db:create

#Run the migrations against the database
RAILS_ENV=mysql rake db:migrate

#Boot Rails using MySQl
RAILS_ENV=mysql rails s
```

## Processing Email

In order for RailsGoat to effectively process email, you will first need to run MailCatcher, an SMTP server that will intercept email messages and display them in a web interface.

To start an instance of MailCatcher, simply run:

```
$ mailcatcher
```

If successful, you should see the following output:

```
Starting MailCatcher
==> smtp://127.0.0.1:1025
==> http://127.0.0.1:1080
*** MailCatcher runs as a daemon by default. Go to the web interface to quit.
```

Alternatively, you can run MailCatcher in the foreground by running `mailcatcher -f` in your terminal.

## Contributing

As changes are made to the application, the Capybara RSpecs can be used to verify that the vulnerabilities in the application are still intact. To use them in this way, and have them `pass` instead of `fail`, set the `RAILSGOAT_MAINTAINER` environment variable.

Conversion to the OWASP Top Ten 2013 completed in November, 2013.

# License

The MIT License (MIT)

Copyright (c) 2013-2014 The Open Web Application Security Project

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
