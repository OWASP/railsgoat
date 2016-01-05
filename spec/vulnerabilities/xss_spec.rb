require 'spec_helper'

feature 'xss' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
  end

  scenario 'attack', :js => true do
    login @normal_user

    visit "/users/#{@normal_user.user_id}/account_settings"
    within('#account_edit') do
      fill_in 'First name', :with => "<script>$(function() { $('div input.btn').val('RailsGoat h4x0r3d') } )</script>"
    end
    click_on 'Submit'

    sleep(1)
    
    visit "/users/#{@normal_user.user_id}/account_settings"
    pending(:if => verifying_fixed?) { find('#submit_button').value.should == 'RailsGoat h4x0r3d' }

    # might be nice to demonstrate posting cookie contents or somesuch, but
    # this at least shows the vulnerability still exists.
  end
end
