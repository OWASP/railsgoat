require 'spec_helper'

feature 'improper password hashing' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
  end

  scenario "with just md5\nTutorial: https://github.com/OWASP/railsgoat/wiki/A6-Sensitive-Data-Exposure-Insecure-Password-Storage" do
    new_pass = 'testpassword'
    @normal_user.password = new_pass
    @normal_user.password_confirmation = new_pass
    @normal_user.save
    pending if verifying_fixed?
    expect(Digest::MD5.hexdigest(new_pass)).to eq(@normal_user.password)
  end

end
