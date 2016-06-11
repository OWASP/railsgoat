require 'spec_helper'

feature 'mass assignment' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
  end

  scenario 'attack one' do
    expect(@normal_user.admin).to be_falsey

    login(@normal_user)

    params = {:user => {:admin => 't',
                        :user_id => @normal_user.user_id,
                        :password => @normal_user.clear_password,
                        :password_confirmation => @normal_user.clear_password}}
    page.driver.put "/users/#{@normal_user.user_id}.json", params

    pending if verifying_fixed?
    expect(@normal_user.reload.admin).to be_truthy
  end

  scenario 'attack two, Tutorial: https://github.com/OWASP/railsgoat/wiki/R4-Extras-Mass-Assignment-Admin-Role' do
    params = {:user => {:admin => 't',
                        :email => 'hackety@h4x0rs.c0m',
                        :first_name => 'hackety',
                        :last_name => 'hax',
                        :password => 'foobarewe',
                        :password_confirmation => 'foobarewe'}}
    page.driver.post '/users', params

    pending if verifying_fixed?
    expect(User.last.email).to eq('hackety@h4x0rs.c0m')
    expect(User.last.admin).to be_truthy
  end
end
