require 'spec_helper'

feature 'broken_auth' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
  end

  scenario 'one' do
    visit '/users/sign_in'
    within('.signup') do
      fill_in 'user_email', :with => @normal_user.email + 'not'
      fill_in 'user_password', :with => @normal_user.clear_password
    end
    within('.actions') do
      click_on 'Log in'
    end
    pending(:if => verifying_fixed?) { find('div#flash_notice').text.should == "#{@normal_user.email}not doesn't exist!" }
  end

  scenario 'two' do
    visit '/users/sign_in'
    within('.signup') do
      fill_in 'user_email', :with => @normal_user.email
      fill_in 'user_password', :with => @normal_user.clear_password + 'not'
    end
    within('.actions') do
      click_on 'Log in'
    end
    pending(:if => verifying_fixed?) { find('div#flash_notice').text.should == 'Incorrect Password!' }
  end
end