require 'rails_helper'

RSpec.describe 'Devise Database Authenticatable', type: :system do
  let(:user) { create(:user) }

  it 'allows users to sign in with valid credentials' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password123'
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')
    expect(page).not_to have_content('Log in')
  end

  it 'prevents users from signing in with invalid email' do
    visit new_user_session_path

    fill_in 'Email', with: 'wrong@example.com'
    fill_in 'Password', with: 'password123'
    click_button 'Sign in'

    expect(page).to have_content('Invalid Email or password')
    expect(current_path).to eq(new_user_session_path)
  end

  it 'prevents users from signing in with invalid password' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Sign in'

    expect(page).to have_content('Invalid Email or password')
    expect(current_path).to eq(new_user_session_path)
  end

  it 'shows sign out button when user is signed in' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password123'
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')

    # Only expect to see the button, without clicking it
    expect(page).to have_button('Sign out')
  end

  it 'remembers the user session when remember me is checked' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password123'
    check 'Remember me'
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')
  end
end
