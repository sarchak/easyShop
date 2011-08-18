require 'spec_helper'

describe User do
  before (:each) do
    @attr = { :name=>"Shrikar Archak", :email=>"shrikar84@yahoo.com", :password=>"foobar",:passwd_confirmation=>"foobar"}
  end
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  it "should require a name" do
    no_name = User.new(@attr.merge(:name=>""))
    no_name.should_not be_valid
  end
  it "should require a email" do
    no_email = User.new(@attr.merge(:email=>""))
    no_email.should_not be_valid
  end
  it "should reject names that are too long" do
    long_name = "s"*51
    long_name_user = User.new(@attr.merge(:name=>long_name_user))
    long_name_user.should_not be_valid
  end
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  it "should reject duplicate email address" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
end
describe "password validations" do
  before (:each) do
    @attr = { :name=>"Shrikar Archak", :email=>"shrikar84@yahoo.com", :encrypted_password=>"foobar",:passwd_confirmation=>"foobar"}
  end
  it "should require a password" do
    not_valid_user = User.new(@attr.merge(:encrypted_password => "", :passwd_confirmation => ""))
    not_valid_user.should_not be_valid
  end
end
# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  email               :string(255)
#  encrypted_password  :string(255)
#  passwd_confirmation :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

