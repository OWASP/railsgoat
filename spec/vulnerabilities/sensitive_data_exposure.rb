# frozen_string_literal: true
require "spec_helper"

feature "sensitive data exposure" do
  let(:normal_user) { UserFixture.normal_user }
  let(:user_ssn) { "999-99-9999" }

  before do
    UserFixture.reset_all_users
    normal_user.work_info.update(:SSN, user_ssn)

    pending unless verifying_fixed?
  end

  # this won't work with javascript_driver, as it'll apply the javascript
  # function to mask this value and the source will be overwritten.
  scenario "attack\nTutorial: https://github.com/OWASP/railsgoat/wiki/A6-Sensitive-Data-Exposure-Cleartext-Storage-SSNs" do
    login(normal_user)

    visit "/users/#{normal_user.id}/work_info"

    expect(page.source).not_to include(user_ssn)
  end
end
