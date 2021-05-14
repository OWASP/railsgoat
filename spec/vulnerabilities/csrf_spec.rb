# frozen_string_literal: true
require "spec_helper"
require "tmpdir"

feature "csrf" do
  let(:normal_user) { UserFixture.normal_user }

  before(:each) do
    UserFixture.reset_all_users
    pending unless verifying_fixed?
  end

  scenario "attack\nTutorial: https://github.com/OWASP/railsgoat/wiki/R4-A8-CSRF", js: true do
    visit "/"
    # TODO: is there a way to get this without visiting root first?
    base_url = current_url

    login(normal_user)

    Dir.mktmpdir do |dir|
      hackety_file = File.join(dir, "form.on.bad.guy.site.html")
      post_url = "#{base_url}schedule.json"
      File.open(hackety_file, "w") do |f|
        f.print <<-HTML
        <html>
          <body>
            <form id='submit_me' action="#{post_url}" method="POST">
              <input type="hidden" name="schedule&#91;event&#95;name&#93;" value="Bad&#32;Guy" />
              <input type="hidden" name="schedule&#91;event&#95;type&#93;" value="pto" />
              <input type="hidden" name="schedule&#91;event&#95;desc&#93;" value="Fun&#32;Fun" />
              <input type="hidden" name="date&#95;range1" value="06&#47;08&#47;2013&#32;&#45;&#32;06&#47;09&#47;2013" />
              <input type="submit" value="Submit request" />
            </form>
          </body>
        </html>
        HTML
      end

      page.driver.visit "file://#{hackety_file}"
      within("#submit_me") do
        click_on "Submit request"
      end
    end

    expect(normal_user.reload.paid_time_off.schedule.last.event_name).not_to eq("Bad Guy")
  end
end
