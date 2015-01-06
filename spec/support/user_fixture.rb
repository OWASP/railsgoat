class UserFixture
  def self.reset_all_users
    User.delete_all
    Rails.application.load_seed
  end

  def self.normal_user
    password = 'thi$ 1s cOmplExEr'
    user = User.new(:first_name => 'Joe', :last_name => 'Schmoe',
                    :email => 'joe@schmoe.com', :password => password, :password_confirmation => password)
    def user.clear_password
      'thi$ 1s cOmplExEr'
    end
    user.build_benefits_data
    user.save!
    user
  end
end
