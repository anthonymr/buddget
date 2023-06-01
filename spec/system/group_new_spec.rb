require 'rails_helper'

describe 'Group new page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Username',
      email: 'user@gmail.com',
      password: 'password',
      confirmed_at: Time.now
    )

    visit user_session_path

    fill_in 'user_email', with: 'user@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    visit new_group_path
  end

  it 'I can see the Create button' do
    expect(page).to have_button('Create')
  end

  it 'I can create a new group' do
    fill_in 'group_name', with: 'Test Group'
    attach_file 'group_icon', Rails.root.join('spec', 'fixtures', 'files', 'test.png')
    click_button 'Create'

    expect(page).to have_current_path(groups_path)
  end
end
