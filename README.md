# RailsGoat [![Build Status](https://api.travis-ci.org/OWASP/railsgoat.png?branch=master)](https://travis-ci.org/OWASP/railsgoat) [![Code Climate](https://codeclimate.com/github/OWASP/railsgoat.png)](https://codeclimate.com/github/OWASP/railsgoat)

RailsGoat is a vulnerable version of the Ruby on Rails Framework from versions 3 to 6. It includes vulnerabilities from the OWASP Top 10, as well as some "extras" that the initial project contributors felt worthwhile to share. This project is designed to educate both developers, as well as security professionals.

## Support

If you are looking for support or troubleshooting assistance, please visit our [OWASP Slack Channel](https://owasp.slack.com/messages/project-railsgoat/).

## Getting Started

To begin, if you do not have Ruby, Git, MySQL, and Postgres, we suggest
using this [site](https://gorails.com/setup) to install the software.
Pick the appropriate operating system and follow the instructions.

After installing the above software, clone this repo:

```bash
$ git clone git@github.com:OWASP/railsgoat.git
```

**NOTE: NOT NECESSARY IF YOU WANT TO WORK WITH RAILS 6.** Otherwise, if you wish to use the Rails 3 or 4 versions, you'll need to switch branches:

```bash
$ cd railsgoat
$ git checkout rails_3_2
$ git checkout rails_4_2
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
$ rails db:setup
```

Start the Thin web server:

```bash
$ rails server
```

Open your favorite browser, navigate to `http://localhost:3000` and start hacking!

## Docker Install
To run Railsgoat with Docker you must first have [Docker](https://docs.docker.com/engine/installation/) and [Docker Compose](https://docs.docker.com/compose/install/) installed. Once those dependencies are installed, cd into the Railsgoat directory where you've cloned the code and run. Rails requires Compose **1.6.0** or above and require a Docker Engine of version **1.10.0** or above.

For Mac Apple Silicon (ARM64) you must also have Rosetta install

```
#~/code/railsgoat
$ docker-compose build
$ docker-compose run web rails db:setup
$ docker-compose up
...
  Creating railsgoat_web_1
  Attaching to railsgoat_web_1
$
```
Once you see the preceeding message Railsgoat is running on your localhost on port 3000.

Open your favorite browser, navigate to `http://<dockerIP>:3000` and start hacking! The Docker IP is usually `192.168.99.100`. Run `docker-machine env` to verify.

Note: if your container exits with an error, it may be because a server is already running:
```
A server is already running. Check /myapp/tmp/pids/server.pid.
=> Booting Thin
=> Rails 6.0.0 application starting in development on
http://0.0.0.0:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
Exiting
```
In this case, remove that server.pid file and try again. Note also that this file is in your current working directory, not inside the container.

## Capybara Tests

RailsGoat now includes a set of failing Capybara RSpecs, each one indicating that a separate vulnerability exists in the application. To run them, you first need to install [PhantomJS](https://github.com/jonleighton/poltergeist#installing-phantomjs) (version 2.1.1 has been tested in Dev and on Travis CI), which is required by the Poltergeist Capybara driver. Upon installation, simply run the following task:

```
$ rails training
```

To run just one spec:

```
$ rails training SPEC=spec/vulnerabilities/sql_injection_spec.rb
```

## MySQL Environment

By default in development mode Railsgoat runs with a SQLite database. There is an environment defined to use MySQL. For some of the SQL injection vulnerabilities to work you have to run the app with MySQL as the database. The following steps will setup and run Railsgoat to use MySQL. *MySQL must be installed and running before running these steps*

```
#Create the MySQL database
RAILS_ENV=mysql rails db:create

#Run the migrations against the database
RAILS_ENV=mysql rails db:migrate

#Boot Rails using MySQl
RAILS_ENV=mysql rails s
```

## Processing Email

In order for RailsGoat to effectively process email, you will first need to run MailCatcher, an SMTP server that will intercept email messages and display them in a web interface.

Mailcatcher is not installed by default. To install MailCatcher and start an instance of it, simply run:

```
$ gem install mailcatcher
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

Please see our [contribution document](./CONTRIBUTING.md) to learn more. Additionally, note that as changes are made to the application, the Capybara RSpecs can be used to verify that the vulnerabilities in the application are still intact. To use them in this way, and have them change to `pending` instead of `fail`, set the `RAILSGOAT_MAINTAINER` environment variable.

Conversion to the OWASP Top Ten 2013 completed in November, 2013.

# License

[The MIT License (MIT)](./LICENSE.md)
