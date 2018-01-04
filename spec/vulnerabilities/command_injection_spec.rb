# frozen_string_literal: true
require "spec_helper"
require "tmpdir"

feature "command injection" do
  let(:normal_user) { UserFixture.normal_user }

  before do
    UserFixture.reset_all_users
    pending unless verifying_fixed?
  end

  scenario "attack\nTutorial: https://github.com/OWASP/railsgoat/wiki/A1-Command-Injection", js: true do
    login(normal_user)

    legit_file = File.join(Rails.root, "public", "data", "legit.txt")
    File.open(legit_file, "w") { |f| f.puts "totes legit" }

    visit "/users/#{normal_user.id}/benefit_forms"
    Dir.mktmpdir do |dir|
      hackety_file = File.join(dir, "test; cd public && cd data && rm -f * ;")
      File.open(hackety_file, "w") { |f| f.print "mwahaha" }
      within(".new_benefits") do
        attach_file "benefits_upload", hackety_file
        find(:xpath, "//input[@id='benefits_backup']", visible: false).set "true"
      end
      click_on "Start Upload"
    end

    expect(File.exist?(legit_file)).to be_truthy
  end
end
