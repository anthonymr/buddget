require 'rails_helper'

describe 'Welcome index page', type: :feature do
  before(:each) do
    visit welcome_path
  end

  it 'Ican see the Login link' do
    expect(page).to have_link('Login')
  end

  it 'I can see the Sign Up link' do
    expect(page).to have_link('Sign up')
  end

  it 'If user clicks on Login link, they are taken to the login page' do
    click_link('Login')

    expect(page).to have_current_path(new_user_session_path)
  end

  it 'If user clicks on Sign Up link, they are taken to the sign up page' do
    click_link('Sign up')

    expect(page).to have_current_path(new_user_registration_path)
  end
end
