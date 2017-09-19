# frozen_string_literal: true
require "spec_helper"

feature "sql injection" do
  before(:each) do
    UserFixture.reset_all_users

    @normal_user = UserFixture.normal_user
    @admin_user = UserFixture.admin_user
  end
  before(:each) { pending unless verifying_fixed? }

  scenario "attack\nTutorial: https://github.com/OWASP/railsgoat/wiki/R4-A1-SQL-Injection-Concatentation" do
    expect(@admin_user.admin).to be_truthy

    login(@normal_user)

    visit "/users/#{@normal_user.id}/account_settings"

    within("#account_edit") do
      fill_in "Email", with: "joe.admin@schmoe.com"
      fill_in "user_password", with: "H4cketyhack"
      fill_in "user_password_confirmation", with: "H4cketyhack"

      # this is a hidden field, so cannot use fill_in to access it.
      find(:xpath, "//input[@id='user_id']", visible: false).set "8' OR admin='t') --"
    end
    click_on "Submit"

    @admin_user = User.where(admin: true).first
    expect(@admin_user.email).not_to eq("joe.admin@schmoe.com")
  end

  scenario "attack\nTutorial: https://github.com/OWASP/railsgoat/wiki/A1-SQL-Injection-Interpolation", js: true do
    login(@normal_user)
    Analytics.create!(ip_address: "::1")

    visit "/admin/1/analytics"

    within("#analytics_search") do
      fill_in "ip", with: "::1"
      check "field_user_agent"
      payload = "(select group_concat(password) from users where admin='t')"

      page.execute_script "$('#field_user_agent').attr('name', \"field[#{payload}]\");"
      page.execute_script "$('#analytics_search').submit();"
    end

    pending if verifying_fixed?
    expect(page).to have_css(".dataTable.custom")
    expect(page.source).to include(@admin_user.password)
  end
end
