def login(user)
  visit '/'
  within('.signup') do
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.clear_password
  end
  click_on 'Login'
end
