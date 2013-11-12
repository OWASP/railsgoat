require 'spec_helper'
require 'tmpdir'

feature 'command injection' do
  before do
    UserFixture.reset_all_users
    @normal_user = UserFixture.normal_user
  end

  scenario 'attack', :js => true do
    login @normal_user

    legit_file = File.join(Rails.root, 'public', 'data', 'legit.txt')
    File.open(legit_file, 'w') { |f| f.puts 'totes legit' }

    visit "/users/#{@normal_user.user_id}/benefit_forms"
    Dir.mktmpdir do |dir|
      hackety_file = File.join(dir, 'test; cd public && cd data && rm -f * ;')
      File.open(hackety_file, 'w') { |f| f.print 'mwahaha' }
      within('.new_benefits') do
        attach_file 'benefits_upload', hackety_file
        find(:xpath, "//input[@id='benefits_backup']", :visible => false).set 'true'
      end
      click_on 'Start Upload'
    end
    pending(:if => verifying_fixed?) { File.exists?(legit_file).should be_false }
  end
end