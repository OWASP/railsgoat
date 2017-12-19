# frozen_string_literal: true
require "spec_helper"

feature "xss" do
  let(:normal_user) { UserFixture.normal_user }

  before(:each) do
    UserFixture.reset_all_users

    pending unless verifying_fixed?
  end

  scenario "attack\nTutorial: https://github.com/OWASP/railsgoat/wiki/A3-Cross-Site-Scripting", js: true do
    login(normal_user)

    visit "/users/#{normal_user.id}/account_settings"
    within("#account_edit") do
      fill_in "First name", with: "<script>$(function() { $('div input.btn').val('RailsGoat h4x0r3d') } )</script>"

      # password gets screwed up if you don't re-submit - need to fix
      fill_in "user_password", with: normal_user.clear_password
      fill_in "user_password_confirmation", with: normal_user.clear_password
    end
    click_on "Submit"

    sleep(1)

    visit "/users/#{normal_user.id}/account_settings"


    expect(find("#submit_button").value).not_to include("RailsGoat h4x0r3d")

    # might be nice to demonstrate posting cookie contents or somesuch, but
    # this at least shows the vulnerability still exists.
  end
end
