require 'spec_helper'

feature 'sql injection' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
  end

  scenario 'mass assignment attack on account_settings' do
    @normal_user.admin.should be_false

    login(@normal_user)

    params = {:user => {:admin => 't',
                        :user_id => @normal_user.user_id,
                        :password => @normal_user.clear_password,
                        :password_confirmation => @normal_user.clear_password}}
    page.driver.put "/users/#{@normal_user.user_id}.json", params

    @normal_user.reload.admin.should be_true
  end
end