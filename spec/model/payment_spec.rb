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

      @payment = Payment.new(name: 'Test Payment', amount: 100, author: @user)

      @payment.groups << @group
    end

    it 'is valid with a name, amount, author, and at least one group' do
      expect(@payment).to be_valid
    end

    it 'is not valid without a name' do
      @payment.name = nil
      expect(@payment).to_not be_valid
    end

    it 'is not valid without an amount' do
      @payment.amount = nil
      expect(@payment).to_not be_valid
    end

    it 'is not valid without an author' do
      @payment.author = nil
      expect(@payment).to_not be_valid
    end

    it 'is not valid without at least one group' do
      @payment.groups.clear
      expect(@payment).to_not be_valid
    end
  end
end
