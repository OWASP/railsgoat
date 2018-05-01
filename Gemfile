# frozen_string_literal: true
source "https://rubygems.org"

#don't upgrade
gem "rails", "5.1.6"

ruby "2.5.1"

gem "aruba"
gem "bcrypt"
gem "coffee-rails"
gem "execjs"
gem "foreman"
gem "jquery-fileupload-rails"
gem "jquery-rails"
gem "minitest"
gem "powder" # Pow related gem
gem "pry-rails" # not in dev group in case running via prod/staging @ a training
gem "puma"
gem "rails-perftest"
gem "rake"
gem "responders" #For Rails 4.2 # LOCKED DOWN
gem "ruby-prof"
gem "sass-rails"
gem "simplecov", require: false, group: :test
gem "sqlite3"
gem "therubyracer"
gem "turbolinks"
gem "uglifier"
gem "unicorn"

# Add SMTP server support using MailCatcher
# NOTE: https://github.com/sj26/mailcatcher#bundler
# gem 'mailcatcher'

group :development, :mysql do
  gem "better_errors"
  gem "binding_of_caller"
  gem "brakeman"
  gem "bundler-audit"
  gem "guard-brakeman"
  gem "guard-livereload"
  gem "guard-rspec"
  gem "guard-shell"
  gem "pry"
  gem "rack-livereload"
  gem "rb-fsevent"
  gem "rubocop-github"
  gem "travis-lint"
end

group :development, :test, :mysql do
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem "poltergeist"
  gem "rspec-rails"
  gem "test-unit"
end

group :mysql do
  gem "mysql2"
end
