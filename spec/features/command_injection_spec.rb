require 'spec_helper'
require 'tmpdir'

feature 'command injection' do
  before do
    User.delete_all
    Rails.application.load_seed
    @normal_user = User.new(:first_name => 'Joe', :last_name => 'Schmoe',
                            :email => 'joe@schmoe.com', :password => 'aoeuaoeu', :password_confirmation => 'aoeuaoeu')
    @normal_user.build_benefits_data
    @normal_user.save!
  end

  scenario 'injection attack on file upload', :js => true do
    visit '/'
    within('.signup') do
      fill_in 'email', :with => 'joe@schmoe.com'
      fill_in 'password', :with => 'aoeuaoeu'
    end
    click_on 'Login'

    legit_file = File.join(Rails.root, 'public', 'data', 'legit.txt')
    File.open(legit_file, 'w') { |f| f.puts 'totes legit' }

    visit "/users/#{@normal_user.user_id}/benefit_forms"
    Dir.mktmpdir do |dir|
      hackety_file = File.join(dir, '; cd public && cd data && rm -f * ;')
      File.open(hackety_file, 'w') { |f| f.print 'mwahaha' }
      within('.new_benefits') do
        attach_file 'benefits_upload', hackety_file
        find(:xpath, "//input[@id='benefits_backup']", :visible => false).set 'true'
      end
      save_screenshot('screenshot.before.upload.png')
      click_on 'Start Upload'
    end
    save_screenshot('screenshot.after.upload.png')
    File.exists?(legit_file).should be_false
  end
end