# frozen_string_literal: true
source "https://rubygems.org"

#don't upgrade
gem "rails", "5.1.4"

ruby "2.4.2"

gem "rails-perftest"
gem "rake"
gem "ruby-prof"

# Bundle edge Rails instead:
# gem 'rails', git: 'https://github.com/rails/rails'

gem 'sqlite3'
gem 'foreman'

# Pry for Rails, not in dev group in case running via prod/staging @ a training
gem "pry-rails"

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

gem "simplecov", require: false, group: :test

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

# Gems used only for assets and not required
# in production environments by default.
gem "coffee-rails"
gem "jquery-fileupload-rails"
gem "sass-rails"
gem "turbolinks"
gem "uglifier"

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby

gem "jquery-rails"

# To use ActiveModel has_secure_password
 gem "bcrypt"

# Use unicorn as the app server
gem "unicorn"

# Pow related gem
gem "powder"

gem "aruba"
gem "execjs"
gem "therubyracer"

# Add SMTP server support using MailCatcher
# NOTE: https://github.com/sj26/mailcatcher#bundler
# gem 'mailcatcher'

#For Rails 4.0
#group :doc do
#  # bundle exec rails doc:rails generates the API under doc/api.
#  gem 'sdoc', require: false
#end

#For Rails 4.2
gem "responders"

gem "minitest"
