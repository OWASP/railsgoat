require 'spec_helper'

feature 'improper password hashing' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
  end

  scenario 'with just md5' do
    new_pass = 'testpassword'
    @normal_user.password = new_pass
    @normal_user.password_confirmation = new_pass
    @normal_user.save
    pending(:if => verifying_fixed?) {Digest::MD5.hexdigest(new_pass).should == @normal_user.password}
  end

=begin
  scenario 'with md5 and salt' do
    pending unless @normal_user.has_attribute?('salt')
    new_pass = 'testpassword'
    @normal_user.password = new_pass
    @normal_user.password_confirmation = new_pass
    @normal_user.save
    pending(:if => verifying_fixed?) {Digest::MD5.hexdigest(@normal_user.salt + new_pass).should == @normal_user.password}
  end
=end

end