# frozen_string_literal: true
require "spec_helper"

feature "insecure direct object reference" do
  let(:normal_user) { UserFixture.normal_user }
  let(:another_user) { User.find_by(id: 2) }

  before do
    UserFixture.reset_all_users
    pending unless verifying_fixed?
  end

  scenario "attack one" do
    login(normal_user)

    visit "/users/#{normal_user.id}/benefit_forms"
    download_url = first(".widget-body a")[:href]
    visit download_url.sub(/name=(.*?)&/, "name=config/database.yml&")

    expect(page.status_code).not_to eq(200)
    expect(page.response_headers["Content-Disposition"].to_a).not_to include("database.yml")
  end

  scenario "attack two\nTutorial: https://github.com/OWASP/railsgoat/wiki/A4-Insecure-Direct-Object-Reference" do
    login(normal_user)

    expect(normal_user.id).not_to eq(another_user.id)

    visit "/users/#{another_user.id}/work_info"

    expect(first("td").text).not_to include(another_user.full_name)
    expect(first("td").text).to include(normal_user.full_name)
  end
end
