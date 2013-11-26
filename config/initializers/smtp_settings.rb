ActionMailer::Base.smtp_settings = {
  :address           => 'mailtrap.io',
  :port              => 2525,
  :authentication    => :plain,
  :user_name         => ENV['MAILTRAP_USERNAME'],
  :password          => ENV['MAILTRAP_PASSWORD']
}

ActionMailer::Base.delivery_method = :smtp