require 'spec_helper'

feature 'unvalidated redirect' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
  end

  scenario 'attack', :js => true do
    visit '/users/sign_in?url=http://example.com/do/evil/things'
    within('.signup') do
      fill_in 'user_email', :with => @normal_user.email
      fill_in 'user_password', :with => @normal_user.clear_password
    end
    within('.actions') do
      click_on 'Login'
    end
    pending(:if => verifying_fixed?) { current_url.should == 'http://example.com/do/evil/things' }
  end
end