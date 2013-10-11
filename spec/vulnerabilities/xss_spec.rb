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
      fill_in 'First name', :with => "B<script>$(function() { $('form.button_to input.btn.btn-primary').val('RailsGoat h4x0r3d') } )</script>"

      # password gets screwed up if you don't re-submit - need to fix
      fill_in 'user_password', :with => @normal_user.clear_password
      fill_in 'user_password_confirmation', :with => @normal_user.clear_password
    end
    click_on 'Submit'

    visit '/'

    pending(:if => verifying_fixed?) { find('form.button_to input.btn.btn-primary').value.should == 'RailsGoat h4x0r3d' }

    # might be nice to demonstrate posting cookie contents or somesuch, but
    # this at least shows the vulnerability still exists.
  end
end