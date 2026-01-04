# frozen_string_literal: true
require "spec_helper"

feature "improper password hashing" do
  let(:normal_user) { UserFixture.normal_user }

  before do
    UserFixture.reset_all_users
  end

  scenario "with just md5\nTutorial: https://github.com/OWASP/railsgoat/wiki/A6-Sensitive-Data-Exposure-Insecure-Password-Storage" do
    new_pass = "testPassw0rd!"
    normal_user.password = new_pass
    normal_user.password_confirmation = new_pass
    normal_user.save!

    if verifying_fixed?
      # Training mode: expect BCrypt (not MD5) - test should fail because vulnerability exists
      expect(normal_user.password).not_to eq(Digest::MD5.hexdigest(new_pass))
    else
      # Maintainer mode: expect MD5 to verify vulnerability still exists - test should pass
      expect(normal_user.password).to eq(Digest::MD5.hexdigest(new_pass))
    end
  end

end
