require 'rails_helper'

describe 'Payment new page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Username',
      email: 'user@gmail.com',
      password: 'password',
      confirmed_at: Time.now
    )

    @groups = []

    3.times { |i| @groups << Group.new(name: "Test Group #{i}", author: @user) }

    @groups.each do |group|
      group.icon.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test.png')),
        filename: 'test.png',
        content_type: 'image/png'
      )

      group.save
    end

    visit user_session_path

    fill_in 'user_email', with: 'user@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    visit new_group_payment_path(@groups[0])
  end

  it 'I can see the Create button' do
    expect(page).to have_button('Create')
  end

  it 'I can create a new payment' do
    fill_in 'payment_name', with: 'Test Payment'
    fill_in 'payment_amount', with: 10
    check find("input[type='checkbox']", match: :first)['id']
    click_button 'Create'

    expect(page).to have_current_path(group_path(@groups[0]))
  end
end
