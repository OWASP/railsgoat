require 'spec_helper'

feature 'password complexity' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
  end

  scenario 'one' do
    visit '/signup'
    within('.signup') do
      fill_in 'user_email', :with => @normal_user.email + 'not'
      fill_in 'user_first_name', :with => @normal_user.first_name
      fill_in 'user_last_name', :with => @normal_user.last_name + 'not'
      fill_in 'user_password', :with => 'password'
      fill_in 'user_password_confirmation', :with => 'password'
    end
    click_on 'Submit'
    pending(:if => verifying_fixed?) {current_path.should == '/dashboard/home'}
  end
end