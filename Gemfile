# frozen_string_literal: true
source "https://rubygems.org"

gem "rails", "~> 8.0.0"

ruby "3.4.1"

gem "aruba"
gem "bcrypt"
gem "foreman"
gem "jquery-fileupload-rails"
gem "jquery-rails"
gem "minitest"
gem "pry-rails" # not in dev group in case running via prod/staging @ a training
gem "puma", "~> 6.0"
gem "rake"
gem "responders"
gem "ruby-prof"
gem "sassc-rails"
gem "simplecov", require: false, group: :test
gem "sqlite3", "~> 2.0"
gem "turbolinks"

# Asset pipeline
gem "sprockets-rails"
gem "importmap-rails"
gem "stimulus-rails"
gem "turbo-rails"

# Add SMTP server support using MailCatcher
# NOTE: https://github.com/sj26/mailcatcher#bundler
# gem 'mailcatcher'

group :development, :mysql do
  gem "better_errors"
  gem "binding_of_caller"
  gem "bundler-audit"
  gem "guard-livereload"
  gem "guard-rspec"
  gem "guard-shell"
  gem "pry"
  gem "rack-livereload"
  gem "rb-fsevent"
  gem "rubocop"
end

group :development, :test, :mysql do
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem "selenium-webdriver"
  gem "rspec-rails"
  gem "test-unit"
end

group :openshift do
  gem "pg"
end

group :mysql do
  gem "mysql2"
end
