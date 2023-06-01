require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Payment model' do
    before(:each) do
      @user = User.new(id: 1, name: 'Test User', email: 'test@test.com', password: 'password')
      @group = Group.new(name: 'Test Group', author: @user)
      @group.icon.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test.png')),
        filename: 'test.png',
        content_type: 'image/png'
      )
    end

    it 'is valid with a name and an icon' do
      expect(@group.icon).to be_valid
    end

    it 'is not valid without a name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'is not valid without an icon' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end
  end
end
