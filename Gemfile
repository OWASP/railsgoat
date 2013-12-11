source 'https://rubygems.org'

#don't upgrade
gem 'rails', '3.2.11'
gem 'rack', '1.4.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'foreman'

group :development do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'guard-brakeman'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'guard-shell'
  gem 'pry'
  gem 'rack-livereload'
  gem 'rb-fsevent'
	gem 'travis-lint'
  gem 'better_errors'
  gem 'binding_of_caller'
end

gem 'gauntlt'

gem 'simplecov', '0.8.0.pre2', :require => false, :group => :test

group :development, :test do
  gem 'launchy'
  gem 'capybara'
  gem 'database_cleaner', '< 1.1.0'
  gem 'poltergeist'
  gem 'rspec-rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'jquery-fileupload-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
 gem 'bcrypt-ruby'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
 gem 'unicorn'

# Pow related gem
gem 'powder'

gem 'aruba'
#gem 'minitest', '~> 4.0', :require=> "minitest/autorun"

#gem 'minitest'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'execjs'
gem 'therubyracer'

# Add SMTP server support using MailCatcher
gem 'mailcatcher'