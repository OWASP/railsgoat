# frozen_string_literal: true
require "spec_helper"

feature "improper password hashing" do
  let(:normal_user) { UserFixture.normal_user }

  before do
    UserFixture.reset_all_users
    pending unless verifying_fixed?
  end

  scenario "with just md5\nTutorial: https://github.com/OWASP/railsgoat/wiki/A6-Sensitive-Data-Exposure-Insecure-Password-Storage" do
    new_pass = "testPassw0rd!"
    normal_user.password = new_pass
    normal_user.password_confirmation = new_pass
    normal_user.save!

    expect(normal_user.password).not_to eq(Digest::MD5.hexdigest(new_pass))
  end

end
