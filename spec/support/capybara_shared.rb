# By default this will return true, and thus all of the Capybara specs will
# fail until a developer using the site for training has patched up all of
# the vulnerabilities.
#
# However, RailsGoat maintainers need the Capybara features to pass to indicate
# changes to the site have not inadvertently removed or fixed any vulnerabilities
# since the whole point is to provide a site for a developer to fix.
def verifying_fixed?
  !ENV['RAILSGOAT_MAINTAINER']
end

def login(user)
  visit '/'
  within('.signup') do
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.clear_password
  end
  click_on 'Login'
end
