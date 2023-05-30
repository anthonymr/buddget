require 'rails_helper'

describe 'Group index page', type: :feature do
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

    visit groups_path
  end

  it 'I can see the New link' do
    expect(page).to have_link('New')
  end

  it 'I can see all the groups' do
    3.times { |i| expect(page).to have_content("Test Group #{i}") }
  end

  it 'I can see all groups totals' do
    expect(page).to have_content('20.00', count: 3)
  end

  it 'I can see logout link' do
    expect(page).to have_link('logout')
  end

  it 'If user clicks on New link, they are taken to the new group page' do
    click_link('New')

    expect(page).to have_current_path(new_group_path)
  end

  it 'If user clicks on logout link, they are taken to the login page' do
    click_link('logout')

    expect(page).to have_current_path(welcome_path)
  end

  it 'If user clicks on a group, they are taken to the group page' do
    click_link('Test Group 0')

    expect(page).to have_current_path(group_path(@groups[0]))
  end
end
