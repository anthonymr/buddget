require 'rails_helper'

describe 'Group show page', type: :feature do
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

    @payment = Payment.new(name: 'test', amount: 10, author: @user)
    @groups.each { |group| @payment.groups << group }
    @payment.save

    @payment = Payment.new(name: 'test', amount: 10, author: @user)
    @groups.each { |group| @payment.groups << group }
    @payment.save

    visit user_session_path

    fill_in 'user_email', with: 'user@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    visit group_path(@groups[0])
  end

  it 'I can see the Add payment link' do
    expect(page).to have_link('Add payment')
  end

  it 'Ican see the total amount of the group' do
    expect(page).to have_content('20.00')
  end

  it 'If user click on Add payment link, they are taken to the new payment page' do
    click_link('Add payment')

    expect(page).to have_current_path(new_group_payment_path(@groups[0]))
  end
end
