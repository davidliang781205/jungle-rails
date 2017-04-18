require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @example_user = User.create({
      first_name: 'Example',
      last_name: 'User',
      email: "user@example.com",
      password: 'ddddd',
      password_confirmation: 'ddddd'
  })
    @example_user.save
  end

  describe 'Validations' do


    it "should fail because email exists" do
      @user = User.create({
        first_name: 'david',
        last_name: 'random',
        email: 'user@example.com',
        password: 'ddddd',
        password_confirmation: 'ddddd'
      })
      expect(@user).to_not be_valid
    end

    it "should fail because email exists with case and space check" do
      @user = User.create({
        first_name: 'david',
        last_name: 'random',
        email: '   usEr@example.Com '
      })
      expect(@user).to_not be_valid
    end

    it "should fail because password confirmation doesnt match" do
      @user = User.create({
        first_name: 'd',
        last_name: 'random',
        email: 'Hello@123.com',
        password: 'ddddd',
        password_confirmation: 'bbbbb'
      })
      expect(@user).to_not be_valid
    end

    it 'should pass because password & confirmation match' do
      @user = User.create({
        first_name: 'd',
        last_name: 'random',
        email: 'Hello@123.com',
        password: 'ddddd',
        password_confirmation: 'ddddd'
      })
      expect(@user).to be_valid
    end

    it 'should fail because password is less than 3 characters' do
      @user = User.create({
        first_name: 'd',
        last_name: 'random',
        email: 'Hello@123.com',
        password: 'd',
        password_confirmation: 'd'
      })
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should fail because the password is incorrect' do
      @user = User.authenticate_with_credentials('user@example.com', '111')
      expect(@user).to be_nil
    end

    it 'should pass' do
      @user = User.authenticate_with_credentials('user@example.com', @example_user.password)
      expect(@user).to be_instance_of User
    end

    it 'should pass with space' do
      @user = User.authenticate_with_credentials('  user@example.com', @example_user.password)
      expect(@user).to be_instance_of User
    end

    it 'should pass with random cap letters' do
      @user = User.authenticate_with_credentials('usEr@eXample.com', @example_user.password)
      expect(@user).to be_instance_of User
    end
  end
end