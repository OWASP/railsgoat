require 'spec_helper'

feature 'mass assignment' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
  end

  scenario 'attack one' do
    @normal_user.admin.should be_false

    login(@normal_user)

    params = {:user => {:admin => 't',
                        :user_id => @normal_user.user_id,
                        :password => @normal_user.clear_password,
                        :password_confirmation => @normal_user.clear_password}}
    page.driver.put "/users/#{@normal_user.user_id}.json", params

    pending(:if => verifying_fixed?) { @normal_user.reload.admin.should be_true }
  end

  scenario 'attack two' do
    params = {:user => {:admin => 't',
                        :email => 'hackety@h4x0rs.c0m',
                        :first_name => 'hackety',
                        :last_name => 'hax',
                        :password => 'foobarewe',
                        :password_confirmation => 'foobarewe'}}
    page.driver.post '/users', params

    pending(:if => verifying_fixed?) {
      User.last.email.should == 'hackety@h4x0rs.c0m'
      User.last.admin.should be_true
    }
  end
end
