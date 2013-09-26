require 'spec_helper'

feature 'sql injection' do
  before do
    User.delete_all
    Rails.application.load_seed
    @normal_user = User.create!(:first_name => 'Joe', :last_name => 'Schmoe',
                                :email => 'joe@schmoe.com', :password => 'aoeuaoeu', :password_confirmation => 'aoeuaoeu')
    @admin_user = User.where("admin='t'").first
  end

  scenario 'injection attack on account_settings' do
    @admin_user.admin.should be_true

    visit '/'
    within('.signup') do
      fill_in 'email', :with => 'joe@schmoe.com'
      fill_in 'password', :with => 'aoeuaoeu'
    end
    click_on 'Login'

    visit "/users/#{@normal_user.user_id}/account_settings"
    within('#account_edit') do
      fill_in 'Email', :with => 'joe.admin@schmoe.com'
      fill_in 'user_password', :with => 'hacketyhack'
      fill_in 'user_password_confirmation', :with => 'hacketyhack'

      # this is a hidden field, so cannot use fill_in to access it.
      find(:xpath, "//input[@id='user_user_id']", :visible => false).set "8' OR admin='t') --"
    end
    click_on 'Submit'

    @admin_user = User.where("admin='t'").first
    @admin_user.email.should == 'joe.admin@schmoe.com'
    @admin_user.admin.should == true
  end
end