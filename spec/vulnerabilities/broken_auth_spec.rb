# frozen_string_literal: true
require "spec_helper"

feature "broken_auth" do
  let(:normal_user) { UserFixture.normal_user }

  before do
    UserFixture.reset_all_users

    pending unless verifying_fixed?
  end

  scenario "one\nTutorial: https://github.com/OWASP/railsgoat/wiki/A2-Credential-Enumeration" do
    wrong_email = normal_user.email + "not"

    visit "/"
    fill_in "email", with: wrong_email
    fill_in "password", with: normal_user.clear_password
    find("input[type='submit'][value='Login']").click

    expect(find("div#flash_notice").text).not_to include(wrong_email)
  end

  scenario "two\nTutorial: https://github.com/OWASP/railsgoat/wiki/A2-Credential-Enumeration" do
    visit "/"
    fill_in "email", with: normal_user.email
    fill_in "password", with: normal_user.clear_password + "not"
    find("input[type='submit'][value='Login']").click

    expect(find("div#flash_notice").text).not_to include("Incorrect Password!")
  end
end
