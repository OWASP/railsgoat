# frozen_string_literal: true
require "spec_helper"

feature "password complexity" do
  let(:normal_user) { UserFixture.normal_user }

  before do
    UserFixture.reset_all_users
    pending unless verifying_fixed?
  end

  scenario "one\nTutorial: https://github.com/OWASP/railsgoat/wiki/A2-Lack-of-Password-Complexity" do
    new_user_email = normal_user.email + "two"

    visit "/signup"
    within(".signup") do
      fill_in "user_email", with: new_user_email
      fill_in "user_first_name", with: normal_user.first_name
      fill_in "user_last_name", with: normal_user.last_name + "not"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
    end
    click_on "Submit"

    expect(User.find_by(email: new_user_email)).to be_nil
    expect(current_path).to eq("/signup")
  end
end
