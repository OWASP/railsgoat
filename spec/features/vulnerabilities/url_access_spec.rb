require 'spec_helper'

feature 'url access' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
  end

  scenario 'attack', :js => true do
    login @normal_user

    visit '/admin/1/dashboard'
    pending(:if => verifying_fixed?) { current_path.should == '/admin/1/dashboard' }
  end
end