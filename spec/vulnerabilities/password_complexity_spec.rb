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
    fill_in "email", with: new_user_email
    fill_in "first_name", with: normal_user.first_name
    fill_in "last_name", with: normal_user.last_name + "not"
    fill_in "password", with: "password"
    fill_in "password_confirmation", with: "password"
    click_on "Create Account"

    expect(User.find_by(email: new_user_email)).to be_nil
    expect(current_path).to eq("/signup")
  end
end
