# frozen_string_literal: true
# By default this will return true, and thus all of the Capybara specs will
# fail until a developer using the site for training has patched up all of
# the vulnerabilities.
#
# However, RailsGoat maintainers need the Capybara features to pass to indicate
# changes to the site have not inadvertently removed or fixed any vulnerabilities
# since the whole point is to provide a site for a developer to fix.
$displayed_spec_notice = false

def verifying_fixed?
  maintainer_env_name = "RAILSGOAT_MAINTAINER"
  result = !ENV[maintainer_env_name]
  if !$displayed_spec_notice && result
    puts <<-NOTICE

    ******************************************************************************
    You are running the RailsGoat Capybara Specs in Training mode. These specs
    are supposed to fail, indicating vulnerabilities exist. They contain spoilers,
    so do not read the code in spec/vulnerabilities if your goal is to learn more
    about patching the vulnerabilities. You should fix the vulnerabilities in the
    application in order to get these specs to pass**. You can use them to measure
    your progress.

    These same specs will pass if you set the #{maintainer_env_name} ENV variable.

    **NOTE: The RSpec skip feature is used to toggle the outcome of these specs
    between Training mode and RailsGoat Maintainer mode. When the vulnerabilities
    are removed, the specs will pass instead. Try to get a fully passing suite.
    ******************************************************************************

    NOTICE
    $displayed_spec_notice = true
  end
  result
end

def login(user)
  visit "/"
  fill_in "email", with: user.email
  fill_in "password", with: user.clear_password
  find("input[type='submit'][value='Login']").click
end

# Configure Selenium with headless Chrome for JavaScript testing
# This works across macOS, Linux, and Windows without requiring Firefox
Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--headless")
  options.add_argument("--disable-gpu")
  options.add_argument("--no-sandbox")
  options.add_argument("--disable-dev-shm-usage")
  options.add_argument("--window-size=1920,1080")

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :selenium_chrome_headless
