require 'spec_helper.rb'

describe User do
  before(:all) do
    UserFixture.reset_all_users
    DatabaseCleaner.strategy = :transaction
  end

  after(:all) do
    DatabaseCleaner.strategy = :truncation
  end

	it "can be instantiated" do
		Benefits.new.should be_an_instance_of(Benefits)
	end


	it "name can be updated" do 
		new_name = "Bobby"
		user = User.all.first
		user.first_name = new_name
		user.save!
		User.all.first.first_name.should == new_name
	end
end