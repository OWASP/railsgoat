# frozen_string_literal: true
require "spec_helper"

feature "url access" do
  let(:normal_user) { UserFixture.normal_user }

  before do
    UserFixture.reset_all_users

    pending unless verifying_fixed?
  end

  scenario "attack\nTutorial: https://github.com/OWASP/railsgoat/wiki/A7-Missing-Function-Level-Access-Control--(Admin-Controller)", js: true do
    login(normal_user)

    visit "/admin/1/dashboard"

    expect(current_path).to eq("/dashboard/home")
  end
end
