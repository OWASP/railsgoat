# frozen_string_literal: true
Railsgoat::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Tired of caching causing issues
  config.middleware.delete Rack::ETag

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  # ActionMailer settings for email support
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = { address: "127.0.0.1", port: 1025 }
  config.action_mailer.default_url_options = { host: "127.0.0.1:3000" }

 # config.middleware.insert_before(
 #      Rack::Lock, Rack::LiveReload,
 #      :min_delay => 500,
 #      :max_delay => 1000,
 #      :port => 35727,
 #      :host => 'railsgoat.dev',
 #      :ignore => [ %r{dont/modify\.html$} ]
 # )

  # For Rails 4.0+
  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false
end
