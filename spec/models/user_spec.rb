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
    User.new.should be_an_instance_of(User)
  end

  it "should require a email" do
    User.new(:email => "").should_not be_valid
  end

  it "should require valid email" do
    User.new(:email => "@gmail.com").should_not be_valid
  end

  it "should require unique email" do
    user = User.all.first
    User.new(:email => user.email).should_not be_valid
  end

  it "name can be updated" do
    new_name = "Bobby"
    user = User.all.first
    user.first_name = new_name
    user.save!
    User.all.first.first_name.should == new_name
  end
end
