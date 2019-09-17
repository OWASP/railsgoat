# frozen_string_literal: true
require "spec_helper"

feature "sql injection" do
  let(:normal_user) { UserFixture.normal_user }
  let(:admin_user) { User.where(admin: true).first }

  before do
    UserFixture.reset_all_users
    pending unless verifying_fixed?
  end

  scenario "attack\nTutorial: https://github.com/OWASP/railsgoat/wiki/R5-A1-SQL-Injection-Concatentation" do
    expect(admin_user.admin).to be_truthy

    login(normal_user)

    visit "/users/#{normal_user.id}/account_settings"
    within("#account_edit") do
      fill_in "Email", with: "joe.admin@schmoe.com"
      fill_in "user_password", with: "hacketyhack"
      fill_in "user_password_confirmation", with: "hacketyhack"

      # this is a hidden field, so cannot use fill_in to access it.
      find(:xpath, "//input[@id='user_id']", visible: false).set "8' OR 1 == 1) --"
    end
    click_on "Submit"

    admin_user = User.where(admin: true).first
    expect(admin_user.email).not_to eq("joe.admin@schmoe.com")
  end
end
