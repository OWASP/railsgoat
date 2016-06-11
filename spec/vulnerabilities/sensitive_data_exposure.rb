require 'spec_helper'

feature 'sensitive data exposure' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
    @normal_user.work_info.update_attribute(:SSN, '999-99-9999')
  end

  # this won't work with javascript_driver, as it'll apply the javascript
  # function to mask this value and the source will be overwritten.
  scenario "attack\nTutorial: https://github.com/OWASP/railsgoat/wiki/A6-Sensitive-Data-Exposure-Cleartext-Storage-SSNs" do
    login @normal_user

    visit "/users/#{@normal_user.user_id}/work_info"
    pending if verifying_fixed?
    expect(page.source).to include '999-99-9999'
  end
end
