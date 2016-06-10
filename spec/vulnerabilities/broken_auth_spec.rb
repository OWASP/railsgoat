require 'spec_helper'

feature 'broken_auth' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
  end

  scenario "one\nTutorial: https://github.com/OWASP/railsgoat/wiki/A2-Credential-Enumeration" do
    visit '/'
    within('.signup') do
      fill_in 'email', :with => @normal_user.email + 'not'
      fill_in 'password', :with => @normal_user.clear_password
    end
    within('.actions') do
      click_on 'Login'
    end
    pending if verifying_fixed?
    expect(find('div#flash_notice').text).to eq("#{@normal_user.email}not doesn't exist!")
  end

  scenario "two\nTutorial: https://github.com/OWASP/railsgoat/wiki/A2-Credential-Enumeration" do
    visit '/'
    within('.signup') do
      fill_in 'email', :with => @normal_user.email
      fill_in 'password', :with => @normal_user.clear_password + 'not'
    end
    within('.actions') do
      click_on 'Login'
    end
    pending if verifying_fixed?
    expect(find('div#flash_notice').text).to eq('Incorrect Password!')
  end
end
