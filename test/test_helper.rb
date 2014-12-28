ENV["RAILS_ENV"] ||= "test"

# To use simplecov, do this: COVERAGE=true rake
require 'simplecov'
SimpleCov.start if ENV["COVERAGE"]

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Maybe for Rails 4.0: ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
