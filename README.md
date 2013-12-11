# RailsGoat [![Build Status](https://api.travis-ci.org/OWASP/railsgoat.png?branch=master)](https://travis-ci.org/OWASP/railsgoat) [![Code Climate](https://codeclimate.com/github/OWASP/railsgoat.png)](https://codeclimate.com/github/OWASP/railsgoat)

RailsGoat is a vulnerable version of the Ruby on Rails Framework. It includes vulnerabilities from the OWASP Top 10, as well as some "extras" that the initial project contributors felt worthwhile to share. This project is designed to educate both developers, as well as security professionals.

## Getting Started

Requirements: **Ruby 1.9.3**

To begin, install the Ruby Version Manager (RVM):

```
$ curl -L https://get.rvm.io | bash -s stable --autolibs=3 --ruby=1.9.3
```

After installing the package, clone this repo:

```
$ git clone git@github.com:OWASP/railsgoat.git
```

Navigate into the directory and accept the notice by typing `yes`:
```
****************************************************************************************************
* NOTICE                                                                                           *
****************************************************************************************************
* RVM has encountered a new or modified .rvmrc file in the current directory, this is a shell      *
* script and therefore may contain any shell commands.                                             *
*                                                                                                  *
* Examine the contents of this file carefully to be sure the contents are safe before trusting it! *
* Do you wish to trust '/path/to/railsgoat/.rvmrc'?                                                *
* Choose v[view] below to view the contents                                                        *
****************************************************************************************************
y[es], n[o], v[iew], c[cancel]>
```

Install the project dependencies:

```
$ bundle install
```

If you receive an error, make sure you have `bundler` installed:

```
$ gem install bundler
```

Initialize the database:

```
$ rake db:setup
```

Start the WEBrick HTTP Server:

```
$ rails server
```

Open your favorite browser, navigate to `http://localhost:3000` and start hacking!

## Capybara Tests

RailsGoat now includes a set of failing Capybara RSpecs, each one indicating that a separate vulnerability exists in the application. To run them, you first need to install [PhantomJS](https://github.com/jonleighton/poltergeist#installing-phantomjs), which is required by the Poltergeist Capybara driver. Upon installation, simply run the following rake task:

```
$ rake training
```

NOTE: As vulnerabilities are fixed in the application, these specs will not change to `passing`, but to `pending`.

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

Conversion to the OWASP Top 10, 2013 is under way. You can view progress within the `top-10-2013` branch.

```
$ git fetch origin
$ git checkout top-10-2013
```

Then proceed with browsing the site as normal :thumbsup:

# License

The MIT License (MIT)

Copyright (c) 2013 The Open Web Application Security Project

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.