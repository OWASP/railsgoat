# frozen_string_literal: true
class UserFixture
  def self.reset_all_users
    User.delete_all
    Rails.application.load_seed
  end

  def self.normal_user
    password = "thi$ 1s cOmplExEr"
    User.create!(first_name: "Joe", last_name: "Schmoe", email: "joe@schmoe.com",
                 password: password, password_confirmation: password).tap do |user|
      def user.clear_password
        "thi$ 1s cOmplExEr"
      end
    end
  end

  def self.admin_user
    User.where(admin: true).first
  end
end
