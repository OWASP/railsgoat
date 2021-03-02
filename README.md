# RailsGoat [![Build Status](https://api.travis-ci.org/OWASP/railsgoat.png?branch=master)](https://travis-ci.org/OWASP/railsgoat) [![Code Climate](https://codeclimate.com/github/OWASP/railsgoat.png)](https://codeclimate.com/github/OWASP/railsgoat)

RailsGoat is a vulnerable version of the Ruby on Rails Framework from versions 3 to 6. It includes vulnerabilities from the OWASP Top 10, as well as some "extras" that the initial project contributors felt worthwhile to share. This project is designed to educate both developers, as well as security professionals.

## Support

If you are looking for support or troubleshooting assistance, please visit our [OWASP Slack Channel](https://owasp.slack.com/messages/project-railsgoat/).

## Getting Started

- [ ] [install git](https://github.com/git-guides/install-git) if you don't have it already
- [ ] follow [these instructions](https://gorails.com/setup) to install Ruby on Rails
- [ ] make your own fork of [my repo](https://github.com/rifkinni/railsgoat)

Clone your new repo:

```bash
$ git clone git@github.com:<YOUR GITHUB USER NAME>/railsgoat.git
$ cd railsgoat
```

Install the dependencies:

```bash
$ gem install bundler
$ bundle install
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

## Capybara Tests

RailsGoat now includes a set of failing Capybara RSpecs, each one indicating that a separate vulnerability exists in the application. To run them, you first need to install [PhantomJS](https://github.com/jonleighton/poltergeist#installing-phantomjs) (version 2.1.1 has been tested in Dev and on Travis CI), which is required by the Poltergeist Capybara driver. Upon installation, simply run the following task:

```
$ rails training
```

To run just one spec:

```
$ rails training SPEC=spec/vulnerabilities/sql_injection_spec.rb
```

# License

[The MIT License (MIT)](./LICENSE.md)