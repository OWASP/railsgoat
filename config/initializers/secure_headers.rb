::SecureHeaders::Configuration.configure do |config|
  config.hsts = {:max_age => 20.years.to_i, :include_subdomains => true}
  config.x_frame_options = 'DENY'
  config.x_content_type_options = "nosniff"
  config.x_xss_protection = {:value => 1, :mode => 'block'}
  config.csp = {
    :enforce => true,
    :default_src => 'self',
    :connect_src => 'ws://railsgoat.dev:35727 self',
    :script_src => 'self nonce eval https://www.google.com',
    :style_src => 'self inline',
    :report_uri => '//example.com/uri-directive',
    :disable_fill_missing => true
  }
end
