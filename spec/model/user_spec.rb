require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    before(:each) do
      @user = User.new(name: 'Test User', email: 'test@test.com', password: 'password')
    end

    it 'is valid with a name, email, and password' do
      expect(@user).to be_valid
    end

    it 'is not valid without a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid with a name longer than 50 characters' do
      @user.name = 'a' * 51
      expect(@user).to_not be_valid
    end
  end
end
